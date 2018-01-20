/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesBeton;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesSpecialreq;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesWatermeth;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.contract.entity.ContractSales;
import com.thinkgem.jeesite.modules.contract.service.ContractSalesService;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 销售合同Controller
 * @author spark
 * @version 2017-12-30
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractSales")
@Slf4j
public class ContractSalesController extends BaseController {

	@Autowired
	private ContractSalesService contractSalesService;
	
	@ModelAttribute
	public ContractSales get(@RequestParam(required=false) String id) {
		ContractSales entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractSalesService.get(id);
		}
		if (entity == null){
			entity = new ContractSales();
		}
		return entity;
	}
	
	@RequiresPermissions("contract:contractSales:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractSales contractSales, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractSales> page = contractSalesService.findPage(new Page<ContractSales>(request, response), contractSales);
		model.addAttribute("page", page);
		return "modules/contract/contractSalesList";
	}

	@RequestMapping(value = {"listJson"})
	@ResponseBody
	public List<ContractSales> listJson(String contractId, HttpServletRequest request, HttpServletResponse response) {
		ContractSales contractSales = new ContractSales();
		List<ContractSales> list = Arrays.asList();
		if(StringUtils.isNotEmpty(contractId)) {
			contractSales.setContractId(contractId);
			Page<ContractSales> page = contractSalesService.findPage(new Page<ContractSales>(request, response), contractSales);
			list = page.getList();
		}
		return list;
	}

	@RequiresPermissions("contract:contractSales:view")
	@RequestMapping(value = "form")
	public String form(ContractSales contractSales, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("contractSales", contractSales);
		return "modules/contract/contractSalesForm";
	}

	@RequiresPermissions("contract:contractSales:edit")
	@RequestMapping(value = "save")
	public String save(ContractSales contractSales, Model model, RedirectAttributes redirectAttributes, @RequestParam(value = "tableDatas",required = false) String tableDatas,
					   @RequestParam(value = "tableDatas2",required = false) String tableDatas2,
					   @RequestParam(value = "tableDatas3",required = false) String tableDatas3) {
		try {
			if (!beanValidator(model, contractSales)){
				return form(contractSales, model);
			}
			List<ContractSalesBeton> detailList = new ArrayList<ContractSalesBeton>();
			if (StringUtils.isNotEmpty(tableDatas)) {
				JSONArray detailArray = JSONArray.fromObject(StringEscapeUtils.unescapeHtml4(tableDatas));
				log.info("合同明细{}", detailArray);
				for (Object object : detailArray.toArray()) {
					ContractSalesBeton detail = buildVO((JSONObject) object, ContractSalesBeton.class);
					detail.setContractId(contractSales.getContractId());
					detailList.add(detail);
				}
			}

			List<ContractSalesWatermeth> detailList2 = new ArrayList<ContractSalesWatermeth>();
			if (StringUtils.isNotEmpty(tableDatas2)) {
				JSONArray detailArray2 = JSONArray.fromObject(StringEscapeUtils.unescapeHtml4(tableDatas2));
				log.info("合同明细{}", detailArray2);
				for (Object object : detailArray2.toArray()) {
					ContractSalesWatermeth detail2 = buildVO2((JSONObject) object, ContractSalesWatermeth.class);
					detail2.setContractId(contractSales.getContractId());
					detailList2.add(detail2);
				}
			}
			List<ContractSalesSpecialreq> detailList3 = new ArrayList<ContractSalesSpecialreq>();
			if (StringUtils.isNotEmpty(tableDatas3)) {
				JSONArray detailArray3 = JSONArray.fromObject(StringEscapeUtils.unescapeHtml4(tableDatas3));
				log.info("合同明细{}", detailArray3);
				for (Object object : detailArray3.toArray()) {
					ContractSalesSpecialreq detail3 = buildVO3((JSONObject) object, ContractSalesSpecialreq.class);
					detail3.setContractId(contractSales.getContractId());
					detailList3.add(detail3);
				}
			}
			contractSalesService.saveAll(contractSales,detailList,detailList2,detailList3);
			addMessage(redirectAttributes, "保存销售合同成功");
		}catch (Exception e){
			e.printStackTrace();
			return "error";
		}
		return "redirect:"+Global.getAdminPath()+"/contract/contractSales/?repage";
	}

	private ContractSalesBeton buildVO(JSONObject object, Class<ContractSalesBeton> contractSalesBetonClass) throws IllegalAccessException {
		ContractSalesBeton detail = new ContractSalesBeton();
		Field[] fields = contractSalesBetonClass.getDeclaredFields();
		for(Field field : fields){
			String fieldName = field.getName();
			if(null != object.get(fieldName)){
				field.setAccessible(true);
				field.set(detail,object.get(fieldName));
			}
		}
		return detail;
	}
	private ContractSalesWatermeth buildVO2(JSONObject object, Class<ContractSalesWatermeth> contractSalesWatermethClass) throws IllegalAccessException {
		ContractSalesWatermeth detail = new ContractSalesWatermeth();
		Field[] fields = contractSalesWatermethClass.getDeclaredFields();
		for(Field field : fields){
			String fieldName = field.getName();
			if(null != object.get(fieldName)){
				field.setAccessible(true);
				field.set(detail,object.get(fieldName));
			}
		}
		return detail;
	}
	private ContractSalesSpecialreq buildVO3(JSONObject object, Class<ContractSalesSpecialreq> contractSalesSpecialreqClass) throws IllegalAccessException {
		ContractSalesSpecialreq detail = new ContractSalesSpecialreq();
		Field[] fields = contractSalesSpecialreqClass.getDeclaredFields();
		for(Field field : fields){
			String fieldName = field.getName();
			if(null != object.get(fieldName)){
				field.setAccessible(true);
				field.set(detail,object.get(fieldName));
			}
		}
		return detail;
	}

	@RequiresPermissions("contract:contractSales:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractSales contractSales, RedirectAttributes redirectAttributes) {
		contractSalesService.delete(contractSales);
		addMessage(redirectAttributes, "删除销售合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSales/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "treeDataCusProject")
	public List<Map<String, Object>> treeDataCusProject(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ContractSales contractSales = new ContractSales();
		List<ContractSales> list = contractSalesService.findCusProject(contractSales);
		for (int i=0; i<list.size(); i++){
			ContractSales e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getProjectName()+"["+e.getExtField1()+"]");

			mapList.add(map);
		}
		return mapList;
	}
}
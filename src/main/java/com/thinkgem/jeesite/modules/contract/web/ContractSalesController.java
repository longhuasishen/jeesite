/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.doc.entity.DocConcretetyp;
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

import java.util.List;
import java.util.Map;

/**
 * 销售合同Controller
 * @author spark
 * @version 2017-12-30
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractSales")
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

	@RequiresPermissions("contract:contractSales:view")
	@RequestMapping(value = "form")
	public String form(ContractSales contractSales, Model model) {
		model.addAttribute("contractSales", contractSales);
		return "modules/contract/contractSalesForm";
	}

	@RequiresPermissions("contract:contractSales:edit")
	@RequestMapping(value = "save")
	public String save(ContractSales contractSales, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractSales)){
			return form(contractSales, model);
		}
		contractSalesService.save(contractSales);
		addMessage(redirectAttributes, "保存销售合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSales/?repage";
	}
	
	@RequiresPermissions("contract:contractSales:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractSales contractSales, RedirectAttributes redirectAttributes) {
		contractSalesService.delete(contractSales);
		addMessage(redirectAttributes, "删除销售合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSales/?repage";
	}

//	@RequiresPermissions("user")
//	@ResponseBody
//	@RequestMapping(value = "treeData")
//	public List<Map<String, Object>> treeData(@RequestParam(required=false) String materialCode, HttpServletResponse response) {
//		List<Map<String, Object>> mapList = Lists.newArrayList();
//		ContractSales am = new ContractSales();
//		List<ContractSales> list  = contractSalesService.findList(am);
//
//		for (int i=0; i<list.size(); i++){
//			ContractSales e = list.get(i);
//			Map<String, Object> map = Maps.newHashMap();
//			map.put("id", e.getId());
//			map.put("name", e.getCu);
//			map.put("code", e.getCuspCode());
//
//			mapList.add(map);
//		}
//		return mapList;
//	}
}
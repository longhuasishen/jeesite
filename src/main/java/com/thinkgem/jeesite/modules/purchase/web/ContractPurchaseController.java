/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveContract;
import com.thinkgem.jeesite.modules.doc.entity.DocAccmeth;
import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseDetailService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchase;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseService;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 采购合同Controller
 * @author lisy
 * @version 2017-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchase")
@Slf4j
public class ContractPurchaseController extends BaseController {

	@Autowired
	private ContractPurchaseService contractPurchaseService;
	@Autowired
	private ContractPurchaseDetailService contractPurchaseDetailService;

	@ModelAttribute
	public ContractPurchase get(@RequestParam(required=false) String id) {
		ContractPurchase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchase();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchase:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchase contractPurchase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchase> page = contractPurchaseService.findPage(new Page<ContractPurchase>(request, response), contractPurchase); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseList";
	}

	@RequiresPermissions("purchase:contractPurchase:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchase contractPurchase, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("contractPurchase", contractPurchase);
		if(StringUtils.isNotBlank(contractPurchase.getId())){
			ContractPurchaseDetail detail = new ContractPurchaseDetail();
			detail.setContractCode(contractPurchase.getContractCode());
			List<ContractPurchaseDetail> detailList = contractPurchaseDetailService.findList(detail);
			model.addAttribute("detailList",detailList);
		}
		return "modules/purchase/contractPurchaseForm";
	}

	@RequiresPermissions("purchase:contractPurchase:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchase contractPurchase, Model model, RedirectAttributes redirectAttributes, @RequestParam(value = "tableDatas",required = false) String tableDatas) {
		try {
			if (!beanValidator(model, contractPurchase)) {
				return form(contractPurchase, model);
			}
			if (StringUtils.isEmpty(contractPurchase.getContractCreateDate())) {
				contractPurchase.setContractCreateDate(DateUtils.formatDateTime(new Date()));
			}

			List<ContractPurchaseDetail> detailList = new ArrayList<ContractPurchaseDetail>();
			if (StringUtils.isNotEmpty(tableDatas)) {
				JSONArray detailArray = JSONArray.fromObject(StringEscapeUtils.unescapeHtml4(tableDatas));
				log.info("合同明细{}", detailArray);
				for (Object object : detailArray.toArray()) {
					ContractPurchaseDetail detail = buildVO((JSONObject) object, ContractPurchaseDetail.class);
					detail.setContractCode(contractPurchase.getContractCode());
					detailList.add(detail);
				}
//				contractPurchaseDetailService.saveList(detailList);
			}
			contractPurchaseService.saveAll(contractPurchase,detailList);
			addMessage(redirectAttributes, "保存采购合同成功");
		}catch (Exception e){
			e.printStackTrace();
			return "error";
		}
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchase/?repage";
	}

	private ContractPurchaseDetail buildVO(JSONObject object, Class<ContractPurchaseDetail> contractPurchaseDetailClass) throws IllegalAccessException {
		ContractPurchaseDetail detail = new ContractPurchaseDetail();
		Field[] fields = contractPurchaseDetailClass.getDeclaredFields();
		for(Field field : fields){
			String fieldName = field.getName();
			if(null != object.get(fieldName)){
				field.setAccessible(true);
				field.set(detail,object.get(fieldName));
			}
		}
		return detail;
	}

	@RequiresPermissions("purchase:contractPurchase:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchase contractPurchase, RedirectAttributes redirectAttributes) {
		contractPurchaseService.delete(contractPurchase);
		addMessage(redirectAttributes, "删除采购合同成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchase/?repage";
	}

}
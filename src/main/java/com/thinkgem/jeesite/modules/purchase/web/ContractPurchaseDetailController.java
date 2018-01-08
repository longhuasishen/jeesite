/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseDetailService;

import java.util.Arrays;
import java.util.List;

/**
 * 采购合同明细Controller
 * @author lisy
 * @version 2017-12-31
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchaseDetail")
public class ContractPurchaseDetailController extends BaseController {

	@Autowired
	private ContractPurchaseDetailService contractPurchaseDetailService;
	
	@ModelAttribute
	public ContractPurchaseDetail get(@RequestParam(required=false) String id) {
		ContractPurchaseDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseDetailService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchaseDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchaseDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchaseDetail contractPurchaseDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchaseDetail> page = contractPurchaseDetailService.findPage(new Page<ContractPurchaseDetail>(request, response), contractPurchaseDetail); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseDetailList";
	}

//	@RequiresPermissions("purchase:contractPurchaseDetail:view")
	@RequestMapping(value = {"listJson", ""})
	@ResponseBody
	public List<ContractPurchaseDetail> listJson(String contractCode, HttpServletRequest request, HttpServletResponse response) {
		ContractPurchaseDetail contractPurchaseDetail = new ContractPurchaseDetail();
		List<ContractPurchaseDetail> list = Arrays.asList();
		if(StringUtils.isNotEmpty(contractCode)) {
			contractPurchaseDetail.setContractCode(contractCode);
			Page<ContractPurchaseDetail> page = contractPurchaseDetailService.findPage(new Page<ContractPurchaseDetail>(request, response), contractPurchaseDetail);
			list = page.getList();
		}
		return list;
	}

	@RequiresPermissions("purchase:contractPurchaseDetail:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchaseDetail contractPurchaseDetail, Model model) {
		model.addAttribute("contractPurchaseDetail", contractPurchaseDetail);
		return "modules/purchase/contractPurchaseDetailForm";
	}

	@RequiresPermissions("purchase:contractPurchaseDetail:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchaseDetail contractPurchaseDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractPurchaseDetail)){
			return form(contractPurchaseDetail, model);
		}
		contractPurchaseDetailService.save(contractPurchaseDetail);
		addMessage(redirectAttributes, "保存采购合同明细成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseDetail/?repage";
	}
	
	@RequiresPermissions("purchase:contractPurchaseDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchaseDetail contractPurchaseDetail, RedirectAttributes redirectAttributes) {
		contractPurchaseDetailService.delete(contractPurchaseDetail);
		addMessage(redirectAttributes, "删除采购合同明细成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseDetail/?repage";
	}

}
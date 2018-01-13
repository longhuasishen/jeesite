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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplement;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseSupplementService;

/**
 * 采购合同补充协议Controller
 * @author lisy
 * @version 2018-01-13
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchaseSupplement")
public class ContractPurchaseSupplementController extends BaseController {

	@Autowired
	private ContractPurchaseSupplementService contractPurchaseSupplementService;
	
	@ModelAttribute
	public ContractPurchaseSupplement get(@RequestParam(required=false) String id) {
		ContractPurchaseSupplement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseSupplementService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchaseSupplement();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchaseSupplement:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchaseSupplement contractPurchaseSupplement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchaseSupplement> page = contractPurchaseSupplementService.findPage(new Page<ContractPurchaseSupplement>(request, response), contractPurchaseSupplement); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseSupplementList";
	}

	@RequiresPermissions("purchase:contractPurchaseSupplement:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchaseSupplement contractPurchaseSupplement, Model model) {
		model.addAttribute("contractPurchaseSupplement", contractPurchaseSupplement);
		return "modules/purchase/contractPurchaseSupplementForm";
	}

	@RequiresPermissions("purchase:contractPurchaseSupplement:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchaseSupplement contractPurchaseSupplement, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractPurchaseSupplement)){
			return form(contractPurchaseSupplement, model);
		}
		contractPurchaseSupplementService.save(contractPurchaseSupplement);
		addMessage(redirectAttributes, "保存采购合同补充协议表成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseSupplement/?repage";
	}
	
	@RequiresPermissions("purchase:contractPurchaseSupplement:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchaseSupplement contractPurchaseSupplement, RedirectAttributes redirectAttributes) {
		contractPurchaseSupplementService.delete(contractPurchaseSupplement);
		addMessage(redirectAttributes, "删除采购合同补充协议表成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseSupplement/?repage";
	}

}
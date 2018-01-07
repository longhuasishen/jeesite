/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.web;

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
import com.thinkgem.jeesite.modules.bill.entity.ContractReceivable;
import com.thinkgem.jeesite.modules.bill.service.ContractReceivableService;

/**
 * 合同应收Controller
 * @author spark
 * @version 2018-01-07
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/contractReceivable")
public class ContractReceivableController extends BaseController {

	@Autowired
	private ContractReceivableService contractReceivableService;
	
	@ModelAttribute
	public ContractReceivable get(@RequestParam(required=false) String id) {
		ContractReceivable entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractReceivableService.get(id);
		}
		if (entity == null){
			entity = new ContractReceivable();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:contractReceivable:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractReceivable contractReceivable, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractReceivable> page = contractReceivableService.findPage(new Page<ContractReceivable>(request, response), contractReceivable); 
		model.addAttribute("page", page);
		return "modules/bill/contractReceivableList";
	}

	@RequiresPermissions("bill:contractReceivable:view")
	@RequestMapping(value = "form")
	public String form(ContractReceivable contractReceivable, Model model) {
		model.addAttribute("contractReceivable", contractReceivable);
		return "modules/bill/contractReceivableForm";
	}

	@RequiresPermissions("bill:contractReceivable:edit")
	@RequestMapping(value = "save")
	public String save(ContractReceivable contractReceivable, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractReceivable)){
			return form(contractReceivable, model);
		}
		contractReceivableService.save(contractReceivable);
		addMessage(redirectAttributes, "保存合同应收成功");
		return "redirect:"+Global.getAdminPath()+"/bill/contractReceivable/?repage";
	}
	
	@RequiresPermissions("bill:contractReceivable:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractReceivable contractReceivable, RedirectAttributes redirectAttributes) {
		contractReceivableService.delete(contractReceivable);
		addMessage(redirectAttributes, "删除合同应收成功");
		return "redirect:"+Global.getAdminPath()+"/bill/contractReceivable/?repage";
	}

}
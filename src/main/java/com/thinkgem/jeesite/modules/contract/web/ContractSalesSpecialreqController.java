/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.web;

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
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesSpecialreq;
import com.thinkgem.jeesite.modules.contract.service.ContractSalesSpecialreqService;

import java.util.Arrays;
import java.util.List;

/**
 * 销售合同特殊方法单价Controller
 * @author spark
 * @version 2018-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractSalesSpecialreq")
public class ContractSalesSpecialreqController extends BaseController {

	@Autowired
	private ContractSalesSpecialreqService contractSalesSpecialreqService;
	
	@ModelAttribute
	public ContractSalesSpecialreq get(@RequestParam(required=false) String id) {
		ContractSalesSpecialreq entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractSalesSpecialreqService.get(id);
		}
		if (entity == null){
			entity = new ContractSalesSpecialreq();
		}
		return entity;
	}
	
	@RequiresPermissions("contract:contractSalesSpecialreq:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractSalesSpecialreq contractSalesSpecialreq, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractSalesSpecialreq> page = contractSalesSpecialreqService.findPage(new Page<ContractSalesSpecialreq>(request, response), contractSalesSpecialreq); 
		model.addAttribute("page", page);
		return "modules/contract/contractSalesSpecialreqList";
	}

	@RequestMapping(value = {"listJson"})
	@ResponseBody
	public List<ContractSalesSpecialreq> listJson(String contractId, HttpServletRequest request, HttpServletResponse response) {
		ContractSalesSpecialreq contractSalesSpecialreq = new ContractSalesSpecialreq();
		List<ContractSalesSpecialreq> list = Arrays.asList();
		if(StringUtils.isNotEmpty(contractId)) {
			contractSalesSpecialreq.setContractId(contractId);
			Page<ContractSalesSpecialreq> page = contractSalesSpecialreqService.findPage(new Page<ContractSalesSpecialreq>(request, response), contractSalesSpecialreq);
			list = page.getList();
		}
		return list;
	}
	@RequiresPermissions("contract:contractSalesSpecialreq:view")
	@RequestMapping(value = "form")
	public String form(ContractSalesSpecialreq contractSalesSpecialreq, Model model) {
		model.addAttribute("contractSalesSpecialreq", contractSalesSpecialreq);
		return "modules/contract/contractSalesSpecialreqForm";
	}

	@RequiresPermissions("contract:contractSalesSpecialreq:edit")
	@RequestMapping(value = "save")
	public String save(ContractSalesSpecialreq contractSalesSpecialreq, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractSalesSpecialreq)){
			return form(contractSalesSpecialreq, model);
		}
		contractSalesSpecialreqService.save(contractSalesSpecialreq);
		addMessage(redirectAttributes, "保存销售合同特殊方法单价成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSalesSpecialreq/?repage";
	}
	
	@RequiresPermissions("contract:contractSalesSpecialreq:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractSalesSpecialreq contractSalesSpecialreq, RedirectAttributes redirectAttributes) {
		contractSalesSpecialreqService.delete(contractSalesSpecialreq);
		addMessage(redirectAttributes, "删除销售合同特殊方法单价成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSalesSpecialreq/?repage";
	}

}
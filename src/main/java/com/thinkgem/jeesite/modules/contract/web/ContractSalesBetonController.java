/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.contract.entity.ContractSales;
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
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesBeton;
import com.thinkgem.jeesite.modules.contract.service.ContractSalesBetonService;

import java.util.Arrays;
import java.util.List;

/**
 * 销售合同混凝土单价Controller
 * @author spark
 * @version 2018-01-15
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractSalesBeton")
public class ContractSalesBetonController extends BaseController {

	@Autowired
	private ContractSalesBetonService contractSalesBetonService;
	
	@ModelAttribute
	public ContractSalesBeton get(@RequestParam(required=false) String id) {
		ContractSalesBeton entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractSalesBetonService.get(id);
		}
		if (entity == null){
			entity = new ContractSalesBeton();
		}
		return entity;
	}
	
	@RequiresPermissions("contract:contractSalesBeton:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractSalesBeton contractSalesBeton, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractSalesBeton> page = contractSalesBetonService.findPage(new Page<ContractSalesBeton>(request, response), contractSalesBeton); 
		model.addAttribute("page", page);
		return "modules/contract/contractSalesBetonList";
	}

	@RequestMapping(value = {"listJson"})
	@ResponseBody
	public List<ContractSalesBeton> listJson(String contractId, HttpServletRequest request, HttpServletResponse response) {
		ContractSalesBeton contractSalesBeton = new ContractSalesBeton();
		List<ContractSalesBeton> list = Arrays.asList();
		if(StringUtils.isNotEmpty(contractId)) {
			contractSalesBeton.setContractId(contractId);
			Page<ContractSalesBeton> page = contractSalesBetonService.findPage(new Page<ContractSalesBeton>(request, response), contractSalesBeton);
			list = page.getList();
		}
		return list;
	}
	@RequiresPermissions("contract:contractSalesBeton:view")
	@RequestMapping(value = "form")
	public String form(ContractSalesBeton contractSalesBeton, Model model) {
		model.addAttribute("contractSalesBeton", contractSalesBeton);
		return "modules/contract/contractSalesBetonForm";
	}

	@RequiresPermissions("contract:contractSalesBeton:edit")
	@RequestMapping(value = "save")
	public String save(ContractSalesBeton contractSalesBeton, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractSalesBeton)){
			return form(contractSalesBeton, model);
		}
		contractSalesBetonService.save(contractSalesBeton);
		addMessage(redirectAttributes, "保存销售合同混凝土单价成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSalesBeton/?repage";
	}
	
	@RequiresPermissions("contract:contractSalesBeton:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractSalesBeton contractSalesBeton, RedirectAttributes redirectAttributes) {
		contractSalesBetonService.delete(contractSalesBeton);
		addMessage(redirectAttributes, "删除销售合同混凝土单价成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSalesBeton/?repage";
	}

}
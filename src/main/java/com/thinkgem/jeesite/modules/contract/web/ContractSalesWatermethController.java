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
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesWatermeth;
import com.thinkgem.jeesite.modules.contract.service.ContractSalesWatermethService;

import java.util.Arrays;
import java.util.List;

/**
 * 销售合同浇灌方法单价Controller
 * @author spark
 * @version 2018-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractSalesWatermeth")
public class ContractSalesWatermethController extends BaseController {

	@Autowired
	private ContractSalesWatermethService contractSalesWatermethService;
	
	@ModelAttribute
	public ContractSalesWatermeth get(@RequestParam(required=false) String id) {
		ContractSalesWatermeth entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractSalesWatermethService.get(id);
		}
		if (entity == null){
			entity = new ContractSalesWatermeth();
		}
		return entity;
	}
	
	@RequiresPermissions("contract:contractSalesWatermeth:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractSalesWatermeth contractSalesWatermeth, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractSalesWatermeth> page = contractSalesWatermethService.findPage(new Page<ContractSalesWatermeth>(request, response), contractSalesWatermeth); 
		model.addAttribute("page", page);
		return "modules/contract/contractSalesWatermethList";
	}

	@RequestMapping(value = {"listJson"})
	@ResponseBody
	public List<ContractSalesWatermeth> listJson(String contractId, HttpServletRequest request, HttpServletResponse response) {
		ContractSalesWatermeth contractSalesWatermeth = new ContractSalesWatermeth();
		List<ContractSalesWatermeth> list = Arrays.asList();
		if(StringUtils.isNotEmpty(contractId)) {
			contractSalesWatermeth.setContractId(contractId);
			Page<ContractSalesWatermeth> page = contractSalesWatermethService.findPage(new Page<ContractSalesWatermeth>(request, response), contractSalesWatermeth);
			list = page.getList();
		}
		return list;
	}

	@RequiresPermissions("contract:contractSalesWatermeth:view")
	@RequestMapping(value = "form")
	public String form(ContractSalesWatermeth contractSalesWatermeth, Model model) {
		model.addAttribute("contractSalesWatermeth", contractSalesWatermeth);
		return "modules/contract/contractSalesWatermethForm";
	}

	@RequiresPermissions("contract:contractSalesWatermeth:edit")
	@RequestMapping(value = "save")
	public String save(ContractSalesWatermeth contractSalesWatermeth, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractSalesWatermeth)){
			return form(contractSalesWatermeth, model);
		}
		contractSalesWatermethService.save(contractSalesWatermeth);
		addMessage(redirectAttributes, "保存销售合同浇灌方法单价成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSalesWatermeth/?repage";
	}
	
	@RequiresPermissions("contract:contractSalesWatermeth:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractSalesWatermeth contractSalesWatermeth, RedirectAttributes redirectAttributes) {
		contractSalesWatermethService.delete(contractSalesWatermeth);
		addMessage(redirectAttributes, "删除销售合同浇灌方法单价成功");
		return "redirect:"+Global.getAdminPath()+"/contract/contractSalesWatermeth/?repage";
	}

}
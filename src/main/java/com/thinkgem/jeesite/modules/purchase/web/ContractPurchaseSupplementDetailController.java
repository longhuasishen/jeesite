/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
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
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplementDetail;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseSupplementDetailService;

import java.util.Arrays;
import java.util.List;

/**
 * 采购合同补充协议明细Controller
 * @author lisy
 * @version 2018-01-13
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchaseSupplementDetail")
public class ContractPurchaseSupplementDetailController extends BaseController {

	@Autowired
	private ContractPurchaseSupplementDetailService contractPurchaseSupplementDetailService;
	
	@ModelAttribute
	public ContractPurchaseSupplementDetail get(@RequestParam(required=false) String id) {
		ContractPurchaseSupplementDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseSupplementDetailService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchaseSupplementDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchaseSupplementDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchaseSupplementDetail contractPurchaseSupplementDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchaseSupplementDetail> page = contractPurchaseSupplementDetailService.findPage(new Page<ContractPurchaseSupplementDetail>(request, response), contractPurchaseSupplementDetail); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseSupplementDetailList";
	}
	@RequestMapping(value = {"listJson"})
	@ResponseBody
	public List<ContractPurchaseSupplementDetail> listJson(String contractCode, HttpServletRequest request, HttpServletResponse response) {
		ContractPurchaseSupplementDetail contractPurchaseDetail = new ContractPurchaseSupplementDetail();
		List<ContractPurchaseSupplementDetail> list = Arrays.asList();
		if(StringUtils.isNotEmpty(contractCode)) {
			contractPurchaseDetail.setContractCode(contractCode);
			Page<ContractPurchaseSupplementDetail> page = contractPurchaseSupplementDetailService.findPage(new Page<ContractPurchaseSupplementDetail>(request, response), contractPurchaseDetail);
			list = page.getList();
		}
		return list;
	}

	@RequiresPermissions("purchase:contractPurchaseSupplementDetail:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchaseSupplementDetail contractPurchaseSupplementDetail, Model model) {
		model.addAttribute("contractPurchaseSupplementDetail", contractPurchaseSupplementDetail);
		return "modules/purchase/contractPurchaseSupplementDetailForm";
	}

	@RequiresPermissions("purchase:contractPurchaseSupplementDetail:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchaseSupplementDetail contractPurchaseSupplementDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractPurchaseSupplementDetail)){
			return form(contractPurchaseSupplementDetail, model);
		}
		contractPurchaseSupplementDetailService.save(contractPurchaseSupplementDetail);
		addMessage(redirectAttributes, "保存采购合同补充协议明细成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseSupplementDetail/?repage";
	}
	
	@RequiresPermissions("purchase:contractPurchaseSupplementDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchaseSupplementDetail contractPurchaseSupplementDetail, RedirectAttributes redirectAttributes) {
		contractPurchaseSupplementDetailService.delete(contractPurchaseSupplementDetail);
		addMessage(redirectAttributes, "删除采购合同补充协议明细成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseSupplementDetail/?repage";
	}

}
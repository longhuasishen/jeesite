/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplementDetail;
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
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageDetail;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseStorageDetailService;

import java.util.Arrays;
import java.util.List;

/**
 * 采购入库明细Controller
 * @author lisy
 * @version 2018-01-14
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchaseStorageDetail")
public class ContractPurchaseStorageDetailController extends BaseController {

	@Autowired
	private ContractPurchaseStorageDetailService contractPurchaseStorageDetailService;
	
	@ModelAttribute
	public ContractPurchaseStorageDetail get(@RequestParam(required=false) String id) {
		ContractPurchaseStorageDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseStorageDetailService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchaseStorageDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchaseStorageDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchaseStorageDetail contractPurchaseStorageDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchaseStorageDetail> page = contractPurchaseStorageDetailService.findPage(new Page<ContractPurchaseStorageDetail>(request, response), contractPurchaseStorageDetail); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseStorageDetailList";
	}
	@RequestMapping(value = {"listJson"})
	@ResponseBody
	public List<ContractPurchaseStorageDetail> listJson(String storageCode, HttpServletRequest request, HttpServletResponse response) {
		ContractPurchaseStorageDetail contractPurchaseDetail = new ContractPurchaseStorageDetail();
		List<ContractPurchaseStorageDetail> list = Arrays.asList();
		if(StringUtils.isNotEmpty(storageCode)) {
			contractPurchaseDetail.setStorageCode(storageCode);
			Page<ContractPurchaseStorageDetail> page = contractPurchaseStorageDetailService.findPage(new Page<ContractPurchaseStorageDetail>(request, response), contractPurchaseDetail);
			list = page.getList();
		}
		return list;
	}

	@RequiresPermissions("purchase:contractPurchaseStorageDetail:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchaseStorageDetail contractPurchaseStorageDetail, Model model) {
		model.addAttribute("contractPurchaseStorageDetail", contractPurchaseStorageDetail);
		return "modules/purchase/contractPurchaseStorageDetailForm";
	}

	@RequiresPermissions("purchase:contractPurchaseStorageDetail:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchaseStorageDetail contractPurchaseStorageDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractPurchaseStorageDetail)){
			return form(contractPurchaseStorageDetail, model);
		}
		contractPurchaseStorageDetailService.save(contractPurchaseStorageDetail);
		addMessage(redirectAttributes, "保存采购入库明细成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseStorageDetail/?repage";
	}
	
	@RequiresPermissions("purchase:contractPurchaseStorageDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchaseStorageDetail contractPurchaseStorageDetail, RedirectAttributes redirectAttributes) {
		contractPurchaseStorageDetailService.delete(contractPurchaseStorageDetail);
		addMessage(redirectAttributes, "删除采购入库明细成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseStorageDetail/?repage";
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
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
import com.thinkgem.jeesite.modules.bill.entity.FinpayBill;
import com.thinkgem.jeesite.modules.bill.service.FinpayBillService;

/**
 * 财务应付调账单Controller
 * @author spark
 * @version 2018-01-05
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/finpayBill")
public class FinpayBillController extends BaseController {

	@Autowired
	private FinpayBillService finpayBillService;
	
	@ModelAttribute
	public FinpayBill get(@RequestParam(required=false) String id) {
		FinpayBill entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = finpayBillService.get(id);
		}
		if (entity == null){
			entity = new FinpayBill();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:finpayBill:view")
	@RequestMapping(value = {"list", ""})
	public String list(FinpayBill finpayBill, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FinpayBill> page = finpayBillService.findPage(new Page<FinpayBill>(request, response), finpayBill); 
		model.addAttribute("page", page);
		return "modules/bill/finpayBillList";
	}

	@RequiresPermissions("bill:finpayBill:view")
	@RequestMapping(value = "form")
	public String form(FinpayBill finpayBill, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("finpayBill", finpayBill);
		return "modules/bill/finpayBillForm";
	}

	@RequiresPermissions("bill:finpayBill:edit")
	@RequestMapping(value = "save")
	public String save(FinpayBill finpayBill, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, finpayBill)){
			return form(finpayBill, model);
		}
		finpayBillService.save(finpayBill);
		addMessage(redirectAttributes, "保存财务应付调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/finpayBill/?repage";
	}
	
	@RequiresPermissions("bill:finpayBill:edit")
	@RequestMapping(value = "delete")
	public String delete(FinpayBill finpayBill, RedirectAttributes redirectAttributes) {
		finpayBillService.delete(finpayBill);
		addMessage(redirectAttributes, "删除财务应付调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/finpayBill/?repage";
	}

}
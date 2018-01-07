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
import com.thinkgem.jeesite.modules.bill.entity.SalesInvoice;
import com.thinkgem.jeesite.modules.bill.service.SalesInvoiceService;

/**
 * 销售发票Controller
 * @author spark
 * @version 2018-01-07
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/salesInvoice")
public class SalesInvoiceController extends BaseController {

	@Autowired
	private SalesInvoiceService salesInvoiceService;
	
	@ModelAttribute
	public SalesInvoice get(@RequestParam(required=false) String id) {
		SalesInvoice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesInvoiceService.get(id);
		}
		if (entity == null){
			entity = new SalesInvoice();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:salesInvoice:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesInvoice salesInvoice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesInvoice> page = salesInvoiceService.findPage(new Page<SalesInvoice>(request, response), salesInvoice); 
		model.addAttribute("page", page);
		return "modules/bill/salesInvoiceList";
	}

	@RequiresPermissions("bill:salesInvoice:view")
	@RequestMapping(value = "form")
	public String form(SalesInvoice salesInvoice, Model model) {
		model.addAttribute("salesInvoice", salesInvoice);
		return "modules/bill/salesInvoiceForm";
	}

	@RequiresPermissions("bill:salesInvoice:edit")
	@RequestMapping(value = "save")
	public String save(SalesInvoice salesInvoice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesInvoice)){
			return form(salesInvoice, model);
		}
		salesInvoiceService.save(salesInvoice);
		addMessage(redirectAttributes, "保存销售发票成功");
		return "redirect:"+Global.getAdminPath()+"/bill/salesInvoice/?repage";
	}
	
	@RequiresPermissions("bill:salesInvoice:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesInvoice salesInvoice, RedirectAttributes redirectAttributes) {
		salesInvoiceService.delete(salesInvoice);
		addMessage(redirectAttributes, "删除销售发票成功");
		return "redirect:"+Global.getAdminPath()+"/bill/salesInvoice/?repage";
	}

}
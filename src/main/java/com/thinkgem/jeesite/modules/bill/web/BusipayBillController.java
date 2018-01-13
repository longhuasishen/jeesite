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
import com.thinkgem.jeesite.modules.bill.entity.BusipayBill;
import com.thinkgem.jeesite.modules.bill.service.BusipayBillService;

/**
 * 业务应付调账单Controller
 * @author spark
 * @version 2018-01-05
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/busipayBill")
public class BusipayBillController extends BaseController {

	@Autowired
	private BusipayBillService busipayBillService;
	
	@ModelAttribute
	public BusipayBill get(@RequestParam(required=false) String id) {
		BusipayBill entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = busipayBillService.get(id);
		}
		if (entity == null){
			entity = new BusipayBill();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:busipayBill:view")
	@RequestMapping(value = {"list", ""})
	public String list(BusipayBill busipayBill, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BusipayBill> page = busipayBillService.findPage(new Page<BusipayBill>(request, response), busipayBill); 
		model.addAttribute("page", page);
		return "modules/bill/busipayBillList";
	}

	@RequiresPermissions("bill:busipayBill:view")
	@RequestMapping(value = "form")
	public String form(BusipayBill busipayBill, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("busipayBill", busipayBill);
		return "modules/bill/busipayBillForm";
	}

	@RequiresPermissions("bill:busipayBill:edit")
	@RequestMapping(value = "save")
	public String save(BusipayBill busipayBill, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, busipayBill)){
			return form(busipayBill, model);
		}
		busipayBillService.save(busipayBill);
		addMessage(redirectAttributes, "保存业务应付调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/busipayBill/?repage";
	}
	
	@RequiresPermissions("bill:busipayBill:edit")
	@RequestMapping(value = "delete")
	public String delete(BusipayBill busipayBill, RedirectAttributes redirectAttributes) {
		busipayBillService.delete(busipayBill);
		addMessage(redirectAttributes, "删除业务应付调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/busipayBill/?repage";
	}

}
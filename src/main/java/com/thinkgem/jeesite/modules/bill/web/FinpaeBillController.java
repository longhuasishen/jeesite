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
import com.thinkgem.jeesite.modules.bill.entity.FinpaeBill;
import com.thinkgem.jeesite.modules.bill.service.FinpaeBillService;

/**
 * 财务应收调账单Controller
 * @author spark
 * @version 2018-01-05
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/finpaeBill")
public class FinpaeBillController extends BaseController {

	@Autowired
	private FinpaeBillService finpaeBillService;
	
	@ModelAttribute
	public FinpaeBill get(@RequestParam(required=false) String id) {
		FinpaeBill entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = finpaeBillService.get(id);
		}
		if (entity == null){
			entity = new FinpaeBill();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:finpaeBill:view")
	@RequestMapping(value = {"list", ""})
	public String list(FinpaeBill finpaeBill, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FinpaeBill> page = finpaeBillService.findPage(new Page<FinpaeBill>(request, response), finpaeBill); 
		model.addAttribute("page", page);
		return "modules/bill/finpaeBillList";
	}

	@RequiresPermissions("bill:finpaeBill:view")
	@RequestMapping(value = "form")
	public String form(FinpaeBill finpaeBill, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("finpaeBill", finpaeBill);
		return "modules/bill/finpaeBillForm";
	}

	@RequiresPermissions("bill:finpaeBill:edit")
	@RequestMapping(value = "save")
	public String save(FinpaeBill finpaeBill, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, finpaeBill)){
			return form(finpaeBill, model);
		}
		finpaeBillService.save(finpaeBill);
		addMessage(redirectAttributes, "保存财务应收调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/finpaeBill/?repage";
	}
	
	@RequiresPermissions("bill:finpaeBill:edit")
	@RequestMapping(value = "delete")
	public String delete(FinpaeBill finpaeBill, RedirectAttributes redirectAttributes) {
		finpaeBillService.delete(finpaeBill);
		addMessage(redirectAttributes, "删除财务应收调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/finpaeBill/?repage";
	}

}
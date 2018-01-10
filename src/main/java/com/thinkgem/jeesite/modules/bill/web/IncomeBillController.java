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
import com.thinkgem.jeesite.modules.bill.entity.IncomeBill;
import com.thinkgem.jeesite.modules.bill.service.IncomeBillService;

/**
 * 收款单Controller
 * @author spark
 * @version 2018-01-07
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/incomeBill")
public class IncomeBillController extends BaseController {

	@Autowired
	private IncomeBillService incomeBillService;
	
	@ModelAttribute
	public IncomeBill get(@RequestParam(required=false) String id) {
		IncomeBill entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = incomeBillService.get(id);
		}
		if (entity == null){
			entity = new IncomeBill();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:incomeBill:view")
	@RequestMapping(value = {"list", ""})
	public String list(IncomeBill incomeBill, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<IncomeBill> page = incomeBillService.findPage(new Page<IncomeBill>(request, response), incomeBill); 
		model.addAttribute("page", page);
		return "modules/bill/incomeBillList";
	}

	@RequiresPermissions("bill:incomeBill:view")
	@RequestMapping(value = "form")
	public String form(IncomeBill incomeBill, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("incomeBill", incomeBill);
		return "modules/bill/incomeBillForm";
	}

	@RequiresPermissions("bill:incomeBill:edit")
	@RequestMapping(value = "save")
	public String save(IncomeBill incomeBill, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, incomeBill)){
			return form(incomeBill, model);
		}
		incomeBillService.save(incomeBill);
		addMessage(redirectAttributes, "保存收款单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/incomeBill/?repage";
	}
	
	@RequiresPermissions("bill:incomeBill:edit")
	@RequestMapping(value = "delete")
	public String delete(IncomeBill incomeBill, RedirectAttributes redirectAttributes) {
		incomeBillService.delete(incomeBill);
		addMessage(redirectAttributes, "删除收款单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/incomeBill/?repage";
	}

}
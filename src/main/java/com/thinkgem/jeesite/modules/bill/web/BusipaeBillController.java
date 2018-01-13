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
import com.thinkgem.jeesite.modules.bill.entity.BusipaeBill;
import com.thinkgem.jeesite.modules.bill.service.BusipaeBillService;

/**
 * 业务应收调账单Controller
 * @author spark
 * @version 2018-01-05
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/busipaeBill")
public class BusipaeBillController extends BaseController {

	@Autowired
	private BusipaeBillService busipaeBillService;
	
	@ModelAttribute
	public BusipaeBill get(@RequestParam(required=false) String id) {
		BusipaeBill entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = busipaeBillService.get(id);
		}
		if (entity == null){
			entity = new BusipaeBill();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:busipaeBill:view")
	@RequestMapping(value = {"list", ""})
	public String list(BusipaeBill busipaeBill, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BusipaeBill> page = busipaeBillService.findPage(new Page<BusipaeBill>(request, response), busipaeBill); 
		model.addAttribute("page", page);
		return "modules/bill/busipaeBillList";
	}

	@RequiresPermissions("bill:busipaeBill:view")
	@RequestMapping(value = "form")
	public String form(BusipaeBill busipaeBill, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("busipaeBill", busipaeBill);
		return "modules/bill/busipaeBillForm";
	}

	@RequiresPermissions("bill:busipaeBill:edit")
	@RequestMapping(value = "save")
	public String save(BusipaeBill busipaeBill, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, busipaeBill)){
			return form(busipaeBill, model);
		}
		busipaeBillService.save(busipaeBill);
		addMessage(redirectAttributes, "保存业务应收调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/busipaeBill/?repage";
	}
	
	@RequiresPermissions("bill:busipaeBill:edit")
	@RequestMapping(value = "delete")
	public String delete(BusipaeBill busipaeBill, RedirectAttributes redirectAttributes) {
		busipaeBillService.delete(busipaeBill);
		addMessage(redirectAttributes, "删除业务应收调账单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/busipaeBill/?repage";
	}

}
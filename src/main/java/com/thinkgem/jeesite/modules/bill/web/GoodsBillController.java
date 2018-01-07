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
import com.thinkgem.jeesite.modules.bill.entity.GoodsBill;
import com.thinkgem.jeesite.modules.bill.service.GoodsBillService;

/**
 * 发货单Controller
 * @author spark
 * @version 2018-01-07
 */
@Controller
@RequestMapping(value = "${adminPath}/bill/goodsBill")
public class GoodsBillController extends BaseController {

	@Autowired
	private GoodsBillService goodsBillService;
	
	@ModelAttribute
	public GoodsBill get(@RequestParam(required=false) String id) {
		GoodsBill entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = goodsBillService.get(id);
		}
		if (entity == null){
			entity = new GoodsBill();
		}
		return entity;
	}
	
	@RequiresPermissions("bill:goodsBill:view")
	@RequestMapping(value = {"list", ""})
	public String list(GoodsBill goodsBill, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GoodsBill> page = goodsBillService.findPage(new Page<GoodsBill>(request, response), goodsBill); 
		model.addAttribute("page", page);
		return "modules/bill/goodsBillList";
	}

	@RequiresPermissions("bill:goodsBill:view")
	@RequestMapping(value = "form")
	public String form(GoodsBill goodsBill, Model model) {
		model.addAttribute("goodsBill", goodsBill);
		return "modules/bill/goodsBillForm";
	}

	@RequiresPermissions("bill:goodsBill:edit")
	@RequestMapping(value = "save")
	public String save(GoodsBill goodsBill, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, goodsBill)){
			return form(goodsBill, model);
		}
		goodsBillService.save(goodsBill);
		addMessage(redirectAttributes, "保存发货单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/goodsBill/?repage";
	}
	
	@RequiresPermissions("bill:goodsBill:edit")
	@RequestMapping(value = "delete")
	public String delete(GoodsBill goodsBill, RedirectAttributes redirectAttributes) {
		goodsBillService.delete(goodsBill);
		addMessage(redirectAttributes, "删除发货单成功");
		return "redirect:"+Global.getAdminPath()+"/bill/goodsBill/?repage";
	}

}
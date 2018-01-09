/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.stock.web;

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
import com.thinkgem.jeesite.modules.stock.entity.InverseKind;
import com.thinkgem.jeesite.modules.stock.service.InverseKindService;

/**
 * 形态转换Controller
 * @author spark
 * @version 2018-01-07
 */
@Controller
@RequestMapping(value = "${adminPath}/stock/inverseKind")
public class InverseKindController extends BaseController {

	@Autowired
	private InverseKindService inverseKindService;
	
	@ModelAttribute
	public InverseKind get(@RequestParam(required=false) String id) {
		InverseKind entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = inverseKindService.get(id);
		}
		if (entity == null){
			entity = new InverseKind();
		}
		return entity;
	}
	
	@RequiresPermissions("stock:inverseKind:view")
	@RequestMapping(value = {"list", ""})
	public String list(InverseKind inverseKind, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<InverseKind> page = inverseKindService.findPage(new Page<InverseKind>(request, response), inverseKind); 
		model.addAttribute("page", page);
		return "modules/stock/inverseKindList";
	}

	@RequiresPermissions("stock:inverseKind:view")
	@RequestMapping(value = "form")
	public String form(InverseKind inverseKind, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("inverseKind", inverseKind);
		return "modules/stock/inverseKindForm";
	}

	@RequiresPermissions("stock:inverseKind:edit")
	@RequestMapping(value = "save")
	public String save(InverseKind inverseKind, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, inverseKind)){
			return form(inverseKind, model);
		}
		inverseKindService.save(inverseKind);
		addMessage(redirectAttributes, "保存形态转换成功");
		return "redirect:"+Global.getAdminPath()+"/stock/inverseKind/?repage";
	}
	
	@RequiresPermissions("stock:inverseKind:edit")
	@RequestMapping(value = "delete")
	public String delete(InverseKind inverseKind, RedirectAttributes redirectAttributes) {
		inverseKindService.delete(inverseKind);
		addMessage(redirectAttributes, "删除形态转换成功");
		return "redirect:"+Global.getAdminPath()+"/stock/inverseKind/?repage";
	}

}
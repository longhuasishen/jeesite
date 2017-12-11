/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.web;

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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveRule;
import com.thinkgem.jeesite.modules.archive.service.ArchiveRuleService;

/**
 * 分类规则Controller
 * @author lisy
 * @version 2017-12-11
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveRule")
public class ArchiveRuleController extends BaseController {

	@Autowired
	private ArchiveRuleService archiveRuleService;
	
	@ModelAttribute
	public ArchiveRule get(@RequestParam(required=false) String id) {
		ArchiveRule entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveRuleService.get(id);
		}
		if (entity == null){
			entity = new ArchiveRule();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveRule:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveRule archiveRule, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveRule> page = archiveRuleService.findPage(new Page<ArchiveRule>(request, response), archiveRule); 
		model.addAttribute("page", page);
		return "modules/archive/archiveRuleList";
	}

	@RequiresPermissions("archive:archiveRule:view")
	@RequestMapping(value = "form")
	public String form(ArchiveRule archiveRule, Model model) {
		model.addAttribute("archiveRule", archiveRule);
		return "modules/archive/archiveRuleForm";
	}

	@RequiresPermissions("archive:archiveRule:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveRule archiveRule, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveRule)){
			return form(archiveRule, model);
		}
		archiveRuleService.save(archiveRule);
		addMessage(redirectAttributes, "保存分类规则成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveRule/?repage";
	}
	
	@RequiresPermissions("archive:archiveRule:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveRule archiveRule, RedirectAttributes redirectAttributes) {
		archiveRuleService.delete(archiveRule);
		addMessage(redirectAttributes, "删除分类规则成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveRule/?repage";
	}

}
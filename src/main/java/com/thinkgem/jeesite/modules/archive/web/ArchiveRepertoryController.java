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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveRepertory;
import com.thinkgem.jeesite.modules.archive.service.ArchiveRepertoryService;

/**
 * 仓库分类Controller
 * @author spark
 * @version 2017-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveRepertory")
public class ArchiveRepertoryController extends BaseController {

	@Autowired
	private ArchiveRepertoryService archiveRepertoryService;
	
	@ModelAttribute
	public ArchiveRepertory get(@RequestParam(required=false) String id) {
		ArchiveRepertory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveRepertoryService.get(id);
		}
		if (entity == null){
			entity = new ArchiveRepertory();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveRepertory:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveRepertory archiveRepertory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveRepertory> page = archiveRepertoryService.findPage(new Page<ArchiveRepertory>(request, response), archiveRepertory); 
		model.addAttribute("page", page);
		return "modules/archive/archiveRepertoryList";
	}

	@RequiresPermissions("archive:archiveRepertory:view")
	@RequestMapping(value = "form")
	public String form(ArchiveRepertory archiveRepertory, Model model) {
		model.addAttribute("archiveRepertory", archiveRepertory);
		return "modules/archive/archiveRepertoryForm";
	}

	@RequiresPermissions("archive:archiveRepertory:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveRepertory archiveRepertory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveRepertory)){
			return form(archiveRepertory, model);
		}
		archiveRepertoryService.save(archiveRepertory);
		addMessage(redirectAttributes, "保存仓库分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveRepertory/?repage";
	}
	
	@RequiresPermissions("archive:archiveRepertory:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveRepertory archiveRepertory, RedirectAttributes redirectAttributes) {
		archiveRepertoryService.delete(archiveRepertory);
		addMessage(redirectAttributes, "删除仓库分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveRepertory/?repage";
	}

}
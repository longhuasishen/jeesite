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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveDepartment;
import com.thinkgem.jeesite.modules.archive.service.ArchiveDepartmentService;

/**
 * 部门分类Controller
 * @author spark
 * @version 2017-12-12
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveDepartment")
public class ArchiveDepartmentController extends BaseController {

	@Autowired
	private ArchiveDepartmentService archiveDepartmentService;
	
	@ModelAttribute
	public ArchiveDepartment get(@RequestParam(required=false) String id) {
		ArchiveDepartment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveDepartmentService.get(id);
		}
		if (entity == null){
			entity = new ArchiveDepartment();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveDepartment:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveDepartment archiveDepartment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveDepartment> page = archiveDepartmentService.findPage(new Page<ArchiveDepartment>(request, response), archiveDepartment); 
		model.addAttribute("page", page);
		return "modules/archive/archiveDepartmentList";
	}

	@RequiresPermissions("archive:archiveDepartment:view")
	@RequestMapping(value = "form")
	public String form(ArchiveDepartment archiveDepartment, Model model) {
		model.addAttribute("archiveDepartment", archiveDepartment);
		return "modules/archive/archiveDepartmentForm";
	}

	@RequiresPermissions("archive:archiveDepartment:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveDepartment archiveDepartment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveDepartment)){
			return form(archiveDepartment, model);
		}
		archiveDepartmentService.save(archiveDepartment);
		addMessage(redirectAttributes, "保存部门分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveDepartment/?repage";
	}
	
	@RequiresPermissions("archive:archiveDepartment:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveDepartment archiveDepartment, RedirectAttributes redirectAttributes) {
		archiveDepartmentService.delete(archiveDepartment);
		addMessage(redirectAttributes, "删除部门分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveDepartment/?repage";
	}

}
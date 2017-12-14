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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveFile;
import com.thinkgem.jeesite.modules.archive.service.ArchiveFileService;

/**
 * 文件分类Controller
 * @author spark
 * @version 2017-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveFile")
public class ArchiveFileController extends BaseController {

	@Autowired
	private ArchiveFileService archiveFileService;
	
	@ModelAttribute
	public ArchiveFile get(@RequestParam(required=false) String id) {
		ArchiveFile entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveFileService.get(id);
		}
		if (entity == null){
			entity = new ArchiveFile();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveFile:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveFile archiveFile, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveFile> page = archiveFileService.findPage(new Page<ArchiveFile>(request, response), archiveFile); 
		model.addAttribute("page", page);
		return "modules/archive/archiveFileList";
	}

	@RequiresPermissions("archive:archiveFile:view")
	@RequestMapping(value = "form")
	public String form(ArchiveFile archiveFile, Model model) {
		model.addAttribute("archiveFile", archiveFile);
		return "modules/archive/archiveFileForm";
	}

	@RequiresPermissions("archive:archiveFile:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveFile archiveFile, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveFile)){
			return form(archiveFile, model);
		}
		archiveFileService.save(archiveFile);
		addMessage(redirectAttributes, "保存文件分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveFile/?repage";
	}
	
	@RequiresPermissions("archive:archiveFile:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveFile archiveFile, RedirectAttributes redirectAttributes) {
		archiveFileService.delete(archiveFile);
		addMessage(redirectAttributes, "删除文件分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveFile/?repage";
	}

}
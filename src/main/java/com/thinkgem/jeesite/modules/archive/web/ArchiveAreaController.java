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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveArea;
import com.thinkgem.jeesite.modules.archive.service.ArchiveAreaService;

/**
 * 地区分类Controller
 * @author spark
 * @version 2017-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveArea")
public class ArchiveAreaController extends BaseController {

	@Autowired
	private ArchiveAreaService archiveAreaService;
	
	@ModelAttribute
	public ArchiveArea get(@RequestParam(required=false) String id) {
		ArchiveArea entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveAreaService.get(id);
		}
		if (entity == null){
			entity = new ArchiveArea();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveArea:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveArea archiveArea, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveArea> page = archiveAreaService.findPage(new Page<ArchiveArea>(request, response), archiveArea); 
		model.addAttribute("page", page);
		return "modules/archive/archiveAreaList";
	}

	@RequiresPermissions("archive:archiveArea:view")
	@RequestMapping(value = "form")
	public String form(ArchiveArea archiveArea, Model model) {
		model.addAttribute("archiveArea", archiveArea);
		return "modules/archive/archiveAreaForm";
	}

	@RequiresPermissions("archive:archiveArea:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveArea archiveArea, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveArea)){
			return form(archiveArea, model);
		}
		archiveAreaService.save(archiveArea);
		addMessage(redirectAttributes, "保存地区分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveArea/?repage";
	}
	
	@RequiresPermissions("archive:archiveArea:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveArea archiveArea, RedirectAttributes redirectAttributes) {
		archiveAreaService.delete(archiveArea);
		addMessage(redirectAttributes, "删除地区分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveArea/?repage";
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveCustom;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveIndustry;
import com.thinkgem.jeesite.modules.archive.service.ArchiveIndustryService;

import java.util.List;
import java.util.Map;

/**
 * 行业分类Controller
 * @author spark
 * @version 2017-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveIndustry")
public class ArchiveIndustryController extends BaseController {

	@Autowired
	private ArchiveIndustryService archiveIndustryService;
	
	@ModelAttribute
	public ArchiveIndustry get(@RequestParam(required=false) String id) {
		ArchiveIndustry entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveIndustryService.get(id);
		}
		if (entity == null){
			entity = new ArchiveIndustry();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveIndustry:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveIndustry archiveIndustry, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveIndustry> page = archiveIndustryService.findPage(new Page<ArchiveIndustry>(request, response), archiveIndustry); 
		model.addAttribute("page", page);
		return "modules/archive/archiveIndustryList";
	}

	@RequiresPermissions("archive:archiveIndustry:view")
	@RequestMapping(value = "form")
	public String form(ArchiveIndustry archiveIndustry, Model model) {
		model.addAttribute("archiveIndustry", archiveIndustry);
		return "modules/archive/archiveIndustryForm";
	}

	@RequiresPermissions("archive:archiveIndustry:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveIndustry archiveIndustry, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveIndustry)){
			return form(archiveIndustry, model);
		}
		archiveIndustryService.save(archiveIndustry);
		addMessage(redirectAttributes, "保存行业分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveIndustry/?repage";
	}
	
	@RequiresPermissions("archive:archiveIndustry:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveIndustry archiveIndustry, RedirectAttributes redirectAttributes) {
		archiveIndustryService.delete(archiveIndustry);
		addMessage(redirectAttributes, "删除行业分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveIndustry/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ArchiveIndustry archiveIndustry = new ArchiveIndustry();
		List<ArchiveIndustry> list = archiveIndustryService.findList(archiveIndustry);
		for (int i=0; i<list.size(); i++){
			ArchiveIndustry e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getIndustryName());
			map.put("code", e.getIndustryCode());

			mapList.add(map);
		}
		return mapList;
	}

}
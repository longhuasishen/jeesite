/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveCustom;
import com.thinkgem.jeesite.modules.archive.service.ArchiveCustomService;

import java.util.List;
import java.util.Map;

/**
 * 客户分类Controller
 * @author spark
 * @version 2017-12-14
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveCustom")
public class ArchiveCustomController extends BaseController {

	@Autowired
	private ArchiveCustomService archiveCustomService;
	
	@ModelAttribute
	public ArchiveCustom get(@RequestParam(required=false) String id) {
		ArchiveCustom entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveCustomService.get(id);
		}
		if (entity == null){
			entity = new ArchiveCustom();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveCustom:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveCustom archiveCustom, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveCustom> page = archiveCustomService.findPage(new Page<ArchiveCustom>(request, response), archiveCustom); 
		model.addAttribute("page", page);
		return "modules/archive/archiveCustomList";
	}

	@RequiresPermissions("archive:archiveCustom:view")
	@RequestMapping(value = "form")
	public String form(ArchiveCustom archiveCustom, Model model) {
		model.addAttribute("archiveCustom", archiveCustom);
		return "modules/archive/archiveCustomForm";
	}

	@RequiresPermissions("archive:archiveCustom:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveCustom archiveCustom, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveCustom)){
			return form(archiveCustom, model);
		}
		archiveCustomService.save(archiveCustom);
		addMessage(redirectAttributes, "保存客户分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveCustom/?repage";
	}
	
	@RequiresPermissions("archive:archiveCustom:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveCustom archiveCustom, RedirectAttributes redirectAttributes) {
		archiveCustomService.delete(archiveCustom);
		addMessage(redirectAttributes, "删除客户分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveCustom/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ArchiveCustom archiveCustom = new ArchiveCustom();
		List<ArchiveCustom> list = archiveCustomService.findList(archiveCustom);
		for (int i=0; i<list.size(); i++){
			ArchiveCustom e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getCustomName());
			map.put("code", e.getCustomCode());

			mapList.add(map);
		}
		return mapList;
	}

}
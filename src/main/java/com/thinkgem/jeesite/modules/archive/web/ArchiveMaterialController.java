/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.sys.entity.Office;
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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveMaterial;
import com.thinkgem.jeesite.modules.archive.service.ArchiveMaterialService;

import java.util.List;
import java.util.Map;

/**
 * 物资分类Controller
 * @author lisy
 * @version 2017-12-14
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveMaterial")
public class ArchiveMaterialController extends BaseController {

	@Autowired
	private ArchiveMaterialService archiveMaterialService;
	
	@ModelAttribute
	public ArchiveMaterial get(@RequestParam(required=false) String id) {
		ArchiveMaterial entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveMaterialService.get(id);
		}
		if (entity == null){
			entity = new ArchiveMaterial();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveMaterial:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveMaterial archiveMaterial, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveMaterial> page = archiveMaterialService.findPage(new Page<ArchiveMaterial>(request, response), archiveMaterial); 
		model.addAttribute("page", page);
		return "modules/archive/archiveMaterialList";
	}

	@RequiresPermissions("archive:archiveMaterial:view")
	@RequestMapping(value = "form")
	public String form(ArchiveMaterial archiveMaterial, Model model) {
		model.addAttribute("archiveMaterial", archiveMaterial);
		return "modules/archive/archiveMaterialForm";
	}

	@RequiresPermissions("archive:archiveMaterial:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveMaterial archiveMaterial, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveMaterial)){
			return form(archiveMaterial, model);
		}
		archiveMaterialService.save(archiveMaterial);
		addMessage(redirectAttributes, "保存单表成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveMaterial/?repage";
	}
	
	@RequiresPermissions("archive:archiveMaterial:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveMaterial archiveMaterial, RedirectAttributes redirectAttributes) {
		archiveMaterialService.delete(archiveMaterial);
		addMessage(redirectAttributes, "删除单表成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveMaterial/?repage";
	}
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String materialCode, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ArchiveMaterial am = new ArchiveMaterial();
		am.setMaterialCode(materialCode);
		List<ArchiveMaterial> list = archiveMaterialService.findList(am);
		for (int i=0; i<list.size(); i++){
			ArchiveMaterial e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getMaterialName());
			map.put("code", e.getMaterialCode());

			mapList.add(map);
		}
		return mapList;
	}

}
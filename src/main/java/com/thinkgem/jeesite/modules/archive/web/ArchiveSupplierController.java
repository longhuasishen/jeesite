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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveSupplier;
import com.thinkgem.jeesite.modules.archive.service.ArchiveSupplierService;

import java.util.List;
import java.util.Map;

/**
 * 供应商分类Controller
 * @author spark
 * @version 2017-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveSupplier")
public class ArchiveSupplierController extends BaseController {

	@Autowired
	private ArchiveSupplierService archiveSupplierService;
	
	@ModelAttribute
	public ArchiveSupplier get(@RequestParam(required=false) String id) {
		ArchiveSupplier entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveSupplierService.get(id);
		}
		if (entity == null){
			entity = new ArchiveSupplier();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveSupplier:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveSupplier archiveSupplier, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveSupplier> page = archiveSupplierService.findPage(new Page<ArchiveSupplier>(request, response), archiveSupplier); 
		model.addAttribute("page", page);
		return "modules/archive/archiveSupplierList";
	}

	@RequiresPermissions("archive:archiveSupplier:view")
	@RequestMapping(value = "form")
	public String form(ArchiveSupplier archiveSupplier, Model model) {
		model.addAttribute("archiveSupplier", archiveSupplier);
		return "modules/archive/archiveSupplierForm";
	}

	@RequiresPermissions("archive:archiveSupplier:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveSupplier archiveSupplier, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveSupplier)){
			return form(archiveSupplier, model);
		}
		archiveSupplierService.save(archiveSupplier);
		addMessage(redirectAttributes, "保存供应商分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveSupplier/?repage";
	}
	
	@RequiresPermissions("archive:archiveSupplier:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveSupplier archiveSupplier, RedirectAttributes redirectAttributes) {
		archiveSupplierService.delete(archiveSupplier);
		addMessage(redirectAttributes, "删除供应商分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveSupplier/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ArchiveSupplier archiveSupplier = new ArchiveSupplier();
		List<ArchiveSupplier> list = archiveSupplierService.findList(archiveSupplier);
		for (int i=0; i<list.size(); i++){
			ArchiveSupplier e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getSupplierName());
			map.put("code", e.getSupplierCode());

			mapList.add(map);
		}
		return mapList;
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
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
import com.thinkgem.jeesite.modules.doc.entity.DocDriver;
import com.thinkgem.jeesite.modules.doc.service.DocDriverService;

import java.util.List;
import java.util.Map;

/**
 * 司机档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docDriver")
public class DocDriverController extends BaseController {

	@Autowired
	private DocDriverService docDriverService;
	
	@ModelAttribute
	public DocDriver get(@RequestParam(required=false) String id) {
		DocDriver entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docDriverService.get(id);
		}
		if (entity == null){
			entity = new DocDriver();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docDriver:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocDriver docDriver, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocDriver> page = docDriverService.findPage(new Page<DocDriver>(request, response), docDriver); 
		model.addAttribute("page", page);
		return "modules/doc/docDriverList";
	}

	@RequiresPermissions("doc:docDriver:view")
	@RequestMapping(value = "form")
	public String form(DocDriver docDriver, Model model) {
		model.addAttribute("docDriver", docDriver);
		return "modules/doc/docDriverForm";
	}

	@RequiresPermissions("doc:docDriver:edit")
	@RequestMapping(value = "save")
	public String save(DocDriver docDriver, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docDriver)){
			return form(docDriver, model);
		}
		docDriverService.save(docDriver);
		addMessage(redirectAttributes, "保存司机档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docDriver/?repage";
	}
	
	@RequiresPermissions("doc:docDriver:edit")
	@RequestMapping(value = "delete")
	public String delete(DocDriver docDriver, RedirectAttributes redirectAttributes) {
		docDriverService.delete(docDriver);
		addMessage(redirectAttributes, "删除司机档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docDriver/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocDriver docDriver = new DocDriver();
		List<DocDriver> list = docDriverService.findList(docDriver);
		for (int i=0; i<list.size(); i++){
			DocDriver e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getDriverName()+"["+e.getDriverCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
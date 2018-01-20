/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
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
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.service.DocOfficeworkService;

import java.util.List;
import java.util.Map;

/**
 * 职员档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docOfficework")
public class DocOfficeworkController extends BaseController {

	@Autowired
	private DocOfficeworkService docOfficeworkService;
	
	@ModelAttribute
	public DocOfficework get(@RequestParam(required=false) String id) {
		DocOfficework entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docOfficeworkService.get(id);
		}
		if (entity == null){
			entity = new DocOfficework();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docOfficework:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocOfficework docOfficework, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocOfficework> page = docOfficeworkService.findPage(new Page<DocOfficework>(request, response), docOfficework); 
		model.addAttribute("page", page);
		return "modules/doc/docOfficeworkList";
	}

	@RequiresPermissions("doc:docOfficework:view")
	@RequestMapping(value = "form")
	public String form(DocOfficework docOfficework, Model model) {
		model.addAttribute("docOfficework", docOfficework);
		return "modules/doc/docOfficeworkForm";
	}

	@RequiresPermissions("doc:docOfficework:edit")
	@RequestMapping(value = "save")
	public String save(DocOfficework docOfficework, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docOfficework)){
			return form(docOfficework, model);
		}
		docOfficeworkService.save(docOfficework);
		addMessage(redirectAttributes, "保存职员档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docOfficework/?repage";
	}
	
	@RequiresPermissions("doc:docOfficework:edit")
	@RequestMapping(value = "delete")
	public String delete(DocOfficework docOfficework, RedirectAttributes redirectAttributes) {
		docOfficeworkService.delete(docOfficework);
		addMessage(redirectAttributes, "删除职员档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docOfficework/?repage";
	}

//	@ResponseBody
//	@RequestMapping(value = "treeData")
//	public List<Map<String, Object>> treeData(HttpServletResponse response) {
//		List<Map<String, Object>> mapList = Lists.newArrayList();
//		DocOfficework docOfficework = new DocOfficework();
//		List<DocOfficework> list = docOfficeworkService.findList(docOfficework);
//		for (int i=0; i<list.size(); i++){
//			DocOfficework e = list.get(i);
//			Map<String, Object> map = Maps.newHashMap();
//			map.put("id", e.getId());
//			map.put("name", e.getOfficeworkName()+"["+e.getOfficeworkCode()+"]");
//
//			mapList.add(map);
//		}
//		return mapList;
//	}
	@ResponseBody
	@RequestMapping(value = "treeData2")
	public List<Map<String, Object>> treeData2(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocOfficework docOfficework = new DocOfficework();
		List<DocOfficework> list = docOfficeworkService.findList(docOfficework);
		for (int i=0; i<list.size(); i++){
			DocOfficework e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getOfficeworkCode());
			map.put("name", e.getOfficeworkName()+"["+e.getOfficeworkCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocOfficework docOfficework = new DocOfficework();
		List<DocOfficework> list = docOfficeworkService.treeData(docOfficework);
		for (int i=0; i<list.size(); i++){
			DocOfficework e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getOfficeworkName()+"["+e.getOfficeworkCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
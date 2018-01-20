/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
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
import com.thinkgem.jeesite.modules.doc.entity.DocRepertory;
import com.thinkgem.jeesite.modules.doc.service.DocRepertoryService;

import java.util.List;
import java.util.Map;

/**
 * 仓库档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docRepertory")
public class DocRepertoryController extends BaseController {

	@Autowired
	private DocRepertoryService docRepertoryService;
	
	@ModelAttribute
	public DocRepertory get(@RequestParam(required=false) String id) {
		DocRepertory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docRepertoryService.get(id);
		}
		if (entity == null){
			entity = new DocRepertory();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docRepertory:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocRepertory docRepertory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocRepertory> page = docRepertoryService.findPage(new Page<DocRepertory>(request, response), docRepertory); 
		model.addAttribute("page", page);
		return "modules/doc/docRepertoryList";
	}

	@RequiresPermissions("doc:docRepertory:view")
	@RequestMapping(value = "form")
	public String form(DocRepertory docRepertory, Model model) {
		model.addAttribute("docRepertory", docRepertory);
		return "modules/doc/docRepertoryForm";
	}

	@RequiresPermissions("doc:docRepertory:edit")
	@RequestMapping(value = "save")
	public String save(DocRepertory docRepertory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docRepertory)){
			return form(docRepertory, model);
		}
		docRepertoryService.save(docRepertory);
		addMessage(redirectAttributes, "保存仓库档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docRepertory/?repage";
	}
	
	@RequiresPermissions("doc:docRepertory:edit")
	@RequestMapping(value = "delete")
	public String delete(DocRepertory docRepertory, RedirectAttributes redirectAttributes) {
		docRepertoryService.delete(docRepertory);
		addMessage(redirectAttributes, "删除仓库档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docRepertory/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocRepertory docRepertory = new DocRepertory();
		List<DocRepertory> list = docRepertoryService.treeData(docRepertory);
		for (int i=0; i<list.size(); i++){
			DocRepertory e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getRepertoryName()+"["+e.getRepertoryCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}
	@ResponseBody
	@RequestMapping(value = "treeData2")
	public List<Map<String, Object>> treeData2(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocRepertory docRepertory = new DocRepertory();
		List<DocRepertory> list = docRepertoryService.findList(docRepertory);
		for (int i=0; i<list.size(); i++){
			DocRepertory e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getRepertoryCode());
			map.put("name", e.getRepertoryName()+"["+e.getRepertoryCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
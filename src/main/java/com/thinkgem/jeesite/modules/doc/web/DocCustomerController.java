/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveMaterial;
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
import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
import com.thinkgem.jeesite.modules.doc.service.DocCustomerService;

import java.util.List;
import java.util.Map;

/**
 * 客户档案Controller
 * @author lisy
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docCustomer")
public class DocCustomerController extends BaseController {

	@Autowired
	private DocCustomerService docCustomerService;
	
	@ModelAttribute
	public DocCustomer get(@RequestParam(required=false) String id) {
		DocCustomer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docCustomerService.get(id);
		}
		if (entity == null){
			entity = new DocCustomer();
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = {"get"})
	public DocCustomer getById(@RequestParam(required=false) String id) {
		DocCustomer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docCustomerService.get(id);
		}
		if (entity == null){
			entity = new DocCustomer();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docCustomer:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocCustomer docCustomer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocCustomer> page = docCustomerService.findPage(new Page<DocCustomer>(request, response), docCustomer); 
		model.addAttribute("page", page);
		return "modules/doc/docCustomerList";
	}

	@RequiresPermissions("doc:docCustomer:view")
	@RequestMapping(value = "form")
	public String form(DocCustomer docCustomer, Model model) {
		model.addAttribute("docCustomer", docCustomer);
		return "modules/doc/docCustomerForm";
	}
	@RequiresPermissions("doc:docCustomer:view")
	@RequestMapping(value = "formDetail")
	public String formDetail(DocCustomer docCustomer, Model model) {
		model.addAttribute("docCustomer", docCustomer);
		return "modules/doc/docCustomerFormDetail";
	}

	@RequiresPermissions("doc:docCustomer:edit")
	@RequestMapping(value = "save")
	public String save(DocCustomer docCustomer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docCustomer)){
			return form(docCustomer, model);
		}
		docCustomerService.save(docCustomer);
		addMessage(redirectAttributes, "保存客户档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docCustomer/?repage";
	}
	
	@RequiresPermissions("doc:docCustomer:edit")
	@RequestMapping(value = "delete")
	public String delete(DocCustomer docCustomer, RedirectAttributes redirectAttributes) {
		docCustomerService.delete(docCustomer);
		addMessage(redirectAttributes, "删除客户档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docCustomer/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData( HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocCustomer docCustomer = new DocCustomer();
		List<DocCustomer> list = docCustomerService.findList(docCustomer);
		for (int i=0; i<list.size(); i++){
			DocCustomer e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getCusName()+"["+e.getCusCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

	@ResponseBody
	@RequestMapping(value = "treeDataShortName")
	public List<Map<String, Object>> treeDataShortName( HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocCustomer docCustomer = new DocCustomer();
		List<DocCustomer> list = docCustomerService.findList(docCustomer);
		for (int i=0; i<list.size(); i++){
			DocCustomer e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getCusShortName()+"["+e.getCusCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

	@ResponseBody
	@RequestMapping(value = "treeDataCusProject")
	public List<Map<String, Object>> treeDataCusProject( HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocCustomer docCustomer = new DocCustomer();
		List<DocCustomer> list = docCustomerService.findList(docCustomer);
		for (int i=0; i<list.size(); i++){
			DocCustomer e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getCusProject()+"["+e.getCusCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
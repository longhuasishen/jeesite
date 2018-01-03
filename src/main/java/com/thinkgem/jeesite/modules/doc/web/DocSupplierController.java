/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

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
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;
import com.thinkgem.jeesite.modules.doc.service.DocSupplierService;

import java.util.List;
import java.util.Map;

/**
 * 供应商档案Controller
 * @author lisy
 * @version 2017-12-16
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docSupplier")
public class DocSupplierController extends BaseController {

	@Autowired
	private DocSupplierService docSupplierService;
	
	@ModelAttribute
	public DocSupplier get(@RequestParam(required=false) String id) {
		DocSupplier entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docSupplierService.get(id);
		}
		if (entity == null){
			entity = new DocSupplier();
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = {"get"})
	public DocSupplier getById(@RequestParam(required=false) String id) {
		DocSupplier entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docSupplierService.get(id);
		}
		if (entity == null){
			entity = new DocSupplier();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docSupplier:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocSupplier docSupplier, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocSupplier> page = docSupplierService.findPage(new Page<DocSupplier>(request, response), docSupplier); 
		model.addAttribute("page", page);
		return "modules/doc/docSupplierList";
	}

	@RequiresPermissions("doc:docSupplier:view")
	@RequestMapping(value = "form")
	public String form(DocSupplier docSupplier, Model model) {
		model.addAttribute("docSupplier", docSupplier);
		return "modules/doc/docSupplierForm";
	}
	@RequiresPermissions("doc:docSupplier:view")
	@RequestMapping(value = "formDetail")
	public String formDetail(DocSupplier docSupplier, Model model) {
		model.addAttribute("docSupplier", docSupplier);
		return "modules/doc/docSupplierDetail";
	}

	@RequiresPermissions("doc:docSupplier:edit")
	@RequestMapping(value = "save")
	public String save(DocSupplier docSupplier, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docSupplier)){
			return form(docSupplier, model);
		}
		docSupplierService.save(docSupplier);
		addMessage(redirectAttributes, "保存供应商档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docSupplier/?repage";
	}
	
	@RequiresPermissions("doc:docSupplier:edit")
	@RequestMapping(value = "delete")
	public String delete(DocSupplier docSupplier, RedirectAttributes redirectAttributes) {
		docSupplierService.delete(docSupplier);
		addMessage(redirectAttributes, "删除供应商档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docSupplier/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocSupplier docSupplier = new DocSupplier();
		List<DocSupplier> list = docSupplierService.findList(docSupplier);
		for (int i=0; i<list.size(); i++){
			DocSupplier e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getSupName()+"["+e.getSupCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}
	@ResponseBody
	@RequestMapping(value = "treeData2")
	public List<Map<String, Object>> treeData2(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocSupplier docSupplier = new DocSupplier();
		List<DocSupplier> list = docSupplierService.findList(docSupplier);
		for (int i=0; i<list.size(); i++){
			DocSupplier e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getSupCode());
			map.put("name", e.getSupName()+"["+e.getSupCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
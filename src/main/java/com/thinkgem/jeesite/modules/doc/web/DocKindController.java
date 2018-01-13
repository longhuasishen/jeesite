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
import com.thinkgem.jeesite.modules.doc.entity.DocKind;
import com.thinkgem.jeesite.modules.doc.service.DocKindService;

import java.util.List;
import java.util.Map;

/**
 * 品种档案Controller
 * @author lisy
 * @version 2017-12-30
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docKind")
public class DocKindController extends BaseController {

	@Autowired
	private DocKindService docKindService;
	
	@ModelAttribute
	public DocKind get(@RequestParam(required=false) String id) {
		DocKind entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docKindService.get(id);
		}
		if (entity == null){
			entity = new DocKind();
		}
		return entity;
	}
	
//	@RequiresPermissions("doc:docKind:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocKind docKind, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocKind> page = docKindService.findPage(new Page<DocKind>(request, response), docKind); 
		model.addAttribute("page", page);
		return "modules/doc/docKindList";
	}
	@RequestMapping(value = {"listFrame"})
	public String listFrame(DocKind docKind, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocKind> page = docKindService.findPage(new Page<DocKind>(request, response), docKind);
		model.addAttribute("page", page);
		return "modules/doc/docKindListFrame";
	}

	@RequiresPermissions("doc:docKind:view")
	@RequestMapping(value = "form")
	public String form(DocKind docKind, Model model) {
		model.addAttribute("docKind", docKind);
		return "modules/doc/docKindForm";
	}

	@RequiresPermissions("doc:docKind:edit")
	@RequestMapping(value = "save")
	public String save(DocKind docKind, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docKind)){
			return form(docKind, model);
		}
		docKindService.save(docKind);
		addMessage(redirectAttributes, "保存品种档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docKind/?repage";
	}
	
	@RequiresPermissions("doc:docKind:edit")
	@RequestMapping(value = "delete")
	public String delete(DocKind docKind, RedirectAttributes redirectAttributes) {
		docKindService.delete(docKind);
		addMessage(redirectAttributes, "删除品种档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docKind/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocKind docKind = new DocKind();
		List<DocKind> list = docKindService.findList(docKind);
		for (int i=0; i<list.size(); i++){
			DocKind e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getKindCode());
			map.put("name", e.getKindName()+"["+e.getKindCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
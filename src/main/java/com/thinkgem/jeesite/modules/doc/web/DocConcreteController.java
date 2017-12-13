/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.doc.entity.DocConcrete;
import com.thinkgem.jeesite.modules.doc.service.DocConcreteService;

/**
 * 原材料档案Controller
 * @author spark
 * @version 2017-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docConcrete")
public class DocConcreteController extends BaseController {

	@Autowired
	private DocConcreteService docConcreteService;
	
	@ModelAttribute
	public DocConcrete get(@RequestParam(required=false) String id) {
		DocConcrete entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docConcreteService.get(id);
		}
		if (entity == null){
			entity = new DocConcrete();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docConcrete:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocConcrete docConcrete, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocConcrete> page = docConcreteService.findPage(new Page<DocConcrete>(request, response), docConcrete); 
		model.addAttribute("page", page);
		return "modules/doc/docConcreteList";
	}

	@RequiresPermissions("doc:docConcrete:view")
	@RequestMapping(value = "form")
	public String form(DocConcrete docConcrete, Model model) {
		model.addAttribute("docConcrete", docConcrete);
		return "modules/doc/docConcreteForm";
	}

	@RequiresPermissions("doc:docConcrete:edit")
	@RequestMapping(value = "save")
	public String save(DocConcrete docConcrete, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docConcrete)){
			return form(docConcrete, model);
		}
		docConcreteService.save(docConcrete);
		addMessage(redirectAttributes, "保存原材料档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docConcrete/?repage";
	}
	
	@RequiresPermissions("doc:docConcrete:edit")
	@RequestMapping(value = "delete")
	public String delete(DocConcrete docConcrete, RedirectAttributes redirectAttributes) {
		docConcreteService.delete(docConcrete);
		addMessage(redirectAttributes, "删除原材料档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docConcrete/?repage";
	}

}
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
import com.thinkgem.jeesite.modules.doc.entity.DocBeton;
import com.thinkgem.jeesite.modules.doc.service.DocBetonService;

/**
 * 混凝土档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docBeton")
public class DocBetonController extends BaseController {

	@Autowired
	private DocBetonService docBetonService;
	
	@ModelAttribute
	public DocBeton get(@RequestParam(required=false) String id) {
		DocBeton entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docBetonService.get(id);
		}
		if (entity == null){
			entity = new DocBeton();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docBeton:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocBeton docBeton, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocBeton> page = docBetonService.findPage(new Page<DocBeton>(request, response), docBeton); 
		model.addAttribute("page", page);
		return "modules/doc/docBetonList";
	}

	@RequiresPermissions("doc:docBeton:view")
	@RequestMapping(value = "form")
	public String form(DocBeton docBeton, Model model) {
		model.addAttribute("docBeton", docBeton);
		return "modules/doc/docBetonForm";
	}

	@RequiresPermissions("doc:docBeton:edit")
	@RequestMapping(value = "save")
	public String save(DocBeton docBeton, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docBeton)){
			return form(docBeton, model);
		}
		docBetonService.save(docBeton);
		addMessage(redirectAttributes, "保存混凝土档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docBeton/?repage";
	}
	
	@RequiresPermissions("doc:docBeton:edit")
	@RequestMapping(value = "delete")
	public String delete(DocBeton docBeton, RedirectAttributes redirectAttributes) {
		docBetonService.delete(docBeton);
		addMessage(redirectAttributes, "删除混凝土档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docBeton/?repage";
	}

}
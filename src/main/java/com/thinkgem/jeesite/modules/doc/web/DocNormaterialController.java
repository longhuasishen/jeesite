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
import com.thinkgem.jeesite.modules.doc.entity.DocNormaterial;
import com.thinkgem.jeesite.modules.doc.service.DocNormaterialService;

/**
 * 普通物资档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docNormaterial")
public class DocNormaterialController extends BaseController {

	@Autowired
	private DocNormaterialService docNormaterialService;
	
	@ModelAttribute
	public DocNormaterial get(@RequestParam(required=false) String id) {
		DocNormaterial entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docNormaterialService.get(id);
		}
		if (entity == null){
			entity = new DocNormaterial();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docNormaterial:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocNormaterial docNormaterial, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocNormaterial> page = docNormaterialService.findPage(new Page<DocNormaterial>(request, response), docNormaterial); 
		model.addAttribute("page", page);
		return "modules/doc/docNormaterialList";
	}

	@RequiresPermissions("doc:docNormaterial:view")
	@RequestMapping(value = "form")
	public String form(DocNormaterial docNormaterial, Model model) {
		model.addAttribute("docNormaterial", docNormaterial);
		return "modules/doc/docNormaterialForm";
	}

	@RequiresPermissions("doc:docNormaterial:edit")
	@RequestMapping(value = "save")
	public String save(DocNormaterial docNormaterial, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docNormaterial)){
			return form(docNormaterial, model);
		}
		docNormaterialService.save(docNormaterial);
		addMessage(redirectAttributes, "保存普通物资档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docNormaterial/?repage";
	}
	
	@RequiresPermissions("doc:docNormaterial:edit")
	@RequestMapping(value = "delete")
	public String delete(DocNormaterial docNormaterial, RedirectAttributes redirectAttributes) {
		docNormaterialService.delete(docNormaterial);
		addMessage(redirectAttributes, "删除普通物资档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docNormaterial/?repage";
	}

}
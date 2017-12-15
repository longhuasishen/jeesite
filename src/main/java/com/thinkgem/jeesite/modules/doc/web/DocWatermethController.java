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
import com.thinkgem.jeesite.modules.doc.entity.DocWatermeth;
import com.thinkgem.jeesite.modules.doc.service.DocWatermethService;

/**
 * 浇灌方式档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docWatermeth")
public class DocWatermethController extends BaseController {

	@Autowired
	private DocWatermethService docWatermethService;
	
	@ModelAttribute
	public DocWatermeth get(@RequestParam(required=false) String id) {
		DocWatermeth entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docWatermethService.get(id);
		}
		if (entity == null){
			entity = new DocWatermeth();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docWatermeth:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocWatermeth docWatermeth, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocWatermeth> page = docWatermethService.findPage(new Page<DocWatermeth>(request, response), docWatermeth); 
		model.addAttribute("page", page);
		return "modules/doc/docWatermethList";
	}

	@RequiresPermissions("doc:docWatermeth:view")
	@RequestMapping(value = "form")
	public String form(DocWatermeth docWatermeth, Model model) {
		model.addAttribute("docWatermeth", docWatermeth);
		return "modules/doc/docWatermethForm";
	}

	@RequiresPermissions("doc:docWatermeth:edit")
	@RequestMapping(value = "save")
	public String save(DocWatermeth docWatermeth, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docWatermeth)){
			return form(docWatermeth, model);
		}
		docWatermethService.save(docWatermeth);
		addMessage(redirectAttributes, "保存浇灌方式档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docWatermeth/?repage";
	}
	
	@RequiresPermissions("doc:docWatermeth:edit")
	@RequestMapping(value = "delete")
	public String delete(DocWatermeth docWatermeth, RedirectAttributes redirectAttributes) {
		docWatermethService.delete(docWatermeth);
		addMessage(redirectAttributes, "删除浇灌方式档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docWatermeth/?repage";
	}

}
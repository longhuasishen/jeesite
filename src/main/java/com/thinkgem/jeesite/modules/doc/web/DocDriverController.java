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
import com.thinkgem.jeesite.modules.doc.entity.DocDriver;
import com.thinkgem.jeesite.modules.doc.service.DocDriverService;

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

}
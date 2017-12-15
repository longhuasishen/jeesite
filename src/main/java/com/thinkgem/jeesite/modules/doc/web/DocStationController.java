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
import com.thinkgem.jeesite.modules.doc.entity.DocStation;
import com.thinkgem.jeesite.modules.doc.service.DocStationService;

/**
 * 搅拌站档案Controller
 * @author spark
 * @version 2017-12-14
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docStation")
public class DocStationController extends BaseController {

	@Autowired
	private DocStationService docStationService;
	
	@ModelAttribute
	public DocStation get(@RequestParam(required=false) String id) {
		DocStation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docStationService.get(id);
		}
		if (entity == null){
			entity = new DocStation();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docStation:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocStation docStation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocStation> page = docStationService.findPage(new Page<DocStation>(request, response), docStation); 
		model.addAttribute("page", page);
		return "modules/doc/docStationList";
	}

	@RequiresPermissions("doc:docStation:view")
	@RequestMapping(value = "form")
	public String form(DocStation docStation, Model model) {
		model.addAttribute("docStation", docStation);
		return "modules/doc/docStationForm";
	}

	@RequiresPermissions("doc:docStation:edit")
	@RequestMapping(value = "save")
	public String save(DocStation docStation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docStation)){
			return form(docStation, model);
		}
		docStationService.save(docStation);
		addMessage(redirectAttributes, "保存搅拌站档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docStation/?repage";
	}
	
	@RequiresPermissions("doc:docStation:edit")
	@RequestMapping(value = "delete")
	public String delete(DocStation docStation, RedirectAttributes redirectAttributes) {
		docStationService.delete(docStation);
		addMessage(redirectAttributes, "删除搅拌站档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docStation/?repage";
	}

}
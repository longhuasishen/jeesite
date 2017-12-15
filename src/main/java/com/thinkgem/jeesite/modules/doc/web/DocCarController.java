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
import com.thinkgem.jeesite.modules.doc.entity.DocCar;
import com.thinkgem.jeesite.modules.doc.service.DocCarService;

/**
 * 车辆档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docCar")
public class DocCarController extends BaseController {

	@Autowired
	private DocCarService docCarService;
	
	@ModelAttribute
	public DocCar get(@RequestParam(required=false) String id) {
		DocCar entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docCarService.get(id);
		}
		if (entity == null){
			entity = new DocCar();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docCar:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocCar docCar, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocCar> page = docCarService.findPage(new Page<DocCar>(request, response), docCar); 
		model.addAttribute("page", page);
		return "modules/doc/docCarList";
	}

	@RequiresPermissions("doc:docCar:view")
	@RequestMapping(value = "form")
	public String form(DocCar docCar, Model model) {
		model.addAttribute("docCar", docCar);
		return "modules/doc/docCarForm";
	}

	@RequiresPermissions("doc:docCar:edit")
	@RequestMapping(value = "save")
	public String save(DocCar docCar, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docCar)){
			return form(docCar, model);
		}
		docCarService.save(docCar);
		addMessage(redirectAttributes, "保存车辆档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docCar/?repage";
	}
	
	@RequiresPermissions("doc:docCar:edit")
	@RequestMapping(value = "delete")
	public String delete(DocCar docCar, RedirectAttributes redirectAttributes) {
		docCarService.delete(docCar);
		addMessage(redirectAttributes, "删除车辆档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docCar/?repage";
	}

}
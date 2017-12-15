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
import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
import com.thinkgem.jeesite.modules.doc.service.DocDepartmentService;

/**
 * 部门档案Controller
 * @author spark
 * @version 2017-12-14
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docDepartment")
public class DocDepartmentController extends BaseController {

	@Autowired
	private DocDepartmentService docDepartmentService;
	
	@ModelAttribute
	public DocDepartment get(@RequestParam(required=false) String id) {
		DocDepartment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docDepartmentService.get(id);
		}
		if (entity == null){
			entity = new DocDepartment();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docDepartment:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocDepartment docDepartment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocDepartment> page = docDepartmentService.findPage(new Page<DocDepartment>(request, response), docDepartment); 
		model.addAttribute("page", page);
		return "modules/doc/docDepartmentList";
	}

	@RequiresPermissions("doc:docDepartment:view")
	@RequestMapping(value = "form")
	public String form(DocDepartment docDepartment, Model model) {
		model.addAttribute("docDepartment", docDepartment);
		return "modules/doc/docDepartmentForm";
	}

	@RequiresPermissions("doc:docDepartment:edit")
	@RequestMapping(value = "save")
	public String save(DocDepartment docDepartment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docDepartment)){
			return form(docDepartment, model);
		}
		docDepartmentService.save(docDepartment);
		addMessage(redirectAttributes, "保存部门档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docDepartment/?repage";
	}
	
	@RequiresPermissions("doc:docDepartment:edit")
	@RequestMapping(value = "delete")
	public String delete(DocDepartment docDepartment, RedirectAttributes redirectAttributes) {
		docDepartmentService.delete(docDepartment);
		addMessage(redirectAttributes, "删除部门档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docDepartment/?repage";
	}

}
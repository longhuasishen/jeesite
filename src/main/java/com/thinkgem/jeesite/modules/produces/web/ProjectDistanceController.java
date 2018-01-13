/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.web;

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
import com.thinkgem.jeesite.modules.produces.entity.ProjectDistance;
import com.thinkgem.jeesite.modules.produces.service.ProjectDistanceService;

/**
 * 工程运距管理Controller
 * @author spark
 * @version 2018-01-04
 */
@Controller
@RequestMapping(value = "${adminPath}/produces/projectDistance")
public class ProjectDistanceController extends BaseController {

	@Autowired
	private ProjectDistanceService projectDistanceService;
	
	@ModelAttribute
	public ProjectDistance get(@RequestParam(required=false) String id) {
		ProjectDistance entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = projectDistanceService.get(id);
		}
		if (entity == null){
			entity = new ProjectDistance();
		}
		return entity;
	}
	
	@RequiresPermissions("produces:projectDistance:view")
	@RequestMapping(value = {"list", ""})
	public String list(ProjectDistance projectDistance, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ProjectDistance> page = projectDistanceService.findPage(new Page<ProjectDistance>(request, response), projectDistance); 
		model.addAttribute("page", page);
		return "modules/produces/projectDistanceList";
	}

	@RequiresPermissions("produces:projectDistance:view")
	@RequestMapping(value = "form")
	public String form(ProjectDistance projectDistance, Model model) {
		model.addAttribute("projectDistance", projectDistance);
		return "modules/produces/projectDistanceForm";
	}

	@RequiresPermissions("produces:projectDistance:edit")
	@RequestMapping(value = "save")
	public String save(ProjectDistance projectDistance, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, projectDistance)){
			return form(projectDistance, model);
		}
		projectDistanceService.save(projectDistance);
		addMessage(redirectAttributes, "保存工程运距管理成功");
		return "redirect:"+Global.getAdminPath()+"/produces/projectDistance/?repage";
	}
	
	@RequiresPermissions("produces:projectDistance:edit")
	@RequestMapping(value = "delete")
	public String delete(ProjectDistance projectDistance, RedirectAttributes redirectAttributes) {
		projectDistanceService.delete(projectDistance);
		addMessage(redirectAttributes, "删除工程运距管理成功");
		return "redirect:"+Global.getAdminPath()+"/produces/projectDistance/?repage";
	}

}
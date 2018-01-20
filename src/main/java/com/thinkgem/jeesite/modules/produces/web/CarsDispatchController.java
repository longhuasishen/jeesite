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
import com.thinkgem.jeesite.modules.produces.entity.CarsDispatch;
import com.thinkgem.jeesite.modules.produces.service.CarsDispatchService;

/**
 * 车辆调度Controller
 * @author spark
 * @version 2018-01-20
 */
@Controller
@RequestMapping(value = "${adminPath}/produces/carsDispatch")
public class CarsDispatchController extends BaseController {

	@Autowired
	private CarsDispatchService carsDispatchService;
	
	@ModelAttribute
	public CarsDispatch get(@RequestParam(required=false) String id) {
		CarsDispatch entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = carsDispatchService.get(id);
		}
		if (entity == null){
			entity = new CarsDispatch();
		}
		return entity;
	}
	
	@RequiresPermissions("produces:carsDispatch:view")
	@RequestMapping(value = {"list", ""})
	public String list(CarsDispatch carsDispatch, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CarsDispatch> page = carsDispatchService.findPage(new Page<CarsDispatch>(request, response), carsDispatch); 
		model.addAttribute("page", page);
		return "modules/produces/carsDispatchList";
	}

	@RequiresPermissions("produces:carsDispatch:view")
	@RequestMapping(value = "form")
	public String form(CarsDispatch carsDispatch, Model model) {
		model.addAttribute("carsDispatch", carsDispatch);
		return "modules/produces/carsDispatchForm";
	}

	@RequiresPermissions("produces:carsDispatch:edit")
	@RequestMapping(value = "save")
	public String save(CarsDispatch carsDispatch, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, carsDispatch)){
			return form(carsDispatch, model);
		}
		carsDispatchService.save(carsDispatch);
		addMessage(redirectAttributes, "保存车辆调度成功");
		return "redirect:"+Global.getAdminPath()+"/produces/carsDispatch/?repage";
	}
	
	@RequiresPermissions("produces:carsDispatch:edit")
	@RequestMapping(value = "delete")
	public String delete(CarsDispatch carsDispatch, RedirectAttributes redirectAttributes) {
		carsDispatchService.delete(carsDispatch);
		addMessage(redirectAttributes, "删除车辆调度成功");
		return "redirect:"+Global.getAdminPath()+"/produces/carsDispatch/?repage";
	}

}
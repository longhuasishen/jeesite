/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.produces.entity.CoordinateRatio;
import com.thinkgem.jeesite.modules.produces.service.CoordinateRatioService;

import java.util.List;
import java.util.Map;

/**
 * 配合比系列表Controller
 * @author spark
 * @version 2018-01-20
 */
@Controller
@RequestMapping(value = "${adminPath}/produces/coordinateRatio")
public class CoordinateRatioController extends BaseController {

	@Autowired
	private CoordinateRatioService coordinateRatioService;
	
	@ModelAttribute
	public CoordinateRatio get(@RequestParam(required=false) String id) {
		CoordinateRatio entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = coordinateRatioService.get(id);
		}
		if (entity == null){
			entity = new CoordinateRatio();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = {"get"})
	public CoordinateRatio getById(@RequestParam(required=false) String id) {
		CoordinateRatio entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = coordinateRatioService.get(id);
		}
		if (entity == null){
			entity = new CoordinateRatio();
		}
		return entity;
	}
	
	@RequiresPermissions("produces:coordinateRatio:view")
	@RequestMapping(value = {"list", ""})
	public String list(CoordinateRatio coordinateRatio, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CoordinateRatio> page = coordinateRatioService.findPage(new Page<CoordinateRatio>(request, response), coordinateRatio); 
		model.addAttribute("page", page);
		return "modules/produces/coordinateRatioList";
	}

	@RequiresPermissions("produces:coordinateRatio:view")
	@RequestMapping(value = "form")
	public String form(CoordinateRatio coordinateRatio, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("coordinateRatio", coordinateRatio);
		return "modules/produces/coordinateRatioForm";
	}

	@RequiresPermissions("produces:coordinateRatio:edit")
	@RequestMapping(value = "save")
	public String save(CoordinateRatio coordinateRatio, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, coordinateRatio)){
			return form(coordinateRatio, model);
		}
		coordinateRatioService.save(coordinateRatio);
		addMessage(redirectAttributes, "保存配合比系列表成功");
		return "redirect:"+Global.getAdminPath()+"/produces/coordinateRatio/?repage";
	}
	
	@RequiresPermissions("produces:coordinateRatio:edit")
	@RequestMapping(value = "delete")
	public String delete(CoordinateRatio coordinateRatio, RedirectAttributes redirectAttributes) {
		coordinateRatioService.delete(coordinateRatio);
		addMessage(redirectAttributes, "删除配合比系列表成功");
		return "redirect:"+Global.getAdminPath()+"/produces/coordinateRatio/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "selNotice")
	public List<Map<String, Object>> selNotice(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		CoordinateRatio coordinateRatio = new CoordinateRatio();
		List<CoordinateRatio> list = coordinateRatioService.selNotice(coordinateRatio);
		for (int i=0; i<list.size(); i++){
			CoordinateRatio e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getRatioCode()+"["+e.getKindName()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
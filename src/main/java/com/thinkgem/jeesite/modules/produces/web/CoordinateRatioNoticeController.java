/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
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
import com.thinkgem.jeesite.modules.produces.entity.CoordinateRatioNotice;
import com.thinkgem.jeesite.modules.produces.service.CoordinateRatioNoticeService;

/**
 * 配合比通知单Controller
 * @author spark
 * @version 2018-01-21
 */
@Controller
@RequestMapping(value = "${adminPath}/produces/coordinateRatioNotice")
public class CoordinateRatioNoticeController extends BaseController {

	@Autowired
	private CoordinateRatioNoticeService coordinateRatioNoticeService;
	
	@ModelAttribute
	public CoordinateRatioNotice get(@RequestParam(required=false) String id) {
		CoordinateRatioNotice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = coordinateRatioNoticeService.get(id);
		}
		if (entity == null){
			entity = new CoordinateRatioNotice();
		}
		return entity;
	}
	
	@RequiresPermissions("produces:coordinateRatioNotice:view")
	@RequestMapping(value = {"list", ""})
	public String list(CoordinateRatioNotice coordinateRatioNotice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CoordinateRatioNotice> page = coordinateRatioNoticeService.findPage(new Page<CoordinateRatioNotice>(request, response), coordinateRatioNotice); 
		model.addAttribute("page", page);
		return "modules/produces/coordinateRatioNoticeList";
	}

	@RequiresPermissions("produces:coordinateRatioNotice:view")
	@RequestMapping(value = "form")
	public String form(CoordinateRatioNotice coordinateRatioNotice, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("coordinateRatioNotice", coordinateRatioNotice);
		return "modules/produces/coordinateRatioNoticeForm";
	}

	@RequiresPermissions("produces:coordinateRatioNotice:edit")
	@RequestMapping(value = "save")
	public String save(CoordinateRatioNotice coordinateRatioNotice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, coordinateRatioNotice)){
			return form(coordinateRatioNotice, model);
		}
		coordinateRatioNoticeService.save(coordinateRatioNotice);
		addMessage(redirectAttributes, "保存配合比通知单成功");
		return "redirect:"+Global.getAdminPath()+"/produces/coordinateRatioNotice/?repage";
	}
	
	@RequiresPermissions("produces:coordinateRatioNotice:edit")
	@RequestMapping(value = "delete")
	public String delete(CoordinateRatioNotice coordinateRatioNotice, RedirectAttributes redirectAttributes) {
		coordinateRatioNoticeService.delete(coordinateRatioNotice);
		addMessage(redirectAttributes, "删除配合比通知单成功");
		return "redirect:"+Global.getAdminPath()+"/produces/coordinateRatioNotice/?repage";
	}

}
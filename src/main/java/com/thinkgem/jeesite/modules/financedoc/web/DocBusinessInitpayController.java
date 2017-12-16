/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.web;

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
import com.thinkgem.jeesite.modules.financedoc.entity.DocBusinessInitpay;
import com.thinkgem.jeesite.modules.financedoc.service.DocBusinessInitpayService;

/**
 * 业务应付期初余额Controller
 * @author lisy
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/financedoc/docBusinessInitpay")
public class DocBusinessInitpayController extends BaseController {

	@Autowired
	private DocBusinessInitpayService docBusinessInitpayService;
	
	@ModelAttribute
	public DocBusinessInitpay get(@RequestParam(required=false) String id) {
		DocBusinessInitpay entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docBusinessInitpayService.get(id);
		}
		if (entity == null){
			entity = new DocBusinessInitpay();
		}
		return entity;
	}
	
	@RequiresPermissions("financedoc:docBusinessInitpay:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocBusinessInitpay docBusinessInitpay, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocBusinessInitpay> page = docBusinessInitpayService.findPage(new Page<DocBusinessInitpay>(request, response), docBusinessInitpay); 
		model.addAttribute("page", page);
		return "modules/financedoc/docBusinessInitpayList";
	}

	@RequiresPermissions("financedoc:docBusinessInitpay:view")
	@RequestMapping(value = "form")
	public String form(DocBusinessInitpay docBusinessInitpay, Model model) {
		model.addAttribute("docBusinessInitpay", docBusinessInitpay);
		return "modules/financedoc/docBusinessInitpayForm";
	}

	@RequiresPermissions("financedoc:docBusinessInitpay:edit")
	@RequestMapping(value = "save")
	public String save(DocBusinessInitpay docBusinessInitpay, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docBusinessInitpay)){
			return form(docBusinessInitpay, model);
		}
		docBusinessInitpayService.save(docBusinessInitpay);
		addMessage(redirectAttributes, "保存业务应付期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docBusinessInitpay/?repage";
	}
	
	@RequiresPermissions("financedoc:docBusinessInitpay:edit")
	@RequestMapping(value = "delete")
	public String delete(DocBusinessInitpay docBusinessInitpay, RedirectAttributes redirectAttributes) {
		docBusinessInitpayService.delete(docBusinessInitpay);
		addMessage(redirectAttributes, "删除业务应付期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docBusinessInitpay/?repage";
	}

}
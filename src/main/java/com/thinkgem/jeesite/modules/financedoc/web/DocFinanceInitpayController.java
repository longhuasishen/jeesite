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
import com.thinkgem.jeesite.modules.financedoc.entity.DocFinanceInitpay;
import com.thinkgem.jeesite.modules.financedoc.service.DocFinanceInitpayService;

/**
 * 财务应付期初余额表Controller
 * @author lisy
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/financedoc/docFinanceInitpay")
public class DocFinanceInitpayController extends BaseController {

	@Autowired
	private DocFinanceInitpayService docFinanceInitpayService;
	
	@ModelAttribute
	public DocFinanceInitpay get(@RequestParam(required=false) String id) {
		DocFinanceInitpay entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docFinanceInitpayService.get(id);
		}
		if (entity == null){
			entity = new DocFinanceInitpay();
		}
		return entity;
	}
	
	@RequiresPermissions("financedoc:docFinanceInitpay:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocFinanceInitpay docFinanceInitpay, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocFinanceInitpay> page = docFinanceInitpayService.findPage(new Page<DocFinanceInitpay>(request, response), docFinanceInitpay); 
		model.addAttribute("page", page);
		return "modules/financedoc/docFinanceInitpayList";
	}

	@RequiresPermissions("financedoc:docFinanceInitpay:view")
	@RequestMapping(value = "form")
	public String form(DocFinanceInitpay docFinanceInitpay, Model model) {
		model.addAttribute("docFinanceInitpay", docFinanceInitpay);
		return "modules/financedoc/docFinanceInitpayForm";
	}

	@RequiresPermissions("financedoc:docFinanceInitpay:edit")
	@RequestMapping(value = "save")
	public String save(DocFinanceInitpay docFinanceInitpay, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docFinanceInitpay)){
			return form(docFinanceInitpay, model);
		}
		docFinanceInitpayService.save(docFinanceInitpay);
		addMessage(redirectAttributes, "保存财务应付期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docFinanceInitpay/?repage";
	}
	
	@RequiresPermissions("financedoc:docFinanceInitpay:edit")
	@RequestMapping(value = "delete")
	public String delete(DocFinanceInitpay docFinanceInitpay, RedirectAttributes redirectAttributes) {
		docFinanceInitpayService.delete(docFinanceInitpay);
		addMessage(redirectAttributes, "删除财务应付期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docFinanceInitpay/?repage";
	}

}
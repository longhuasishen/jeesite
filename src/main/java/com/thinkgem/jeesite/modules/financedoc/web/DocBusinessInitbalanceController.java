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
import com.thinkgem.jeesite.modules.financedoc.entity.DocBusinessInitbalance;
import com.thinkgem.jeesite.modules.financedoc.service.DocBusinessInitbalanceService;

/**
 * 业务应收期初余额Controller
 * @author lisy
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/financedoc/docBusinessInitbalance")
public class DocBusinessInitbalanceController extends BaseController {

	@Autowired
	private DocBusinessInitbalanceService docBusinessInitbalanceService;
	
	@ModelAttribute
	public DocBusinessInitbalance get(@RequestParam(required=false) String id) {
		DocBusinessInitbalance entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docBusinessInitbalanceService.get(id);
		}
		if (entity == null){
			entity = new DocBusinessInitbalance();
		}
		return entity;
	}
	@ModelAttribute
	@RequestMapping(value = {"get"})
	public DocBusinessInitbalance getById(@RequestParam(required=false) String id) {
		DocBusinessInitbalance entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docBusinessInitbalanceService.get(id);
		}
		if (entity == null){
			entity = new DocBusinessInitbalance();
		}
		return entity;
	}
	
	@RequiresPermissions("financedoc:docBusinessInitbalance:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocBusinessInitbalance docBusinessInitbalance, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocBusinessInitbalance> page = docBusinessInitbalanceService.findPage(new Page<DocBusinessInitbalance>(request, response), docBusinessInitbalance); 
		model.addAttribute("page", page);
		return "modules/financedoc/docBusinessInitbalanceList";
	}

	@RequiresPermissions("financedoc:docBusinessInitbalance:view")
	@RequestMapping(value = "form")
	public String form(DocBusinessInitbalance docBusinessInitbalance, Model model) {
		model.addAttribute("docBusinessInitbalance", docBusinessInitbalance);
		return "modules/financedoc/docBusinessInitbalanceForm";
	}

	@RequiresPermissions("financedoc:docBusinessInitbalance:edit")
	@RequestMapping(value = "save")
	public String save(DocBusinessInitbalance docBusinessInitbalance, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docBusinessInitbalance)){
			return form(docBusinessInitbalance, model);
		}
		docBusinessInitbalanceService.save(docBusinessInitbalance);
		addMessage(redirectAttributes, "保存业务应收期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docBusinessInitbalance/?repage";
	}
	
	@RequiresPermissions("financedoc:docBusinessInitbalance:edit")
	@RequestMapping(value = "delete")
	public String delete(DocBusinessInitbalance docBusinessInitbalance, RedirectAttributes redirectAttributes) {
		docBusinessInitbalanceService.delete(docBusinessInitbalance);
		addMessage(redirectAttributes, "删除业务应收期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docBusinessInitbalance/?repage";
	}

}
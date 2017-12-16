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
import com.thinkgem.jeesite.modules.financedoc.entity.DocFinanceInitbalance;
import com.thinkgem.jeesite.modules.financedoc.service.DocFinanceInitbalanceService;

/**
 * 财务应收期初余额Controller
 * @author lisy
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/financedoc/docFinanceInitbalance")
public class DocFinanceInitbalanceController extends BaseController {

	@Autowired
	private DocFinanceInitbalanceService docFinanceInitbalanceService;
	
	@ModelAttribute
	public DocFinanceInitbalance get(@RequestParam(required=false) String id) {
		DocFinanceInitbalance entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docFinanceInitbalanceService.get(id);
		}
		if (entity == null){
			entity = new DocFinanceInitbalance();
		}
		return entity;
	}
	
	@RequiresPermissions("financedoc:docFinanceInitbalance:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocFinanceInitbalance docFinanceInitbalance, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocFinanceInitbalance> page = docFinanceInitbalanceService.findPage(new Page<DocFinanceInitbalance>(request, response), docFinanceInitbalance); 
		model.addAttribute("page", page);
		return "modules/financedoc/docFinanceInitbalanceList";
	}

	@RequiresPermissions("financedoc:docFinanceInitbalance:view")
	@RequestMapping(value = "form")
	public String form(DocFinanceInitbalance docFinanceInitbalance, Model model) {
		model.addAttribute("docFinanceInitbalance", docFinanceInitbalance);
		return "modules/financedoc/docFinanceInitbalanceForm";
	}

	@RequiresPermissions("financedoc:docFinanceInitbalance:edit")
	@RequestMapping(value = "save")
	public String save(DocFinanceInitbalance docFinanceInitbalance, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docFinanceInitbalance)){
			return form(docFinanceInitbalance, model);
		}
		docFinanceInitbalanceService.save(docFinanceInitbalance);
		addMessage(redirectAttributes, "保存财务应收期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docFinanceInitbalance/?repage";
	}
	
	@RequiresPermissions("financedoc:docFinanceInitbalance:edit")
	@RequestMapping(value = "delete")
	public String delete(DocFinanceInitbalance docFinanceInitbalance, RedirectAttributes redirectAttributes) {
		docFinanceInitbalanceService.delete(docFinanceInitbalance);
		addMessage(redirectAttributes, "删除财务应收期初余额成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docFinanceInitbalance/?repage";
	}

}
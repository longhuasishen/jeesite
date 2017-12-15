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
import com.thinkgem.jeesite.modules.doc.entity.DocPump;
import com.thinkgem.jeesite.modules.doc.service.DocPumpService;

/**
 * 泵档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docPump")
public class DocPumpController extends BaseController {

	@Autowired
	private DocPumpService docPumpService;
	
	@ModelAttribute
	public DocPump get(@RequestParam(required=false) String id) {
		DocPump entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docPumpService.get(id);
		}
		if (entity == null){
			entity = new DocPump();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docPump:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocPump docPump, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocPump> page = docPumpService.findPage(new Page<DocPump>(request, response), docPump); 
		model.addAttribute("page", page);
		return "modules/doc/docPumpList";
	}

	@RequiresPermissions("doc:docPump:view")
	@RequestMapping(value = "form")
	public String form(DocPump docPump, Model model) {
		model.addAttribute("docPump", docPump);
		return "modules/doc/docPumpForm";
	}

	@RequiresPermissions("doc:docPump:edit")
	@RequestMapping(value = "save")
	public String save(DocPump docPump, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docPump)){
			return form(docPump, model);
		}
		docPumpService.save(docPump);
		addMessage(redirectAttributes, "保存泵档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docPump/?repage";
	}
	
	@RequiresPermissions("doc:docPump:edit")
	@RequestMapping(value = "delete")
	public String delete(DocPump docPump, RedirectAttributes redirectAttributes) {
		docPumpService.delete(docPump);
		addMessage(redirectAttributes, "删除泵档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docPump/?repage";
	}

}
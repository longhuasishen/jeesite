/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.gen.entity.GenTable;
import com.thinkgem.jeesite.modules.gen.service.GenTableService;
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
import com.thinkgem.jeesite.modules.doc.entity.DocStationinfo;
import com.thinkgem.jeesite.modules.doc.service.DocStationinfoService;

/**
 * 搅拌站点信息Controller
 * @author lisy
 * @version 2017-12-17
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docStationinfo")
public class DocStationinfoController extends BaseController {

	@Autowired
	private DocStationinfoService docStationinfoService;
	@Autowired
	private GenTableService genTableService;
	
	@ModelAttribute
	public DocStationinfo get(@RequestParam(required=false) String id) {
		DocStationinfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docStationinfoService.get(id);
		}
		if (entity == null){
			entity = new DocStationinfo();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docStationinfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocStationinfo docStationinfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocStationinfo> page = docStationinfoService.findPage(new Page<DocStationinfo>(request, response), docStationinfo); 
		model.addAttribute("page", page);
		return "modules/doc/docStationinfoList";
	}

	@RequiresPermissions("doc:docStationinfo:view")
	@RequestMapping(value = "form")
	public String form(DocStationinfo docStationinfo, Model model) {
		model.addAttribute("docStationinfo", docStationinfo);
		return "modules/doc/docStationinfoForm";
	}
	@RequiresPermissions("doc:docStationinfo:view")
	@RequestMapping(value = "formDetail")
	public String formDetail(DocStationinfo docStationinfo, Model model) {
		model.addAttribute("docStationinfo", docStationinfo);
		GenTable genTable = new GenTable();
		genTable.setName("doc_stationinfo");
		genTable = genTableService.getTableFormDb(genTable);
		model.addAttribute("genTable", genTable);
		return "modules/doc/docStationinfoFormDetail";
	}

	@RequiresPermissions("doc:docStationinfo:edit")
	@RequestMapping(value = "save")
	public String save(DocStationinfo docStationinfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docStationinfo)){
			return form(docStationinfo, model);
		}
		docStationinfoService.save(docStationinfo);
		addMessage(redirectAttributes, "保存搅拌站点信息成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docStationinfo/?repage";
	}
	
	@RequiresPermissions("doc:docStationinfo:edit")
	@RequestMapping(value = "delete")
	public String delete(DocStationinfo docStationinfo, RedirectAttributes redirectAttributes) {
		docStationinfoService.delete(docStationinfo);
		addMessage(redirectAttributes, "删除搅拌站点信息成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docStationinfo/?repage";
	}


}
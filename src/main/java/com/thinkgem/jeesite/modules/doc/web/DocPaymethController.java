/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
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
import com.thinkgem.jeesite.modules.doc.entity.DocPaymeth;
import com.thinkgem.jeesite.modules.doc.service.DocPaymethService;

import java.util.List;
import java.util.Map;

/**
 * 支付方式档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docPaymeth")
public class DocPaymethController extends BaseController {

	@Autowired
	private DocPaymethService docPaymethService;
	
	@ModelAttribute
	public DocPaymeth get(@RequestParam(required=false) String id) {
		DocPaymeth entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docPaymethService.get(id);
		}
		if (entity == null){
			entity = new DocPaymeth();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docPaymeth:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocPaymeth docPaymeth, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocPaymeth> page = docPaymethService.findPage(new Page<DocPaymeth>(request, response), docPaymeth); 
		model.addAttribute("page", page);
		return "modules/doc/docPaymethList";
	}

	@RequiresPermissions("doc:docPaymeth:view")
	@RequestMapping(value = "form")
	public String form(DocPaymeth docPaymeth, Model model) {
		model.addAttribute("docPaymeth", docPaymeth);
		return "modules/doc/docPaymethForm";
	}

	@RequiresPermissions("doc:docPaymeth:edit")
	@RequestMapping(value = "save")
	public String save(DocPaymeth docPaymeth, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docPaymeth)){
			return form(docPaymeth, model);
		}
		docPaymethService.save(docPaymeth);
		addMessage(redirectAttributes, "保存支付方式档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docPaymeth/?repage";
	}
	
	@RequiresPermissions("doc:docPaymeth:edit")
	@RequestMapping(value = "delete")
	public String delete(DocPaymeth docPaymeth, RedirectAttributes redirectAttributes) {
		docPaymethService.delete(docPaymeth);
		addMessage(redirectAttributes, "删除支付方式档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docPaymeth/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocPaymeth docPaymeth = new DocPaymeth();
		List<DocPaymeth> list = docPaymethService.treeData(docPaymeth);
		for (int i=0; i<list.size(); i++){
			DocPaymeth e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getPaymethName()+"["+e.getPaymethCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
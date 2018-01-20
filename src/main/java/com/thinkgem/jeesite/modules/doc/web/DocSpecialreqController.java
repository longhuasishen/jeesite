/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
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
import com.thinkgem.jeesite.modules.doc.entity.DocSpecialreq;
import com.thinkgem.jeesite.modules.doc.service.DocSpecialreqService;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 特殊要求档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docSpecialreq")
public class DocSpecialreqController extends BaseController {

	@Autowired
	private DocSpecialreqService docSpecialreqService;
	
	@ModelAttribute
	public DocSpecialreq get(@RequestParam(required=false) String id) {
		DocSpecialreq entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docSpecialreqService.get(id);
		}
		if (entity == null){
			entity = new DocSpecialreq();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docSpecialreq:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocSpecialreq docSpecialreq, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocSpecialreq> page = docSpecialreqService.findPage(new Page<DocSpecialreq>(request, response), docSpecialreq); 
		model.addAttribute("page", page);
		return "modules/doc/docSpecialreqList";
	}

	@RequestMapping(value = {"listFrame"})
	public String listFrame(DocSpecialreq docSpecialreq, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocSpecialreq> page = docSpecialreqService.findPage(new Page<DocSpecialreq>(request, response), docSpecialreq);
		model.addAttribute("page", page);
		return "modules/doc/docSpecialreqListFrame";
	}

	@RequiresPermissions("doc:docSpecialreq:view")
	@RequestMapping(value = "form")
	public String form(DocSpecialreq docSpecialreq, Model model) {
		model.addAttribute("docSpecialreq", docSpecialreq);
		return "modules/doc/docSpecialreqForm";
	}

	@RequiresPermissions("doc:docSpecialreq:edit")
	@RequestMapping(value = "save")
	public String save(DocSpecialreq docSpecialreq, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docSpecialreq)){
			return form(docSpecialreq, model);
		}
		docSpecialreqService.save(docSpecialreq);
		addMessage(redirectAttributes, "保存特殊要求档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docSpecialreq/?repage";
	}
	
	@RequiresPermissions("doc:docSpecialreq:edit")
	@RequestMapping(value = "delete")
	public String delete(DocSpecialreq docSpecialreq, RedirectAttributes redirectAttributes) {
		docSpecialreqService.delete(docSpecialreq);
		addMessage(redirectAttributes, "删除特殊要求档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docSpecialreq/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "listJson")
	public List<DocSpecialreq> listJson(HttpServletRequest request, HttpServletResponse response) {
		DocSpecialreq docSpecialreq = new DocSpecialreq();
		List<DocSpecialreq> list = Arrays.asList();
		Page<DocSpecialreq> page = docSpecialreqService.findPage(new Page<DocSpecialreq>(request, response), docSpecialreq);
		list = page.getList();
		return list;
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocSpecialreq docSpecialreq = new DocSpecialreq();
		List<DocSpecialreq> list = docSpecialreqService.treeData(docSpecialreq);
		for (int i=0; i<list.size(); i++){
			DocSpecialreq e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getSpecialreqName()+"["+e.getSpecialreqCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.doc.entity.DocAccmeth;
import com.thinkgem.jeesite.modules.doc.service.DocAccmethService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 结算方式档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docAccmeth")
public class DocAccmethController extends BaseController {

	@Autowired
	private DocAccmethService docAccmethService;
	
	@ModelAttribute
	public DocAccmeth get(@RequestParam(required=false) String id) {
		DocAccmeth entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docAccmethService.get(id);
		}
		if (entity == null){
			entity = new DocAccmeth();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docAccmeth:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocAccmeth docAccmeth, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocAccmeth> page = docAccmethService.findPage(new Page<DocAccmeth>(request, response), docAccmeth); 
		model.addAttribute("page", page);
		return "modules/doc/docAccmethList";
	}

	@RequiresPermissions("doc:docAccmeth:view")
	@RequestMapping(value = "form")
	public String form(DocAccmeth docAccmeth, Model model) {
		model.addAttribute("docAccmeth", docAccmeth);
		return "modules/doc/docAccmethForm";
	}

	@RequiresPermissions("doc:docAccmeth:edit")
	@RequestMapping(value = "save")
	public String save(DocAccmeth docAccmeth, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docAccmeth)){
			return form(docAccmeth, model);
		}
		docAccmethService.save(docAccmeth);
		addMessage(redirectAttributes, "保存结算方式档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docAccmeth/?repage";
	}
	
	@RequiresPermissions("doc:docAccmeth:edit")
	@RequestMapping(value = "delete")
	public String delete(DocAccmeth docAccmeth, RedirectAttributes redirectAttributes) {
		docAccmethService.delete(docAccmeth);
		addMessage(redirectAttributes, "删除结算方式档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docAccmeth/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocAccmeth docAccmeth = new DocAccmeth();
		List<DocAccmeth> list = docAccmethService.findList(docAccmeth);
		for (int i=0; i<list.size(); i++){
			DocAccmeth e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getAccmethCode());
			map.put("name", e.getAccmethName()+"["+e.getAccmethCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
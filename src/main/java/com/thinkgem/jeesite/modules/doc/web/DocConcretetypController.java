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
import com.thinkgem.jeesite.modules.doc.entity.DocConcretetyp;
import com.thinkgem.jeesite.modules.doc.service.DocConcretetypService;

import java.util.List;
import java.util.Map;

/**
 * 原材料类型档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docConcretetyp")
public class DocConcretetypController extends BaseController {

	@Autowired
	private DocConcretetypService docConcretetypService;
	
	@ModelAttribute
	public DocConcretetyp get(@RequestParam(required=false) String id) {
		DocConcretetyp entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docConcretetypService.get(id);
		}
		if (entity == null){
			entity = new DocConcretetyp();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docConcretetyp:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocConcretetyp docConcretetyp, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocConcretetyp> page = docConcretetypService.findPage(new Page<DocConcretetyp>(request, response), docConcretetyp); 
		model.addAttribute("page", page);
		return "modules/doc/docConcretetypList";
	}

	@RequiresPermissions("doc:docConcretetyp:view")
	@RequestMapping(value = "form")
	public String form(DocConcretetyp docConcretetyp, Model model) {
		model.addAttribute("docConcretetyp", docConcretetyp);
		return "modules/doc/docConcretetypForm";
	}

	@RequiresPermissions("doc:docConcretetyp:edit")
	@RequestMapping(value = "save")
	public String save(DocConcretetyp docConcretetyp, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docConcretetyp)){
			return form(docConcretetyp, model);
		}
		docConcretetypService.save(docConcretetyp);
		addMessage(redirectAttributes, "保存原材料类型档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docConcretetyp/?repage";
	}
	
	@RequiresPermissions("doc:docConcretetyp:edit")
	@RequestMapping(value = "delete")
	public String delete(DocConcretetyp docConcretetyp, RedirectAttributes redirectAttributes) {
		docConcretetypService.delete(docConcretetyp);
		addMessage(redirectAttributes, "删除原材料类型档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docConcretetyp/?repage";
	}
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String materialCode, HttpServletResponse response) {
		String materialCodeFirst = materialCode.substring(0,1);
		String s[] ;
		if (materialCodeFirst.equals("0")){
			//0表示数字
		}else if (materialCodeFirst.equals("1")){
			//1表示字母
		}
		if (materialCodeFirst.contains("|")){
			//如果包含竖线，表示in
			s = materialCode.split("|");
		}

		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocConcretetyp am = new DocConcretetyp();
		am.setConcretetypCode(materialCode);
		List<DocConcretetyp> list = docConcretetypService.findList(am);
		for (int i=0; i<list.size(); i++){
			DocConcretetyp e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getConcretetypName());
			map.put("code", e.getConcretetypCode());

			mapList.add(map);
		}
		return mapList;
	}
}
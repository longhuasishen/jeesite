/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.doc.entity.DocDriver;
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
import com.thinkgem.jeesite.modules.doc.entity.DocCar;
import com.thinkgem.jeesite.modules.doc.service.DocCarService;

import java.util.List;
import java.util.Map;

/**
 * 车辆档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docCar")
public class DocCarController extends BaseController {

	@Autowired
	private DocCarService docCarService;
	
	@ModelAttribute
	public DocCar get(@RequestParam(required=false) String id) {
		DocCar entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docCarService.get(id);
		}
		if (entity == null){
			entity = new DocCar();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docCar:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocCar docCar, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocCar> page = docCarService.findPage(new Page<DocCar>(request, response), docCar); 
		model.addAttribute("page", page);
		return "modules/doc/docCarList";
	}

	@RequiresPermissions("doc:docCar:view")
	@RequestMapping(value = "form")
	public String form(DocCar docCar, Model model) {
		List<String> childCarList1 = Lists.newArrayList();
		if (StringUtils.isNotBlank(docCar.getIsMixing()) && "是".equals(docCar.getIsMixing())){
			childCarList1.add("1");
		}
		if (StringUtils.isNotBlank(docCar.getIsPump()) && "是".equals(docCar.getIsPump())){
			childCarList1.add("2");
		}
		if (StringUtils.isNotBlank(docCar.getIsOther()) && "是".equals(docCar.getIsOther())){
			childCarList1.add("3");
		}
		docCar.setChildCarList1(childCarList1);

		model.addAttribute("docCar", docCar);
		return "modules/doc/docCarForm";
	}

	@RequiresPermissions("doc:docCar:edit")
	@RequestMapping(value = "save")
	public String save(DocCar docCar, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docCar)){
			return form(docCar, model);
		}
		if(docCar.getChildCarList1()!=null){
			for(String id : docCar.getChildCarList1()){
				if("1".equals(id)){
					docCar.setIsMixing("是");
				}else if("2".equals(id)){
					docCar.setIsPump("是");
				}else if("3".equals(id)){
					docCar.setIsOther("是");
				}
			}
		}
		docCarService.save(docCar);
		addMessage(redirectAttributes, "保存车辆档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docCar/?repage";
	}
	
	@RequiresPermissions("doc:docCar:edit")
	@RequestMapping(value = "delete")
	public String delete(DocCar docCar, RedirectAttributes redirectAttributes) {
		docCarService.delete(docCar);
		addMessage(redirectAttributes, "删除车辆档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docCar/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocCar docCar = new DocCar();
		List<DocCar> list = docCarService.findList(docCar);
		for (int i=0; i<list.size(); i++){
			DocCar e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getCarNo()+"["+e.getCarCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

	@ResponseBody
	@RequestMapping(value = "treeDataPump")
	public List<Map<String, Object>> treeDataPump(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		DocCar docCar = new DocCar();
		List<DocCar> list = docCarService.findList(docCar);
		for (int i=0; i<list.size(); i++){
			DocCar e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getCarCode()+"["+e.getCarTypename()+"]");
			map.put("code", e.getCarCode());

			mapList.add(map);
		}
		return mapList;
	}

}
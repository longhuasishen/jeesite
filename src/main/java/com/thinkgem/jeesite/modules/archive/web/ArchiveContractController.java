/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;
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
import com.thinkgem.jeesite.modules.archive.entity.ArchiveContract;
import com.thinkgem.jeesite.modules.archive.service.ArchiveContractService;

import java.util.List;
import java.util.Map;

/**
 * 合同分类Controller
 * @author lisy
 * @version 2017-12-14
 */
@Controller
@RequestMapping(value = "${adminPath}/archive/archiveContract")
public class ArchiveContractController extends BaseController {

	@Autowired
	private ArchiveContractService archiveContractService;
	
	@ModelAttribute
	public ArchiveContract get(@RequestParam(required=false) String id) {
		ArchiveContract entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = archiveContractService.get(id);
		}
		if (entity == null){
			entity = new ArchiveContract();
		}
		return entity;
	}
	
	@RequiresPermissions("archive:archiveContract:view")
	@RequestMapping(value = {"list", ""})
	public String list(ArchiveContract archiveContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ArchiveContract> page = archiveContractService.findPage(new Page<ArchiveContract>(request, response), archiveContract); 
		model.addAttribute("page", page);
		return "modules/archive/archiveContractList";
	}

	@RequiresPermissions("archive:archiveContract:view")
	@RequestMapping(value = "form")
	public String form(ArchiveContract archiveContract, Model model) {
		model.addAttribute("archiveContract", archiveContract);
		return "modules/archive/archiveContractForm";
	}

	@RequiresPermissions("archive:archiveContract:edit")
	@RequestMapping(value = "save")
	public String save(ArchiveContract archiveContract, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, archiveContract)){
			return form(archiveContract, model);
		}
		archiveContractService.save(archiveContract);
		addMessage(redirectAttributes, "保存合同分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveContract/?repage";
	}
	
	@RequiresPermissions("archive:archiveContract:edit")
	@RequestMapping(value = "delete")
	public String delete(ArchiveContract archiveContract, RedirectAttributes redirectAttributes) {
		archiveContractService.delete(archiveContract);
		addMessage(redirectAttributes, "删除合同分类成功");
		return "redirect:"+Global.getAdminPath()+"/archive/archiveContract/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ArchiveContract archiveContract = new ArchiveContract();
		List<ArchiveContract> list = archiveContractService.findList(archiveContract);
		for (int i=0; i<list.size(); i++){
			ArchiveContract e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getContractName()+"["+e.getContractCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}
	@ResponseBody
	@RequestMapping(value = "treeData2")
	public List<Map<String, Object>> treeData2(HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ArchiveContract archiveContract = new ArchiveContract();
		List<ArchiveContract> list = archiveContractService.findList(archiveContract);
		for (int i=0; i<list.size(); i++){
			ArchiveContract e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getContractCode());
			map.put("name", e.getContractName()+"["+e.getContractCode()+"]");

			mapList.add(map);
		}
		return mapList;
	}

}
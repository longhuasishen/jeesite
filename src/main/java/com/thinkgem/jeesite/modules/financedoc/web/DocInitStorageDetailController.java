/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageDetail;
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
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageDetail;
import com.thinkgem.jeesite.modules.financedoc.service.DocInitStorageDetailService;

import java.util.Arrays;
import java.util.List;

/**
 * 期初入库Controller
 * @author lisy
 * @version 2018-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/financedoc/docInitStorageDetail")
public class DocInitStorageDetailController extends BaseController {

	@Autowired
	private DocInitStorageDetailService docInitStorageDetailService;
	
	@ModelAttribute
	public DocInitStorageDetail get(@RequestParam(required=false) String id) {
		DocInitStorageDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docInitStorageDetailService.get(id);
		}
		if (entity == null){
			entity = new DocInitStorageDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("financedoc:docInitStorageDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocInitStorageDetail docInitStorageDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocInitStorageDetail> page = docInitStorageDetailService.findPage(new Page<DocInitStorageDetail>(request, response), docInitStorageDetail); 
		model.addAttribute("page", page);
		return "modules/financedoc/docInitStorageDetailList";
	}
	@RequestMapping(value = {"listJson"})
	@ResponseBody
	public List<DocInitStorageDetail> listJson(String storageCode, HttpServletRequest request, HttpServletResponse response) {
		DocInitStorageDetail docInitStorageDetail = new DocInitStorageDetail();
		List<DocInitStorageDetail> list = Arrays.asList();
		if(StringUtils.isNotEmpty(storageCode)) {
			docInitStorageDetail.setStorageCode(storageCode);
			Page<DocInitStorageDetail> page = docInitStorageDetailService.findPage(new Page<DocInitStorageDetail>(request, response), docInitStorageDetail);
			list = page.getList();
		}
		return list;
	}

	@RequiresPermissions("financedoc:docInitStorageDetail:view")
	@RequestMapping(value = "form")
	public String form(DocInitStorageDetail docInitStorageDetail, Model model) {
		model.addAttribute("docInitStorageDetail", docInitStorageDetail);
		return "modules/financedoc/docInitStorageDetailForm";
	}

	@RequiresPermissions("financedoc:docInitStorageDetail:edit")
	@RequestMapping(value = "save")
	public String save(DocInitStorageDetail docInitStorageDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docInitStorageDetail)){
			return form(docInitStorageDetail, model);
		}
		docInitStorageDetailService.save(docInitStorageDetail);
		addMessage(redirectAttributes, "保存期初入库成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docInitStorageDetail/?repage";
	}
	
	@RequiresPermissions("financedoc:docInitStorageDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(DocInitStorageDetail docInitStorageDetail, RedirectAttributes redirectAttributes) {
		docInitStorageDetailService.delete(docInitStorageDetail);
		addMessage(redirectAttributes, "删除期初入库成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docInitStorageDetail/?repage";
	}

}
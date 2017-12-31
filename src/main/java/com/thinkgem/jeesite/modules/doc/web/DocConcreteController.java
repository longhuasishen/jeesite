/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveMaterial;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.thinkgem.jeesite.modules.doc.entity.DocConcrete;
import com.thinkgem.jeesite.modules.doc.service.DocConcreteService;

import java.util.List;
import java.util.Map;

/**
 * 原材料档案Controller
 * @author spark
 * @version 2017-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docConcrete")
public class DocConcreteController extends BaseController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private DocConcreteService docConcreteService;
	
	@ModelAttribute
	public DocConcrete get(@RequestParam(required=false) String id) {
		DocConcrete entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docConcreteService.get(id);
		}
		if (entity == null){
			entity = new DocConcrete();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docConcrete:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocConcrete docConcrete, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocConcrete> page = docConcreteService.findPage(new Page<DocConcrete>(request, response), docConcrete); 
		model.addAttribute("page", page);
		return "modules/doc/docConcreteList";
	}

	@RequiresPermissions("doc:docConcrete:view")
	@RequestMapping(value = "form")
	public String form(DocConcrete docConcrete, Model model) {
		List<String> childConcreteList1 = Lists.newArrayList();
		List<String> childConcreteList2 = Lists.newArrayList();
		if (StringUtils.isNotBlank(docConcrete.getSales()) && "是".equals(docConcrete.getSales())){
			childConcreteList1.add("1");
		}
		if (StringUtils.isNotBlank(docConcrete.getOutsourcing()) && "是".equals(docConcrete.getOutsourcing())){
			childConcreteList1.add("2");
		}
		if (StringUtils.isNotBlank(docConcrete.getMadSelf()) && "是".equals(docConcrete.getMadSelf())){
			childConcreteList1.add("3");
		}
		if (StringUtils.isNotBlank(docConcrete.getTaxService()) && "是".equals(docConcrete.getTaxService())){
			childConcreteList1.add("4");
		}
		if (StringUtils.isNotBlank(docConcrete.getCompSet()) && "是".equals(docConcrete.getCompSet())){
			childConcreteList1.add("5");
		}
		if (StringUtils.isNotBlank(docConcrete.getMortar()) && "是".equals(docConcrete.getMortar())){
			childConcreteList1.add("6");
		}
		docConcrete.setChildConcreteList1(childConcreteList1);

		if (StringUtils.isNotBlank(docConcrete.getQualityManage()) && "是".equals(docConcrete.getQualityManage())){
			childConcreteList2.add("1");
		}
		if (StringUtils.isNotBlank(docConcrete.getBatManage()) && "是".equals(docConcrete.getBatManage())){
			childConcreteList2.add("2");
		}
		if (StringUtils.isNotBlank(docConcrete.getEntrustManage()) && "是".equals(docConcrete.getEntrustManage())){
			childConcreteList2.add("3");
		}
		if (StringUtils.isNotBlank(docConcrete.getStockManage()) && "是".equals(docConcrete.getStockManage())){
			childConcreteList2.add("4");
		}
		docConcrete.setChildConcreteList2(childConcreteList2);

		model.addAttribute("docConcrete", docConcrete);
		return "modules/doc/docConcreteForm";
	}

	@RequiresPermissions("doc:docConcrete:edit")
	@RequestMapping(value = "save")
	public String save(DocConcrete docConcrete, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docConcrete)){
			return form(docConcrete, model);
		}

		if(docConcrete.getChildConcreteList1()!=null){
			for(String id : docConcrete.getChildConcreteList1()){
				if("1".equals(id)){
					docConcrete.setSales("是");
				}else if("2".equals(id)){
					docConcrete.setOutsourcing("是");
				}else if("3".equals(id)){
					docConcrete.setMadSelf("是");
				}else if("4".equals(id)){
					docConcrete.setTaxService("是");
				}else if("5".equals(id)){
					docConcrete.setCompSet("是");
				}else if("6".equals(id)){
					docConcrete.setMortar("是");
				}
			}
		}

		if(docConcrete.getChildConcreteList2()!=null){
			for(String id : docConcrete.getChildConcreteList2()){
				if("1".equals(id)){
					docConcrete.setQualityManage("是");
				}else if("2".equals(id)){
					docConcrete.setBatManage("是");
				}else if("3".equals(id)){
					docConcrete.setEntrustManage("是");
				}else if("4".equals(id)){
					docConcrete.setStockManage("是");
				}
			}
		}
		docConcreteService.save(docConcrete);
		addMessage(redirectAttributes, "保存原材料档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docConcrete/?repage";
	}
	
	@RequiresPermissions("doc:docConcrete:edit")
	@RequestMapping(value = "delete")
	public String delete(DocConcrete docConcrete, RedirectAttributes redirectAttributes) {
		docConcreteService.delete(docConcrete);
		addMessage(redirectAttributes, "删除原材料档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docConcrete/?repage";
	}

}
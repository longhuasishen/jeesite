/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
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
import com.thinkgem.jeesite.modules.doc.entity.DocBeton;
import com.thinkgem.jeesite.modules.doc.service.DocBetonService;

import java.util.Arrays;
import java.util.List;

/**
 * 混凝土档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docBeton")
public class DocBetonController extends BaseController {

	@Autowired
	private DocBetonService docBetonService;
	
	@ModelAttribute
	public DocBeton get(@RequestParam(required=false) String id) {
		DocBeton entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docBetonService.get(id);
		}
		if (entity == null){
			entity = new DocBeton();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docBeton:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocBeton docBeton, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocBeton> page = docBetonService.findPage(new Page<DocBeton>(request, response), docBeton); 
		model.addAttribute("page", page);
		return "modules/doc/docBetonList";
	}

	@RequiresPermissions("doc:docBeton:view")
	@RequestMapping(value = "form")
	public String form(DocBeton docBeton, Model model) {
		List<String> childBetonList1 = Lists.newArrayList();
		List<String> childBetonList2 = Lists.newArrayList();
		if (StringUtils.isNotBlank(docBeton.getSales()) && "是".equals(docBeton.getSales())){
			childBetonList1.add("1");
		}
		if (StringUtils.isNotBlank(docBeton.getOutsourcing()) && "是".equals(docBeton.getOutsourcing())){
			childBetonList1.add("2");
		}
		if (StringUtils.isNotBlank(docBeton.getMadSelf()) && "是".equals(docBeton.getMadSelf())){
			childBetonList1.add("3");
		}
		if (StringUtils.isNotBlank(docBeton.getTaxService()) && "是".equals(docBeton.getTaxService())){
			childBetonList1.add("4");
		}
		if (StringUtils.isNotBlank(docBeton.getCompSet()) && "是".equals(docBeton.getCompSet())){
			childBetonList1.add("5");
		}
		if (StringUtils.isNotBlank(docBeton.getMortar()) && "是".equals(docBeton.getMortar())){
			childBetonList1.add("6");
		}
		docBeton.setChildBetonList1(childBetonList1);

		if (StringUtils.isNotBlank(docBeton.getQualityManage()) && "是".equals(docBeton.getQualityManage())){
			childBetonList2.add("1");
		}
		if (StringUtils.isNotBlank(docBeton.getBatManage()) && "是".equals(docBeton.getBatManage())){
			childBetonList2.add("2");
		}
		if (StringUtils.isNotBlank(docBeton.getEntrustManage()) && "是".equals(docBeton.getEntrustManage())){
			childBetonList2.add("3");
		}
		if (StringUtils.isNotBlank(docBeton.getStockManage()) && "是".equals(docBeton.getStockManage())){
			childBetonList2.add("4");
		}
		docBeton.setChildBetonList2(childBetonList2);
		model.addAttribute("docBeton", docBeton);
		return "modules/doc/docBetonForm";
	}

	@RequiresPermissions("doc:docBeton:edit")
	@RequestMapping(value = "save")
	public String save(DocBeton docBeton, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docBeton)){
			return form(docBeton, model);
		}
		if(docBeton.getChildBetonList1()!=null){
			for(String id : docBeton.getChildBetonList1()){
				if("1".equals(id)){
					docBeton.setSales("是");
				}else if("2".equals(id)){
					docBeton.setOutsourcing("是");
				}else if("3".equals(id)){
					docBeton.setMadSelf("是");
				}else if("4".equals(id)){
					docBeton.setTaxService("是");
				}else if("5".equals(id)){
					docBeton.setCompSet("是");
				}else if("6".equals(id)){
					docBeton.setMortar("是");
				}
			}
		}

		if(docBeton.getChildBetonList2()!=null){
			for(String id : docBeton.getChildBetonList2()){
				if("1".equals(id)){
					docBeton.setQualityManage("是");
				}else if("2".equals(id)){
					docBeton.setBatManage("是");
				}else if("3".equals(id)){
					docBeton.setEntrustManage("是");
				}else if("4".equals(id)){
					docBeton.setStockManage("是");
				}
			}
		}
		docBetonService.save(docBeton);
		addMessage(redirectAttributes, "保存混凝土档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docBeton/?repage";
	}
	
	@RequiresPermissions("doc:docBeton:edit")
	@RequestMapping(value = "delete")
	public String delete(DocBeton docBeton, RedirectAttributes redirectAttributes) {
		docBetonService.delete(docBeton);
		addMessage(redirectAttributes, "删除混凝土档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docBeton/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "listJson")
	public List<DocBeton> listJson( HttpServletRequest request, HttpServletResponse response) {
		DocBeton docBeton = new DocBeton();
		List<DocBeton> list = Arrays.asList();
		Page<DocBeton> page = docBetonService.findPage(new Page<DocBeton>(request, response), docBeton);
		list = page.getList();
		return list;
	}

}
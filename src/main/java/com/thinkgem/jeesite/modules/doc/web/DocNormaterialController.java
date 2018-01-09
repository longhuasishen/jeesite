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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.doc.entity.DocNormaterial;
import com.thinkgem.jeesite.modules.doc.service.DocNormaterialService;

import java.util.List;

/**
 * 普通物资档案Controller
 * @author spark
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/doc/docNormaterial")
public class DocNormaterialController extends BaseController {

	@Autowired
	private DocNormaterialService docNormaterialService;
	
	@ModelAttribute
	public DocNormaterial get(@RequestParam(required=false) String id) {
		DocNormaterial entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docNormaterialService.get(id);
		}
		if (entity == null){
			entity = new DocNormaterial();
		}
		return entity;
	}
	
	@RequiresPermissions("doc:docNormaterial:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocNormaterial docNormaterial, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocNormaterial> page = docNormaterialService.findPage(new Page<DocNormaterial>(request, response), docNormaterial); 
		model.addAttribute("page", page);
		return "modules/doc/docNormaterialList";
	}

	@RequiresPermissions("doc:docNormaterial:view")
	@RequestMapping(value = "form")
	public String form(DocNormaterial docNormaterial, Model model) {
		List<String> childNormaterialList1 = Lists.newArrayList();
		List<String> childNormaterialList2 = Lists.newArrayList();
		if (StringUtils.isNotBlank(docNormaterial.getSales()) && "是".equals(docNormaterial.getSales())){
			childNormaterialList1.add("1");
		}
		if (StringUtils.isNotBlank(docNormaterial.getOutsourcing()) && "是".equals(docNormaterial.getOutsourcing())){
			childNormaterialList1.add("2");
		}
		if (StringUtils.isNotBlank(docNormaterial.getMadSelf()) && "是".equals(docNormaterial.getMadSelf())){
			childNormaterialList1.add("3");
		}
		if (StringUtils.isNotBlank(docNormaterial.getTaxService()) && "是".equals(docNormaterial.getTaxService())){
			childNormaterialList1.add("4");
		}
		if (StringUtils.isNotBlank(docNormaterial.getCompSet()) && "是".equals(docNormaterial.getCompSet())){
			childNormaterialList1.add("5");
		}
		if (StringUtils.isNotBlank(docNormaterial.getMortar()) && "是".equals(docNormaterial.getMortar())){
			childNormaterialList1.add("6");
		}
		docNormaterial.setChildNormaterialList1(childNormaterialList1);

		if (StringUtils.isNotBlank(docNormaterial.getQualityManage()) && "是".equals(docNormaterial.getQualityManage())){
			childNormaterialList2.add("1");
		}
		if (StringUtils.isNotBlank(docNormaterial.getBatManage()) && "是".equals(docNormaterial.getBatManage())){
			childNormaterialList2.add("2");
		}
		if (StringUtils.isNotBlank(docNormaterial.getEntrustManage()) && "是".equals(docNormaterial.getEntrustManage())){
			childNormaterialList2.add("3");
		}
		if (StringUtils.isNotBlank(docNormaterial.getStockManage()) && "是".equals(docNormaterial.getStockManage())){
			childNormaterialList2.add("4");
		}
		docNormaterial.setChildNormaterialList2(childNormaterialList2);
		model.addAttribute("docNormaterial", docNormaterial);
		return "modules/doc/docNormaterialForm";
	}

	@RequiresPermissions("doc:docNormaterial:edit")
	@RequestMapping(value = "save")
	public String save(DocNormaterial docNormaterial, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, docNormaterial)){
			return form(docNormaterial, model);
		}
		if(docNormaterial.getChildNormaterialList1()!=null){
			for(String id : docNormaterial.getChildNormaterialList1()){
				if("1".equals(id)){
					docNormaterial.setSales("是");
				}else if("2".equals(id)){
					docNormaterial.setOutsourcing("是");
				}else if("3".equals(id)){
					docNormaterial.setMadSelf("是");
				}else if("4".equals(id)){
					docNormaterial.setTaxService("是");
				}else if("5".equals(id)){
					docNormaterial.setCompSet("是");
				}else if("6".equals(id)){
					docNormaterial.setMortar("是");
				}
			}
		}

		if(docNormaterial.getChildNormaterialList2()!=null){
			for(String id : docNormaterial.getChildNormaterialList2()){
				if("1".equals(id)){
					docNormaterial.setQualityManage("是");
				}else if("2".equals(id)){
					docNormaterial.setBatManage("是");
				}else if("3".equals(id)){
					docNormaterial.setEntrustManage("是");
				}else if("4".equals(id)){
					docNormaterial.setStockManage("是");
				}
			}
		}
		docNormaterialService.save(docNormaterial);
		addMessage(redirectAttributes, "保存普通物资档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docNormaterial/?repage";
	}
	
	@RequiresPermissions("doc:docNormaterial:edit")
	@RequestMapping(value = "delete")
	public String delete(DocNormaterial docNormaterial, RedirectAttributes redirectAttributes) {
		docNormaterialService.delete(docNormaterial);
		addMessage(redirectAttributes, "删除普通物资档案成功");
		return "redirect:"+Global.getAdminPath()+"/doc/docNormaterial/?repage";
	}

}
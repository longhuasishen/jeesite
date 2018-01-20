/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
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
import com.thinkgem.jeesite.modules.produces.entity.ProduceDesign;
import com.thinkgem.jeesite.modules.produces.service.ProduceDesignService;

/**
 * 生产计划单Controller
 * @author spark
 * @version 2018-01-04
 */
@Controller
@RequestMapping(value = "${adminPath}/produces/produceDesign")
public class ProduceDesignController extends BaseController {

	@Autowired
	private ProduceDesignService produceDesignService;
	
	@ModelAttribute
	public ProduceDesign get(@RequestParam(required=false) String id) {
		ProduceDesign entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = produceDesignService.get(id);
		}
		if (entity == null){
			entity = new ProduceDesign();
		}
		return entity;
	}
	
	@RequiresPermissions("produces:produceDesign:view")
	@RequestMapping(value = {"list", ""})
	public String list(ProduceDesign produceDesign, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ProduceDesign> page = produceDesignService.findPage(new Page<ProduceDesign>(request, response), produceDesign); 
		model.addAttribute("page", page);
		return "modules/produces/produceDesignList";
	}

	@RequiresPermissions("produces:produceDesign:view")
	@RequestMapping(value = "form")
	public String form(ProduceDesign produceDesign, Model model) {
		model.addAttribute("produceDesign", produceDesign);
		model.addAttribute("user", UserUtils.getUser());
		return "modules/produces/produceDesignForm";
	}

	@RequiresPermissions("produces:produceDesign:edit")
	@RequestMapping(value = "save")
	public String save(ProduceDesign produceDesign, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, produceDesign)){
			return form(produceDesign, model);
		}
		produceDesignService.save(produceDesign);
		addMessage(redirectAttributes, "保存生产计划单成功");
		return "redirect:"+Global.getAdminPath()+"/produces/produceDesign/?repage";
	}
	
	@RequiresPermissions("produces:produceDesign:edit")
	@RequestMapping(value = "delete")
	public String delete(ProduceDesign produceDesign, RedirectAttributes redirectAttributes) {
		produceDesignService.delete(produceDesign);
		addMessage(redirectAttributes, "删除生产计划单成功");
		return "redirect:"+Global.getAdminPath()+"/produces/produceDesign/?repage";
	}

}
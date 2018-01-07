/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.stock.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.stock.entity.OutsourceOiling;
import com.thinkgem.jeesite.modules.stock.service.OutsourceOilingService;

/**
 * 外购加油登记Controller
 * @author spark
 * @version 2018-01-07
 */
@Controller
@RequestMapping(value = "${adminPath}/stock/outsourceOiling")
public class OutsourceOilingController extends BaseController {

	@Autowired
	private OutsourceOilingService outsourceOilingService;
	
	@ModelAttribute
	public OutsourceOiling get(@RequestParam(required=false) String id) {
		OutsourceOiling entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = outsourceOilingService.get(id);
		}
		if (entity == null){
			entity = new OutsourceOiling();
		}
		return entity;
	}
	
	@RequiresPermissions("stock:outsourceOiling:view")
	@RequestMapping(value = {"list", ""})
	public String list(OutsourceOiling outsourceOiling, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OutsourceOiling> page = outsourceOilingService.findPage(new Page<OutsourceOiling>(request, response), outsourceOiling); 
		model.addAttribute("page", page);
		return "modules/stock/outsourceOilingList";
	}

	@RequiresPermissions("stock:outsourceOiling:view")
	@RequestMapping(value = "form")
	public String form(OutsourceOiling outsourceOiling, Model model) {
		model.addAttribute("outsourceOiling", outsourceOiling);
		return "modules/stock/outsourceOilingForm";
	}

	@RequiresPermissions("stock:outsourceOiling:edit")
	@RequestMapping(value = "save")
	public String save(OutsourceOiling outsourceOiling, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, outsourceOiling)){
			return form(outsourceOiling, model);
		}
		outsourceOilingService.save(outsourceOiling);
		addMessage(redirectAttributes, "保存外购加油登记成功");
		return "redirect:"+Global.getAdminPath()+"/stock/outsourceOiling/?repage";
	}
	
	@RequiresPermissions("stock:outsourceOiling:edit")
	@RequestMapping(value = "delete")
	public String delete(OutsourceOiling outsourceOiling, RedirectAttributes redirectAttributes) {
		outsourceOilingService.delete(outsourceOiling);
		addMessage(redirectAttributes, "删除外购加油登记成功");
		return "redirect:"+Global.getAdminPath()+"/stock/outsourceOiling/?repage";
	}

}
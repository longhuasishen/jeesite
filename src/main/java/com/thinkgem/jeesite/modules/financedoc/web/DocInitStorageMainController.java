/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringEscapeUtils;
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
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageMain;
import com.thinkgem.jeesite.modules.financedoc.service.DocInitStorageMainService;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 期初入库Controller
 * @author lisy
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/financedoc/docInitStorageMain")
@Slf4j
public class DocInitStorageMainController extends BaseController {

	@Autowired
	private DocInitStorageMainService docInitStorageMainService;
	
	@ModelAttribute
	public DocInitStorageMain get(@RequestParam(required=false) String id) {
		DocInitStorageMain entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = docInitStorageMainService.get(id);
		}
		if (entity == null){
			entity = new DocInitStorageMain();
		}
		return entity;
	}
	
	@RequiresPermissions("financedoc:docInitStorageMain:view")
	@RequestMapping(value = {"list", ""})
	public String list(DocInitStorageMain docInitStorageMain, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DocInitStorageMain> page = docInitStorageMainService.findPage(new Page<DocInitStorageMain>(request, response), docInitStorageMain); 
		model.addAttribute("page", page);
		return "modules/financedoc/docInitStorageMainList";
	}

	@RequiresPermissions("financedoc:docInitStorageMain:view")
	@RequestMapping(value = "form")
	public String form(DocInitStorageMain docInitStorageMain, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("docInitStorageMain", docInitStorageMain);
		return "modules/financedoc/docInitStorageMainForm";
	}

	@RequiresPermissions("financedoc:docInitStorageMain:edit")
	@RequestMapping(value = "save")
	public String save(DocInitStorageMain docInitStorageMain, Model model, RedirectAttributes redirectAttributes,@RequestParam(value = "tableDatas",required = false) String tableDatas) throws IllegalAccessException {
		if (!beanValidator(model, docInitStorageMain)){
			return form(docInitStorageMain, model);
		}
		if(StringUtils.isEmpty(docInitStorageMain.getStorageCreateDate())){
			docInitStorageMain.setStorageCreateDate(DateUtils.formatDateTime(new Date()));
		}
		List<DocInitStorageDetail> detailList = new ArrayList<DocInitStorageDetail>();
		if (StringUtils.isNotEmpty(tableDatas)) {
			JSONArray detailArray = JSONArray.fromObject(StringEscapeUtils.unescapeHtml4(tableDatas));
			log.info("合同明细{}", detailArray);
			for (Object object : detailArray.toArray()) {
				DocInitStorageDetail detail = buildVO((JSONObject) object, DocInitStorageDetail.class);
				detail.setStorageCode(docInitStorageMain.getStorageCode());
				detailList.add(detail);
			}
		}
		docInitStorageMainService.saveAll(docInitStorageMain,detailList);
		addMessage(redirectAttributes, "保存期初入库成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docInitStorageMain/?repage";
	}
	private DocInitStorageDetail buildVO(JSONObject object, Class<DocInitStorageDetail> contractPurchaseDetailClass) throws IllegalAccessException {
		DocInitStorageDetail detail = new DocInitStorageDetail();
		Field[] fields = contractPurchaseDetailClass.getDeclaredFields();
		for(Field field : fields){
			String fieldName = field.getName();
			if(null != object.get(fieldName)){
				field.setAccessible(true);
				field.set(detail,object.get(fieldName));
			}
		}
		return detail;
	}
	
	@RequiresPermissions("financedoc:docInitStorageMain:edit")
	@RequestMapping(value = "delete")
	public String delete(DocInitStorageMain docInitStorageMain, RedirectAttributes redirectAttributes) {
		docInitStorageMainService.delete(docInitStorageMain);
		addMessage(redirectAttributes, "删除期初入库成功");
		return "redirect:"+Global.getAdminPath()+"/financedoc/docInitStorageMain/?repage";
	}

}
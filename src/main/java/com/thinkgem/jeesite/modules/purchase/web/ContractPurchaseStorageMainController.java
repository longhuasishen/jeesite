/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageMain;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseStorageDetailService;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseStorageMainService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * 采购入库Controller
 * @author lisy
 * @version 2018-01-14
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchaseStorageMain")
@Slf4j
public class ContractPurchaseStorageMainController extends BaseController {

	@Autowired
	private ContractPurchaseStorageMainService contractPurchaseStorageMainService;
	@Autowired
	private ContractPurchaseStorageDetailService detailServiceService;
	
	@ModelAttribute
	public ContractPurchaseStorageMain get(@RequestParam(required=false) String id) {
		ContractPurchaseStorageMain entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseStorageMainService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchaseStorageMain();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchaseStorageMain:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchaseStorageMain contractPurchaseStorageMain, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchaseStorageMain> page = contractPurchaseStorageMainService.findPage(new Page<ContractPurchaseStorageMain>(request, response), contractPurchaseStorageMain); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseStorageMainList";
	}

	@RequiresPermissions("purchase:contractPurchaseStorageMain:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchaseStorageMain contractPurchaseStorageMain, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("contractPurchaseStorageMain", contractPurchaseStorageMain);
		return "modules/purchase/contractPurchaseStorageMainForm";
	}

	@RequiresPermissions("purchase:contractPurchaseStorageMain:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchaseStorageMain contractPurchaseStorageMain, Model model, RedirectAttributes redirectAttributes, @RequestParam(value = "tableDatas",required = false) String tableDatas) throws IllegalAccessException {
		if (!beanValidator(model, contractPurchaseStorageMain)){
			return form(contractPurchaseStorageMain, model);
		}
		List<ContractPurchaseStorageDetail> detailList = new ArrayList<ContractPurchaseStorageDetail>();
		if (StringUtils.isNotEmpty(tableDatas)) {
			JSONArray detailArray = JSONArray.fromObject(StringEscapeUtils.unescapeHtml4(tableDatas));
			log.info("合同明细{}", detailArray);
			for (Object object : detailArray.toArray()) {
				ContractPurchaseStorageDetail detail = buildVO((JSONObject) object, ContractPurchaseStorageDetail.class);
				detail.setStorageCode(contractPurchaseStorageMain.getStorageCode());
				detailList.add(detail);
			}
//				contractPurchaseDetailService.saveList(detailList);
		}
		contractPurchaseStorageMainService.saveAll(contractPurchaseStorageMain,detailList);
		addMessage(redirectAttributes, "保存采购入库成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseStorageMain/?repage";
	}
	private ContractPurchaseStorageDetail buildVO(JSONObject object, Class<ContractPurchaseStorageDetail> contractPurchaseDetailClass) throws IllegalAccessException {
		ContractPurchaseStorageDetail detail = new ContractPurchaseStorageDetail();
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
	@RequiresPermissions("purchase:contractPurchaseStorageMain:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchaseStorageMain contractPurchaseStorageMain, RedirectAttributes redirectAttributes) {
		contractPurchaseStorageMainService.delete(contractPurchaseStorageMain);
		addMessage(redirectAttributes, "删除采购入库成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseStorageMain/?repage";
	}

}
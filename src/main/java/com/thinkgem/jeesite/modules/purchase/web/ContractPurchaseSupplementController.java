/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplementDetail;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseDetailService;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseSupplementDetailService;
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
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplement;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseSupplementService;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 采购合同补充协议Controller
 * @author lisy
 * @version 2018-01-13
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchaseSupplement")
@Slf4j
public class ContractPurchaseSupplementController extends BaseController {

	@Autowired
	private ContractPurchaseSupplementService contractPurchaseSupplementService;
	@Autowired
	private ContractPurchaseSupplementDetailService supplementDetailService;
	
	@ModelAttribute
	public ContractPurchaseSupplement get(@RequestParam(required=false) String id) {
		ContractPurchaseSupplement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseSupplementService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchaseSupplement();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchaseSupplement:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchaseSupplement contractPurchaseSupplement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchaseSupplement> page = contractPurchaseSupplementService.findPage(new Page<ContractPurchaseSupplement>(request, response), contractPurchaseSupplement); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseSupplementList";
	}

	@RequiresPermissions("purchase:contractPurchaseSupplement:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchaseSupplement contractPurchaseSupplement, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		if(StringUtils.isNotBlank(contractPurchaseSupplement.getId())){
			ContractPurchaseSupplementDetail detail = new ContractPurchaseSupplementDetail();
			detail.setContractCode(contractPurchaseSupplement.getContractCode());
			List<ContractPurchaseSupplementDetail> detailList = supplementDetailService.findList(detail);
			model.addAttribute("detailList",detailList);
		}
		model.addAttribute("contractPurchaseSupplement", contractPurchaseSupplement);
		return "modules/purchase/contractPurchaseSupplementForm";
	}

	@RequiresPermissions("purchase:contractPurchaseSupplement:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchaseSupplement contractPurchaseSupplement, Model model, RedirectAttributes redirectAttributes,@RequestParam(value = "tableDatas",required = false) String tableDatas) throws IllegalAccessException {
		if (!beanValidator(model, contractPurchaseSupplement)){
			return form(contractPurchaseSupplement, model);
		}
		if (StringUtils.isEmpty(contractPurchaseSupplement.getContractCreateDate())) {
			contractPurchaseSupplement.setContractCreateDate(DateUtils.formatDateTime(new Date()));
		}

		List<ContractPurchaseSupplementDetail> detailList = new ArrayList<ContractPurchaseSupplementDetail>();
		if (StringUtils.isNotEmpty(tableDatas)) {
			JSONArray detailArray = JSONArray.fromObject(StringEscapeUtils.unescapeHtml4(tableDatas));
			log.info("合同明细{}", detailArray);
			for (Object object : detailArray.toArray()) {
				ContractPurchaseSupplementDetail detail = buildVO((JSONObject) object, ContractPurchaseSupplementDetail.class);
				detail.setContractCode(contractPurchaseSupplement.getContractCode());
				detailList.add(detail);
			}
//				contractPurchaseDetailService.saveList(detailList);
		}
		contractPurchaseSupplementService.saveAll(contractPurchaseSupplement,detailList);
		addMessage(redirectAttributes, "保存采购合同补充协议表成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseSupplement/?repage";
	}
	private ContractPurchaseSupplementDetail buildVO(JSONObject object, Class<ContractPurchaseSupplementDetail> contractPurchaseDetailClass) throws IllegalAccessException {
		ContractPurchaseSupplementDetail detail = new ContractPurchaseSupplementDetail();
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
	@RequiresPermissions("purchase:contractPurchaseSupplement:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchaseSupplement contractPurchaseSupplement, RedirectAttributes redirectAttributes) {
		contractPurchaseSupplementService.delete(contractPurchaseSupplement);
		addMessage(redirectAttributes, "删除采购合同补充协议表成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchaseSupplement/?repage";
	}

}
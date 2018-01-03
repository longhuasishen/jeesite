/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveContract;
import com.thinkgem.jeesite.modules.doc.entity.DocAccmeth;
import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseDetailService;
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
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchase;
import com.thinkgem.jeesite.modules.purchase.service.ContractPurchaseService;

import java.util.Date;
import java.util.List;

/**
 * 采购合同Controller
 * @author lisy
 * @version 2017-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/contractPurchase")
public class ContractPurchaseController extends BaseController {

	@Autowired
	private ContractPurchaseService contractPurchaseService;
	@Autowired
	private ContractPurchaseDetailService contractPurchaseDetailService;

	@ModelAttribute
	public ContractPurchase get(@RequestParam(required=false) String id) {
		ContractPurchase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = contractPurchaseService.get(id);
		}
		if (entity == null){
			entity = new ContractPurchase();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:contractPurchase:view")
	@RequestMapping(value = {"list", ""})
	public String list(ContractPurchase contractPurchase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ContractPurchase> page = contractPurchaseService.findPage(new Page<ContractPurchase>(request, response), contractPurchase); 
		model.addAttribute("page", page);
		return "modules/purchase/contractPurchaseList";
	}

	@RequiresPermissions("purchase:contractPurchase:view")
	@RequestMapping(value = "form")
	public String form(ContractPurchase contractPurchase, Model model) {
		model.addAttribute("user", UserUtils.getUser());
		model.addAttribute("contractPurchase", contractPurchase);
		if(StringUtils.isNotBlank(contractPurchase.getId())){
			ContractPurchaseDetail detail = new ContractPurchaseDetail();
			detail.setContractCode(contractPurchase.getContractCode());
			List<ContractPurchaseDetail> detailList = contractPurchaseDetailService.findList(detail);
			model.addAttribute("detailList",detailList);
		}
		return "modules/purchase/contractPurchaseForm";
	}

	@RequiresPermissions("purchase:contractPurchase:edit")
	@RequestMapping(value = "save")
	public String save(ContractPurchase contractPurchase, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contractPurchase)){
			return form(contractPurchase, model);
		}
		if(StringUtils.isEmpty(contractPurchase.getContractCreateDate())){
			contractPurchase.setContractCreateDate(DateUtils.formatDateTime(new Date()));
		}
		/*DocSupplier docSupplier = contractPurchase.getDocSupplier();
		docSupplier.setSupCode(docSupplier.getSupCode().substring(
				docSupplier.getSupCode().indexOf("[")+1,docSupplier.getSupCode().length()-1)
		);
		DocDepartment docDepartment = contractPurchase.getDocDepartment();
		docDepartment.setDepartmentCode(docDepartment.getDepartmentCode().substring(
				docDepartment.getDepartmentCode().indexOf("[")+1,docDepartment.getDepartmentCode().length()-1)
		);
		DocAccmeth docAccmeth = contractPurchase.getDocAccmeth();
		docAccmeth.setAccmethCode(docAccmeth.getAccmethCode().substring(
				docAccmeth.getAccmethCode().indexOf("[")+1,docAccmeth.getAccmethCode().length()-1)
		);
		DocOfficework docOfficework = contractPurchase.getDocOfficework();
		docOfficework.setOfficeworkCode(docOfficework.getOfficeworkCode().substring(
				docOfficework.getOfficeworkCode().indexOf("[")+1,docOfficework.getOfficeworkCode().length()-1)
		);
		ArchiveContract archiveContract = contractPurchase.getArchiveContract();
		archiveContract.setContractCode(archiveContract.getContractCode().substring(
				archiveContract.getContractCode().indexOf("[")+1,archiveContract.getContractCode().length()-1)
		);*/

		contractPurchaseService.save(contractPurchase);
		addMessage(redirectAttributes, "保存采购合同成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchase/?repage";
	}
	
	@RequiresPermissions("purchase:contractPurchase:edit")
	@RequestMapping(value = "delete")
	public String delete(ContractPurchase contractPurchase, RedirectAttributes redirectAttributes) {
		contractPurchaseService.delete(contractPurchase);
		addMessage(redirectAttributes, "删除采购合同成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/contractPurchase/?repage";
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseDetailDao;

/**
 * 采购合同明细Service
 * @author lisy
 * @version 2017-12-31
 */
@Service
@Transactional(readOnly = true)
public class ContractPurchaseDetailService extends CrudService<ContractPurchaseDetailDao, ContractPurchaseDetail> {

	public ContractPurchaseDetail get(String id) {
		return super.get(id);
	}
	
	public List<ContractPurchaseDetail> findList(ContractPurchaseDetail contractPurchaseDetail) {
		return super.findList(contractPurchaseDetail);
	}
	
	public Page<ContractPurchaseDetail> findPage(Page<ContractPurchaseDetail> page, ContractPurchaseDetail contractPurchaseDetail) {
		return super.findPage(page, contractPurchaseDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractPurchaseDetail contractPurchaseDetail) {
		super.save(contractPurchaseDetail);
	}
	@Transactional(readOnly = false)
	public void saveList(List<ContractPurchaseDetail> detailList) {
		dao.saveList(detailList);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractPurchaseDetail contractPurchaseDetail) {
		super.delete(contractPurchaseDetail);
	}
	
}
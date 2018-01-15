/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageDetail;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseStorageDetailDao;

/**
 * 采购入库明细Service
 * @author lisy
 * @version 2018-01-14
 */
@Service
@Transactional(readOnly = true)
public class ContractPurchaseStorageDetailService extends CrudService<ContractPurchaseStorageDetailDao, ContractPurchaseStorageDetail> {

	public ContractPurchaseStorageDetail get(String id) {
		return super.get(id);
	}
	
	public List<ContractPurchaseStorageDetail> findList(ContractPurchaseStorageDetail contractPurchaseStorageDetail) {
		return super.findList(contractPurchaseStorageDetail);
	}
	
	public Page<ContractPurchaseStorageDetail> findPage(Page<ContractPurchaseStorageDetail> page, ContractPurchaseStorageDetail contractPurchaseStorageDetail) {
		return super.findPage(page, contractPurchaseStorageDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractPurchaseStorageDetail contractPurchaseStorageDetail) {
		super.save(contractPurchaseStorageDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractPurchaseStorageDetail contractPurchaseStorageDetail) {
		super.delete(contractPurchaseStorageDetail);
	}
	
}
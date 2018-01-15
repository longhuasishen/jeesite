/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplementDetail;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseSupplementDetailDao;

/**
 * 采购合同补充协议明细Service
 * @author lisy
 * @version 2018-01-13
 */
@Service
@Transactional(readOnly = true)
public class ContractPurchaseSupplementDetailService extends CrudService<ContractPurchaseSupplementDetailDao, ContractPurchaseSupplementDetail> {

	public ContractPurchaseSupplementDetail get(String id) {
		return super.get(id);
	}
	
	public List<ContractPurchaseSupplementDetail> findList(ContractPurchaseSupplementDetail contractPurchaseSupplementDetail) {
		return super.findList(contractPurchaseSupplementDetail);
	}
	
	public Page<ContractPurchaseSupplementDetail> findPage(Page<ContractPurchaseSupplementDetail> page, ContractPurchaseSupplementDetail contractPurchaseSupplementDetail) {
		return super.findPage(page, contractPurchaseSupplementDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractPurchaseSupplementDetail contractPurchaseSupplementDetail) {
		super.save(contractPurchaseSupplementDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractPurchaseSupplementDetail contractPurchaseSupplementDetail) {
		super.delete(contractPurchaseSupplementDetail);
	}
	
}
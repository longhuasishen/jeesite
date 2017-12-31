/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchase;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseDao;

/**
 * 采购合同Service
 * @author lisy
 * @version 2017-12-24
 */
@Service
@Transactional(readOnly = true)
public class ContractPurchaseService extends CrudService<ContractPurchaseDao, ContractPurchase> {

	public ContractPurchase get(String id) {
		return super.get(id);
	}
	
	public List<ContractPurchase> findList(ContractPurchase contractPurchase) {
		return super.findList(contractPurchase);
	}
	
	public Page<ContractPurchase> findPage(Page<ContractPurchase> page, ContractPurchase contractPurchase) {
		return super.findPage(page, contractPurchase);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractPurchase contractPurchase) {
		super.save(contractPurchase);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractPurchase contractPurchase) {
		super.delete(contractPurchase);
	}
	
}
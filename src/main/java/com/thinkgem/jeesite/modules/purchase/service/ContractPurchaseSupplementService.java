/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplement;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseSupplementDao;

/**
 * 采购合同补充协议Service
 * @author lisy
 * @version 2018-01-13
 */
@Service
@Transactional(readOnly = true)
public class ContractPurchaseSupplementService extends CrudService<ContractPurchaseSupplementDao, ContractPurchaseSupplement> {

	public ContractPurchaseSupplement get(String id) {
		return super.get(id);
	}
	
	public List<ContractPurchaseSupplement> findList(ContractPurchaseSupplement contractPurchaseSupplement) {
		return super.findList(contractPurchaseSupplement);
	}
	
	public Page<ContractPurchaseSupplement> findPage(Page<ContractPurchaseSupplement> page, ContractPurchaseSupplement contractPurchaseSupplement) {
		return super.findPage(page, contractPurchaseSupplement);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractPurchaseSupplement contractPurchaseSupplement) {
		super.save(contractPurchaseSupplement);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractPurchaseSupplement contractPurchaseSupplement) {
		super.delete(contractPurchaseSupplement);
	}
	
}
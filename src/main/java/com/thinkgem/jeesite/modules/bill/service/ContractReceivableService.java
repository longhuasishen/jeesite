/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.ContractReceivable;
import com.thinkgem.jeesite.modules.bill.dao.ContractReceivableDao;

/**
 * 合同应收Service
 * @author spark
 * @version 2018-01-07
 */
@Service
@Transactional(readOnly = true)
public class ContractReceivableService extends CrudService<ContractReceivableDao, ContractReceivable> {

	public ContractReceivable get(String id) {
		return super.get(id);
	}
	
	public List<ContractReceivable> findList(ContractReceivable contractReceivable) {
		return super.findList(contractReceivable);
	}
	
	public Page<ContractReceivable> findPage(Page<ContractReceivable> page, ContractReceivable contractReceivable) {
		return super.findPage(page, contractReceivable);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractReceivable contractReceivable) {
		super.save(contractReceivable);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractReceivable contractReceivable) {
		super.delete(contractReceivable);
	}
	
}
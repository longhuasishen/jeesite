/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesSpecialreq;
import com.thinkgem.jeesite.modules.contract.dao.ContractSalesSpecialreqDao;

/**
 * 销售合同特殊方法单价Service
 * @author spark
 * @version 2018-01-16
 */
@Service
@Transactional(readOnly = true)
public class ContractSalesSpecialreqService extends CrudService<ContractSalesSpecialreqDao, ContractSalesSpecialreq> {

	public ContractSalesSpecialreq get(String id) {
		return super.get(id);
	}
	
	public List<ContractSalesSpecialreq> findList(ContractSalesSpecialreq contractSalesSpecialreq) {
		return super.findList(contractSalesSpecialreq);
	}
	
	public Page<ContractSalesSpecialreq> findPage(Page<ContractSalesSpecialreq> page, ContractSalesSpecialreq contractSalesSpecialreq) {
		return super.findPage(page, contractSalesSpecialreq);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractSalesSpecialreq contractSalesSpecialreq) {
		super.save(contractSalesSpecialreq);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractSalesSpecialreq contractSalesSpecialreq) {
		super.delete(contractSalesSpecialreq);
	}
	
}
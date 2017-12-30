/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.contract.entity.ContractSales;
import com.thinkgem.jeesite.modules.contract.dao.ContractSalesDao;

/**
 * 销售合同Service
 * @author spark
 * @version 2017-12-30
 */
@Service
@Transactional(readOnly = true)
public class ContractSalesService extends CrudService<ContractSalesDao, ContractSales> {

	public ContractSales get(String id) {
		return super.get(id);
	}
	
	public List<ContractSales> findList(ContractSales contractSales) {
		return super.findList(contractSales);
	}
	
	public Page<ContractSales> findPage(Page<ContractSales> page, ContractSales contractSales) {
		return super.findPage(page, contractSales);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractSales contractSales) {
		super.save(contractSales);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractSales contractSales) {
		super.delete(contractSales);
	}
	
}
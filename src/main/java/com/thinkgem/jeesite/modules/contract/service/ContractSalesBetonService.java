/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesBeton;
import com.thinkgem.jeesite.modules.contract.dao.ContractSalesBetonDao;

/**
 * 销售合同混凝土单价Service
 * @author spark
 * @version 2018-01-15
 */
@Service
@Transactional(readOnly = true)
public class ContractSalesBetonService extends CrudService<ContractSalesBetonDao, ContractSalesBeton> {

	public ContractSalesBeton get(String id) {
		return super.get(id);
	}
	
	public List<ContractSalesBeton> findList(ContractSalesBeton contractSalesBeton) {
		return super.findList(contractSalesBeton);
	}
	
	public Page<ContractSalesBeton> findPage(Page<ContractSalesBeton> page, ContractSalesBeton contractSalesBeton) {
		return super.findPage(page, contractSalesBeton);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractSalesBeton contractSalesBeton) {
		super.save(contractSalesBeton);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractSalesBeton contractSalesBeton) {
		super.delete(contractSalesBeton);
	}
	
}
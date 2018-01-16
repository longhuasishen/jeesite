/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesWatermeth;
import com.thinkgem.jeesite.modules.contract.dao.ContractSalesWatermethDao;

/**
 * 销售合同浇灌方法单价Service
 * @author spark
 * @version 2018-01-16
 */
@Service
@Transactional(readOnly = true)
public class ContractSalesWatermethService extends CrudService<ContractSalesWatermethDao, ContractSalesWatermeth> {

	public ContractSalesWatermeth get(String id) {
		return super.get(id);
	}
	
	public List<ContractSalesWatermeth> findList(ContractSalesWatermeth contractSalesWatermeth) {
		return super.findList(contractSalesWatermeth);
	}
	
	public Page<ContractSalesWatermeth> findPage(Page<ContractSalesWatermeth> page, ContractSalesWatermeth contractSalesWatermeth) {
		return super.findPage(page, contractSalesWatermeth);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractSalesWatermeth contractSalesWatermeth) {
		super.save(contractSalesWatermeth);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractSalesWatermeth contractSalesWatermeth) {
		super.delete(contractSalesWatermeth);
	}
	
}
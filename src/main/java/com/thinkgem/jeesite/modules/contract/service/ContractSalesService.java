/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.service;

import java.util.List;

import com.thinkgem.jeesite.modules.contract.dao.ContractSalesBetonDao;
import com.thinkgem.jeesite.modules.contract.dao.ContractSalesSpecialreqDao;
import com.thinkgem.jeesite.modules.contract.dao.ContractSalesWatermethDao;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesBeton;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesSpecialreq;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesWatermeth;
import org.springframework.beans.factory.annotation.Autowired;
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

	@Autowired
	private ContractSalesBetonDao contractSalesBetonDao;
	@Autowired
	private ContractSalesWatermethDao contractSalesWatermethDao;
	@Autowired
	private ContractSalesSpecialreqDao contractSalesSpecialreqDao;

	public ContractSales get(String id) {
		return super.get(id);
	}
	
	public List<ContractSales> findList(ContractSales contractSales) {
		return super.findList(contractSales);
	}
	
	public Page<ContractSales> findPage(Page<ContractSales> page, ContractSales contractSales) {
		return super.findPage(page, contractSales);
	}
	public List<ContractSales> findCusProject(ContractSales contractSales) {
		return dao.findCusProject(contractSales);
	}

	@Transactional(readOnly = false)
	public void save(ContractSales contractSales) {
		super.save(contractSales);
	}

	@Transactional(readOnly = false)
	public void saveAll(ContractSales contractSales, List<ContractSalesBeton> detailList, List<ContractSalesWatermeth> detailList2, List<ContractSalesSpecialreq> detailList3) {
		super.save(contractSales);
		if(!detailList.isEmpty()) {
			for(ContractSalesBeton detail : detailList){
				ContractSalesBeton temp = contractSalesBetonDao.get(detail.getId());
				if(null != temp){
					detail.setId(temp.getId());
				}
			}
			contractSalesBetonDao.deleteByContract(contractSales.getContractId());
			contractSalesBetonDao.saveList(detailList);
		}
		if(!detailList2.isEmpty()) {
			for(ContractSalesWatermeth detail2 : detailList2){
				ContractSalesWatermeth temp = contractSalesWatermethDao.get(detail2.getId());
				if(null != temp){
					detail2.setId(temp.getId());
				}
			}
			contractSalesWatermethDao.deleteByContract(contractSales.getContractId());
			contractSalesWatermethDao.saveList(detailList2);
		}
		if(!detailList3.isEmpty()) {
			for(ContractSalesSpecialreq detail3 : detailList3){
				ContractSalesSpecialreq temp = contractSalesSpecialreqDao.get(detail3.getId());
				if(null != temp){
					detail3.setId(temp.getId());
				}
			}
			contractSalesSpecialreqDao.deleteByContract(contractSales.getContractId());
			contractSalesSpecialreqDao.saveList(detailList3);
		}
	}

	@Transactional(readOnly = false)
	public void delete(ContractSales contractSales) {
		super.delete(contractSales);
	}
	
}
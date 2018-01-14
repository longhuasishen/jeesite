/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseSupplementDao;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseSupplementDetailDao;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplement;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplementDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 采购合同补充协议Service
 * @author lisy
 * @version 2018-01-13
 */
@Service
@Transactional(readOnly = true)
public class ContractPurchaseSupplementService extends CrudService<ContractPurchaseSupplementDao, ContractPurchaseSupplement> {

	@Autowired
	private ContractPurchaseSupplementDetailDao detailDao;

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
	public void saveAll(ContractPurchaseSupplement contractPurchase, List<ContractPurchaseSupplementDetail> detailList) {
		super.save(contractPurchase);
		if(!detailList.isEmpty()) {
			for(ContractPurchaseSupplementDetail detail : detailList){
				ContractPurchaseSupplementDetail temp = detailDao.get(detail.getId());
				if(null != temp){
					detail.setId(temp.getId());
				}
			}
			detailDao.deleteByContract(contractPurchase.getContractCode());
			detailDao.saveList(detailList);
		}
	}

	@Transactional(readOnly = false)
	public void delete(ContractPurchaseSupplement contractPurchaseSupplement) {
		super.delete(contractPurchaseSupplement);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseStorageDetailDao;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseStorageMainDao;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageMain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 采购入库Service
 * @author lisy
 * @version 2018-01-14
 */
@Service
@Transactional(readOnly = true)
public class ContractPurchaseStorageMainService extends CrudService<ContractPurchaseStorageMainDao, ContractPurchaseStorageMain> {

	@Autowired
	private ContractPurchaseStorageDetailDao detailDao;

	public ContractPurchaseStorageMain get(String id) {
		return super.get(id);
	}
	
	public List<ContractPurchaseStorageMain> findList(ContractPurchaseStorageMain contractPurchaseStorageMain) {
		return super.findList(contractPurchaseStorageMain);
	}
	
	public Page<ContractPurchaseStorageMain> findPage(Page<ContractPurchaseStorageMain> page, ContractPurchaseStorageMain contractPurchaseStorageMain) {
		return super.findPage(page, contractPurchaseStorageMain);
	}
	
	@Transactional(readOnly = false)
	public void save(ContractPurchaseStorageMain contractPurchaseStorageMain) {
		super.save(contractPurchaseStorageMain);
	}
	
	@Transactional(readOnly = false)
	public void delete(ContractPurchaseStorageMain contractPurchaseStorageMain) {
		super.delete(contractPurchaseStorageMain);
	}
	@Transactional(readOnly = false)
    public void saveAll(ContractPurchaseStorageMain contractPurchaseStorageMain, List<ContractPurchaseStorageDetail> detailList) {
		super.save(contractPurchaseStorageMain);
		if(!detailList.isEmpty()) {
			for(ContractPurchaseStorageDetail detail : detailList){
				ContractPurchaseStorageDetail temp = detailDao.get(detail.getId());
				if(null != temp){
					detail.setId(temp.getId());
				}
			}
			detailDao.deleteByStorage(contractPurchaseStorageMain.getStorageCode());
			detailDao.saveList(detailList);
		}
    }
}
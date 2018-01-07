/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.FinpayBill;
import com.thinkgem.jeesite.modules.bill.dao.FinpayBillDao;

/**
 * 财务应付调账单Service
 * @author spark
 * @version 2018-01-05
 */
@Service
@Transactional(readOnly = true)
public class FinpayBillService extends CrudService<FinpayBillDao, FinpayBill> {

	public FinpayBill get(String id) {
		return super.get(id);
	}
	
	public List<FinpayBill> findList(FinpayBill finpayBill) {
		return super.findList(finpayBill);
	}
	
	public Page<FinpayBill> findPage(Page<FinpayBill> page, FinpayBill finpayBill) {
		return super.findPage(page, finpayBill);
	}
	
	@Transactional(readOnly = false)
	public void save(FinpayBill finpayBill) {
		super.save(finpayBill);
	}
	
	@Transactional(readOnly = false)
	public void delete(FinpayBill finpayBill) {
		super.delete(finpayBill);
	}
	
}
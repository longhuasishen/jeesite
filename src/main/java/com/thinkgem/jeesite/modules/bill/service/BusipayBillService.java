/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.BusipayBill;
import com.thinkgem.jeesite.modules.bill.dao.BusipayBillDao;

/**
 * 业务应付调账单Service
 * @author spark
 * @version 2018-01-05
 */
@Service
@Transactional(readOnly = true)
public class BusipayBillService extends CrudService<BusipayBillDao, BusipayBill> {

	public BusipayBill get(String id) {
		return super.get(id);
	}
	
	public List<BusipayBill> findList(BusipayBill busipayBill) {
		return super.findList(busipayBill);
	}
	
	public Page<BusipayBill> findPage(Page<BusipayBill> page, BusipayBill busipayBill) {
		return super.findPage(page, busipayBill);
	}
	
	@Transactional(readOnly = false)
	public void save(BusipayBill busipayBill) {
		super.save(busipayBill);
	}
	
	@Transactional(readOnly = false)
	public void delete(BusipayBill busipayBill) {
		super.delete(busipayBill);
	}
	
}
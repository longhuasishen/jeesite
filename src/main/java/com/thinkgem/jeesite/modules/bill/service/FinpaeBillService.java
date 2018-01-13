/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.FinpaeBill;
import com.thinkgem.jeesite.modules.bill.dao.FinpaeBillDao;

/**
 * 财务应收调账单Service
 * @author spark
 * @version 2018-01-05
 */
@Service
@Transactional(readOnly = true)
public class FinpaeBillService extends CrudService<FinpaeBillDao, FinpaeBill> {

	public FinpaeBill get(String id) {
		return super.get(id);
	}
	
	public List<FinpaeBill> findList(FinpaeBill finpaeBill) {
		return super.findList(finpaeBill);
	}
	
	public Page<FinpaeBill> findPage(Page<FinpaeBill> page, FinpaeBill finpaeBill) {
		return super.findPage(page, finpaeBill);
	}
	
	@Transactional(readOnly = false)
	public void save(FinpaeBill finpaeBill) {
		super.save(finpaeBill);
	}
	
	@Transactional(readOnly = false)
	public void delete(FinpaeBill finpaeBill) {
		super.delete(finpaeBill);
	}
	
}
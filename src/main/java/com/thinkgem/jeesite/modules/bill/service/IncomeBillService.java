/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.IncomeBill;
import com.thinkgem.jeesite.modules.bill.dao.IncomeBillDao;

/**
 * 收款单Service
 * @author spark
 * @version 2018-01-07
 */
@Service
@Transactional(readOnly = true)
public class IncomeBillService extends CrudService<IncomeBillDao, IncomeBill> {

	public IncomeBill get(String id) {
		return super.get(id);
	}
	
	public List<IncomeBill> findList(IncomeBill incomeBill) {
		return super.findList(incomeBill);
	}
	
	public Page<IncomeBill> findPage(Page<IncomeBill> page, IncomeBill incomeBill) {
		return super.findPage(page, incomeBill);
	}
	
	@Transactional(readOnly = false)
	public void save(IncomeBill incomeBill) {
		super.save(incomeBill);
	}
	
	@Transactional(readOnly = false)
	public void delete(IncomeBill incomeBill) {
		super.delete(incomeBill);
	}
	
}
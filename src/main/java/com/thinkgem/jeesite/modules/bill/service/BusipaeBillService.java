/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.BusipaeBill;
import com.thinkgem.jeesite.modules.bill.dao.BusipaeBillDao;

/**
 * 业务应收调账单Service
 * @author spark
 * @version 2018-01-05
 */
@Service
@Transactional(readOnly = true)
public class BusipaeBillService extends CrudService<BusipaeBillDao, BusipaeBill> {

	public BusipaeBill get(String id) {
		return super.get(id);
	}
	
	public List<BusipaeBill> findList(BusipaeBill busipaeBill) {
		return super.findList(busipaeBill);
	}
	
	public Page<BusipaeBill> findPage(Page<BusipaeBill> page, BusipaeBill busipaeBill) {
		return super.findPage(page, busipaeBill);
	}
	
	@Transactional(readOnly = false)
	public void save(BusipaeBill busipaeBill) {
		super.save(busipaeBill);
	}
	
	@Transactional(readOnly = false)
	public void delete(BusipaeBill busipaeBill) {
		super.delete(busipaeBill);
	}
	
}
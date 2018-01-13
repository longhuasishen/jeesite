/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.SalesInvoice;
import com.thinkgem.jeesite.modules.bill.dao.SalesInvoiceDao;

/**
 * 销售发票Service
 * @author spark
 * @version 2018-01-07
 */
@Service
@Transactional(readOnly = true)
public class SalesInvoiceService extends CrudService<SalesInvoiceDao, SalesInvoice> {

	public SalesInvoice get(String id) {
		return super.get(id);
	}
	
	public List<SalesInvoice> findList(SalesInvoice salesInvoice) {
		return super.findList(salesInvoice);
	}
	
	public Page<SalesInvoice> findPage(Page<SalesInvoice> page, SalesInvoice salesInvoice) {
		return super.findPage(page, salesInvoice);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesInvoice salesInvoice) {
		super.save(salesInvoice);
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesInvoice salesInvoice) {
		super.delete(salesInvoice);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.financedoc.entity.DocFinanceInitpay;
import com.thinkgem.jeesite.modules.financedoc.dao.DocFinanceInitpayDao;

/**
 * 财务应付期初余额表Service
 * @author lisy
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocFinanceInitpayService extends CrudService<DocFinanceInitpayDao, DocFinanceInitpay> {

	public DocFinanceInitpay get(String id) {
		return super.get(id);
	}
	
	public List<DocFinanceInitpay> findList(DocFinanceInitpay docFinanceInitpay) {
		return super.findList(docFinanceInitpay);
	}
	
	public Page<DocFinanceInitpay> findPage(Page<DocFinanceInitpay> page, DocFinanceInitpay docFinanceInitpay) {
		return super.findPage(page, docFinanceInitpay);
	}
	
	@Transactional(readOnly = false)
	public void save(DocFinanceInitpay docFinanceInitpay) {
		super.save(docFinanceInitpay);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocFinanceInitpay docFinanceInitpay) {
		super.delete(docFinanceInitpay);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.financedoc.entity.DocFinanceInitbalance;
import com.thinkgem.jeesite.modules.financedoc.dao.DocFinanceInitbalanceDao;

/**
 * 财务应收期初余额Service
 * @author lisy
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocFinanceInitbalanceService extends CrudService<DocFinanceInitbalanceDao, DocFinanceInitbalance> {

	public DocFinanceInitbalance get(String id) {
		return super.get(id);
	}
	
	public List<DocFinanceInitbalance> findList(DocFinanceInitbalance docFinanceInitbalance) {
		return super.findList(docFinanceInitbalance);
	}
	
	public Page<DocFinanceInitbalance> findPage(Page<DocFinanceInitbalance> page, DocFinanceInitbalance docFinanceInitbalance) {
		return super.findPage(page, docFinanceInitbalance);
	}
	
	@Transactional(readOnly = false)
	public void save(DocFinanceInitbalance docFinanceInitbalance) {
		super.save(docFinanceInitbalance);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocFinanceInitbalance docFinanceInitbalance) {
		super.delete(docFinanceInitbalance);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.financedoc.entity.DocBusinessInitbalance;
import com.thinkgem.jeesite.modules.financedoc.dao.DocBusinessInitbalanceDao;

/**
 * 业务应收期初余额Service
 * @author lisy
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocBusinessInitbalanceService extends CrudService<DocBusinessInitbalanceDao, DocBusinessInitbalance> {

	public DocBusinessInitbalance get(String id) {
		return super.get(id);
	}
	
	public List<DocBusinessInitbalance> findList(DocBusinessInitbalance docBusinessInitbalance) {
		return super.findList(docBusinessInitbalance);
	}
	
	public Page<DocBusinessInitbalance> findPage(Page<DocBusinessInitbalance> page, DocBusinessInitbalance docBusinessInitbalance) {
		return super.findPage(page, docBusinessInitbalance);
	}
	
	@Transactional(readOnly = false)
	public void save(DocBusinessInitbalance docBusinessInitbalance) {
		super.save(docBusinessInitbalance);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocBusinessInitbalance docBusinessInitbalance) {
		super.delete(docBusinessInitbalance);
	}
	
}
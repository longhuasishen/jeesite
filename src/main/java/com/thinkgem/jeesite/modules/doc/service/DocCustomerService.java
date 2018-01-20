/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
import com.thinkgem.jeesite.modules.doc.dao.DocCustomerDao;

/**
 * 客户档案Service
 * @author lisy
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocCustomerService extends CrudService<DocCustomerDao, DocCustomer> {

	public DocCustomer get(String id) {
		return super.get(id);
	}
	
	public List<DocCustomer> findList(DocCustomer docCustomer) {
		return super.findList(docCustomer);
	}

	public List<DocCustomer> findNameShort(DocCustomer docCustomer) {
		return dao.findNameShort(docCustomer);
	}
	
	public Page<DocCustomer> findPage(Page<DocCustomer> page, DocCustomer docCustomer) {
		return super.findPage(page, docCustomer);
	}
	
	@Transactional(readOnly = false)
	public void save(DocCustomer docCustomer) {
		super.save(docCustomer);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocCustomer docCustomer) {
		super.delete(docCustomer);
	}

	public DocCustomer findByCode(String cusCode) {
		return dao.findByCode(cusCode);
	}
	public List<DocCustomer> treeData(DocCustomer docCustomer) {
		return dao.treeData(docCustomer);
	}
	
}
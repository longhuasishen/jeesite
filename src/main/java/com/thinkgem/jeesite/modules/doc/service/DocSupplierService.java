/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;
import com.thinkgem.jeesite.modules.doc.dao.DocSupplierDao;

/**
 * 供应商档案Service
 * @author lisy
 * @version 2017-12-16
 */
@Service
@Transactional(readOnly = true)
public class DocSupplierService extends CrudService<DocSupplierDao, DocSupplier> {

	public DocSupplier get(String id) {
		return super.get(id);
	}
	
	public List<DocSupplier> findList(DocSupplier docSupplier) {
		return super.findList(docSupplier);
	}
	
	public Page<DocSupplier> findPage(Page<DocSupplier> page, DocSupplier docSupplier) {
		return super.findPage(page, docSupplier);
	}
	
	@Transactional(readOnly = false)
	public void save(DocSupplier docSupplier) {
		super.save(docSupplier);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocSupplier docSupplier) {
		super.delete(docSupplier);
	}
	public List<DocSupplier> treeData(DocSupplier docSupplier) {
		return dao.treeData(docSupplier);
	}
}
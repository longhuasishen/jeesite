/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocPaymeth;
import com.thinkgem.jeesite.modules.doc.dao.DocPaymethDao;

/**
 * 支付方式档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocPaymethService extends CrudService<DocPaymethDao, DocPaymeth> {

	public DocPaymeth get(String id) {
		return super.get(id);
	}
	
	public List<DocPaymeth> findList(DocPaymeth docPaymeth) {
		return super.findList(docPaymeth);
	}
	
	public Page<DocPaymeth> findPage(Page<DocPaymeth> page, DocPaymeth docPaymeth) {
		return super.findPage(page, docPaymeth);
	}
	
	@Transactional(readOnly = false)
	public void save(DocPaymeth docPaymeth) {
		super.save(docPaymeth);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocPaymeth docPaymeth) {
		super.delete(docPaymeth);
	}
	public List<DocPaymeth> treeData(DocPaymeth docPaymeth) {
		return dao.treeData(docPaymeth);
	}
	
}
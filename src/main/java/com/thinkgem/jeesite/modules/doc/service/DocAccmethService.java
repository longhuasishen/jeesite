/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocAccmeth;
import com.thinkgem.jeesite.modules.doc.dao.DocAccmethDao;

/**
 * 结算方式档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocAccmethService extends CrudService<DocAccmethDao, DocAccmeth> {

	public DocAccmeth get(String id) {
		return super.get(id);
	}
	
	public List<DocAccmeth> findList(DocAccmeth docAccmeth) {
		return super.findList(docAccmeth);
	}
	
	public Page<DocAccmeth> findPage(Page<DocAccmeth> page, DocAccmeth docAccmeth) {
		return super.findPage(page, docAccmeth);
	}
	
	@Transactional(readOnly = false)
	public void save(DocAccmeth docAccmeth) {
		super.save(docAccmeth);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocAccmeth docAccmeth) {
		super.delete(docAccmeth);
	}
	
}
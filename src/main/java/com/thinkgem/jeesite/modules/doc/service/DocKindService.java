/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocKind;
import com.thinkgem.jeesite.modules.doc.dao.DocKindDao;

/**
 * 品种档案Service
 * @author lisy
 * @version 2017-12-30
 */
@Service
@Transactional(readOnly = true)
public class DocKindService extends CrudService<DocKindDao, DocKind> {

	public DocKind get(String id) {
		return super.get(id);
	}
	
	public List<DocKind> findList(DocKind docKind) {
		return super.findList(docKind);
	}
	
	public Page<DocKind> findPage(Page<DocKind> page, DocKind docKind) {
		return super.findPage(page, docKind);
	}
	
	@Transactional(readOnly = false)
	public void save(DocKind docKind) {
		super.save(docKind);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocKind docKind) {
		super.delete(docKind);
	}
	public List<DocKind> treeData(DocKind docKind) {
		return dao.treeData(docKind);
	}
	
}
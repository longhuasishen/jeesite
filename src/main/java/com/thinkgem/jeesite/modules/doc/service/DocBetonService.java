/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocBeton;
import com.thinkgem.jeesite.modules.doc.dao.DocBetonDao;

/**
 * 混凝土档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocBetonService extends CrudService<DocBetonDao, DocBeton> {

	public DocBeton get(String id) {
		return super.get(id);
	}
	
	public List<DocBeton> findList(DocBeton docBeton) {
		return super.findList(docBeton);
	}
	
	public Page<DocBeton> findPage(Page<DocBeton> page, DocBeton docBeton) {
		return super.findPage(page, docBeton);
	}
	
	@Transactional(readOnly = false)
	public void save(DocBeton docBeton) {
		super.save(docBeton);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocBeton docBeton) {
		super.delete(docBeton);
	}
	
}
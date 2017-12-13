/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocConcrete;
import com.thinkgem.jeesite.modules.doc.dao.DocConcreteDao;

/**
 * 原材料档案Service
 * @author spark
 * @version 2017-12-13
 */
@Service
@Transactional(readOnly = true)
public class DocConcreteService extends CrudService<DocConcreteDao, DocConcrete> {

	public DocConcrete get(String id) {
		return super.get(id);
	}
	
	public List<DocConcrete> findList(DocConcrete docConcrete) {
		return super.findList(docConcrete);
	}
	
	public Page<DocConcrete> findPage(Page<DocConcrete> page, DocConcrete docConcrete) {
		return super.findPage(page, docConcrete);
	}
	
	@Transactional(readOnly = false)
	public void save(DocConcrete docConcrete) {
		super.save(docConcrete);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocConcrete docConcrete) {
		super.delete(docConcrete);
	}
	
}
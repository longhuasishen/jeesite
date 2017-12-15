/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocNormaterial;
import com.thinkgem.jeesite.modules.doc.dao.DocNormaterialDao;

/**
 * 普通物资档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocNormaterialService extends CrudService<DocNormaterialDao, DocNormaterial> {

	public DocNormaterial get(String id) {
		return super.get(id);
	}
	
	public List<DocNormaterial> findList(DocNormaterial docNormaterial) {
		return super.findList(docNormaterial);
	}
	
	public Page<DocNormaterial> findPage(Page<DocNormaterial> page, DocNormaterial docNormaterial) {
		return super.findPage(page, docNormaterial);
	}
	
	@Transactional(readOnly = false)
	public void save(DocNormaterial docNormaterial) {
		super.save(docNormaterial);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocNormaterial docNormaterial) {
		super.delete(docNormaterial);
	}
	
}
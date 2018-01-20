/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocDriver;
import com.thinkgem.jeesite.modules.doc.dao.DocDriverDao;

/**
 * 司机档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocDriverService extends CrudService<DocDriverDao, DocDriver> {

	public DocDriver get(String id) {
		return super.get(id);
	}
	
	public List<DocDriver> findList(DocDriver docDriver) {
		return super.findList(docDriver);
	}
	
	public Page<DocDriver> findPage(Page<DocDriver> page, DocDriver docDriver) {
		return super.findPage(page, docDriver);
	}
	
	@Transactional(readOnly = false)
	public void save(DocDriver docDriver) {
		super.save(docDriver);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocDriver docDriver) {
		super.delete(docDriver);
	}
	public List<DocDriver> treeData(DocDriver docDriver) {
		return dao.treeData(docDriver);
	}
	
}
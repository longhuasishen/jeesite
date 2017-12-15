/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.dao.DocOfficeworkDao;

/**
 * 职员档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocOfficeworkService extends CrudService<DocOfficeworkDao, DocOfficework> {

	public DocOfficework get(String id) {
		return super.get(id);
	}
	
	public List<DocOfficework> findList(DocOfficework docOfficework) {
		return super.findList(docOfficework);
	}
	
	public Page<DocOfficework> findPage(Page<DocOfficework> page, DocOfficework docOfficework) {
		return super.findPage(page, docOfficework);
	}
	
	@Transactional(readOnly = false)
	public void save(DocOfficework docOfficework) {
		super.save(docOfficework);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocOfficework docOfficework) {
		super.delete(docOfficework);
	}
	
}
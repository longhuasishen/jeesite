/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocStation;
import com.thinkgem.jeesite.modules.doc.dao.DocStationDao;

/**
 * 搅拌站档案Service
 * @author spark
 * @version 2017-12-14
 */
@Service
@Transactional(readOnly = true)
public class DocStationService extends CrudService<DocStationDao, DocStation> {

	public DocStation get(String id) {
		return super.get(id);
	}
	
	public List<DocStation> findList(DocStation docStation) {
		return super.findList(docStation);
	}
	
	public Page<DocStation> findPage(Page<DocStation> page, DocStation docStation) {
		return super.findPage(page, docStation);
	}
	
	@Transactional(readOnly = false)
	public void save(DocStation docStation) {
		super.save(docStation);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocStation docStation) {
		super.delete(docStation);
	}
	
}
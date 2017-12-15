/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocWatermeth;
import com.thinkgem.jeesite.modules.doc.dao.DocWatermethDao;

/**
 * 浇灌方式档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocWatermethService extends CrudService<DocWatermethDao, DocWatermeth> {

	public DocWatermeth get(String id) {
		return super.get(id);
	}
	
	public List<DocWatermeth> findList(DocWatermeth docWatermeth) {
		return super.findList(docWatermeth);
	}
	
	public Page<DocWatermeth> findPage(Page<DocWatermeth> page, DocWatermeth docWatermeth) {
		return super.findPage(page, docWatermeth);
	}
	
	@Transactional(readOnly = false)
	public void save(DocWatermeth docWatermeth) {
		super.save(docWatermeth);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocWatermeth docWatermeth) {
		super.delete(docWatermeth);
	}
	
}
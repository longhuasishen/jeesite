/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageMain;
import com.thinkgem.jeesite.modules.financedoc.dao.DocInitStorageMainDao;

/**
 * 期初入库Service
 * @author lisy
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocInitStorageMainService extends CrudService<DocInitStorageMainDao, DocInitStorageMain> {

	public DocInitStorageMain get(String id) {
		return super.get(id);
	}
	
	public List<DocInitStorageMain> findList(DocInitStorageMain docInitStorageMain) {
		return super.findList(docInitStorageMain);
	}
	
	public Page<DocInitStorageMain> findPage(Page<DocInitStorageMain> page, DocInitStorageMain docInitStorageMain) {
		return super.findPage(page, docInitStorageMain);
	}
	
	@Transactional(readOnly = false)
	public void save(DocInitStorageMain docInitStorageMain) {
		super.save(docInitStorageMain);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocInitStorageMain docInitStorageMain) {
		super.delete(docInitStorageMain);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageDetail;
import com.thinkgem.jeesite.modules.financedoc.dao.DocInitStorageDetailDao;

/**
 * 期初入库Service
 * @author lisy
 * @version 2018-01-16
 */
@Service
@Transactional(readOnly = true)
public class DocInitStorageDetailService extends CrudService<DocInitStorageDetailDao, DocInitStorageDetail> {

	public DocInitStorageDetail get(String id) {
		return super.get(id);
	}
	
	public List<DocInitStorageDetail> findList(DocInitStorageDetail docInitStorageDetail) {
		return super.findList(docInitStorageDetail);
	}
	
	public Page<DocInitStorageDetail> findPage(Page<DocInitStorageDetail> page, DocInitStorageDetail docInitStorageDetail) {
		return super.findPage(page, docInitStorageDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(DocInitStorageDetail docInitStorageDetail) {
		super.save(docInitStorageDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocInitStorageDetail docInitStorageDetail) {
		super.delete(docInitStorageDetail);
	}
	
}
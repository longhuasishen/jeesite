/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveSupplier;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveSupplierDao;

/**
 * 供应商分类Service
 * @author spark
 * @version 2017-12-12
 */
@Service
@Transactional(readOnly = true)
public class ArchiveSupplierService extends CrudService<ArchiveSupplierDao, ArchiveSupplier> {

	public ArchiveSupplier get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveSupplier> findList(ArchiveSupplier archiveSupplier) {
		return super.findList(archiveSupplier);
	}
	
	public Page<ArchiveSupplier> findPage(Page<ArchiveSupplier> page, ArchiveSupplier archiveSupplier) {
		return super.findPage(page, archiveSupplier);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveSupplier archiveSupplier) {
		super.save(archiveSupplier);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveSupplier archiveSupplier) {
		super.delete(archiveSupplier);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveMaterial;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveMaterialDao;

/**
 * 物资分类Service
 * @author lisy
 * @version 2017-12-14
 */
@Service
@Transactional(readOnly = true)
public class ArchiveMaterialService extends CrudService<ArchiveMaterialDao, ArchiveMaterial> {

	public ArchiveMaterial get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveMaterial> findList(ArchiveMaterial archiveMaterial) {
		return super.findList(archiveMaterial);
	}
	
	public Page<ArchiveMaterial> findPage(Page<ArchiveMaterial> page, ArchiveMaterial archiveMaterial) {
		return super.findPage(page, archiveMaterial);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveMaterial archiveMaterial) {
		super.save(archiveMaterial);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveMaterial archiveMaterial) {
		super.delete(archiveMaterial);
	}
	
}
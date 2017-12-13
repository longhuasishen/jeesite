/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveArea;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveAreaDao;

/**
 * 地区分类Service
 * @author spark
 * @version 2017-12-12
 */
@Service
@Transactional(readOnly = true)
public class ArchiveAreaService extends CrudService<ArchiveAreaDao, ArchiveArea> {

	public ArchiveArea get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveArea> findList(ArchiveArea archiveArea) {
		return super.findList(archiveArea);
	}
	
	public Page<ArchiveArea> findPage(Page<ArchiveArea> page, ArchiveArea archiveArea) {
		return super.findPage(page, archiveArea);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveArea archiveArea) {
		super.save(archiveArea);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveArea archiveArea) {
		super.delete(archiveArea);
	}
	
}
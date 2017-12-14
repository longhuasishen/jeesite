/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveCustom;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveCustomDao;

/**
 * 客户分类Service
 * @author spark
 * @version 2017-12-14
 */
@Service
@Transactional(readOnly = true)
public class ArchiveCustomService extends CrudService<ArchiveCustomDao, ArchiveCustom> {

	public ArchiveCustom get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveCustom> findList(ArchiveCustom archiveCustom) {
		return super.findList(archiveCustom);
	}
	
	public Page<ArchiveCustom> findPage(Page<ArchiveCustom> page, ArchiveCustom archiveCustom) {
		return super.findPage(page, archiveCustom);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveCustom archiveCustom) {
		super.save(archiveCustom);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveCustom archiveCustom) {
		super.delete(archiveCustom);
	}
	
}
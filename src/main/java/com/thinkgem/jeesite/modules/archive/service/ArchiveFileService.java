/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveFile;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveFileDao;

/**
 * 文件分类Service
 * @author spark
 * @version 2017-12-13
 */
@Service
@Transactional(readOnly = true)
public class ArchiveFileService extends CrudService<ArchiveFileDao, ArchiveFile> {

	public ArchiveFile get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveFile> findList(ArchiveFile archiveFile) {
		return super.findList(archiveFile);
	}
	
	public Page<ArchiveFile> findPage(Page<ArchiveFile> page, ArchiveFile archiveFile) {
		return super.findPage(page, archiveFile);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveFile archiveFile) {
		super.save(archiveFile);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveFile archiveFile) {
		super.delete(archiveFile);
	}
	
}
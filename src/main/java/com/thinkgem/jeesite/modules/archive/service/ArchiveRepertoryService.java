/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveRepertory;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveRepertoryDao;

/**
 * 仓库分类Service
 * @author spark
 * @version 2017-12-13
 */
@Service
@Transactional(readOnly = true)
public class ArchiveRepertoryService extends CrudService<ArchiveRepertoryDao, ArchiveRepertory> {

	public ArchiveRepertory get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveRepertory> findList(ArchiveRepertory archiveRepertory) {
		return super.findList(archiveRepertory);
	}
	
	public Page<ArchiveRepertory> findPage(Page<ArchiveRepertory> page, ArchiveRepertory archiveRepertory) {
		return super.findPage(page, archiveRepertory);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveRepertory archiveRepertory) {
		super.save(archiveRepertory);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveRepertory archiveRepertory) {
		super.delete(archiveRepertory);
	}
	
}
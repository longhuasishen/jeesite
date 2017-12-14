/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveContract;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveContractDao;

/**
 * 合同分类Service
 * @author lisy
 * @version 2017-12-14
 */
@Service
@Transactional(readOnly = true)
public class ArchiveContractService extends CrudService<ArchiveContractDao, ArchiveContract> {

	public ArchiveContract get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveContract> findList(ArchiveContract archiveContract) {
		return super.findList(archiveContract);
	}
	
	public Page<ArchiveContract> findPage(Page<ArchiveContract> page, ArchiveContract archiveContract) {
		return super.findPage(page, archiveContract);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveContract archiveContract) {
		super.save(archiveContract);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveContract archiveContract) {
		super.delete(archiveContract);
	}
	
}
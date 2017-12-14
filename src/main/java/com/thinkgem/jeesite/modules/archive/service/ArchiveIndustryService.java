/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveIndustry;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveIndustryDao;

/**
 * 行业分类Service
 * @author spark
 * @version 2017-12-13
 */
@Service
@Transactional(readOnly = true)
public class ArchiveIndustryService extends CrudService<ArchiveIndustryDao, ArchiveIndustry> {

	public ArchiveIndustry get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveIndustry> findList(ArchiveIndustry archiveIndustry) {
		return super.findList(archiveIndustry);
	}
	
	public Page<ArchiveIndustry> findPage(Page<ArchiveIndustry> page, ArchiveIndustry archiveIndustry) {
		return super.findPage(page, archiveIndustry);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveIndustry archiveIndustry) {
		super.save(archiveIndustry);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveIndustry archiveIndustry) {
		super.delete(archiveIndustry);
	}
	
}
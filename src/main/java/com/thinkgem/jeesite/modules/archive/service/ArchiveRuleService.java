/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveRule;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveRuleDao;

/**
 * 分类规则Service
 * @author lisy
 * @version 2017-12-11
 */
@Service
@Transactional(readOnly = true)
public class ArchiveRuleService extends CrudService<ArchiveRuleDao, ArchiveRule> {

	public ArchiveRule get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveRule> findList(ArchiveRule archiveRule) {
		return super.findList(archiveRule);
	}
	
	public Page<ArchiveRule> findPage(Page<ArchiveRule> page, ArchiveRule archiveRule) {
		return super.findPage(page, archiveRule);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveRule archiveRule) {
		super.save(archiveRule);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveRule archiveRule) {
		super.delete(archiveRule);
	}
	
}
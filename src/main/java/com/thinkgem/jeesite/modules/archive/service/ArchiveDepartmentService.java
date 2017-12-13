/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveDepartment;
import com.thinkgem.jeesite.modules.archive.dao.ArchiveDepartmentDao;

/**
 * 部门分类Service
 * @author spark
 * @version 2017-12-12
 */
@Service
@Transactional(readOnly = true)
public class ArchiveDepartmentService extends CrudService<ArchiveDepartmentDao, ArchiveDepartment> {

	public ArchiveDepartment get(String id) {
		return super.get(id);
	}
	
	public List<ArchiveDepartment> findList(ArchiveDepartment archiveDepartment) {
		return super.findList(archiveDepartment);
	}
	
	public Page<ArchiveDepartment> findPage(Page<ArchiveDepartment> page, ArchiveDepartment archiveDepartment) {
		return super.findPage(page, archiveDepartment);
	}
	
	@Transactional(readOnly = false)
	public void save(ArchiveDepartment archiveDepartment) {
		super.save(archiveDepartment);
	}
	
	@Transactional(readOnly = false)
	public void delete(ArchiveDepartment archiveDepartment) {
		super.delete(archiveDepartment);
	}
	
}
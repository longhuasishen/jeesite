/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
import com.thinkgem.jeesite.modules.doc.dao.DocDepartmentDao;

/**
 * 部门档案Service
 * @author spark
 * @version 2017-12-14
 */
@Service
@Transactional(readOnly = true)
public class DocDepartmentService extends CrudService<DocDepartmentDao, DocDepartment> {

	public DocDepartment get(String id) {
		return super.get(id);
	}
	
	public List<DocDepartment> findList(DocDepartment docDepartment) {
		return super.findList(docDepartment);
	}
	
	public Page<DocDepartment> findPage(Page<DocDepartment> page, DocDepartment docDepartment) {
		return super.findPage(page, docDepartment);
	}
	
	@Transactional(readOnly = false)
	public void save(DocDepartment docDepartment) {
		super.save(docDepartment);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocDepartment docDepartment) {
		super.delete(docDepartment);
	}
	
}
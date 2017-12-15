/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocRepertory;
import com.thinkgem.jeesite.modules.doc.dao.DocRepertoryDao;

/**
 * 仓库档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocRepertoryService extends CrudService<DocRepertoryDao, DocRepertory> {

	public DocRepertory get(String id) {
		return super.get(id);
	}
	
	public List<DocRepertory> findList(DocRepertory docRepertory) {
		return super.findList(docRepertory);
	}
	
	public Page<DocRepertory> findPage(Page<DocRepertory> page, DocRepertory docRepertory) {
		return super.findPage(page, docRepertory);
	}
	
	@Transactional(readOnly = false)
	public void save(DocRepertory docRepertory) {
		super.save(docRepertory);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocRepertory docRepertory) {
		super.delete(docRepertory);
	}
	
}
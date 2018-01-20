/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocSpecialreq;
import com.thinkgem.jeesite.modules.doc.dao.DocSpecialreqDao;

/**
 * 特殊要求档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocSpecialreqService extends CrudService<DocSpecialreqDao, DocSpecialreq> {

	public DocSpecialreq get(String id) {
		return super.get(id);
	}
	
	public List<DocSpecialreq> findList(DocSpecialreq docSpecialreq) {
		return super.findList(docSpecialreq);
	}
	
	public Page<DocSpecialreq> findPage(Page<DocSpecialreq> page, DocSpecialreq docSpecialreq) {
		return super.findPage(page, docSpecialreq);
	}
	
	@Transactional(readOnly = false)
	public void save(DocSpecialreq docSpecialreq) {
		super.save(docSpecialreq);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocSpecialreq docSpecialreq) {
		super.delete(docSpecialreq);
	}
	public List<DocSpecialreq> treeData(DocSpecialreq docSpecialreq) {
		return dao.treeData(docSpecialreq);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocPump;
import com.thinkgem.jeesite.modules.doc.dao.DocPumpDao;

/**
 * 泵档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocPumpService extends CrudService<DocPumpDao, DocPump> {

	public DocPump get(String id) {
		return super.get(id);
	}
	
	public List<DocPump> findList(DocPump docPump) {
		return super.findList(docPump);
	}
	
	public Page<DocPump> findPage(Page<DocPump> page, DocPump docPump) {
		return super.findPage(page, docPump);
	}
	
	@Transactional(readOnly = false)
	public void save(DocPump docPump) {
		super.save(docPump);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocPump docPump) {
		super.delete(docPump);
	}

	public List<DocPump> treeData(DocPump docPump) {
		return dao.treeData(docPump);
	}
}
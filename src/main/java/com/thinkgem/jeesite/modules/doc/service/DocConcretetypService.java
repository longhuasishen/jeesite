/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocConcretetyp;
import com.thinkgem.jeesite.modules.doc.dao.DocConcretetypDao;

/**
 * 原材料类型档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocConcretetypService extends CrudService<DocConcretetypDao, DocConcretetyp> {

	public DocConcretetyp get(String id) {
		return super.get(id);
	}
	
	public List<DocConcretetyp> findList(DocConcretetyp docConcretetyp) {
		return super.findList(docConcretetyp);
	}
	
	public Page<DocConcretetyp> findPage(Page<DocConcretetyp> page, DocConcretetyp docConcretetyp) {
		return super.findPage(page, docConcretetyp);
	}
	
	@Transactional(readOnly = false)
	public void save(DocConcretetyp docConcretetyp) {
		super.save(docConcretetyp);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocConcretetyp docConcretetyp) {
		super.delete(docConcretetyp);
	}

	public List<DocConcretetyp> findListByArray(String[] s) {
		return super.findList(s);
	}

}
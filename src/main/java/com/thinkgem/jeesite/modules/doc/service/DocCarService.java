/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocCar;
import com.thinkgem.jeesite.modules.doc.dao.DocCarDao;

/**
 * 车辆档案Service
 * @author spark
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocCarService extends CrudService<DocCarDao, DocCar> {

	public DocCar get(String id) {
		return super.get(id);
	}
	
	public List<DocCar> findList(DocCar docCar) {
		return super.findList(docCar);
	}
	
	public Page<DocCar> findPage(Page<DocCar> page, DocCar docCar) {
		return super.findPage(page, docCar);
	}
	
	@Transactional(readOnly = false)
	public void save(DocCar docCar) {
		super.save(docCar);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocCar docCar) {
		super.delete(docCar);
	}
	
}
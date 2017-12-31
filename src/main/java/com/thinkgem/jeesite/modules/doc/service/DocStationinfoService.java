/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.doc.entity.DocStationinfo;
import com.thinkgem.jeesite.modules.doc.dao.DocStationinfoDao;

/**
 * 搅拌站点信息Service
 * @author lisy
 * @version 2017-12-17
 */
@Service
@Transactional(readOnly = true)
public class DocStationinfoService extends CrudService<DocStationinfoDao, DocStationinfo> {

	public DocStationinfo get(String id) {
		return super.get(id);
	}
	
	public List<DocStationinfo> findList(DocStationinfo docStationinfo) {
		return super.findList(docStationinfo);
	}
	
	public Page<DocStationinfo> findPage(Page<DocStationinfo> page, DocStationinfo docStationinfo) {
		return super.findPage(page, docStationinfo);
	}
	
	@Transactional(readOnly = false)
	public void save(DocStationinfo docStationinfo) {
		super.save(docStationinfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocStationinfo docStationinfo) {
		super.delete(docStationinfo);
	}
	
}
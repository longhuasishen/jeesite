/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.produces.entity.CoordinateRatioNotice;
import com.thinkgem.jeesite.modules.produces.dao.CoordinateRatioNoticeDao;

/**
 * 配合比通知单Service
 * @author spark
 * @version 2018-01-21
 */
@Service
@Transactional(readOnly = true)
public class CoordinateRatioNoticeService extends CrudService<CoordinateRatioNoticeDao, CoordinateRatioNotice> {

	public CoordinateRatioNotice get(String id) {
		return super.get(id);
	}
	
	public List<CoordinateRatioNotice> findList(CoordinateRatioNotice coordinateRatioNotice) {
		return super.findList(coordinateRatioNotice);
	}
	
	public Page<CoordinateRatioNotice> findPage(Page<CoordinateRatioNotice> page, CoordinateRatioNotice coordinateRatioNotice) {
		return super.findPage(page, coordinateRatioNotice);
	}
	
	@Transactional(readOnly = false)
	public void save(CoordinateRatioNotice coordinateRatioNotice) {
		super.save(coordinateRatioNotice);
	}
	
	@Transactional(readOnly = false)
	public void delete(CoordinateRatioNotice coordinateRatioNotice) {
		super.delete(coordinateRatioNotice);
	}
	
}
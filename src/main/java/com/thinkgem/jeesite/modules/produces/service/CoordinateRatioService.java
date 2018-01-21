/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.produces.entity.CoordinateRatio;
import com.thinkgem.jeesite.modules.produces.dao.CoordinateRatioDao;

/**
 * 配合比系列表Service
 * @author spark
 * @version 2018-01-20
 */
@Service
@Transactional(readOnly = true)
public class CoordinateRatioService extends CrudService<CoordinateRatioDao, CoordinateRatio> {

	public CoordinateRatio get(String id) {
		return super.get(id);
	}
	
	public List<CoordinateRatio> findList(CoordinateRatio coordinateRatio) {
		return super.findList(coordinateRatio);
	}
	
	public Page<CoordinateRatio> findPage(Page<CoordinateRatio> page, CoordinateRatio coordinateRatio) {
		return super.findPage(page, coordinateRatio);
	}
	
	@Transactional(readOnly = false)
	public void save(CoordinateRatio coordinateRatio) {
		super.save(coordinateRatio);
	}
	
	@Transactional(readOnly = false)
	public void delete(CoordinateRatio coordinateRatio) {
		super.delete(coordinateRatio);
	}

	public List<CoordinateRatio> selNotice(CoordinateRatio coordinateRatio) {
		return dao.selNotice(coordinateRatio);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.produces.entity.CarsDispatch;
import com.thinkgem.jeesite.modules.produces.dao.CarsDispatchDao;

/**
 * 车辆调度Service
 * @author spark
 * @version 2018-01-20
 */
@Service
@Transactional(readOnly = true)
public class CarsDispatchService extends CrudService<CarsDispatchDao, CarsDispatch> {

	public CarsDispatch get(String id) {
		return super.get(id);
	}
	
	public List<CarsDispatch> findList(CarsDispatch carsDispatch) {
		return super.findList(carsDispatch);
	}
	
	public Page<CarsDispatch> findPage(Page<CarsDispatch> page, CarsDispatch carsDispatch) {
		return super.findPage(page, carsDispatch);
	}
	
	@Transactional(readOnly = false)
	public void save(CarsDispatch carsDispatch) {
		super.save(carsDispatch);
	}
	
	@Transactional(readOnly = false)
	public void delete(CarsDispatch carsDispatch) {
		super.delete(carsDispatch);
	}
	
}
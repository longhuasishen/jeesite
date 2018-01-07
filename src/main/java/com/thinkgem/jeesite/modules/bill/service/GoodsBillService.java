/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bill.entity.GoodsBill;
import com.thinkgem.jeesite.modules.bill.dao.GoodsBillDao;

/**
 * 发货单Service
 * @author spark
 * @version 2018-01-07
 */
@Service
@Transactional(readOnly = true)
public class GoodsBillService extends CrudService<GoodsBillDao, GoodsBill> {

	public GoodsBill get(String id) {
		return super.get(id);
	}
	
	public List<GoodsBill> findList(GoodsBill goodsBill) {
		return super.findList(goodsBill);
	}
	
	public Page<GoodsBill> findPage(Page<GoodsBill> page, GoodsBill goodsBill) {
		return super.findPage(page, goodsBill);
	}
	
	@Transactional(readOnly = false)
	public void save(GoodsBill goodsBill) {
		super.save(goodsBill);
	}
	
	@Transactional(readOnly = false)
	public void delete(GoodsBill goodsBill) {
		super.delete(goodsBill);
	}
	
}
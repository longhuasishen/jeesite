/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.stock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.stock.entity.OutsourceOiling;
import com.thinkgem.jeesite.modules.stock.dao.OutsourceOilingDao;

/**
 * 外购加油登记Service
 * @author spark
 * @version 2018-01-07
 */
@Service
@Transactional(readOnly = true)
public class OutsourceOilingService extends CrudService<OutsourceOilingDao, OutsourceOiling> {

	public OutsourceOiling get(String id) {
		return super.get(id);
	}
	
	public List<OutsourceOiling> findList(OutsourceOiling outsourceOiling) {
		return super.findList(outsourceOiling);
	}
	
	public Page<OutsourceOiling> findPage(Page<OutsourceOiling> page, OutsourceOiling outsourceOiling) {
		return super.findPage(page, outsourceOiling);
	}
	
	@Transactional(readOnly = false)
	public void save(OutsourceOiling outsourceOiling) {
		super.save(outsourceOiling);
	}
	
	@Transactional(readOnly = false)
	public void delete(OutsourceOiling outsourceOiling) {
		super.delete(outsourceOiling);
	}
	
}
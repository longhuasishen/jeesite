/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.stock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.stock.entity.InverseKind;
import com.thinkgem.jeesite.modules.stock.dao.InverseKindDao;

/**
 * 形态转换Service
 * @author spark
 * @version 2018-01-07
 */
@Service
@Transactional(readOnly = true)
public class InverseKindService extends CrudService<InverseKindDao, InverseKind> {

	public InverseKind get(String id) {
		return super.get(id);
	}
	
	public List<InverseKind> findList(InverseKind inverseKind) {
		return super.findList(inverseKind);
	}
	
	public Page<InverseKind> findPage(Page<InverseKind> page, InverseKind inverseKind) {
		return super.findPage(page, inverseKind);
	}
	
	@Transactional(readOnly = false)
	public void save(InverseKind inverseKind) {
		super.save(inverseKind);
	}
	
	@Transactional(readOnly = false)
	public void delete(InverseKind inverseKind) {
		super.delete(inverseKind);
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.produces.entity.ProduceDesign;
import com.thinkgem.jeesite.modules.produces.dao.ProduceDesignDao;

/**
 * 生产计划单Service
 * @author spark
 * @version 2018-01-04
 */
@Service
@Transactional(readOnly = true)
public class ProduceDesignService extends CrudService<ProduceDesignDao, ProduceDesign> {

	public ProduceDesign get(String id) {
		return super.get(id);
	}
	
	public List<ProduceDesign> findList(ProduceDesign produceDesign) {
		return super.findList(produceDesign);
	}
	
	public Page<ProduceDesign> findPage(Page<ProduceDesign> page, ProduceDesign produceDesign) {
		return super.findPage(page, produceDesign);
	}
	
	@Transactional(readOnly = false)
	public void save(ProduceDesign produceDesign) {
		super.save(produceDesign);
	}
	
	@Transactional(readOnly = false)
	public void delete(ProduceDesign produceDesign) {
		super.delete(produceDesign);
	}

	public List<ProduceDesign> selNotice(ProduceDesign produceDesign) {
		return dao.selNotice(produceDesign);
	}
	
}
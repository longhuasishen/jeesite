/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.financedoc.entity.DocBusinessInitpay;
import com.thinkgem.jeesite.modules.financedoc.dao.DocBusinessInitpayDao;

/**
 * 业务应付期初余额Service
 * @author lisy
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocBusinessInitpayService extends CrudService<DocBusinessInitpayDao, DocBusinessInitpay> {

	public DocBusinessInitpay get(String id) {
		return super.get(id);
	}
	
	public List<DocBusinessInitpay> findList(DocBusinessInitpay docBusinessInitpay) {
		return super.findList(docBusinessInitpay);
	}
	
	public Page<DocBusinessInitpay> findPage(Page<DocBusinessInitpay> page, DocBusinessInitpay docBusinessInitpay) {
		return super.findPage(page, docBusinessInitpay);
	}
	
	@Transactional(readOnly = false)
	public void save(DocBusinessInitpay docBusinessInitpay) {
		super.save(docBusinessInitpay);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocBusinessInitpay docBusinessInitpay) {
		super.delete(docBusinessInitpay);
	}
	
}
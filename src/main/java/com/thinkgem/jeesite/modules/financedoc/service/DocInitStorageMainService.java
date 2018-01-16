/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.service;

import java.util.List;

import com.thinkgem.jeesite.modules.financedoc.dao.DocInitStorageDetailDao;
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageDetail;
import com.thinkgem.jeesite.modules.purchase.dao.ContractPurchaseDetailDao;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageMain;
import com.thinkgem.jeesite.modules.financedoc.dao.DocInitStorageMainDao;

/**
 * 期初入库Service
 * @author lisy
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class DocInitStorageMainService extends CrudService<DocInitStorageMainDao, DocInitStorageMain> {

	@Autowired
	private DocInitStorageDetailDao detailDao;

	public DocInitStorageMain get(String id) {
		return super.get(id);
	}
	
	public List<DocInitStorageMain> findList(DocInitStorageMain docInitStorageMain) {
		return super.findList(docInitStorageMain);
	}
	
	public Page<DocInitStorageMain> findPage(Page<DocInitStorageMain> page, DocInitStorageMain docInitStorageMain) {
		return super.findPage(page, docInitStorageMain);
	}
	
	@Transactional(readOnly = false)
	public void save(DocInitStorageMain docInitStorageMain) {
		super.save(docInitStorageMain);
	}
	
	@Transactional(readOnly = false)
	public void delete(DocInitStorageMain docInitStorageMain) {
		super.delete(docInitStorageMain);
	}

	@Transactional(readOnly = false)
    public void saveAll(DocInitStorageMain docInitStorageMain, List<DocInitStorageDetail> detailList) {
		super.save(docInitStorageMain);
		if(!detailList.isEmpty()) {
			for(DocInitStorageDetail detail : detailList){
				DocInitStorageDetail temp = detailDao.get(detail.getId());
				if(null != temp){
					detail.setId(temp.getId());
				}
			}
			detailDao.deleteByStorage(docInitStorageMain.getStorageCode());
			detailDao.saveList(detailList);
		}
    }
}
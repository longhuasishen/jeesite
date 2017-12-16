/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;

/**
 * 供应商档案DAO接口
 * @author lisy
 * @version 2017-12-16
 */
@MyBatisDao
public interface DocSupplierDao extends CrudDao<DocSupplier> {
	
}
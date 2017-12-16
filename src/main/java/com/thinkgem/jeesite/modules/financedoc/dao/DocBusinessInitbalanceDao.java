/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.financedoc.entity.DocBusinessInitbalance;

/**
 * 业务应收期初余额DAO接口
 * @author lisy
 * @version 2017-12-15
 */
@MyBatisDao
public interface DocBusinessInitbalanceDao extends CrudDao<DocBusinessInitbalance> {
	
}
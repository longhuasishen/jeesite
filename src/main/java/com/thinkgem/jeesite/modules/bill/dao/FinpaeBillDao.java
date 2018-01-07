/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bill.entity.FinpaeBill;

/**
 * 财务应收调账单DAO接口
 * @author spark
 * @version 2018-01-05
 */
@MyBatisDao
public interface FinpaeBillDao extends CrudDao<FinpaeBill> {
	
}
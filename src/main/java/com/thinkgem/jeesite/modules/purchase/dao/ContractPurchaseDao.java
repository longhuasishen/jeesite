/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchase;

/**
 * 采购合同DAO接口
 * @author lisy
 * @version 2017-12-24
 */
@MyBatisDao
public interface ContractPurchaseDao extends CrudDao<ContractPurchase> {
	
}
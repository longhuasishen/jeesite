/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplement;

/**
 * 采购合同补充协议DAO接口
 * @author lisy
 * @version 2018-01-13
 */
@MyBatisDao
public interface ContractPurchaseSupplementDao extends CrudDao<ContractPurchaseSupplement> {
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseStorageDetail;

import java.util.List;

/**
 * 采购入库明细DAO接口
 * @author lisy
 * @version 2018-01-14
 */
@MyBatisDao
public interface ContractPurchaseStorageDetailDao extends CrudDao<ContractPurchaseStorageDetail> {

    void deleteByStorage(String storageCode);

    void saveList(List<ContractPurchaseStorageDetail> detailList);
}
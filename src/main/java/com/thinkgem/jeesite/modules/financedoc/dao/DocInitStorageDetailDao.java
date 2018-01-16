/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.financedoc.entity.DocInitStorageDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 期初入库DAO接口
 * @author lisy
 * @version 2018-01-16
 */
@MyBatisDao
public interface DocInitStorageDetailDao extends CrudDao<DocInitStorageDetail> {
    public void saveList(List<DocInitStorageDetail> detailList);
    public int deleteByStorage(@Param("storageCode")String storageCode);
}
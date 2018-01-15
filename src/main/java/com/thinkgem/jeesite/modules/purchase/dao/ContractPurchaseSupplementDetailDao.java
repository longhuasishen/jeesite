/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseDetail;
import com.thinkgem.jeesite.modules.purchase.entity.ContractPurchaseSupplementDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 采购合同补充协议明细DAO接口
 * @author lisy
 * @version 2018-01-13
 */
@MyBatisDao
public interface ContractPurchaseSupplementDetailDao extends CrudDao<ContractPurchaseSupplementDetail> {
    public void saveList(List<ContractPurchaseSupplementDetail> detailList);
    public ContractPurchaseDetail getByContraceCode(@Param("contractCode")String contractCode);
    public int deleteByContract(@Param("contractCode")String contractCode);
}
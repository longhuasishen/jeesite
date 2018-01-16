/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.contract.entity.ContractSalesWatermeth;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 销售合同浇灌方法单价DAO接口
 * @author spark
 * @version 2018-01-16
 */
@MyBatisDao
public interface ContractSalesWatermethDao extends CrudDao<ContractSalesWatermeth> {
    public void saveList(List<ContractSalesWatermeth> detailList);
    public ContractSalesWatermeth getByContraceId(@Param("contractId")String contractId);
    public int deleteByContract(@Param("contractId")String contractId);
}
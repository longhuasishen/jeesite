/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.contract.entity.ContractSales;

import java.util.List;

/**
 * 销售合同DAO接口
 * @author spark
 * @version 2017-12-30
 */
@MyBatisDao
public interface ContractSalesDao extends CrudDao<ContractSales> {
    public List<ContractSales> findCusProject(ContractSales contractSales);
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.produces.entity.ProduceDesign;

/**
 * 生产计划单DAO接口
 * @author spark
 * @version 2018-01-04
 */
@MyBatisDao
public interface ProduceDesignDao extends CrudDao<ProduceDesign> {
	
}
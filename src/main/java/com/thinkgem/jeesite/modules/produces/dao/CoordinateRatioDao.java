/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.produces.entity.CoordinateRatio;

import java.util.List;

/**
 * 配合比系列表DAO接口
 * @author spark
 * @version 2018-01-20
 */
@MyBatisDao
public interface CoordinateRatioDao extends CrudDao<CoordinateRatio> {
    public List<CoordinateRatio> selNotice(CoordinateRatio coordinateRatio);
	
}
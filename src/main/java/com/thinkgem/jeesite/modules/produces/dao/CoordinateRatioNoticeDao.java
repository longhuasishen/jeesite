/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.produces.entity.CoordinateRatioNotice;

/**
 * 配合比通知单DAO接口
 * @author spark
 * @version 2018-01-21
 */
@MyBatisDao
public interface CoordinateRatioNoticeDao extends CrudDao<CoordinateRatioNotice> {
	
}
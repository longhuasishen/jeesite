/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.stock.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.stock.entity.OutsourceOiling;

/**
 * 外购加油登记DAO接口
 * @author spark
 * @version 2018-01-07
 */
@MyBatisDao
public interface OutsourceOilingDao extends CrudDao<OutsourceOiling> {
	
}
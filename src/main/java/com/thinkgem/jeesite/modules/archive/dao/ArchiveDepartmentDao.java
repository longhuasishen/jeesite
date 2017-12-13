/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveDepartment;

/**
 * 部门分类DAO接口
 * @author spark
 * @version 2017-12-12
 */
@MyBatisDao
public interface ArchiveDepartmentDao extends CrudDao<ArchiveDepartment> {
	
}
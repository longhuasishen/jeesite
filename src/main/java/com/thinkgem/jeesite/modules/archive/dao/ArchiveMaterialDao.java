/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveMaterial;

/**
 * 物资分类DAO接口
 * @author lisy
 * @version 2017-12-14
 */
@MyBatisDao
public interface ArchiveMaterialDao extends CrudDao<ArchiveMaterial> {
	
}
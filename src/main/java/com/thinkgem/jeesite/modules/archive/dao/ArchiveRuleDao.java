/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveRule;

/**
 * 分类规则DAO接口
 * @author lisy
 * @version 2017-12-11
 */
@MyBatisDao
public interface ArchiveRuleDao extends CrudDao<ArchiveRule> {
	
}
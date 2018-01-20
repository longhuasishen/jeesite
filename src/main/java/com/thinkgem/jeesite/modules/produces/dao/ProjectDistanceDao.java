/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
import com.thinkgem.jeesite.modules.produces.entity.ProjectDistance;

import java.util.List;

/**
 * 工程运距管理DAO接口
 * @author spark
 * @version 2018-01-04
 */
@MyBatisDao
public interface ProjectDistanceDao extends CrudDao<ProjectDistance> {
    public List<ProjectDistance> treeData(ProjectDistance projectDistance);
}
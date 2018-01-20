/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.doc.entity.DocSpecialreq;

import java.util.List;

/**
 * 特殊要求档案DAO接口
 * @author spark
 * @version 2017-12-15
 */
@MyBatisDao
public interface DocSpecialreqDao extends CrudDao<DocSpecialreq> {
    public List<DocSpecialreq> treeData(DocSpecialreq docSpecialreq);
}
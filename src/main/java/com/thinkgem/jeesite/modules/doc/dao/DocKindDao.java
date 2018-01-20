/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.doc.entity.DocKind;

import java.util.List;

/**
 * 品种档案DAO接口
 * @author lisy
 * @version 2017-12-30
 */
@MyBatisDao
public interface DocKindDao extends CrudDao<DocKind> {
    public List<DocKind> treeData(DocKind docKind);
}
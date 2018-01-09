/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.produces.entity.ProjectDistance;
import com.thinkgem.jeesite.modules.produces.dao.ProjectDistanceDao;

/**
 * 工程运距管理Service
 * @author spark
 * @version 2018-01-04
 */
@Service
@Transactional(readOnly = true)
public class ProjectDistanceService extends CrudService<ProjectDistanceDao, ProjectDistance> {

	public ProjectDistance get(String id) {
		return super.get(id);
	}
	
	public List<ProjectDistance> findList(ProjectDistance projectDistance) {
		return super.findList(projectDistance);
	}
	
	public Page<ProjectDistance> findPage(Page<ProjectDistance> page, ProjectDistance projectDistance) {
		return super.findPage(page, projectDistance);
	}
	
	@Transactional(readOnly = false)
	public void save(ProjectDistance projectDistance) {
		super.save(projectDistance);
		if (projectDistance.getIsNewRecord()){
//			projectDistance.preInsert();
//			dao.insert(projectDistance);
		}else{
			projectDistance.preUpdate();
			dao.update(projectDistance);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(ProjectDistance projectDistance) {
		super.delete(projectDistance);
	}
	
}
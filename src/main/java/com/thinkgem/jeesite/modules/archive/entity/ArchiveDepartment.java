/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 部门分类Entity
 * @author spark
 * @version 2017-12-12
 */
public class ArchiveDepartment extends DataEntity<ArchiveDepartment> {
	
	private static final long serialVersionUID = 1L;
	private String departmentName;		// department_name
	private String departmentCode;		// department_code
	
	public ArchiveDepartment() {
		super();
	}

	public ArchiveDepartment(String id){
		super(id);
	}

	@Length(min=0, max=50, message="department_name长度必须介于 0 和 50 之间")
	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	@Length(min=0, max=12, message="department_code长度必须介于 0 和 12 之间")
	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 部门档案Entity
 * @author spark
 * @version 2017-12-14
 */
public class DocDepartment extends DataEntity<DocDepartment> {
	
	private static final long serialVersionUID = 1L;
	private String departmentCode;		// 部门编码
	private String departmentName;		// 部门名称
	private String departmentCategory;		// 所属分类
	private String managerPerson;		// 负责人
	private String phoneNo;		// 联系电话
	private String firstUnit;		// 地址
	private String comment;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public DocDepartment() {
		super();
	}

	public DocDepartment(String id){
		super(id);
	}

	@Length(min=1, max=16, message="部门编码长度必须介于 1 和 16 之间")
	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	
	@Length(min=0, max=120, message="部门名称长度必须介于 0 和 120 之间")
	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	@Length(min=0, max=60, message="所属分类长度必须介于 0 和 60 之间")
	public String getDepartmentCategory() {
		return departmentCategory;
	}

	public void setDepartmentCategory(String departmentCategory) {
		this.departmentCategory = departmentCategory;
	}
	
	@Length(min=0, max=60, message="负责人长度必须介于 0 和 60 之间")
	public String getManagerPerson() {
		return managerPerson;
	}

	public void setManagerPerson(String managerPerson) {
		this.managerPerson = managerPerson;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	@Length(min=0, max=60, message="地址长度必须介于 0 和 60 之间")
	public String getFirstUnit() {
		return firstUnit;
	}

	public void setFirstUnit(String firstUnit) {
		this.firstUnit = firstUnit;
	}
	
	@Length(min=0, max=12, message="备注长度必须介于 0 和 12 之间")
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Length(min=0, max=60, message="ext_field1长度必须介于 0 和 60 之间")
	public String getExtField1() {
		return extField1;
	}

	public void setExtField1(String extField1) {
		this.extField1 = extField1;
	}
	
	@Length(min=0, max=60, message="ext_field2长度必须介于 0 和 60 之间")
	public String getExtField2() {
		return extField2;
	}

	public void setExtField2(String extField2) {
		this.extField2 = extField2;
	}
	
	@Length(min=0, max=120, message="ext_field3长度必须介于 0 和 120 之间")
	public String getExtField3() {
		return extField3;
	}

	public void setExtField3(String extField3) {
		this.extField3 = extField3;
	}
	
	@Length(min=0, max=1000, message="remark长度必须介于 0 和 1000 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
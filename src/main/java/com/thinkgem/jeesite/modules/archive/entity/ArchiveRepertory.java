/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 仓库分类Entity
 * @author spark
 * @version 2017-12-13
 */
public class ArchiveRepertory extends DataEntity<ArchiveRepertory> {
	
	private static final long serialVersionUID = 1L;
	private String repertoryName;		// repertory_name
	private String repertoryCode;		// repertory_code
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public ArchiveRepertory() {
		super();
	}

	public ArchiveRepertory(String id){
		super(id);
	}

	@Length(min=0, max=50, message="repertory_name长度必须介于 0 和 50 之间")
	public String getRepertoryName() {
		return repertoryName;
	}

	public void setRepertoryName(String repertoryName) {
		this.repertoryName = repertoryName;
	}
	
	@Length(min=0, max=12, message="repertory_code长度必须介于 0 和 12 之间")
	public String getRepertoryCode() {
		return repertoryCode;
	}

	public void setRepertoryCode(String repertoryCode) {
		this.repertoryCode = repertoryCode;
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
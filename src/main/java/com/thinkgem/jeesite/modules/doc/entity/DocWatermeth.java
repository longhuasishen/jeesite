/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 浇灌方式档案Entity
 * @author spark
 * @version 2017-12-15
 */
public class DocWatermeth extends DataEntity<DocWatermeth> {
	
	private static final long serialVersionUID = 1L;
	private String watermethCode;		// 浇灌方式编码
	private String watermethName;		// 浇灌方法名称
	private String comment;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public DocWatermeth() {
		super();
	}

	public DocWatermeth(String id){
		super(id);
	}

	@Length(min=1, max=16, message="浇灌方式编码长度必须介于 1 和 16 之间")
	public String getWatermethCode() {
		return watermethCode;
	}

	public void setWatermethCode(String watermethCode) {
		this.watermethCode = watermethCode;
	}
	
	@Length(min=0, max=120, message="浇灌方法名称长度必须介于 0 和 120 之间")
	public String getWatermethName() {
		return watermethName;
	}

	public void setWatermethName(String watermethName) {
		this.watermethName = watermethName;
	}
	
	@Length(min=0, max=120, message="备注长度必须介于 0 和 120 之间")
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
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 司机档案Entity
 * @author spark
 * @version 2017-12-15
 */
public class DocDriver extends DataEntity<DocDriver> {
	
	private static final long serialVersionUID = 1L;
	private String driverCode;		// 司机编码
	private String driverName;		// 司机名称
	private String carNo;		// 车牌号码
	private String licenceNo;		// 驾驶证号码
	private String comment;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark


	public DocOfficework getDocOfficework() {
		return docOfficework;
	}

	public void setDocOfficework(DocOfficework docOfficework) {
		this.docOfficework = docOfficework;
	}

	public DocCar getDocCar() {
		return docCar;
	}

	public void setDocCar(DocCar docCar) {
		this.docCar = docCar;
	}

	private DocCar docCar;
	private DocOfficework docOfficework;
	
	public DocDriver() {
		super();
	}

	public DocDriver(String id){
		super(id);
	}

	@Length(min=1, max=16, message="司机编码长度必须介于 1 和 16 之间")
	public String getDriverCode() {
		return driverCode;
	}

	public void setDriverCode(String driverCode) {
		this.driverCode = driverCode;
	}
	
	@Length(min=0, max=120, message="司机名称长度必须介于 0 和 120 之间")
	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	
	@Length(min=0, max=60, message="车牌号码长度必须介于 0 和 60 之间")
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	
	@Length(min=0, max=60, message="驾驶证号码长度必须介于 0 和 60 之间")
	public String getLicenceNo() {
		return licenceNo;
	}

	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
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
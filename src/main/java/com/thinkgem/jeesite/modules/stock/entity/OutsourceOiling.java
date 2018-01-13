/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.stock.entity;

import com.thinkgem.jeesite.modules.doc.entity.DocCar;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 外购加油登记Entity
 * @author spark
 * @version 2018-01-07
 */
public class OutsourceOiling extends DataEntity<OutsourceOiling> {
	
	private static final long serialVersionUID = 1L;
	private String oilingDate;		// 日期
	private String sampleName;		// 样品名称
	private String supplierName;		// 供应商名称
	private String oilingCount;		// 数量
	private String oilingPrice;		// 单价
	private String oilingAmount;		// 金额
	private String oilingPerson;		// 结算人
	private String carNo;		// 车号
	private String oilingRemark;		// 备注
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String checkStatus;		// 审核状态
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark

	private DocSupplier docSupplier;

	public DocSupplier getDocSupplier() {
		return docSupplier;
	}

	public void setDocSupplier(DocSupplier docSupplier) {
		this.docSupplier = docSupplier;
	}

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

	private DocOfficework docOfficework;
	private DocCar docCar;
	
	public OutsourceOiling() {
		super();
	}

	public OutsourceOiling(String id){
		super(id);
	}

	@Length(min=1, max=20, message="日期长度必须介于 1 和 20 之间")
	public String getOilingDate() {
		return oilingDate;
	}

	public void setOilingDate(String oilingDate) {
		this.oilingDate = oilingDate;
	}
	
	@Length(min=0, max=60, message="样品名称长度必须介于 0 和 60 之间")
	public String getSampleName() {
		return sampleName;
	}

	public void setSampleName(String sampleName) {
		this.sampleName = sampleName;
	}
	
	@Length(min=0, max=120, message="供应商名称长度必须介于 0 和 120 之间")
	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	
	@Length(min=0, max=10, message="数量长度必须介于 0 和 10 之间")
	public String getOilingCount() {
		return oilingCount;
	}

	public void setOilingCount(String oilingCount) {
		this.oilingCount = oilingCount;
	}
	
	@Length(min=0, max=15, message="单价长度必须介于 0 和 15 之间")
	public String getOilingPrice() {
		return oilingPrice;
	}

	public void setOilingPrice(String oilingPrice) {
		this.oilingPrice = oilingPrice;
	}
	
	@Length(min=0, max=15, message="金额长度必须介于 0 和 15 之间")
	public String getOilingAmount() {
		return oilingAmount;
	}

	public void setOilingAmount(String oilingAmount) {
		this.oilingAmount = oilingAmount;
	}
	
	@Length(min=0, max=60, message="结算人长度必须介于 0 和 60 之间")
	public String getOilingPerson() {
		return oilingPerson;
	}

	public void setOilingPerson(String oilingPerson) {
		this.oilingPerson = oilingPerson;
	}
	
	@Length(min=0, max=32, message="车号长度必须介于 0 和 32 之间")
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getOilingRemark() {
		return oilingRemark;
	}

	public void setOilingRemark(String oilingRemark) {
		this.oilingRemark = oilingRemark;
	}
	
	@Length(min=0, max=60, message="制单人长度必须介于 0 和 60 之间")
	public String getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}
	
	@Length(min=0, max=60, message="审核人长度必须介于 0 和 60 之间")
	public String getCheckPerson() {
		return checkPerson;
	}

	public void setCheckPerson(String checkPerson) {
		this.checkPerson = checkPerson;
	}
	
	@Length(min=0, max=20, message="制单日期长度必须介于 0 和 20 之间")
	public String getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(String makeDate) {
		this.makeDate = makeDate;
	}
	
	@Length(min=0, max=20, message="审核日期长度必须介于 0 和 20 之间")
	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	
	@Length(min=0, max=1, message="审核状态长度必须介于 0 和 1 之间")
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
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
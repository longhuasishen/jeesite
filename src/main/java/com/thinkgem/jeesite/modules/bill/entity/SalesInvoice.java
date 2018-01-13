/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 销售发票Entity
 * @author spark
 * @version 2018-01-07
 */
public class SalesInvoice extends DataEntity<SalesInvoice> {
	
	private static final long serialVersionUID = 1L;
	private String invoiceNo;		// 发票号码
	private String invoiceDate;		// 发票日期
	private String customAbbr;		// 客户简称
	private String taxNum;		// 税号
	private String customAcc;		// 客户账号
	private String bankName;		// 银行名称
	private String customPhone;		// 电话号码
	private String customAddr;		// 地址
	private String checkStatus;		// 审核状态
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String invoiceRemark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public SalesInvoice() {
		super();
	}

	public SalesInvoice(String id){
		super(id);
	}

	@Length(min=1, max=32, message="发票号码长度必须介于 1 和 32 之间")
	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	
	@Length(min=0, max=20, message="发票日期长度必须介于 0 和 20 之间")
	public String getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	
	@Length(min=0, max=60, message="客户简称长度必须介于 0 和 60 之间")
	public String getCustomAbbr() {
		return customAbbr;
	}

	public void setCustomAbbr(String customAbbr) {
		this.customAbbr = customAbbr;
	}
	
	@Length(min=0, max=32, message="税号长度必须介于 0 和 32 之间")
	public String getTaxNum() {
		return taxNum;
	}

	public void setTaxNum(String taxNum) {
		this.taxNum = taxNum;
	}
	
	@Length(min=0, max=32, message="客户账号长度必须介于 0 和 32 之间")
	public String getCustomAcc() {
		return customAcc;
	}

	public void setCustomAcc(String customAcc) {
		this.customAcc = customAcc;
	}
	
	@Length(min=0, max=60, message="银行名称长度必须介于 0 和 60 之间")
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
	@Length(min=0, max=20, message="电话号码长度必须介于 0 和 20 之间")
	public String getCustomPhone() {
		return customPhone;
	}

	public void setCustomPhone(String customPhone) {
		this.customPhone = customPhone;
	}
	
	@Length(min=0, max=120, message="地址长度必须介于 0 和 120 之间")
	public String getCustomAddr() {
		return customAddr;
	}

	public void setCustomAddr(String customAddr) {
		this.customAddr = customAddr;
	}
	
	@Length(min=0, max=1, message="审核状态长度必须介于 0 和 1 之间")
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
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
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getInvoiceRemark() {
		return invoiceRemark;
	}

	public void setInvoiceRemark(String invoiceRemark) {
		this.invoiceRemark = invoiceRemark;
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
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 合同应收Entity
 * @author spark
 * @version 2018-01-07
 */
public class ContractReceivable extends DataEntity<ContractReceivable> {
	
	private static final long serialVersionUID = 1L;
	private String billNo;		// 单据编号
	private String billDate;		// 应收款日期
	private String customAbbr;		// 客户简称
	private String monthAmount;		// 本月应收总额
	private String contractAmount;		// 合同应收金额
	private String checkStatus;		// 审核状态
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String contractRemark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public ContractReceivable() {
		super();
	}

	public ContractReceivable(String id){
		super(id);
	}

	@Length(min=1, max=20, message="单据编号长度必须介于 1 和 20 之间")
	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	
	@Length(min=0, max=20, message="应收款日期长度必须介于 0 和 20 之间")
	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	
	@Length(min=0, max=60, message="客户简称长度必须介于 0 和 60 之间")
	public String getCustomAbbr() {
		return customAbbr;
	}

	public void setCustomAbbr(String customAbbr) {
		this.customAbbr = customAbbr;
	}
	
	@Length(min=0, max=20, message="本月应收总额长度必须介于 0 和 20 之间")
	public String getMonthAmount() {
		return monthAmount;
	}

	public void setMonthAmount(String monthAmount) {
		this.monthAmount = monthAmount;
	}
	
	@Length(min=0, max=20, message="合同应收金额长度必须介于 0 和 20 之间")
	public String getContractAmount() {
		return contractAmount;
	}

	public void setContractAmount(String contractAmount) {
		this.contractAmount = contractAmount;
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
	public String getContractRemark() {
		return contractRemark;
	}

	public void setContractRemark(String contractRemark) {
		this.contractRemark = contractRemark;
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
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 收款单Entity
 * @author spark
 * @version 2018-01-07
 */
public class IncomeBill extends DataEntity<IncomeBill> {
	
	private static final long serialVersionUID = 1L;
	private String billNo;		// 单据编号
	private String billDate;		// 收款日期
	private String customName;		// 客户名称
	private String projectName;		// 工程名称
	private String payWay;		// 支付方式
	private String incomeAmount;		// 收款金额
	private String withNo;		// 付款单主表单据编号
	private String bankName;		// 开户银行
	private String bankAcc;		// 银行帐号
	private String checkStatus;		// 审核状态
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String incomeRemark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public IncomeBill() {
		super();
	}

	public IncomeBill(String id){
		super(id);
	}

	@Length(min=1, max=20, message="单据编号长度必须介于 1 和 20 之间")
	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	
	@Length(min=0, max=20, message="收款日期长度必须介于 0 和 20 之间")
	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	
	@Length(min=0, max=60, message="客户名称长度必须介于 0 和 60 之间")
	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}
	
	@Length(min=0, max=120, message="工程名称长度必须介于 0 和 120 之间")
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=0, max=20, message="支付方式长度必须介于 0 和 20 之间")
	public String getPayWay() {
		return payWay;
	}

	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	
	@Length(min=0, max=20, message="收款金额长度必须介于 0 和 20 之间")
	public String getIncomeAmount() {
		return incomeAmount;
	}

	public void setIncomeAmount(String incomeAmount) {
		this.incomeAmount = incomeAmount;
	}
	
	@Length(min=0, max=32, message="付款单主表单据编号长度必须介于 0 和 32 之间")
	public String getWithNo() {
		return withNo;
	}

	public void setWithNo(String withNo) {
		this.withNo = withNo;
	}
	
	@Length(min=0, max=60, message="开户银行长度必须介于 0 和 60 之间")
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
	@Length(min=0, max=32, message="银行帐号长度必须介于 0 和 32 之间")
	public String getBankAcc() {
		return bankAcc;
	}

	public void setBankAcc(String bankAcc) {
		this.bankAcc = bankAcc;
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
	public String getIncomeRemark() {
		return incomeRemark;
	}

	public void setIncomeRemark(String incomeRemark) {
		this.incomeRemark = incomeRemark;
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
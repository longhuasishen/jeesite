/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.stock.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 形态转换Entity
 * @author spark
 * @version 2018-01-07
 */
public class InverseKind extends DataEntity<InverseKind> {
	
	private static final long serialVersionUID = 1L;
	private String inverseDate;		// 转换日期
	private String repoName;		// 仓库名称
	private String orgiName;		// 原品种名称
	private String orgiNo;		// 原出厂编号
	private String inverseNum;		// 转换数量
	private String orgiPrice;		// 原单价
	private String orgiAmount;		// 原金额
	private String newName;		// 新品种名称
	private String newNo;		// 新出厂编号
	private String newNum;		// 新数量
	private String newPrice;		// 新单价
	private String newAmount;		// 新金额
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String checkStatus;		// 审核状态
	private String checkRemark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public InverseKind() {
		super();
	}

	public InverseKind(String id){
		super(id);
	}

	@Length(min=1, max=20, message="转换日期长度必须介于 1 和 20 之间")
	public String getInverseDate() {
		return inverseDate;
	}

	public void setInverseDate(String inverseDate) {
		this.inverseDate = inverseDate;
	}
	
	@Length(min=0, max=60, message="仓库名称长度必须介于 0 和 60 之间")
	public String getRepoName() {
		return repoName;
	}

	public void setRepoName(String repoName) {
		this.repoName = repoName;
	}
	
	@Length(min=0, max=60, message="原品种名称长度必须介于 0 和 60 之间")
	public String getOrgiName() {
		return orgiName;
	}

	public void setOrgiName(String orgiName) {
		this.orgiName = orgiName;
	}
	
	@Length(min=0, max=32, message="原出厂编号长度必须介于 0 和 32 之间")
	public String getOrgiNo() {
		return orgiNo;
	}

	public void setOrgiNo(String orgiNo) {
		this.orgiNo = orgiNo;
	}
	
	@Length(min=0, max=10, message="转换数量长度必须介于 0 和 10 之间")
	public String getInverseNum() {
		return inverseNum;
	}

	public void setInverseNum(String inverseNum) {
		this.inverseNum = inverseNum;
	}
	
	@Length(min=0, max=15, message="原单价长度必须介于 0 和 15 之间")
	public String getOrgiPrice() {
		return orgiPrice;
	}

	public void setOrgiPrice(String orgiPrice) {
		this.orgiPrice = orgiPrice;
	}
	
	@Length(min=0, max=15, message="原金额长度必须介于 0 和 15 之间")
	public String getOrgiAmount() {
		return orgiAmount;
	}

	public void setOrgiAmount(String orgiAmount) {
		this.orgiAmount = orgiAmount;
	}
	
	@Length(min=0, max=60, message="新品种名称长度必须介于 0 和 60 之间")
	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}
	
	@Length(min=0, max=32, message="新出厂编号长度必须介于 0 和 32 之间")
	public String getNewNo() {
		return newNo;
	}

	public void setNewNo(String newNo) {
		this.newNo = newNo;
	}
	
	@Length(min=0, max=10, message="新数量长度必须介于 0 和 10 之间")
	public String getNewNum() {
		return newNum;
	}

	public void setNewNum(String newNum) {
		this.newNum = newNum;
	}
	
	@Length(min=0, max=15, message="新单价长度必须介于 0 和 15 之间")
	public String getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(String newPrice) {
		this.newPrice = newPrice;
	}
	
	@Length(min=0, max=15, message="新金额长度必须介于 0 和 15 之间")
	public String getNewAmount() {
		return newAmount;
	}

	public void setNewAmount(String newAmount) {
		this.newAmount = newAmount;
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
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getCheckRemark() {
		return checkRemark;
	}

	public void setCheckRemark(String checkRemark) {
		this.checkRemark = checkRemark;
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
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 采购合同明细Entity
 * @author lisy
 * @version 2017-12-31
 */
public class ContractPurchaseDetail extends DataEntity<ContractPurchaseDetail> {
	
	private static final long serialVersionUID = 1L;
	private String contractCode;		// 合同编号
	private String kindCode;		// 品种编码
	private String itemAmount;		// 金额
	private String itemNumber;		// 数量
	private String itemPrice;		// 单价
	private String conversionRate;		// 折算比
	private String otherRate;		// 扣称比例
	private String isComplete;		// 是否完成
	private String remark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	
	public ContractPurchaseDetail() {
		super();
	}

	public ContractPurchaseDetail(String id){
		super(id);
	}

	@Length(min=1, max=16, message="合同编号长度必须介于 1 和 16 之间")
	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	
	@Length(min=1, max=16, message="品种编码长度必须介于 1 和 16 之间")
	public String getKindCode() {
		return kindCode;
	}

	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	
	@Length(min=1, max=20, message="金额长度必须介于 1 和 20 之间")
	public String getItemAmount() {
		return itemAmount;
	}

	public void setItemAmount(String itemAmount) {
		this.itemAmount = itemAmount;
	}
	
	@Length(min=1, max=20, message="数量长度必须介于 1 和 20 之间")
	public String getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(String itemNumber) {
		this.itemNumber = itemNumber;
	}
	
	@Length(min=1, max=20, message="单价长度必须介于 1 和 20 之间")
	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	@Length(min=0, max=16, message="折算比长度必须介于 0 和 16 之间")
	public String getConversionRate() {
		return conversionRate;
	}

	public void setConversionRate(String conversionRate) {
		this.conversionRate = conversionRate;
	}
	
	@Length(min=0, max=16, message="扣称比例长度必须介于 0 和 16 之间")
	public String getOtherRate() {
		return otherRate;
	}

	public void setOtherRate(String otherRate) {
		this.otherRate = otherRate;
	}
	
	@Length(min=0, max=1, message="是否完成长度必须介于 0 和 1 之间")
	public String getIsComplete() {
		return isComplete;
	}

	public void setIsComplete(String isComplete) {
		this.isComplete = isComplete;
	}
	
	@Length(min=0, max=1000, message="备注长度必须介于 0 和 1000 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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
	
}
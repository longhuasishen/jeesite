/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 采购入库明细Entity
 * @author lisy
 * @version 2018-01-14
 */
public class ContractPurchaseStorageDetail extends DataEntity<ContractPurchaseStorageDetail> {
	
	private static final long serialVersionUID = 1L;
	private String storageCode;		// 入库单号
	private String kindCode;		// 品种编码
	private String kindName;		// 品种名称
	private String kindLevel;		// 材质等级
	private String firstUnit;		// 主记量单位
	private String itemAmount;		// 结算金额
	private String itemNumber;		// 结算数量
	private String itemPrice;		// 结算单价
	private String originItemAmount;		// 入库原始金额
	private String originItemNumber;		// 入库原始数量
	private String originItemPrice;		// 入库原始单价
	private String originItemTare;		// 入库皮重
	private String originItemGross;		// 入库毛重
	private String supplierCode;		// 供应商编码
	private String supplierName;		// 供应商名称
	private String salemanCode;		// 采购员编码
	private String salemanName;		// 采购员名称
	private String remark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	
	public ContractPurchaseStorageDetail() {
		super();
	}

	public ContractPurchaseStorageDetail(String id){
		super(id);
	}

	@Length(min=1, max=50, message="入库单号长度必须介于 1 和 50 之间")
	public String getStorageCode() {
		return storageCode;
	}

	public void setStorageCode(String storageCode) {
		this.storageCode = storageCode;
	}
	
	@Length(min=1, max=16, message="品种编码长度必须介于 1 和 16 之间")
	public String getKindCode() {
		return kindCode;
	}

	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	
	@Length(min=0, max=120, message="品种名称长度必须介于 0 和 120 之间")
	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	
	@Length(min=0, max=60, message="材质等级长度必须介于 0 和 60 之间")
	public String getKindLevel() {
		return kindLevel;
	}

	public void setKindLevel(String kindLevel) {
		this.kindLevel = kindLevel;
	}
	
	@Length(min=0, max=60, message="主记量单位长度必须介于 0 和 60 之间")
	public String getFirstUnit() {
		return firstUnit;
	}

	public void setFirstUnit(String firstUnit) {
		this.firstUnit = firstUnit;
	}
	
	@Length(min=1, max=20, message="结算金额长度必须介于 1 和 20 之间")
	public String getItemAmount() {
		return itemAmount;
	}

	public void setItemAmount(String itemAmount) {
		this.itemAmount = itemAmount;
	}
	
	@Length(min=1, max=20, message="结算数量长度必须介于 1 和 20 之间")
	public String getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(String itemNumber) {
		this.itemNumber = itemNumber;
	}
	
	@Length(min=1, max=20, message="结算单价长度必须介于 1 和 20 之间")
	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	@Length(min=1, max=20, message="入库原始金额长度必须介于 1 和 20 之间")
	public String getOriginItemAmount() {
		return originItemAmount;
	}

	public void setOriginItemAmount(String originItemAmount) {
		this.originItemAmount = originItemAmount;
	}
	
	@Length(min=1, max=20, message="入库原始数量长度必须介于 1 和 20 之间")
	public String getOriginItemNumber() {
		return originItemNumber;
	}

	public void setOriginItemNumber(String originItemNumber) {
		this.originItemNumber = originItemNumber;
	}
	
	@Length(min=1, max=20, message="入库原始单价长度必须介于 1 和 20 之间")
	public String getOriginItemPrice() {
		return originItemPrice;
	}

	public void setOriginItemPrice(String originItemPrice) {
		this.originItemPrice = originItemPrice;
	}
	
	@Length(min=1, max=20, message="入库皮重长度必须介于 1 和 20 之间")
	public String getOriginItemTare() {
		return originItemTare;
	}

	public void setOriginItemTare(String originItemTare) {
		this.originItemTare = originItemTare;
	}
	
	@Length(min=1, max=20, message="入库毛重长度必须介于 1 和 20 之间")
	public String getOriginItemGross() {
		return originItemGross;
	}

	public void setOriginItemGross(String originItemGross) {
		this.originItemGross = originItemGross;
	}
	
	@Length(min=1, max=16, message="供应商编码长度必须介于 1 和 16 之间")
	public String getSupplierCode() {
		return supplierCode;
	}

	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	
	@Length(min=1, max=60, message="供应商名称长度必须介于 1 和 60 之间")
	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	
	@Length(min=0, max=20, message="采购员编码长度必须介于 0 和 20 之间")
	public String getSalemanCode() {
		return salemanCode;
	}

	public void setSalemanCode(String salemanCode) {
		this.salemanCode = salemanCode;
	}
	
	@Length(min=0, max=20, message="采购员名称长度必须介于 0 和 20 之间")
	public String getSalemanName() {
		return salemanName;
	}

	public void setSalemanName(String salemanName) {
		this.salemanName = salemanName;
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
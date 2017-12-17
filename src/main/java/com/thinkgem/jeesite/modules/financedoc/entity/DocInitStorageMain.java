/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.entity;

import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
import com.thinkgem.jeesite.modules.doc.entity.DocRepertory;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 期初入库Entity
 * @author lisy
 * @version 2017-12-15
 */
@Getter
@Setter
public class DocInitStorageMain extends DataEntity<DocInitStorageMain> {
	
	private static final long serialVersionUID = 1L;
	private String docCode;		// 单据编号
	private String storageCode;		// 入库单号
	private String storageDate;		// 入库日期时间
	private DocDepartment docDepartment;		// 入库部门
	private DocRepertory docRepertory;		// 入库仓库
	private String storageFlag;		// 红蓝标志
	private String storageAuditFlag;		// 审核状态
	private String storageType;		// 入库类型
	private String storageCreate;		// 制单人
	private String storageAuditor;		// 审核人
	private String storageHandler;		// 经手人
	private String storageCreateDate;		// 制单日期
	private String storageAuditDate;		// 审核日期
	private String remark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	
	public DocInitStorageMain() {
		super();
	}

	public DocInitStorageMain(String id){
		super(id);
	}

	@Length(min=1, max=12, message="单据编号长度必须介于 1 和 12 之间")
	public String getDocCode() {
		return docCode;
	}

	public void setDocCode(String docCode) {
		this.docCode = docCode;
	}
	
	@Length(min=0, max=50, message="入库单号长度必须介于 0 和 50 之间")
	public String getStorageCode() {
		return storageCode;
	}

	public void setStorageCode(String storageCode) {
		this.storageCode = storageCode;
	}
	
	@Length(min=1, max=20, message="入库日期时间长度必须介于 1 和 20 之间")
	public String getStorageDate() {
		return storageDate;
	}

	public void setStorageDate(String storageDate) {
		this.storageDate = storageDate;
	}
	
	@Length(min=1, max=1, message="红蓝标志长度必须介于 1 和 1 之间")
	public String getStorageFlag() {
		return storageFlag;
	}

	public void setStorageFlag(String storageFlag) {
		this.storageFlag = storageFlag;
	}
	
	@Length(min=1, max=1, message="审核状态长度必须介于 1 和 1 之间")
	public String getStorageAuditFlag() {
		return storageAuditFlag;
	}

	public void setStorageAuditFlag(String storageAuditFlag) {
		this.storageAuditFlag = storageAuditFlag;
	}
	
	@Length(min=1, max=20, message="入库类型长度必须介于 1 和 20 之间")
	public String getStorageType() {
		return storageType;
	}

	public void setStorageType(String storageType) {
		this.storageType = storageType;
	}
	
	@Length(min=1, max=20, message="制单人长度必须介于 1 和 20 之间")
	public String getStorageCreate() {
		return storageCreate;
	}

	public void setStorageCreate(String storageCreate) {
		this.storageCreate = storageCreate;
	}
	
	@Length(min=0, max=20, message="审核人长度必须介于 1 和 20 之间")
	public String getStorageAuditor() {
		return storageAuditor;
	}

	public void setStorageAuditor(String storageAuditor) {
		this.storageAuditor = storageAuditor;
	}
	
	@Length(min=0, max=20, message="经手人长度必须介于 1 和 20 之间")
	public String getStorageHandler() {
		return storageHandler;
	}

	public void setStorageHandler(String storageHandler) {
		this.storageHandler = storageHandler;
	}
	
	@Length(min=0, max=20, message="制单日期长度必须介于 1 和 20 之间")
	public String getStorageCreateDate() {
		return storageCreateDate;
	}

	public void setStorageCreateDate(String storageCreateDate) {
		this.storageCreateDate = storageCreateDate;
	}
	
	@Length(min=0, max=20, message="审核日期长度必须介于 1 和 20 之间")
	public String getStorageAuditDate() {
		return storageAuditDate;
	}

	public void setStorageAuditDate(String storageAuditDate) {
		this.storageAuditDate = storageAuditDate;
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
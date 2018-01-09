/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import com.thinkgem.jeesite.modules.archive.entity.ArchiveRepertory;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 仓库档案Entity
 * @author spark
 * @version 2017-12-15
 */
public class DocRepertory extends DataEntity<DocRepertory> {
	
	private static final long serialVersionUID = 1L;
	private String repertoryCode;		// 仓库编码
	private String repertoryName;		// 仓库名称
	private String kindCategory;		// 所属分类
	private String repertoryDepartment;		// 所属部门
	private String managerPerson;		// 负责人
	private String phoneNo;		// 联系电话
	private String maxStock;		// 最高库存
	private String pricingMethod;		// 计价方式
	private String repertoryAddr;		// 地址
	private String repertoryStation;		// 搅拌站
	private String comment;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark

	public DocStation getDocStation() {
		return docStation;
	}

	public void setDocStation(DocStation docStation) {
		this.docStation = docStation;
	}

	private DocStation docStation;

	public ArchiveRepertory getArchiveRepertory() {
		return archiveRepertory;
	}

	public void setArchiveRepertory(ArchiveRepertory archiveRepertory) {
		this.archiveRepertory = archiveRepertory;
	}

	public DocDepartment getDocDepartment() {
		return docDepartment;
	}

	public void setDocDepartment(DocDepartment docDepartment) {
		this.docDepartment = docDepartment;
	}

	private ArchiveRepertory archiveRepertory;
	private DocDepartment docDepartment;
	
	public DocRepertory() {
		super();
	}

	public DocRepertory(String id){
		super(id);
	}

	@Length(min=1, max=16, message="仓库编码长度必须介于 1 和 16 之间")
	public String getRepertoryCode() {
		return repertoryCode;
	}

	public void setRepertoryCode(String repertoryCode) {
		this.repertoryCode = repertoryCode;
	}
	
	@Length(min=0, max=120, message="仓库名称长度必须介于 0 和 120 之间")
	public String getRepertoryName() {
		return repertoryName;
	}

	public void setRepertoryName(String repertoryName) {
		this.repertoryName = repertoryName;
	}
	
	@Length(min=0, max=60, message="所属分类长度必须介于 0 和 60 之间")
	public String getKindCategory() {
		return kindCategory;
	}

	public void setKindCategory(String kindCategory) {
		this.kindCategory = kindCategory;
	}
	
	@Length(min=0, max=240, message="所属部门长度必须介于 0 和 240 之间")
	public String getRepertoryDepartment() {
		return repertoryDepartment;
	}

	public void setRepertoryDepartment(String repertoryDepartment) {
		this.repertoryDepartment = repertoryDepartment;
	}
	
	@Length(min=0, max=60, message="负责人长度必须介于 0 和 60 之间")
	public String getManagerPerson() {
		return managerPerson;
	}

	public void setManagerPerson(String managerPerson) {
		this.managerPerson = managerPerson;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	@Length(min=0, max=20, message="最高库存长度必须介于 0 和 20 之间")
	public String getMaxStock() {
		return maxStock;
	}

	public void setMaxStock(String maxStock) {
		this.maxStock = maxStock;
	}
	
	@Length(min=0, max=20, message="计价方式长度必须介于 0 和 20 之间")
	public String getPricingMethod() {
		return pricingMethod;
	}

	public void setPricingMethod(String pricingMethod) {
		this.pricingMethod = pricingMethod;
	}
	
	@Length(min=0, max=120, message="地址长度必须介于 0 和 120 之间")
	public String getRepertoryAddr() {
		return repertoryAddr;
	}

	public void setRepertoryAddr(String repertoryAddr) {
		this.repertoryAddr = repertoryAddr;
	}
	
	@Length(min=0, max=120, message="搅拌站长度必须介于 0 和 120 之间")
	public String getRepertoryStation() {
		return repertoryStation;
	}

	public void setRepertoryStation(String repertoryStation) {
		this.repertoryStation = repertoryStation;
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
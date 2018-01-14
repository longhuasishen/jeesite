/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import com.thinkgem.jeesite.modules.archive.entity.ArchiveCustom;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveIndustry;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveSupplier;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 供应商档案Entity
 * @author lisy
 * @version 2017-12-16
 */
@Getter
@Setter
public class DocSupplier extends DataEntity<DocSupplier> {
	
	private static final long serialVersionUID = 1L;
	private String supCode;		// 供应商编码
	private String supName;		// 供应商名称
	private String supShortName;		// 供应商简称
	private ArchiveSupplier archiveSupplier;		// 供应商分类
	private String supArea;		// 所属地区
	private ArchiveIndustry archiveIndustry;		// 所属行业

	public String getSupIndustry() {
		return supIndustry;
	}

	public void setSupIndustry(String supIndustry) {
		this.supIndustry = supIndustry;
	}

	private String supIndustry;
	private String supSettle;		// 结算单位
	private String supLicence;		// 营业执照
	private String supTaxno;		// 税号
	private String supBank;		// 开户银行
	private String supAccount;		// 银行帐号
	private String supCorporate;		// 法人代表
	private String supAgent;		// 代理人
	private String supCorporateIdno;		// 法人代表身份证
	private String supAgentIdno;		// 代理人身份证
	private String supCorporateJob;		// 法人代表职务
	private String supAgentJob;		// 代理人职务
	private String supCorporateMobile;		// 法人代表电话
	private String supAgentMobile;		// 代理人电话
	private String supPostCode;		// 邮政编码
	private String supContact;		// 联系人
	private String supEmail;		// 联系邮箱
	private String supAddress;		// 联系地址
	private String supSalesman;		// 专管业务员
	private String supProjectState;		// 工程状态
	private String isStopTrans;		// 是否停止交易
	private String extField1;		// ext_field12
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public DocSupplier() {
		super();
	}

	public DocSupplier(String id){
		super(id);
	}

	@Length(min=1, max=16, message="供应商编码长度必须介于 1 和 16 之间")
	public String getSupCode() {
		return supCode;
	}

	public void setSupCode(String supCode) {
		this.supCode = supCode;
	}
	
	@Length(min=0, max=60, message="供应商名称长度必须介于 0 和 60 之间")
	public String getSupName() {
		return supName;
	}

	public void setSupName(String supName) {
		this.supName = supName;
	}
	
	@Length(min=0, max=60, message="供应商简称长度必须介于 0 和 60 之间")
	public String getSupShortName() {
		return supShortName;
	}

	public void setSupShortName(String supShortName) {
		this.supShortName = supShortName;
	}

	@Length(min=0, max=12, message="所属地区长度必须介于 0 和 12 之间")
	public String getSupArea() {
		return supArea;
	}

	public void setSupArea(String supArea) {
		this.supArea = supArea;
	}
	
	@Length(min=0, max=120, message="结算单位长度必须介于 0 和 120 之间")
	public String getSupSettle() {
		return supSettle;
	}

	public void setSupSettle(String supSettle) {
		this.supSettle = supSettle;
	}
	
	@Length(min=0, max=60, message="营业执照长度必须介于 0 和 60 之间")
	public String getSupLicence() {
		return supLicence;
	}

	public void setSupLicence(String supLicence) {
		this.supLicence = supLicence;
	}
	
	@Length(min=0, max=32, message="税号长度必须介于 0 和 32 之间")
	public String getSupTaxno() {
		return supTaxno;
	}

	public void setSupTaxno(String supTaxno) {
		this.supTaxno = supTaxno;
	}
	
	@Length(min=0, max=120, message="开户银行长度必须介于 0 和 120 之间")
	public String getSupBank() {
		return supBank;
	}

	public void setSupBank(String supBank) {
		this.supBank = supBank;
	}
	
	@Length(min=0, max=60, message="银行帐号长度必须介于 0 和 60 之间")
	public String getSupAccount() {
		return supAccount;
	}

	public void setSupAccount(String supAccount) {
		this.supAccount = supAccount;
	}
	
	@Length(min=0, max=60, message="法人代表长度必须介于 0 和 60 之间")
	public String getSupCorporate() {
		return supCorporate;
	}

	public void setSupCorporate(String supCorporate) {
		this.supCorporate = supCorporate;
	}
	
	@Length(min=0, max=60, message="代理人长度必须介于 0 和 60 之间")
	public String getSupAgent() {
		return supAgent;
	}

	public void setSupAgent(String supAgent) {
		this.supAgent = supAgent;
	}
	
	@Length(min=0, max=20, message="法人代表身份证长度必须介于 0 和 20 之间")
	public String getSupCorporateIdno() {
		return supCorporateIdno;
	}

	public void setSupCorporateIdno(String supCorporateIdno) {
		this.supCorporateIdno = supCorporateIdno;
	}
	
	@Length(min=0, max=20, message="代理人身份证长度必须介于 0 和 20 之间")
	public String getSupAgentIdno() {
		return supAgentIdno;
	}

	public void setSupAgentIdno(String supAgentIdno) {
		this.supAgentIdno = supAgentIdno;
	}
	
	@Length(min=0, max=20, message="法人代表职务长度必须介于 0 和 20 之间")
	public String getSupCorporateJob() {
		return supCorporateJob;
	}

	public void setSupCorporateJob(String supCorporateJob) {
		this.supCorporateJob = supCorporateJob;
	}
	
	@Length(min=0, max=20, message="代理人职务长度必须介于 0 和 20 之间")
	public String getSupAgentJob() {
		return supAgentJob;
	}

	public void setSupAgentJob(String supAgentJob) {
		this.supAgentJob = supAgentJob;
	}
	
	@Length(min=0, max=20, message="法人代表电话长度必须介于 0 和 20 之间")
	public String getSupCorporateMobile() {
		return supCorporateMobile;
	}

	public void setSupCorporateMobile(String supCorporateMobile) {
		this.supCorporateMobile = supCorporateMobile;
	}
	
	@Length(min=0, max=20, message="代理人电话长度必须介于 0 和 20 之间")
	public String getSupAgentMobile() {
		return supAgentMobile;
	}

	public void setSupAgentMobile(String supAgentMobile) {
		this.supAgentMobile = supAgentMobile;
	}
	
	@Length(min=0, max=12, message="邮政编码长度必须介于 0 和 12 之间")
	public String getSupPostCode() {
		return supPostCode;
	}

	public void setSupPostCode(String supPostCode) {
		this.supPostCode = supPostCode;
	}
	
	@Length(min=0, max=20, message="联系人长度必须介于 0 和 20 之间")
	public String getSupContact() {
		return supContact;
	}

	public void setSupContact(String supContact) {
		this.supContact = supContact;
	}
	
	@Length(min=0, max=60, message="联系邮箱长度必须介于 0 和 60 之间")
	public String getSupEmail() {
		return supEmail;
	}

	public void setSupEmail(String supEmail) {
		this.supEmail = supEmail;
	}
	
	@Length(min=0, max=60, message="联系地址长度必须介于 0 和 60 之间")
	public String getSupAddress() {
		return supAddress;
	}

	public void setSupAddress(String supAddress) {
		this.supAddress = supAddress;
	}
	
	@Length(min=0, max=12, message="专管业务员长度必须介于 0 和 12 之间")
	public String getSupSalesman() {
		return supSalesman;
	}

	public void setSupSalesman(String supSalesman) {
		this.supSalesman = supSalesman;
	}
	
	@Length(min=0, max=20, message="工程状态长度必须介于 0 和 20 之间")
	public String getSupProjectState() {
		return supProjectState;
	}

	public void setSupProjectState(String supProjectState) {
		this.supProjectState = supProjectState;
	}
	
	@Length(min=0, max=1, message="是否停止交易长度必须介于 0 和 1 之间")
	public String getIsStopTrans() {
		return isStopTrans;
	}

	public void setIsStopTrans(String isStopTrans) {
		this.isStopTrans = isStopTrans;
	}
	
	@Length(min=0, max=60, message="ext_field12长度必须介于 0 和 60 之间")
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
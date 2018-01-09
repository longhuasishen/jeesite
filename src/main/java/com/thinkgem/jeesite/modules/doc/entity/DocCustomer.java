/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import com.thinkgem.jeesite.modules.archive.entity.ArchiveCustom;
import com.thinkgem.jeesite.modules.archive.entity.ArchiveIndustry;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 客户档案Entity
 * @author lisy
 * @version 2017-12-15
 */
@Getter
@Setter
public class DocCustomer extends DataEntity<DocCustomer> {
	
	private static final long serialVersionUID = 1L;
	private String cusCode;		// 客户编码
	private String cusOrg;		// 建设单位
	private String cusName;		// 客户名称
	private String cusProject;		// 工程名称
	private String cusShortName;		// 客户简称
	private ArchiveCustom archiveCustom;		// 客户分类
	private String cusArea;		// 所属地区
	private ArchiveIndustry archiveIndustry;		// 所属行业
	private String cusSettle;		// 结算单位
	private String cusLicence;		// 营业执照
	private String cusTaxno;		// 税号
	private String cusBank;		// 开户银行
	private String cusAccount;		// 银行帐号
	private String cusCorporate;		// 法人代表
	private String cusAgent;		// 代理人
	private String cusCorporateIdno;		// 法人代表身份证
	private String cusAgentIdno;		// 代理人身份证
	private String cusCorporateJob;		// 法人代表职务
	private String cusAgentJob;		// 代理人职务
	private String cusCorporateMobile;		// 法人代表电话
	private String cusAgentMobile;		// 代理人电话
	private String cusPostCode;		// 邮政编码
	private String cusContact;		// 联系人
	private String cusEmail;		// 联系邮箱
	private String cusAddress;		// 联系地址
	private String cusSalesman;		// 专管业务员
	private String cusCreditRate;		// 信用等级
	private String cusCreditLimit;		// 信用额度
	private String cusCreditDays;		// 信用天数
	private String cusSigner;		// 指定签收人
	private String cusProjectState;		// 工程状态
	private String cusUpDate;		// 封顶日期
	private String isSaleCus;		// 是否零售客户
	private String isRepayCus;		// 是否预付款客户
	private String isStopTrans;		// 是否停止交易
	private String isCusCode;		// 是否客户编码

	public String getCusAddr() {
		return cusAddr;
	}

	public void setCusAddr(String cusAddr) {
		this.cusAddr = cusAddr;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getDistanceRmk() {
		return distanceRmk;
	}

	public void setDistanceRmk(String distanceRmk) {
		this.distanceRmk = distanceRmk;
	}

	private String cusAddr;
	private String receiver;
	private String distance;
	private String distanceRmk;
	private String extField1;		// ext_field12
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public DocCustomer() {
		super();
	}

	public DocCustomer(String id){
		super(id);
	}

	@Length(min=1, max=16, message="客户编码长度必须介于 1 和 16 之间")
	public String getCusCode() {
		return cusCode;
	}

	public void setCusCode(String cusCode) {
		this.cusCode = cusCode;
	}
	
	@Length(min=0, max=120, message="建设单位长度必须介于 0 和 120 之间")
	public String getCusOrg() {
		return cusOrg;
	}

	public void setCusOrg(String cusOrg) {
		this.cusOrg = cusOrg;
	}
	
	@Length(min=0, max=60, message="客户名称长度必须介于 0 和 60 之间")
	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	
	@Length(min=0, max=120, message="工程名称长度必须介于 0 和 120 之间")
	public String getCusProject() {
		return cusProject;
	}

	public void setCusProject(String cusProject) {
		this.cusProject = cusProject;
	}
	
	@Length(min=0, max=60, message="客户简称长度必须介于 0 和 60 之间")
	public String getCusShortName() {
		return cusShortName;
	}

	public void setCusShortName(String cusShortName) {
		this.cusShortName = cusShortName;
	}

	public ArchiveCustom getArchiveCustom() {
		return archiveCustom;
	}

	public void setArchiveCustom(ArchiveCustom archiveCustom) {
		this.archiveCustom = archiveCustom;
	}

	@Length(min=0, max=12, message="所属地区长度必须介于 0 和 12 之间")
	public String getCusArea() {
		return cusArea;
	}

	public void setCusArea(String cusArea) {
		this.cusArea = cusArea;
	}

	@Length(min=0, max=120, message="结算单位长度必须介于 0 和 120 之间")
	public String getCusSettle() {
		return cusSettle;
	}

	public void setCusSettle(String cusSettle) {
		this.cusSettle = cusSettle;
	}
	
	@Length(min=0, max=60, message="营业执照长度必须介于 0 和 60 之间")
	public String getCusLicence() {
		return cusLicence;
	}

	public void setCusLicence(String cusLicence) {
		this.cusLicence = cusLicence;
	}
	
	@Length(min=0, max=32, message="税号长度必须介于 0 和 32 之间")
	public String getCusTaxno() {
		return cusTaxno;
	}

	public void setCusTaxno(String cusTaxno) {
		this.cusTaxno = cusTaxno;
	}
	
	@Length(min=0, max=120, message="开户银行长度必须介于 0 和 120 之间")
	public String getCusBank() {
		return cusBank;
	}

	public void setCusBank(String cusBank) {
		this.cusBank = cusBank;
	}
	
	@Length(min=0, max=60, message="银行帐号长度必须介于 0 和 60 之间")
	public String getCusAccount() {
		return cusAccount;
	}

	public void setCusAccount(String cusAccount) {
		this.cusAccount = cusAccount;
	}
	
	@Length(min=0, max=60, message="法人代表长度必须介于 0 和 60 之间")
	public String getCusCorporate() {
		return cusCorporate;
	}

	public void setCusCorporate(String cusCorporate) {
		this.cusCorporate = cusCorporate;
	}
	
	@Length(min=0, max=60, message="代理人长度必须介于 0 和 60 之间")
	public String getCusAgent() {
		return cusAgent;
	}

	public void setCusAgent(String cusAgent) {
		this.cusAgent = cusAgent;
	}
	
	@Length(min=0, max=20, message="法人代表身份证长度必须介于 0 和 20 之间")
	public String getCusCorporateIdno() {
		return cusCorporateIdno;
	}

	public void setCusCorporateIdno(String cusCorporateIdno) {
		this.cusCorporateIdno = cusCorporateIdno;
	}
	
	@Length(min=0, max=20, message="代理人身份证长度必须介于 0 和 20 之间")
	public String getCusAgentIdno() {
		return cusAgentIdno;
	}

	public void setCusAgentIdno(String cusAgentIdno) {
		this.cusAgentIdno = cusAgentIdno;
	}
	
	@Length(min=0, max=20, message="法人代表职务长度必须介于 0 和 20 之间")
	public String getCusCorporateJob() {
		return cusCorporateJob;
	}

	public void setCusCorporateJob(String cusCorporateJob) {
		this.cusCorporateJob = cusCorporateJob;
	}
	
	@Length(min=0, max=20, message="代理人职务长度必须介于 0 和 20 之间")
	public String getCusAgentJob() {
		return cusAgentJob;
	}

	public void setCusAgentJob(String cusAgentJob) {
		this.cusAgentJob = cusAgentJob;
	}
	
	@Length(min=0, max=20, message="法人代表电话长度必须介于 0 和 20 之间")
	public String getCusCorporateMobile() {
		return cusCorporateMobile;
	}

	public void setCusCorporateMobile(String cusCorporateMobile) {
		this.cusCorporateMobile = cusCorporateMobile;
	}
	
	@Length(min=0, max=20, message="代理人电话长度必须介于 0 和 20 之间")
	public String getCusAgentMobile() {
		return cusAgentMobile;
	}

	public void setCusAgentMobile(String cusAgentMobile) {
		this.cusAgentMobile = cusAgentMobile;
	}
	
	@Length(min=0, max=12, message="邮政编码长度必须介于 0 和 12 之间")
	public String getCusPostCode() {
		return cusPostCode;
	}

	public void setCusPostCode(String cusPostCode) {
		this.cusPostCode = cusPostCode;
	}
	
	@Length(min=0, max=20, message="联系人长度必须介于 0 和 20 之间")
	public String getCusContact() {
		return cusContact;
	}

	public void setCusContact(String cusContact) {
		this.cusContact = cusContact;
	}
	
	@Length(min=0, max=60, message="联系邮箱长度必须介于 0 和 60 之间")
	public String getCusEmail() {
		return cusEmail;
	}

	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}
	
	@Length(min=0, max=60, message="联系地址长度必须介于 0 和 60 之间")
	public String getCusAddress() {
		return cusAddress;
	}

	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	
	@Length(min=0, max=12, message="专管业务员长度必须介于 0 和 12 之间")
	public String getCusSalesman() {
		return cusSalesman;
	}

	public void setCusSalesman(String cusSalesman) {
		this.cusSalesman = cusSalesman;
	}
	
	@Length(min=0, max=12, message="信用等级长度必须介于 0 和 12 之间")
	public String getCusCreditRate() {
		return cusCreditRate;
	}

	public void setCusCreditRate(String cusCreditRate) {
		this.cusCreditRate = cusCreditRate;
	}
	
	@Length(min=0, max=12, message="信用额度长度必须介于 0 和 12 之间")
	public String getCusCreditLimit() {
		return cusCreditLimit;
	}

	public void setCusCreditLimit(String cusCreditLimit) {
		this.cusCreditLimit = cusCreditLimit;
	}
	
	@Length(min=0, max=12, message="信用天数长度必须介于 0 和 12 之间")
	public String getCusCreditDays() {
		return cusCreditDays;
	}

	public void setCusCreditDays(String cusCreditDays) {
		this.cusCreditDays = cusCreditDays;
	}
	
	@Length(min=0, max=12, message="指定签收人长度必须介于 0 和 12 之间")
	public String getCusSigner() {
		return cusSigner;
	}

	public void setCusSigner(String cusSigner) {
		this.cusSigner = cusSigner;
	}
	
	@Length(min=0, max=20, message="工程状态长度必须介于 0 和 20 之间")
	public String getCusProjectState() {
		return cusProjectState;
	}

	public void setCusProjectState(String cusProjectState) {
		this.cusProjectState = cusProjectState;
	}
	
	@Length(min=0, max=20, message="封顶日期长度必须介于 0 和 20 之间")
	public String getCusUpDate() {
		return cusUpDate;
	}

	public void setCusUpDate(String cusUpDate) {
		this.cusUpDate = cusUpDate;
	}
	
	@Length(min=0, max=1, message="是否零售客户长度必须介于 0 和 1 之间")
	public String getIsSaleCus() {
		return isSaleCus;
	}

	public void setIsSaleCus(String isSaleCus) {
		this.isSaleCus = isSaleCus;
	}
	
	@Length(min=0, max=1, message="是否预付款客户长度必须介于 0 和 1 之间")
	public String getIsRepayCus() {
		return isRepayCus;
	}

	public void setIsRepayCus(String isRepayCus) {
		this.isRepayCus = isRepayCus;
	}
	
	@Length(min=0, max=1, message="是否停止交易长度必须介于 0 和 1 之间")
	public String getIsStopTrans() {
		return isStopTrans;
	}

	public void setIsStopTrans(String isStopTrans) {
		this.isStopTrans = isStopTrans;
	}
	
	@Length(min=0, max=1, message="是否客户编码长度必须介于 0 和 1 之间")
	public String getIsCusCode() {
		return isCusCode;
	}

	public void setIsCusCode(String isCusCode) {
		this.isCusCode = isCusCode;
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
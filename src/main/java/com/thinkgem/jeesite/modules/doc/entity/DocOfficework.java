/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 职员档案Entity
 * @author spark
 * @version 2017-12-15
 */
public class DocOfficework extends DataEntity<DocOfficework> {
	
	private static final long serialVersionUID = 1L;
	private String officeworkCode;		// 职员编码
	private String officeworkName;		// 职员名称
	private String officeworkDep;		// 所属部门
	private String officeworkPost;		// 职务
	private String officeworkEdu;		// 最高学历
	private String officeworkMarry;		// 婚姻状况
	private String officeworkPol;		// 政治面貌
	private String officeworkSex;		// 性别
	private String officeworkPhone;		// 电话
	private String officeworkBirth;		// 出生日期
	private String officeworkIdcard;		// 身份证号码
	private String joinDate;		// 入司日期
	private String docSite;		// 档案地点
	private String docNo;		// 档案号
	private String fromUni;		// 毕业院校
	private String officeworkComp;		// 所属公司
	private String lastComp;		// 入司前单位
	private String overuniTime;		// 毕业时间
	private String officeworkMajor;		// 专业
	private String inputTime;		// 录入时间
	private String officeworkLevel;		// 级别
	private String officeworkAddr;		// 家庭地址
	private String workStatus;		// 在职状态
	private String postLevel;		// 技术职称
	private String officeworkNation;		// 民族
	private String officeworkQuarters;		// 岗位
	private String officeworkSales;		// 业务员
	private String contractFlg;		// 合同签否
	private String officeworkFlg;		// 标志
	private String officeworkCancel;		// 注销
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public DocOfficework() {
		super();
	}

	public DocOfficework(String id){
		super(id);
	}

	@Length(min=1, max=16, message="职员编码长度必须介于 1 和 16 之间")
	public String getOfficeworkCode() {
		return officeworkCode;
	}

	public void setOfficeworkCode(String officeworkCode) {
		this.officeworkCode = officeworkCode;
	}
	
	@Length(min=0, max=120, message="职员名称长度必须介于 0 和 120 之间")
	public String getOfficeworkName() {
		return officeworkName;
	}

	public void setOfficeworkName(String officeworkName) {
		this.officeworkName = officeworkName;
	}
	
	@Length(min=0, max=60, message="所属部门长度必须介于 0 和 60 之间")
	public String getOfficeworkDep() {
		return officeworkDep;
	}

	public void setOfficeworkDep(String officeworkDep) {
		this.officeworkDep = officeworkDep;
	}
	
	@Length(min=0, max=20, message="职务长度必须介于 0 和 20 之间")
	public String getOfficeworkPost() {
		return officeworkPost;
	}

	public void setOfficeworkPost(String officeworkPost) {
		this.officeworkPost = officeworkPost;
	}
	
	@Length(min=0, max=10, message="最高学历长度必须介于 0 和 10 之间")
	public String getOfficeworkEdu() {
		return officeworkEdu;
	}

	public void setOfficeworkEdu(String officeworkEdu) {
		this.officeworkEdu = officeworkEdu;
	}
	
	@Length(min=0, max=10, message="婚姻状况长度必须介于 0 和 10 之间")
	public String getOfficeworkMarry() {
		return officeworkMarry;
	}

	public void setOfficeworkMarry(String officeworkMarry) {
		this.officeworkMarry = officeworkMarry;
	}
	
	@Length(min=0, max=10, message="政治面貌长度必须介于 0 和 10 之间")
	public String getOfficeworkPol() {
		return officeworkPol;
	}

	public void setOfficeworkPol(String officeworkPol) {
		this.officeworkPol = officeworkPol;
	}
	
	@Length(min=0, max=10, message="性别长度必须介于 0 和 10 之间")
	public String getOfficeworkSex() {
		return officeworkSex;
	}

	public void setOfficeworkSex(String officeworkSex) {
		this.officeworkSex = officeworkSex;
	}
	
	@Length(min=0, max=20, message="电话长度必须介于 0 和 20 之间")
	public String getOfficeworkPhone() {
		return officeworkPhone;
	}

	public void setOfficeworkPhone(String officeworkPhone) {
		this.officeworkPhone = officeworkPhone;
	}
	
	@Length(min=0, max=20, message="出生日期长度必须介于 0 和 20 之间")
	public String getOfficeworkBirth() {
		return officeworkBirth;
	}

	public void setOfficeworkBirth(String officeworkBirth) {
		this.officeworkBirth = officeworkBirth;
	}
	
	@Length(min=0, max=20, message="身份证号码长度必须介于 0 和 20 之间")
	public String getOfficeworkIdcard() {
		return officeworkIdcard;
	}

	public void setOfficeworkIdcard(String officeworkIdcard) {
		this.officeworkIdcard = officeworkIdcard;
	}
	
	@Length(min=0, max=20, message="入司日期长度必须介于 0 和 20 之间")
	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	@Length(min=0, max=120, message="档案地点长度必须介于 0 和 120 之间")
	public String getDocSite() {
		return docSite;
	}

	public void setDocSite(String docSite) {
		this.docSite = docSite;
	}
	
	@Length(min=0, max=32, message="档案号长度必须介于 0 和 32 之间")
	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	
	@Length(min=0, max=120, message="毕业院校长度必须介于 0 和 120 之间")
	public String getFromUni() {
		return fromUni;
	}

	public void setFromUni(String fromUni) {
		this.fromUni = fromUni;
	}
	
	@Length(min=0, max=60, message="所属公司长度必须介于 0 和 60 之间")
	public String getOfficeworkComp() {
		return officeworkComp;
	}

	public void setOfficeworkComp(String officeworkComp) {
		this.officeworkComp = officeworkComp;
	}
	
	@Length(min=0, max=60, message="入司前单位长度必须介于 0 和 60 之间")
	public String getLastComp() {
		return lastComp;
	}

	public void setLastComp(String lastComp) {
		this.lastComp = lastComp;
	}
	
	@Length(min=0, max=20, message="毕业时间长度必须介于 0 和 20 之间")
	public String getOveruniTime() {
		return overuniTime;
	}

	public void setOveruniTime(String overuniTime) {
		this.overuniTime = overuniTime;
	}
	
	@Length(min=0, max=10, message="专业长度必须介于 0 和 10 之间")
	public String getOfficeworkMajor() {
		return officeworkMajor;
	}

	public void setOfficeworkMajor(String officeworkMajor) {
		this.officeworkMajor = officeworkMajor;
	}
	
	@Length(min=0, max=20, message="录入时间长度必须介于 0 和 20 之间")
	public String getInputTime() {
		return inputTime;
	}

	public void setInputTime(String inputTime) {
		this.inputTime = inputTime;
	}
	
	@Length(min=0, max=10, message="级别长度必须介于 0 和 10 之间")
	public String getOfficeworkLevel() {
		return officeworkLevel;
	}

	public void setOfficeworkLevel(String officeworkLevel) {
		this.officeworkLevel = officeworkLevel;
	}
	
	@Length(min=0, max=120, message="家庭地址长度必须介于 0 和 120 之间")
	public String getOfficeworkAddr() {
		return officeworkAddr;
	}

	public void setOfficeworkAddr(String officeworkAddr) {
		this.officeworkAddr = officeworkAddr;
	}
	
	@Length(min=0, max=10, message="在职状态长度必须介于 0 和 10 之间")
	public String getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
	
	@Length(min=0, max=10, message="技术职称长度必须介于 0 和 10 之间")
	public String getPostLevel() {
		return postLevel;
	}

	public void setPostLevel(String postLevel) {
		this.postLevel = postLevel;
	}
	
	@Length(min=0, max=20, message="民族长度必须介于 0 和 20 之间")
	public String getOfficeworkNation() {
		return officeworkNation;
	}

	public void setOfficeworkNation(String officeworkNation) {
		this.officeworkNation = officeworkNation;
	}
	
	@Length(min=0, max=20, message="岗位长度必须介于 0 和 20 之间")
	public String getOfficeworkQuarters() {
		return officeworkQuarters;
	}

	public void setOfficeworkQuarters(String officeworkQuarters) {
		this.officeworkQuarters = officeworkQuarters;
	}
	
	@Length(min=0, max=1, message="业务员长度必须介于 0 和 1 之间")
	public String getOfficeworkSales() {
		return officeworkSales;
	}

	public void setOfficeworkSales(String officeworkSales) {
		this.officeworkSales = officeworkSales;
	}
	
	@Length(min=0, max=1, message="合同签否长度必须介于 0 和 1 之间")
	public String getContractFlg() {
		return contractFlg;
	}

	public void setContractFlg(String contractFlg) {
		this.contractFlg = contractFlg;
	}
	
	@Length(min=0, max=1, message="标志长度必须介于 0 和 1 之间")
	public String getOfficeworkFlg() {
		return officeworkFlg;
	}

	public void setOfficeworkFlg(String officeworkFlg) {
		this.officeworkFlg = officeworkFlg;
	}
	
	@Length(min=0, max=1, message="注销长度必须介于 0 和 1 之间")
	public String getOfficeworkCancel() {
		return officeworkCancel;
	}

	public void setOfficeworkCancel(String officeworkCancel) {
		this.officeworkCancel = officeworkCancel;
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
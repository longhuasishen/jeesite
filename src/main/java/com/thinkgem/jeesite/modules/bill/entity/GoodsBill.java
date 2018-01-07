/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bill.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发货单Entity
 * @author spark
 * @version 2018-01-07
 */
public class GoodsBill extends DataEntity<GoodsBill> {
	
	private static final long serialVersionUID = 1L;
	private String goodsNo;		// 发货单号
	private String outDate;		// 出库日期
	private String contractNo;		// 合同编号
	private String customName;		// 客户名称
	private String projectName;		// 工程名称
	private String carCount;		// 运输车次
	private String goodsAddr;		// 交货地点
	private String buildSite;		// 施工部位
	private String noticeNo;		// 生产通知单
	private String strengthGrade;		// 强度等级
	private String goodsName;		// 商品名称
	private String waterMeth;		// 浇灌方法
	private String slumpsStart;		// 起始坍落度
	private String slumpsEnd;		// 终止坍落度
	private String customNo;		// 客户编码
	private String withStation;		// 搅拌站
	private String specialMaterial;		// 特种材料
	private String repertoryName;		// 仓库名称
	private String curcarCount;		// 本车数量
	private String mortarCount;		// 砂浆数量
	private String aboutNum;		// 同标号数量
	private String goodsDriver;		// 司机
	private String carNo;		// 运输车号
	private String goodsIncrement;		// 增量
	private String departTime;		// 发车时间
	private String reachTime;		// 到达时间
	private String unloadTime;		// 卸料时间
	private String departPerson;		// 发货人
	private String qualityPerson;		// 质检员
	private String goodsClerk;		// 收货人
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String checkStatus;		// 审核状态
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String totalCars;		// 累计车数
	private String totalCube;		// 累计方量
	private String goodsRemark;		// 备注
	private String exceptHandle;		// 异常料处理
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public GoodsBill() {
		super();
	}

	public GoodsBill(String id){
		super(id);
	}

	@Length(min=1, max=32, message="发货单号长度必须介于 1 和 32 之间")
	public String getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	
	@Length(min=0, max=20, message="出库日期长度必须介于 0 和 20 之间")
	public String getOutDate() {
		return outDate;
	}

	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	
	@Length(min=0, max=20, message="合同编号长度必须介于 0 和 20 之间")
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
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
	
	@Length(min=0, max=15, message="运输车次长度必须介于 0 和 15 之间")
	public String getCarCount() {
		return carCount;
	}

	public void setCarCount(String carCount) {
		this.carCount = carCount;
	}
	
	@Length(min=0, max=240, message="交货地点长度必须介于 0 和 240 之间")
	public String getGoodsAddr() {
		return goodsAddr;
	}

	public void setGoodsAddr(String goodsAddr) {
		this.goodsAddr = goodsAddr;
	}
	
	@Length(min=0, max=120, message="施工部位长度必须介于 0 和 120 之间")
	public String getBuildSite() {
		return buildSite;
	}

	public void setBuildSite(String buildSite) {
		this.buildSite = buildSite;
	}
	
	@Length(min=0, max=20, message="生产通知单长度必须介于 0 和 20 之间")
	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	@Length(min=0, max=20, message="强度等级长度必须介于 0 和 20 之间")
	public String getStrengthGrade() {
		return strengthGrade;
	}

	public void setStrengthGrade(String strengthGrade) {
		this.strengthGrade = strengthGrade;
	}
	
	@Length(min=0, max=60, message="商品名称长度必须介于 0 和 60 之间")
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	@Length(min=0, max=20, message="浇灌方法长度必须介于 0 和 20 之间")
	public String getWaterMeth() {
		return waterMeth;
	}

	public void setWaterMeth(String waterMeth) {
		this.waterMeth = waterMeth;
	}
	
	@Length(min=0, max=10, message="起始坍落度长度必须介于 0 和 10 之间")
	public String getSlumpsStart() {
		return slumpsStart;
	}

	public void setSlumpsStart(String slumpsStart) {
		this.slumpsStart = slumpsStart;
	}
	
	@Length(min=0, max=10, message="终止坍落度长度必须介于 0 和 10 之间")
	public String getSlumpsEnd() {
		return slumpsEnd;
	}

	public void setSlumpsEnd(String slumpsEnd) {
		this.slumpsEnd = slumpsEnd;
	}
	
	@Length(min=0, max=60, message="客户编码长度必须介于 0 和 60 之间")
	public String getCustomNo() {
		return customNo;
	}

	public void setCustomNo(String customNo) {
		this.customNo = customNo;
	}
	
	@Length(min=0, max=60, message="搅拌站长度必须介于 0 和 60 之间")
	public String getWithStation() {
		return withStation;
	}

	public void setWithStation(String withStation) {
		this.withStation = withStation;
	}
	
	@Length(min=0, max=120, message="特种材料长度必须介于 0 和 120 之间")
	public String getSpecialMaterial() {
		return specialMaterial;
	}

	public void setSpecialMaterial(String specialMaterial) {
		this.specialMaterial = specialMaterial;
	}
	
	@Length(min=0, max=30, message="仓库名称长度必须介于 0 和 30 之间")
	public String getRepertoryName() {
		return repertoryName;
	}

	public void setRepertoryName(String repertoryName) {
		this.repertoryName = repertoryName;
	}
	
	@Length(min=0, max=15, message="本车数量长度必须介于 0 和 15 之间")
	public String getCurcarCount() {
		return curcarCount;
	}

	public void setCurcarCount(String curcarCount) {
		this.curcarCount = curcarCount;
	}
	
	@Length(min=0, max=15, message="砂浆数量长度必须介于 0 和 15 之间")
	public String getMortarCount() {
		return mortarCount;
	}

	public void setMortarCount(String mortarCount) {
		this.mortarCount = mortarCount;
	}
	
	@Length(min=0, max=15, message="同标号数量长度必须介于 0 和 15 之间")
	public String getAboutNum() {
		return aboutNum;
	}

	public void setAboutNum(String aboutNum) {
		this.aboutNum = aboutNum;
	}
	
	@Length(min=0, max=60, message="司机长度必须介于 0 和 60 之间")
	public String getGoodsDriver() {
		return goodsDriver;
	}

	public void setGoodsDriver(String goodsDriver) {
		this.goodsDriver = goodsDriver;
	}
	
	@Length(min=0, max=15, message="运输车号长度必须介于 0 和 15 之间")
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	
	@Length(min=0, max=15, message="增量长度必须介于 0 和 15 之间")
	public String getGoodsIncrement() {
		return goodsIncrement;
	}

	public void setGoodsIncrement(String goodsIncrement) {
		this.goodsIncrement = goodsIncrement;
	}
	
	@Length(min=0, max=20, message="发车时间长度必须介于 0 和 20 之间")
	public String getDepartTime() {
		return departTime;
	}

	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}
	
	@Length(min=0, max=20, message="到达时间长度必须介于 0 和 20 之间")
	public String getReachTime() {
		return reachTime;
	}

	public void setReachTime(String reachTime) {
		this.reachTime = reachTime;
	}
	
	@Length(min=0, max=20, message="卸料时间长度必须介于 0 和 20 之间")
	public String getUnloadTime() {
		return unloadTime;
	}

	public void setUnloadTime(String unloadTime) {
		this.unloadTime = unloadTime;
	}
	
	@Length(min=0, max=60, message="发货人长度必须介于 0 和 60 之间")
	public String getDepartPerson() {
		return departPerson;
	}

	public void setDepartPerson(String departPerson) {
		this.departPerson = departPerson;
	}
	
	@Length(min=0, max=60, message="质检员长度必须介于 0 和 60 之间")
	public String getQualityPerson() {
		return qualityPerson;
	}

	public void setQualityPerson(String qualityPerson) {
		this.qualityPerson = qualityPerson;
	}
	
	@Length(min=0, max=60, message="收货人长度必须介于 0 和 60 之间")
	public String getGoodsClerk() {
		return goodsClerk;
	}

	public void setGoodsClerk(String goodsClerk) {
		this.goodsClerk = goodsClerk;
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
	
	@Length(min=0, max=1, message="审核状态长度必须介于 0 和 1 之间")
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
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
	
	@Length(min=0, max=10, message="累计车数长度必须介于 0 和 10 之间")
	public String getTotalCars() {
		return totalCars;
	}

	public void setTotalCars(String totalCars) {
		this.totalCars = totalCars;
	}
	
	@Length(min=0, max=10, message="累计方量长度必须介于 0 和 10 之间")
	public String getTotalCube() {
		return totalCube;
	}

	public void setTotalCube(String totalCube) {
		this.totalCube = totalCube;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getGoodsRemark() {
		return goodsRemark;
	}

	public void setGoodsRemark(String goodsRemark) {
		this.goodsRemark = goodsRemark;
	}
	
	@Length(min=0, max=1000, message="异常料处理长度必须介于 0 和 1000 之间")
	public String getExceptHandle() {
		return exceptHandle;
	}

	public void setExceptHandle(String exceptHandle) {
		this.exceptHandle = exceptHandle;
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
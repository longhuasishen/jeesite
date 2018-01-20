/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.List;

/**
 * 车辆档案Entity
 * @author spark
 * @version 2018-01-20
 */
public class DocCar extends DataEntity<DocCar> {
	
	private static final long serialVersionUID = 1L;
	private String carCode;		// 车辆编码
	private String carNo;		// 车牌号码
	private String driverName;		// 司机姓名
	private String carOwner;		// 车主
	private String carLicence;		// 行驶执照
	private String cardNo;		// 卡号
	private String carTypename;		// 车型名称
	private String emptyWeight;		// 空重
	private String driveCube;		// 装载方量
	private String carPhone;		// 联系电话
	private String isMixing;		// 搅拌车
	private String isPump;		// 泵车
	private String isOther;		// 其它设备
	private String isAvalable;		// 是否可用
	private String driveRecord;		// 行驶记录
	private String backTime;		// 回厂时间
	private String produceTime;		// 安排生产时间
	private String outTime;		// 出厂时间
	private String fixTime;		// 维修时间
	private String backSort;		// 回厂排序
	private String produceSort;		// 生产排序
	private String outSort;		// 出厂排序
	private String fixSort;		// 维修排序
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark

	public List<String> getChildCarList1() {
		return childCarList1;
	}

	public void setChildCarList1(List<String> childCarList1) {
		this.childCarList1 = childCarList1;
	}

	private List<String> childCarList1;//原材料勾选1
	
	public DocCar() {
		super();
	}

	public DocCar(String id){
		super(id);
	}

	@Length(min=1, max=16, message="车辆编码长度必须介于 1 和 16 之间")
	public String getCarCode() {
		return carCode;
	}

	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}
	
	@Length(min=0, max=10, message="车牌号码长度必须介于 0 和 10 之间")
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	
	@Length(min=0, max=60, message="司机姓名长度必须介于 0 和 60 之间")
	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	
	@Length(min=0, max=20, message="车主长度必须介于 0 和 20 之间")
	public String getCarOwner() {
		return carOwner;
	}

	public void setCarOwner(String carOwner) {
		this.carOwner = carOwner;
	}
	
	@Length(min=0, max=32, message="行驶执照长度必须介于 0 和 32 之间")
	public String getCarLicence() {
		return carLicence;
	}

	public void setCarLicence(String carLicence) {
		this.carLicence = carLicence;
	}
	
	@Length(min=0, max=32, message="卡号长度必须介于 0 和 32 之间")
	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
	@Length(min=0, max=120, message="车型名称长度必须介于 0 和 120 之间")
	public String getCarTypename() {
		return carTypename;
	}

	public void setCarTypename(String carTypename) {
		this.carTypename = carTypename;
	}
	
	@Length(min=0, max=20, message="空重长度必须介于 0 和 20 之间")
	public String getEmptyWeight() {
		return emptyWeight;
	}

	public void setEmptyWeight(String emptyWeight) {
		this.emptyWeight = emptyWeight;
	}
	
	@Length(min=0, max=20, message="装载方量长度必须介于 0 和 20 之间")
	public String getDriveCube() {
		return driveCube;
	}

	public void setDriveCube(String driveCube) {
		this.driveCube = driveCube;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getCarPhone() {
		return carPhone;
	}

	public void setCarPhone(String carPhone) {
		this.carPhone = carPhone;
	}
	
	@Length(min=0, max=1, message="搅拌车长度必须介于 0 和 1 之间")
	public String getIsMixing() {
		return isMixing;
	}

	public void setIsMixing(String isMixing) {
		this.isMixing = isMixing;
	}
	
	@Length(min=0, max=1, message="泵车长度必须介于 0 和 1 之间")
	public String getIsPump() {
		return isPump;
	}

	public void setIsPump(String isPump) {
		this.isPump = isPump;
	}
	
	@Length(min=0, max=1, message="其它设备长度必须介于 0 和 1 之间")
	public String getIsOther() {
		return isOther;
	}

	public void setIsOther(String isOther) {
		this.isOther = isOther;
	}
	
	@Length(min=0, max=1, message="是否可用长度必须介于 0 和 1 之间")
	public String getIsAvalable() {
		return isAvalable;
	}

	public void setIsAvalable(String isAvalable) {
		this.isAvalable = isAvalable;
	}
	
	@Length(min=0, max=240, message="行驶记录长度必须介于 0 和 240 之间")
	public String getDriveRecord() {
		return driveRecord;
	}

	public void setDriveRecord(String driveRecord) {
		this.driveRecord = driveRecord;
	}
	
	@Length(min=0, max=120, message="回厂时间长度必须介于 0 和 120 之间")
	public String getBackTime() {
		return backTime;
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}
	
	@Length(min=0, max=20, message="安排生产时间长度必须介于 0 和 20 之间")
	public String getProduceTime() {
		return produceTime;
	}

	public void setProduceTime(String produceTime) {
		this.produceTime = produceTime;
	}
	
	@Length(min=0, max=20, message="出厂时间长度必须介于 0 和 20 之间")
	public String getOutTime() {
		return outTime;
	}

	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	
	@Length(min=0, max=20, message="维修时间长度必须介于 0 和 20 之间")
	public String getFixTime() {
		return fixTime;
	}

	public void setFixTime(String fixTime) {
		this.fixTime = fixTime;
	}
	
	@Length(min=0, max=5, message="回厂排序长度必须介于 0 和 5 之间")
	public String getBackSort() {
		return backSort;
	}

	public void setBackSort(String backSort) {
		this.backSort = backSort;
	}
	
	@Length(min=0, max=5, message="生产排序长度必须介于 0 和 5 之间")
	public String getProduceSort() {
		return produceSort;
	}

	public void setProduceSort(String produceSort) {
		this.produceSort = produceSort;
	}
	
	@Length(min=0, max=5, message="出厂排序长度必须介于 0 和 5 之间")
	public String getOutSort() {
		return outSort;
	}

	public void setOutSort(String outSort) {
		this.outSort = outSort;
	}
	
	@Length(min=0, max=5, message="维修排序长度必须介于 0 和 5 之间")
	public String getFixSort() {
		return fixSort;
	}

	public void setFixSort(String fixSort) {
		this.fixSort = fixSort;
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
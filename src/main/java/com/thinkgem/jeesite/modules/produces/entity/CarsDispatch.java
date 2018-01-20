/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 车辆调度Entity
 * @author spark
 * @version 2018-01-20
 */
public class CarsDispatch extends DataEntity<CarsDispatch> {
	
	private static final long serialVersionUID = 1L;
	private String carNo;		// 车号
	private String carName;		// 名称
	private String backTime;		// 回厂时间
	private String produceTime;		// 安排生产时间
	private String outTime;		// 出厂时间
	private String fixTime;		// 维修时间
	private String extField1;		// ext_field1
	private String carState;		// 可用状态
	private String carType;		// 车辆性质
	private String extField2;		// ext_field2
	private String carOwner;		// 车辆归属
	private String extField3;		// ext_field3
	private String remark;		// remark
	private String backSort;		// 回厂排序
	private String produceSort;		// 生产排序
	private String outSort;		// 出厂排序
	private String fixSort;		// 维修排序
	
	public CarsDispatch() {
		super();
	}

	public CarsDispatch(String id){
		super(id);
	}

	@Length(min=1, max=32, message="车号长度必须介于 1 和 32 之间")
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	
	@Length(min=1, max=60, message="名称长度必须介于 1 和 60 之间")
	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
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
	
	@Length(min=0, max=60, message="ext_field1长度必须介于 0 和 60 之间")
	public String getExtField1() {
		return extField1;
	}

	public void setExtField1(String extField1) {
		this.extField1 = extField1;
	}
	
	@Length(min=0, max=1, message="可用状态长度必须介于 0 和 1 之间")
	public String getCarState() {
		return carState;
	}

	public void setCarState(String carState) {
		this.carState = carState;
	}
	
	@Length(min=0, max=1, message="车辆性质长度必须介于 0 和 1 之间")
	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}
	
	@Length(min=0, max=60, message="ext_field2长度必须介于 0 和 60 之间")
	public String getExtField2() {
		return extField2;
	}

	public void setExtField2(String extField2) {
		this.extField2 = extField2;
	}
	
	@Length(min=0, max=1, message="车辆归属长度必须介于 0 和 1 之间")
	public String getCarOwner() {
		return carOwner;
	}

	public void setCarOwner(String carOwner) {
		this.carOwner = carOwner;
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
	
}
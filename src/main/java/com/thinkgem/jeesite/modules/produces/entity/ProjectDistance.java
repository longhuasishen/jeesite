/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.entity;

import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 工程运距管理Entity
 * @author spark
 * @version 2018-01-04
 */
public class ProjectDistance extends DataEntity<ProjectDistance> {
	
	private static final long serialVersionUID = 1L;
	private String customId;		// 客户编码
	private String customName;		// 客户名称
	private String customAbbr;		// 客户简称
	private String customAddr;		// 客户地址
	private String receiver;		// 指定签收人
	private String distance;		// 距离
	private String distanceRemark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark

	private String distanceCode; //运距编码

	public String getDistanceCode() {
		return distanceCode;
	}

	public void setDistanceCode(String distanceCode) {
		this.distanceCode = distanceCode;
	}

	public DocCustomer getDocCustomer() {
		return docCustomer;
	}

	public void setDocCustomer(DocCustomer docCustomer) {
		this.docCustomer = docCustomer;
	}

	private DocCustomer docCustomer;
	
	public ProjectDistance() {
		super();
	}

	public ProjectDistance(String id){
		super(id);
	}

	@Length(min=1, max=20, message="客户编码长度必须介于 1 和 20 之间")
	public String getCustomId() {
		return customId;
	}

	public void setCustomId(String customId) {
		this.customId = customId;
	}
	
	@Length(min=0, max=120, message="客户名称长度必须介于 0 和 120 之间")
	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}
	
	@Length(min=0, max=120, message="客户简称长度必须介于 0 和 120 之间")
	public String getCustomAbbr() {
		return customAbbr;
	}

	public void setCustomAbbr(String customAbbr) {
		this.customAbbr = customAbbr;
	}
	
	@Length(min=0, max=240, message="客户地址长度必须介于 0 和 240 之间")
	public String getCustomAddr() {
		return customAddr;
	}

	public void setCustomAddr(String customAddr) {
		this.customAddr = customAddr;
	}
	
	@Length(min=0, max=60, message="指定签收人长度必须介于 0 和 60 之间")
	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	@Length(min=0, max=60, message="距离长度必须介于 0 和 60 之间")
	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getDistanceRemark() {
		return distanceRemark;
	}

	public void setDistanceRemark(String distanceRemark) {
		this.distanceRemark = distanceRemark;
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
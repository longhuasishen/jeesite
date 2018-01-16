/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 销售合同浇灌方法单价Entity
 * @author spark
 * @version 2018-01-16
 */
public class ContractSalesWatermeth extends DataEntity<ContractSalesWatermeth> {
	
	private static final long serialVersionUID = 1L;
	private String contractId;		// 合同编码
	private String watermethCode;		// 浇灌方式编码
	private String watermethName;		// 浇灌方法名称
	private String watermethUnivalent;		// 单价
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public ContractSalesWatermeth() {
		super();
	}

	public ContractSalesWatermeth(String id){
		super(id);
	}

	@Length(min=1, max=32, message="合同编码长度必须介于 1 和 32 之间")
	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	
	@Length(min=1, max=16, message="浇灌方式编码长度必须介于 1 和 16 之间")
	public String getWatermethCode() {
		return watermethCode;
	}

	public void setWatermethCode(String watermethCode) {
		this.watermethCode = watermethCode;
	}
	
	@Length(min=0, max=120, message="浇灌方法名称长度必须介于 0 和 120 之间")
	public String getWatermethName() {
		return watermethName;
	}

	public void setWatermethName(String watermethName) {
		this.watermethName = watermethName;
	}
	
	@Length(min=0, max=20, message="单价长度必须介于 0 和 20 之间")
	public String getWatermethUnivalent() {
		return watermethUnivalent;
	}

	public void setWatermethUnivalent(String watermethUnivalent) {
		this.watermethUnivalent = watermethUnivalent;
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
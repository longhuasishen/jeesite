/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.financedoc.entity;

import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 财务应收期初余额Entity
 * @author lisy
 * @version 2017-12-15
 */
@Getter
@Setter
public class DocFinanceInitbalance extends DataEntity<DocFinanceInitbalance> {
	
	private static final long serialVersionUID = 1L;
	private DocCustomer docCustomer;
	private String debitBalance;		// 借方余额
	private String creditBalance;		// 贷方余额
	private String remark;		// 摘要
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	
	public DocFinanceInitbalance() {
		super();
	}

	public DocFinanceInitbalance(String id){
		super(id);
	}

	@Length(min=1, max=20, message="借方余额长度必须介于 1 和 20 之间")
	public String getDebitBalance() {
		return debitBalance;
	}

	public void setDebitBalance(String debitBalance) {
		this.debitBalance = debitBalance;
	}
	
	@Length(min=0, max=120, message="贷方余额长度必须介于 0 和 120 之间")
	public String getCreditBalance() {
		return creditBalance;
	}

	public void setCreditBalance(String creditBalance) {
		this.creditBalance = creditBalance;
	}
	
	@Length(min=0, max=1000, message="摘要长度必须介于 0 和 1000 之间")
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
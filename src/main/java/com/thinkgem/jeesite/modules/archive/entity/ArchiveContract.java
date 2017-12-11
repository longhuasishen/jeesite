/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 合同分类Entity
 * @author lisy
 * @version 2017-12-11
 */
public class ArchiveContract extends DataEntity<ArchiveContract> {
	
	private static final long serialVersionUID = 1L;
	private String contractName;		// contract_name
	private String contractCode;		// contract_code
	
	public ArchiveContract() {
		super();
	}

	public ArchiveContract(String id){
		super(id);
	}

	@Length(min=0, max=50, message="contract_name长度必须介于 0 和 50 之间")
	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	
	@Length(min=0, max=12, message="contract_code长度必须介于 0 和 12 之间")
	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	
}
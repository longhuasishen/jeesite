/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 供应商分类Entity
 * @author spark
 * @version 2017-12-12
 */
public class ArchiveSupplier extends DataEntity<ArchiveSupplier> {
	
	private static final long serialVersionUID = 1L;
	private String supplierName;		// supplier_name
	private String supplierCode;		// supplier_code
	
	public ArchiveSupplier() {
		super();
	}

	public ArchiveSupplier(String id){
		super(id);
	}

	@Length(min=0, max=50, message="supplier_name长度必须介于 0 和 50 之间")
	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	
	@Length(min=0, max=12, message="supplier_code长度必须介于 0 和 12 之间")
	public String getSupplierCode() {
		return supplierCode;
	}

	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	
}
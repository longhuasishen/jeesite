/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 客户分类Entity
 * @author spark
 * @version 2017-12-12
 */
public class ArchiveCustom extends DataEntity<ArchiveCustom> {
	
	private static final long serialVersionUID = 1L;
	private String customName;		// custom_name
	private String customCode;		// custom_code
	
	public ArchiveCustom() {
		super();
	}

	public ArchiveCustom(String id){
		super(id);
	}

	@Length(min=0, max=50, message="custom_name长度必须介于 0 和 50 之间")
	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}
	
	@Length(min=0, max=12, message="custom_code长度必须介于 0 和 12 之间")
	public String getCustomCode() {
		return customCode;
	}

	public void setCustomCode(String customCode) {
		this.customCode = customCode;
	}
	
}
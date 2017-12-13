/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 地区分类Entity
 * @author spark
 * @version 2017-12-12
 */
public class ArchiveArea extends DataEntity<ArchiveArea> {
	
	private static final long serialVersionUID = 1L;
	private String areaName;		// area_name
	private String areaCode;		// area_code
	
	public ArchiveArea() {
		super();
	}

	public ArchiveArea(String id){
		super(id);
	}

	@Length(min=0, max=50, message="area_name长度必须介于 0 和 50 之间")
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	@Length(min=0, max=12, message="area_code长度必须介于 0 和 12 之间")
	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	
}
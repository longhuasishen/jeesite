/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 物资分类Entity
 * @author lisy
 * @version 2017-12-10
 */
public class ArchiveMaterial extends DataEntity<ArchiveMaterial> {
	
	private static final long serialVersionUID = 1L;
	private String materialName;		// material_name
	private String materialCode;		// material_code
	
	public ArchiveMaterial() {
		super();
	}

	public ArchiveMaterial(String id){
		super(id);
	}

	@Length(min=0, max=50, message="material_name长度必须介于 0 和 50 之间")
	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	
	@Length(min=0, max=12, message="material_code长度必须介于 0 和 12 之间")
	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 仓库分类Entity
 * @author spark
 * @version 2017-12-12
 */
public class ArchiveRepertory extends DataEntity<ArchiveRepertory> {
	
	private static final long serialVersionUID = 1L;
	private String repertoryName;		// repertory_name
	private String repertoryCode;		// repertory_code
	
	public ArchiveRepertory() {
		super();
	}

	public ArchiveRepertory(String id){
		super(id);
	}

	@Length(min=0, max=50, message="repertory_name长度必须介于 0 和 50 之间")
	public String getRepertoryName() {
		return repertoryName;
	}

	public void setRepertoryName(String repertoryName) {
		this.repertoryName = repertoryName;
	}
	
	@Length(min=0, max=12, message="repertory_code长度必须介于 0 和 12 之间")
	public String getRepertoryCode() {
		return repertoryCode;
	}

	public void setRepertoryCode(String repertoryCode) {
		this.repertoryCode = repertoryCode;
	}
	
}
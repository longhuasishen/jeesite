/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.archive.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 行业分类Entity
 * @author spark
 * @version 2017-12-12
 */
public class ArchiveIndustry extends DataEntity<ArchiveIndustry> {
	
	private static final long serialVersionUID = 1L;
	private String industryName;		// industry_name
	private String industryCode;		// industry_code
	
	public ArchiveIndustry() {
		super();
	}

	public ArchiveIndustry(String id){
		super(id);
	}

	@Length(min=0, max=50, message="industry_name长度必须介于 0 和 50 之间")
	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}
	
	@Length(min=0, max=12, message="industry_code长度必须介于 0 和 12 之间")
	public String getIndustryCode() {
		return industryCode;
	}

	public void setIndustryCode(String industryCode) {
		this.industryCode = industryCode;
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import com.thinkgem.jeesite.modules.archive.entity.ArchiveMaterial;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 品种档案Entity
 * @author lisy
 * @version 2017-12-30
 */
@Getter
@Setter
public class DocKind extends DataEntity<DocKind> {
	
	private static final long serialVersionUID = 1L;
	private String kindCode;		// 品种编码
	private String kindName;		// 品种名称
	private String kindLevel;		// 材质等级
	private String standName;		// 标准名称
	private ArchiveMaterial archiveMaterial;		// 所属分类,物资分类
	private DocConcretetyp docConcretetyp;		// 原材料类型
	private String firstUnit;		// 主记量单位
	private String primaryProvider;		// 主要供应商
	private String brandName;		// 品牌名称
	
	public DocKind() {
		super();
	}

	public DocKind(String id){
		super(id);
	}

	@Length(min=1, max=16, message="品种编码长度必须介于 1 和 16 之间")
	public String getKindCode() {
		return kindCode;
	}

	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	
	@Length(min=0, max=120, message="品种名称长度必须介于 0 和 120 之间")
	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	
	@Length(min=0, max=60, message="材质等级长度必须介于 0 和 60 之间")
	public String getKindLevel() {
		return kindLevel;
	}

	public void setKindLevel(String kindLevel) {
		this.kindLevel = kindLevel;
	}
	
	@Length(min=0, max=120, message="标准名称长度必须介于 0 和 120 之间")
	public String getStandName() {
		return standName;
	}

	public void setStandName(String standName) {
		this.standName = standName;
	}

	@Length(min=0, max=60, message="主记量单位长度必须介于 0 和 60 之间")
	public String getFirstUnit() {
		return firstUnit;
	}

	public void setFirstUnit(String firstUnit) {
		this.firstUnit = firstUnit;
	}
	
	@Length(min=0, max=240, message="主要供应商长度必须介于 0 和 240 之间")
	public String getPrimaryProvider() {
		return primaryProvider;
	}

	public void setPrimaryProvider(String primaryProvider) {
		this.primaryProvider = primaryProvider;
	}
	
	@Length(min=0, max=120, message="品牌名称长度必须介于 0 和 120 之间")
	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
}
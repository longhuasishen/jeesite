/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 混凝土档案Entity
 * @author spark
 * @version 2017-12-15
 */
public class DocBeton extends DataEntity<DocBeton> {
	
	private static final long serialVersionUID = 1L;
	private String kindCode;		// 品种编码
	private String kindName;		// 品种名称
	private String kindLevel;		// 材质等级
	private String standName;		// 标准名称
	private String kindCategory;		// 所属分类
	private String kindType;		// 原材料类型
	private String secUnit;		// 辅记量单位
	private String firstUnit;		// 主记量单位
	private String rate;		// 换算率
	private String primaryProvider;		// 主要供应商
	private String pricingMode;		// 计价方式
	private String brandName;		// 品牌名称
	private String sales;		// 销售
	private String outsourcing;		// 外购
	private String madSelf;		// 自制
	private String taxService;		// 应税劳务
	private String compSet;		// 成套件
	private String mortar;		// 砂浆
	private String minInventory;		// 最低库存
	private String costPrices;		// 成本参考核算单价
	private String maxInventory;		// 最高存库
	private String sumControl;		// 配方上下限控制
	private String saveInventory;		// 安全库存
	private String stockStand;		// 积压标准
	private String abcCategory;		// ABC分类
	private String taxRate;		// 税率
	private String qualityManage;		// 保质期管理
	private String batManage;		// 批次管理
	private String entrustManage;		// 委托代锁管理
	private String stockManage;		// 呆滞积压管理
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public DocBeton() {
		super();
	}

	public DocBeton(String id){
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
	
	@Length(min=0, max=60, message="所属分类长度必须介于 0 和 60 之间")
	public String getKindCategory() {
		return kindCategory;
	}

	public void setKindCategory(String kindCategory) {
		this.kindCategory = kindCategory;
	}
	
	@Length(min=0, max=60, message="原材料类型长度必须介于 0 和 60 之间")
	public String getKindType() {
		return kindType;
	}

	public void setKindType(String kindType) {
		this.kindType = kindType;
	}
	
	@Length(min=0, max=20, message="辅记量单位长度必须介于 0 和 20 之间")
	public String getSecUnit() {
		return secUnit;
	}

	public void setSecUnit(String secUnit) {
		this.secUnit = secUnit;
	}
	
	@Length(min=0, max=60, message="主记量单位长度必须介于 0 和 60 之间")
	public String getFirstUnit() {
		return firstUnit;
	}

	public void setFirstUnit(String firstUnit) {
		this.firstUnit = firstUnit;
	}
	
	@Length(min=0, max=12, message="换算率长度必须介于 0 和 12 之间")
	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}
	
	@Length(min=0, max=240, message="主要供应商长度必须介于 0 和 240 之间")
	public String getPrimaryProvider() {
		return primaryProvider;
	}

	public void setPrimaryProvider(String primaryProvider) {
		this.primaryProvider = primaryProvider;
	}
	
	@Length(min=0, max=32, message="计价方式长度必须介于 0 和 32 之间")
	public String getPricingMode() {
		return pricingMode;
	}

	public void setPricingMode(String pricingMode) {
		this.pricingMode = pricingMode;
	}
	
	@Length(min=0, max=120, message="品牌名称长度必须介于 0 和 120 之间")
	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
	@Length(min=0, max=1, message="销售长度必须介于 0 和 1 之间")
	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}
	
	@Length(min=0, max=1, message="外购长度必须介于 0 和 1 之间")
	public String getOutsourcing() {
		return outsourcing;
	}

	public void setOutsourcing(String outsourcing) {
		this.outsourcing = outsourcing;
	}
	
	@Length(min=0, max=1, message="自制长度必须介于 0 和 1 之间")
	public String getMadSelf() {
		return madSelf;
	}

	public void setMadSelf(String madSelf) {
		this.madSelf = madSelf;
	}
	
	@Length(min=0, max=1, message="应税劳务长度必须介于 0 和 1 之间")
	public String getTaxService() {
		return taxService;
	}

	public void setTaxService(String taxService) {
		this.taxService = taxService;
	}
	
	@Length(min=0, max=1, message="成套件长度必须介于 0 和 1 之间")
	public String getCompSet() {
		return compSet;
	}

	public void setCompSet(String compSet) {
		this.compSet = compSet;
	}
	
	@Length(min=0, max=1, message="砂浆长度必须介于 0 和 1 之间")
	public String getMortar() {
		return mortar;
	}

	public void setMortar(String mortar) {
		this.mortar = mortar;
	}
	
	@Length(min=0, max=1, message="最低库存长度必须介于 0 和 1 之间")
	public String getMinInventory() {
		return minInventory;
	}

	public void setMinInventory(String minInventory) {
		this.minInventory = minInventory;
	}
	
	@Length(min=0, max=1, message="成本参考核算单价长度必须介于 0 和 1 之间")
	public String getCostPrices() {
		return costPrices;
	}

	public void setCostPrices(String costPrices) {
		this.costPrices = costPrices;
	}
	
	@Length(min=0, max=1, message="最高存库长度必须介于 0 和 1 之间")
	public String getMaxInventory() {
		return maxInventory;
	}

	public void setMaxInventory(String maxInventory) {
		this.maxInventory = maxInventory;
	}
	
	@Length(min=0, max=1, message="配方上下限控制长度必须介于 0 和 1 之间")
	public String getSumControl() {
		return sumControl;
	}

	public void setSumControl(String sumControl) {
		this.sumControl = sumControl;
	}
	
	@Length(min=0, max=1, message="安全库存长度必须介于 0 和 1 之间")
	public String getSaveInventory() {
		return saveInventory;
	}

	public void setSaveInventory(String saveInventory) {
		this.saveInventory = saveInventory;
	}
	
	@Length(min=0, max=1, message="积压标准长度必须介于 0 和 1 之间")
	public String getStockStand() {
		return stockStand;
	}

	public void setStockStand(String stockStand) {
		this.stockStand = stockStand;
	}
	
	@Length(min=0, max=1, message="ABC分类长度必须介于 0 和 1 之间")
	public String getAbcCategory() {
		return abcCategory;
	}

	public void setAbcCategory(String abcCategory) {
		this.abcCategory = abcCategory;
	}
	
	@Length(min=0, max=1, message="税率长度必须介于 0 和 1 之间")
	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	
	@Length(min=0, max=1, message="保质期管理长度必须介于 0 和 1 之间")
	public String getQualityManage() {
		return qualityManage;
	}

	public void setQualityManage(String qualityManage) {
		this.qualityManage = qualityManage;
	}
	
	@Length(min=0, max=1, message="批次管理长度必须介于 0 和 1 之间")
	public String getBatManage() {
		return batManage;
	}

	public void setBatManage(String batManage) {
		this.batManage = batManage;
	}
	
	@Length(min=0, max=1, message="委托代锁管理长度必须介于 0 和 1 之间")
	public String getEntrustManage() {
		return entrustManage;
	}

	public void setEntrustManage(String entrustManage) {
		this.entrustManage = entrustManage;
	}
	
	@Length(min=0, max=1, message="呆滞积压管理长度必须介于 0 和 1 之间")
	public String getStockManage() {
		return stockManage;
	}

	public void setStockManage(String stockManage) {
		this.stockManage = stockManage;
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
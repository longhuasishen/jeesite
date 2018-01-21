/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.entity;

import com.thinkgem.jeesite.modules.doc.entity.DocConcrete;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 配合比系列表Entity
 * @author spark
 * @version 2018-01-20
 */
public class CoordinateRatio extends DataEntity<CoordinateRatio> {
	
	private static final long serialVersionUID = 1L;
	private String ratioCode;		// 配合比编号
	private String kindName;		// 品种名称
	private String testDate;		// 试验日期
	private String waterRatio;		// 水胶比
	private String sandRatio;		// 砂率
	private String slumps;		// 坍落度
	private String startcapacity;		// 起始容重
	private String endCapacity;		// 终止容重
	private String kindWater;		// 材料品种水
	private String kindCement;		// 材料品种水泥
	private String kindAg1;		// 材料品种骨料1
	private String kindAg2;		// 材料品种骨料2
	private String kindAg3;		// 材料品种骨料3
	private String kindAg4;		// 材料品种骨料4
	private String kindFlyash;		// 材料品种粉煤灰
	private String kindBreeze;		// 材料品种矿粉
	private String kindAdd1;		// 材料品种外加剂1
	private String kindAdd2;		// 材料品种外加剂2
	private String kindBackup1;		// 材料品种备用一
	private String kindSlops;		// 材料品种污水
	private String dosageWater;		// 用量水
	private String dosageCement;		// 用量水泥
	private String dosageAg1;		// 用量骨料1
	private String dosageAg2;		// 用量骨料2
	private String dosageAg3;		// 用量骨料3
	private String dosageAg4;		// 用量骨料4
	private String dosageFlyash;		// 用量粉煤灰
	private String dosageBreeze;		// 用量矿粉
	private String dosageAdd1;		// 用量外加剂1
	private String dosageAdd2;		// 用量外加剂2
	private String dosageBackup1;		// 用量备用一
	private String dosageSlops;		// 用量污水
	private String propWater;		// 掺量水
	private String propCement;		// 掺量水泥
	private String propAg1;		// 掺量骨料1
	private String propAg2;		// 掺量骨料2
	private String propAg3;		// 掺量骨料3
	private String propAg4;		// 掺量骨料4
	private String propFlyash;		// 掺量粉煤灰
	private String propBreeze;		// 掺量矿粉
	private String propAdd1;		// 掺量外加剂1
	private String propAdd2;		// 掺量外加剂2
	private String propBackup1;		// 掺量备用一
	private String propSlops;		// 掺量污水
	private String priceWater;		// 单价水
	private String priceCement;		// 单价水泥
	private String priceAg1;		// 单价骨料1
	private String priceAg2;		// 单价骨料2
	private String priceAg3;		// 单价骨料3
	private String priceAg4;		// 单价骨料4
	private String priceFlyash;		// 单价粉煤灰
	private String priceBreeze;		// 单价矿粉
	private String priceAdd1;		// 单价外加剂1
	private String priceAdd2;		// 单价外加剂2
	private String priceBackup1;		// 单价备用一
	private String priceSlops;		// 单价污水
	private String amountWater;		// 金额水
	private String amountCement;		// 金额水泥
	private String amountAg1;		// 金额骨料1
	private String amountAg2;		// 金额骨料2
	private String amountAg3;		// 金额骨料3
	private String amountAg4;		// 金额骨料4
	private String amountFlyash;		// 金额粉煤灰
	private String amountBreeze;		// 金额矿粉
	private String amountAdd1;		// 金额外加剂1
	private String amountAdd2;		// 金额外加剂2
	private String amountBackup1;		// 金额备用一
	private String amountSlops;		// 金额污水
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String ratioCost;		// 成本
	private String ratioOwner;		// 负责人
	private String ratioRemark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	private String kindName2;

	public String getKindName2() {
		return kindName2;
	}

	public void setKindName2(String kindName2) {
		this.kindName2 = kindName2;
	}

	public String getKindName3() {
		return kindName3;
	}

	public void setKindName3(String kindName3) {
		this.kindName3 = kindName3;
	}
	public String getKindName4() {
		return kindName4;
	}

	public void setKindName4(String kindName4) {
		this.kindName4 = kindName4;
	}

	public String getKindName5() {
		return kindName5;
	}

	public void setKindName5(String kindName5) {
		this.kindName5 = kindName5;
	}

	public String getKindName6() {
		return kindName6;
	}

	public void setKindName6(String kindName6) {
		this.kindName6 = kindName6;
	}

	public String getKindName7() {
		return kindName7;
	}

	public void setKindName7(String kindName7) {
		this.kindName7 = kindName7;
	}

	public String getKindName8() {
		return kindName8;
	}

	public void setKindName8(String kindName8) {
		this.kindName8 = kindName8;
	}

	public String getKindName9() {
		return kindName9;
	}

	public void setKindName9(String kindName9) {
		this.kindName9 = kindName9;
	}

	public String getKindName10() {
		return kindName10;
	}

	public void setKindName10(String kindName10) {
		this.kindName10 = kindName10;
	}

	public String getKindName11() {
		return kindName11;
	}

	public void setKindName11(String kindName11) {
		this.kindName11 = kindName11;
	}

	public String getKindName12() {
		return kindName12;
	}

	public void setKindName12(String kindName12) {
		this.kindName12 = kindName12;
	}

	private String kindName3;
	private String kindName4;
	private String kindName5;
	private String kindName6;
	private String kindName7;
	private String kindName8;
	private String kindName9;
	private String kindName10;
	private String kindName11;
	private String kindName12;



	public String getKindName1() {
		return kindName1;
	}

	public void setKindName1(String kindName1) {
		this.kindName1 = kindName1;
	}

	private String kindName1;

	public DocConcrete getDocConcrete() {
		return docConcrete;
	}

	public void setDocConcrete(DocConcrete docConcrete) {
		this.docConcrete = docConcrete;
	}

	public DocOfficework getDocOfficework() {
		return docOfficework;
	}

	public void setDocOfficework(DocOfficework docOfficework) {
		this.docOfficework = docOfficework;
	}

	private DocConcrete docConcrete;
	private DocOfficework docOfficework;
	
	public CoordinateRatio() {
		super();
	}

	public CoordinateRatio(String id){
		super(id);
	}

	@Length(min=1, max=20, message="配合比编号长度必须介于 1 和 20 之间")
	public String getRatioCode() {
		return ratioCode;
	}

	public void setRatioCode(String ratioCode) {
		this.ratioCode = ratioCode;
	}
	
	@Length(min=0, max=120, message="品种名称长度必须介于 0 和 120 之间")
	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	
	@Length(min=0, max=20, message="试验日期长度必须介于 0 和 20 之间")
	public String getTestDate() {
		return testDate;
	}

	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}
	
	@Length(min=0, max=10, message="水胶比长度必须介于 0 和 10 之间")
	public String getWaterRatio() {
		return waterRatio;
	}

	public void setWaterRatio(String waterRatio) {
		this.waterRatio = waterRatio;
	}
	
	@Length(min=0, max=10, message="砂率长度必须介于 0 和 10 之间")
	public String getSandRatio() {
		return sandRatio;
	}

	public void setSandRatio(String sandRatio) {
		this.sandRatio = sandRatio;
	}
	
	@Length(min=0, max=10, message="坍落度长度必须介于 0 和 10 之间")
	public String getSlumps() {
		return slumps;
	}

	public void setSlumps(String slumps) {
		this.slumps = slumps;
	}
	
	@Length(min=0, max=10, message="起始容重长度必须介于 0 和 10 之间")
	public String getStartcapacity() {
		return startcapacity;
	}

	public void setStartcapacity(String startcapacity) {
		this.startcapacity = startcapacity;
	}
	
	@Length(min=0, max=10, message="终止容重长度必须介于 0 和 10 之间")
	public String getEndCapacity() {
		return endCapacity;
	}

	public void setEndCapacity(String endCapacity) {
		this.endCapacity = endCapacity;
	}
	
	@Length(min=0, max=50, message="材料品种水长度必须介于 0 和 50 之间")
	public String getKindWater() {
		return kindWater;
	}

	public void setKindWater(String kindWater) {
		this.kindWater = kindWater;
	}
	
	@Length(min=0, max=50, message="材料品种水泥长度必须介于 0 和 50 之间")
	public String getKindCement() {
		return kindCement;
	}

	public void setKindCement(String kindCement) {
		this.kindCement = kindCement;
	}
	
	@Length(min=0, max=50, message="材料品种骨料1长度必须介于 0 和 50 之间")
	public String getKindAg1() {
		return kindAg1;
	}

	public void setKindAg1(String kindAg1) {
		this.kindAg1 = kindAg1;
	}
	
	@Length(min=0, max=50, message="材料品种骨料2长度必须介于 0 和 50 之间")
	public String getKindAg2() {
		return kindAg2;
	}

	public void setKindAg2(String kindAg2) {
		this.kindAg2 = kindAg2;
	}
	
	@Length(min=0, max=50, message="材料品种骨料3长度必须介于 0 和 50 之间")
	public String getKindAg3() {
		return kindAg3;
	}

	public void setKindAg3(String kindAg3) {
		this.kindAg3 = kindAg3;
	}
	
	@Length(min=0, max=50, message="材料品种骨料4长度必须介于 0 和 50 之间")
	public String getKindAg4() {
		return kindAg4;
	}

	public void setKindAg4(String kindAg4) {
		this.kindAg4 = kindAg4;
	}
	
	@Length(min=0, max=50, message="材料品种粉煤灰长度必须介于 0 和 50 之间")
	public String getKindFlyash() {
		return kindFlyash;
	}

	public void setKindFlyash(String kindFlyash) {
		this.kindFlyash = kindFlyash;
	}
	
	@Length(min=0, max=50, message="材料品种矿粉长度必须介于 0 和 50 之间")
	public String getKindBreeze() {
		return kindBreeze;
	}

	public void setKindBreeze(String kindBreeze) {
		this.kindBreeze = kindBreeze;
	}
	
	@Length(min=0, max=50, message="材料品种外加剂1长度必须介于 0 和 50 之间")
	public String getKindAdd1() {
		return kindAdd1;
	}

	public void setKindAdd1(String kindAdd1) {
		this.kindAdd1 = kindAdd1;
	}
	
	@Length(min=0, max=50, message="材料品种外加剂2长度必须介于 0 和 50 之间")
	public String getKindAdd2() {
		return kindAdd2;
	}

	public void setKindAdd2(String kindAdd2) {
		this.kindAdd2 = kindAdd2;
	}
	
	@Length(min=0, max=50, message="材料品种备用一长度必须介于 0 和 50 之间")
	public String getKindBackup1() {
		return kindBackup1;
	}

	public void setKindBackup1(String kindBackup1) {
		this.kindBackup1 = kindBackup1;
	}
	
	@Length(min=0, max=50, message="材料品种污水长度必须介于 0 和 50 之间")
	public String getKindSlops() {
		return kindSlops;
	}

	public void setKindSlops(String kindSlops) {
		this.kindSlops = kindSlops;
	}
	
	@Length(min=0, max=15, message="用量水长度必须介于 0 和 15 之间")
	public String getDosageWater() {
		return dosageWater;
	}

	public void setDosageWater(String dosageWater) {
		this.dosageWater = dosageWater;
	}
	
	@Length(min=0, max=15, message="用量水泥长度必须介于 0 和 15 之间")
	public String getDosageCement() {
		return dosageCement;
	}

	public void setDosageCement(String dosageCement) {
		this.dosageCement = dosageCement;
	}
	
	@Length(min=0, max=15, message="用量骨料1长度必须介于 0 和 15 之间")
	public String getDosageAg1() {
		return dosageAg1;
	}

	public void setDosageAg1(String dosageAg1) {
		this.dosageAg1 = dosageAg1;
	}
	
	@Length(min=0, max=15, message="用量骨料2长度必须介于 0 和 15 之间")
	public String getDosageAg2() {
		return dosageAg2;
	}

	public void setDosageAg2(String dosageAg2) {
		this.dosageAg2 = dosageAg2;
	}
	
	@Length(min=0, max=15, message="用量骨料3长度必须介于 0 和 15 之间")
	public String getDosageAg3() {
		return dosageAg3;
	}

	public void setDosageAg3(String dosageAg3) {
		this.dosageAg3 = dosageAg3;
	}
	
	@Length(min=0, max=15, message="用量骨料4长度必须介于 0 和 15 之间")
	public String getDosageAg4() {
		return dosageAg4;
	}

	public void setDosageAg4(String dosageAg4) {
		this.dosageAg4 = dosageAg4;
	}
	
	@Length(min=0, max=15, message="用量粉煤灰长度必须介于 0 和 15 之间")
	public String getDosageFlyash() {
		return dosageFlyash;
	}

	public void setDosageFlyash(String dosageFlyash) {
		this.dosageFlyash = dosageFlyash;
	}
	
	@Length(min=0, max=15, message="用量矿粉长度必须介于 0 和 15 之间")
	public String getDosageBreeze() {
		return dosageBreeze;
	}

	public void setDosageBreeze(String dosageBreeze) {
		this.dosageBreeze = dosageBreeze;
	}
	
	@Length(min=0, max=15, message="用量外加剂1长度必须介于 0 和 15 之间")
	public String getDosageAdd1() {
		return dosageAdd1;
	}

	public void setDosageAdd1(String dosageAdd1) {
		this.dosageAdd1 = dosageAdd1;
	}
	
	@Length(min=0, max=15, message="用量外加剂2长度必须介于 0 和 15 之间")
	public String getDosageAdd2() {
		return dosageAdd2;
	}

	public void setDosageAdd2(String dosageAdd2) {
		this.dosageAdd2 = dosageAdd2;
	}
	
	@Length(min=0, max=15, message="用量备用一长度必须介于 0 和 15 之间")
	public String getDosageBackup1() {
		return dosageBackup1;
	}

	public void setDosageBackup1(String dosageBackup1) {
		this.dosageBackup1 = dosageBackup1;
	}
	
	@Length(min=0, max=15, message="用量污水长度必须介于 0 和 15 之间")
	public String getDosageSlops() {
		return dosageSlops;
	}

	public void setDosageSlops(String dosageSlops) {
		this.dosageSlops = dosageSlops;
	}
	
	@Length(min=0, max=15, message="掺量水长度必须介于 0 和 15 之间")
	public String getPropWater() {
		return propWater;
	}

	public void setPropWater(String propWater) {
		this.propWater = propWater;
	}
	
	@Length(min=0, max=15, message="掺量水泥长度必须介于 0 和 15 之间")
	public String getPropCement() {
		return propCement;
	}

	public void setPropCement(String propCement) {
		this.propCement = propCement;
	}
	
	@Length(min=0, max=15, message="掺量骨料1长度必须介于 0 和 15 之间")
	public String getPropAg1() {
		return propAg1;
	}

	public void setPropAg1(String propAg1) {
		this.propAg1 = propAg1;
	}
	
	@Length(min=0, max=15, message="掺量骨料2长度必须介于 0 和 15 之间")
	public String getPropAg2() {
		return propAg2;
	}

	public void setPropAg2(String propAg2) {
		this.propAg2 = propAg2;
	}
	
	@Length(min=0, max=15, message="掺量骨料3长度必须介于 0 和 15 之间")
	public String getPropAg3() {
		return propAg3;
	}

	public void setPropAg3(String propAg3) {
		this.propAg3 = propAg3;
	}
	
	@Length(min=0, max=15, message="掺量骨料4长度必须介于 0 和 15 之间")
	public String getPropAg4() {
		return propAg4;
	}

	public void setPropAg4(String propAg4) {
		this.propAg4 = propAg4;
	}
	
	@Length(min=0, max=15, message="掺量粉煤灰长度必须介于 0 和 15 之间")
	public String getPropFlyash() {
		return propFlyash;
	}

	public void setPropFlyash(String propFlyash) {
		this.propFlyash = propFlyash;
	}
	
	@Length(min=0, max=15, message="掺量矿粉长度必须介于 0 和 15 之间")
	public String getPropBreeze() {
		return propBreeze;
	}

	public void setPropBreeze(String propBreeze) {
		this.propBreeze = propBreeze;
	}
	
	@Length(min=0, max=15, message="掺量外加剂1长度必须介于 0 和 15 之间")
	public String getPropAdd1() {
		return propAdd1;
	}

	public void setPropAdd1(String propAdd1) {
		this.propAdd1 = propAdd1;
	}
	
	@Length(min=0, max=15, message="掺量外加剂2长度必须介于 0 和 15 之间")
	public String getPropAdd2() {
		return propAdd2;
	}

	public void setPropAdd2(String propAdd2) {
		this.propAdd2 = propAdd2;
	}
	
	@Length(min=0, max=15, message="掺量备用一长度必须介于 0 和 15 之间")
	public String getPropBackup1() {
		return propBackup1;
	}

	public void setPropBackup1(String propBackup1) {
		this.propBackup1 = propBackup1;
	}
	
	@Length(min=0, max=15, message="掺量污水长度必须介于 0 和 15 之间")
	public String getPropSlops() {
		return propSlops;
	}

	public void setPropSlops(String propSlops) {
		this.propSlops = propSlops;
	}
	
	@Length(min=0, max=15, message="单价水长度必须介于 0 和 15 之间")
	public String getPriceWater() {
		return priceWater;
	}

	public void setPriceWater(String priceWater) {
		this.priceWater = priceWater;
	}
	
	@Length(min=0, max=15, message="单价水泥长度必须介于 0 和 15 之间")
	public String getPriceCement() {
		return priceCement;
	}

	public void setPriceCement(String priceCement) {
		this.priceCement = priceCement;
	}
	
	@Length(min=0, max=15, message="单价骨料1长度必须介于 0 和 15 之间")
	public String getPriceAg1() {
		return priceAg1;
	}

	public void setPriceAg1(String priceAg1) {
		this.priceAg1 = priceAg1;
	}
	
	@Length(min=0, max=15, message="单价骨料2长度必须介于 0 和 15 之间")
	public String getPriceAg2() {
		return priceAg2;
	}

	public void setPriceAg2(String priceAg2) {
		this.priceAg2 = priceAg2;
	}
	
	@Length(min=0, max=15, message="单价骨料3长度必须介于 0 和 15 之间")
	public String getPriceAg3() {
		return priceAg3;
	}

	public void setPriceAg3(String priceAg3) {
		this.priceAg3 = priceAg3;
	}
	
	@Length(min=0, max=15, message="单价骨料4长度必须介于 0 和 15 之间")
	public String getPriceAg4() {
		return priceAg4;
	}

	public void setPriceAg4(String priceAg4) {
		this.priceAg4 = priceAg4;
	}
	
	@Length(min=0, max=15, message="单价粉煤灰长度必须介于 0 和 15 之间")
	public String getPriceFlyash() {
		return priceFlyash;
	}

	public void setPriceFlyash(String priceFlyash) {
		this.priceFlyash = priceFlyash;
	}
	
	@Length(min=0, max=15, message="单价矿粉长度必须介于 0 和 15 之间")
	public String getPriceBreeze() {
		return priceBreeze;
	}

	public void setPriceBreeze(String priceBreeze) {
		this.priceBreeze = priceBreeze;
	}
	
	@Length(min=0, max=15, message="单价外加剂1长度必须介于 0 和 15 之间")
	public String getPriceAdd1() {
		return priceAdd1;
	}

	public void setPriceAdd1(String priceAdd1) {
		this.priceAdd1 = priceAdd1;
	}
	
	@Length(min=0, max=15, message="单价外加剂2长度必须介于 0 和 15 之间")
	public String getPriceAdd2() {
		return priceAdd2;
	}

	public void setPriceAdd2(String priceAdd2) {
		this.priceAdd2 = priceAdd2;
	}
	
	@Length(min=0, max=15, message="单价备用一长度必须介于 0 和 15 之间")
	public String getPriceBackup1() {
		return priceBackup1;
	}

	public void setPriceBackup1(String priceBackup1) {
		this.priceBackup1 = priceBackup1;
	}
	
	@Length(min=0, max=15, message="单价污水长度必须介于 0 和 15 之间")
	public String getPriceSlops() {
		return priceSlops;
	}

	public void setPriceSlops(String priceSlops) {
		this.priceSlops = priceSlops;
	}
	
	@Length(min=0, max=15, message="金额水长度必须介于 0 和 15 之间")
	public String getAmountWater() {
		return amountWater;
	}

	public void setAmountWater(String amountWater) {
		this.amountWater = amountWater;
	}
	
	@Length(min=0, max=15, message="金额水泥长度必须介于 0 和 15 之间")
	public String getAmountCement() {
		return amountCement;
	}

	public void setAmountCement(String amountCement) {
		this.amountCement = amountCement;
	}
	
	@Length(min=0, max=15, message="金额骨料1长度必须介于 0 和 15 之间")
	public String getAmountAg1() {
		return amountAg1;
	}

	public void setAmountAg1(String amountAg1) {
		this.amountAg1 = amountAg1;
	}
	
	@Length(min=0, max=15, message="金额骨料2长度必须介于 0 和 15 之间")
	public String getAmountAg2() {
		return amountAg2;
	}

	public void setAmountAg2(String amountAg2) {
		this.amountAg2 = amountAg2;
	}
	
	@Length(min=0, max=15, message="金额骨料3长度必须介于 0 和 15 之间")
	public String getAmountAg3() {
		return amountAg3;
	}

	public void setAmountAg3(String amountAg3) {
		this.amountAg3 = amountAg3;
	}
	
	@Length(min=0, max=15, message="金额骨料4长度必须介于 0 和 15 之间")
	public String getAmountAg4() {
		return amountAg4;
	}

	public void setAmountAg4(String amountAg4) {
		this.amountAg4 = amountAg4;
	}
	
	@Length(min=0, max=15, message="金额粉煤灰长度必须介于 0 和 15 之间")
	public String getAmountFlyash() {
		return amountFlyash;
	}

	public void setAmountFlyash(String amountFlyash) {
		this.amountFlyash = amountFlyash;
	}
	
	@Length(min=0, max=15, message="金额矿粉长度必须介于 0 和 15 之间")
	public String getAmountBreeze() {
		return amountBreeze;
	}

	public void setAmountBreeze(String amountBreeze) {
		this.amountBreeze = amountBreeze;
	}
	
	@Length(min=0, max=15, message="金额外加剂1长度必须介于 0 和 15 之间")
	public String getAmountAdd1() {
		return amountAdd1;
	}

	public void setAmountAdd1(String amountAdd1) {
		this.amountAdd1 = amountAdd1;
	}
	
	@Length(min=0, max=15, message="金额外加剂2长度必须介于 0 和 15 之间")
	public String getAmountAdd2() {
		return amountAdd2;
	}

	public void setAmountAdd2(String amountAdd2) {
		this.amountAdd2 = amountAdd2;
	}
	
	@Length(min=0, max=15, message="金额备用一长度必须介于 0 和 15 之间")
	public String getAmountBackup1() {
		return amountBackup1;
	}

	public void setAmountBackup1(String amountBackup1) {
		this.amountBackup1 = amountBackup1;
	}
	
	@Length(min=0, max=15, message="金额污水长度必须介于 0 和 15 之间")
	public String getAmountSlops() {
		return amountSlops;
	}

	public void setAmountSlops(String amountSlops) {
		this.amountSlops = amountSlops;
	}
	
	@Length(min=0, max=60, message="制单人长度必须介于 0 和 60 之间")
	public String getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}
	
	@Length(min=0, max=60, message="审核人长度必须介于 0 和 60 之间")
	public String getCheckPerson() {
		return checkPerson;
	}

	public void setCheckPerson(String checkPerson) {
		this.checkPerson = checkPerson;
	}
	
	@Length(min=0, max=20, message="制单日期长度必须介于 0 和 20 之间")
	public String getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(String makeDate) {
		this.makeDate = makeDate;
	}
	
	@Length(min=0, max=20, message="审核日期长度必须介于 0 和 20 之间")
	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	
	@Length(min=0, max=15, message="成本长度必须介于 0 和 15 之间")
	public String getRatioCost() {
		return ratioCost;
	}

	public void setRatioCost(String ratioCost) {
		this.ratioCost = ratioCost;
	}
	
	@Length(min=0, max=60, message="负责人长度必须介于 0 和 60 之间")
	public String getRatioOwner() {
		return ratioOwner;
	}

	public void setRatioOwner(String ratioOwner) {
		this.ratioOwner = ratioOwner;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getRatioRemark() {
		return ratioRemark;
	}

	public void setRatioRemark(String ratioRemark) {
		this.ratioRemark = ratioRemark;
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
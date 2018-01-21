/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.entity;

import com.thinkgem.jeesite.modules.doc.entity.DocConcrete;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.entity.DocStation;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 配合比通知单Entity
 * @author spark
 * @version 2018-01-21
 */
public class CoordinateRatioNotice extends DataEntity<CoordinateRatioNotice> {
	
	private static final long serialVersionUID = 1L;
	private String noticeNo;		// 生产通知单编号
	private String ratioCode;		// 配合比编号
	private String ratioNoticeCode;		// 配合比通知单编号
	private String noticeStatus;		// 通知单状态
	private String noticeMixing;		// 配合比通知单编号
	private String bengName;		// 泵名称
	private String customName;		// 客户名称
	private String projectName;		// 工程名称
	private String concreteName;		// 强度等级
	private String goodsCount;		// 要货数量
	private String specialRequire;		// 特殊要求
	private String buildSite;		// 施工部位
	private String waterMeth;		// 浇灌方法
	private String goodsDate;		// 施工日期
	private String noticeRemark;		// 备注
	private String mixingTime;		// 搅拌时间
	private String mixingNo;		// 搅拌系统编号
	private String imperviousLevel;		// 抗渗等级
	private String flexuralLevel;		// 抗折强度
	private String mixingStation;		// 搅拌站号
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
	private String repeWater;		// 仓库水
	private String dosageWater;		// 用量水
	private String dosageCement;		// 用量水泥
	private String repeCement;		// 仓库水泥
	private String repeAg1;		// 仓库骨料1
	private String dosageAg1;		// 用量骨料1
	private String dosageAg2;		// 用量骨料2
	private String repeAg2;		// 仓库骨料2
	private String dosageAg3;		// 用量骨料3
	private String repeAg3;		// 仓库骨料3
	private String repeAg4;		// 仓库骨料4
	private String dosageAg4;		// 用量骨料4
	private String repeFlyash;		// 仓库粉煤灰
	private String dosageFlyash;		// 用量粉煤灰
	private String repeBreeze;		// 仓库矿粉
	private String dosageBreeze;		// 用量矿粉
	private String repeAdd1;		// 仓库外加剂1
	private String dosageAdd1;		// 用量外加剂1
	private String dosageAdd2;		// 用量外加剂2
	private String repeAdd2;		// 仓库外加剂2
	private String repeBackup1;		// 仓库备用一
	private String dosageBackup1;		// 用量备用一
	private String dosageSlops;		// 用量污水
	private String repeSlops;		// 仓库污水
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
	private String primageWater;		// 含水率水
	private String primageCement;		// 含水率水泥
	private String primageAg1;		// 含水率骨料1
	private String primageAg2;		// 含水率骨料2
	private String primageAg3;		// 含水率骨料3
	private String primageAg4;		// 含水率骨料4
	private String primageFlyash;		// 含水率粉煤灰
	private String primageBreeze;		// 含水率矿粉
	private String primageAdd1;		// 含水率外加剂1
	private String primageAdd2;		// 含水率外加剂2
	private String primageBackup1;		// 含水率备用一
	private String primageSlops;		// 含水率污水
	private String weightWater;		// 水重水
	private String weightCement;		// 水重水泥
	private String weightAg1;		// 水重骨料1
	private String weightAg2;		// 水重骨料2
	private String weightAg3;		// 水重骨料3
	private String weightAg4;		// 水重骨料4
	private String weightFlyash;		// 水重粉煤灰
	private String weightBreeze;		// 水重矿粉
	private String weightAdd1;		// 水重外加剂1
	private String weightAdd2;		// 水重外加剂2
	private String weightBackup1;		// 水重备用一
	private String weightSlops;		// 水重污水
	private String wetweightWater;		// 湿量水
	private String wetweightCement;		// 湿量水泥
	private String wetweightAg1;		// 湿量骨料1
	private String wetweightAg2;		// 湿量骨料2
	private String wetweightAg3;		// 湿量骨料3
	private String wetweightAg4;		// 湿量骨料4
	private String wetweightFlyash;		// 湿量粉煤灰
	private String wetweightBreeze;		// 湿量矿粉
	private String wetweightAdd1;		// 湿量外加剂1
	private String wetweightAdd2;		// 湿量外加剂2
	private String wetweightBackup1;		// 湿量备用一
	private String wetweightSlops;		// 湿量污水
	private String resistCount;		// 抗压数量
	private String imperviousCount;		// 抗渗数量
	private String flexuralCount;		// 抗折数量
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String cancelPerson;		// 作废人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String cancelDate;		// 作废日期
	private String modifyPerson;		// 调整人
	private String noticeOwner;		// 负责人
	private String currRemark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark

	public DocStation getDocStation() {
		return docStation;
	}

	public void setDocStation(DocStation docStation) {
		this.docStation = docStation;
	}

	public CoordinateRatio getCoordinateRatio() {
		return coordinateRatio;
	}

	public void setCoordinateRatio(CoordinateRatio coordinateRatio) {
		this.coordinateRatio = coordinateRatio;
	}

	public ProduceDesign getProduceDesign() {
		return produceDesign;
	}

	public void setProduceDesign(ProduceDesign produceDesign) {
		this.produceDesign = produceDesign;
	}

	private DocStation docStation;
	private CoordinateRatio coordinateRatio;
	private ProduceDesign produceDesign;

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
	
	public CoordinateRatioNotice() {
		super();
	}

	public CoordinateRatioNotice(String id){
		super(id);
	}

	@Length(min=1, max=32, message="生产通知单编号长度必须介于 1 和 32 之间")
	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	@Length(min=1, max=20, message="配合比编号长度必须介于 1 和 20 之间")
	public String getRatioCode() {
		return ratioCode;
	}

	public void setRatioCode(String ratioCode) {
		this.ratioCode = ratioCode;
	}
	
	@Length(min=1, max=20, message="配合比通知单编号长度必须介于 1 和 20 之间")
	public String getRatioNoticeCode() {
		return ratioNoticeCode;
	}

	public void setRatioNoticeCode(String ratioNoticeCode) {
		this.ratioNoticeCode = ratioNoticeCode;
	}
	
	@Length(min=1, max=20, message="通知单状态长度必须介于 1 和 20 之间")
	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}
	
	@Length(min=1, max=20, message="配合比通知单编号长度必须介于 1 和 20 之间")
	public String getNoticeMixing() {
		return noticeMixing;
	}

	public void setNoticeMixing(String noticeMixing) {
		this.noticeMixing = noticeMixing;
	}
	
	@Length(min=0, max=20, message="泵名称长度必须介于 0 和 20 之间")
	public String getBengName() {
		return bengName;
	}

	public void setBengName(String bengName) {
		this.bengName = bengName;
	}
	
	@Length(min=0, max=60, message="客户名称长度必须介于 0 和 60 之间")
	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}
	
	@Length(min=0, max=60, message="工程名称长度必须介于 0 和 60 之间")
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=0, max=60, message="强度等级长度必须介于 0 和 60 之间")
	public String getConcreteName() {
		return concreteName;
	}

	public void setConcreteName(String concreteName) {
		this.concreteName = concreteName;
	}
	
	@Length(min=0, max=20, message="要货数量长度必须介于 0 和 20 之间")
	public String getGoodsCount() {
		return goodsCount;
	}

	public void setGoodsCount(String goodsCount) {
		this.goodsCount = goodsCount;
	}
	
	@Length(min=0, max=60, message="特殊要求长度必须介于 0 和 60 之间")
	public String getSpecialRequire() {
		return specialRequire;
	}

	public void setSpecialRequire(String specialRequire) {
		this.specialRequire = specialRequire;
	}
	
	@Length(min=0, max=30, message="施工部位长度必须介于 0 和 30 之间")
	public String getBuildSite() {
		return buildSite;
	}

	public void setBuildSite(String buildSite) {
		this.buildSite = buildSite;
	}
	
	@Length(min=0, max=60, message="浇灌方法长度必须介于 0 和 60 之间")
	public String getWaterMeth() {
		return waterMeth;
	}

	public void setWaterMeth(String waterMeth) {
		this.waterMeth = waterMeth;
	}
	
	@Length(min=0, max=20, message="施工日期长度必须介于 0 和 20 之间")
	public String getGoodsDate() {
		return goodsDate;
	}

	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getNoticeRemark() {
		return noticeRemark;
	}

	public void setNoticeRemark(String noticeRemark) {
		this.noticeRemark = noticeRemark;
	}
	
	@Length(min=0, max=20, message="搅拌时间长度必须介于 0 和 20 之间")
	public String getMixingTime() {
		return mixingTime;
	}

	public void setMixingTime(String mixingTime) {
		this.mixingTime = mixingTime;
	}
	
	@Length(min=0, max=32, message="搅拌系统编号长度必须介于 0 和 32 之间")
	public String getMixingNo() {
		return mixingNo;
	}

	public void setMixingNo(String mixingNo) {
		this.mixingNo = mixingNo;
	}
	
	@Length(min=0, max=20, message="抗渗等级长度必须介于 0 和 20 之间")
	public String getImperviousLevel() {
		return imperviousLevel;
	}

	public void setImperviousLevel(String imperviousLevel) {
		this.imperviousLevel = imperviousLevel;
	}
	
	@Length(min=0, max=20, message="抗折强度长度必须介于 0 和 20 之间")
	public String getFlexuralLevel() {
		return flexuralLevel;
	}

	public void setFlexuralLevel(String flexuralLevel) {
		this.flexuralLevel = flexuralLevel;
	}
	
	@Length(min=0, max=200, message="搅拌站号长度必须介于 0 和 200 之间")
	public String getMixingStation() {
		return mixingStation;
	}

	public void setMixingStation(String mixingStation) {
		this.mixingStation = mixingStation;
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
	
	@Length(min=0, max=50, message="仓库水长度必须介于 0 和 50 之间")
	public String getRepeWater() {
		return repeWater;
	}

	public void setRepeWater(String repeWater) {
		this.repeWater = repeWater;
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
	
	@Length(min=0, max=50, message="仓库水泥长度必须介于 0 和 50 之间")
	public String getRepeCement() {
		return repeCement;
	}

	public void setRepeCement(String repeCement) {
		this.repeCement = repeCement;
	}
	
	@Length(min=0, max=50, message="仓库骨料1长度必须介于 0 和 50 之间")
	public String getRepeAg1() {
		return repeAg1;
	}

	public void setRepeAg1(String repeAg1) {
		this.repeAg1 = repeAg1;
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
	
	@Length(min=0, max=50, message="仓库骨料2长度必须介于 0 和 50 之间")
	public String getRepeAg2() {
		return repeAg2;
	}

	public void setRepeAg2(String repeAg2) {
		this.repeAg2 = repeAg2;
	}
	
	@Length(min=0, max=15, message="用量骨料3长度必须介于 0 和 15 之间")
	public String getDosageAg3() {
		return dosageAg3;
	}

	public void setDosageAg3(String dosageAg3) {
		this.dosageAg3 = dosageAg3;
	}
	
	@Length(min=0, max=50, message="仓库骨料3长度必须介于 0 和 50 之间")
	public String getRepeAg3() {
		return repeAg3;
	}

	public void setRepeAg3(String repeAg3) {
		this.repeAg3 = repeAg3;
	}
	
	@Length(min=0, max=50, message="仓库骨料4长度必须介于 0 和 50 之间")
	public String getRepeAg4() {
		return repeAg4;
	}

	public void setRepeAg4(String repeAg4) {
		this.repeAg4 = repeAg4;
	}
	
	@Length(min=0, max=15, message="用量骨料4长度必须介于 0 和 15 之间")
	public String getDosageAg4() {
		return dosageAg4;
	}

	public void setDosageAg4(String dosageAg4) {
		this.dosageAg4 = dosageAg4;
	}
	
	@Length(min=0, max=50, message="仓库粉煤灰长度必须介于 0 和 50 之间")
	public String getRepeFlyash() {
		return repeFlyash;
	}

	public void setRepeFlyash(String repeFlyash) {
		this.repeFlyash = repeFlyash;
	}
	
	@Length(min=0, max=15, message="用量粉煤灰长度必须介于 0 和 15 之间")
	public String getDosageFlyash() {
		return dosageFlyash;
	}

	public void setDosageFlyash(String dosageFlyash) {
		this.dosageFlyash = dosageFlyash;
	}
	
	@Length(min=0, max=50, message="仓库矿粉长度必须介于 0 和 50 之间")
	public String getRepeBreeze() {
		return repeBreeze;
	}

	public void setRepeBreeze(String repeBreeze) {
		this.repeBreeze = repeBreeze;
	}
	
	@Length(min=0, max=15, message="用量矿粉长度必须介于 0 和 15 之间")
	public String getDosageBreeze() {
		return dosageBreeze;
	}

	public void setDosageBreeze(String dosageBreeze) {
		this.dosageBreeze = dosageBreeze;
	}
	
	@Length(min=0, max=50, message="仓库外加剂1长度必须介于 0 和 50 之间")
	public String getRepeAdd1() {
		return repeAdd1;
	}

	public void setRepeAdd1(String repeAdd1) {
		this.repeAdd1 = repeAdd1;
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
	
	@Length(min=0, max=50, message="仓库外加剂2长度必须介于 0 和 50 之间")
	public String getRepeAdd2() {
		return repeAdd2;
	}

	public void setRepeAdd2(String repeAdd2) {
		this.repeAdd2 = repeAdd2;
	}
	
	@Length(min=0, max=50, message="仓库备用一长度必须介于 0 和 50 之间")
	public String getRepeBackup1() {
		return repeBackup1;
	}

	public void setRepeBackup1(String repeBackup1) {
		this.repeBackup1 = repeBackup1;
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
	
	@Length(min=0, max=50, message="仓库污水长度必须介于 0 和 50 之间")
	public String getRepeSlops() {
		return repeSlops;
	}

	public void setRepeSlops(String repeSlops) {
		this.repeSlops = repeSlops;
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
	
	@Length(min=0, max=15, message="含水率水长度必须介于 0 和 15 之间")
	public String getPrimageWater() {
		return primageWater;
	}

	public void setPrimageWater(String primageWater) {
		this.primageWater = primageWater;
	}
	
	@Length(min=0, max=15, message="含水率水泥长度必须介于 0 和 15 之间")
	public String getPrimageCement() {
		return primageCement;
	}

	public void setPrimageCement(String primageCement) {
		this.primageCement = primageCement;
	}
	
	@Length(min=0, max=15, message="含水率骨料1长度必须介于 0 和 15 之间")
	public String getPrimageAg1() {
		return primageAg1;
	}

	public void setPrimageAg1(String primageAg1) {
		this.primageAg1 = primageAg1;
	}
	
	@Length(min=0, max=15, message="含水率骨料2长度必须介于 0 和 15 之间")
	public String getPrimageAg2() {
		return primageAg2;
	}

	public void setPrimageAg2(String primageAg2) {
		this.primageAg2 = primageAg2;
	}
	
	@Length(min=0, max=15, message="含水率骨料3长度必须介于 0 和 15 之间")
	public String getPrimageAg3() {
		return primageAg3;
	}

	public void setPrimageAg3(String primageAg3) {
		this.primageAg3 = primageAg3;
	}
	
	@Length(min=0, max=15, message="含水率骨料4长度必须介于 0 和 15 之间")
	public String getPrimageAg4() {
		return primageAg4;
	}

	public void setPrimageAg4(String primageAg4) {
		this.primageAg4 = primageAg4;
	}
	
	@Length(min=0, max=15, message="含水率粉煤灰长度必须介于 0 和 15 之间")
	public String getPrimageFlyash() {
		return primageFlyash;
	}

	public void setPrimageFlyash(String primageFlyash) {
		this.primageFlyash = primageFlyash;
	}
	
	@Length(min=0, max=15, message="含水率矿粉长度必须介于 0 和 15 之间")
	public String getPrimageBreeze() {
		return primageBreeze;
	}

	public void setPrimageBreeze(String primageBreeze) {
		this.primageBreeze = primageBreeze;
	}
	
	@Length(min=0, max=15, message="含水率外加剂1长度必须介于 0 和 15 之间")
	public String getPrimageAdd1() {
		return primageAdd1;
	}

	public void setPrimageAdd1(String primageAdd1) {
		this.primageAdd1 = primageAdd1;
	}
	
	@Length(min=0, max=15, message="含水率外加剂2长度必须介于 0 和 15 之间")
	public String getPrimageAdd2() {
		return primageAdd2;
	}

	public void setPrimageAdd2(String primageAdd2) {
		this.primageAdd2 = primageAdd2;
	}
	
	@Length(min=0, max=15, message="含水率备用一长度必须介于 0 和 15 之间")
	public String getPrimageBackup1() {
		return primageBackup1;
	}

	public void setPrimageBackup1(String primageBackup1) {
		this.primageBackup1 = primageBackup1;
	}
	
	@Length(min=0, max=15, message="含水率污水长度必须介于 0 和 15 之间")
	public String getPrimageSlops() {
		return primageSlops;
	}

	public void setPrimageSlops(String primageSlops) {
		this.primageSlops = primageSlops;
	}
	
	@Length(min=0, max=15, message="水重水长度必须介于 0 和 15 之间")
	public String getWeightWater() {
		return weightWater;
	}

	public void setWeightWater(String weightWater) {
		this.weightWater = weightWater;
	}
	
	@Length(min=0, max=15, message="水重水泥长度必须介于 0 和 15 之间")
	public String getWeightCement() {
		return weightCement;
	}

	public void setWeightCement(String weightCement) {
		this.weightCement = weightCement;
	}
	
	@Length(min=0, max=15, message="水重骨料1长度必须介于 0 和 15 之间")
	public String getWeightAg1() {
		return weightAg1;
	}

	public void setWeightAg1(String weightAg1) {
		this.weightAg1 = weightAg1;
	}
	
	@Length(min=0, max=15, message="水重骨料2长度必须介于 0 和 15 之间")
	public String getWeightAg2() {
		return weightAg2;
	}

	public void setWeightAg2(String weightAg2) {
		this.weightAg2 = weightAg2;
	}
	
	@Length(min=0, max=15, message="水重骨料3长度必须介于 0 和 15 之间")
	public String getWeightAg3() {
		return weightAg3;
	}

	public void setWeightAg3(String weightAg3) {
		this.weightAg3 = weightAg3;
	}
	
	@Length(min=0, max=15, message="水重骨料4长度必须介于 0 和 15 之间")
	public String getWeightAg4() {
		return weightAg4;
	}

	public void setWeightAg4(String weightAg4) {
		this.weightAg4 = weightAg4;
	}
	
	@Length(min=0, max=15, message="水重粉煤灰长度必须介于 0 和 15 之间")
	public String getWeightFlyash() {
		return weightFlyash;
	}

	public void setWeightFlyash(String weightFlyash) {
		this.weightFlyash = weightFlyash;
	}
	
	@Length(min=0, max=15, message="水重矿粉长度必须介于 0 和 15 之间")
	public String getWeightBreeze() {
		return weightBreeze;
	}

	public void setWeightBreeze(String weightBreeze) {
		this.weightBreeze = weightBreeze;
	}
	
	@Length(min=0, max=15, message="水重外加剂1长度必须介于 0 和 15 之间")
	public String getWeightAdd1() {
		return weightAdd1;
	}

	public void setWeightAdd1(String weightAdd1) {
		this.weightAdd1 = weightAdd1;
	}
	
	@Length(min=0, max=15, message="水重外加剂2长度必须介于 0 和 15 之间")
	public String getWeightAdd2() {
		return weightAdd2;
	}

	public void setWeightAdd2(String weightAdd2) {
		this.weightAdd2 = weightAdd2;
	}
	
	@Length(min=0, max=15, message="水重备用一长度必须介于 0 和 15 之间")
	public String getWeightBackup1() {
		return weightBackup1;
	}

	public void setWeightBackup1(String weightBackup1) {
		this.weightBackup1 = weightBackup1;
	}
	
	@Length(min=0, max=15, message="水重污水长度必须介于 0 和 15 之间")
	public String getWeightSlops() {
		return weightSlops;
	}

	public void setWeightSlops(String weightSlops) {
		this.weightSlops = weightSlops;
	}
	
	@Length(min=0, max=15, message="湿量水长度必须介于 0 和 15 之间")
	public String getWetweightWater() {
		return wetweightWater;
	}

	public void setWetweightWater(String wetweightWater) {
		this.wetweightWater = wetweightWater;
	}
	
	@Length(min=0, max=15, message="湿量水泥长度必须介于 0 和 15 之间")
	public String getWetweightCement() {
		return wetweightCement;
	}

	public void setWetweightCement(String wetweightCement) {
		this.wetweightCement = wetweightCement;
	}
	
	@Length(min=0, max=15, message="湿量骨料1长度必须介于 0 和 15 之间")
	public String getWetweightAg1() {
		return wetweightAg1;
	}

	public void setWetweightAg1(String wetweightAg1) {
		this.wetweightAg1 = wetweightAg1;
	}
	
	@Length(min=0, max=15, message="湿量骨料2长度必须介于 0 和 15 之间")
	public String getWetweightAg2() {
		return wetweightAg2;
	}

	public void setWetweightAg2(String wetweightAg2) {
		this.wetweightAg2 = wetweightAg2;
	}
	
	@Length(min=0, max=15, message="湿量骨料3长度必须介于 0 和 15 之间")
	public String getWetweightAg3() {
		return wetweightAg3;
	}

	public void setWetweightAg3(String wetweightAg3) {
		this.wetweightAg3 = wetweightAg3;
	}
	
	@Length(min=0, max=15, message="湿量骨料4长度必须介于 0 和 15 之间")
	public String getWetweightAg4() {
		return wetweightAg4;
	}

	public void setWetweightAg4(String wetweightAg4) {
		this.wetweightAg4 = wetweightAg4;
	}
	
	@Length(min=0, max=15, message="湿量粉煤灰长度必须介于 0 和 15 之间")
	public String getWetweightFlyash() {
		return wetweightFlyash;
	}

	public void setWetweightFlyash(String wetweightFlyash) {
		this.wetweightFlyash = wetweightFlyash;
	}
	
	@Length(min=0, max=15, message="湿量矿粉长度必须介于 0 和 15 之间")
	public String getWetweightBreeze() {
		return wetweightBreeze;
	}

	public void setWetweightBreeze(String wetweightBreeze) {
		this.wetweightBreeze = wetweightBreeze;
	}
	
	@Length(min=0, max=15, message="湿量外加剂1长度必须介于 0 和 15 之间")
	public String getWetweightAdd1() {
		return wetweightAdd1;
	}

	public void setWetweightAdd1(String wetweightAdd1) {
		this.wetweightAdd1 = wetweightAdd1;
	}
	
	@Length(min=0, max=15, message="湿量外加剂2长度必须介于 0 和 15 之间")
	public String getWetweightAdd2() {
		return wetweightAdd2;
	}

	public void setWetweightAdd2(String wetweightAdd2) {
		this.wetweightAdd2 = wetweightAdd2;
	}
	
	@Length(min=0, max=15, message="湿量备用一长度必须介于 0 和 15 之间")
	public String getWetweightBackup1() {
		return wetweightBackup1;
	}

	public void setWetweightBackup1(String wetweightBackup1) {
		this.wetweightBackup1 = wetweightBackup1;
	}
	
	@Length(min=0, max=15, message="湿量污水长度必须介于 0 和 15 之间")
	public String getWetweightSlops() {
		return wetweightSlops;
	}

	public void setWetweightSlops(String wetweightSlops) {
		this.wetweightSlops = wetweightSlops;
	}
	
	@Length(min=0, max=10, message="抗压数量长度必须介于 0 和 10 之间")
	public String getResistCount() {
		return resistCount;
	}

	public void setResistCount(String resistCount) {
		this.resistCount = resistCount;
	}
	
	@Length(min=0, max=10, message="抗渗数量长度必须介于 0 和 10 之间")
	public String getImperviousCount() {
		return imperviousCount;
	}

	public void setImperviousCount(String imperviousCount) {
		this.imperviousCount = imperviousCount;
	}
	
	@Length(min=0, max=10, message="抗折数量长度必须介于 0 和 10 之间")
	public String getFlexuralCount() {
		return flexuralCount;
	}

	public void setFlexuralCount(String flexuralCount) {
		this.flexuralCount = flexuralCount;
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
	
	@Length(min=0, max=60, message="作废人长度必须介于 0 和 60 之间")
	public String getCancelPerson() {
		return cancelPerson;
	}

	public void setCancelPerson(String cancelPerson) {
		this.cancelPerson = cancelPerson;
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
	
	@Length(min=0, max=20, message="作废日期长度必须介于 0 和 20 之间")
	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	
	@Length(min=0, max=60, message="调整人长度必须介于 0 和 60 之间")
	public String getModifyPerson() {
		return modifyPerson;
	}

	public void setModifyPerson(String modifyPerson) {
		this.modifyPerson = modifyPerson;
	}
	
	@Length(min=0, max=60, message="负责人长度必须介于 0 和 60 之间")
	public String getNoticeOwner() {
		return noticeOwner;
	}

	public void setNoticeOwner(String noticeOwner) {
		this.noticeOwner = noticeOwner;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getCurrRemark() {
		return currRemark;
	}

	public void setCurrRemark(String currRemark) {
		this.currRemark = currRemark;
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
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.produces.entity;

import com.thinkgem.jeesite.modules.contract.entity.ContractSales;
import com.thinkgem.jeesite.modules.doc.entity.DocBeton;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.entity.DocPump;
import com.thinkgem.jeesite.modules.doc.entity.DocWatermeth;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 生产计划单Entity
 * @author spark
 * @version 2018-01-04
 */
public class ProduceDesign extends DataEntity<ProduceDesign> {
	
	private static final long serialVersionUID = 1L;
	private String noticeNo;		// 通知单号
	private String goodsDate;		// 要货日期
	private String firstDate;		// 首次送达时间
	private String customName;		// 客户名称
	private String buildUnit;		// 建设单位
	private String receiveUnit;		// 收货单位
	private String goodsCount;		// 要货数量
	private String taskCount;		// 计划数量
	private String hetongAccmeth;		// 合同结算方式
	private String kindName;		// 品种名称
	private String buildSite;		// 施工部位
	private String waterMeth;		// 浇灌方法
	private String localeDispatch;		// 现场调度
	private String bengName;		// 泵名称
	private String distance;		// 运距
	private String projectAddr;		// 工程地址
	private String contact;		// 联系人
	private String specialRequire;		// 特殊要求
	private String concreteName;		// 混凝土名称
	private String produceDispatch;		// 生产调度
	private String checkPerson;		// 审核人
	private String canclePerson;		// 作废人
	private String makeDate;		// 制单日期
	private String checkDate;		// 审核日期
	private String cancelDate;		// 作废日期
	private String salesman;		// 业务员
	private String slumps;		// 坍落度
	private String status;		// 状态
	private String noticeFlag;		// 生产通知单标志
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	private ContractSales contractSales;

	private DocBeton docBeton;
	private DocWatermeth docWatermeth;
	private DocOfficework docOfficework;
	private DocPump docPump;
	private ProjectDistance projectDistance;

	public DocBeton getDocBeton() {
		return docBeton;
	}

	public void setDocBeton(DocBeton docBeton) {
		this.docBeton = docBeton;
	}

	public DocWatermeth getDocWatermeth() {
		return docWatermeth;
	}

	public void setDocWatermeth(DocWatermeth docWatermeth) {
		this.docWatermeth = docWatermeth;
	}

	public DocOfficework getDocOfficework() {
		return docOfficework;
	}

	public void setDocOfficework(DocOfficework docOfficework) {
		this.docOfficework = docOfficework;
	}

	public DocPump getDocPump() {
		return docPump;
	}

	public void setDocPump(DocPump docPump) {
		this.docPump = docPump;
	}

	public ProjectDistance getProjectDistance() {
		return projectDistance;
	}

	public void setProjectDistance(ProjectDistance projectDistance) {
		this.projectDistance = projectDistance;
	}

	public ContractSales getContractSales() {
		return contractSales;
	}

	public void setContractSales(ContractSales contractSales) {
		this.contractSales = contractSales;
	}

	public ProduceDesign() {
		super();
	}

	public ProduceDesign(String id){
		super(id);
	}

	@Length(min=1, max=32, message="通知单号长度必须介于 1 和 32 之间")
	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	@Length(min=0, max=20, message="要货日期长度必须介于 0 和 20 之间")
	public String getGoodsDate() {
		return goodsDate;
	}

	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}
	
	@Length(min=0, max=20, message="首次送达时间长度必须介于 0 和 20 之间")
	public String getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	
	@Length(min=0, max=60, message="客户名称长度必须介于 0 和 60 之间")
	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}
	
	@Length(min=0, max=120, message="建设单位长度必须介于 0 和 120 之间")
	public String getBuildUnit() {
		return buildUnit;
	}

	public void setBuildUnit(String buildUnit) {
		this.buildUnit = buildUnit;
	}
	
	@Length(min=0, max=120, message="收货单位长度必须介于 0 和 120 之间")
	public String getReceiveUnit() {
		return receiveUnit;
	}

	public void setReceiveUnit(String receiveUnit) {
		this.receiveUnit = receiveUnit;
	}
	
	@Length(min=0, max=20, message="要货数量长度必须介于 0 和 20 之间")
	public String getGoodsCount() {
		return goodsCount;
	}

	public void setGoodsCount(String goodsCount) {
		this.goodsCount = goodsCount;
	}
	
	@Length(min=0, max=20, message="计划数量长度必须介于 0 和 20 之间")
	public String getTaskCount() {
		return taskCount;
	}

	public void setTaskCount(String taskCount) {
		this.taskCount = taskCount;
	}
	
	@Length(min=0, max=60, message="合同结算方式长度必须介于 0 和 60 之间")
	public String getHetongAccmeth() {
		return hetongAccmeth;
	}

	public void setHetongAccmeth(String hetongAccmeth) {
		this.hetongAccmeth = hetongAccmeth;
	}
	
	@Length(min=0, max=60, message="品种名称长度必须介于 0 和 60 之间")
	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
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
	
	@Length(min=0, max=60, message="现场调度长度必须介于 0 和 60 之间")
	public String getLocaleDispatch() {
		return localeDispatch;
	}

	public void setLocaleDispatch(String localeDispatch) {
		this.localeDispatch = localeDispatch;
	}
	
	@Length(min=0, max=20, message="泵名称长度必须介于 0 和 20 之间")
	public String getBengName() {
		return bengName;
	}

	public void setBengName(String bengName) {
		this.bengName = bengName;
	}
	
	@Length(min=0, max=60, message="运距长度必须介于 0 和 60 之间")
	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}
	
	@Length(min=0, max=240, message="工程地址长度必须介于 0 和 240 之间")
	public String getProjectAddr() {
		return projectAddr;
	}

	public void setProjectAddr(String projectAddr) {
		this.projectAddr = projectAddr;
	}
	
	@Length(min=0, max=60, message="联系人长度必须介于 0 和 60 之间")
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Length(min=0, max=11, message="特殊要求长度必须介于 0 和 11 之间")
	public String getSpecialRequire() {
		return specialRequire;
	}

	public void setSpecialRequire(String specialRequire) {
		this.specialRequire = specialRequire;
	}
	
	@Length(min=0, max=60, message="混凝土名称长度必须介于 0 和 60 之间")
	public String getConcreteName() {
		return concreteName;
	}

	public void setConcreteName(String concreteName) {
		this.concreteName = concreteName;
	}
	
	@Length(min=0, max=60, message="生产调度长度必须介于 0 和 60 之间")
	public String getProduceDispatch() {
		return produceDispatch;
	}

	public void setProduceDispatch(String produceDispatch) {
		this.produceDispatch = produceDispatch;
	}
	
	@Length(min=0, max=60, message="审核人长度必须介于 0 和 60 之间")
	public String getCheckPerson() {
		return checkPerson;
	}

	public void setCheckPerson(String checkPerson) {
		this.checkPerson = checkPerson;
	}
	
	@Length(min=0, max=60, message="作废人长度必须介于 0 和 60 之间")
	public String getCanclePerson() {
		return canclePerson;
	}

	public void setCanclePerson(String canclePerson) {
		this.canclePerson = canclePerson;
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
	
	@Length(min=0, max=60, message="业务员长度必须介于 0 和 60 之间")
	public String getSalesman() {
		return salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}
	
	@Length(min=0, max=60, message="坍落度长度必须介于 0 和 60 之间")
	public String getSlumps() {
		return slumps;
	}

	public void setSlumps(String slumps) {
		this.slumps = slumps;
	}
	
	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=11, message="生产通知单标志长度必须介于 0 和 11 之间")
	public String getNoticeFlag() {
		return noticeFlag;
	}

	public void setNoticeFlag(String noticeFlag) {
		this.noticeFlag = noticeFlag;
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
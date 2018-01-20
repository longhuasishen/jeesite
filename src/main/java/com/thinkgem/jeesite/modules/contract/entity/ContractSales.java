/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.contract.entity;

import com.thinkgem.jeesite.modules.doc.entity.DocAccmeth;
import com.thinkgem.jeesite.modules.doc.entity.DocCustomer;
import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 销售合同Entity
 * @author spark
 * @version 2017-12-30
 */
public class ContractSales extends DataEntity<ContractSales> {
	
	private static final long serialVersionUID = 1L;
	private String projectName;		// 工程名称
	private String contractId;		// 合同编号
	private String contractDate;		// 签定日期
	private String contractComp;		// 合同单位
	private String projectAddr;		// 项目地址
	private String contractDepartment;		// 签定部门
	private String salesPerson;		// 业务员
	private String comstemType;		// 客户分类
	private String tongAccmeth;		// 砼结算方式
	private String contractAddr;		// 签定地点
	private String thirdPerson;		// 见证方
	private String effTerm;		// 有效期限
	private String effStart;		// 起始期限
	private String effEnd;		// 终止期限
	private String cubeControl;		// 方量控制
	private String cubeStart;		// 起始方量
	private String cubeEnd;		// 终止方量
	private String timeControl;		// 时间控制
	private String timeStart;		// 起始时间
	private String timeEnd;		// 终止时间
	private String createPerson;		// 制单人
	private String checkPerson;		// 审核人
	private String canclePerson;		// 作废人

	public String getCusCode() {
		return cusCode;
	}

	public void setCusCode(String cusCode) {
		this.cusCode = cusCode;
	}

	private String cusCode;			//客户编码

	public String getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(String makeDate) {
		this.makeDate = makeDate;
	}

	private String makeDate;		// 审核日期
	private String checkDate;		// 审核日期
	private String cancelDate;		// 作废日期
	private String contractRemark;		// 备注
	private String concretePrice;		// 混凝土单价
	private String watermethPrice;		// 浇灌方式单价
	private String specPrice;		// 特殊要求单价
	private String sumControl;		// 其它特殊要求
	private String saveInventory;		// 工程需用量
	private String stockStand;		// 验收方法及期限
	private String abcCategory;		// 交货时间及地点
	private String taxRate;		// 结算方式
	private String qualityManage;		// 付款方式
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark

	private DocCustomer docCustomer;
	private DocDepartment docDepartment;
	private DocOfficework docOfficework;
	private DocAccmeth docAccmeth;


	public DocAccmeth getDocAccmeth() {	return docAccmeth;}
	public void setDocAccmeth(DocAccmeth docAccmeth) {		this.docAccmeth = docAccmeth;	}
	public DocOfficework getDocOfficework() {		return docOfficework;	}
	public void setDocOfficework(DocOfficework docOfficework) {		this.docOfficework = docOfficework;	}
	public DocDepartment getDocDepartment() {		return docDepartment;	}
	public void setDocDepartment(DocDepartment docDepartment) {		this.docDepartment = docDepartment;	}

	public DocCustomer getDocCustomer() {
		return docCustomer;
	}

	public void setDocCustomer(DocCustomer docCustomer) {
		this.docCustomer = docCustomer;
	}

	public ContractSales() {
		super();
	}

	public ContractSales(String id){
		super(id);
	}

	@Length(min=1, max=120, message="工程名称长度必须介于 1 和 120 之间")
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=0, max=32, message="合同编号长度必须介于 0 和 32 之间")
	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	
	@Length(min=0, max=20, message="签定日期长度必须介于 0 和 20 之间")
	public String getContractDate() {
		return contractDate;
	}

	public void setContractDate(String contractDate) {
		this.contractDate = contractDate;
	}
	
	@Length(min=0, max=120, message="合同单位长度必须介于 0 和 120 之间")
	public String getContractComp() {
		return contractComp;
	}

	public void setContractComp(String contractComp) {
		this.contractComp = contractComp;
	}
	
	@Length(min=0, max=240, message="项目地址长度必须介于 0 和 240 之间")
	public String getProjectAddr() {
		return projectAddr;
	}

	public void setProjectAddr(String projectAddr) {
		this.projectAddr = projectAddr;
	}
	
	@Length(min=0, max=60, message="签定部门长度必须介于 0 和 60 之间")
	public String getContractDepartment() {
		return contractDepartment;
	}

	public void setContractDepartment(String contractDepartment) {
		this.contractDepartment = contractDepartment;
	}
	
	@Length(min=0, max=60, message="业务员长度必须介于 0 和 60 之间")
	public String getSalesPerson() {
		return salesPerson;
	}

	public void setSalesPerson(String salesPerson) {
		this.salesPerson = salesPerson;
	}
	
	@Length(min=0, max=32, message="客户分类长度必须介于 0 和 32 之间")
	public String getComstemType() {
		return comstemType;
	}

	public void setComstemType(String comstemType) {
		this.comstemType = comstemType;
	}
	
	@Length(min=0, max=60, message="砼结算方式长度必须介于 0 和 60 之间")
	public String getTongAccmeth() {
		return tongAccmeth;
	}

	public void setTongAccmeth(String tongAccmeth) {
		this.tongAccmeth = tongAccmeth;
	}
	
	@Length(min=0, max=240, message="签定地点长度必须介于 0 和 240 之间")
	public String getContractAddr() {
		return contractAddr;
	}

	public void setContractAddr(String contractAddr) {
		this.contractAddr = contractAddr;
	}
	
	@Length(min=0, max=60, message="见证方长度必须介于 0 和 60 之间")
	public String getThirdPerson() {
		return thirdPerson;
	}

	public void setThirdPerson(String thirdPerson) {
		this.thirdPerson = thirdPerson;
	}
	
	@Length(min=0, max=1, message="有效期限长度必须介于 0 和 1 之间")
	public String getEffTerm() {
		return effTerm;
	}

	public void setEffTerm(String effTerm) {
		this.effTerm = effTerm;
	}
	
	@Length(min=0, max=20, message="起始期限长度必须介于 0 和 20 之间")
	public String getEffStart() {
		return effStart;
	}

	public void setEffStart(String effStart) {
		this.effStart = effStart;
	}
	
	@Length(min=0, max=20, message="终止期限长度必须介于 0 和 20 之间")
	public String getEffEnd() {
		return effEnd;
	}

	public void setEffEnd(String effEnd) {
		this.effEnd = effEnd;
	}
	
	@Length(min=0, max=1, message="方量控制长度必须介于 0 和 1 之间")
	public String getCubeControl() {
		return cubeControl;
	}

	public void setCubeControl(String cubeControl) {
		this.cubeControl = cubeControl;
	}
	
	@Length(min=0, max=32, message="起始方量长度必须介于 0 和 32 之间")
	public String getCubeStart() {
		return cubeStart;
	}

	public void setCubeStart(String cubeStart) {
		this.cubeStart = cubeStart;
	}
	
	@Length(min=0, max=32, message="终止方量长度必须介于 0 和 32 之间")
	public String getCubeEnd() {
		return cubeEnd;
	}

	public void setCubeEnd(String cubeEnd) {
		this.cubeEnd = cubeEnd;
	}
	
	@Length(min=0, max=1, message="时间控制长度必须介于 0 和 1 之间")
	public String getTimeControl() {
		return timeControl;
	}

	public void setTimeControl(String timeControl) {
		this.timeControl = timeControl;
	}
	
	@Length(min=0, max=20, message="起始时间长度必须介于 0 和 20 之间")
	public String getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}
	
	@Length(min=0, max=20, message="终止时间长度必须介于 0 和 20 之间")
	public String getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
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
	public String getCanclePerson() {
		return canclePerson;
	}

	public void setCanclePerson(String canclePerson) {
		this.canclePerson = canclePerson;
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
	
	@Length(min=0, max=256, message="备注长度必须介于 0 和 256 之间")
	public String getContractRemark() {
		return contractRemark;
	}

	public void setContractRemark(String contractRemark) {
		this.contractRemark = contractRemark;
	}
	
	@Length(min=0, max=11, message="混凝土单价长度必须介于 0 和 11 之间")
	public String getConcretePrice() {
		return concretePrice;
	}

	public void setConcretePrice(String concretePrice) {
		this.concretePrice = concretePrice;
	}
	
	@Length(min=0, max=11, message="浇灌方式单价长度必须介于 0 和 11 之间")
	public String getWatermethPrice() {
		return watermethPrice;
	}

	public void setWatermethPrice(String watermethPrice) {
		this.watermethPrice = watermethPrice;
	}
	
	@Length(min=0, max=11, message="特殊要求单价长度必须介于 0 和 11 之间")
	public String getSpecPrice() {
		return specPrice;
	}

	public void setSpecPrice(String specPrice) {
		this.specPrice = specPrice;
	}
	
	@Length(min=0, max=1000, message="其它特殊要求长度必须介于 0 和 1000 之间")
	public String getSumControl() {
		return sumControl;
	}

	public void setSumControl(String sumControl) {
		this.sumControl = sumControl;
	}
	
	@Length(min=0, max=1000, message="工程需用量长度必须介于 0 和 1000 之间")
	public String getSaveInventory() {
		return saveInventory;
	}

	public void setSaveInventory(String saveInventory) {
		this.saveInventory = saveInventory;
	}
	
	@Length(min=0, max=1000, message="验收方法及期限长度必须介于 0 和 1000 之间")
	public String getStockStand() {
		return stockStand;
	}

	public void setStockStand(String stockStand) {
		this.stockStand = stockStand;
	}
	
	@Length(min=0, max=1000, message="交货时间及地点长度必须介于 0 和 1000 之间")
	public String getAbcCategory() {
		return abcCategory;
	}

	public void setAbcCategory(String abcCategory) {
		this.abcCategory = abcCategory;
	}
	
	@Length(min=0, max=1000, message="结算方式长度必须介于 0 和 1000 之间")
	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	
	@Length(min=0, max=1000, message="付款方式长度必须介于 0 和 1000 之间")
	public String getQualityManage() {
		return qualityManage;
	}

	public void setQualityManage(String qualityManage) {
		this.qualityManage = qualityManage;
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
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.purchase.entity;

import com.thinkgem.jeesite.modules.archive.entity.ArchiveContract;
import com.thinkgem.jeesite.modules.doc.entity.DocAccmeth;
import com.thinkgem.jeesite.modules.doc.entity.DocDepartment;
import com.thinkgem.jeesite.modules.doc.entity.DocOfficework;
import com.thinkgem.jeesite.modules.doc.entity.DocSupplier;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 采购合同Entity
 * @author lisy
 * @version 2017-12-24
 */

@Getter
@Setter
public class ContractPurchase extends DataEntity<ContractPurchase> {
	
	private static final long serialVersionUID = 1L;
	private String contractCode;		// 合同编号
	private DocSupplier docSupplier;		// 供应商编码
	private ArchiveContract archiveContract;		// 合同分类编码
	private String signDate;		// 签订日期
	private String signPlace;		// 签订地点
    private String liquidDateRate;   //违约金比例
	private DocDepartment docDepartment;		// 签订部门
	private String periodStart;		// 有效期起始
	private String periodEnd;		// 有效期结束
	private DocAccmeth docAccmeth;		// 结算方式编码
	private DocOfficework docOfficework;		// 业务员编码
	private String transportType;		// 是否需要承运
	private String contraceCreate;		// 制单人
	private String contractCreateDate;		// 制单日期
	private String contractAuditor;		// 审核人
	private String contractAuditDate;		// 审核日期
	private String contractCancel;		// 作废人
	private String contractCancelDate;		// 作废日期
	private String remark;		// 备注
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	
	public ContractPurchase() {
		super();
	}

	public ContractPurchase(String id){
		super(id);
	}

	@Length(min=1, max=16, message="合同编号长度必须介于 1 和 16 之间")
	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}

	@Length(min=1, max=20, message="签订日期长度必须介于 1 和 20 之间")
	public String getSignDate() {
		return signDate;
	}

	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}
	
	@Length(min=1, max=20, message="签订地点长度必须介于 1 和 20 之间")
	public String getSignPlace() {
		return signPlace;
	}

	public void setSignPlace(String signPlace) {
		this.signPlace = signPlace;
	}
	

	@Length(min=0, max=20, message="有效期起始长度必须介于 0 和 20 之间")
	public String getPeriodStart() {
		return periodStart;
	}

	public void setPeriodStart(String periodStart) {
		this.periodStart = periodStart;
	}
	
	@Length(min=0, max=20, message="有效期结束长度必须介于 0 和 20 之间")
	public String getPeriodEnd() {
		return periodEnd;
	}

	public void setPeriodEnd(String periodEnd) {
		this.periodEnd = periodEnd;
	}
	
	@Length(min=0, max=20, message="是否需要承运长度必须介于 0 和 20 之间")
	public String getTransportType() {
		return transportType;
	}

	public void setTransportType(String transportType) {
		this.transportType = transportType;
	}
	
	@Length(min=1, max=20, message="制单人长度必须介于 1 和 20 之间")
	public String getContraceCreate() {
		return contraceCreate;
	}

	public void setContraceCreate(String contraceCreate) {
		this.contraceCreate = contraceCreate;
	}
	
	@Length(min=0, max=20, message="制单日期长度必须介于 0 和 20 之间")
	public String getContractCreateDate() {
		return contractCreateDate;
	}

	public void setContractCreateDate(String contractCreateDate) {
		this.contractCreateDate = contractCreateDate;
	}
	
	@Length(min=0, max=20, message="审核人长度必须介于 0 和 20 之间")
	public String getContractAuditor() {
		return contractAuditor;
	}

	public void setContractAuditor(String contractAuditor) {
		this.contractAuditor = contractAuditor;
	}
	
	@Length(min=0, max=20, message="审核日期长度必须介于 0 和 20 之间")
	public String getContractAuditDate() {
		return contractAuditDate;
	}

	public void setContractAuditDate(String contractAuditDate) {
		this.contractAuditDate = contractAuditDate;
	}
	
	@Length(min=0, max=20, message="作废人长度必须介于 0 和 20 之间")
	public String getContractCancel() {
		return contractCancel;
	}

	public void setContractCancel(String contractCancel) {
		this.contractCancel = contractCancel;
	}
	
	@Length(min=0, max=20, message="作废日期长度必须介于 0 和 20 之间")
	public String getContractCancelDate() {
		return contractCancelDate;
	}

	public void setContractCancelDate(String contractCancelDate) {
		this.contractCancelDate = contractCancelDate;
	}
	
	@Length(min=0, max=1000, message="备注长度必须介于 0 和 1000 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.doc.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 搅拌站点信息Entity
 * @author lisy
 * @version 2017-12-17
 */
@Getter
@Setter
public class DocStationinfo extends DataEntity<DocStationinfo> {
	
	private static final long serialVersionUID = 1L;
	private DocStation docStation;    //搅拌站档案
	private String stationDbType;		// 数据库类型
	private String stationDbName;		// 数据库名称
	private String stationDbIp;		// 数据库ip
	private String stationDbTask;		// 任务数据库路径
	private String stationDbPrescription;		// 配方数据库路径
	private String stationUser;		// 用户名
	private String stationPasswd;		// 密码
	private String prescriptionId;		// 配方主键
	private String taskId;		// 任务主键
	private String prescriptionSql;		// 配方sql
	private String taskSql;		// 工地任务sql
	private String prescriptionSqlErp;		// erp配方sql
	private String taskSqlErp;		// erp任务sql
	private String extField1;		// ext_field1
	private String extField2;		// ext_field2
	private String extField3;		// ext_field3
	private String remark;		// remark
	
	public DocStationinfo() {
		super();
	}

	public DocStationinfo(String id){
		super(id);
	}
	
	@Length(min=1, max=20, message="数据库类型长度必须介于 1 和 20 之间")
	public String getStationDbType() {
		return stationDbType;
	}

	public void setStationDbType(String stationDbType) {
		this.stationDbType = stationDbType;
	}
	
	@Length(min=1, max=20, message="数据库名称长度必须介于 1 和 20 之间")
	public String getStationDbName() {
		return stationDbName;
	}

	public void setStationDbName(String stationDbName) {
		this.stationDbName = stationDbName;
	}
	
	@Length(min=1, max=20, message="数据库ip长度必须介于 1 和 20 之间")
	public String getStationDbIp() {
		return stationDbIp;
	}

	public void setStationDbIp(String stationDbIp) {
		this.stationDbIp = stationDbIp;
	}
	
	@Length(min=0, max=120, message="任务数据库路径长度必须介于 0 和 120 之间")
	public String getStationDbTask() {
		return stationDbTask;
	}

	public void setStationDbTask(String stationDbTask) {
		this.stationDbTask = stationDbTask;
	}
	
	@Length(min=0, max=120, message="配方数据库路径长度必须介于 0 和 120 之间")
	public String getStationDbPrescription() {
		return stationDbPrescription;
	}

	public void setStationDbPrescription(String stationDbPrescription) {
		this.stationDbPrescription = stationDbPrescription;
	}
	
	@Length(min=0, max=50, message="用户名长度必须介于 0 和 50 之间")
	public String getStationUser() {
		return stationUser;
	}

	public void setStationUser(String stationUser) {
		this.stationUser = stationUser;
	}
	
	@Length(min=0, max=50, message="密码长度必须介于 0 和 50 之间")
	public String getStationPasswd() {
		return stationPasswd;
	}

	public void setStationPasswd(String stationPasswd) {
		this.stationPasswd = stationPasswd;
	}
	
	@Length(min=0, max=50, message="配方主键长度必须介于 0 和 50 之间")
	public String getPrescriptionId() {
		return prescriptionId;
	}

	public void setPrescriptionId(String prescriptionId) {
		this.prescriptionId = prescriptionId;
	}
	
	@Length(min=0, max=50, message="任务主键长度必须介于 0 和 50 之间")
	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	
	@Length(min=0, max=120, message="配方sql长度必须介于 0 和 120 之间")
	public String getPrescriptionSql() {
		return prescriptionSql;
	}

	public void setPrescriptionSql(String prescriptionSql) {
		this.prescriptionSql = prescriptionSql;
	}
	
	@Length(min=0, max=120, message="工地任务sql长度必须介于 0 和 120 之间")
	public String getTaskSql() {
		return taskSql;
	}

	public void setTaskSql(String taskSql) {
		this.taskSql = taskSql;
	}
	
	@Length(min=0, max=120, message="erp配方sql长度必须介于 0 和 120 之间")
	public String getPrescriptionSqlErp() {
		return prescriptionSqlErp;
	}

	public void setPrescriptionSqlErp(String prescriptionSqlErp) {
		this.prescriptionSqlErp = prescriptionSqlErp;
	}
	
	@Length(min=0, max=120, message="erp任务sql长度必须介于 0 和 120 之间")
	public String getTaskSqlErp() {
		return taskSqlErp;
	}

	public void setTaskSqlErp(String taskSqlErp) {
		this.taskSqlErp = taskSqlErp;
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
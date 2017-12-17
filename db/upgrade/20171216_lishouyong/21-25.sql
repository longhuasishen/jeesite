drop TABLE if EXISTS  doc_finance_initbalance;
CREATE TABLE `doc_finance_initbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`customer_code` varchar(12) not null comment '客户编码',
  `customer_name` varchar(50) DEFAULT NULL comment '客户名称',
  `project_name` varchar(120) NOT NULL comment '工程名称',
	`customer_short_name` varchar(20) NOT NULL comment '客户简称',
	`debit_balance` varchar(20) not null comment '借方余额', 
	`credit_balance` varchar(120) comment '贷方余额',
  `remark` varchar(1000) DEFAULT NULL COMMENT '摘要',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '财务应收期初余额表';

drop TABLE if EXISTS  doc_business_initbalance;
CREATE TABLE `doc_business_initbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`customer_code` varchar(12) not null comment '客户编码',
  `customer_name` varchar(50) DEFAULT NULL comment '客户名称',
  `project_name` varchar(120) NOT NULL comment '工程名称',
	`customer_short_name` varchar(20) NOT NULL comment '客户简称',
	`debit_balance` varchar(20) not null comment '借方余额', 
	`credit_balance` varchar(120) comment '贷方余额',
  `remark` varchar(1000) DEFAULT NULL COMMENT '摘要',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '业务应收期初余额表';

drop TABLE if EXISTS  doc_business_initpay;
CREATE TABLE `doc_business_initpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`supplier_code` varchar(12) not null comment '供应商编码',
  `supplier_name` varchar(50) DEFAULT NULL comment '供应商名称',
	`debit_balance` varchar(20) not null comment '借方余额', 
	`credit_balance` varchar(120) comment '贷方余额',
  `remark` varchar(1000) DEFAULT NULL COMMENT '摘要',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '业务应付期初余额表';


drop TABLE if EXISTS  doc_finance_initpay;
CREATE TABLE `doc_finance_initpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`supplier_code` varchar(12) not null comment '供应商编码',
  `supplier_name` varchar(50) DEFAULT NULL comment '供应商名称',
	`debit_balance` varchar(20) not null comment '借方余额', 
	`credit_balance` varchar(120) comment '贷方余额',
  `remark` varchar(1000) DEFAULT NULL COMMENT '摘要',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '财务应付期初余额表';

drop TABLE if EXISTS  doc_init_storage_main;
CREATE TABLE `doc_init_storage_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`doc_code` varchar(12) not null comment '单据编号',
  `storage_code` varchar(50) DEFAULT NULL comment '入库单号',
	`storage_date` varchar(20) not null comment '入库日期时间',
	`storage_department` varchar(20) not null comment '入库部门',
	`storage_repertory` varchar(20) not null comment '入库仓库',
	`storage_flag` varchar(1) not null comment '红蓝标志',
	`storage_audit_flag` varchar(1) not null comment '审核状态',
	`storage_type` varchar(20) not null comment '入库类型',
	`storage_create` varchar(20) not null comment '制单人',
	`storage_auditor` varchar(20) not null comment '审核人',
	`storage_handler` varchar(20) not null comment '经手人',
	`storage_create_date` varchar(20) not null comment '制单日期',
	`storage_audit_date` varchar(20) not null comment '审核日期',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '期初入库主表';


drop TABLE if EXISTS  doc_stationinfo;
CREATE TABLE `doc_stationinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`station_code` varchar(12) not null comment '搅拌站编码',
  `station_name` varchar(50) DEFAULT NULL comment '搅拌站名称',
  `station_db_type` varchar(20) NOT NULL comment '数据库类型',
	`station_db_name` varchar(20) NOT NULL comment '数据库名称',
	`station_db_ip` varchar(20) not null comment '数据库ip', 
	`station_db_task` varchar(120) comment '任务数据库路径',
	`station_db_prescription` varchar(120) comment '配方数据库路径',
	`station_user` varchar(50) comment '用户名',
	`station_passwd` varchar(50) comment '密码',
	`prescription_id` varchar(50) comment '配方主键',
	`task_id` varchar(50) comment '任务主键',
	`prescription_sql` varchar(120) comment '配方sql',
	`task_sql` varchar(120) comment '工地任务sql',
	`prescription_sql_erp` varchar(120) comment 'erp配方sql',
	`task_sql_erp` varchar(120) comment 'erp任务sql',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '搅拌站点信息表';


drop table if EXISTS  doc_customer;
CREATE TABLE `doc_customer` (
	`id` bigint NOT NULL AUTO_INCREMENT,
  `cus_code` varchar(16) NOT NULL COMMENT '客户编码',
  `cus_org` varchar(120) DEFAULT NULL COMMENT '建设单位',
  `cus_name` varchar(60) DEFAULT NULL COMMENT '客户名称',
  `cus_project` varchar(120) DEFAULT NULL COMMENT '工程名称',
  `cus_short_name` varchar(60) DEFAULT NULL COMMENT '客户简称',
  `cus_type` varchar(12) DEFAULT NULL COMMENT '客户分类',
  `cus_area` varchar(12) DEFAULT NULL COMMENT '所属地区',
  `cus_industry` varchar(12) DEFAULT NULL COMMENT '所属行业',
  `cus_settle` varchar(120) DEFAULT NULL COMMENT '结算单位',
  `cus_licence` varchar(60) DEFAULT NULL COMMENT '营业执照',
  `cus_taxno` varchar(32) DEFAULT NULL COMMENT '税号',
  `cus_bank` varchar(120) DEFAULT NULL COMMENT '开户银行',
  `cus_account` varchar(60) DEFAULT NULL COMMENT '银行帐号',
  `cus_corporate` varchar(60) DEFAULT NULL COMMENT '法人代表',
  `cus_agent` varchar(60) DEFAULT NULL COMMENT '代理人',
  `cus_corporate_idno` varchar(20) DEFAULT NULL COMMENT '法人代表身份证',
  `cus_agent_idno` varchar(20) DEFAULT NULL COMMENT '代理人身份证',
  `cus_corporate_job` varchar(20) DEFAULT NULL COMMENT '法人代表职务',
  `cus_agent_job` varchar(20) DEFAULT NULL COMMENT '代理人职务',
  `cus_corporate_mobile` varchar(20) DEFAULT NULL COMMENT '法人代表电话',
  `cus_agent_mobile` varchar(20) DEFAULT NULL COMMENT '代理人电话',
  `cus_post_code` varchar(12) DEFAULT NULL COMMENT '邮政编码',
  `cus_contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `cus_email` varchar(60) DEFAULT NULL COMMENT '联系邮箱',
  `cus_address` varchar(60) DEFAULT NULL COMMENT '联系地址',
  `cus_salesman` varchar(12) DEFAULT NULL COMMENT '专管业务员',
  `cus_credit_rate` varchar(12) DEFAULT NULL COMMENT '信用等级',
  `cus_credit_limit` varchar(12) DEFAULT NULL COMMENT '信用额度',
  `cus_credit_days` varchar(12) DEFAULT NULL COMMENT '信用天数',
  `cus_signer` varchar(12) DEFAULT NULL COMMENT '指定签收人',
  `cus_project_state` varchar(20) DEFAULT NULL COMMENT '工程状态',
	`cus_up_date` varchar(20) DEFAULT NULL COMMENT '封顶日期',
	`is_sale_cus` varchar(1) DEFAULT NULL COMMENT '是否零售客户',
	`is_repay_cus` varchar(1) DEFAULT NULL COMMENT '是否预付款客户',
	`is_stop_trans` varchar(1) DEFAULT NULL COMMENT '是否停止交易',
	`is_cus_code` varchar(1) DEFAULT NULL COMMENT '是否客户编码',
	`ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field12',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '客户档案表';

drop table if EXISTS  doc_supplier;
CREATE TABLE `doc_supplier` (
	`id` bigint NOT NULL AUTO_INCREMENT,
  `sup_code` varchar(16) NOT NULL COMMENT '供应商编码',
  `sup_name` varchar(60) DEFAULT NULL COMMENT '供应商名称',
  `sup_short_name` varchar(60) DEFAULT NULL COMMENT '供应商简称',
  `sup_type` varchar(12) DEFAULT NULL COMMENT '供应商分类',
  `sup_area` varchar(12) DEFAULT NULL COMMENT '所属地区',
  `sup_industry` varchar(12) DEFAULT NULL COMMENT '所属行业',
  `sup_settle` varchar(120) DEFAULT NULL COMMENT '结算单位',
  `sup_licence` varchar(60) DEFAULT NULL COMMENT '营业执照',
  `sup_taxno` varchar(32) DEFAULT NULL COMMENT '税号',
  `sup_bank` varchar(120) DEFAULT NULL COMMENT '开户银行',
  `sup_account` varchar(60) DEFAULT NULL COMMENT '银行帐号',
  `sup_corporate` varchar(60) DEFAULT NULL COMMENT '法人代表',
  `sup_agent` varchar(60) DEFAULT NULL COMMENT '代理人',
  `sup_corporate_idno` varchar(20) DEFAULT NULL COMMENT '法人代表身份证',
  `sup_agent_idno` varchar(20) DEFAULT NULL COMMENT '代理人身份证',
  `sup_corporate_job` varchar(20) DEFAULT NULL COMMENT '法人代表职务',
  `sup_agent_job` varchar(20) DEFAULT NULL COMMENT '代理人职务',
  `sup_corporate_mobile` varchar(20) DEFAULT NULL COMMENT '法人代表电话',
  `sup_agent_mobile` varchar(20) DEFAULT NULL COMMENT '代理人电话',
  `sup_post_code` varchar(12) DEFAULT NULL COMMENT '邮政编码',
  `sup_contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `sup_email` varchar(60) DEFAULT NULL COMMENT '联系邮箱',
  `sup_address` varchar(60) DEFAULT NULL COMMENT '联系地址',
  `sup_salesman` varchar(12) DEFAULT NULL COMMENT '专管业务员',
  `sup_project_state` varchar(20) DEFAULT NULL COMMENT '工程状态',
	`is_stop_trans` varchar(1) DEFAULT NULL COMMENT '是否停止交易',
	`ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field12',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '供应商档案表';


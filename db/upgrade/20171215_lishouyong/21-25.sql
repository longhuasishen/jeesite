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

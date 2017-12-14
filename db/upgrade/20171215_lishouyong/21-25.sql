drop TABLE if EXISTS  doc_finance_initbalance;
CREATE TABLE `doc_finance_initbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`customer_code` varchar(12) not null comment '�ͻ�����',
  `customer_name` varchar(50) DEFAULT NULL comment '�ͻ�����',
  `project_name` varchar(120) NOT NULL comment '��������',
	`customer_short_name` varchar(20) NOT NULL comment '�ͻ����',
	`debit_balance` varchar(20) not null comment '�跽���', 
	`credit_balance` varchar(120) comment '�������',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'ժҪ',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '����Ӧ���ڳ�����';

drop TABLE if EXISTS  doc_business_initbalance;
CREATE TABLE `doc_business_initbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`customer_code` varchar(12) not null comment '�ͻ�����',
  `customer_name` varchar(50) DEFAULT NULL comment '�ͻ�����',
  `project_name` varchar(120) NOT NULL comment '��������',
	`customer_short_name` varchar(20) NOT NULL comment '�ͻ����',
	`debit_balance` varchar(20) not null comment '�跽���', 
	`credit_balance` varchar(120) comment '�������',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'ժҪ',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment 'ҵ��Ӧ���ڳ�����';

drop TABLE if EXISTS  doc_business_initpay;
CREATE TABLE `doc_business_initpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`supplier_code` varchar(12) not null comment '��Ӧ�̱���',
  `supplier_name` varchar(50) DEFAULT NULL comment '��Ӧ������',
	`debit_balance` varchar(20) not null comment '�跽���', 
	`credit_balance` varchar(120) comment '�������',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'ժҪ',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment 'ҵ��Ӧ���ڳ�����';


drop TABLE if EXISTS  doc_finance_initpay;
CREATE TABLE `doc_finance_initpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`supplier_code` varchar(12) not null comment '��Ӧ�̱���',
  `supplier_name` varchar(50) DEFAULT NULL comment '��Ӧ������',
	`debit_balance` varchar(20) not null comment '�跽���', 
	`credit_balance` varchar(120) comment '�������',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'ժҪ',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '����Ӧ���ڳ�����';

drop TABLE if EXISTS  doc_init_storage_main;
CREATE TABLE `doc_init_storage_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`doc_code` varchar(12) not null comment '���ݱ��',
  `storage_code` varchar(50) DEFAULT NULL comment '��ⵥ��',
	`storage_date` varchar(20) not null comment '�������ʱ��',
	`storage_department` varchar(20) not null comment '��ⲿ��',
	`storage_repertory` varchar(20) not null comment '���ֿ�',
	`storage_flag` varchar(1) not null comment '������־',
	`storage_audit_flag` varchar(1) not null comment '���״̬',
	`storage_type` varchar(20) not null comment '�������',
	`storage_create` varchar(20) not null comment '�Ƶ���',
	`storage_auditor` varchar(20) not null comment '�����',
	`storage_handler` varchar(20) not null comment '������',
	`storage_create_date` varchar(20) not null comment '�Ƶ�����',
	`storage_audit_date` varchar(20) not null comment '�������',
  `remark` varchar(1000) DEFAULT NULL COMMENT '��ע',	
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '�ڳ��������';


drop TABLE if EXISTS  doc_stationinfo;
CREATE TABLE `doc_stationinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`station_code` varchar(12) not null comment '����վ����',
  `station_name` varchar(50) DEFAULT NULL comment '����վ����',
  `station_db_type` varchar(20) NOT NULL comment '���ݿ�����',
	`station_db_name` varchar(20) NOT NULL comment '���ݿ�����',
	`station_db_ip` varchar(20) not null comment '���ݿ�ip', 
	`station_db_task` varchar(120) comment '�������ݿ�·��',
	`station_db_prescription` varchar(120) comment '�䷽���ݿ�·��',
	`station_user` varchar(50) comment '�û���',
	`station_passwd` varchar(50) comment '����',
	`prescription_id` varchar(50) comment '�䷽����',
	`task_id` varchar(50) comment '��������',
	`prescription_sql` varchar(120) comment '�䷽sql',
	`task_sql` varchar(120) comment '��������sql',
	`prescription_sql_erp` varchar(120) comment 'erp�䷽sql',
	`task_sql_erp` varchar(120) comment 'erp����sql',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '����վ����Ϣ��';

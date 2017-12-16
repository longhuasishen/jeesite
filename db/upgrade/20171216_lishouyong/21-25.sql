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


drop table if EXISTS  doc_customer;
CREATE TABLE `doc_customer` (
	`id` bigint NOT NULL AUTO_INCREMENT,
  `cus_code` varchar(16) NOT NULL COMMENT '�ͻ�����',
  `cus_org` varchar(120) DEFAULT NULL COMMENT '���赥λ',
  `cus_name` varchar(60) DEFAULT NULL COMMENT '�ͻ�����',
  `cus_project` varchar(120) DEFAULT NULL COMMENT '��������',
  `cus_short_name` varchar(60) DEFAULT NULL COMMENT '�ͻ����',
  `cus_type` varchar(12) DEFAULT NULL COMMENT '�ͻ�����',
  `cus_area` varchar(12) DEFAULT NULL COMMENT '��������',
  `cus_industry` varchar(12) DEFAULT NULL COMMENT '������ҵ',
  `cus_settle` varchar(120) DEFAULT NULL COMMENT '���㵥λ',
  `cus_licence` varchar(60) DEFAULT NULL COMMENT 'Ӫҵִ��',
  `cus_taxno` varchar(32) DEFAULT NULL COMMENT '˰��',
  `cus_bank` varchar(120) DEFAULT NULL COMMENT '��������',
  `cus_account` varchar(60) DEFAULT NULL COMMENT '�����ʺ�',
  `cus_corporate` varchar(60) DEFAULT NULL COMMENT '���˴���',
  `cus_agent` varchar(60) DEFAULT NULL COMMENT '������',
  `cus_corporate_idno` varchar(20) DEFAULT NULL COMMENT '���˴������֤',
  `cus_agent_idno` varchar(20) DEFAULT NULL COMMENT '���������֤',
  `cus_corporate_job` varchar(20) DEFAULT NULL COMMENT '���˴���ְ��',
  `cus_agent_job` varchar(20) DEFAULT NULL COMMENT '������ְ��',
  `cus_corporate_mobile` varchar(20) DEFAULT NULL COMMENT '���˴���绰',
  `cus_agent_mobile` varchar(20) DEFAULT NULL COMMENT '�����˵绰',
  `cus_post_code` varchar(12) DEFAULT NULL COMMENT '��������',
  `cus_contact` varchar(20) DEFAULT NULL COMMENT '��ϵ��',
  `cus_email` varchar(60) DEFAULT NULL COMMENT '��ϵ����',
  `cus_address` varchar(60) DEFAULT NULL COMMENT '��ϵ��ַ',
  `cus_salesman` varchar(12) DEFAULT NULL COMMENT 'ר��ҵ��Ա',
  `cus_credit_rate` varchar(12) DEFAULT NULL COMMENT '���õȼ�',
  `cus_credit_limit` varchar(12) DEFAULT NULL COMMENT '���ö��',
  `cus_credit_days` varchar(12) DEFAULT NULL COMMENT '��������',
  `cus_signer` varchar(12) DEFAULT NULL COMMENT 'ָ��ǩ����',
  `cus_project_state` varchar(20) DEFAULT NULL COMMENT '����״̬',
	`cus_up_date` varchar(20) DEFAULT NULL COMMENT '�ⶥ����',
	`is_sale_cus` varchar(1) DEFAULT NULL COMMENT '�Ƿ����ۿͻ�',
	`is_repay_cus` varchar(1) DEFAULT NULL COMMENT '�Ƿ�Ԥ����ͻ�',
	`is_stop_trans` varchar(1) DEFAULT NULL COMMENT '�Ƿ�ֹͣ����',
	`is_cus_code` varchar(1) DEFAULT NULL COMMENT '�Ƿ�ͻ�����',
	`ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field12',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '�ͻ�������';

drop table if EXISTS  doc_supplier;
CREATE TABLE `doc_supplier` (
	`id` bigint NOT NULL AUTO_INCREMENT,
  `sup_code` varchar(16) NOT NULL COMMENT '��Ӧ�̱���',
  `sup_name` varchar(60) DEFAULT NULL COMMENT '��Ӧ������',
  `sup_short_name` varchar(60) DEFAULT NULL COMMENT '��Ӧ�̼��',
  `sup_type` varchar(12) DEFAULT NULL COMMENT '��Ӧ�̷���',
  `sup_area` varchar(12) DEFAULT NULL COMMENT '��������',
  `sup_industry` varchar(12) DEFAULT NULL COMMENT '������ҵ',
  `sup_settle` varchar(120) DEFAULT NULL COMMENT '���㵥λ',
  `sup_licence` varchar(60) DEFAULT NULL COMMENT 'Ӫҵִ��',
  `sup_taxno` varchar(32) DEFAULT NULL COMMENT '˰��',
  `sup_bank` varchar(120) DEFAULT NULL COMMENT '��������',
  `sup_account` varchar(60) DEFAULT NULL COMMENT '�����ʺ�',
  `sup_corporate` varchar(60) DEFAULT NULL COMMENT '���˴���',
  `sup_agent` varchar(60) DEFAULT NULL COMMENT '������',
  `sup_corporate_idno` varchar(20) DEFAULT NULL COMMENT '���˴������֤',
  `sup_agent_idno` varchar(20) DEFAULT NULL COMMENT '���������֤',
  `sup_corporate_job` varchar(20) DEFAULT NULL COMMENT '���˴���ְ��',
  `sup_agent_job` varchar(20) DEFAULT NULL COMMENT '������ְ��',
  `sup_corporate_mobile` varchar(20) DEFAULT NULL COMMENT '���˴���绰',
  `sup_agent_mobile` varchar(20) DEFAULT NULL COMMENT '�����˵绰',
  `sup_post_code` varchar(12) DEFAULT NULL COMMENT '��������',
  `sup_contact` varchar(20) DEFAULT NULL COMMENT '��ϵ��',
  `sup_email` varchar(60) DEFAULT NULL COMMENT '��ϵ����',
  `sup_address` varchar(60) DEFAULT NULL COMMENT '��ϵ��ַ',
  `sup_salesman` varchar(12) DEFAULT NULL COMMENT 'ר��ҵ��Ա',
  `sup_project_state` varchar(20) DEFAULT NULL COMMENT '����״̬',
	`is_stop_trans` varchar(1) DEFAULT NULL COMMENT '�Ƿ�ֹͣ����',
	`ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field12',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '��Ӧ�̵�����';


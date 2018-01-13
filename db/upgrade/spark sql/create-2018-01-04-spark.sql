/* 工程运距管理 */
DROP TABLE IF EXISTS `project_distance`;
CREATE TABLE `project_distance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(20) NOT NULL COMMENT '客户编码',
  `custom_name` varchar(120) DEFAULT NULL COMMENT '客户名称',
  `custom_abbr` varchar(120) DEFAULT NULL COMMENT '客户简称',
  `custom_addr` varchar(240) DEFAULT NULL COMMENT '客户地址',
  `receiver` varchar(60) DEFAULT NULL COMMENT '指定签收人',
  `distance` varchar(60) DEFAULT NULL COMMENT '距离',
  `distance_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '工程运距管理';


/* 生产计划单 */
DROP TABLE IF EXISTS `produce_design`;
CREATE TABLE `produce_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_no` varchar(32) NOT NULL COMMENT '通知单号',
  `goods_date` varchar(20) DEFAULT NULL COMMENT '要货日期',
  `first_date` varchar(20) DEFAULT NULL COMMENT '首次送达时间',
  `custom_name` varchar(60) DEFAULT NULL COMMENT '客户名称',
  `build_unit` varchar(120) DEFAULT NULL COMMENT '建设单位',
  `receive_unit` varchar(120) DEFAULT NULL COMMENT '收货单位',
  `goods_count` varchar(20) DEFAULT NULL COMMENT '要货数量',
  `task_count` varchar(20) DEFAULT NULL COMMENT '计划数量',
  `hetong_accmeth` varchar(60) DEFAULT NULL COMMENT '合同结算方式',
  `kind_name` varchar(60) DEFAULT NULL COMMENT '品种名称',
  `build_site` varchar(30) DEFAULT NULL COMMENT '施工部位',
  `water_meth` varchar(60) DEFAULT NULL COMMENT '浇灌方法',
  `locale_dispatch` varchar(60) DEFAULT NULL COMMENT '现场调度',
  `beng_name` varchar(20) DEFAULT NULL COMMENT '泵名称',
  `distance` varchar(60) DEFAULT NULL COMMENT '运距',
  `project_addr` varchar(240) DEFAULT NULL COMMENT '工程地址',
  `contact` varchar(60) DEFAULT NULL COMMENT '联系人',
  `special_require` varchar(11) DEFAULT NULL COMMENT '特殊要求',
  `concrete_name` varchar(60) DEFAULT NULL COMMENT '混凝土名称',
  `produce_dispatch` varchar(60) DEFAULT NULL COMMENT '生产调度',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `cancle_person` varchar(60) DEFAULT NULL COMMENT '作废人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `cancel_date` varchar(20) DEFAULT NULL COMMENT '作废日期',
  `salesman` varchar(60) DEFAULT NULL COMMENT '业务员',
  `slumps` varchar(60) DEFAULT NULL COMMENT '坍落度',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `notice_flag` varchar(11) DEFAULT NULL COMMENT '生产通知单标志',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '生产计划单';


/* 业务应付调帐单 */
DROP TABLE IF EXISTS `busipay_bill`;
CREATE TABLE `busipay_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(20) NOT NULL COMMENT '单据编号',
  `bill_date` varchar(120) DEFAULT NULL COMMENT '调帐日期',
  `bill_supplier` varchar(120) DEFAULT NULL COMMENT '供应商名称',
  `bill_direction` varchar(1) DEFAULT NULL COMMENT '调账方向',
  `bill_amt` varchar(30) DEFAULT NULL COMMENT '调帐金额',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `bill_status` varchar(2) DEFAULT NULL COMMENT '状态',
  `busi_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '业务应付调帐单';

/* 业务应收调帐单 */
DROP TABLE IF EXISTS `busipae_bill`;
CREATE TABLE `busipae_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(20) NOT NULL COMMENT '单据编号',
  `bill_date` varchar(120) DEFAULT NULL COMMENT '调帐日期',
  `custom_name` varchar(120) DEFAULT NULL COMMENT '客户名称',
  `custom_abbr` varchar(120) DEFAULT NULL COMMENT '客户简称',
  `project_name` varchar(120) DEFAULT NULL COMMENT '工程名称',
  `bill_direction` varchar(1) DEFAULT NULL COMMENT '调账方向',
  `bill_amt` varchar(30) DEFAULT NULL COMMENT '调帐金额',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `bill_status` varchar(2) DEFAULT NULL COMMENT '状态',
  `busi_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '业务应收调帐单';

/* 财务应付调帐单 */
DROP TABLE IF EXISTS `finpay_bill`;
CREATE TABLE `finpay_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(20) NOT NULL COMMENT '单据编号',
  `bill_date` varchar(120) DEFAULT NULL COMMENT '调帐日期',
  `bill_supplier` varchar(120) DEFAULT NULL COMMENT '供应商名称',
  `bill_direction` varchar(1) DEFAULT NULL COMMENT '调账方向',
  `bill_amt` varchar(30) DEFAULT NULL COMMENT '调帐金额',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `bill_status` varchar(2) DEFAULT NULL COMMENT '状态',
  `fin_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '财务应付调帐单';

/* 财务应收调帐单 */
DROP TABLE IF EXISTS `finpae_bill`;
CREATE TABLE `finpae_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(20) NOT NULL COMMENT '单据编号',
  `bill_date` varchar(120) DEFAULT NULL COMMENT '调帐日期',
  `custom_name` varchar(120) DEFAULT NULL COMMENT '客户名称',
  `custom_abbr` varchar(120) DEFAULT NULL COMMENT '客户简称',
  `project_name` varchar(120) DEFAULT NULL COMMENT '工程名称',
  `bill_direction` varchar(1) DEFAULT NULL COMMENT '调账方向',
  `bill_amt` varchar(30) DEFAULT NULL COMMENT '调帐金额',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `bill_status` varchar(2) DEFAULT NULL COMMENT '状态',
  `fin_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '财务应收调帐单';


/* 发货单 */
DROP TABLE IF EXISTS `goods_bill`;
CREATE TABLE `goods_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_no` varchar(32) NOT NULL COMMENT '发货单号',
  `out_date` varchar(20) DEFAULT NULL COMMENT '出库日期',
  `contract_no` varchar(20) DEFAULT NULL COMMENT '合同编号',
  `custom_name` varchar(60) DEFAULT NULL COMMENT '客户名称',
  `project_name` varchar(120) DEFAULT NULL COMMENT '工程名称',
  `car_count` varchar(15) DEFAULT NULL COMMENT '运输车次',
  `goods_addr` varchar(240) DEFAULT NULL COMMENT '交货地点',
  `build_site` varchar(120) DEFAULT NULL COMMENT '施工部位',
  `notice_no` varchar(20) DEFAULT NULL COMMENT '生产通知单',
  `strength_grade` varchar(20) DEFAULT NULL COMMENT '强度等级',
  `goods_name` varchar(60) DEFAULT NULL COMMENT '商品名称',
  `water_meth` varchar(20) DEFAULT NULL COMMENT '浇灌方法',
  `slumps_start` varchar(10) DEFAULT NULL COMMENT '起始坍落度',
  `slumps_end` varchar(10) DEFAULT NULL COMMENT '终止坍落度',
  `custom_no` varchar(60) DEFAULT NULL COMMENT '客户编码',
  `with_station` varchar(60) DEFAULT NULL COMMENT '搅拌站',
  `special_material` varchar(120) DEFAULT NULL COMMENT '特种材料',
  `repertory_name` varchar(30) DEFAULT NULL COMMENT '仓库名称',
  `curcar_count` varchar(15) DEFAULT NULL COMMENT '本车数量',
  `mortar__count` varchar(15) DEFAULT NULL COMMENT '砂浆数量',
  `about_num` varchar(15) DEFAULT NULL COMMENT '同标号数量',
  `goods_driver` varchar(60) DEFAULT NULL COMMENT '司机',
  `car_no` varchar(15) DEFAULT NULL COMMENT '运输车号',
  `goods_increment` varchar(15) DEFAULT NULL COMMENT '增量',
  `depart_time` varchar(20) DEFAULT NULL COMMENT '发车时间',
  `reach_time` varchar(20) DEFAULT NULL COMMENT '到达时间',
  `unload_time` varchar(20) DEFAULT NULL COMMENT '卸料时间',
  `depart_person` varchar(60) DEFAULT NULL COMMENT '发货人',
  `quality_person` varchar(60) DEFAULT NULL COMMENT '质检员',
  `goods_clerk` varchar(60) DEFAULT NULL COMMENT '收货人',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `check_status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `total_cars` varchar(10) DEFAULT NULL COMMENT '累计车数',
  `total_cube` varchar(10) DEFAULT NULL COMMENT '累计方量',
  `goods_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `except_handle` varchar(1000) DEFAULT NULL COMMENT '异常料处理',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '发货单';

/* 合同应收 */
DROP TABLE IF EXISTS `contract_receivable`;
CREATE TABLE `contract_receivable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(20) NOT NULL COMMENT '单据编号',
  `bill_date` varchar(20) DEFAULT NULL COMMENT '应收款日期',
  `custom_abbr` varchar(60) DEFAULT NULL COMMENT '客户简称',
  `month_amount` varchar(20) DEFAULT NULL COMMENT '本月应收总额',
  `contract_amount` varchar(20) DEFAULT NULL COMMENT '合同应收金额',
  `check_status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `contract_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '合同应收';

/* 销售发票 */
DROP TABLE IF EXISTS `sales_invoice`;
CREATE TABLE `sales_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(32) NOT NULL COMMENT '发票号码',
  `invoice_date` varchar(20) DEFAULT NULL COMMENT '发票日期',
  `custom_abbr` varchar(60) DEFAULT NULL COMMENT '客户简称',
  `tax_num` varchar(32) DEFAULT NULL COMMENT '税号',
  `custom_acc` varchar(32) DEFAULT NULL COMMENT '客户账号',
  `bank_name` varchar(60) DEFAULT NULL COMMENT '银行名称',
  `custom_phone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `custom_addr` varchar(120) DEFAULT NULL COMMENT '地址',
  `check_status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `invoice_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '销售发票';


/* 收款单 */
DROP TABLE IF EXISTS `income_bill`;
CREATE TABLE `income_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(20) NOT NULL COMMENT '单据编号',
  `bill_date` varchar(20) DEFAULT NULL COMMENT '收款日期',
  `custom_name` varchar(60) DEFAULT NULL COMMENT '客户名称',
  `project_name` varchar(120) DEFAULT NULL COMMENT '工程名称',
  `pay_way` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `income_amount` varchar(20) DEFAULT NULL COMMENT '收款金额',
  `with_no` varchar(32) DEFAULT NULL COMMENT '付款单主表单据编号',
  `bank_name` varchar(60) DEFAULT NULL COMMENT '开户银行',
  `bank_acc` varchar(32) DEFAULT NULL COMMENT '银行帐号',
  `check_status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `income_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '收款单';


/* 形态转换 */
DROP TABLE IF EXISTS `inverse_kind`;
CREATE TABLE `inverse_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inverse_date` varchar(20) NOT NULL COMMENT '转换日期',
  `repo_name` varchar(60) DEFAULT NULL COMMENT '仓库名称',
  `orgi_name` varchar(60) DEFAULT NULL COMMENT '原品种名称',
  `orgi_no` varchar(32) DEFAULT NULL COMMENT '原出厂编号',
  `inverse_num` varchar(10) DEFAULT NULL COMMENT '转换数量',
  `orgi_price` varchar(15) DEFAULT NULL COMMENT '原单价',
  `orgi_amount` varchar(15) DEFAULT NULL COMMENT '原金额',
  `new_name` varchar(60) DEFAULT NULL COMMENT '新品种名称',
  `new_no` varchar(32) DEFAULT NULL COMMENT '新出厂编号',
  `new_num` varchar(10) DEFAULT NULL COMMENT '新数量',
  `new_price` varchar(15) DEFAULT NULL COMMENT '新单价',
  `new_amount` varchar(15) DEFAULT NULL COMMENT '新金额',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `check_status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `check_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '形态转换';


/* 外购加油登记 */
DROP TABLE IF EXISTS `outsource_oiling`;
CREATE TABLE `outsource_oiling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oiling_date` varchar(20) NOT NULL COMMENT '日期',
  `sample_name` varchar(60) DEFAULT NULL COMMENT '样品名称',
  `supplier_name` varchar(120) DEFAULT NULL COMMENT '供应商名称',
  `oiling_count` varchar(10) DEFAULT NULL COMMENT '数量',
  `oiling_price` varchar(15) DEFAULT NULL COMMENT '单价',
  `oiling_amount` varchar(15) DEFAULT NULL COMMENT '金额',
  `oiling_person` varchar(60) DEFAULT NULL COMMENT '结算人',
  `car_no` varchar(32) DEFAULT NULL COMMENT '车号',
  `oiling_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `check_status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '外购加油登记';

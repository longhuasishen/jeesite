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

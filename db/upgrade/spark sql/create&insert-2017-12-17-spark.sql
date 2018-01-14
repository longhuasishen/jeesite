-----------------------------------------------------------2017年12月14日------------------------------------------------------------------


/* 搅拌站档案 */
DROP TABLE IF EXISTS `doc_station`;
CREATE TABLE `doc_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_code` varchar(16) NOT NULL COMMENT '搅拌站编码',
  `station_name` varchar(120) DEFAULT NULL COMMENT '搅拌站名称',
  `repertory_name` varchar(120) DEFAULT NULL COMMENT '仓库名称',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



/* 部门档案 */
DROP TABLE IF EXISTS `doc_department`;
CREATE TABLE `doc_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_code` varchar(16) NOT NULL COMMENT '部门编码',
  `department_name` varchar(120) DEFAULT NULL COMMENT '部门名称',
  `department_category` varchar(60) DEFAULT NULL COMMENT '所属分类',
  `manager_person` varchar(60) DEFAULT NULL COMMENT '负责人',
  `phone_no` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `first_unit` varchar(60) DEFAULT NULL COMMENT '地址',
  `comment` varchar(120) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-----------------------------------------------------------2017年12月15日------------------------------------------------------------------

/* 司机档案 */
DROP TABLE IF EXISTS `doc_driver`;
CREATE TABLE `doc_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_code` varchar(16) NOT NULL COMMENT '司机编码',
  `driver_name` varchar(120) DEFAULT NULL COMMENT '司机名称',
  `car_no` varchar(60) DEFAULT NULL COMMENT '车牌号码',
  `licence_no` varchar(60) DEFAULT NULL COMMENT '驾驶证号码',
  `comment` varchar(120) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



/* 泵档案 */
DROP TABLE IF EXISTS `doc_pump`;
CREATE TABLE `doc_pump` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pump_code` varchar(16) NOT NULL COMMENT '泵编码',
  `pump_name` varchar(120) DEFAULT NULL COMMENT '泵名称',
  `comment` varchar(12) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/* 浇灌方式档案 */
DROP TABLE IF EXISTS `doc_watermeth`;
CREATE TABLE `doc_watermeth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watermeth_code` varchar(16) NOT NULL COMMENT '浇灌方式编码',
  `watermeth_name` varchar(120) DEFAULT NULL COMMENT '浇灌方法名称',
  `comment` varchar(120) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/* 结算方式档案 */
DROP TABLE IF EXISTS `doc_accmeth`;
CREATE TABLE `doc_accmeth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accmeth_code` varchar(16) NOT NULL COMMENT '结算方式编码',
  `accmeth_name` varchar(120) DEFAULT NULL COMMENT '结算方式名称',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



/* 支付方式档案 */
DROP TABLE IF EXISTS `doc_paymeth`;
CREATE TABLE `doc_paymeth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymeth_code` varchar(16) NOT NULL COMMENT '支付方式编码',
  `paymeth_name` varchar(120) DEFAULT NULL COMMENT '支付方式名称',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



/* 原材料类型档案 */
DROP TABLE IF EXISTS `doc_concretetyp`;
CREATE TABLE `doc_concretetyp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concretetyp_code` varchar(16) NOT NULL COMMENT '原材料编码',
  `concretetyp_name` varchar(120) DEFAULT NULL COMMENT '原材料名称',
  `stock_name` varchar(60) DEFAULT NULL COMMENT '存货名称',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



/* 特殊要求档案 */
DROP TABLE IF EXISTS `doc_specialreq`;
CREATE TABLE `doc_specialreq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialreq_code` varchar(16) NOT NULL COMMENT '特殊要求编码',
  `specialreq_name` varchar(120) DEFAULT NULL COMMENT '特殊要求名称',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/* 仓库档案 */
DROP TABLE IF EXISTS `doc_repertory`;
CREATE TABLE `doc_repertory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repertory_code` varchar(16) NOT NULL COMMENT '仓库编码',
  `repertory_name` varchar(120) DEFAULT NULL COMMENT '仓库名称',
  `kind_category` varchar(60) DEFAULT NULL COMMENT '所属分类',
  `repertory_department` varchar(240) DEFAULT NULL COMMENT '所属部门',
  `manager_person` varchar(60) DEFAULT NULL COMMENT '负责人',
  `phone_no` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `max_stock` varchar(20) DEFAULT NULL COMMENT '最高库存',
  `pricing_method` varchar(20) DEFAULT NULL COMMENT '计价方式',
  `repertory_addr` varchar(120) DEFAULT NULL COMMENT '地址',
  `repertory_station` varchar(120) DEFAULT NULL COMMENT '搅拌站',
  `comment` varchar(120) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-----------------------------------------------------------2017年12月15日2------------------------------------------------------------------


/* 混泥土档案 */
DROP TABLE IF EXISTS `doc_beton`;
CREATE TABLE `doc_beton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_code` varchar(16) NOT NULL COMMENT '品种编码',
  `kind_name` varchar(120) DEFAULT NULL COMMENT '品种名称',
  `kind_level` varchar(60) DEFAULT NULL COMMENT '材质等级',
  `stand_name` varchar(120) DEFAULT NULL COMMENT '标准名称',
  `kind_category` varchar(60) DEFAULT NULL COMMENT '所属分类',
  `kind_type` varchar(60) DEFAULT NULL COMMENT '原材料类型',
  `sec_unit` varchar(20) DEFAULT NULL COMMENT '辅记量单位',
  `first_unit` varchar(60) DEFAULT NULL COMMENT '主记量单位',
  `rate` varchar(12) DEFAULT NULL COMMENT '换算率',
  `primary_provider` varchar(240) DEFAULT NULL COMMENT '主要供应商',
  `pricing_mode` varchar(32) DEFAULT NULL COMMENT '计价方式',
  `brand_name` varchar(120) DEFAULT NULL COMMENT '品牌名称',
  `sales` varchar(1) DEFAULT NULL COMMENT '销售',
  `outsourcing` varchar(1) DEFAULT NULL COMMENT '外购',
  `mad_self` varchar(1) DEFAULT NULL COMMENT '自制',
  `tax_service` varchar(1) DEFAULT NULL COMMENT '应税劳务',
  `comp_set` varchar(1) DEFAULT NULL COMMENT '成套件',
  `mortar` varchar(1) DEFAULT NULL COMMENT '砂浆',
  `min_inventory` varchar(1) DEFAULT NULL COMMENT '最低库存',
  `cost_prices` varchar(1) DEFAULT NULL COMMENT '成本参考核算单价',
  `max_inventory` varchar(1) DEFAULT NULL COMMENT '最高存库',
  `sum_control` varchar(1) DEFAULT NULL COMMENT '配方上下限控制',
  `save_inventory` varchar(1) DEFAULT NULL COMMENT '安全库存',
  `stock_stand` varchar(1) DEFAULT NULL COMMENT '积压标准',
  `abc_category` varchar(1) DEFAULT NULL COMMENT 'ABC分类',
  `tax_rate` varchar(1) DEFAULT NULL COMMENT '税率',
  `quality_manage` varchar(1) DEFAULT NULL COMMENT '保质期管理',
  `bat_manage` varchar(1) DEFAULT NULL COMMENT '批次管理',
  `entrust_manage` varchar(1) DEFAULT NULL COMMENT '委托代锁管理',
  `stock_manage` varchar(1) DEFAULT NULL COMMENT '呆滞积压管理',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/* 普通物资档案 */
DROP TABLE IF EXISTS `doc_normaterial`;
CREATE TABLE `doc_normaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_code` varchar(16) NOT NULL COMMENT '品种编码',
  `kind_name` varchar(120) DEFAULT NULL COMMENT '品种名称',
  `kind_level` varchar(60) DEFAULT NULL COMMENT '材质等级',
  `stand_name` varchar(120) DEFAULT NULL COMMENT '标准名称',
  `kind_category` varchar(60) DEFAULT NULL COMMENT '所属分类',
  `kind_type` varchar(60) DEFAULT NULL COMMENT '原材料类型',
  `sec_unit` varchar(20) DEFAULT NULL COMMENT '辅记量单位',
  `first_unit` varchar(60) DEFAULT NULL COMMENT '主记量单位',
  `rate` varchar(12) DEFAULT NULL COMMENT '换算率',
  `primary_provider` varchar(240) DEFAULT NULL COMMENT '主要供应商',
  `pricing_mode` varchar(32) DEFAULT NULL COMMENT '计价方式',
  `brand_name` varchar(120) DEFAULT NULL COMMENT '品牌名称',
  `sales` varchar(1) DEFAULT NULL COMMENT '销售',
  `outsourcing` varchar(1) DEFAULT NULL COMMENT '外购',
  `mad_self` varchar(1) DEFAULT NULL COMMENT '自制',
  `tax_service` varchar(1) DEFAULT NULL COMMENT '应税劳务',
  `comp_set` varchar(1) DEFAULT NULL COMMENT '成套件',
  `mortar` varchar(1) DEFAULT NULL COMMENT '砂浆',
  `min_inventory` varchar(1) DEFAULT NULL COMMENT '最低库存',
  `cost_prices` varchar(1) DEFAULT NULL COMMENT '成本参考核算单价',
  `max_inventory` varchar(1) DEFAULT NULL COMMENT '最高存库',
  `sum_control` varchar(1) DEFAULT NULL COMMENT '配方上下限控制',
  `save_inventory` varchar(1) DEFAULT NULL COMMENT '安全库存',
  `stock_stand` varchar(1) DEFAULT NULL COMMENT '积压标准',
  `abc_category` varchar(1) DEFAULT NULL COMMENT 'ABC分类',
  `tax_rate` varchar(1) DEFAULT NULL COMMENT '税率',
  `quality_manage` varchar(1) DEFAULT NULL COMMENT '保质期管理',
  `bat_manage` varchar(1) DEFAULT NULL COMMENT '批次管理',
  `entrust_manage` varchar(1) DEFAULT NULL COMMENT '委托代锁管理',
  `stock_manage` varchar(1) DEFAULT NULL COMMENT '呆滞积压管理',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/* 职员档案 */
DROP TABLE IF EXISTS `doc_officework`;
CREATE TABLE `doc_officework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officework_code` varchar(16) NOT NULL COMMENT '职员编码',
  `officework_name` varchar(120) DEFAULT NULL COMMENT '职员名称',
  `officework_dep` varchar(60) DEFAULT NULL COMMENT '所属部门',
  `officework_post` varchar(20) DEFAULT NULL COMMENT '职务',
  `officework_edu` varchar(10) DEFAULT NULL COMMENT '最高学历',
  `officework_marry` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `officework_pol` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `officework_sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `officework_phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `officework_birth` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `officework_idcard` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `join_date` varchar(20) DEFAULT NULL COMMENT '入司日期',
  `doc_site` varchar(120) DEFAULT NULL COMMENT '档案地点',
  `doc_no` varchar(32) DEFAULT NULL COMMENT '档案号',
  `from_uni` varchar(120) DEFAULT NULL COMMENT '毕业院校',
  `officework_comp` varchar(60) DEFAULT NULL COMMENT '所属公司',
  `last_comp` varchar(60) DEFAULT NULL COMMENT '入司前单位',
  `overuni_time` varchar(20) DEFAULT NULL COMMENT '毕业时间',
  `officework_major` varchar(10) DEFAULT NULL COMMENT '专业',
  `input_time` varchar(20) DEFAULT NULL COMMENT '录入时间',
  `officework_level` varchar(10) DEFAULT NULL COMMENT '级别',
  `officework_addr` varchar(120) DEFAULT NULL COMMENT '家庭地址',
  `work_status` varchar(10) DEFAULT NULL COMMENT '在职状态',
  `post_level` varchar(10) DEFAULT NULL COMMENT '技术职称',
  `officework_nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `officework_quarters` varchar(20) DEFAULT NULL COMMENT '岗位',
  `officework_sales` varchar(1) DEFAULT NULL COMMENT '业务员',
  `contract_flg` varchar(1) DEFAULT NULL COMMENT '合同签否',
  `officework_flg` varchar(1) DEFAULT NULL COMMENT '标志',
  `officework_cancel` varchar(1) DEFAULT NULL COMMENT '注销',
  `is_driver` varchar(1) NOT NULL COMMENT '是否司机',
  `driver_name` varchar(120) DEFAULT NULL COMMENT '司机名称',
  `car_no` varchar(60) DEFAULT NULL COMMENT '车牌号码',
  `licence_no` varchar(60) DEFAULT NULL COMMENT '驾驶证号码',
  `comment` varchar(120) DEFAULT NULL COMMENT '备注',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/* 车辆档案 */
DROP TABLE IF EXISTS `doc_car`;
CREATE TABLE `doc_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_code` varchar(16) NOT NULL COMMENT '车辆编码',
  `car_no` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `driver_name` varchar(60) DEFAULT NULL COMMENT '司机姓名',
  `car_owner` varchar(20) DEFAULT NULL COMMENT '车主',
  `car_licence` varchar(32) DEFAULT NULL COMMENT '行驶执照',
  `card_no` varchar(32) DEFAULT NULL COMMENT '卡号',
  `car_typename` varchar(120) DEFAULT NULL COMMENT '车型名称',
  `empty_weight` varchar(20) DEFAULT NULL COMMENT '空重',
  `drive_cube` varchar(20) DEFAULT NULL COMMENT '装载方量',
  `car_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `is_mixing` varchar(1) DEFAULT NULL COMMENT '搅拌车',
  `is_pump` varchar(1) DEFAULT NULL COMMENT '泵车',
  `is_other` varchar(1) DEFAULT NULL COMMENT '其它设备',
  `is_avalable` varchar(1) DEFAULT NULL COMMENT '是否可用',
  `drive_record` varchar(240) DEFAULT NULL COMMENT '行驶记录',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 混泥土原材料档案 */
DROP TABLE IF EXISTS `doc_concrete`;
CREATE TABLE `doc_concrete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_code` varchar(16) NOT NULL COMMENT '品种编码',
  `kind_name` varchar(120) DEFAULT NULL COMMENT '品种名称',
  `kind_level` varchar(60) DEFAULT NULL COMMENT '材质等级',
  `stand_name` varchar(120) DEFAULT NULL COMMENT '标准名称',
  `kind_category` varchar(60) DEFAULT NULL COMMENT '所属分类',
  `kind_type` varchar(60) DEFAULT NULL COMMENT '原材料类型',
  `sec_unit` varchar(20) DEFAULT NULL COMMENT '辅记量单位',
  `first_unit` varchar(60) DEFAULT NULL COMMENT '主记量单位',
  `rate` varchar(12) DEFAULT NULL COMMENT '换算率',
  `primary_provider` varchar(240) DEFAULT NULL COMMENT '主要供应商',
  `pricing_mode` varchar(32) DEFAULT NULL COMMENT '计价方式',
  `brand_name` varchar(120) DEFAULT NULL COMMENT '品牌名称',
  `sales` varchar(1) DEFAULT NULL COMMENT '销售',
  `outsourcing` varchar(1) DEFAULT NULL COMMENT '外购',
  `mad_self` varchar(1) DEFAULT NULL COMMENT '自制',
  `tax_service` varchar(1) DEFAULT NULL COMMENT '应税劳务',
  `comp_set` varchar(1) DEFAULT NULL COMMENT '成套件',
  `mortar` varchar(1) DEFAULT NULL COMMENT '砂浆',
  `min_inventory` varchar(1) DEFAULT NULL COMMENT '最低库存',
  `cost_prices` varchar(50) DEFAULT NULL COMMENT '成本参考核算单价',
  `max_inventory` varchar(1) DEFAULT NULL COMMENT '最高存库',
  `sum_control` varchar(1) DEFAULT NULL COMMENT '配方上下限控制',
  `save_inventory` varchar(1) DEFAULT NULL COMMENT '安全库存',
  `stock_stand` varchar(1) DEFAULT NULL COMMENT '积压标准',
  `abc_category` varchar(1) DEFAULT NULL COMMENT 'ABC分类',
  `tax_rate` varchar(50) DEFAULT NULL COMMENT '税率',
  `quality_manage` varchar(1) DEFAULT NULL COMMENT '保质期管理',
  `bat_manage` varchar(1) DEFAULT NULL COMMENT '批次管理',
  `entrust_manage` varchar(1) DEFAULT NULL COMMENT '委托代锁管理',
  `stock_manage` varchar(1) DEFAULT NULL COMMENT '呆滞积压管理',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


insert into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('128','A','添加材料','abcCategory_list','ABC分类',10,'0','1','2017-12-17 00:00:00','1','2017-12-17 00:00:00',null,'0');
insert into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('129','B','骨料','abcCategory_list','ABC分类',20,'0','1','2017-12-17 00:00:00','1','2017-12-17 00:00:00',null,'0');
insert into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('130','C','水泥','abcCategory_list','ABC分类',30,'0','1','2017-12-17 00:00:00','1','2017-12-17 00:00:00',null,'0');

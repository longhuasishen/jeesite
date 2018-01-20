/* 合同分类 */
DROP TABLE IF EXISTS `archive_contract`;
CREATE TABLE `archive_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_name` varchar(50) DEFAULT NULL,
  `contract_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 客户分类 */
DROP TABLE IF EXISTS `archive_custom`;
CREATE TABLE `archive_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_name` varchar(50) DEFAULT NULL,
  `custom_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 物资分类 */
DROP TABLE IF EXISTS `archive_material`;
CREATE TABLE `archive_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(50) DEFAULT NULL,
  `material_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 行业分类 */
DROP TABLE IF EXISTS `archive_industry`;
CREATE TABLE `archive_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(50) DEFAULT NULL,
  `industry_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 部门分类 */
DROP TABLE IF EXISTS `archive_department`;
CREATE TABLE `archive_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `department_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 仓库分类 */
DROP TABLE IF EXISTS `archive_repertory`;
CREATE TABLE `archive_repertory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repertory_name` varchar(50) DEFAULT NULL,
  `repertory_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 文件分类 */
DROP TABLE IF EXISTS `archive_file`;
CREATE TABLE `archive_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(50) DEFAULT NULL,
  `file_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 供应商分类 */
DROP TABLE IF EXISTS `archive_supplier`;
CREATE TABLE `archive_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) DEFAULT NULL,
  `supplier_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 地区分类 */
DROP TABLE IF EXISTS `archive_area`;
CREATE TABLE `archive_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) DEFAULT NULL,
  `area_code` varchar(12) DEFAULT NULL,
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '搅拌站档案';



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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '部门档案';
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '司机档案';



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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '泵档案';


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '浇灌方式档案';


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '结算方式档案';



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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '支付方式档案';



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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '原材料类型档案';



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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '特殊要求档案';


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '仓库档案';

-----------------------------------------------------------2017年12月15日2------------------------------------------------------------------


/* 混凝土档案 */
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '混凝土档案';


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '普通物资档案';


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
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '职员档案';


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
  `back_time` varchar(120) DEFAULT NULL COMMENT '回厂时间',
  `produce_time` varchar(20) DEFAULT NULL COMMENT '安排生产时间',
  `out_time` varchar(20) DEFAULT NULL COMMENT '出厂时间',
  `fix_time` varchar(20) DEFAULT NULL COMMENT '维修时间',
  `back_sort` varchar(5) DEFAULT NULL COMMENT '回厂排序',
  `produce_sort` varchar(5) DEFAULT NULL COMMENT '生产排序',
  `out_sort` varchar(5) DEFAULT NULL COMMENT '出厂排序',
  `fix_sort` varchar(5) DEFAULT NULL COMMENT '维修排序',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '车辆档案';


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '混泥土原材料档案';

/* 销售合同 */
DROP TABLE IF EXISTS `contract_sales`;
CREATE TABLE `contract_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(120) NOT NULL COMMENT '工程名称',
  `contract_id` varchar(32) DEFAULT NULL COMMENT '合同编号',
  `cus_code` varchar(32) DEFAULT NULL COMMENT '客户编码',
  `contract_date` varchar(20) DEFAULT NULL COMMENT '签定日期',
  `contract_comp` varchar(120) DEFAULT NULL COMMENT '合同单位',
  `project_addr` varchar(240) DEFAULT NULL COMMENT '项目地址',
  `contract_department` varchar(60) DEFAULT NULL COMMENT '签定部门',
  `sales_person` varchar(60) DEFAULT NULL COMMENT '业务员',
  `comstem_type` varchar(32) DEFAULT NULL COMMENT '客户分类',
  `tong_accmeth` varchar(60) DEFAULT NULL COMMENT '砼结算方式',
  `contract_addr` varchar(240) DEFAULT NULL COMMENT '签定地点',
  `third_person` varchar(60) DEFAULT NULL COMMENT '见证方',
  `eff_term` varchar(1) DEFAULT NULL COMMENT '有效期限',
  `eff_start` varchar(20) DEFAULT NULL COMMENT '起始期限',
  `eff_end` varchar(20) DEFAULT NULL COMMENT '终止期限',
  `cube_control` varchar(1) DEFAULT NULL COMMENT '方量控制',
  `cube_start` varchar(32) DEFAULT NULL COMMENT '起始方量',
  `cube_end` varchar(32) DEFAULT NULL COMMENT '终止方量',
  `time_control` varchar(1) DEFAULT NULL COMMENT '时间控制',
  `time_start` varchar(20) DEFAULT NULL COMMENT '起始时间',
  `time_end` varchar(20) DEFAULT NULL COMMENT '终止时间',
  `create_person` varchar(60) DEFAULT NULL COMMENT '制单人',
  `check_person` varchar(60) DEFAULT NULL COMMENT '审核人',
  `cancle_person` varchar(60) DEFAULT NULL COMMENT '作废人',
  `make_date` varchar(20) DEFAULT NULL COMMENT '制单日期',
  `check_date` varchar(20) DEFAULT NULL COMMENT '审核日期',
  `cancel_date` varchar(20) DEFAULT NULL COMMENT '作废日期',
  `contract_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `concrete_price` varchar(11) DEFAULT NULL COMMENT '混凝土单价',
  `watermeth_price` varchar(11) DEFAULT NULL COMMENT '浇灌方式单价',
  `spec_price` varchar(11) DEFAULT NULL COMMENT '特殊要求单价',
  `sum_control` varchar(1000) DEFAULT NULL COMMENT '其它特殊要求',
  `save_inventory` varchar(1000) DEFAULT NULL COMMENT '工程需用量',
  `stock_stand` varchar(1000) DEFAULT NULL COMMENT '验收方法及期限',
  `abc_category` varchar(1000) DEFAULT NULL COMMENT '交货时间及地点',
  `tax_rate` varchar(1000) DEFAULT NULL COMMENT '结算方式',
  `quality_manage` varchar(1000) DEFAULT NULL COMMENT '付款方式',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '销售合同';


/* 工程运距管理 */
DROP TABLE IF EXISTS `project_distance`;
CREATE TABLE `project_distance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distance_code` varchar(32) NOT NULL COMMENT '工程运距编码',
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



/* 销售合同混凝土单价 */
DROP TABLE IF EXISTS `contract_sales_beton`;
CREATE TABLE `contract_sales_beton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` varchar(32) NOT NULL COMMENT '合同编码',
  `kind_code` varchar(16) DEFAULT NULL COMMENT '品种编码',
  `kind_name` varchar(120) DEFAULT NULL COMMENT '品种名称',
  `univalent` varchar(20) DEFAULT NULL COMMENT '单价',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '销售合同混凝土单价';


/* 销售合同浇灌方法单价 */
DROP TABLE IF EXISTS `contract_sales_watermeth`;
CREATE TABLE `contract_sales_watermeth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` varchar(32) NOT NULL COMMENT '合同编码',
  `watermeth_code` varchar(16) NOT NULL COMMENT '浇灌方式编码',
  `watermeth_name` varchar(120) DEFAULT NULL COMMENT '浇灌方法名称',
  `watermeth_univalent` varchar(20) DEFAULT NULL COMMENT '单价',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '销售合同浇灌方法单价';


/* 销售合同特殊方法单价 */
DROP TABLE IF EXISTS `contract_sales_specialreq`;
CREATE TABLE `contract_sales_specialreq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` varchar(32) NOT NULL COMMENT '合同编码',
  `specialreq_code` varchar(16) NOT NULL COMMENT '特殊要求编码',
  `specialreq_name` varchar(120) DEFAULT NULL COMMENT '特殊要求名称',
  `specialreq_univalent` varchar(20) DEFAULT NULL COMMENT '单价',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '销售合同特殊方法单价';

/* 车辆调度 */
DROP TABLE IF EXISTS `cars_dispatch`;
CREATE TABLE `cars_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_no` varchar(32) NOT NULL COMMENT '车号',
  `car_name` varchar(60) NOT NULL COMMENT '名称',
  `back_time` varchar(120) DEFAULT NULL COMMENT '回厂时间',
  `produce_time` varchar(20) DEFAULT NULL COMMENT '安排生产时间',
  `out_time` varchar(20) DEFAULT NULL COMMENT '出厂时间',
  `fix_time` varchar(20) DEFAULT NULL COMMENT '维修时间',
  `car_state` varchar(1) DEFAULT NULL COMMENT '可用状态',
  `car_type` varchar(1) DEFAULT NULL COMMENT '车辆性质',
  `car_owner` varchar(1) DEFAULT NULL COMMENT '车辆归属',
  `back_sort` varchar(5) DEFAULT NULL COMMENT '回厂排序',
  `produce_sort` varchar(5) DEFAULT NULL COMMENT '生产排序',
  `out_sort` varchar(5) DEFAULT NULL COMMENT '出厂排序',
  `fix_sort` varchar(5) DEFAULT NULL COMMENT '维修排序',
  `ext_field1` varchar(60) DEFAULT NULL COMMENT 'ext_field1',
  `ext_field2` varchar(60) DEFAULT NULL COMMENT 'ext_field2',
  `ext_field3` varchar(120) DEFAULT NULL COMMENT 'ext_field3',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '车辆调度';



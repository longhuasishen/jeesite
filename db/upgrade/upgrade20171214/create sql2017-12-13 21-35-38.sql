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



/* 混泥土原材料档案 */
DROP TABLE IF EXISTS `doc_concrete`;
CREATE TABLE `doc_concrete` (
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
  PRIMARY KEY (`kind_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

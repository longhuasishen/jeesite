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


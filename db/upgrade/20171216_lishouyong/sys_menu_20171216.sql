/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-12-17 10:15:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0c507dea34bd4c079121d112cdd90cfc', '51da820242f14fe3a5fbab2dbd4029ec', '0,1,4fffa44515b445a190f8be4cc76d6507,51da820242f14fe3a5fbab2dbd4029ec,', '期初入库', '30', '/financedoc/docInitStorageMain', '', '', '1', 'financedoc:docInitStorageMain:view,financedoc:docInitStorageMain:edit', '1', '2017-12-15 21:00:18', '1', '2017-12-15 21:18:28', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0f5cccad65554f7bbecbef4b4251264c', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '浇灌方式档案', '180', '/doc/docWatermeth', '', '', '1', 'doc:docWatermeth:view,doc:docWatermeth:edit', '1', '2017-12-15 16:56:35', '1', '2017-12-15 16:56:35', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('182c90000c7e41e39c349b74825f1f1e', '51da820242f14fe3a5fbab2dbd4029ec', '0,1,4fffa44515b445a190f8be4cc76d6507,51da820242f14fe3a5fbab2dbd4029ec,', '财务应收期初余额', '60', '/financedoc/docFinanceInitbalance', '', '', '1', 'financedoc:docFinanceInitbalance:view,financedoc:docFinanceInitbalance:edit', '1', '2017-12-15 21:03:49', '1', '2017-12-15 21:16:51', '', '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2034b9d20f3b4f7f8ca0b94e5f743826', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '结算方式档案', '210', '/doc/docAccmeth', '', '', '1', 'doc:docAccmeth:view,doc:docAccmeth:edit', '1', '2017-12-15 16:57:21', '1', '2017-12-15 18:30:47', '', '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24e6adcd2f204e6f9257404a5e0a297c', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '部门分类', '150', '/archive/archiveDepartment', '', '', '1', 'archive:archiveDepartment:view,archive:archiveDepartment:edit', '1', '2017-12-12 20:34:24', '1', '2017-12-12 20:34:24', '', '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2cea34eebec6470bb812059e3d702868', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '文件分类', '180', '/archive/archiveFile', '', '', '1', 'archive:archiveFile:view,archive:archiveFile:edit', '1', '2017-12-12 20:34:52', '1', '2017-12-12 20:34:52', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', '', '', '', '0', '', '1', '2013-05-27 08:00:00', '1', '2017-11-08 10:00:39', '', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39414154bb27454e8abaeb637b72c91a', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '地区分类', '300', '/archive/archiveArea', '', '', '1', 'archive:archiveArea:view,archive:archiveArea:edit', '1', '2017-12-12 21:38:39', '1', '2017-12-12 21:44:40', '', '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('443736961d974eceb483f7734f498990', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '原材料档案管理', '30', '/doc/docConcrete', '', '', '1', 'doc:docConcrete:view,doc:docConcrete:edit', '1', '2017-12-13 20:46:03', '1', '2017-12-13 21:01:47', '', '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('478631a1d953403e909a72060329b086', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '客户分类', '360', '/archive/archiveCustom', '', '', '1', 'archive:archiveCustom:view,archive:archiveCustom:edit', '1', '2017-12-14 16:28:45', '1', '2017-12-14 16:28:45', '', '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4b2a40c393e249eeb3eefde117ddae67', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '合同分类', '330', '/archive/archiveContract', '', '', '1', 'archive:archiveContract:view,archive:archiveContract:edit', '1', '2017-12-14 16:28:02', '1', '2017-12-14 16:28:02', '', '0');
INSERT INTO `sys_menu` VALUES ('4fffa44515b445a190f8be4cc76d6507', '1', '0,1,', '档案设置', '5060', '', '', '', '1', '', '1', '2017-12-07 21:46:56', '1', '2017-12-07 21:46:56', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51da820242f14fe3a5fbab2dbd4029ec', '4fffa44515b445a190f8be4cc76d6507', '0,1,4fffa44515b445a190f8be4cc76d6507,', '财务档案管理', '90', '', '', '', '1', '', '1', '2017-12-15 20:58:38', '1', '2017-12-15 20:58:38', '', '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5363b78f9d384ba3b1c7502eb01d8732', '4fffa44515b445a190f8be4cc76d6507', '0,1,4fffa44515b445a190f8be4cc76d6507,', '分类体系', '30', '', '', 'list-ul', '1', '', '1', '2017-12-10 15:22:15', '1', '2017-12-10 15:22:15', '', '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5403db33e71d493791cee4a67f7d275b', 'fb45aad4b73a4e8aa389efb33a52f2a5', '0,1,fb45aad4b73a4e8aa389efb33a52f2a5,', '基础档案', '90', '', '', '', '1', '', '1', '2017-11-17 16:24:56', '1', '2017-11-17 16:24:56', '', '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('574737c7c3d148828146a7b05de9372d', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '混泥土档案', '360', '/doc/docBeton', '', '', '1', 'doc:docBeton:view,doc:docBeton:edit', '1', '2017-12-15 19:06:03', '1', '2017-12-15 19:18:16', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5c980bd0157a41a29a388ae8bf429adf', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '支付方式档案', '240', '/doc/docPaymeth', '', '', '1', 'doc:docPaymeth:view,doc:docPaymeth:edit', '1', '2017-12-15 16:57:54', '1', '2017-12-15 18:30:55', '', '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', '', 'leaf', '1', '', '1', '2013-05-27 08:00:00', '1', '2017-11-08 10:06:40', '', '0');
INSERT INTO `sys_menu` VALUES ('64b28271f047413d8f2877bafdcd151e', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '分类规则', '60', '/archive/archiveRule', '', '', '1', 'archive:archiveRule:view,archive:archiveRule:edit', '1', '2017-12-11 22:13:27', '1', '2017-12-11 22:13:27', '', '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', null, null, null, '0', 'oa:leave:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', null, null, null, '0', 'oa:leave:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68e68659d14b436aa85b3e8f43b4dd84', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '特殊要求档案', '300', '/doc/docSpecialreq', '', '', '1', 'doc:docSpecialreq:view,doc:docSpecialreq:edit', '1', '2017-12-15 16:58:59', '1', '2017-12-15 16:58:59', '', '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6a2db3c0b5fd4a019363c37fa3f56fe7', '4fffa44515b445a190f8be4cc76d6507', '0,1,4fffa44515b445a190f8be4cc76d6507,', '档案管理', '60', '', '', 'list-ul', '1', '', '1', '2017-12-13 20:44:33', '1', '2017-12-13 21:01:39', '', '0');
INSERT INTO `sys_menu` VALUES ('6afe8eadf6c1466ebe9ff55ac9885701', '51da820242f14fe3a5fbab2dbd4029ec', '0,1,4fffa44515b445a190f8be4cc76d6507,51da820242f14fe3a5fbab2dbd4029ec,', '业务应付期初余额', '90', '/financedoc/docBusinessInitpay', '', '', '1', 'financedoc:docBusinessInitpay:view,financedoc:docBusinessInitpay:edit', '1', '2017-12-15 21:05:20', '1', '2017-12-15 21:17:38', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', null, 'road', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', null, 'road', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2013-09-20 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', null, 'tasks', '1', null, '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', null, null, null, '1', null, '1', '2013-10-08 08:00:00', '1', '2013-10-08 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', '', '', '', '1', '', '1', '2013-10-16 08:00:00', '1', '2017-12-10 20:29:15', '', '0');
INSERT INTO `sys_menu` VALUES ('7c7eeba5f0f84a7f8eb28b8f41deb353', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '普通物资档案', '390', '/doc/docNormaterial', '', '', '1', 'doc:docNormaterial:view,doc:docNormaterial:edit', '1', '2017-12-15 19:06:41', '1', '2017-12-15 19:18:22', '', '0');
INSERT INTO `sys_menu` VALUES ('7ed946e67c4942a9837d477af65e47f9', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '职员档案', '450', '/doc/docOfficework', '', '', '1', 'doc:docOfficework:view,doc:docOfficework:edit', '1', '2017-12-15 20:03:39', '1', '2017-12-15 20:03:39', '', '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('804501f42c6741bb850fbb4a8eaaef38', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '泵档案', '150', '/doc/docPump', '', '', '1', 'doc:docPump:view,doc:docPump:edit', '1', '2017-12-15 16:56:03', '1', '2017-12-15 18:30:38', '', '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('812737f452024be99ac2002e54d76cee', '51da820242f14fe3a5fbab2dbd4029ec', '0,1,4fffa44515b445a190f8be4cc76d6507,51da820242f14fe3a5fbab2dbd4029ec,', '业务应收期初余额', '30', '/financedoc/docBusinessInitbalance', '', '', '1', 'financedoc:docBusinessInitbalance:view,financedoc:docBusinessInitbalance:edit', '1', '2017-12-15 21:02:19', '1', '2017-12-15 21:17:11', '', '0');
INSERT INTO `sys_menu` VALUES ('813b2c68c6d6413bbbfe31c088631dc3', 'df89a78e54ae45e6ac3d05b968fd4c1e', '0,1,df89a78e54ae45e6ac3d05b968fd4c1e,', '库存管理', '30', '', '', '', '1', '', '1', '2017-11-08 14:10:22', '1', '2017-11-14 10:47:12', '', '0');
INSERT INTO `sys_menu` VALUES ('8176fd2e73ab4ed6898fe3f772e1c073', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '搅拌站档案', '60', '/doc/docStation', '', '', '1', 'doc:docStation:view,doc:docStation:edit', '1', '2017-12-14 21:06:22', '1', '2017-12-14 21:06:22', '', '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', null, null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/form', null, null, '1', 'test:test:view,test:test:edit', '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8b02052f877140d99f9c34c5e5be7351', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '原材料类型档案', '270', '/doc/docConcretetyp', '', '', '1', 'doc:docConcretetyp:view,doc:docConcretetyp:edit', '1', '2017-12-15 16:58:32', '1', '2017-12-15 16:58:32', '', '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('97f2fc3de46d4babb5393b21c5ae9ea7', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '仓库档案', '330', '/doc/docRepertory', '', '', '1', 'doc:docRepertory:view,doc:docRepertory:edit', '1', '2017-12-15 16:59:31', '1', '2017-12-15 16:59:31', '', '0');
INSERT INTO `sys_menu` VALUES ('9abb55c0db2d4c0d90ea027ca6470f95', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '供应商档案管理', '510', '/doc/docSupplier', '', '', '1', 'doc:docSupplier:view,doc:docSupplier:edit', '1', '2017-12-16 19:19:13', '1', '2017-12-16 19:29:25', '', '0');
INSERT INTO `sys_menu` VALUES ('9eb2795cb0444b8bb7c4e7b03a70e2b0', 'df89a78e54ae45e6ac3d05b968fd4c1e', '0,1,df89a78e54ae45e6ac3d05b968fd4c1e,', '入库单管理', '60', '', '', '', '1', '', '1', '2017-11-08 14:10:34', '1', '2017-11-08 14:10:34', '', '1');
INSERT INTO `sys_menu` VALUES ('9eec7e9eb88247c18215ac5e5e41f313', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '行业分类', '210', '/archive/archiveIndustry', '', '', '1', 'archive:archiveIndustry:view,archive:archiveIndustry:edit', '1', '2017-12-12 20:35:53', '1', '2017-12-12 20:35:53', '', '0');
INSERT INTO `sys_menu` VALUES ('a354e22fd98148b2b0d59ae09bcc4c98', 'fb45aad4b73a4e8aa389efb33a52f2a5', '0,1,fb45aad4b73a4e8aa389efb33a52f2a5,', '分类体系', '60', '', '', '', '1', '', '1', '2017-11-17 16:24:15', '1', '2017-11-17 16:24:15', '', '0');
INSERT INTO `sys_menu` VALUES ('a485b59faa4f4ce397c8c9f448510d82', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '客户档案管理', '480', '/doc/docCustomer', '', '', '1', 'doc:docCustomer:view,doc:docCustomer:edit', '1', '2017-12-15 22:06:04', '1', '2017-12-15 22:11:15', '', '0');
INSERT INTO `sys_menu` VALUES ('a8f3749f49534e619e5d0ef39f66781d', 'fb45aad4b73a4e8aa389efb33a52f2a5', '0,1,fb45aad4b73a4e8aa389efb33a52f2a5,', '数据字典', '30', '', '', '', '1', '', '1', '2017-11-17 16:23:52', '1', '2017-11-17 16:23:52', '', '0');
INSERT INTO `sys_menu` VALUES ('aa7ba45e4c3f422e9be443fa33d892fa', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '物资分类', '390', '/archive/archiveMaterial', '', '', '1', 'archive:archiveMaterial:view,archive:archiveMaterial:edit', '1', '2017-12-14 16:29:47', '1', '2017-12-14 16:29:47', '', '0');
INSERT INTO `sys_menu` VALUES ('adf85eaced54474d95e6be93823d6c83', '813b2c68c6d6413bbbfe31c088631dc3', '0,1,df89a78e54ae45e6ac3d05b968fd4c1e,813b2c68c6d6413bbbfe31c088631dc3,', '出库单管理', '30', '/out/outReport', '', '', '1', '', '1', '2017-11-14 10:47:37', '1', '2017-11-14 10:47:37', '', '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('bc70e033ccf74e5a811071d06fa308d4', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '供应商分类', '270', '/archive/archiveSupplier', '', '', '1', 'archive:archiveSupplier:view,archive:archiveSupplier:edit', '1', '2017-12-12 20:37:45', '1', '2017-12-12 20:37:45', '', '0');
INSERT INTO `sys_menu` VALUES ('bf9b79f3fcdf492ebb1fc09cb2959af1', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '车辆档案', '420', '/doc/docCar', '', '', '1', 'doc:docCar:view,doc:docCar:edit', '1', '2017-12-15 20:02:44', '1', '2017-12-15 20:02:44', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d0f9ebdb96af48b19816ca90631d2a6d', '813b2c68c6d6413bbbfe31c088631dc3', '0,1,df89a78e54ae45e6ac3d05b968fd4c1e,813b2c68c6d6413bbbfe31c088631dc3,', '入库单管理', '60', '/in/inReport', '', 'table', '1', '', '1', '2017-11-14 10:49:10', '1', '2017-11-14 10:49:10', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d750a8727bec425ca20dc79c7d22d9db', '5363b78f9d384ba3b1c7502eb01d8732', '0,1,4fffa44515b445a190f8be4cc76d6507,5363b78f9d384ba3b1c7502eb01d8732,', '仓库分类', '240', '/archive/archiveRepertory', '', '', '1', 'archive:archiveRepertory:view,archive:archiveRepertory:edit', '1', '2017-12-12 20:37:04', '1', '2017-12-12 20:37:04', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df89a78e54ae45e6ac3d05b968fd4c1e', '1', '0,1,', '库存管理', '5030', '', '', '', '1', '', '1', '2017-11-08 14:08:40', '1', '2017-11-08 14:08:40', '', '0');
INSERT INTO `sys_menu` VALUES ('e526598cf5274f5c8c7d5243af34fc51', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '部门档案', '90', '/doc/docDepartment', '', '', '1', 'doc:docDepartment:view,doc:docDepartment:edit', '1', '2017-12-14 21:07:16', '1', '2017-12-14 21:07:16', '', '0');
INSERT INTO `sys_menu` VALUES ('e5d654c630e84c07acb091e616c51825', '6a2db3c0b5fd4a019363c37fa3f56fe7', '0,1,4fffa44515b445a190f8be4cc76d6507,6a2db3c0b5fd4a019363c37fa3f56fe7,', '司机档案', '120', '/doc/docDriver', '', '', '1', 'doc:docDriver:view,doc:docDriver:edit', '1', '2017-12-15 16:55:22', '1', '2017-12-15 18:30:30', '', '0');
INSERT INTO `sys_menu` VALUES ('fb45aad4b73a4e8aa389efb33a52f2a5', '1', '0,1,', '基础设置', '5020', '', '', '', '1', '', '1', '2017-11-17 16:22:09', '1', '2017-11-17 16:22:09', '', '0');
INSERT INTO `sys_menu` VALUES ('fd13194384f646369f7fb95228b04bf3', '51da820242f14fe3a5fbab2dbd4029ec', '0,1,4fffa44515b445a190f8be4cc76d6507,51da820242f14fe3a5fbab2dbd4029ec,', '财务应付期初余额', '120', '/financedoc/docFinanceInitpay', '', '', '1', 'financedoc:docFinanceInitpay:view,financedoc:docFinanceInitpay:edit', '1', '2017-12-15 21:05:54', '1', '2017-12-15 21:18:03', '', '0');

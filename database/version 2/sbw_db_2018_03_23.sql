/*
Navicat MySQL Data Transfer

Source Server         : ace
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : sbw_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-23 11:49:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sbw_admin
-- ----------------------------
DROP TABLE IF EXISTS `sbw_admin`;
CREATE TABLE `sbw_admin` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `lastloginip` varchar(50) NOT NULL,
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  `registertime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_admin
-- ----------------------------
INSERT INTO `sbw_admin` VALUES ('1', '墨夜瞳', '4e8baa6b218fa1ef22b9182283a82a19', '', '2130706433', '1521764701', 'yehith@sina.com', '15011911867', '墨夜瞳', '', '1', '1520088934', '1520088934');
INSERT INTO `sbw_admin` VALUES ('2', '13311857969', 'e10adc3949ba59abbe56e057f20f883e', '', '2130706433', '1521687802', 'Morihith@qq.com', '13311857969', '', '', '1', '0', '1521371903');
INSERT INTO `sbw_admin` VALUES ('3', '13314564959', 'e10adc3949ba59abbe56e057f20f883e', '', '2130706433', '1521617118', 'UIUI@qq.com', '13314564959', '', '', '1', '0', '1521385657');
INSERT INTO `sbw_admin` VALUES ('4', '供销商', 'e10adc3949ba59abbe56e057f20f883e', '', '2130706433', '1521623969', 'qwe@qq.com', '13314564896', '供销商', '', '1', '0', null);
INSERT INTO `sbw_admin` VALUES ('5', '我是合作商', 'e10adc3949ba59abbe56e057f20f883e', '', '', '1521688789', 'Email', '13354658456', '合作商', '', '1', '0', null);
INSERT INTO `sbw_admin` VALUES ('6', '18156569853', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '1234@qq.com', '18156569853', '', '', '1', '0', '1521770103');

-- ----------------------------
-- Table structure for sbw_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `sbw_admin_group`;
CREATE TABLE `sbw_admin_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_admin_group
-- ----------------------------
INSERT INTO `sbw_admin_group` VALUES ('2', '市场部管理员', '仅拥有日志管理权限', '35,36,34,38,23,41,42', '1', '1520607086');
INSERT INTO `sbw_admin_group` VALUES ('4', '加盟商', '拥有加盟商的所有权限', '31,32,33,39,40,1,23,37,43,46,36', '2', '1521473022');
INSERT INTO `sbw_admin_group` VALUES ('5', '运维', '管理库存', '37', '3', '1520607095');
INSERT INTO `sbw_admin_group` VALUES ('6', '供销商', '提供桶装水', '41,42,45', '4', '1520831171');
INSERT INTO `sbw_admin_group` VALUES ('7', '合作商', '可以添加用户', '34,47', '5', '1521688710');
INSERT INTO `sbw_admin_group` VALUES ('8', '管理员', '管理用户与管理员', '1,2,3,23', '6', '1521475894');

-- ----------------------------
-- Table structure for sbw_admin_group_access
-- ----------------------------
DROP TABLE IF EXISTS `sbw_admin_group_access`;
CREATE TABLE `sbw_admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_admin_group_access
-- ----------------------------
INSERT INTO `sbw_admin_group_access` VALUES ('2', '4');
INSERT INTO `sbw_admin_group_access` VALUES ('3', '4');
INSERT INTO `sbw_admin_group_access` VALUES ('6', '4');
INSERT INTO `sbw_admin_group_access` VALUES ('4', '6');
INSERT INTO `sbw_admin_group_access` VALUES ('5', '7');

-- ----------------------------
-- Table structure for sbw_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `sbw_admin_log`;
CREATE TABLE `sbw_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_admin_log
-- ----------------------------
INSERT INTO `sbw_admin_log` VALUES ('14117', 'admin', 'Product', 'send_stock_look', '', '1', '墨夜瞳', '2130706433', '1521697923');
INSERT INTO `sbw_admin_log` VALUES ('14118', 'admin', 'Product', 'send_stock_look', '', '1', '墨夜瞳', '2130706433', '1521697933');
INSERT INTO `sbw_admin_log` VALUES ('14119', 'admin', 'Product', 'send_stock_look', '', '1', '墨夜瞳', '2130706433', '1521697939');
INSERT INTO `sbw_admin_log` VALUES ('14120', 'admin', 'Product', 'index', '', '1', '墨夜瞳', '2130706433', '1521697941');
INSERT INTO `sbw_admin_log` VALUES ('14121', 'admin', 'Product', 'send_stock_look', '', '1', '墨夜瞳', '2130706433', '1521697942');
INSERT INTO `sbw_admin_log` VALUES ('14122', 'admin', 'Product', 'send_stock_look', '', '1', '墨夜瞳', '2130706433', '1521707917');
INSERT INTO `sbw_admin_log` VALUES ('14123', 'admin', 'Product', 'query_stock', '', '1', '墨夜瞳', '2130706433', '1521707918');
INSERT INTO `sbw_admin_log` VALUES ('14124', 'admin', 'Group', 'index', '', '1', '墨夜瞳', '2130706433', '1521707918');
INSERT INTO `sbw_admin_log` VALUES ('14125', 'admin', 'Group', 'index', '', '1', '墨夜瞳', '2130706433', '1521707920');
INSERT INTO `sbw_admin_log` VALUES ('14126', 'admin', 'Userinfo', 'index', '', '1', '墨夜瞳', '2130706433', '1521707921');
INSERT INTO `sbw_admin_log` VALUES ('14127', 'admin', 'Shoper', 'index', '', '1', '墨夜瞳', '2130706433', '1521707921');
INSERT INTO `sbw_admin_log` VALUES ('14128', 'admin', 'Userinfo', 'index', '', '1', '墨夜瞳', '2130706433', '1521707922');
INSERT INTO `sbw_admin_log` VALUES ('14129', 'admin', 'Userinfo', 'index', '', '1', '墨夜瞳', '2130706433', '1521707922');
INSERT INTO `sbw_admin_log` VALUES ('14130', 'admin', 'Shoper', 'index', '', '1', '墨夜瞳', '2130706433', '1521707923');
INSERT INTO `sbw_admin_log` VALUES ('14131', 'admin', 'Menu', 'look', '', '1', '墨夜瞳', '2130706433', '1521708189');
INSERT INTO `sbw_admin_log` VALUES ('14132', 'admin', 'Menu', 'info', '?id=18', '1', '墨夜瞳', '2130706433', '1521708194');
INSERT INTO `sbw_admin_log` VALUES ('14133', 'admin', 'Shoper', 'index', '', '1', '墨夜瞳', '2130706433', '1521709927');
INSERT INTO `sbw_admin_log` VALUES ('14134', 'admin', 'Shoper', 'index', '', '1', '墨夜瞳', '2130706433', '1521710002');
INSERT INTO `sbw_admin_log` VALUES ('14135', 'admin', 'Shoper', 'index', '', '1', '墨夜瞳', '2130706433', '1521710053');
INSERT INTO `sbw_admin_log` VALUES ('14136', 'admin', 'Shoper', 'info_pic', '', '1', '墨夜瞳', '2130706433', '1521710056');
INSERT INTO `sbw_admin_log` VALUES ('14137', 'admin', 'Shoper', 'index', '', '1', '墨夜瞳', '2130706433', '1521710151');
INSERT INTO `sbw_admin_log` VALUES ('14138', 'admin', 'Shoper', 'info_pic', '', '1', '墨夜瞳', '2130706433', '1521710152');
INSERT INTO `sbw_admin_log` VALUES ('14139', 'admin', 'Userinfo', 'index', '', '1', '墨夜瞳', '2130706433', '1521710242');
INSERT INTO `sbw_admin_log` VALUES ('14140', 'admin', 'Admin', 'index', '', '1', '墨夜瞳', '2130706433', '1521710248');
INSERT INTO `sbw_admin_log` VALUES ('14141', 'admin', 'Group', 'index', '', '1', '墨夜瞳', '2130706433', '1521710250');
INSERT INTO `sbw_admin_log` VALUES ('14142', 'admin', 'Admin', 'public_edit_info', '', '1', '墨夜瞳', '2130706433', '1521710252');
INSERT INTO `sbw_admin_log` VALUES ('14143', 'admin', 'Product', 'query_stock', '', '1', '墨夜瞳', '2130706433', '1521710254');
INSERT INTO `sbw_admin_log` VALUES ('14144', 'admin', 'Product', 'query_stock', '', '1', '墨夜瞳', '2130706433', '1521710299');
INSERT INTO `sbw_admin_log` VALUES ('14145', 'admin', 'Product', 'query_stock', '', '1', '墨夜瞳', '2130706433', '1521710485');
INSERT INTO `sbw_admin_log` VALUES ('14146', 'admin', 'Product', 'enter_send', '', '1', '墨夜瞳', '2130706433', '1521710490');
INSERT INTO `sbw_admin_log` VALUES ('14147', 'admin', 'Product', 'send_stock_look', '', '1', '墨夜瞳', '2130706433', '1521710499');
INSERT INTO `sbw_admin_log` VALUES ('14148', 'admin', 'Product', 'add_stock', '', '1', '墨夜瞳', '2130706433', '1521710505');
INSERT INTO `sbw_admin_log` VALUES ('14149', 'admin', 'Shoperinfo', 'add', '', '1', '墨夜瞳', '2130706433', '1521710555');
INSERT INTO `sbw_admin_log` VALUES ('14150', 'admin', 'Shoperinfo', 'index', '', '1', '墨夜瞳', '2130706433', '1521710557');
INSERT INTO `sbw_admin_log` VALUES ('14151', 'admin', 'Shoperinfo', 'index', '', '1', '墨夜瞳', '2130706433', '1521710865');
INSERT INTO `sbw_admin_log` VALUES ('14152', 'admin', 'Menu', 'look', '', '1', '墨夜瞳', '2130706433', '1521710867');
INSERT INTO `sbw_admin_log` VALUES ('14153', 'admin', 'Product', 'send_stock_look', '', '1', '墨夜瞳', '2130706433', '1521710874');

-- ----------------------------
-- Table structure for sbw_app
-- ----------------------------
DROP TABLE IF EXISTS `sbw_app`;
CREATE TABLE `sbw_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '图标',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1软件，2游戏，3付费',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '发布人ID',
  `position` smallint(5) NOT NULL DEFAULT '0' COMMENT '位置',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '标记说明',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '开始时间',
  `s_time` time DEFAULT NULL,
  `date_total` int(11) DEFAULT NULL,
  `time_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时间类型：1全天，2时间段',
  PRIMARY KEY (`id`),
  KEY `nums` (`total`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_app
-- ----------------------------

-- ----------------------------
-- Table structure for sbw_config
-- ----------------------------
DROP TABLE IF EXISTS `sbw_config`;
CREATE TABLE `sbw_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_config
-- ----------------------------

-- ----------------------------
-- Table structure for sbw_menu
-- ----------------------------
DROP TABLE IF EXISTS `sbw_menu`;
CREATE TABLE `sbw_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_menu
-- ----------------------------
INSERT INTO `sbw_menu` VALUES ('1', '管理设置', '0', 'fa-users', 'Admin', 'admin', '', '', '', '3', '1', '1521688675');
INSERT INTO `sbw_menu` VALUES ('2', '角色管理', '1', '', 'Admin', 'index', '', '', '', '0', '1', '1521688675');
INSERT INTO `sbw_menu` VALUES ('3', '详情', '2', '', 'Admin', 'info', '', '', '', '0', '2', '1521688675');
INSERT INTO `sbw_menu` VALUES ('4', '添加', '2', '', 'Admin', 'add', '', '', '', '0', '2', '1521688675');
INSERT INTO `sbw_menu` VALUES ('5', '修改', '2', '', 'Admin', 'edit', '', '', '', '0', '2', '1521688675');
INSERT INTO `sbw_menu` VALUES ('6', '删除', '2', '', 'Admin', 'del', '', '', '', '0', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('7', '分组管理', '1', '', 'Group', 'index', '', '', '', '0', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('8', '详情', '7', '', 'Group', 'info', '', '', '', '0', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('9', '添加', '7', '', 'Group', 'add', '', '', '', '0', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('10', '修改', '7', '', 'Group', 'edit', '', '', '', '0', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('11', '删除', '7', '', 'Group', 'del', '', '', '', '0', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('12', '菜单管理', '18', 'fa-navicon', '', '', '', '', '', '0', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('13', '查看', '12', '', 'Menu', 'look', '', '', '', '0', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('14', '添加', '12', '', 'Menu', 'add', '', '', '', '0', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('15', '修改', '12', '', 'Menu', 'index', '', '', '', '0', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('16', '删除', '12', '', 'Menu', 'del', '', '', '', '0', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('18', '系统设置', '0', 'fa-cogs', '', '', '', '', '', '0', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('22', '权限设置', '2', '', 'Group', 'rule', '', '', '', '999', '2', '1521688676');
INSERT INTO `sbw_menu` VALUES ('23', '个人设置', '1', '', 'Admin', 'public_edit_info', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('27', '日志管理', '18', 'fa-bug', 'Log', 'index', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('31', '系统首页', '0', 'fa-bank', 'Index', 'index', '', '', '', '0', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('32', '加盟商管理', '0', '', '', '', '', '', '', '1', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('33', '送水员管理', '32', 'fa-cloud ', '', '', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('34', '用户管理', '0', '', '', '', '', '', '', '2', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('36', '订单报表', '46', 'fa-table', 'Order', 'index', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('37', '库存管理', '0', '', '', '', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('38', '服务点管理', '34', 'fa-map-pin', 'Shoper', 'index', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('39', '骑手添加', '33', '', 'Shoperinfo', 'add', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('40', '骑手管理', '33', '', 'Shoperinfo', 'index', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('41', '供应商', '0', '', '', '', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('42', '桶装水派送', '41', '', 'Product', 'send_stock_look', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('43', '库存管理', '37', '', 'product', 'query_stock', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('44', '用户信息', '34', 'fa-users', 'Userinfo', 'index', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('45', '产品管理', '41', '', 'Product', 'index', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('46', '报表信息', '0', '', '', '', '', '', '', '999', '1', '1521688676');
INSERT INTO `sbw_menu` VALUES ('47', '会员用户注册', '34', '', '', '', '', '', '', '999', '1', '1521688676');

-- ----------------------------
-- Table structure for sbw_order
-- ----------------------------
DROP TABLE IF EXISTS `sbw_order`;
CREATE TABLE `sbw_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(16) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `order_status` int(1) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `shoper_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `updatetime` int(10) DEFAULT NULL,
  `o_builddate` int(10) DEFAULT NULL,
  `senddate` int(10) DEFAULT NULL,
  `o_address` varchar(255) DEFAULT NULL,
  `payway` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=597 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_order
-- ----------------------------
INSERT INTO `sbw_order` VALUES ('550', '1521618002135', '3', '1', '2', '0', '10', '9', '1521618002', '1521618002', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('551', '1521618156876', '2', '1', '1', '0', '10', '9', '1521618156', '1521618156', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('552', '1521618157268', '2', '1', '1', '0', '10', '9', '1521618157', '1521618157', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('553', '1521618158355', '2', '1', '1', '0', '10', '9', '1521618158', '1521618158', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('554', '1521618158949', '2', '1', '1', '0', '10', '9', '1521618158', '1521618158', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('555', '1521618159209', '2', '1', '1', '0', '10', '9', '1521618159', '1521618159', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('556', '1521618159642', '2', '1', '1', '0', '10', '9', '1521618159', '1521618159', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('557', '1521618160229', '2', '1', '1', '0', '10', '9', '1521618160', '1521618160', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('558', '1521618160976', '2', '1', '1', '0', '10', '9', '1521618160', '1521618160', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('559', '1521618161466', '2', '1', '1', '0', '10', '9', '1521618161', '1521618161', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('560', '1521618162107', '2', '1', '1', '0', '10', '9', '1521618162', '1521618162', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('561', '1521618175984', '6', '1', '2', '0', '10', '9', '1521618175', '1521618175', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('562', '1521618175777', '6', '1', '2', '0', '10', '9', '1521618175', '1521618175', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('563', '1521618176820', '6', '1', '2', '0', '10', '9', '1521618176', '1521618176', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('564', '1521618176827', '6', '1', '2', '0', '10', '9', '1521618176', '1521618176', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('565', '1521618176238', '6', '1', '2', '0', '10', '9', '1521618176', '1521618176', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('566', '1521618176115', '6', '1', '2', '0', '10', '9', '1521618176', '1521618176', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('567', '1521618176253', '6', '1', '2', '0', '10', '9', '1521618176', '1521618176', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('568', '1521618176668', '6', '1', '2', '0', '10', '9', '1521618176', '1521618176', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('569', '1521618177577', '6', '1', '2', '0', '10', '9', '1521618177', '1521618177', null, '广州花都区测试街111号', null);
INSERT INTO `sbw_order` VALUES ('570', '1521619667276', '4', '1', '2', '0', '10', '9', '1521619667', '1521619667', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('571', '1521619667760', '5', '1', '2', '0', '10', '9', '1521619667', '1521619667', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('572', '1521619668359', '10', '1', '2', '0', '10', '9', '1521619668', '1521619668', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('573', '1521619669364', '2', '1', '2', '0', '10', '9', '1521619669', '1521619669', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('574', '1521619670229', '11', '1', '2', '0', '10', '9', '1521619670', '1521619670', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('575', '1521619670186', '11', '1', '2', '0', '10', '9', '1521619670', '1521619670', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('576', '1521619671164', '11', '1', '2', '0', '10', '9', '1521619671', '1521619671', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('577', '1521619671227', '7', '1', '2', '0', '10', '9', '1521619671', '1521619671', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('578', '1521619672302', '10', '1', '2', '0', '10', '9', '1521619672', '1521619672', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('579', '1521619672283', '12', '1', '2', '0', '10', '9', '1521619672', '1521619672', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('580', '1521619673981', '8', '1', '2', '0', '10', '9', '1521619673', '1521619673', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('581', '1521619673475', '4', '1', '2', '0', '10', '9', '1521619673', '1521619673', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('582', '1521619673544', '10', '1', '2', '0', '10', '9', '1521619673', '1521619673', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('583', '1521619673684', '15', '1', '2', '0', '10', '9', '1521619673', '1521619673', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('584', '1521619674339', '5', '1', '2', '0', '10', '9', '1521619674', '1521619674', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('585', '1521619674701', '15', '1', '2', '0', '10', '9', '1521619674', '1521619674', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('586', '1521619675942', '4', '1', '2', '0', '10', '9', '1521619675', '1521619675', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('587', '1521619675692', '11', '1', '2', '0', '10', '9', '1521619675', '1521619675', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('588', '1521619675214', '6', '1', '2', '0', '10', '9', '1521619675', '1521619675', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('589', '1521619675184', '13', '1', '2', '0', '10', '9', '1521619675', '1521619675', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('590', '1521619676666', '5', '1', '2', '0', '10', '9', '1521619676', '1521619676', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('591', '1521619676575', '10', '1', '2', '0', '10', '9', '1521619676', '1521619676', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('592', '1521619676693', '11', '1', '2', '0', '10', '9', '1521619676', '1521619676', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('593', '1521619676367', '7', '1', '2', '0', '10', '9', '1521619676', '1521619676', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('594', '1521627048693', '10', '1', '2', '0', '10', '9', '1521627048', '1521627048', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('595', '1521627923884', '10', '1', '2', '0', '10', '9', '1521627923', '1521627923', null, '广州花都区111号', null);
INSERT INTO `sbw_order` VALUES ('596', '1521689746200', '6', '1', '1', '0', '10', '9', '1521689746', '1521689746', null, '广州花都区111号', null);

-- ----------------------------
-- Table structure for sbw_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `sbw_orderinfo`;
CREATE TABLE `sbw_orderinfo` (
  `uid` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `Order_num` varchar(16) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `builddate` int(10) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `overdate` int(10) DEFAULT NULL,
  PRIMARY KEY (`Order_num`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for sbw_product
-- ----------------------------
DROP TABLE IF EXISTS `sbw_product`;
CREATE TABLE `sbw_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_N` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `product_pic` varchar(255) DEFAULT NULL,
  `product_info` varchar(255) DEFAULT NULL,
  `builddate` int(10) DEFAULT NULL,
  `updatatime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_product
-- ----------------------------
INSERT INTO `sbw_product` VALUES ('9', '必宝', '12', 'public/upload/product/2018-03-17/1521216080bibao (1).jpg,public/upload/product/2018-03-17/1521216080bibao (2).jpg,public/upload/product/2018-03-17/1521216080bibao (3).jpg', '必宝水质有保证', '1521216080', '1521216080');

-- ----------------------------
-- Table structure for sbw_shop
-- ----------------------------
DROP TABLE IF EXISTS `sbw_shop`;
CREATE TABLE `sbw_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(20) DEFAULT NULL,
  `shop_phone` varchar(20) DEFAULT NULL,
  `shop_HQ` varchar(255) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `shop_pic` varchar(255) DEFAULT NULL,
  `id_pic` varchar(255) DEFAULT NULL,
  `lience_pic` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `registertime` int(10) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_shop
-- ----------------------------
INSERT INTO `sbw_shop` VALUES ('1', '魔都服务站', '13311857969', '广州花都区龙珠商务大夏', '1521371903', '113229428', '23403597', 'public/upload/shoper/2018-03-18/1521371903bibao (3).jpg', 'public/upload/shoper/2018-03-18/1521371903bibao (2).jpg', 'public/upload/shoper/2018-03-18/1521371903bibao (1).jpg', 'Morihith@qq.com', '1521371903');
INSERT INTO `sbw_shop` VALUES ('2', '魔都服务站2', '13314564959', '广州花都区压抑虎园114号', '1521385657', '113229078', '23402005', 'public/upload/shoper/2018-03-18/1521385657bibao (3).jpg', 'public/upload/shoper/2018-03-18/1521385657bibao (2).jpg', 'public/upload/shoper/2018-03-18/1521385657bibao (1).jpg', 'UIUI@qq.com', '1521385657');
INSERT INTO `sbw_shop` VALUES ('3', '某度服务站', '18156569853', '广东省广州市花都区三东大道西', '1521770103', '113226284', '23416548', 'public/upload/shoper/2018-03-23/1521770103bibao (3).jpg', 'public/upload/shoper/2018-03-23/1521770103bibao (2).jpg', 'public/upload/shoper/2018-03-23/1521770103bibao (1).jpg', '1234@qq.com', '1521770103');

-- ----------------------------
-- Table structure for sbw_shoperinfo
-- ----------------------------
DROP TABLE IF EXISTS `sbw_shoperinfo`;
CREATE TABLE `sbw_shoperinfo` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `id_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_shoperinfo
-- ----------------------------
INSERT INTO `sbw_shoperinfo` VALUES ('5', '1', '啦啦啦', 'e10adc3949ba59abbe56', '特步', '13174514094', null);
INSERT INTO `sbw_shoperinfo` VALUES ('6', '2', '送水啦', 'e10adc3949ba59abbe56', '12331', '1234561111', null);

-- ----------------------------
-- Table structure for sbw_shop_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `sbw_shop_admin_access`;
CREATE TABLE `sbw_shop_admin_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `shop_fre` int(11) DEFAULT NULL,
  `ispass` int(1) DEFAULT '0',
  `bucket_null` int(11) DEFAULT '0',
  `bucket_allnum` int(11) DEFAULT '0',
  `send_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_shop_admin_access
-- ----------------------------
INSERT INTO `sbw_shop_admin_access` VALUES ('7', '1', '2', '1', '1', '276', '500', '0');
INSERT INTO `sbw_shop_admin_access` VALUES ('8', '2', '3', '1', '1', '496', '500', '10');
INSERT INTO `sbw_shop_admin_access` VALUES ('9', '3', '6', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sbw_shop_eavl
-- ----------------------------
DROP TABLE IF EXISTS `sbw_shop_eavl`;
CREATE TABLE `sbw_shop_eavl` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `eavl` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `star` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_shop_eavl
-- ----------------------------

-- ----------------------------
-- Table structure for sbw_shop_product_access
-- ----------------------------
DROP TABLE IF EXISTS `sbw_shop_product_access`;
CREATE TABLE `sbw_shop_product_access` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_shop_product_access
-- ----------------------------
INSERT INTO `sbw_shop_product_access` VALUES ('0', '54', '1', '12');

-- ----------------------------
-- Table structure for sbw_user
-- ----------------------------
DROP TABLE IF EXISTS `sbw_user`;
CREATE TABLE `sbw_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_wxid` varchar(255) DEFAULT NULL,
  `user_status` int(1) DEFAULT '1',
  `updatatime` int(10) DEFAULT NULL,
  `registertime` int(10) DEFAULT NULL,
  `u_gender` int(1) DEFAULT NULL,
  `u_isvip` int(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_user
-- ----------------------------
INSERT INTO `sbw_user` VALUES ('10', '(｀・ω・´)', 'o27rv0Ora7ZGjztTZLoQ0Fb6gM98', '1', '1521391661', '1521391661', '1', null);

-- ----------------------------
-- Table structure for sbw_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `sbw_userinfo`;
CREATE TABLE `sbw_userinfo` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_floor` int(11) DEFAULT NULL,
  `user_iselevator` int(1) DEFAULT NULL,
  `user_fre` int(11) DEFAULT NULL,
  `updatatime` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbw_userinfo
-- ----------------------------
INSERT INTO `sbw_userinfo` VALUES ('5', '10', '15011911867', null, '6', '0', '1', '1521391661');

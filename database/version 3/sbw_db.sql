-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-04-03 11:45:20
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbw_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `sbw_address`
--

CREATE TABLE `sbw_address` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  `choose` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不是默认，1是默认'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `sbw_address`
--

INSERT INTO `sbw_address` (`id`, `name`, `mobile`, `province`, `city`, `country`, `detail`, `delete_time`, `user_id`, `update_time`, `choose`) VALUES
(1, '狙击王', '13825236515', '广东省', '广州市', '花都区', '新华街道公益路百业广场', NULL, 10, NULL, 0),
(2, '路飞', '18819470607', '广东省', '广州市', '花都区', '赤坭镇东南角', NULL, 12, NULL, 0),
(3, '娜美', '18819470607', '广东省', '广州市', '花都区', '赤坭镇培正大道中一号sdfas', NULL, 10, NULL, 0),
(4, '山治', '18819470609', '北京市', '北京市', '朝阳区', '天上人间 888号', NULL, 13, NULL, 0),
(5, '山治2', '18819470609', '北京市', '北京市', '朝阳区', '景盛', NULL, 13, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_admin`
--

CREATE TABLE `sbw_admin` (
  `id` mediumint(6) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `lastloginip` varchar(50) NOT NULL,
  `lastlogintime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  `registertime` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_admin`
--

INSERT INTO `sbw_admin` (`id`, `username`, `password`, `encrypt`, `lastloginip`, `lastlogintime`, `email`, `mobile`, `realname`, `openid`, `status`, `updatetime`, `registertime`) VALUES
(1, '墨夜瞳', '4e8baa6b218fa1ef22b9182283a82a19', '', '2130706433', 1521764701, 'yehith@sina.com', '15011911867', '墨夜瞳', '', 1, 1520088934, 1520088934),
(2, '13311857969', 'e10adc3949ba59abbe56e057f20f883e', '', '2130706433', 1521687802, 'Morihith@qq.com', '13311857969', '', '', 1, 0, 1521371903),
(3, '13314564959', 'e10adc3949ba59abbe56e057f20f883e', '', '2130706433', 1521617118, 'UIUI@qq.com', '13314564959', '', '', 1, 0, 1521385657),
(4, '供销商', 'e10adc3949ba59abbe56e057f20f883e', '', '2130706433', 1521623969, 'qwe@qq.com', '13314564896', '供销商', '', 1, 0, NULL),
(5, '我是合作商', 'e10adc3949ba59abbe56e057f20f883e', '', '', 1521688789, 'Email', '13354658456', '合作商', '', 1, 0, NULL),
(6, '18156569853', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, '1234@qq.com', '18156569853', '', '', 1, 0, 1521770103);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_admin_group`
--

CREATE TABLE `sbw_admin_group` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_admin_group`
--

INSERT INTO `sbw_admin_group` (`id`, `name`, `description`, `rules`, `listorder`, `updatetime`) VALUES
(2, '市场部管理员', '仅拥有日志管理权限', '35,36,34,38,23,41,42', 1, 1520607086),
(4, '加盟商', '拥有加盟商的所有权限', '31,32,33,39,40,1,23,37,43,46,36', 2, 1521473022),
(5, '运维', '管理库存', '37', 3, 1520607095),
(6, '供销商', '提供桶装水', '41,42,45', 4, 1520831171),
(7, '合作商', '可以添加用户', '34,47', 5, 1521688710),
(8, '管理员', '管理用户与管理员', '1,2,3,23', 6, 1521475894);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_admin_group_access`
--

CREATE TABLE `sbw_admin_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) NOT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_admin_group_access`
--

INSERT INTO `sbw_admin_group_access` (`uid`, `group_id`) VALUES
(2, 4),
(3, 4),
(6, 4),
(4, 6),
(5, 7);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_admin_log`
--

CREATE TABLE `sbw_admin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_admin_log`
--

INSERT INTO `sbw_admin_log` (`id`, `m`, `c`, `a`, `querystring`, `userid`, `username`, `ip`, `time`) VALUES
(14117, 'admin', 'Product', 'send_stock_look', '', 1, '墨夜瞳', '2130706433', 1521697923),
(14118, 'admin', 'Product', 'send_stock_look', '', 1, '墨夜瞳', '2130706433', 1521697933),
(14119, 'admin', 'Product', 'send_stock_look', '', 1, '墨夜瞳', '2130706433', 1521697939),
(14120, 'admin', 'Product', 'index', '', 1, '墨夜瞳', '2130706433', 1521697941),
(14121, 'admin', 'Product', 'send_stock_look', '', 1, '墨夜瞳', '2130706433', 1521697942),
(14122, 'admin', 'Product', 'send_stock_look', '', 1, '墨夜瞳', '2130706433', 1521707917),
(14123, 'admin', 'Product', 'query_stock', '', 1, '墨夜瞳', '2130706433', 1521707918),
(14124, 'admin', 'Group', 'index', '', 1, '墨夜瞳', '2130706433', 1521707918),
(14125, 'admin', 'Group', 'index', '', 1, '墨夜瞳', '2130706433', 1521707920),
(14126, 'admin', 'Userinfo', 'index', '', 1, '墨夜瞳', '2130706433', 1521707921),
(14127, 'admin', 'Shoper', 'index', '', 1, '墨夜瞳', '2130706433', 1521707921),
(14128, 'admin', 'Userinfo', 'index', '', 1, '墨夜瞳', '2130706433', 1521707922),
(14129, 'admin', 'Userinfo', 'index', '', 1, '墨夜瞳', '2130706433', 1521707922),
(14130, 'admin', 'Shoper', 'index', '', 1, '墨夜瞳', '2130706433', 1521707923),
(14131, 'admin', 'Menu', 'look', '', 1, '墨夜瞳', '2130706433', 1521708189),
(14132, 'admin', 'Menu', 'info', '?id=18', 1, '墨夜瞳', '2130706433', 1521708194),
(14133, 'admin', 'Shoper', 'index', '', 1, '墨夜瞳', '2130706433', 1521709927),
(14134, 'admin', 'Shoper', 'index', '', 1, '墨夜瞳', '2130706433', 1521710002),
(14135, 'admin', 'Shoper', 'index', '', 1, '墨夜瞳', '2130706433', 1521710053),
(14136, 'admin', 'Shoper', 'info_pic', '', 1, '墨夜瞳', '2130706433', 1521710056),
(14137, 'admin', 'Shoper', 'index', '', 1, '墨夜瞳', '2130706433', 1521710151),
(14138, 'admin', 'Shoper', 'info_pic', '', 1, '墨夜瞳', '2130706433', 1521710152),
(14139, 'admin', 'Userinfo', 'index', '', 1, '墨夜瞳', '2130706433', 1521710242),
(14140, 'admin', 'Admin', 'index', '', 1, '墨夜瞳', '2130706433', 1521710248),
(14141, 'admin', 'Group', 'index', '', 1, '墨夜瞳', '2130706433', 1521710250),
(14142, 'admin', 'Admin', 'public_edit_info', '', 1, '墨夜瞳', '2130706433', 1521710252),
(14143, 'admin', 'Product', 'query_stock', '', 1, '墨夜瞳', '2130706433', 1521710254),
(14144, 'admin', 'Product', 'query_stock', '', 1, '墨夜瞳', '2130706433', 1521710299),
(14145, 'admin', 'Product', 'query_stock', '', 1, '墨夜瞳', '2130706433', 1521710485),
(14146, 'admin', 'Product', 'enter_send', '', 1, '墨夜瞳', '2130706433', 1521710490),
(14147, 'admin', 'Product', 'send_stock_look', '', 1, '墨夜瞳', '2130706433', 1521710499),
(14148, 'admin', 'Product', 'add_stock', '', 1, '墨夜瞳', '2130706433', 1521710505),
(14149, 'admin', 'Shoperinfo', 'add', '', 1, '墨夜瞳', '2130706433', 1521710555),
(14150, 'admin', 'Shoperinfo', 'index', '', 1, '墨夜瞳', '2130706433', 1521710557),
(14151, 'admin', 'Shoperinfo', 'index', '', 1, '墨夜瞳', '2130706433', 1521710865),
(14152, 'admin', 'Menu', 'look', '', 1, '墨夜瞳', '2130706433', 1521710867),
(14153, 'admin', 'Product', 'send_stock_look', '', 1, '墨夜瞳', '2130706433', 1521710874);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_app`
--

CREATE TABLE `sbw_app` (
  `id` int(11) NOT NULL,
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
  `time_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时间类型：1全天，2时间段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sbw_config`
--

CREATE TABLE `sbw_config` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sbw_menu`
--

CREATE TABLE `sbw_menu` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) UNSIGNED NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_menu`
--

INSERT INTO `sbw_menu` (`id`, `name`, `parentid`, `icon`, `c`, `a`, `data`, `tip`, `group`, `listorder`, `display`, `updatetime`) VALUES
(1, '管理设置', 0, 'fa-users', 'Admin', 'admin', '', '', '', 3, 1, 1521688675),
(2, '角色管理', 1, '', 'Admin', 'index', '', '', '', 0, 1, 1521688675),
(3, '详情', 2, '', 'Admin', 'info', '', '', '', 0, 2, 1521688675),
(4, '添加', 2, '', 'Admin', 'add', '', '', '', 0, 2, 1521688675),
(5, '修改', 2, '', 'Admin', 'edit', '', '', '', 0, 2, 1521688675),
(6, '删除', 2, '', 'Admin', 'del', '', '', '', 0, 2, 1521688676),
(7, '分组管理', 1, '', 'Group', 'index', '', '', '', 0, 1, 1521688676),
(8, '详情', 7, '', 'Group', 'info', '', '', '', 0, 2, 1521688676),
(9, '添加', 7, '', 'Group', 'add', '', '', '', 0, 2, 1521688676),
(10, '修改', 7, '', 'Group', 'edit', '', '', '', 0, 2, 1521688676),
(11, '删除', 7, '', 'Group', 'del', '', '', '', 0, 2, 1521688676),
(12, '菜单管理', 18, 'fa-navicon', '', '', '', '', '', 0, 1, 1521688676),
(13, '查看', 12, '', 'Menu', 'look', '', '', '', 0, 1, 1521688676),
(14, '添加', 12, '', 'Menu', 'add', '', '', '', 0, 2, 1521688676),
(15, '修改', 12, '', 'Menu', 'index', '', '', '', 0, 1, 1521688676),
(16, '删除', 12, '', 'Menu', 'del', '', '', '', 0, 2, 1521688676),
(18, '系统设置', 0, 'fa-cogs', '', '', '', '', '', 0, 1, 1521688676),
(22, '权限设置', 2, '', 'Group', 'rule', '', '', '', 999, 2, 1521688676),
(23, '个人设置', 1, '', 'Admin', 'public_edit_info', '', '', '', 999, 1, 1521688676),
(27, '日志管理', 18, 'fa-bug', 'Log', 'index', '', '', '', 999, 1, 1521688676),
(31, '系统首页', 0, 'fa-bank', 'Index', 'index', '', '', '', 0, 1, 1521688676),
(32, '加盟商管理', 0, '', '', '', '', '', '', 1, 1, 1521688676),
(33, '送水员管理', 32, 'fa-cloud ', '', '', '', '', '', 999, 1, 1521688676),
(34, '用户管理', 0, '', '', '', '', '', '', 2, 1, 1521688676),
(36, '订单报表', 46, 'fa-table', 'Order', 'index', '', '', '', 999, 1, 1521688676),
(37, '库存管理', 0, '', '', '', '', '', '', 999, 1, 1521688676),
(38, '服务点管理', 34, 'fa-map-pin', 'Shoper', 'index', '', '', '', 999, 1, 1521688676),
(39, '骑手添加', 33, '', 'Shoperinfo', 'add', '', '', '', 999, 1, 1521688676),
(40, '骑手管理', 33, '', 'Shoperinfo', 'index', '', '', '', 999, 1, 1521688676),
(41, '供应商', 0, '', '', '', '', '', '', 999, 1, 1521688676),
(42, '桶装水派送', 41, '', 'Product', 'send_stock_look', '', '', '', 999, 1, 1521688676),
(43, '库存管理', 37, '', 'product', 'query_stock', '', '', '', 999, 1, 1521688676),
(44, '用户信息', 34, 'fa-users', 'Userinfo', 'index', '', '', '', 999, 1, 1521688676),
(45, '产品管理', 41, '', 'Product', 'index', '', '', '', 999, 1, 1521688676),
(46, '报表信息', 0, '', '', '', '', '', '', 999, 1, 1521688676),
(47, '会员用户注册', 34, '', '', '', '', '', '', 999, 1, 1521688676);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_order`
--

CREATE TABLE `sbw_order` (
  `id` int(11) NOT NULL,
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
  `payway` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_order`
--

INSERT INTO `sbw_order` (`id`, `order_id`, `num`, `order_status`, `shop_id`, `shoper_id`, `user_id`, `product_id`, `updatetime`, `o_builddate`, `senddate`, `o_address`, `payway`) VALUES
(550, '1521618002135', 3, 3, 2, 5, 12, 9, 1521618002, 1521618002, NULL, '广州花都区测试街111号', NULL),
(551, '1521618156876', 2, 1, 1, 6, 13, 9, 1521618156, 1521618156, NULL, '广州花都区测试街111号', NULL),
(552, '1521618157268', 2, 1, 1, 6, 10, 9, 1521618157, 1521618157, NULL, '广州花都区测试街111号', NULL),
(553, '1521618158355', 2, 4, 1, 5, 12, 9, 1521618158, 1521618158, NULL, '广州花都区测试街111号', NULL),
(554, '1521618158949', 2, 1, 1, 0, 10, 9, 1521618158, 1521618158, NULL, '广州花都区测试街111号', NULL),
(555, '1521618159209', 2, 4, 1, 5, 10, 9, 1521618159, 1521618159, NULL, '广州花都区测试街111号', NULL),
(556, '1521618159642', 2, 1, 1, 5, 13, 9, 1521618159, 1521618159, NULL, '广州花都区测试街111号', NULL),
(557, '1521618160229', 2, 1, 1, 0, 10, 9, 1521618160, 1521618160, NULL, '广州花都区测试街111号', NULL),
(558, '1521618160976', 2, 3, 1, 5, 13, 9, 1521618160, 1521618160, NULL, '广州花都区测试街111号', NULL),
(559, '1521618161466', 2, 1, 1, 0, 10, 9, 1521618161, 1521618161, NULL, '广州花都区测试街111号', NULL),
(560, '1521618162107', 2, 2, 1, 5, 10, 9, 1521618162, 1521618162, NULL, '广州花都区测试街111号', NULL),
(561, '1521618175984', 6, 1, 2, 0, 10, 9, 1521618175, 1521618175, NULL, '广州花都区测试街111号', NULL),
(562, '1521618175777', 6, 1, 2, 0, 10, 9, 1521618175, 1521618175, NULL, '广州花都区测试街111号', NULL),
(563, '1521618176820', 6, 1, 2, 0, 10, 9, 1521618176, 1521618176, NULL, '广州花都区测试街111号', NULL),
(564, '1521618176827', 6, 1, 2, 0, 10, 9, 1521618176, 1521618176, NULL, '广州花都区测试街111号', NULL),
(565, '1521618176238', 6, 1, 2, 0, 10, 9, 1521618176, 1521618176, NULL, '广州花都区测试街111号', NULL),
(566, '1521618176115', 6, 1, 2, 0, 10, 9, 1521618176, 1521618176, NULL, '广州花都区测试街111号', NULL),
(567, '1521618176253', 6, 1, 2, 0, 10, 9, 1521618176, 1521618176, NULL, '广州花都区测试街111号', NULL),
(568, '1521618176668', 6, 1, 2, 0, 10, 9, 1521618176, 1521618176, NULL, '广州花都区测试街111号', NULL),
(569, '1521618177577', 6, 1, 2, 0, 10, 9, 1521618177, 1521618177, NULL, '广州花都区测试街111号', NULL),
(570, '1521619667276', 4, 1, 2, 0, 10, 9, 1521619667, 1521619667, NULL, '广州花都区111号', NULL),
(571, '1521619667760', 5, 1, 2, 0, 10, 9, 1521619667, 1521619667, NULL, '广州花都区111号', NULL),
(572, '1521619668359', 10, 1, 2, 0, 10, 9, 1521619668, 1521619668, NULL, '广州花都区111号', NULL),
(573, '1521619669364', 2, 1, 2, 0, 10, 9, 1521619669, 1521619669, NULL, '广州花都区111号', NULL),
(574, '1521619670229', 11, 1, 2, 0, 10, 9, 1521619670, 1521619670, NULL, '广州花都区111号', NULL),
(575, '1521619670186', 11, 1, 2, 0, 10, 9, 1521619670, 1521619670, NULL, '广州花都区111号', NULL),
(576, '1521619671164', 11, 1, 2, 0, 10, 9, 1521619671, 1521619671, NULL, '广州花都区111号', NULL),
(577, '1521619671227', 7, 1, 2, 0, 10, 9, 1521619671, 1521619671, NULL, '广州花都区111号', NULL),
(578, '1521619672302', 10, 1, 2, 0, 10, 9, 1521619672, 1521619672, NULL, '广州花都区111号', NULL),
(579, '1521619672283', 12, 1, 2, 0, 10, 9, 1521619672, 1521619672, NULL, '广州花都区111号', NULL),
(580, '1521619673981', 8, 1, 2, 0, 10, 9, 1521619673, 1521619673, NULL, '广州花都区111号', NULL),
(581, '1521619673475', 4, 1, 2, 0, 10, 9, 1521619673, 1521619673, NULL, '广州花都区111号', NULL),
(582, '1521619673544', 10, 1, 2, 0, 10, 9, 1521619673, 1521619673, NULL, '广州花都区111号', NULL),
(583, '1521619673684', 15, 1, 2, 0, 10, 9, 1521619673, 1521619673, NULL, '广州花都区111号', NULL),
(584, '1521619674339', 5, 1, 2, 0, 10, 9, 1521619674, 1521619674, NULL, '广州花都区111号', NULL),
(585, '1521619674701', 15, 1, 2, 0, 10, 9, 1521619674, 1521619674, NULL, '广州花都区111号', NULL),
(586, '1521619675942', 4, 1, 2, 0, 10, 9, 1521619675, 1521619675, NULL, '广州花都区111号', NULL),
(587, '1521619675692', 11, 1, 2, 0, 10, 9, 1521619675, 1521619675, NULL, '广州花都区111号', NULL),
(588, '1521619675214', 6, 1, 2, 0, 10, 9, 1521619675, 1521619675, NULL, '广州花都区111号', NULL),
(589, '1521619675184', 13, 1, 2, 0, 10, 9, 1521619675, 1521619675, NULL, '广州花都区111号', NULL),
(590, '1521619676666', 5, 1, 2, 0, 10, 9, 1521619676, 1521619676, NULL, '广州花都区111号', NULL),
(591, '1521619676575', 10, 1, 2, 0, 10, 9, 1521619676, 1521619676, NULL, '广州花都区111号', NULL),
(592, '1521619676693', 11, 1, 2, 0, 10, 9, 1521619676, 1521619676, NULL, '广州花都区111号', NULL),
(593, '1521619676367', 7, 1, 2, 0, 10, 9, 1521619676, 1521619676, NULL, '广州花都区111号', NULL),
(594, '1521627048693', 10, 1, 2, 0, 10, 9, 1521627048, 1521627048, NULL, '广州花都区111号', NULL),
(595, '1521627923884', 10, 1, 2, 0, 10, 9, 1521627923, 1521627923, NULL, '广州花都区111号', NULL),
(596, '1521689746200', 6, 1, 1, 0, 10, 9, 1521689746, 1521689746, NULL, '广州花都区111号', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_orderinfo`
--

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
  `overdate` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sbw_product`
--

CREATE TABLE `sbw_product` (
  `id` int(11) NOT NULL,
  `product_N` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `product_pic` varchar(255) DEFAULT NULL,
  `product_info` varchar(255) DEFAULT NULL,
  `builddate` int(10) DEFAULT NULL,
  `updatatime` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_product`
--

INSERT INTO `sbw_product` (`id`, `product_N`, `price`, `product_pic`, `product_info`, `builddate`, `updatatime`) VALUES
(9, '必宝', 12, 'public/upload/product/2018-03-17/1521216080bibao (1).jpg,public/upload/product/2018-03-17/1521216080bibao (2).jpg,public/upload/product/2018-03-17/1521216080bibao (3).jpg', '必宝水质有保证', 1521216080, 1521216080);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_shop`
--

CREATE TABLE `sbw_shop` (
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '商家的用户id',
  `shop_name` varchar(20) DEFAULT NULL,
  `shop_phone` varchar(20) DEFAULT NULL,
  `shop_HQ` varchar(255) DEFAULT NULL,
  `updatetime` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `shop_pic` varchar(255) DEFAULT NULL,
  `id_pic` varchar(255) DEFAULT NULL,
  `lience_pic` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `registertime` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_shop`
--

INSERT INTO `sbw_shop` (`shop_id`, `user_id`, `shop_name`, `shop_phone`, `shop_HQ`, `updatetime`, `longitude`, `latitude`, `shop_pic`, `id_pic`, `lience_pic`, `email`, `registertime`) VALUES
(1, 1, '魔都服务站', '13311857969', '广州花都区龙珠商务大夏', '9999.999999', '9999.999999', 23403597, 'public/upload/shoper/2018-03-18/1521371903bibao (3).jpg', 'public/upload/shoper/2018-03-18/1521371903bibao (2).jpg', 'public/upload/shoper/2018-03-18/1521371903bibao (1).jpg', 'Morihith@qq.com', 1521371903),
(2, 2, '魔都服务站2', '13314564959', '广州花都区压抑虎园114号', '9999.999999', '9999.999999', 23402005, 'public/upload/shoper/2018-03-18/1521385657bibao (3).jpg', 'public/upload/shoper/2018-03-18/1521385657bibao (2).jpg', 'public/upload/shoper/2018-03-18/1521385657bibao (1).jpg', 'UIUI@qq.com', 1521385657),
(3, 3, '某度服务站', '18156569853', '广东省广州市花都区三东大道西', '9999.999999', '9999.999999', 23416548, 'public/upload/shoper/2018-03-23/1521770103bibao (3).jpg', 'public/upload/shoper/2018-03-23/1521770103bibao (2).jpg', 'public/upload/shoper/2018-03-23/1521770103bibao (1).jpg', '1234@qq.com', 1521770103);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_shoperinfo`
--

CREATE TABLE `sbw_shoperinfo` (
  `sid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '骑手的用户ID',
  `shop_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `id_pic` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_shoperinfo`
--

INSERT INTO `sbw_shoperinfo` (`sid`, `user_id`, `shop_id`, `name`, `password`, `realname`, `mobile`, `id_pic`) VALUES
(5, 13, 1, '啦啦啦', 'e10adc3949ba59abbe56', '特步', '13174514094', NULL),
(6, 2, 2, '送水啦', 'e10adc3949ba59abbe56', '12331', '1234561111', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_shop_admin_access`
--

CREATE TABLE `sbw_shop_admin_access` (
  `id` int(11) NOT NULL,
  `shopid` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `shop_fre` int(11) DEFAULT NULL,
  `ispass` int(1) DEFAULT '0',
  `bucket_null` int(11) DEFAULT '0',
  `bucket_allnum` int(11) DEFAULT '0',
  `send_num` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_shop_admin_access`
--

INSERT INTO `sbw_shop_admin_access` (`id`, `shopid`, `admin_id`, `shop_fre`, `ispass`, `bucket_null`, `bucket_allnum`, `send_num`) VALUES
(7, 1, 2, 1, 1, 276, 500, 0),
(8, 2, 3, 1, 1, 496, 500, 10),
(9, 3, 6, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_shop_eavl`
--

CREATE TABLE `sbw_shop_eavl` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `eavl` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `star` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sbw_shop_product_access`
--

CREATE TABLE `sbw_shop_product_access` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_shop_product_access`
--

INSERT INTO `sbw_shop_product_access` (`id`, `shop_id`, `product_id`, `stock`) VALUES
(0, 54, 1, 12);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_user`
--

CREATE TABLE `sbw_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_wxid` varchar(255) DEFAULT NULL,
  `user_role` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1是普通用户，2是骑手，3是商家',
  `user_status` int(1) DEFAULT '1',
  `updatatime` int(10) DEFAULT NULL,
  `registertime` int(10) DEFAULT NULL,
  `u_gender` int(1) DEFAULT NULL,
  `u_isvip` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_user`
--

INSERT INTO `sbw_user` (`user_id`, `user_name`, `user_wxid`, `user_role`, `user_status`, `updatatime`, `registertime`, `u_gender`, `u_isvip`) VALUES
(10, '(｀・ω・´)', 'o27rv0Ora7ZGjztTZLoQ0Fb6gM98', 3, 1, 1521391661, 1521391661, 1, NULL),
(11, '景盛', 'oiv_q0O-C90mOezGXzLZ7UBfaked', 1, 1, 1521391661, 1521391661, 1, NULL),
(12, '小陈', 'oiv_q0O-C90mOezGXzLZ7UBnn6Lc', 1, 1, 1522649699, 1522649699, NULL, NULL),
(13, '小卢', 'oiv_q0LTQtWKE7aBUamWRDEYih-o', 2, 1, 1522720885, 1522720885, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_userinfo`
--

CREATE TABLE `sbw_userinfo` (
  `uid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_floor` int(11) DEFAULT NULL,
  `user_iselevator` int(1) DEFAULT NULL,
  `user_fre` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `updatatime` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_userinfo`
--

INSERT INTO `sbw_userinfo` (`uid`, `user_id`, `user_phone`, `user_address`, `user_floor`, `user_iselevator`, `user_fre`, `latitude`, `longitude`, `updatatime`) VALUES
(5, 10, '15011911867', '广东省广州市花都区公益路百业广场', 6, 0, 1, '23.403910', '113.220260', 1521391661),
(7, 11, '18819475212', '广东省广州市花都区大润发云顶沐足城', 6, 0, 1, '24.403910', '112.220260', 1521391661),
(8, 12, '18819475212', '广东省广州市花都区大润发云顶沐足城', 6, 0, 1, '24.403910', '112.220260', 1521391661);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sbw_address`
--
ALTER TABLE `sbw_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_admin`
--
ALTER TABLE `sbw_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `sbw_admin_group`
--
ALTER TABLE `sbw_admin_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`listorder`);

--
-- Indexes for table `sbw_admin_group_access`
--
ALTER TABLE `sbw_admin_group_access`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `sbw_admin_log`
--
ALTER TABLE `sbw_admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_app`
--
ALTER TABLE `sbw_app`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nums` (`total`) USING BTREE;

--
-- Indexes for table `sbw_config`
--
ALTER TABLE `sbw_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `sbw_menu`
--
ALTER TABLE `sbw_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`listorder`),
  ADD KEY `parentid` (`parentid`);

--
-- Indexes for table `sbw_order`
--
ALTER TABLE `sbw_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_orderinfo`
--
ALTER TABLE `sbw_orderinfo`
  ADD PRIMARY KEY (`Order_num`);

--
-- Indexes for table `sbw_product`
--
ALTER TABLE `sbw_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_shop`
--
ALTER TABLE `sbw_shop`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `sbw_shoperinfo`
--
ALTER TABLE `sbw_shoperinfo`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `sbw_shop_admin_access`
--
ALTER TABLE `sbw_shop_admin_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_shop_eavl`
--
ALTER TABLE `sbw_shop_eavl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_shop_product_access`
--
ALTER TABLE `sbw_shop_product_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_user`
--
ALTER TABLE `sbw_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `sbw_userinfo`
--
ALTER TABLE `sbw_userinfo`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `sbw_admin`
--
ALTER TABLE `sbw_admin`
  MODIFY `id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `sbw_admin_group`
--
ALTER TABLE `sbw_admin_group`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `sbw_admin_log`
--
ALTER TABLE `sbw_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14154;
--
-- 使用表AUTO_INCREMENT `sbw_app`
--
ALTER TABLE `sbw_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sbw_config`
--
ALTER TABLE `sbw_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID';
--
-- 使用表AUTO_INCREMENT `sbw_menu`
--
ALTER TABLE `sbw_menu`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `sbw_order`
--
ALTER TABLE `sbw_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=597;
--
-- 使用表AUTO_INCREMENT `sbw_product`
--
ALTER TABLE `sbw_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `sbw_shop`
--
ALTER TABLE `sbw_shop`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `sbw_shoperinfo`
--
ALTER TABLE `sbw_shoperinfo`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `sbw_shop_admin_access`
--
ALTER TABLE `sbw_shop_admin_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `sbw_user`
--
ALTER TABLE `sbw_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `sbw_userinfo`
--
ALTER TABLE `sbw_userinfo`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

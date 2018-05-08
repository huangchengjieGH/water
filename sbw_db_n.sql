-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-04-22 16:20:53
-- 服务器版本： 5.5.56-log
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
  `order_status` int(1) NOT NULL DEFAULT '1',
  `shop_id` int(11) DEFAULT NULL,
  `shoper_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `service_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '服务费',
  `is_business` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为个人订单，1为企业订单',
  `updatetime` int(10) DEFAULT NULL,
  `o_builddate` int(10) DEFAULT NULL,
  `senddate` int(10) DEFAULT NULL,
  `o_address` varchar(255) DEFAULT NULL,
  `o_phone` varchar(20) DEFAULT NULL COMMENT '联系号码',
  `payway` int(1) DEFAULT NULL,
  `prepay_id` varchar(100) NOT NULL,
  `note` varchar(255) NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_order`
--

INSERT INTO `sbw_order` (`id`, `order_id`, `num`, `order_status`, `shop_id`, `shoper_id`, `user_id`, `product_id`, `service_fee`, `is_business`, `updatetime`, `o_builddate`, `senddate`, `o_address`, `o_phone`, `payway`, `prepay_id`, `note`) VALUES
(819, '1524381120848', 4, 1, 4, NULL, 75, 11, '0.01', 1, 1524381120, 1524381120, NULL, '广东省广州市花都区花都区政府', '18819470586', NULL, 'wx221512228731987e9619ceaf1466071047', ''),
(820, '1524382490582', 2, 5, 4, 32, 84, 11, '0.01', 0, 1524383084, 1524382490, NULL, '广东省广州市花都区来又来', '18819470607', NULL, 'wx22153450478605edd13394c90836454389', ''),
(821, '1524382674261', 4, 5, 4, 32, 88, 11, '0.01', 1, 1524382936, 1524382674, NULL, '广东省广州市花都区龙珠中路', '13413174069', NULL, 'wx22153754954542c4727bb8222435717414', ''),
(822, '1524383981819', 2, 1, 37, NULL, 84, 9, '10.00', 0, 1524383981, 1524383981, NULL, '广东省广州市花都区来又来', '18819470607', NULL, 'wx22161358988540b0eabdb3312641371221', ''),
(823, '1524384463797', 4, 2, 37, NULL, 88, 9, '0.01', 1, 1524384463, 1524384463, NULL, '广东省广州市花都区龙珠中路', '13413174069', NULL, 'wx221607443228756d3e00845a1989670013', ''),
(824, '1524384487210', 4, 2, 37, NULL, 88, 9, '0.01', 1, 1524384487, 1524384487, NULL, '广东省广州市花都区龙珠中路', '13413174069', NULL, 'wx22160807492276b9191636e14032673408', ''),
(825, '1524384503287', 4, 3, 37, 33, 88, 9, '0.01', 1, 1524384503, 1524384503, NULL, '广东省广州市花都区龙珠中路', '13413174069', NULL, 'wx22160823421455d393ed58874244464470', ''),
(826, '1524384768851', 2, 1, 37, NULL, 84, 9, '0.01', 0, 1524384768, 1524384768, NULL, '广东省广州市花都区来又来', '18819470607', NULL, 'wx2216124896311464d79c971d2746399801', ''),
(827, '1524384848978', 2, 2, 37, NULL, 84, 9, '0.01', 0, 1524384848, 1524384848, NULL, '广东省广州市花都区来又来', '18819470607', NULL, 'wx2216140888414813d2a5a8541734823837', '');

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
  `shop_id` int(11) NOT NULL,
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

INSERT INTO `sbw_product` (`id`, `shop_id`, `product_N`, `price`, `product_pic`, `product_info`, `builddate`, `updatatime`) VALUES
(9, 37, '必宝', 12, '/uploads/20180417/c65c16610a6262102440369f74c7367d.jpg', '必宝水质有保证', 1521216080, 1521216080),
(11, 4, '怡宝', 66, '/uploads/20180417/c65c16610a6262102440369f74c7367d.jpg', '怡宝矿泉水', 1521216080, 1521216080),
(10, 4, '必宝5', 12, '/uploads/20180417/c65c16610a6262102440369f74c7367d.jpg', '必宝水质有保证', 1521216080, 1521216080),
(12, 30, '怡宝2', 66, '/uploads/20180417/c65c16610a6262102440369f74c7367d.jpg', '怡宝矿泉水2', 1521216080, 1521216080),
(13, 30, '怡宝BB', 7, '/uploads/20180417/c65c16610a6262102440369f74c7367d.jpg', '怡宝矿泉水BB', 1521216080, 1521216080),
(14, 30, '巅峰山泉', 34, '/uploads/20180417/c65c16610a6262102440369f74c7367d.jpg', '怡宝矿泉水ss', 1521216080, 1521216080),
(15, 30, '卢粉', 1, '/uploads/20180417/c65c16610a6262102440369f74c7367d.jpg', '必宝水质有保证', 1521216080, 1521216080);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_refund_order`
--

CREATE TABLE `sbw_refund_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户user_id',
  `type` int(11) DEFAULT NULL COMMENT '支付类型，1个人押金，2企业押金，3水店加盟，4水订单',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `o_builddate` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态：0已支付，1已提交申请2退款完成'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_refund_order`
--

INSERT INTO `sbw_refund_order` (`id`, `order_id`, `user_id`, `type`, `price`, `o_builddate`, `status`) VALUES
(67, 'p_1524382357_84', 84, 1, '0.01', 1524382367, 1),
(68, 'order_1524382490_820', 84, 4, '0.01', 1524382497, 0),
(69, 'p_1524382520_88', 88, 1, '0.01', 1524382527, 0),
(70, 'b_1524382612_88', 88, 2, '0.01', 1524382618, 0),
(71, 'order_1524382674_821', 88, 4, '0.01', 1524382680, 0),
(73, 'shop_1524383621_84', 84, 3, '0.01', 1524383646, 0),
(74, 'shop_1524383953_87', 87, 3, '0.01', 1524383959, 0),
(75, 'order_1524384464_823', 88, 4, '0.01', 1524384470, 0),
(76, 'order_1524384487_824', 88, 4, '0.01', 1524384492, 0),
(77, 'order_1524384503_825', 88, 4, '0.01', 1524384508, 0),
(78, 'order_1524384848_827', 84, 4, '0.01', 1524384857, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_report_log`
--

CREATE TABLE `sbw_report_log` (
  `id` bigint(20) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `createtime` int(10) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_report_log`
--

INSERT INTO `sbw_report_log` (`id`, `latitude`, `longitude`, `createtime`) VALUES
(4, '23.402353', '100.239806', 1524285829),
(5, '0.000000', '0.000000', 1524286829),
(6, '23.352552', '113.244290', 1524317043),
(7, '23.352490', '113.244190', 1524317068),
(8, '23.354733', '113.242450', 1524317533),
(9, '23.354698', '113.242480', 1524317582),
(10, '23.354664', '113.242510', 1524317760),
(11, '23.354635', '113.242460', 1524317943),
(12, '23.354774', '113.242480', 1524318277),
(13, '25.000000', '9.000000', 1524323671);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_set_money`
--

CREATE TABLE `sbw_set_money` (
  `id` int(11) NOT NULL,
  `user_fre` decimal(10,2) NOT NULL,
  `shop_fre` decimal(10,2) NOT NULL,
  `company_fre` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_set_money`
--

INSERT INTO `sbw_set_money` (`id`, `user_fre`, `shop_fre`, `company_fre`) VALUES
(1, '0.01', '0.01', '0.01');

-- --------------------------------------------------------

--
-- 表的结构 `sbw_shop`
--

CREATE TABLE `sbw_shop` (
  `shop_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '商家的用户id',
  `shop_name` varchar(20) DEFAULT NULL,
  `shop_phone` varchar(20) DEFAULT NULL,
  `shop_HQ` varchar(255) DEFAULT NULL,
  `shop_address_detail` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `shop_pic` varchar(255) DEFAULT NULL,
  `id_pic_back` varchar(225) NOT NULL,
  `id_pic` varchar(255) DEFAULT NULL,
  `lience_pic` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `registertime` int(10) DEFAULT NULL,
  `is_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//0未审核1审核',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0',
  `service_fee` decimal(10,2) NOT NULL DEFAULT '10.00',
  `star` int(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_shop`
--

INSERT INTO `sbw_shop` (`shop_id`, `user_id`, `shop_name`, `shop_phone`, `shop_HQ`, `shop_address_detail`, `latitude`, `longitude`, `updatetime`, `shop_pic`, `id_pic_back`, `id_pic`, `lience_pic`, `email`, `registertime`, `is_check`, `is_pay`, `service_fee`, `star`) VALUES
(4, 75, '杨调调送水服务站（马鞍山公园）', '14353456457', '广东省广州市花都区', '花都广场', '23.400480', '113.220190', 1523498148, '/uploads/20180412/00fef9fe8b4f32522c020f1487054468.jpg', '/public/upload//20180410/9d42ddd3c036ff7ef8f0ddf4503efbfa.jpg', '/public/upload//20180410/257b8f509c48b3a7c261612fa7cef39f.jpg', '/public/upload//20180410/a067bd3d0d6db0d9e43be5eec92c25bf.jpg', NULL, 1523355552, 1, 1, '0.01', 3),
(37, 84, '小卢水店', '18819470607', '广东省广州市花都区', '茶园市场', '23.398450', '113.212000', 1524383646, '/uploads/20180422/efd4599d82707f6cb07296730381ec4f.jpg', '/uploads/20180422/956c436d9bbcb46da60d4a97f9ad69f4.jpg', '/uploads/20180422/7d9f33b4674acb503924cf5221b50fad.jpg', '/uploads/20180422/339365c03e10c4ccd08a670fc61dd6eb.jpg', NULL, 1524383613, 1, 1, '0.01', 5),
(38, 87, '杨培正', '18814376329', '广东省广州市花都区', '广东培正学院', '23.410660', '113.090810', 1524383959, '/uploads/20180422/7a83009f7b618d553c7808fd2d8f7c49.jpg', '/uploads/20180422/61c99072c00379c4bc3e06296e68ec35.jpg', '/uploads/20180422/c1251f2e026746c2de3820a15ac5f02b.jpg', '/uploads/20180422/13c231695cb934989a996c07beb99623.jpg', NULL, 1524383936, 1, 1, '0.02', 5);

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
  `id_pic` varchar(255) DEFAULT NULL,
  `id_pic_back` varchar(225) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_shoperinfo`
--

INSERT INTO `sbw_shoperinfo` (`sid`, `user_id`, `shop_id`, `name`, `password`, `realname`, `mobile`, `id_pic`, `id_pic_back`, `is_default`) VALUES
(32, 87, 4, NULL, NULL, '吊吊', '18814376329', '/uploads/20180422/b143231388d21d60f830a132d6b36ceb.jpg', '/uploads/20180422/5d86cf55286ebdf3a386a3d230626c75.jpg', 0),
(33, 84, 37, NULL, NULL, '小卢自己', '18819470607', '/uploads/20180422/aa35128de8edda795b7da20df3985229.jpg', '/uploads/20180422/efe715b3e95feb666c4749e5d32e239e.jpg', 0);

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
-- 表的结构 `sbw_shop_eval`
--

CREATE TABLE `sbw_shop_eval` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `order_id` varchar(16) NOT NULL,
  `goods_name` varchar(50) NOT NULL COMMENT '商品名',
  `user_id` int(11) NOT NULL,
  `true_name` varchar(10) NOT NULL,
  `user_img` varchar(255) NOT NULL COMMENT '用户头像',
  `eavl` text,
  `time` int(10) DEFAULT NULL,
  `star` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_shop_eval`
--

INSERT INTO `sbw_shop_eval` (`id`, `shop_id`, `order_id`, `goods_name`, `user_id`, `true_name`, `user_img`, `eavl`, `time`, `star`) VALUES
(17, 4, '1523982679884', '怡宝', 53, '☞', 'https://wx.qlogo.cn/mmopen/vi_32/O1Gx6YFajwl16kRPDtMwswGhyowKAp4iaqCibv4c2ibrdLrVHBhKo03qCdgGf8k4zDZGYibdMACAb5SysUYdHt0gUQ/0', '非常好', 1524020532, 3),
(18, 4, '1524074257794', '怡宝', 50, '烟淡黄昏', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep4Ts4icQNq4UoIWbHPpXJUVyEvITWe0XJVDLBGm2d9Hf7JCmGSsoY4VlVMVsbBiaanUo3jMmdnxNuQ/0', '还行', 1524102034, 3),
(19, 4, '1524074015276', 'water', 62, 'wuzhibo', 'asdasdsad', 'GG', 1524110534, 3),
(20, 4, '1524193336965', '怡宝', 71, 'NoName', 'https://wx.qlogo.cn/mmopen/vi_32/yByWWFaiaDZ5NJJPqVfMC9PsxP3ha3Of4OczjNH2LicmqftmoNK4mnEQpiaxujRPCdEdqkZcB5VMcHgQUfhDeYT5Q/0', '噼噼啪啪', 1524193969, 3),
(21, 4, '1524210709688', '怡宝', 47, '浪子小卢', 'https://wx.qlogo.cn/mmopen/vi_32/8CDhvLgPPNwiad60nAZYgrG6OKlJkA6SOK9AyMp8PrzvKG7fPS519wzS4OKkYQqJsWljoIHgQCH7bHhc4s6MU2w/0', 'aaa ', 1524229675, 3),
(22, 4, '1524240654249', '怡宝', 74, '☞', 'https://wx.qlogo.cn/mmopen/vi_32/O1Gx6YFajwl16kRPDtMwswGhyowKAp4iaqCibv4c2ibrdLrVHBhKo03qCdgGf8k4zDZGYibdMACAb5SysUYdHt0gUQ/0', '哈哈', 1524240803, 3),
(16, 4, '1523895986877', '怡宝', 50, '烟淡黄昏', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep4Ts4icQNq4UoIWbHPpXJUVyEvITWe0XJVDLBGm2d9Hf7JCmGSsoY4VlVMVsbBiaanUo3jMmdnxNuQ/0', 'enen', 1524018317, 3),
(23, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524289532, 5),
(24, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524290707, 5),
(25, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524290769, 5),
(26, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524290788, 5),
(27, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524290810, 5),
(28, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524290979, 5),
(45, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524292074, 2),
(44, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524291803, 2),
(43, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524291357, 2),
(41, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524291325, 2),
(42, 4, '1524280687832', 'apple', 78, '啵啵', 'www.baiud.com', 'bo', 1524291326, 2),
(55, 4, '1524328432109', '怡宝', 81, '☞', 'https://wx.qlogo.cn/mmopen/vi_32/O1Gx6YFajwl16kRPDtMwswGhyowKAp4iaqCibv4c2ibrdLrVHBhKo03qCdgGf8k4zDZGYibdMACAb5SysUYdHt0gUQ/0', '好好好', 1524329370, 3),
(58, 4, '1524326796831', '怡宝', 78, '烟淡黄昏', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep4Ts4icQNq4UoIWbHPpXJUVyEvITWe0XJVDLBGm2d9Hf7JCmGSsoY4VlVMVsbBiaanUo3jMmdnxNuQ/0', '我是个好人', 1524332586, 3),
(67, 4, '1524382490582', '怡宝', 84, '浪子小卢', 'https://wx.qlogo.cn/mmopen/vi_32/8CDhvLgPPNwiad60nAZYgrG6OKlJkA6SOK9AyMp8PrzvKG7fPS519wzS4OKkYQqJsWljoIHgQCH7bHhc4s6MU2w/0', '啦啦啦', 1524383084, 1),
(61, 4, '1524329408473', '怡宝', 81, '☞', 'https://wx.qlogo.cn/mmopen/vi_32/O1Gx6YFajwl16kRPDtMwswGhyowKAp4iaqCibv4c2ibrdLrVHBhKo03qCdgGf8k4zDZGYibdMACAb5SysUYdHt0gUQ/0', '安生', 1524333991, 3),
(62, 4, '1524334123111', '怡宝', 81, '☞', 'https://wx.qlogo.cn/mmopen/vi_32/O1Gx6YFajwl16kRPDtMwswGhyowKAp4iaqCibv4c2ibrdLrVHBhKo03qCdgGf8k4zDZGYibdMACAb5SysUYdHt0gUQ/0', '测试测试', 1524334230, 3),
(63, 4, '1524334383426', '必宝5', 81, '☞', 'https://wx.qlogo.cn/mmopen/vi_32/O1Gx6YFajwl16kRPDtMwswGhyowKAp4iaqCibv4c2ibrdLrVHBhKo03qCdgGf8k4zDZGYibdMACAb5SysUYdHt0gUQ/0', '急急急进攻', 1524334497, 3),
(64, 0, '1524297258670', '怡宝BB', 76, '『Reclame』', 'https://wx.qlogo.cn/mmopen/vi_32/D5FbUCEfbVL8x3KyicAsBKfBAJpibS2ALhyxT9P0NmyYHxG6iagLVXsTLGoPHB6OkkZYuL2XRppIlgdDIoP57Mn4A/0', '哈哈', 1524364696, 5),
(66, 4, '1524382674261', '怡宝', 88, '『Reclame』', 'https://wx.qlogo.cn/mmopen/vi_32/D5FbUCEfbVL8x3KyicAsBKfBAJpibS2ALhyxT9P0NmyYHxG6iagLVXsTLGoPHB6OkkZYuL2XRppIlgdDIoP57Mn4A/0', '哈哈哈哈哈，已评价', 1524382936, 5);

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
(0, 4, 11, 77),
(1, 4, 10, 92),
(2, 37, 9, 83),
(3, 30, 13, 98),
(4, 29, 15, 45),
(5, 29, 66, 98);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_user`
--

CREATE TABLE `sbw_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_wxid` varchar(255) DEFAULT NULL,
  `user_role` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1是普通用户，2是骑手，3是商家',
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
(86, NULL, 'oyeOJ5UYeZgmIImsW80YEwMgxhuI', 0, 1, 1524382005, 1524382005, NULL, NULL),
(75, 'bb', 'oyeOJ5R7k7S5ggYD2744pId01ffw', 3, 1, 1524382643, 1524239035, NULL, NULL),
(87, NULL, 'oyeOJ5S95SkN0UNMGFuGkzbZFeog', 2, 1, 1524382125, 1524382125, NULL, NULL),
(88, NULL, 'oyeOJ5Vu74NYXBcEsj9oJ-rXFlN0', 1, 1, 1524382527, 1524382471, NULL, NULL),
(85, NULL, 'oyeOJ5TswezL0OcOw8HLAUQFyOhE', 0, 1, 1524381980, 1524381980, NULL, NULL),
(84, 'lu', 'oyeOJ5df8PPeIP_SRkL6aqFFA89k', 1, 1, 1524384748, 1524381936, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sbw_userinfo`
--

CREATE TABLE `sbw_userinfo` (
  `uid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_address_detail` varchar(255) DEFAULT NULL,
  `user_floor` int(11) DEFAULT '1',
  `user_iselevator` int(1) DEFAULT '0',
  `user_fre` int(11) DEFAULT '0',
  `business_fre` int(11) NOT NULL DEFAULT '0',
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `updatatime` int(10) DEFAULT NULL,
  `is_business` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否企业用户'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sbw_userinfo`
--

INSERT INTO `sbw_userinfo` (`uid`, `user_id`, `user_name`, `user_phone`, `user_address`, `user_address_detail`, `user_floor`, `user_iselevator`, `user_fre`, `business_fre`, `latitude`, `longitude`, `updatatime`, `is_business`) VALUES
(63, 85, '', '15889668184', NULL, NULL, 1, 0, 0, 0, NULL, NULL, 1524381980, 0),
(64, 86, '', NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, 1524382005, 0),
(65, 87, '杨建博', '18814376329', '广东省广州市花都区', '龙珠中路茶园市场', 20, 1, 0, 0, '23.398733', '113.210594', 1524382784, 0),
(66, 88, 'Reclame', '13413174069', '广东省广州市花都区', '龙珠中路', 1, 0, 1, 1, '23.397500', '113.232810', 1524383699, 1),
(53, 75, '波波波波', '18819470586', '广东省广州市花都区', '花都区政府', 4, 1, 1, 1, '23.403910', '113.220260', 1524381664, 0),
(62, 84, '卢扬健', '18819470607', '广东省广州市花都区', '来又来', 10, 1, 1, 0, '23.397480', '113.232360', 1524384748, 0);

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
-- Indexes for table `sbw_refund_order`
--
ALTER TABLE `sbw_refund_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_report_log`
--
ALTER TABLE `sbw_report_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbw_set_money`
--
ALTER TABLE `sbw_set_money`
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
-- Indexes for table `sbw_shop_eval`
--
ALTER TABLE `sbw_shop_eval`
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
  MODIFY `id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=828;
--
-- 使用表AUTO_INCREMENT `sbw_product`
--
ALTER TABLE `sbw_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `sbw_refund_order`
--
ALTER TABLE `sbw_refund_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- 使用表AUTO_INCREMENT `sbw_report_log`
--
ALTER TABLE `sbw_report_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `sbw_set_money`
--
ALTER TABLE `sbw_set_money`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `sbw_shop`
--
ALTER TABLE `sbw_shop`
  MODIFY `shop_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `sbw_shoperinfo`
--
ALTER TABLE `sbw_shoperinfo`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `sbw_shop_admin_access`
--
ALTER TABLE `sbw_shop_admin_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `sbw_shop_eval`
--
ALTER TABLE `sbw_shop_eval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- 使用表AUTO_INCREMENT `sbw_user`
--
ALTER TABLE `sbw_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- 使用表AUTO_INCREMENT `sbw_userinfo`
--
ALTER TABLE `sbw_userinfo`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

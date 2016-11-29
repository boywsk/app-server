# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 10.125.31.220 (MySQL 5.6.22-72.0-log)
# Database: gome_im
# Generation Time: 2016-11-29 02:26:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


use gome_im;

# Dump of table tbl_friend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_friend`;

CREATE TABLE `tbl_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `friendUid` bigint(20) NOT NULL COMMENT '好友用户id',
  `friendNickName` varchar(64) DEFAULT '' COMMENT '好友昵称',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态;0:未通过,1:通过,2:拒绝',
  `mark` varchar(64) DEFAULT '' COMMENT '好友标注和备注',
  `friendGroupId` bigint(20) DEFAULT '0' COMMENT '好友分组id',
  `createTime` bigint(20) DEFAULT '0' COMMENT '记录创建时间',
  `updateTime` bigint(20) DEFAULT '0' COMMENT '记录最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tbl_friend_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_friend_group`;

CREATE TABLE `tbl_friend_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `nickName` varchar(64) DEFAULT '' COMMENT '分组名称',
  `contentType` tinyint(4) DEFAULT NULL COMMENT '内容类型 1:txt 2:image 3:video',
  `content` text COMMENT '文案内容',
  `extra` text COMMENT '图片或小视频地址url',
  `createTime` bigint(20) DEFAULT NULL COMMENT '备注时间',
  `updateTime` bigint(20) DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tbl_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_group`;

CREATE TABLE `tbl_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupId` varchar(32) NOT NULL COMMENT '群组id',
  `uid` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `type` tinyint(4) DEFAULT '0' COMMENT '群组类型;1:单聊,2:群聊',
  `groupName` varchar(64) DEFAULT '' COMMENT '群组名称',
  `groupDesc` varchar(256) DEFAULT '' COMMENT '群组描述',
  `avatar` varchar(128) DEFAULT '' COMMENT '群头像',
  `qRCode` varchar(128) DEFAULT '' COMMENT '二维码',
  `capacity` int(11) DEFAULT '0' COMMENT '群最大成员数',
  `isAudit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请加入是否需要审核;0:否,1:是',
  `stickies` tinyint(4) NOT NULL DEFAULT '0' COMMENT '置顶;0:否,1:是',
  `isDele` tinyint(4) DEFAULT '0' COMMENT '是否被删除;0:否,1:是',
  `createTime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `updateTime` bigint(20) DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tbl_group_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_group_member`;

CREATE TABLE `tbl_group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupId` varchar(32) DEFAULT NULL COMMENT '群组id',
  `uid` bigint(20) DEFAULT NULL COMMENT '成员id',
  `nickName` varchar(64) DEFAULT '' COMMENT '成员昵称',
  `stickies` tinyint(4) DEFAULT '0' COMMENT '置顶;0:否,1:是',
  `isShield` tinyint(4) DEFAULT '0' COMMENT '是否屏蔽群消息;0:否,1:是',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:未通过 1:通过 2:拒绝',
  `initSeq` bigint(20) DEFAULT '0' COMMENT '加入群时，当前群消息seq',
  `readSeq` bigint(20) DEFAULT '0' COMMENT '读取到的群消息最大seq',
  `joinTime` bigint(20) DEFAULT '0' COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tbl_group_member_mark
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_group_member_mark`;

CREATE TABLE `tbl_group_member_mark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupId` varchar(32) NOT NULL COMMENT '群主id',
  `uid` bigint(20) NOT NULL COMMENT '备注人id',
  `markedUid` bigint(20) NOT NULL COMMENT '被备注人id',
  `mark` varchar(64) DEFAULT NULL COMMENT '备注名称',
  `createTime` bigint(20) DEFAULT NULL COMMENT '备注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tbl_test
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_test`;

CREATE TABLE `tbl_test` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tbl_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 主键；uid',
  `appId` varchar(32) DEFAULT '' COMMENT '应用id',
  `imUserId` bigint(20) DEFAULT '0' COMMENT '获取到的imUserId',
  `phoneNumber` varchar(32) DEFAULT '' COMMENT '手机号；不可重复',
  `userName` varchar(64) DEFAULT '' COMMENT '用户名；不可重复',
  `password` varchar(64) DEFAULT '' COMMENT '登录密码',
  `nickName` varchar(64) DEFAULT '' COMMENT '昵称',
  `avatar` varchar(128) DEFAULT '' COMMENT '头像地址(小)；根据预先定义规则取大头像',
  `gender` tinyint(4) DEFAULT '0' COMMENT '性别；0:男,1:女',
  `region` varchar(16) DEFAULT '' COMMENT '地区',
  `birthday` bigint(20) DEFAULT '0' COMMENT '生日；格式:yyyMMdd',
  `autograph` varchar(256) DEFAULT '' COMMENT '签名',
  `token` varchar(64) DEFAULT NULL COMMENT '登录token',
  `tokenValidity` bigint(20) DEFAULT '0' COMMENT '登录token有效期',
  `mobileClientId` tinyint(4) DEFAULT '0' COMMENT '移动端类型;10:ios/11:android/12:wp',
  `pcClientId` tinyint(4) DEFAULT '0' COMMENT '非移动端类型;20:pc/21:mac/22:ubuntu/23:linux/24:unix/25:ipad....',
  `createTime` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `updateTime` bigint(20) DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

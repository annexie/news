/*
Navicat MySQL Data Transfer

Source Server         : XieyanDB
Source Server Version : 50627
Source Host           : 119.29.17.244:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-04-14 21:45:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `admin_password` varchar(255) COLLATE utf8_bin NOT NULL,
  `admin_role` int(3) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123', '123', '1');
INSERT INTO `admin` VALUES ('2', '234', '234', '2');
INSERT INTO `admin` VALUES ('3', '345', '345', '3');
INSERT INTO `admin` VALUES ('4', '222', '222', '2');
INSERT INTO `admin` VALUES ('5', '333', '333', '3');
INSERT INTO `admin` VALUES ('6', '567', '567', '2');

-- ----------------------------
-- Table structure for news_collection
-- ----------------------------
DROP TABLE IF EXISTS `news_collection`;
CREATE TABLE `news_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `news_id` bigint(20) NOT NULL,
  `news_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `collection_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news_collection
-- ----------------------------

-- ----------------------------
-- Table structure for news_kinds_list
-- ----------------------------
DROP TABLE IF EXISTS `news_kinds_list`;
CREATE TABLE `news_kinds_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `news_kinds` bigint(20) NOT NULL COMMENT '新闻类别ID',
  `news_id` bigint(20) NOT NULL COMMENT '新闻ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新闻类别和新闻关联的表';

-- ----------------------------
-- Records of news_kinds_list
-- ----------------------------
INSERT INTO `news_kinds_list` VALUES ('1', '1', '11');
INSERT INTO `news_kinds_list` VALUES ('2', '2', '12');

-- ----------------------------
-- Table structure for news_list
-- ----------------------------
DROP TABLE IF EXISTS `news_list`;
CREATE TABLE `news_list` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '新闻信息表主键ID',
  `news_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '新闻标题',
  `news_author` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '信息作者亦或是新闻的编辑',
  `news_text` varchar(10000) COLLATE utf8_bin DEFAULT '' COMMENT '新闻正文',
  `news_url` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '转载第三方平台信息的新闻链接',
  `origin_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '新闻来源，其他平台转载或者是自己编辑',
  `date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `valid` int(11) DEFAULT '1' COMMENT '是否有效，就是是否被删除，这里删除采取逻辑删除',
  `image_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '新闻信息使用到的图片url地址',
  `news_kind` bigint(20) NOT NULL COMMENT '新闻信息的类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news_list
-- ----------------------------
INSERT INTO `news_list` VALUES ('1', 'asdasdasd', 'asdasd', '<p>123123123123123123123123123123</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('2', '234', '234', '<p>234234234234234234234</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('4', 'shishisis', 'shishisis', '<p>shishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisis</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('9', '上传功能将不能正常使用', '上传功能将不能正常使用', '<p>上传功能将不能正常使用上传功能将不能正常使用上传功能将不能正常使用上传功能将不能正常使用</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('10', '123345', '123345', '<p>123123345</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('11', '5555', '5555', '<p>555555555555555555555555</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '3');
INSERT INTO `news_list` VALUES ('12', '66666', '66666', '<p>6666666666666666666666666666666666666666</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(255) COLLATE utf8_bin NOT NULL,
  `valid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('30', '7678', '3452354', '1');
INSERT INTO `user` VALUES ('31', '767', 'ewrt', '0');
INSERT INTO `user` VALUES ('32', '7', '3452354', '1');
INSERT INTO `user` VALUES ('33', '7', '3452354', '1');
INSERT INTO `user` VALUES ('34', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('35', '12312', '3452354', '0');
INSERT INTO `user` VALUES ('36', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('37', 'ewr', '34tret', '1');
INSERT INTO `user` VALUES ('38', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('39', '12312', '3452354', '0');
INSERT INTO `user` VALUES ('40', '4567', '3452354', '1');
INSERT INTO `user` VALUES ('41', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('42', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('43', '67', '3452354', '1');
INSERT INTO `user` VALUES ('44', '12312', '3452354', '0');
INSERT INTO `user` VALUES ('45', '1231275', '3452354', '1');
INSERT INTO `user` VALUES ('46', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('47', '67', '3452354', '1');
INSERT INTO `user` VALUES ('48', '12312657', '3452354', '0');
INSERT INTO `user` VALUES ('49', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('50', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('51', '5678', '3452354', '1');
INSERT INTO `user` VALUES ('52', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('53', '123125678', '3452354', '0');
INSERT INTO `user` VALUES ('54', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('55', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('56', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('57', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('58', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('59', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('60', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('61', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('62', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('63', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('64', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('65', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('66', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('67', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('68', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('69', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('70', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('71', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('72', '12312', '3452354', '1');
INSERT INTO `user` VALUES ('73', '12312', '3452354', '1');

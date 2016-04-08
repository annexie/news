/*
Navicat MySQL Data Transfer

Source Server         : XuliugenDB
Source Server Version : 50627
Source Host           : 119.29.17.244:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-04-08 20:44:23
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
  `admin_role` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news_list
-- ----------------------------

-- ----------------------------
-- Table structure for news_type
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '类别名称',
  `type_desc` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news_type
-- ----------------------------

-- ----------------------------
-- Table structure for news_type_list
-- ----------------------------
DROP TABLE IF EXISTS `news_type_list`;
CREATE TABLE `news_type_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL COMMENT '新闻类别ID',
  `news_id` bigint(20) NOT NULL COMMENT '新闻ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新闻类别和新闻关联的表';

-- ----------------------------
-- Records of news_type_list
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(255) COLLATE utf8_bin NOT NULL,
  `valid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : ZhouKeRanDB
Source Server Version : 50627
Source Host           : 119.29.173.197:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-03-26 11:37:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news_list
-- ----------------------------
DROP TABLE IF EXISTS `news_list`;
CREATE TABLE `news_list` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '新闻信息表主键ID',
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '新闻标题',
  `author` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '信息作者亦或是新闻的编辑',
  `text` varchar(10000) COLLATE utf8_bin DEFAULT '' COMMENT '新闻正文',
  `url` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '转载第三方平台信息的新闻链接',
  `origin_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '新闻来源，其他平台转载或者是自己编辑',
  `date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `valid` int(11) DEFAULT '1' COMMENT '是否有效，就是是否被删除，这里删除采取逻辑删除',
  `image_url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '新闻信息使用到的图片url地址',
  `news_kind` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '新闻信息的类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news_list
-- ----------------------------

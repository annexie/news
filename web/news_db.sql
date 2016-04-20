/*
Navicat MySQL Data Transfer

Source Server         : XuliugenDB
Source Server Version : 50627
Source Host           : 119.29.17.244:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-04-20 19:24:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) COLLATE utf8_bin NOT NULL,
  `adminPassword` varchar(255) COLLATE utf8_bin NOT NULL,
  `adminRole` int(3) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123', '123', '1');
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
  `userId` bigint(20) NOT NULL,
  `newsId` bigint(20) NOT NULL,
  `newsTitle` varchar(255) COLLATE utf8_bin NOT NULL,
  `collectionDate` datetime NOT NULL,
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
  `newsKinds` bigint(20) NOT NULL COMMENT '新闻类别ID',
  `newsId` bigint(20) NOT NULL COMMENT '新闻ID',
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
  `newsTitle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '新闻标题',
  `newsAuthor` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '信息作者亦或是新闻的编辑',
  `newsText` varchar(10000) COLLATE utf8_bin DEFAULT '' COMMENT '新闻正文',
  `newsUrl` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '转载第三方平台信息的新闻链接',
  `originType` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '新闻来源，其他平台转载或者是自己编辑',
  `date` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `valid` int(11) DEFAULT '1' COMMENT '是否有效，就是是否被删除，这里删除采取逻辑删除',
  `imageUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '新闻信息使用到的图片url地址',
  `newsKind` bigint(20) NOT NULL COMMENT '新闻信息的类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news_list
-- ----------------------------
INSERT INTO `news_list` VALUES ('1', '3333', '3333', '<p>123123123123123123123123123123</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('2', '234', '234', '<p>234234234234234234234</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('4', 'shishisis', 'shishisis', '<p>shishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisisshishisis</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('9', '上传功能将不能正常使用', '上传功能将不能正常使用', '<p>上传功能将不能正常使用上传功能将不能正常使用上传功能将不能正常使用上传功能将不能正常使用</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('10', '123345', '123345', '<p>123123345</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('11', '5555', '5555', '<p>555555555555555555555555</p>', 'null', '1', '2016-04-13 00:00:00', '2016-04-13 00:00:00', '1', null, '3');
INSERT INTO `news_list` VALUES ('13', 'wrtyrety', 'erty', '<p>ertyretyerty</p>', 'null', '1', '2016-04-18 00:00:00', '2016-04-18 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('14', '123123', '123', '<p>123123</p>', 'null', '1', '2016-04-19 00:00:00', '2016-04-19 00:00:00', '1', null, '2');
INSERT INTO `news_list` VALUES ('15', '2354325', '2354235423', '<p>523542354235</p>', 'null', '1', '2016-04-19 00:00:00', '2016-04-19 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('16', '2354325', '2354235423', '<p>523542354235</p>', 'null', '1', '2016-04-19 00:00:00', '2016-04-19 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('17', '2354325', '2354235423', '<p>523542354235</p>', 'null', '1', '2016-04-19 00:00:00', '2016-04-19 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('18', '看见爱上了对方空间哈市的反', '请问', '<p>去玩儿去玩 &nbsp; &nbsp; &nbsp; 玩儿去玩儿儿去玩儿去玩儿全文 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p>', 'null', '1', '2016-04-19 00:00:00', '2016-04-19 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('19', '23542354', '324523', '<p>5423542352354</p>', 'null', '1', '2016-04-19 00:00:00', '2016-04-19 00:00:00', '1', null, '1');
INSERT INTO `news_list` VALUES ('20', '245623', '23542354', '<p>5423542352354</p>', 'null', '1', '2016-04-19 14:10:42', '2016-04-19 14:10:45', '1', null, '1');
INSERT INTO `news_list` VALUES ('21', '34565', '56785678', '<p>5423542352354</p>', 'null', '1', '2016-04-19 14:11:09', '2016-04-19 14:11:12', '1', null, '1');
INSERT INTO `news_list` VALUES ('22', '235', '42354', '<p>5423542352354</p>', 'null', '1', '2016-04-20 14:59:11', '2016-04-20 14:59:17', '1', null, '1');
INSERT INTO `news_list` VALUES ('23', '111111111111111', '111111111111111', '111111111111111', 'null', '1', '2016-04-20 16:48:08', '2016-04-20 16:48:11', '1', null, '1');
INSERT INTO `news_list` VALUES ('24', '', '111111111111111', '111111111111111', 'null', '1', '2016-04-20 17:23:12', '2016-04-20 17:23:14', '1', null, '1');
INSERT INTO `news_list` VALUES ('26', '客户端展示新闻信息', '徐刘根', '<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>客户端展示新闻信息</p></li><li><p>测试的数据格式是否显示正确</p></li><li><p>测试的数据格式是否显示正确</p></li></ol><p><br/></p><p><strong>测试的数据格式是否显示正确</strong></p><p><strong><br/></strong></p><p><strong><a href=\"http://img3.imgtn.bdimg.com/it/u=3663721447,3371509752&fm=21&gp=0.jpg\" _src=\"http://img3.imgtn.bdimg.com/it/u=3663721447,3371509752&fm=21&gp=0.jpg\">http://img3.imgtn.bdimg.com/it/u=3663721447,3371509752&amp;fm=21&amp;gp=0.jpg</a> </strong></p><p><br/></p><p><br/></p>', 'null', '1', '2016-04-20 00:00:00', '2016-04-20 00:00:00', '1', null, '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) COLLATE utf8_bin NOT NULL,
  `userPassword` varchar(255) COLLATE utf8_bin NOT NULL,
  `valid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('31', '767', 'ewrt', '0');
INSERT INTO `user` VALUES ('32', '7', '3452354', '1');
INSERT INTO `user` VALUES ('88', '让他一人一', '890', '1');
INSERT INTO `user` VALUES ('89', '让他一人一', '890', '1');
INSERT INTO `user` VALUES ('90', '345345', '345345', '1');
INSERT INTO `user` VALUES ('91', '456', '456', '1');
INSERT INTO `user` VALUES ('92', '456', '456', '1');
INSERT INTO `user` VALUES ('93', '', '', '1');
INSERT INTO `user` VALUES ('94', '456', '456', '1');
INSERT INTO `user` VALUES ('95', '567', '567', '1');
INSERT INTO `user` VALUES ('96', '547', '678', '1');
INSERT INTO `user` VALUES ('132', '123', '123', '1');
INSERT INTO `user` VALUES ('133', '123123', '123456', '1');
INSERT INTO `user` VALUES ('134', '123', '123', '1');

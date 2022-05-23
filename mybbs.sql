/*
Navicat MySQL Data Transfer

Source Server         : Admin
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : mybbs

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2021-07-07 22:59:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_board`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_board`;
CREATE TABLE `tbl_board` (
  `boardId` int(11) NOT NULL AUTO_INCREMENT,
  `boardName` varchar(20) NOT NULL,
  PRIMARY KEY (`boardId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_board
-- ----------------------------
INSERT INTO `tbl_board` VALUES ('1', '娱乐一');
INSERT INTO `tbl_board` VALUES ('2', '娱乐二');
INSERT INTO `tbl_board` VALUES ('3', '新闻一');

-- ----------------------------
-- Table structure for `tbl_topic`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_topic`;
CREATE TABLE `tbl_topic` (
  `topidId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `publishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uId` int(11) NOT NULL,
  `boardId` int(11) NOT NULL,
  PRIMARY KEY (`topidId`),
  KEY `uId` (`uId`),
  KEY `boardId` (`boardId`),
  CONSTRAINT `tbl_topic_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `tbl_user` (`uId`) ON DELETE CASCADE,
  CONSTRAINT `tbl_topic_ibfk_2` FOREIGN KEY (`boardId`) REFERENCES `tbl_board` (`boardId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_topic
-- ----------------------------
INSERT INTO `tbl_topic` VALUES ('1', 'hello', 'Java is one of the best language in the world!!!', '2021-05-30 13:49:31', '2021-05-30 13:49:31', '1', '2');
INSERT INTO `tbl_topic` VALUES ('3', '123', 'one', '2021-06-23 19:53:45', '2021-06-23 19:53:45', '1', '1');
INSERT INTO `tbl_topic` VALUES ('4', 'test', 'this is a test!', '2021-06-23 20:30:01', '2021-06-23 20:30:01', '1', '1');
INSERT INTO `tbl_topic` VALUES ('5', '345', '12', '2021-06-23 21:11:50', '2021-06-23 21:11:50', '1', '2');
INSERT INTO `tbl_topic` VALUES ('6', '1231', '1231231', '2021-06-24 15:39:28', '2021-06-24 15:39:28', '1', '1');
INSERT INTO `tbl_topic` VALUES ('7', 'aaa', 'test AA', '2021-07-03 22:31:59', '2021-07-03 22:31:59', '1', '1');
INSERT INTO `tbl_topic` VALUES ('8', '去微软', '奇热网', '2021-07-06 12:13:26', '2021-07-06 12:13:16', '1', '2');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(20) NOT NULL,
  `uPass` varchar(20) NOT NULL,
  `gender` int(1) NOT NULL,
  `head` varchar(255) DEFAULT NULL,
  `regTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uId`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'admin', '123', '1', '', '2021-05-30 13:35:31');
INSERT INTO `tbl_user` VALUES ('4', '456', '123', '1', null, '2021-06-24 15:38:50');

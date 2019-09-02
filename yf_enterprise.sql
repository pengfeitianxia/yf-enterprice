/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : yf_enterprise

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2019-09-02 08:48:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` varchar(32) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `purchase_price` decimal(18,2) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `state` char(2) NOT NULL DEFAULT '0' COMMENT '0 未卖出  1 已卖出',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for book_history
-- ----------------------------
DROP TABLE IF EXISTS `book_history`;
CREATE TABLE `book_history` (
  `id` varchar(32) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `purchase_price` decimal(18,2) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `state` char(2) NOT NULL DEFAULT '0' COMMENT '0 未卖出  1 已卖出',
  `operater` varchar(10) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for consumption_record
-- ----------------------------
DROP TABLE IF EXISTS `consumption_record`;
CREATE TABLE `consumption_record` (
  `id` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  `consumption_amount` decimal(18,2) NOT NULL COMMENT '消费金额',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `id` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  `amount` decimal(18,2) NOT NULL COMMENT '充值金额',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for set_consumption_amount
-- ----------------------------
DROP TABLE IF EXISTS `set_consumption_amount`;
CREATE TABLE `set_consumption_amount` (
  `id` varchar(32) NOT NULL,
  `set_amount` decimal(18,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for set_consumption_amount_history
-- ----------------------------
DROP TABLE IF EXISTS `set_consumption_amount_history`;
CREATE TABLE `set_consumption_amount_history` (
  `id` varchar(32) NOT NULL,
  `set_amount` decimal(18,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` char(2) DEFAULT '0' COMMENT '0 女  1男',
  `birthday` datetime DEFAULT NULL,
  `remain_amount` decimal(18,2) DEFAULT NULL COMMENT '剩余金额',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

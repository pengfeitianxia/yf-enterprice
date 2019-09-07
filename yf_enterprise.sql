/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : 127.0.0.1:3306
 Source Schema         : yf_enterprise

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 07/09/2019 18:14:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bk_book_info
-- ----------------------------
DROP TABLE IF EXISTS `bk_book_info`;
CREATE TABLE `bk_book_info` (
  `book_id` varchar(32) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `purchase_price` decimal(18,2) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `state` char(2) NOT NULL DEFAULT '0' COMMENT '0 未卖出  1 已卖出  2 借出',
  `modify_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for p_consumption_record
-- ----------------------------
DROP TABLE IF EXISTS `p_consumption_record`;
CREATE TABLE `p_consumption_record` (
  `id` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  `consumption_amount` decimal(18,2) NOT NULL COMMENT '消费金额',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for p_recharge
-- ----------------------------
DROP TABLE IF EXISTS `p_recharge`;
CREATE TABLE `p_recharge` (
  `id` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  `amount` decimal(18,2) NOT NULL COMMENT '充值金额',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for p_set_consumption_amount
-- ----------------------------
DROP TABLE IF EXISTS `p_set_consumption_amount`;
CREATE TABLE `p_set_consumption_amount` (
  `id` varchar(32) NOT NULL,
  `set_amount` decimal(18,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for p_set_consumption_amount_history
-- ----------------------------
DROP TABLE IF EXISTS `p_set_consumption_amount_history`;
CREATE TABLE `p_set_consumption_amount_history` (
  `id` varchar(32) NOT NULL,
  `set_amount` decimal(18,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for p_user
-- ----------------------------
DROP TABLE IF EXISTS `p_user`;
CREATE TABLE `p_user` (
  `userId` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` char(2) DEFAULT '0' COMMENT '0 女  1男',
  `birthday` datetime DEFAULT NULL,
  `remain_amount` decimal(18,2) DEFAULT NULL COMMENT '剩余金额',
  `memo` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

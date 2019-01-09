/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : medicine_manager

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2014-05-13 23:34:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` text,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '感冒用药', '主治感冒、发烧、头痛。', '2009-06-10 08:41:25');
INSERT INTO `tb_category` VALUES ('2', '胃肠用药', '胃炎、肠炎专用药。', '2009-06-10 08:41:25');
INSERT INTO `tb_category` VALUES ('3', '儿童用药', '慎用，儿童用药。', '2009-06-10 08:41:25');
INSERT INTO `tb_category` VALUES ('4', '感冒用药', '主治感冒、发烧、头痛。', '2014-05-04 22:28:34');
INSERT INTO `tb_category` VALUES ('5', '胃肠用药', '胃炎、肠炎专用药。', '2014-05-04 22:28:34');
INSERT INTO `tb_category` VALUES ('6', '儿童用药', '慎用，儿童用药。', '2014-05-04 22:28:34');

-- ----------------------------
-- Table structure for `tb_customer_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_info`;
CREATE TABLE `tb_customer_info` (
  `id` int(11) NOT NULL auto_increment,
  `customerno` varchar(20) NOT NULL,
  `customername` varchar(50) NOT NULL,
  `contactperson` varchar(20) NOT NULL,
  `contacttel` varchar(50) NOT NULL,
  `contactaddress` varchar(200) NOT NULL,
  `remark` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_medicine`
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicine`;
CREATE TABLE `tb_medicine` (
  `id` int(11) NOT NULL auto_increment,
  `medNo` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `factoryAdd` varchar(200) default NULL,
  `description` text,
  `price` double NOT NULL,
  `medCount` int(11) default NULL,
  `reqCount` int(11) default NULL,
  `photoPath` varchar(255) default NULL,
  `categoryId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `medNo` (`medNo`),
  KEY `FKCB73D4EB903B65EB` (`categoryId`),
  CONSTRAINT `FKCB73D4EB903B65EB` FOREIGN KEY (`categoryId`) REFERENCES `tb_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicine
-- ----------------------------
INSERT INTO `tb_medicine` VALUES ('1', 'abc001', '感冒胶囊A', '制药一厂', '效果很好', '2.5', '3', '0', null, '4');
INSERT INTO `tb_medicine` VALUES ('2', 'abc002', '感冒胶囊B', '制药一厂', '治疗伤风、头痛效果很好', '10.05', '10', '0', null, '4');
INSERT INTO `tb_medicine` VALUES ('3', 'abc003', 'xx肠炎灵', '制药二厂', '主治拉肚子', '5.8', '100', '0', null, '5');
INSERT INTO `tb_medicine` VALUES ('4', 'abc004', '小儿感冒冲剂', '制药三厂', '效果很好', '5.8', '100', '0', null, '6');

-- ----------------------------
-- Table structure for `tb_selldetail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_selldetail`;
CREATE TABLE `tb_selldetail` (
  `id` int(11) NOT NULL auto_increment,
  `sellName` varchar(200) NOT NULL,
  `sellPrice` double NOT NULL,
  `sellCount` int(11) NOT NULL,
  `sellTime` datetime NOT NULL,
  `medid` int(11) default NULL,
  `userid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK56C63894CBEB8E45` (`userid`),
  KEY `FK56C638941070EC75` (`medid`),
  CONSTRAINT `FK56C638941070EC75` FOREIGN KEY (`medid`) REFERENCES `tb_medicine` (`id`),
  CONSTRAINT `FK56C63894CBEB8E45` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_selldetail
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_supplier_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_supplier_info`;
CREATE TABLE `tb_supplier_info` (
  `remark` varchar(500) NOT NULL,
  `contactAddress` varchar(200) NOT NULL,
  `contactTel` varchar(50) NOT NULL,
  `contactPerson` varchar(20) NOT NULL,
  `supplierName` varchar(50) NOT NULL,
  `supplierNo` varchar(20) NOT NULL,
  `id` int(20) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_supplier_info
-- ----------------------------
INSERT INTO `tb_supplier_info` VALUES ('5555', '22', '44', '11', '33', '11', '1');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', '123', '2014-05-04 22:28:34');

/*
Navicat MySQL Data Transfer

Source Server         : chenyanan
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : youeryuan

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-06-06 11:57:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `provinces`
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('1', '0', '中国', '0');
INSERT INTO `provinces` VALUES ('2', '1', '北京', '1');
INSERT INTO `provinces` VALUES ('3', '1', '安徽', '1');
INSERT INTO `provinces` VALUES ('4', '1', '福建', '1');
INSERT INTO `provinces` VALUES ('5', '1', '甘肃', '1');
INSERT INTO `provinces` VALUES ('6', '1', '广东', '1');
INSERT INTO `provinces` VALUES ('7', '1', '广西', '1');
INSERT INTO `provinces` VALUES ('8', '1', '贵州', '1');
INSERT INTO `provinces` VALUES ('9', '1', '海南', '1');
INSERT INTO `provinces` VALUES ('10', '1', '河北', '1');
INSERT INTO `provinces` VALUES ('11', '1', '河南', '1');
INSERT INTO `provinces` VALUES ('12', '1', '黑龙江', '1');
INSERT INTO `provinces` VALUES ('13', '1', '湖北', '1');
INSERT INTO `provinces` VALUES ('14', '1', '湖南', '1');
INSERT INTO `provinces` VALUES ('15', '1', '吉林', '1');
INSERT INTO `provinces` VALUES ('16', '1', '江苏', '1');
INSERT INTO `provinces` VALUES ('17', '1', '江西', '1');
INSERT INTO `provinces` VALUES ('18', '1', '辽宁', '1');
INSERT INTO `provinces` VALUES ('19', '1', '内蒙古', '1');
INSERT INTO `provinces` VALUES ('20', '1', '宁夏', '1');
INSERT INTO `provinces` VALUES ('21', '1', '青海', '1');
INSERT INTO `provinces` VALUES ('22', '1', '山东', '1');
INSERT INTO `provinces` VALUES ('23', '1', '山西', '1');
INSERT INTO `provinces` VALUES ('24', '1', '陕西', '1');
INSERT INTO `provinces` VALUES ('25', '1', '上海', '1');
INSERT INTO `provinces` VALUES ('26', '1', '四川', '1');
INSERT INTO `provinces` VALUES ('27', '1', '天津', '1');
INSERT INTO `provinces` VALUES ('28', '1', '西藏', '1');
INSERT INTO `provinces` VALUES ('29', '1', '新疆', '1');
INSERT INTO `provinces` VALUES ('30', '1', '云南', '1');
INSERT INTO `provinces` VALUES ('31', '1', '浙江', '1');
INSERT INTO `provinces` VALUES ('32', '1', '重庆', '1');
INSERT INTO `provinces` VALUES ('33', '1', '香港', '1');
INSERT INTO `provinces` VALUES ('34', '1', '澳门', '1');
INSERT INTO `provinces` VALUES ('35', '1', '台湾', '1');
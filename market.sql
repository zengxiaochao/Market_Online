/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云admin
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : rm-bp125gx407ay536yulo.mysql.rds.aliyuncs.com:3306
 Source Schema         : market

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/06/2020 14:13:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `price` double(255, 2) DEFAULT NULL COMMENT '价格',
  `num` int(255) DEFAULT NULL COMMENT '库存',
  `sales` int(255) DEFAULT NULL COMMENT '销量',
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `details_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情',
  `details_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情图',
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规格',
  `goods_id` int(11) DEFAULT NULL COMMENT '编号',
  `goods_deleted` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否删除0未删除，1已删除',
  PRIMARY KEY (`goods_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('卫龙', 2.00, 333, 545, './image/卫龙.jpg', '非常好吃的辣条', './image/卫龙details.jpg', '100g/1包', 1, '0');
INSERT INTO `goods` VALUES ('可口可乐', 2.50, 252, 85, './image/可口可乐.jpg', '非常好喝的可乐', './image/可口可乐details.jpg', '180ml/1瓶', 2, '0');
INSERT INTO `goods` VALUES ('好丽友派', 39.99, 120, 5, './image/好丽友派.jpg', '非常贵的零食', './image/好丽友派details.jpg', '300g/1盒', 3, '0');
INSERT INTO `goods` VALUES ('旺仔牛奶', 2.50, 80, 120, './image/旺仔牛奶.jpg', '小明专属', './image/旺仔牛奶details.jpg', '100ml/1盒', 4, '0');
INSERT INTO `goods` VALUES ('百事可乐', 2.50, 72, 69, './image/百事可乐.jpg', '非常好喝的可乐', './image/百事可乐details.jpg', '180ml/1瓶', 5, '0');
INSERT INTO `goods` VALUES ('脉动', 4.00, 132, 13, './image/脉动.jpg', '非常好喝的脉动', './image/脉动details.jpg', '180ml/1瓶', 6, '0');
INSERT INTO `goods` VALUES ('薯片', 3.00, 728, 33, './image/薯片.jpg', '非常好吃的薯片', './image/薯片details.jpg', '100g/1包', 7, '0');
INSERT INTO `goods` VALUES ('雪碧', 2.50, 54, 75, './image/雪碧.jpg', '非常好喝的雪碧', './image/雪碧details.jpg', '180ml/1瓶', 8, '0');
INSERT INTO `goods` VALUES ('鲜果橙', 3.50, 33, 142, './image/鲜果橙.jpg', '非常好喝的鲜果橙', './image/鲜果橙details.jpg', '180ml/1瓶', 9, '0');

-- ----------------------------
-- Table structure for imf
-- ----------------------------
DROP TABLE IF EXISTS `imf`;
CREATE TABLE `imf`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address_who` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imf
-- ----------------------------
INSERT INTO `imf` VALUES ('admin', '熊出没大森林', '178666666666', '狗熊岭 李家镇 53幢6单元', '光头强');
INSERT INTO `imf` VALUES ('zfc', '山东烟台', '178666666666', '山东烟台莱山烟台大学南校', '巴戈大魔王');
INSERT INTO `imf` VALUES ('blc', '山东烟台', '178666666666', '山东烟台莱山烟台大学北校', '汤姆');
INSERT INTO `imf` VALUES ('mjn', '山东烟台', '178666666666', '烟台大学家属院北区', '阿酷');
INSERT INTO `imf` VALUES ('wgh', '山东烟台', '178666666666', '山东省烟台市烟台大学', '喜羊羊');
INSERT INTO `imf` VALUES ('aaa', '山东烟台', '178666666666', '山东省烟台市烟台大学', '123');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent`  (
  `indent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_address_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address_who` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`indent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('1591847460927', '2020-06-11 11:51:00', '239.94', '好丽友派 卫龙 雪碧 鲜果橙', 'admin', '熊出没大森林', '狗熊岭 李家镇 53幢6单元', '17616155555', '光头强', '1 32 6 8');
INSERT INTO `indent` VALUES ('1591847504747', '2020-06-11 11:51:44', '14.0', '卫龙 好丽友派 脉动 薯片 旺仔牛奶', 'admin', '熊出没大森林', '狗熊岭 李家镇 53幢6单元', '17616155555', '光头强', '3 6 5 7 9');
INSERT INTO `indent` VALUES ('1591934334094', '2020-06-12 11:58:54', '20.0', '脉动', 'admin', '熊出没大森林', '狗熊岭 李家镇 53幢6单元', '17616155555', '光头强', '5');
INSERT INTO `indent` VALUES ('1591935469965', '2020-06-12 12:17:49', '159.96', '好丽友派', 'blc', '山东烟台', '山东烟台莱山烟台大学北校', '17666666666', '汤姆', '4');
INSERT INTO `indent` VALUES ('1591939954568', '2020-06-12 13:32:34', '10.0', '旺仔牛奶', 'admin', '熊出没大森林', '狗熊岭 李家镇 53幢6单元', '17616155555', '光头强', '4');
INSERT INTO `indent` VALUES ('1591940031541', '2020-06-12 13:33:51', '9.0', '薯片', 'wgh', '山东烟台', '山东省烟台市烟台大学', '17616155615', '喜羊羊', '3');
INSERT INTO `indent` VALUES ('1591940305579', '2020-06-12 13:38:25', '2.0', '卫龙', 'admin', '熊出没大森林', '狗熊岭 李家镇 53幢6单元', '17616155555', '光头强', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '123456', 1);
INSERT INTO `user` VALUES ('zfc', '123456', 2);
INSERT INTO `user` VALUES ('blc', '123456', 3);
INSERT INTO `user` VALUES ('mjn', '123456', 4);
INSERT INTO `user` VALUES ('wgh', '123456', 8);
INSERT INTO `user` VALUES ('aaa', '123', 9);

SET FOREIGN_KEY_CHECKS = 1;

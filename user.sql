/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017 (8.0.17)
 Source Host           : localhost:3306
 Source Schema         : user

 Target Server Type    : MySQL
 Target Server Version : 80017 (8.0.17)
 File Encoding         : 65001

 Date: 13/06/2025 23:20:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cartid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (4, 3, 20, 22323);
INSERT INTO `cart` VALUES (5, 3, 21, 23);
INSERT INTO `cart` VALUES (6, 3, 20, 1);
INSERT INTO `cart` VALUES (7, 3, 20, 1);
INSERT INTO `cart` VALUES (8, 3, 20, 1);
INSERT INTO `cart` VALUES (9, 3, 20, 1);
INSERT INTO `cart` VALUES (10, 3, 20, 1);
INSERT INTO `cart` VALUES (11, 3, 20, 1);
INSERT INTO `cart` VALUES (13, 3, 20, 1);
INSERT INTO `cart` VALUES (14, 3, 20, 1);
INSERT INTO `cart` VALUES (34, 3, 22, 1);
INSERT INTO `cart` VALUES (35, 3, 24, 1);
INSERT INTO `cart` VALUES (36, 3, 23, 1);
INSERT INTO `cart` VALUES (37, 3, 32, 1);
INSERT INTO `cart` VALUES (38, 3, 33, 5);
INSERT INTO `cart` VALUES (39, 3, 29, 1);
INSERT INTO `cart` VALUES (40, 3, 22, 1);
INSERT INTO `cart` VALUES (41, 3, 22, 1);
INSERT INTO `cart` VALUES (42, 3, 22, 1);
INSERT INTO `cart` VALUES (44, 3, 35, 5);
INSERT INTO `cart` VALUES (45, 7, 35, 100);
INSERT INTO `cart` VALUES (46, 7, 44, 1);
INSERT INTO `cart` VALUES (47, 7, 40, 1);
INSERT INTO `cart` VALUES (48, 7, 45, 1);
INSERT INTO `cart` VALUES (49, 7, 35, 100);
INSERT INTO `cart` VALUES (50, 7, 35, 1);
INSERT INTO `cart` VALUES (51, 7, 43, 1);
INSERT INTO `cart` VALUES (52, 7, 45, 1);
INSERT INTO `cart` VALUES (53, 7, 41, 1);
INSERT INTO `cart` VALUES (54, 7, 35, 1);
INSERT INTO `cart` VALUES (55, 9, 49, 1);
INSERT INTO `cart` VALUES (56, 9, 50, 1);
INSERT INTO `cart` VALUES (57, 9, 52, 1);
INSERT INTO `cart` VALUES (58, 9, 51, 1);
INSERT INTO `cart` VALUES (59, 9, 55, 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for hot_products
-- ----------------------------
DROP TABLE IF EXISTS `hot_products`;
CREATE TABLE `hot_products`  (
  `productId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hot_products
-- ----------------------------
INSERT INTO `hot_products` VALUES ('49');
INSERT INTO `hot_products` VALUES ('50');
INSERT INTO `hot_products` VALUES ('58');

-- ----------------------------
-- Table structure for naifenseries_products
-- ----------------------------
DROP TABLE IF EXISTS `naifenseries_products`;
CREATE TABLE `naifenseries_products`  (
  `productId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of naifenseries_products
-- ----------------------------
INSERT INTO `naifenseries_products` VALUES ('40');
INSERT INTO `naifenseries_products` VALUES ('47');
INSERT INTO `naifenseries_products` VALUES ('48');
INSERT INTO `naifenseries_products` VALUES ('49');
INSERT INTO `naifenseries_products` VALUES ('50');

-- ----------------------------
-- Table structure for new_products
-- ----------------------------
DROP TABLE IF EXISTS `new_products`;
CREATE TABLE `new_products`  (
  `productId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_products
-- ----------------------------
INSERT INTO `new_products` VALUES ('49');
INSERT INTO `new_products` VALUES ('50');
INSERT INTO `new_products` VALUES ('53');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `orderdetailid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderdetailid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL,
  `totalamount` decimal(10, 2) NOT NULL,
  `orderstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shippingaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `stock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imagepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descrition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`productid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (49, '奶粉', 188.00, '1000', 'nai5.jpg', '营养好');
INSERT INTO `product` VALUES (50, '奶粉', 1500.00, '1000', 'nai3.jpg', '营养高');
INSERT INTO `product` VALUES (51, '奶嘴', 1500.00, '1000', 'nai1.jpg', '质量好');
INSERT INTO `product` VALUES (52, '杯子', 1500.00, '1000', 'nai2.jpg', '颜色显眼');
INSERT INTO `product` VALUES (53, '奶瓶', 1500.00, '1000', 'nai4.jpg', '质量好');
INSERT INTO `product` VALUES (54, '奶瓶', 1500.00, '1000', 'nai6.jpg', '质量好');
INSERT INTO `product` VALUES (55, '玩具', 1500.00, '1000', 'wan1.jpg', '质量好');
INSERT INTO `product` VALUES (56, '玩具', 1500.00, '1000', 'wan2.jpg', '质量好');
INSERT INTO `product` VALUES (57, '纸尿裤', 1500.00, '1000', 'zhi1.jpg', '质量好');
INSERT INTO `product` VALUES (58, '纸尿裤', 1500.00, '1000', 'zhi2.jpg', '质量好');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isAdmin` tinyint(4) NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for wanjuseries_products
-- ----------------------------
DROP TABLE IF EXISTS `wanjuseries_products`;
CREATE TABLE `wanjuseries_products`  (
  `productId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wanjuseries_products
-- ----------------------------
INSERT INTO `wanjuseries_products` VALUES ('41');
INSERT INTO `wanjuseries_products` VALUES ('42');
INSERT INTO `wanjuseries_products` VALUES ('43');
INSERT INTO `wanjuseries_products` VALUES ('44');
INSERT INTO `wanjuseries_products` VALUES ('55');
INSERT INTO `wanjuseries_products` VALUES ('56');

-- ----------------------------
-- Table structure for weiyangseries_products
-- ----------------------------
DROP TABLE IF EXISTS `weiyangseries_products`;
CREATE TABLE `weiyangseries_products`  (
  `productId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of weiyangseries_products
-- ----------------------------
INSERT INTO `weiyangseries_products` VALUES ('40');
INSERT INTO `weiyangseries_products` VALUES ('44');
INSERT INTO `weiyangseries_products` VALUES ('45');
INSERT INTO `weiyangseries_products` VALUES ('46');
INSERT INTO `weiyangseries_products` VALUES ('51');
INSERT INTO `weiyangseries_products` VALUES ('52');
INSERT INTO `weiyangseries_products` VALUES ('53');
INSERT INTO `weiyangseries_products` VALUES ('54');

-- ----------------------------
-- Table structure for zhiniaokuseries_products
-- ----------------------------
DROP TABLE IF EXISTS `zhiniaokuseries_products`;
CREATE TABLE `zhiniaokuseries_products`  (
  `productId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of zhiniaokuseries_products
-- ----------------------------
INSERT INTO `zhiniaokuseries_products` VALUES ('35');
INSERT INTO `zhiniaokuseries_products` VALUES ('36');
INSERT INTO `zhiniaokuseries_products` VALUES ('37');
INSERT INTO `zhiniaokuseries_products` VALUES ('38');
INSERT INTO `zhiniaokuseries_products` VALUES ('39');
INSERT INTO `zhiniaokuseries_products` VALUES ('57');
INSERT INTO `zhiniaokuseries_products` VALUES ('58');

SET FOREIGN_KEY_CHECKS = 1;

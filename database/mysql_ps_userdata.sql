/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : ps_userdata

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 28/04/2024 20:04:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users_detail
-- ----------------------------
DROP TABLE IF EXISTS `users_detail`;
CREATE TABLE `users_detail`  (
  `UserID` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UserUID` int(11) NOT NULL,
  `UserName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SocialNo1` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SocialNo2` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PwQuestion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PwAnswer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PostNo` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Addr1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Addr2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Phone1` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Phone2` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Phone3` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Mobile1` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Mobile2` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Mobile3` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NewsLetter` tinyint(4) NULL DEFAULT NULL,
  `Sms` tinyint(4) NULL DEFAULT NULL,
  `AdultAuth` tinyint(4) NULL DEFAULT NULL,
  `AdultAuthDate` datetime(0) NULL DEFAULT NULL,
  `EmailAuth` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EmailAuthKey` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Job` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JobNo` tinyint(4) NULL DEFAULT NULL,
  `LocalNo` tinyint(4) NULL DEFAULT NULL,
  `PwQuNo` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`UserUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_detail
-- ----------------------------
INSERT INTO `users_detail` VALUES ('admin', 1, NULL, NULL, NULL, '', NULL, 'ledinhloi1997@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_detail` VALUES ('loi', 2, NULL, NULL, NULL, '', NULL, 'a@b.c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users_detail` VALUES ('loi2', 18, NULL, NULL, NULL, NULL, NULL, 'a@b.cd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users_master
-- ----------------------------
DROP TABLE IF EXISTS `users_master`;
CREATE TABLE `users_master`  (
  `UserUID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Pw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JoinDate` datetime(0) NOT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT 0,
  `AdminLevel` int(4) NOT NULL DEFAULT 0,
  `UseQueue` tinyint(4) NOT NULL DEFAULT 0,
  `Status` smallint(6) NOT NULL DEFAULT 16,
  `Leave` tinyint(4) NOT NULL DEFAULT 0,
  `UserType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'U',
  `UserIp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Point` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`UserUID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_master
-- ----------------------------
INSERT INTO `users_master` VALUES (1, 'admin', 'admin123', '2021-05-04 15:41:00', 1, 255, 0, 16, 0, 'A', NULL, 0);
INSERT INTO `users_master` VALUES (2, 'loi', '12345689', '2021-05-05 18:30:00', 0, 0, 0, 16, 0, 'U', '127.0.0.1', 0);
INSERT INTO `users_master` VALUES (18, 'loi2', '12345689', '2024-04-28 12:26:38', 0, 0, 0, 16, 0, 'U', '127.0.0.1', 0);

SET FOREIGN_KEY_CHECKS = 1;

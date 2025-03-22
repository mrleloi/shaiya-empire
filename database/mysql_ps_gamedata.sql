/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : ps_gamedata

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 28/04/2024 20:04:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _createdchars
-- ----------------------------
DROP TABLE IF EXISTS `_createdchars`;
CREATE TABLE `_createdchars`  (
  `RowID` int(11) NOT NULL,
  `ServerID` tinyint(4) NOT NULL,
  `UserID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CharID` int(11) NOT NULL,
  `CharName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Family` tinyint(4) NOT NULL,
  `CreateDate` datetime(0) NOT NULL,
  `UserUID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`RowID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _deletedchars
-- ----------------------------
DROP TABLE IF EXISTS `_deletedchars`;
CREATE TABLE `_deletedchars`  (
  `RowID` int(11) NOT NULL,
  `ServerID` tinyint(4) NOT NULL,
  `CharID` int(11) NOT NULL,
  `DeleteDate` datetime(0) NOT NULL,
  PRIMARY KEY (`RowID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _guilddetailsback
-- ----------------------------
DROP TABLE IF EXISTS `_guilddetailsback`;
CREATE TABLE `_guilddetailsback`  (
  `GuildID` int(11) NOT NULL,
  `UseHouse` tinyint(4) NOT NULL,
  `BuyHouse` tinyint(4) NOT NULL,
  `Rank` tinyint(4) NOT NULL,
  `Etin` int(11) NOT NULL,
  `EtinReturnCnt` int(11) NOT NULL,
  `KeepEtin` int(11) NOT NULL,
  `Remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _guildrankpoint
-- ----------------------------
DROP TABLE IF EXISTS `_guildrankpoint`;
CREATE TABLE `_guildrankpoint`  (
  `GuildID` int(11) NOT NULL,
  `GuildPoint` int(11) NOT NULL,
  PRIMARY KEY (`GuildID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _guildsback
-- ----------------------------
DROP TABLE IF EXISTS `_guildsback`;
CREATE TABLE `_guildsback`  (
  `RowID` int(11) NOT NULL,
  `GuildID` int(11) NOT NULL,
  `GuildName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MasterUserID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MasterCharID` int(11) NOT NULL,
  `MasterName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Country` tinyint(4) NOT NULL,
  `TotalCount` smallint(6) NOT NULL,
  `GuildPoint` int(11) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  `CreateDate` datetime(0) NOT NULL,
  `DeleteDate` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banchars
-- ----------------------------
DROP TABLE IF EXISTS `banchars`;
CREATE TABLE `banchars`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `BanID` int(11) NOT NULL,
  `BanName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BanDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`CharID`, `BanID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charapplyskills
-- ----------------------------
DROP TABLE IF EXISTS `charapplyskills`;
CREATE TABLE `charapplyskills`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `SkillID` smallint(6) NOT NULL,
  `SkillLevel` tinyint(4) NOT NULL,
  `LeftResetTime` int(11) NOT NULL,
  PRIMARY KEY (`CharID`, `SkillID`, `SkillLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of charapplyskills
-- ----------------------------
INSERT INTO `charapplyskills` VALUES (3, 6, 139, 1, 1160);
INSERT INTO `charapplyskills` VALUES (4, 6, 266, 1, 10268);
INSERT INTO `charapplyskills` VALUES (504, 7, 201, 1, 10766);
INSERT INTO `charapplyskills` VALUES (503, 7, 202, 1, 10014);
INSERT INTO `charapplyskills` VALUES (502, 7, 210, 1, 2405);
INSERT INTO `charapplyskills` VALUES (501, 7, 211, 1, 2340);
INSERT INTO `charapplyskills` VALUES (499, 7, 233, 1, 1055554);
INSERT INTO `charapplyskills` VALUES (500, 7, 266, 1, 5661);
INSERT INTO `charapplyskills` VALUES (476, 8, 226, 1, 528940);
INSERT INTO `charapplyskills` VALUES (477, 8, 233, 1, 2518436);
INSERT INTO `charapplyskills` VALUES (478, 8, 234, 1, 2518343);
INSERT INTO `charapplyskills` VALUES (479, 8, 236, 1, 2518302);
INSERT INTO `charapplyskills` VALUES (480, 8, 248, 1, 223);
INSERT INTO `charapplyskills` VALUES (481, 8, 250, 2, 8178);
INSERT INTO `charapplyskills` VALUES (482, 8, 252, 1, 11251);
INSERT INTO `charapplyskills` VALUES (483, 8, 255, 1, 11837);
INSERT INTO `charapplyskills` VALUES (484, 8, 271, 1, 10324);
INSERT INTO `charapplyskills` VALUES (485, 8, 286, 3, 2515344);

-- ----------------------------
-- Table structure for charbacks
-- ----------------------------
DROP TABLE IF EXISTS `charbacks`;
CREATE TABLE `charbacks`  (
  `ServerID` tinyint(4) NOT NULL,
  `UserID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UserUID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `CharName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `New` tinyint(4) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  `Slot` tinyint(4) NOT NULL,
  `Family` tinyint(4) NOT NULL,
  `Grow` tinyint(4) NOT NULL,
  `Hair` tinyint(4) NOT NULL,
  `Face` tinyint(4) NOT NULL,
  `Size` tinyint(4) NOT NULL,
  `Job` tinyint(4) NOT NULL,
  `Sex` tinyint(4) NOT NULL,
  `Level` smallint(6) NOT NULL,
  `StatPoint` smallint(6) NOT NULL,
  `SkillPoint` smallint(6) NOT NULL,
  `Str` smallint(6) NOT NULL,
  `Dex` smallint(6) NOT NULL,
  `Rec` smallint(6) NOT NULL,
  `Int` smallint(6) NOT NULL,
  `Luc` smallint(6) NOT NULL,
  `Wis` smallint(6) NOT NULL,
  `HP` smallint(6) NOT NULL,
  `MP` smallint(6) NOT NULL,
  `SP` smallint(6) NOT NULL,
  `Map` smallint(6) NOT NULL,
  `Dir` smallint(6) NOT NULL,
  `Exp` int(11) NOT NULL,
  `Money` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `Posz` float NOT NULL,
  `Hg` smallint(6) NOT NULL,
  `Vg` smallint(6) NOT NULL,
  `Cg` tinyint(4) NOT NULL,
  `Og` tinyint(4) NOT NULL,
  `Ig` tinyint(4) NOT NULL,
  `K1` int(11) NOT NULL,
  `K2` int(11) NOT NULL,
  `K3` int(11) NOT NULL,
  `K4` int(11) NOT NULL,
  `KillLevel` tinyint(4) NOT NULL,
  `DeadLevel` tinyint(4) NOT NULL,
  `RegDate` datetime(0) NOT NULL,
  `DeleteDate` datetime(0) NULL DEFAULT NULL,
  `JoinDate` datetime(0) NULL DEFAULT NULL,
  `LeaveDate` datetime(0) NULL DEFAULT NULL,
  `RenameCnt` tinyint(4) NOT NULL,
  `OldCharName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RemainTime` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charevents
-- ----------------------------
DROP TABLE IF EXISTS `charevents`;
CREATE TABLE `charevents`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `Event1` tinyint(4) NOT NULL,
  `Event2` tinyint(4) NOT NULL,
  `Event3` tinyint(4) NULL DEFAULT NULL,
  `Event4` tinyint(4) NULL DEFAULT NULL,
  `Event5` tinyint(4) NULL DEFAULT NULL,
  `Event6` tinyint(4) NULL DEFAULT NULL,
  `Event7` tinyint(4) NULL DEFAULT NULL,
  `Event8` tinyint(4) NULL DEFAULT NULL,
  `Event9` tinyint(4) NULL DEFAULT NULL,
  `Event10` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`CharID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charitems
-- ----------------------------
DROP TABLE IF EXISTS `charitems`;
CREATE TABLE `charitems`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL COMMENT '타입(2자리) + 타입ID(3자리) = 5자리 일련번호(겹치지 않음)',
  `ItemUID` bigint(20) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TypeID` tinyint(4) NOT NULL,
  `Bag` tinyint(4) NOT NULL COMMENT '가방번호',
  `Slot` tinyint(4) NOT NULL COMMENT '가방에 슬롯번호',
  `Quality` smallint(6) NOT NULL COMMENT '내구도',
  `Gem1` tinyint(4) NOT NULL COMMENT '라피스 번호(타입ID만 들어감)',
  `Gem2` tinyint(4) NOT NULL,
  `Gem3` tinyint(4) NOT NULL,
  `Gem4` tinyint(4) NOT NULL,
  `Gem5` tinyint(4) NOT NULL,
  `Gem6` tinyint(4) NOT NULL,
  `Craftname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Count` tinyint(4) NOT NULL,
  `Maketime` datetime(0) NOT NULL COMMENT '생성시간',
  `Maketype` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성방법',
  `Del` tinyint(4) NOT NULL COMMENT '삭제여부',
  PRIMARY KEY (`CharID`, `ItemUID`) USING BTREE,
  INDEX `IX_CharItems_ItemID`(`ItemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charquests
-- ----------------------------
DROP TABLE IF EXISTS `charquests`;
CREATE TABLE `charquests`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `QuestID` smallint(6) NOT NULL,
  `Delay` smallint(6) NOT NULL COMMENT '스킬 딜레이(ms던가?)',
  `Count1` tinyint(4) NOT NULL,
  `Count2` tinyint(4) NOT NULL,
  `Count3` tinyint(4) NOT NULL,
  `Success` tinyint(4) NOT NULL COMMENT '수행안함 -1, 실패 0, 성공 1',
  `Finish` tinyint(4) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  PRIMARY KEY (`CharID`, `QuestID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charquickslotbacks
-- ----------------------------
DROP TABLE IF EXISTS `charquickslotbacks`;
CREATE TABLE `charquickslotbacks`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `QuickBar` tinyint(4) NOT NULL,
  `QuickSlot` tinyint(4) NOT NULL,
  `Bag` tinyint(4) NOT NULL,
  `Number` tinyint(4) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charquickslots
-- ----------------------------
DROP TABLE IF EXISTS `charquickslots`;
CREATE TABLE `charquickslots`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `QuickBar` tinyint(4) NOT NULL,
  `QuickSlot` tinyint(4) NOT NULL,
  `Bag` tinyint(4) NOT NULL,
  `Number` smallint(6) NOT NULL,
  PRIMARY KEY (`CharID`, `QuickBar`, `QuickSlot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charrenamelog
-- ----------------------------
DROP TABLE IF EXISTS `charrenamelog`;
CREATE TABLE `charrenamelog`  (
  `ServerID` tinyint(4) NULL DEFAULT NULL,
  `CharID` int(11) NULL DEFAULT NULL,
  `CharName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UpdateTime` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chars
-- ----------------------------
DROP TABLE IF EXISTS `chars`;
CREATE TABLE `chars`  (
  `ServerID` tinyint(4) NOT NULL,
  `UserID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UserUID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `CharName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `New` tinyint(4) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  `Slot` tinyint(4) NOT NULL,
  `Family` tinyint(4) NOT NULL,
  `Grow` tinyint(4) NOT NULL,
  `Hair` tinyint(4) NOT NULL,
  `Face` tinyint(4) NOT NULL,
  `Size` tinyint(4) NOT NULL,
  `Job` tinyint(4) NOT NULL,
  `Sex` tinyint(4) NOT NULL,
  `Level` smallint(6) NOT NULL,
  `StatPoint` smallint(6) NOT NULL,
  `SkillPoint` smallint(6) NOT NULL,
  `Str` smallint(6) NOT NULL,
  `Dex` smallint(6) NOT NULL,
  `Rec` smallint(6) NOT NULL,
  `Int` smallint(6) NOT NULL,
  `Luc` smallint(6) NOT NULL,
  `Wis` smallint(6) NOT NULL,
  `HP` smallint(6) NOT NULL,
  `MP` smallint(6) NOT NULL,
  `SP` smallint(6) NOT NULL,
  `Map` smallint(6) NOT NULL,
  `Dir` smallint(6) NOT NULL,
  `Exp` int(11) NOT NULL,
  `Money` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `Posz` float NOT NULL,
  `Hg` smallint(6) NOT NULL,
  `Vg` smallint(6) NOT NULL,
  `Cg` tinyint(4) NOT NULL,
  `Og` tinyint(4) NOT NULL,
  `Ig` tinyint(4) NOT NULL,
  `K1` int(11) NOT NULL,
  `K2` int(11) NOT NULL,
  `K3` int(11) NOT NULL,
  `K4` int(11) NOT NULL,
  `KillLevel` tinyint(4) NOT NULL,
  `DeadLevel` tinyint(4) NOT NULL,
  `RegDate` datetime(0) NOT NULL,
  `DeleteDate` datetime(0) NULL DEFAULT NULL,
  `JoinDate` datetime(0) NULL DEFAULT NULL,
  `LeaveDate` datetime(0) NULL DEFAULT NULL,
  `RenameCnt` tinyint(4) NOT NULL,
  `OldCharName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RemainTime` int(11) NOT NULL,
  PRIMARY KEY (`CharID`) USING BTREE,
  INDEX `IX_Chars_UserUID`(`UserUID`) USING BTREE,
  INDEX `IX_Chars_CharName`(`CharName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chars
-- ----------------------------
INSERT INTO `chars` VALUES (1, 'admin', 2, 1, 'Toang', 1, 0, 0, 0, 3, 0, 0, 2, 0, 0, 70, 618, 9939, 76, 12, 9, 8, 15, 7, 55, 35, 70, 19, 211, 193221021, 499982630, 601.291, 8.46, 1852.93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2057-10-04 00:00:00', '2057-10-05 00:00:00', 0, 'NULL', 0);

-- ----------------------------
-- Table structure for charsavepoint
-- ----------------------------
DROP TABLE IF EXISTS `charsavepoint`;
CREATE TABLE `charsavepoint`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `Slot` tinyint(4) NOT NULL,
  `MapID` smallint(6) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  PRIMARY KEY (`CharID`, `Slot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charsavepointback
-- ----------------------------
DROP TABLE IF EXISTS `charsavepointback`;
CREATE TABLE `charsavepointback`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `Slot` tinyint(4) NOT NULL,
  `MapID` smallint(6) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charskillbacks
-- ----------------------------
DROP TABLE IF EXISTS `charskillbacks`;
CREATE TABLE `charskillbacks`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `SkillID` smallint(6) NOT NULL,
  `SkillLevel` tinyint(4) NOT NULL,
  `Number` tinyint(4) NOT NULL,
  `Delay` smallint(6) NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Del` tinyint(4) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charskills
-- ----------------------------
DROP TABLE IF EXISTS `charskills`;
CREATE TABLE `charskills`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `SkillID` smallint(6) NOT NULL,
  `SkillLevel` tinyint(4) NOT NULL,
  `Number` tinyint(4) NOT NULL,
  `Delay` smallint(6) NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  PRIMARY KEY (`CharID`, `SkillID`, `SkillLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for considerbank
-- ----------------------------
DROP TABLE IF EXISTS `considerbank`;
CREATE TABLE `considerbank`  (
  `UserUID` int(11) NULL DEFAULT NULL,
  `ItemUID` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for considerinven
-- ----------------------------
DROP TABLE IF EXISTS `considerinven`;
CREATE TABLE `considerinven`  (
  `CharID` int(11) NULL DEFAULT NULL,
  `ItemUID` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dtproperties
-- ----------------------------
DROP TABLE IF EXISTS `dtproperties`;
CREATE TABLE `dtproperties`  (
  `id` int(11) NOT NULL,
  `objectid` int(11) NULL DEFAULT NULL,
  `property` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uvalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lvalue` longblob NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`, `property`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eventlog_charskill1
-- ----------------------------
DROP TABLE IF EXISTS `eventlog_charskill1`;
CREATE TABLE `eventlog_charskill1`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `UseCount` tinyint(4) NOT NULL,
  `GetPoint` smallint(6) NOT NULL,
  `SkillPoint` smallint(6) NOT NULL,
  `UseDate` datetime(0) NOT NULL,
  PRIMARY KEY (`CharID`, `UseCount`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eventlog_charskill2
-- ----------------------------
DROP TABLE IF EXISTS `eventlog_charskill2`;
CREATE TABLE `eventlog_charskill2`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `UseCount` tinyint(4) NOT NULL,
  `SkillID` smallint(6) NOT NULL,
  `SkillLevel` tinyint(4) NOT NULL,
  `Number` tinyint(4) NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`CharID`, `UseCount`, `SkillID`, `SkillLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eventlog_charstat
-- ----------------------------
DROP TABLE IF EXISTS `eventlog_charstat`;
CREATE TABLE `eventlog_charstat`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `UseCount` tinyint(4) NOT NULL,
  `GetPoint` smallint(6) NOT NULL,
  `StatPoint` smallint(6) NOT NULL,
  `Str` smallint(6) NOT NULL,
  `Dex` smallint(6) NOT NULL,
  `Rec` smallint(6) NOT NULL,
  `Int` smallint(6) NOT NULL,
  `Luc` smallint(6) NOT NULL,
  `Wis` smallint(6) NOT NULL,
  `UseDate` datetime(0) NOT NULL,
  PRIMARY KEY (`CharID`, `UseCount`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for friendchars
-- ----------------------------
DROP TABLE IF EXISTS `friendchars`;
CREATE TABLE `friendchars`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `FriendID` int(11) NOT NULL,
  `FriendName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Family` tinyint(4) NOT NULL,
  `Grow` tinyint(4) NOT NULL,
  `Job` tinyint(4) NOT NULL,
  `Memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Refuse` tinyint(4) NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `RefuseDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`CharID`, `FriendID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guildchars
-- ----------------------------
DROP TABLE IF EXISTS `guildchars`;
CREATE TABLE `guildchars`  (
  `RowID` int(11) NOT NULL,
  `GuildID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `GuildLevel` tinyint(4) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  `JoinDate` datetime(0) NOT NULL,
  `LeaveDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`RowID`) USING BTREE,
  INDEX `IX_GuildChars_CharID`(`CharID`) USING BTREE,
  INDEX `IX_GuildChars_GuildID`(`GuildID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guilddetails
-- ----------------------------
DROP TABLE IF EXISTS `guilddetails`;
CREATE TABLE `guilddetails`  (
  `GuildID` int(11) NOT NULL,
  `UseHouse` tinyint(4) NOT NULL,
  `BuyHouse` tinyint(4) NOT NULL,
  `Rank` tinyint(4) NOT NULL,
  `Etin` int(11) NOT NULL,
  `EtinReturnCnt` int(11) NOT NULL,
  `KeepEtin` int(11) NOT NULL,
  `Remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`GuildID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guildnpclv
-- ----------------------------
DROP TABLE IF EXISTS `guildnpclv`;
CREATE TABLE `guildnpclv`  (
  `GuildID` int(11) NOT NULL,
  `GNpcType` smallint(6) NOT NULL,
  `NpcLevel` tinyint(4) NOT NULL,
  `Number` tinyint(4) NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  PRIMARY KEY (`GuildID`, `GNpcType`, `NpcLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guildranklog
-- ----------------------------
DROP TABLE IF EXISTS `guildranklog`;
CREATE TABLE `guildranklog`  (
  `GuildID` int(11) NOT NULL,
  `GuildValue` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `TotalRank` int(11) NOT NULL,
  `Change` int(11) NULL DEFAULT NULL,
  `TotalChange` int(11) NULL DEFAULT NULL,
  `RankTime` datetime(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guildranklog2
-- ----------------------------
DROP TABLE IF EXISTS `guildranklog2`;
CREATE TABLE `guildranklog2`  (
  `GuildID` int(11) NOT NULL,
  `GuildValue` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `TotalRank` int(11) NOT NULL,
  `Change` int(11) NULL DEFAULT NULL,
  `TotalChange` int(11) NULL DEFAULT NULL,
  `RankTime` datetime(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guilds
-- ----------------------------
DROP TABLE IF EXISTS `guilds`;
CREATE TABLE `guilds`  (
  `RowID` int(11) NOT NULL,
  `GuildID` int(11) NOT NULL,
  `GuildName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MasterUserID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MasterCharID` int(11) NOT NULL,
  `MasterName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Country` tinyint(4) NOT NULL,
  `TotalCount` smallint(6) NOT NULL,
  `GuildPoint` int(11) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  `CreateDate` datetime(0) NOT NULL,
  `DeleteDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`GuildID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guildstoreditems
-- ----------------------------
DROP TABLE IF EXISTS `guildstoreditems`;
CREATE TABLE `guildstoreditems`  (
  `RowID` int(11) NOT NULL,
  `GuildID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TypeID` tinyint(4) NOT NULL,
  `ItemUID` bigint(20) NOT NULL,
  `Slot` int(11) NOT NULL,
  `Quality` smallint(6) NOT NULL,
  `Gem1` tinyint(4) NOT NULL,
  `Gem2` tinyint(4) NOT NULL,
  `Gem3` tinyint(4) NOT NULL,
  `Gem4` tinyint(4) NOT NULL,
  `Gem5` tinyint(4) NOT NULL,
  `Gem6` tinyint(4) NOT NULL,
  `Craftname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Count` tinyint(4) NOT NULL,
  `Maketime` datetime(0) NOT NULL,
  `Maketype` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Del` tinyint(4) NOT NULL,
  PRIMARY KEY (`ItemUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hacklog
-- ----------------------------
DROP TABLE IF EXISTS `hacklog`;
CREATE TABLE `hacklog`  (
  `CharID` int(11) NULL DEFAULT NULL,
  `Money` int(11) NULL DEFAULT NULL,
  `CurDate` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for keeps
-- ----------------------------
DROP TABLE IF EXISTS `keeps`;
CREATE TABLE `keeps`  (
  `RowID` int(11) NOT NULL,
  `KeepID` int(11) NOT NULL,
  `OwnCountry` tinyint(4) NOT NULL,
  `ResetTime` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for market
-- ----------------------------
DROP TABLE IF EXISTS `market`;
CREATE TABLE `market`  (
  `RowID` int(11) NOT NULL,
  `MarketID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `MinMoney` int(11) NOT NULL,
  `DirectMoney` int(11) NOT NULL,
  `MarketType` tinyint(4) NOT NULL,
  `GuaranteeMoney` int(11) NOT NULL,
  `TenderCharID` int(11) NOT NULL,
  `TenderCharName` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TenderMoney` int(11) NOT NULL,
  `EndDate` datetime(0) NOT NULL,
  `Del` int(11) NOT NULL,
  PRIMARY KEY (`MarketID`) USING BTREE,
  INDEX `IX_Market`(`EndDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marketcharconcern
-- ----------------------------
DROP TABLE IF EXISTS `marketcharconcern`;
CREATE TABLE `marketcharconcern`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `MarketID` int(11) NOT NULL,
  PRIMARY KEY (`CharID`, `MarketID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marketcharresultitems
-- ----------------------------
DROP TABLE IF EXISTS `marketcharresultitems`;
CREATE TABLE `marketcharresultitems`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `MarketID` int(11) NOT NULL,
  `Result` tinyint(4) NOT NULL,
  `EndDate` datetime(0) NOT NULL,
  PRIMARY KEY (`CharID`, `MarketID`) USING BTREE,
  INDEX `IX_MarketCharResultItems`(`EndDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marketcharresultitems_dellog
-- ----------------------------
DROP TABLE IF EXISTS `marketcharresultitems_dellog`;
CREATE TABLE `marketcharresultitems_dellog`  (
  `RowID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `MarketID` int(11) NOT NULL,
  `Result` tinyint(4) NOT NULL,
  `EndDate` datetime(0) NOT NULL,
  `DelDate` datetime(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marketcharresultmoney
-- ----------------------------
DROP TABLE IF EXISTS `marketcharresultmoney`;
CREATE TABLE `marketcharresultmoney`  (
  `RowID` int(11) NOT NULL,
  `MoneyID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `MarketID` int(11) NOT NULL,
  `Result` tinyint(4) NOT NULL,
  `Money` int(11) NOT NULL,
  `GuaranteeMoney` int(11) NOT NULL,
  `ReturnMoney` int(11) NOT NULL,
  `EndDate` datetime(0) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TypeID` tinyint(4) NOT NULL,
  `Quality` smallint(6) NOT NULL,
  `Gem1` tinyint(4) NOT NULL,
  `Gem2` tinyint(4) NOT NULL,
  `Gem3` tinyint(4) NOT NULL,
  `Gem4` tinyint(4) NOT NULL,
  `Gem5` tinyint(4) NOT NULL,
  `Gem6` tinyint(4) NOT NULL,
  `Craftname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Count` tinyint(4) NOT NULL,
  PRIMARY KEY (`MoneyID`) USING BTREE,
  INDEX `IX_MarketCharResultMoney`(`EndDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marketcharresultmoney_dellog
-- ----------------------------
DROP TABLE IF EXISTS `marketcharresultmoney_dellog`;
CREATE TABLE `marketcharresultmoney_dellog`  (
  `RowID` int(11) NOT NULL,
  `MoneyID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `MarketID` int(11) NOT NULL,
  `Result` tinyint(4) NOT NULL,
  `Money` int(11) NOT NULL,
  `GuaranteeMoney` int(11) NOT NULL,
  `ReturnMoney` int(11) NOT NULL,
  `EndDate` datetime(0) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TypeID` tinyint(4) NOT NULL,
  `Quality` smallint(6) NOT NULL,
  `Gem1` tinyint(4) NOT NULL,
  `Gem2` tinyint(4) NOT NULL,
  `Gem3` tinyint(4) NOT NULL,
  `Gem4` tinyint(4) NOT NULL,
  `Gem5` tinyint(4) NOT NULL,
  `Gem6` tinyint(4) NOT NULL,
  `Craftname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Count` tinyint(4) NOT NULL,
  `DelDate` datetime(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marketitems
-- ----------------------------
DROP TABLE IF EXISTS `marketitems`;
CREATE TABLE `marketitems`  (
  `MarketID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemUID` bigint(20) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TypeID` tinyint(4) NOT NULL,
  `Quality` smallint(6) NOT NULL,
  `Gem1` tinyint(4) NOT NULL,
  `Gem2` tinyint(4) NOT NULL,
  `Gem3` tinyint(4) NOT NULL,
  `Gem4` tinyint(4) NOT NULL,
  `Gem5` tinyint(4) NOT NULL,
  `Gem6` tinyint(4) NOT NULL,
  `Craftname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Count` tinyint(4) NOT NULL,
  `Maketime` datetime(0) NOT NULL,
  `Maketype` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`MarketID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marketitems_dellog
-- ----------------------------
DROP TABLE IF EXISTS `marketitems_dellog`;
CREATE TABLE `marketitems_dellog`  (
  `MarketID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemUID` bigint(20) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TypeID` tinyint(4) NOT NULL,
  `Quality` smallint(6) NOT NULL,
  `Gem1` tinyint(4) NOT NULL,
  `Gem2` tinyint(4) NOT NULL,
  `Gem3` tinyint(4) NOT NULL,
  `Gem4` tinyint(4) NOT NULL,
  `Gem5` tinyint(4) NOT NULL,
  `Gem6` tinyint(4) NOT NULL,
  `Craftname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Count` tinyint(4) NOT NULL,
  `Maketime` datetime(0) NOT NULL,
  `Maketype` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pointerrorlog
-- ----------------------------
DROP TABLE IF EXISTS `pointerrorlog`;
CREATE TABLE `pointerrorlog`  (
  `UserUID` int(11) NOT NULL,
  `CharID` int(11) NULL DEFAULT NULL,
  `ProductCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Ret` int(11) NOT NULL,
  `ErrDate` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pointgiftnotify
-- ----------------------------
DROP TABLE IF EXISTS `pointgiftnotify`;
CREATE TABLE `pointgiftnotify`  (
  `UserUID` int(11) NOT NULL,
  `ProductCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SendCharName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RecvDate` datetime(0) NOT NULL,
  INDEX `IX_PointGiftNotify`(`UserUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pointlog
-- ----------------------------
DROP TABLE IF EXISTS `pointlog`;
CREATE TABLE `pointlog`  (
  `UserUID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `UsePoint` int(11) NOT NULL,
  `ProductCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TargetName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UseDate` datetime(0) NOT NULL,
  `UseType` tinyint(4) NOT NULL,
  `RemainPoint` int(11) NULL DEFAULT NULL,
  `OrderNumber` int(11) NULL DEFAULT NULL,
  INDEX `IX_PointLog`(`CharID`) USING BTREE,
  INDEX `IX_PointLog_UserUID`(`UserUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for productlog
-- ----------------------------
DROP TABLE IF EXISTS `productlog`;
CREATE TABLE `productlog`  (
  `RowID` int(11) NOT NULL,
  `ServerID` tinyint(4) NOT NULL,
  `UserUID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemUID` bigint(20) NOT NULL,
  `Quality` smallint(6) NOT NULL,
  `ItemCount` tinyint(4) NOT NULL,
  `ProductCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  `VerifyCode` bigint(20) NULL DEFAULT NULL,
  `BuyDate` datetime(0) NOT NULL,
  `ReceiveDate` datetime(0) NOT NULL,
  PRIMARY KEY (`UserUID`, `CharID`, `ItemUID`) USING BTREE,
  INDEX `IX_ProductLog`(`ReceiveDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for questaward
-- ----------------------------
DROP TABLE IF EXISTS `questaward`;
CREATE TABLE `questaward`  (
  `ItemID` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tmpguildetin
-- ----------------------------
DROP TABLE IF EXISTS `tmpguildetin`;
CREATE TABLE `tmpguildetin`  (
  `GuildID` int(11) NULL DEFAULT NULL,
  `Etin` int(11) NULL DEFAULT NULL,
  `CurTime` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usermaxgrow
-- ----------------------------
DROP TABLE IF EXISTS `usermaxgrow`;
CREATE TABLE `usermaxgrow`  (
  `RowID` int(11) NOT NULL,
  `ServerID` tinyint(4) NOT NULL,
  `UserUID` int(11) NOT NULL,
  `Country` tinyint(4) NOT NULL COMMENT '세력(0:빛, 1:분노)',
  `MaxGrow` tinyint(4) NOT NULL COMMENT '최고 성장모드(0~3)',
  `Del` tinyint(4) NOT NULL,
  PRIMARY KEY (`ServerID`, `UserUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usermaxgrow
-- ----------------------------
INSERT INTO `usermaxgrow` VALUES (1, 1, 2, 0, 3, 0);

-- ----------------------------
-- Table structure for userstoreditems
-- ----------------------------
DROP TABLE IF EXISTS `userstoreditems`;
CREATE TABLE `userstoreditems`  (
  `RowID` int(11) NOT NULL COMMENT '창고 아이템 테이블로써 구조는 CharItems 테이블과 동일',
  `ServerID` tinyint(4) NOT NULL,
  `UserUID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TypeID` tinyint(4) NOT NULL,
  `ItemUID` bigint(20) NOT NULL,
  `Slot` int(11) NOT NULL,
  `Quality` smallint(6) NOT NULL,
  `Gem1` tinyint(4) NOT NULL,
  `Gem2` tinyint(4) NOT NULL,
  `Gem3` tinyint(4) NOT NULL,
  `Gem4` tinyint(4) NOT NULL,
  `Gem5` tinyint(4) NOT NULL,
  `Gem6` tinyint(4) NOT NULL,
  `Craftname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Count` tinyint(4) NOT NULL,
  `Maketime` datetime(0) NOT NULL,
  `Maketype` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Del` tinyint(4) NOT NULL,
  INDEX `IX_UserStoredItems`(`UserUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userstoredmoney
-- ----------------------------
DROP TABLE IF EXISTS `userstoredmoney`;
CREATE TABLE `userstoredmoney`  (
  `RowID` int(11) NOT NULL COMMENT '회원 \'은행\' 으로써 캐릭터에 들어간 Money필드와 역할 동일',
  `ServerID` tinyint(4) NOT NULL,
  `UserUID` int(11) NOT NULL,
  `Money` bigint(20) NOT NULL,
  `LastAccessTime` datetime(0) NOT NULL,
  `Del` tinyint(4) NOT NULL,
  PRIMARY KEY (`ServerID`, `UserUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userstoredpointitems
-- ----------------------------
DROP TABLE IF EXISTS `userstoredpointitems`;
CREATE TABLE `userstoredpointitems`  (
  `UserUID` int(11) NOT NULL,
  `Slot` tinyint(4) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `ItemCount` tinyint(4) NOT NULL,
  `BuyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`UserUID`, `Slot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for worldinfo
-- ----------------------------
DROP TABLE IF EXISTS `worldinfo`;
CREATE TABLE `worldinfo`  (
  `RowID` int(11) NOT NULL,
  `LastWorldTime` int(11) NOT NULL,
  `GodBless_Light` int(11) NOT NULL,
  `GodBless_Dark` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

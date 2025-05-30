/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : shaiyald

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 28/04/2024 20:04:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guide_droplists
-- ----------------------------
DROP TABLE IF EXISTS `guide_droplists`;
CREATE TABLE `guide_droplists`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guide_droplists
-- ----------------------------
INSERT INTO `guide_droplists` VALUES (1, 'Drop List', 'DROP LIST', '<div class=\"raw-html-embed\"><div class=\"tab\" style=\"text-align: center;\">\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map1\')\" id=\"defaultOpen\">Cave of Stigma / Aurizen Ruin</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map2\')\">Skulleron / Astenes</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map3\')\">Deep Desert-1</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map4\')\">Deep Desert-2 </button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map5\')\">Stable Erde Jungle</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map6\')\">D2 (Dungeon PvP)</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map7\')\">Sky City (Dungeon PvP)</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map8\')\">Caelum Sacra</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map9\')\">Ice Valley</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map10\')\">Kanos</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map11\')\">Ghostwire map</button>\r\n  <button class=\"nice_button\" onclick=\"openContent(event, \'map12\')\">GRB</button>\r\n</div><br>\r\n<h6>Click on the buttons to see the farm list</h6> \r\n<div id=\"map1\" class=\"tabcontent\">\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mob)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>- Lapis Lv5 %10<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>- Lapis Lv5 %75<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n<div id=\"map2\" class=\"tabcontent\">\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mob)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Legendary Gear Lv50-53 %10<p></p>\r\n<p></p>-  Legendary Weapons Lv51-55 %10<p></p>\r\n<p></p>-  Heroic Stat Accesories %3<p></p>\r\n<p></p>-  Fortune Bag %3<p></p>\r\n<p></p>-  Recreation Rune %2<p></p>\r\n<p></p>-  Linking Hammer Lv7 %5<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n\r\n<div id=\"map3\" class=\"tabcontent\">\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mob)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Dual Lapises Lv1-4 %30<p></p>\r\n<p></p>-  Power &amp; Defense Lapisia of Syeeric %1<p></p>\r\n<p></p>-  Fortune Bag %10<p></p>\r\n<p></p>-  Recreation Rune %5<p></p>\r\n<p></p>-  Linking Hammer Lv7 %5<p></p>\r\n<p></p>-  Ghost core %1<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mini Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Gear Lv55-58 (5 slots version) %20<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  100SP x2 %100<p></p>\r\n<p></p>-  Flash Lapis Lv2 %100<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Weapon) %100<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n<div id=\"map4\" class=\"tabcontent\">\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mob)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Fortune Bag %10<p></p>\r\n<p></p>-  Accessories Lapis %10<p></p>\r\n<p></p>-  Recreation Rune %3<p></p>\r\n<p></p>-  Linking Hammer Lv7 %5<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mini Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Gear Lv55-58 (5 slots version) %20<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  100SP x2 %100<p></p>\r\n<p></p>-  Sonic Lapis Lv2 %100<p></p>\r\n<p></p>-  Goddess Gear Lv46 Box %15<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Armor) %100<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n<div id=\"map5\" class=\"tabcontent\">\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mob)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Dual Lapises Lv1-4 %30<p></p>\r\n<p></p>-  Fortune Bag %5<p></p>\r\n<p></p>-  Recreation Rune %2<p></p>\r\n<p></p>-  Linking Hammer Lv7 %5<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mini Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Gear Lv55-58 (5 slots version) %20<p></p>\r\n<p></p>-  Power &amp; Defense Lapisia of Syeeric %5<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Goddess Weap Lv 46 Box %15<p></p>\r\n<p></p>-  Hammer Mystery Box %100<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Armor) %100<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n\r\n<div id=\"map6\" class=\"tabcontent\">\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Kimuraku)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Lv 54 cape %10<p></p>\r\n<p></p>-  Goddess Weap Lv 46 Box %15<p></p>\r\n<p></p>-  Hammer Mystery Box %100<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Weapon) %100<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n<div id=\"map7\" class=\"tabcontent\">\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Greendieta Seraphim)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  100SP x2 %100<p></p>\r\n<p></p>-  Absorption Lapis Lv6  %100<p></p>\r\n<p></p>-  Hammer Mystery Box %100<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Armor) %100<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n\r\n<div id=\"map8\" class=\"tabcontent\">\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mobs)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Power &amp; Defense Lapisia of Syeeric %50<p></p>\r\n<p></p>-  Fortune Bag   %10<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Dios Exiel)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Ghost Ring %5<p></p>\r\n<p></p>-  Ghost Loop %5<p></p>\r\n<p></p>-  Goddess Gear Lv53 box %10<p></p>\r\n<p></p>-  Absorption Lapis Lv6 %100<p></p>\r\n<p></p>-  Hammer Mystery Box %100<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Armor) %100<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Weapon) %100<p></p>\r\n</div><br><br>\r\n\r\n</div>\r\n\r\n\r\n<div id=\"map9\" class=\"tabcontent\">\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mobs)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Holywater Potion %10<p></p>\r\n<p></p>-  Lucky Charm   %5<p></p>\r\n<p></p>-  Fortune Bag   %5<p></p>\r\n<p></p>-  Power &amp; Defense Lapisia of Syeeric   %2<p></p>\r\n<p></p>-  Operator\'s Exclusive  %1<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Ghost Necklace %5<p></p>\r\n<p></p>-  Goddess Gear Lv53 Box %10<p></p>\r\n<p></p>-  GLH x1 %100<p></p>\r\n<p></p>-  Helmet Lv 2 lapis x1 %100<p></p>\r\n</div><br><br>\r\n\r\n</div>\r\n\r\n\r\n<div id=\"map10\" class=\"tabcontent\">\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mobs)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Holywater Potion %10<p></p>\r\n<p></p>-  Ghost Coin   %1<p></p>\r\n<p></p>-  Ghost Core   %5<p></p>\r\n<p></p>-  Lucky Charm   %5<p></p>\r\n<p></p>-  Operator\'s Exclusive  %2<p></p>\r\n<p></p>-  Lv 6 Lapises  %1<p></p>\r\n<p></p>-  Oblivion acc  %10<p></p>\r\n<p></p>-  Fortune Bag  %5<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mini Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  10 SP %100<p></p>\r\n<p></p>-  50 SP %20<p></p>\r\n<p></p>-  100 SP %5<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Elemental Lapis Lv1 (Armor) %100<p></p>\r\n<p></p>-  Elemental Lapis Lv1 (Weapon) %100<p></p>\r\n<p></p>-  Absorption Lv5 %100<p></p>\r\n<p></p>-  Lv 54 Cape %10<p></p>\r\n<p></p>-  Heroic Accesories %30<p></p>\r\n\r\n</div><br><br>\r\n\r\n</div>\r\n\r\n\r\n<div id=\"map11\" class=\"tabcontent\">\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Ghostwire)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  55 Lv Weapon %100<p></p>\r\n<p></p>-  56 Lv Weapon %100<p></p>\r\n<p></p>-  59 Lv Weapon  %100<p></p>\r\n<p></p>-  Ghost Cape  %100<p></p>\r\n<p></p>-  Ghost Necklace  %100<p></p>\r\n<p></p>-  Ghost Ring  %100<p></p>\r\n<p></p>-  Ghost Loop  %100<p></p>\r\n<p></p>-  Goddess Gear Lv53 box x2  %100<p></p>\r\n<p></p>-  Under Char Glow Effect  %50<p></p>\r\n</div><br><br>\r\n</div>\r\n\r\n\r\n<div id=\"map12\" class=\"tabcontent\">\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mobs)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  1 SP %10<p></p>\r\n<p></p>-  10 SP %3<p></p>\r\n<p></p>-  Operator\'s Exclusive %1<p></p>\r\n<p></p>-  Fortune Coin Lv1 %20<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Mini Bosses)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  Operator\'s Exclusive %100<p></p>\r\n<p></p>-  100 SP %100<p></p>\r\n<p></p>-  Fortune Coin Lv2 %100<p></p>\r\n<p></p>-  Fortune Coin Lv2 %100<p></p>\r\n</div><br><br>\r\n\r\n<button type=\"button\" class=\"collapsible nice_button\" style=\"color: #FFA500;\">(Old Wıllow)</button>\r\n<div style=\"display: none;margin-top: 10px;margin-bottom: 10px; color: #FFD700;\">\r\n<p></p>-  100 SP %100<p></p>\r\n<p></p>-  300 SP %80<p></p>\r\n<p></p>-  300 SP %60<p></p>\r\n<p></p>-  Helmet Lv 2 Lapis %50<p></p>\r\n<p></p>-  Operator\'s Exclusive %100<p></p>\r\n<p></p>-  Ghost Linking Hammer %20<p></p>\r\n</div><br><br>\r\n\r\n</div></div>', '2024-04-27 09:42:15', '2024-04-27 13:45:06', NULL);

-- ----------------------------
-- Table structure for guide_faqs
-- ----------------------------
DROP TABLE IF EXISTS `guide_faqs`;
CREATE TABLE `guide_faqs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `question_general_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `question_technical_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `question_game_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guide_faqs
-- ----------------------------
INSERT INTO `guide_faqs` VALUES (1, 'FAQ', 'FAQ', '<div class=\"raw-html-embed\"><button type=\"button\" class=\"collapsible nice_button\">Q. What is Shaiya?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Shaiya is a Massively Multiplayer Online Role Playing Game (MMORPG). Players enter into a world where they can socialize and play the game with thousands of others simultaneously. The setting is based on fantasy, where players fight monsters and each other.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. How many different factions are there in Shaiya?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. There are two factions at war in Shaiya, the Alliance of Light and the Union of Fury. The two races which make up the Alliance of Light are the Humans and the Elves. The Union of Fury is made up of the Vail and the Nordein (Deatheaters).</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. How many different Classes are there in Shaiya?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Each faction has 6 Classes to choose from.</p>\r\n\r\n                <p>Alliance of Light: Ranger, Archer, Fighter, Defender, Mage &amp; Priest.</p>\r\n\r\n                <p>Union of Fury: Assassin, Hunter, Warrior, Guardian, Oracle &amp; Pagan.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. After I purchase items from the Website Item Mall, where can I claim them?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Item purchased from the Website Item Mall do not show up in your character’s inventory like items purchased from the In-game Item Mall do. You will need to go to a Bank Teller and open your bank to claim items purchased from the Website Item Mall. You may need to re-login if you were logged into the game during your purchase.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. I’ve purchased an item which featured a rebate, where is my rebate?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Rebates on purchases take up to 10 days from the date of purchase to be distributed. Please refer to the promotion details from our website or forum post for specific details.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. Is this game free?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Yes. Shaiya Ghostwire is free to download and play. Always has been and always will be.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. How can I play?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Just register for an account <a href=\"../page/register.php\">here</a>. Then download the game <a href=\"../page/download.php\">here</a>.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. I have a question or problem not covered on this FAQ page. What should I do?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. If the FAQ or our website doesn\'t help you with your particular issue, you may want to seek out help from fellow players in the discord. You can find them here. If you still can\'t resolve the problem you can get a hold of one of our customer service representatives (Game Masters) on our <a href=\"../page/support.php\">support</a> page.</p>\r\n            </div><br><br></div>', '<div class=\"raw-html-embed\"><button type=\"button\" class=\"collapsible nice_button\">Q. Does Shaiya run on Mac OS?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. We do not provide any support for the Mac Operating System. We also do not plan on providing this anytime in the future.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. I cannot log into my account, what should I do now?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Make sure that you are typing in your account name correctly, and not your character’s name. Account names are case sensitive. Then make sure you are typing in your password correctly as well, passwords are also case sensitive.</p><br>\r\n                <p>You may also want to try and reset your password <a href=\"../page/resetpass.php\">which can be done here.</a></p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. What are the system requirements for Shaiya Ghostwire?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <table class=\"nice_table\">\r\n                    <tbody><tr>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"30%\">OS</td>\r\n                        <td>Windows 7/8/10</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"30%\">CPU</td>\r\n                        <td>Intel Core 2 Duo E8400(Intel),Athlon 200GE(AMD)</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"30%\">GPU</td>\r\n                        <td>Intel HD 4000,Radeon R5 200</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"30%\">RAM</td>\r\n                        <td>4 GB of RAM or more</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"30%\">VRAM</td>\r\n                        <td>1 GB of VRAM or more</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"30%\">DIRECTX</td>\r\n                        <td>9.0c or better</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"30%\">DRIVE SPACE</td>\r\n                        <td>5 GB of HDD space, plus additional for new game content</td>\r\n                    </tr>\r\n                    </tbody></table>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. When I try to play, the Launcher gives me the error: “Cannot connect to server 12029c37”.</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. This connection issue is due to an old or cached IP address. Reset your IP address by:</p>\r\n                <br>\r\n                <p>1.In XP: Click Start and choose Run. Type “CMD” in press ENTER / In Vista: Click Windows, type “CMD in the search box and press ENTER.</p>\r\n                <p>2.In the command shell (looks likeDOS) type: ipconfig /flushdns</p>\r\n                <p>3.Press ENTER</p>\r\n                <p>4.Close the command window.</p>\r\n                <p>5.You can also try disabling your network connection and re-enabling it within Windows. If you have an external router, try power-cycling it. Then start Shaiya. If this doesn\'t seem to help, please try the steps in the next entry...</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. Why do I get the error “Download Failed: Cannot read file. c25” when I try to play Shaiya Ghostwire?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. This connection issue is usually the fault of firewall or anti-virus software. Try toggling your firewalls (if they’re on turn them off, if they’re off turn them on) and try these steps:</p>\r\n                <br>\r\n                <p>1.If you have Windows Firewall enabled, set it to allow Shaiya.</p>\r\n                <p>2.If you are on Windows Vista, make sure that it will allow Shaiya.</p>\r\n                <p>3.If you have any firewall or anti-virus programs (ZoneAlarm, McAfee, Symantec, etc) make sure that they are not blocking Shaiya.</p>\r\n                <p>4.If you are routing through a home network or a business, make sure that the network is not blocking Shaiya or cross-network access.</p>\r\n                <p>5.If you are on Windows Vista 64 (64-bit, not 32-bit) you may be encountering an incompatibility issue with Shaiya. There is no current workaround for Vista 64-bit.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. I try to play Shaiya, but my computer keeps restarting. Any suggestions?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. When any program repeatedly shuts down your computer, chances are you’re running Windows XP and Windows is encountering a conflict. In Windows XP, the default setting is for the computer to reboot automatically when a fatal error occurs. (Pretty useless if you\'re trying to troubleshoot, isn’t it?) To change the recovery settings and disable automatic rebooting:</p>\r\n                <br>\r\n                <p>1.Right-click My Computer, and then click Properties.</p>\r\n                <p>2.Click the Advanced tab.</p>\r\n                <p>3.Under Startup and Recovery, click Settings to open the Startup and Recovery dialog box.</p>\r\n                <p>4.Clear the Automatically restart check box, and click OK the necessary number of times.</p>\r\n                <p>5.Restart your computer for the settings to take effect. Now when a fatal error occurs, you\'ll at least see it and it won\'t cause an automatic reboot. You still have to sort out what\'s causing the problem, but at least you’ll have a starting point.</p>\r\n            </div><br><br></div>', '<div class=\"raw-html-embed\"><button type=\"button\" class=\"collapsible nice_button\">Q.How can I increase my chances of linking my Lapis and items?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. During our monthly tiered spender we often will offer a GM link in the upper tier; otherwise You can wait until your faction has earned the Goddess Blessing. The Goddess Blessing matched up with a good Linking Hammer from our Item Mall will give you the best chance to successfully link your Lapis and item. Make sure to have a Lucky Charm in your inventory to prevent anything from breaking.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. What are the different Modes of Gameplay in Shaiya?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. There are 4 modes in total. First is Easy Mode. Easy Mode is like a tutorial mode where you can level faster, but your level is capped at 30. You earn 5 Stat and 3 Skill points per level.</p><br>\r\n\r\n                <p>Normal Mode is where most players who are familiar with MMORPGs will begin. You will not level as fast as in Easy Mode, but the cap is removed. Normal Mode characters are able to equip Dread Armor. You earn 5 Stat and 3 Skill points per level.</p><br>\r\n\r\n                <p>Hard Mode is unlocked once you have leveled a Normal Mode character to 40. This mode requires more experience to level up than Normal Mode. But you will be able to wear Legend armor. You also earn 7 Stat and 4 Skill points per level.</p><br>\r\n\r\n                <p>Ultimate Mode is the last mode and is unlocked once you have leveled a Hard Mode character to 40. This mode requires even more experience than Hard Mode to level up. You earn 9 Stat 5 Skill points per level. But if you die, you only have 3 minutes to be resurrected or your character will be deleted and you must start all over.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. How do I take a screen shot?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Press the [PrtScrn] button on your keyboard. This will save a screenshot of your game window into your Shaiya installed folder in the ‘Screenshots’ sub-folder.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. How do I hide the User Interface while in game?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. Press [F11] to hide the user interface while in game. You can also press [F10] to go into First Person view.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. I dropped a quest and cannot pick it up again. What do I do?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. You\'ll have to send in a contact ticket in order for our staff to reactivate the quest for you again.</p>\r\n            </div><br><br>\r\n\r\n            <button type=\"button\" class=\"collapsible nice_button\">Q. I tried participating in a marketing or sales promotion but I can\'t find the stuff I was supposed to get. Where is it?</button>\r\n            <div style=\"display: none;margin-top: 10px;margin-bottom: 10px;\">\r\n                <p>A. All items acquired through marketing or sales promotions may be found in your bank. To access your bank, you will have to go to a bank teller NPC. There are several of them, but the easiest ones to find are in Iris or Apulune, the main cities for the two factions.</p>\r\n            </div><br><br></div>', '2024-04-27 13:54:58', '2024-04-27 13:54:58', NULL);

-- ----------------------------
-- Table structure for guide_rules
-- ----------------------------
DROP TABLE IF EXISTS `guide_rules`;
CREATE TABLE `guide_rules`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `play_nice_policies_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `play_nice_policies_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tos_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tos_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `agreement_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `agreement_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guide_rules
-- ----------------------------
INSERT INTO `guide_rules` VALUES (1, 'Rules', 'RULES', 'Play Nice Policies', '<p>In addition to the general guidelines listed in Player Ethics Guide, players are also subject to these supplementary rules while playing the Game and as these are considered as part of the Ethics Guide.</p><p>While by no means an all-inclusive list of the do\'s and don\'ts in the Game, it provides a suitable guideline in which players can determine what activities are appropriate:</p><p>You may not use any language that is offensive, of racist nature, obscene or otherwise inappropriate. This includes, but is not limited to, all manners of swearing, threats, blackmail, discussion of recreational drugs, sexually explicit language and racism or anything prejudice. As offensive language can interpreted in many forms, it will be the mandate of Shaiya Ghostwire &amp; Entertainment to make a determination as to whether or not a “reasonable person” would feel offended and act accordingly.</p><p>You may not harass other players. Harassment is defined as specifically targeting another player, or group of players, to harm or inconvenience them. As harassment can take many forms, it will be the mandate of Shaiya Ghostwire &amp; Entertainment to make a determination as to whether or not a “reasonable person” would feel harassed and act accordingly.</p><p>You may not discriminate against other players or groups. Discrimination is the treatment of a person based on the group, class, or category to which that person belongs rather than on individual merit. As discrimination can take many forms, it will be the mandate of Shaiya Ghostwire &amp; Entertainment to make a determination as to whether or not a “reasonable person” would feel discriminated against and act accordingly.</p><p>You may not disrupt normal gameplay. Any repeated activities that result in disruption of normal gameplay are prohibited. As defining normal gameplay can take many forms, it will be the mandate of Shaiya Ghostwire &amp; Entertainment to make a determination as to whether or not a “reasonable person” would be unable to play normally and act accordingly.</p><p>You may not engage in fraudulent behavior. Fraud is the misrepresentation of facts for personal benefit.</p><p>You may not exchange account information. You may neither give, receive, nor ask about account information (to include passwords, email address, or any other information not available in the public profile).</p><p>You may not operate a clan, guild, or any other group that violates these rules.</p>', 'TOS', '<p>Shaiya Ghostwire &amp; Entertainment reserves the right to record information about player activities in the game. These records may be used in verifying player claims, technical troubleshooting and policy enforcement. They may also be considered permissible as evidence in a court of law. The Player Ethics Guide may be amended by Shaiya Ghostwire &amp; Entertainment from time to time without your consent. In such event, Shaiya Ghostwire &amp; Entertainment will make readily available to you the amended terms and that you will and have agreed to those amended terms. If you do not agree to the Player Ethics Guide, you may stop playing the Game. In such a case, no form of compensation will be made to you.</p>', 'Agreement', '<p>Shaiya Ghostwire and Entertainment recognizes that these rules are not all inclusive. Other actions may be determined as abuse by staff of Shaiya Ghostwire and Entertainment. Note: Violation of these rules will result in account suspension. After the designated period (see table below). The account holder may request that the suspension be reviewed and the account re-activated. It is the responsibility of the account holder to request reinstatement.</p>', '2024-04-27 09:23:55', '2024-04-27 09:23:55', NULL);

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (1, 'default', '{\"uuid\":\"0ceeee90-63aa-44b4-8863-b4cab832c847\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203527, 1714203527);
INSERT INTO `jobs` VALUES (2, 'default', '{\"uuid\":\"f889a6b5-1f10-4fde-ab98-45a707d71ce9\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203859, 1714203859);
INSERT INTO `jobs` VALUES (3, 'default', '{\"uuid\":\"67918c77-c8bf-458c-8cd9-abc69987e43e\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203859, 1714203859);
INSERT INTO `jobs` VALUES (4, 'default', '{\"uuid\":\"486862bf-4eea-4d5a-8fe4-6120c10d7a46\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203859, 1714203859);
INSERT INTO `jobs` VALUES (5, 'default', '{\"uuid\":\"37252306-b2ea-4228-ab0c-39320f263bb0\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203859, 1714203859);
INSERT INTO `jobs` VALUES (6, 'default', '{\"uuid\":\"5d491345-a46f-4d45-b4d9-f9ca7f1bc1ef\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203859, 1714203859);
INSERT INTO `jobs` VALUES (7, 'default', '{\"uuid\":\"1944bd39-0c68-4020-a1e2-cdeb33c0f1a4\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203859, 1714203859);
INSERT INTO `jobs` VALUES (8, 'default', '{\"uuid\":\"729fc451-dc00-48ba-8a6b-38b49d2036f2\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":5:{s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:2:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:2:\\\"50\\\";s:6:\\\"height\\\";s:2:\\\"50\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";}i:1;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:5:{s:8:\\\"optimize\\\";s:594:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Avifenc\\\":[\\\"-a cq-level=23\\\",\\\"-j all\\\",\\\"--min 0\\\",\\\"--max 63\\\",\\\"--minalpha 0\\\",\\\"--maxalpha 63\\\",\\\"-a end-usage=q\\\",\\\"-a tune=ssim\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"120\\\";s:6:\\\"height\\\";s:3:\\\"120\\\";s:3:\\\"fit\\\";s:4:\\\"crop\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;s:7:\\\"\\u0000*\\u0000name\\\";s:7:\\\"preview\\\";}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:0:\\\"\\\";}\"}}', 0, NULL, 1714203859, 1714203859);

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `media_uuid_unique`(`uuid`) USING BTREE,
  INDEX `media_model_type_model_id_index`(`model_type`, `model_id`) USING BTREE,
  INDEX `media_order_column_index`(`order_column`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (1, 'App\\Models\\SettingGeneral', 1, 'dd687b93-45d3-49a3-a942-bdb1cea17473', 'background', '662caaf561de3_texture_dark_1', '662caaf561de3_texture_dark_1.jpg', 'image/jpeg', 'public', 'public', 21982, '[]', '[]', '[]', '[]', 1, '2024-04-27 07:37:09', '2024-04-27 07:37:09');
INSERT INTO `media` VALUES (2, 'App\\Models\\SettingGeneral', 2, '3eabc545-8450-426e-86ad-0337ee4fa6b0', 'background', '662caaf561de3_texture_dark_1', '662caaf561de3_texture_dark_1.jpg', 'image/jpeg', 'public', 'public', 21982, '[]', '[]', '[]', '[]', 1, '2024-04-27 07:38:47', '2024-04-27 07:38:47');
INSERT INTO `media` VALUES (3, 'App\\Models\\SettingHome', 1, '00036454-f2bf-4b1b-bd6e-4ba6c8de7be9', 'logo', '662cabbf2b71e_logo', '662cabbf2b71e_logo.png', 'image/png', 'public', 'public', 22788, '[]', '[]', '[]', '[]', 1, '2024-04-27 07:44:19', '2024-04-27 07:44:19');
INSERT INTO `media` VALUES (4, 'App\\Models\\SettingHome', 1, '4bfc004d-9ed1-4d93-959a-49cb3d361b5a', 'slide_images', '662cabd59a43b_2', '662cabd59a43b_2.png', 'image/png', 'public', 'public', 560567, '[]', '[]', '[]', '[]', 2, '2024-04-27 07:44:19', '2024-04-27 07:44:19');
INSERT INTO `media` VALUES (5, 'App\\Models\\SettingHome', 1, '98bb670d-93bc-4713-b935-5936913f8a2b', 'slide_images', '662cabd623af2_1', '662cabd623af2_1.png', 'image/png', 'public', 'public', 755181, '[]', '[]', '[]', '[]', 3, '2024-04-27 07:44:19', '2024-04-27 07:44:19');
INSERT INTO `media` VALUES (6, 'App\\Models\\SettingHome', 1, '2470836d-5242-4d72-8b96-69452d442416', 'slide_images', '662cabd699256_3', '662cabd699256_3.png', 'image/png', 'public', 'public', 662948, '[]', '[]', '[]', '[]', 4, '2024-04-27 07:44:19', '2024-04-27 07:44:19');
INSERT INTO `media` VALUES (7, 'App\\Models\\SettingHome', 1, '768dd034-4b50-4fdf-9b6b-3f533ceb3612', 'slide_images', '662cabd71eb4b_4', '662cabd71eb4b_4.png', 'image/png', 'public', 'public', 643255, '[]', '[]', '[]', '[]', 5, '2024-04-27 07:44:19', '2024-04-27 07:44:19');
INSERT INTO `media` VALUES (8, 'App\\Models\\SettingHome', 1, '1e5658a4-61a1-4baf-b1c9-63d266ef242d', 'slide_images', '662cabd79992a_5', '662cabd79992a_5.png', 'image/png', 'public', 'public', 518258, '[]', '[]', '[]', '[]', 6, '2024-04-27 07:44:19', '2024-04-27 07:44:19');
INSERT INTO `media` VALUES (9, 'App\\Models\\SettingHome', 1, 'b0df8262-61a6-4c5d-b5e5-eafce0dc3324', 'slide_images', '662cabd822c4e_6', '662cabd822c4e_6.png', 'image/png', 'public', 'public', 636625, '[]', '[]', '[]', '[]', 7, '2024-04-27 07:44:19', '2024-04-27 07:44:19');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2024_04_26_000001_create_media_table', 1);
INSERT INTO `migrations` VALUES (4, '2024_04_26_000002_create_permissions_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_04_26_000003_create_roles_table', 1);
INSERT INTO `migrations` VALUES (6, '2024_04_26_000004_create_users_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_04_26_000005_create_setting_generals_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_04_26_000006_create_setting_homes_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_04_26_000007_create_guide_rules_table', 1);
INSERT INTO `migrations` VALUES (10, '2024_04_26_000008_create_guide_droplists_table', 1);
INSERT INTO `migrations` VALUES (11, '2024_04_26_000009_create_guide_faqs_table', 1);
INSERT INTO `migrations` VALUES (12, '2024_04_26_000010_create_setting_media_table', 1);
INSERT INTO `migrations` VALUES (13, '2024_04_26_000011_create_setting_item_malls_table', 1);
INSERT INTO `migrations` VALUES (14, '2024_04_26_000012_create_setting_rankings_pv_ps_table', 1);
INSERT INTO `migrations` VALUES (15, '2024_04_26_000013_create_setting_rankings_guilds_table', 1);
INSERT INTO `migrations` VALUES (16, '2024_04_26_000014_create_setting_downloads_table', 1);
INSERT INTO `migrations` VALUES (17, '2024_04_26_000015_create_supports_table', 1);
INSERT INTO `migrations` VALUES (18, '2024_04_26_000016_create_setting_donates_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_04_26_000017_create_setting_boss_records_table', 1);
INSERT INTO `migrations` VALUES (20, '2024_04_26_000018_create_setting_votes_table', 1);
INSERT INTO `migrations` VALUES (21, '2024_04_26_000019_create_game_users_table', 1);
INSERT INTO `migrations` VALUES (22, '2024_04_26_000020_create_permission_role_pivot_table', 1);
INSERT INTO `migrations` VALUES (23, '2024_04_26_000021_create_role_user_pivot_table', 1);
INSERT INTO `migrations` VALUES (24, '2024_04_26_000022_create_qa_topics_table', 1);
INSERT INTO `migrations` VALUES (25, '2024_04_26_000023_create_qa_messages_table', 1);
INSERT INTO `migrations` VALUES (26, '2019_08_19_000000_create_failed_jobs_table', 2);
INSERT INTO `migrations` VALUES (27, '2024_04_26_052444_create_sessions_table', 3);
INSERT INTO `migrations` VALUES (28, '2024_04_27_073823_create_jobs_table', 4);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  INDEX `role_id_fk_9725109`(`role_id`) USING BTREE,
  INDEX `permission_id_fk_9725109`(`permission_id`) USING BTREE,
  CONSTRAINT `permission_id_fk_9725109` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_id_fk_9725109` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (1, 2);
INSERT INTO `permission_role` VALUES (1, 3);
INSERT INTO `permission_role` VALUES (1, 4);
INSERT INTO `permission_role` VALUES (1, 5);
INSERT INTO `permission_role` VALUES (1, 6);
INSERT INTO `permission_role` VALUES (1, 7);
INSERT INTO `permission_role` VALUES (1, 8);
INSERT INTO `permission_role` VALUES (1, 9);
INSERT INTO `permission_role` VALUES (1, 10);
INSERT INTO `permission_role` VALUES (1, 11);
INSERT INTO `permission_role` VALUES (1, 12);
INSERT INTO `permission_role` VALUES (1, 13);
INSERT INTO `permission_role` VALUES (1, 14);
INSERT INTO `permission_role` VALUES (1, 15);
INSERT INTO `permission_role` VALUES (1, 16);
INSERT INTO `permission_role` VALUES (1, 17);
INSERT INTO `permission_role` VALUES (1, 18);
INSERT INTO `permission_role` VALUES (1, 19);
INSERT INTO `permission_role` VALUES (1, 20);
INSERT INTO `permission_role` VALUES (1, 21);
INSERT INTO `permission_role` VALUES (1, 22);
INSERT INTO `permission_role` VALUES (1, 23);
INSERT INTO `permission_role` VALUES (1, 24);
INSERT INTO `permission_role` VALUES (1, 25);
INSERT INTO `permission_role` VALUES (1, 26);
INSERT INTO `permission_role` VALUES (1, 27);
INSERT INTO `permission_role` VALUES (1, 28);
INSERT INTO `permission_role` VALUES (1, 29);
INSERT INTO `permission_role` VALUES (1, 30);
INSERT INTO `permission_role` VALUES (1, 31);
INSERT INTO `permission_role` VALUES (1, 32);
INSERT INTO `permission_role` VALUES (1, 33);
INSERT INTO `permission_role` VALUES (1, 34);
INSERT INTO `permission_role` VALUES (1, 35);
INSERT INTO `permission_role` VALUES (1, 36);
INSERT INTO `permission_role` VALUES (1, 37);
INSERT INTO `permission_role` VALUES (1, 38);
INSERT INTO `permission_role` VALUES (1, 39);
INSERT INTO `permission_role` VALUES (1, 40);
INSERT INTO `permission_role` VALUES (1, 41);
INSERT INTO `permission_role` VALUES (1, 42);
INSERT INTO `permission_role` VALUES (1, 43);
INSERT INTO `permission_role` VALUES (1, 44);
INSERT INTO `permission_role` VALUES (1, 45);
INSERT INTO `permission_role` VALUES (1, 46);
INSERT INTO `permission_role` VALUES (1, 47);
INSERT INTO `permission_role` VALUES (1, 48);
INSERT INTO `permission_role` VALUES (1, 49);
INSERT INTO `permission_role` VALUES (1, 50);
INSERT INTO `permission_role` VALUES (1, 51);
INSERT INTO `permission_role` VALUES (1, 52);
INSERT INTO `permission_role` VALUES (1, 53);
INSERT INTO `permission_role` VALUES (1, 54);
INSERT INTO `permission_role` VALUES (1, 55);
INSERT INTO `permission_role` VALUES (1, 56);
INSERT INTO `permission_role` VALUES (1, 57);
INSERT INTO `permission_role` VALUES (1, 58);
INSERT INTO `permission_role` VALUES (1, 59);
INSERT INTO `permission_role` VALUES (1, 60);
INSERT INTO `permission_role` VALUES (1, 61);
INSERT INTO `permission_role` VALUES (1, 62);
INSERT INTO `permission_role` VALUES (1, 63);
INSERT INTO `permission_role` VALUES (1, 64);
INSERT INTO `permission_role` VALUES (1, 65);
INSERT INTO `permission_role` VALUES (1, 66);
INSERT INTO `permission_role` VALUES (1, 67);
INSERT INTO `permission_role` VALUES (1, 68);
INSERT INTO `permission_role` VALUES (1, 69);
INSERT INTO `permission_role` VALUES (1, 70);
INSERT INTO `permission_role` VALUES (1, 71);
INSERT INTO `permission_role` VALUES (1, 72);
INSERT INTO `permission_role` VALUES (1, 73);
INSERT INTO `permission_role` VALUES (1, 74);
INSERT INTO `permission_role` VALUES (1, 75);
INSERT INTO `permission_role` VALUES (1, 76);
INSERT INTO `permission_role` VALUES (1, 77);
INSERT INTO `permission_role` VALUES (1, 78);
INSERT INTO `permission_role` VALUES (1, 79);
INSERT INTO `permission_role` VALUES (1, 80);
INSERT INTO `permission_role` VALUES (1, 81);
INSERT INTO `permission_role` VALUES (1, 82);
INSERT INTO `permission_role` VALUES (1, 83);
INSERT INTO `permission_role` VALUES (1, 84);
INSERT INTO `permission_role` VALUES (1, 85);
INSERT INTO `permission_role` VALUES (1, 86);
INSERT INTO `permission_role` VALUES (1, 87);
INSERT INTO `permission_role` VALUES (1, 88);
INSERT INTO `permission_role` VALUES (1, 89);
INSERT INTO `permission_role` VALUES (1, 90);
INSERT INTO `permission_role` VALUES (1, 91);
INSERT INTO `permission_role` VALUES (1, 92);
INSERT INTO `permission_role` VALUES (1, 93);
INSERT INTO `permission_role` VALUES (2, 17);
INSERT INTO `permission_role` VALUES (2, 18);
INSERT INTO `permission_role` VALUES (2, 19);
INSERT INTO `permission_role` VALUES (2, 20);
INSERT INTO `permission_role` VALUES (2, 21);
INSERT INTO `permission_role` VALUES (2, 22);
INSERT INTO `permission_role` VALUES (2, 23);
INSERT INTO `permission_role` VALUES (2, 24);
INSERT INTO `permission_role` VALUES (2, 25);
INSERT INTO `permission_role` VALUES (2, 26);
INSERT INTO `permission_role` VALUES (2, 27);
INSERT INTO `permission_role` VALUES (2, 28);
INSERT INTO `permission_role` VALUES (2, 29);
INSERT INTO `permission_role` VALUES (2, 30);
INSERT INTO `permission_role` VALUES (2, 31);
INSERT INTO `permission_role` VALUES (2, 32);
INSERT INTO `permission_role` VALUES (2, 33);
INSERT INTO `permission_role` VALUES (2, 34);
INSERT INTO `permission_role` VALUES (2, 35);
INSERT INTO `permission_role` VALUES (2, 36);
INSERT INTO `permission_role` VALUES (2, 37);
INSERT INTO `permission_role` VALUES (2, 38);
INSERT INTO `permission_role` VALUES (2, 39);
INSERT INTO `permission_role` VALUES (2, 40);
INSERT INTO `permission_role` VALUES (2, 41);
INSERT INTO `permission_role` VALUES (2, 42);
INSERT INTO `permission_role` VALUES (2, 43);
INSERT INTO `permission_role` VALUES (2, 44);
INSERT INTO `permission_role` VALUES (2, 45);
INSERT INTO `permission_role` VALUES (2, 46);
INSERT INTO `permission_role` VALUES (2, 47);
INSERT INTO `permission_role` VALUES (2, 48);
INSERT INTO `permission_role` VALUES (2, 49);
INSERT INTO `permission_role` VALUES (2, 50);
INSERT INTO `permission_role` VALUES (2, 51);
INSERT INTO `permission_role` VALUES (2, 52);
INSERT INTO `permission_role` VALUES (2, 53);
INSERT INTO `permission_role` VALUES (2, 54);
INSERT INTO `permission_role` VALUES (2, 55);
INSERT INTO `permission_role` VALUES (2, 56);
INSERT INTO `permission_role` VALUES (2, 57);
INSERT INTO `permission_role` VALUES (2, 58);
INSERT INTO `permission_role` VALUES (2, 59);
INSERT INTO `permission_role` VALUES (2, 60);
INSERT INTO `permission_role` VALUES (2, 61);
INSERT INTO `permission_role` VALUES (2, 62);
INSERT INTO `permission_role` VALUES (2, 63);
INSERT INTO `permission_role` VALUES (2, 64);
INSERT INTO `permission_role` VALUES (2, 65);
INSERT INTO `permission_role` VALUES (2, 66);
INSERT INTO `permission_role` VALUES (2, 67);
INSERT INTO `permission_role` VALUES (2, 68);
INSERT INTO `permission_role` VALUES (2, 69);
INSERT INTO `permission_role` VALUES (2, 70);
INSERT INTO `permission_role` VALUES (2, 71);
INSERT INTO `permission_role` VALUES (2, 72);
INSERT INTO `permission_role` VALUES (2, 73);
INSERT INTO `permission_role` VALUES (2, 74);
INSERT INTO `permission_role` VALUES (2, 75);
INSERT INTO `permission_role` VALUES (2, 76);
INSERT INTO `permission_role` VALUES (2, 77);
INSERT INTO `permission_role` VALUES (2, 78);
INSERT INTO `permission_role` VALUES (2, 79);
INSERT INTO `permission_role` VALUES (2, 80);
INSERT INTO `permission_role` VALUES (2, 81);
INSERT INTO `permission_role` VALUES (2, 82);
INSERT INTO `permission_role` VALUES (2, 83);
INSERT INTO `permission_role` VALUES (2, 84);
INSERT INTO `permission_role` VALUES (2, 85);
INSERT INTO `permission_role` VALUES (2, 86);
INSERT INTO `permission_role` VALUES (2, 87);
INSERT INTO `permission_role` VALUES (2, 88);
INSERT INTO `permission_role` VALUES (2, 89);
INSERT INTO `permission_role` VALUES (2, 90);
INSERT INTO `permission_role` VALUES (2, 91);
INSERT INTO `permission_role` VALUES (2, 92);
INSERT INTO `permission_role` VALUES (2, 93);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'user_management_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (2, 'permission_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (3, 'permission_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (4, 'permission_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (5, 'permission_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (6, 'permission_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (7, 'role_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (8, 'role_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (9, 'role_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (10, 'role_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (11, 'role_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (12, 'user_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (13, 'user_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (14, 'user_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (15, 'user_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (16, 'user_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (17, 'sites_setting_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (18, 'setting_general_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (19, 'setting_general_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (20, 'setting_general_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (21, 'setting_general_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (22, 'setting_general_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (23, 'setting_home_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (24, 'setting_home_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (25, 'setting_home_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (26, 'setting_home_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (27, 'setting_home_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (28, 'guide_rule_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (29, 'guide_rule_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (30, 'guide_rule_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (31, 'guide_rule_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (32, 'guide_rule_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (33, 'guide_droplist_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (34, 'guide_droplist_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (35, 'guide_droplist_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (36, 'guide_droplist_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (37, 'guide_droplist_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (38, 'guide_faq_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (39, 'guide_faq_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (40, 'guide_faq_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (41, 'guide_faq_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (42, 'guide_faq_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (43, 'setting_medium_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (44, 'setting_medium_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (45, 'setting_medium_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (46, 'setting_medium_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (47, 'setting_medium_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (48, 'setting_item_mall_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (49, 'setting_item_mall_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (50, 'setting_item_mall_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (51, 'setting_item_mall_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (52, 'setting_item_mall_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (53, 'setting_rankings_pv_p_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (54, 'setting_rankings_pv_p_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (55, 'setting_rankings_pv_p_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (56, 'setting_rankings_pv_p_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (57, 'setting_rankings_pv_p_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (58, 'setting_rankings_guild_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (59, 'setting_rankings_guild_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (60, 'setting_rankings_guild_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (61, 'setting_rankings_guild_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (62, 'setting_rankings_guild_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (63, 'setting_download_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (64, 'setting_download_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (65, 'setting_download_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (66, 'setting_download_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (67, 'setting_download_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (68, 'support_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (69, 'support_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (70, 'support_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (71, 'support_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (72, 'support_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (73, 'setting_donate_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (74, 'setting_donate_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (75, 'setting_donate_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (76, 'setting_donate_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (77, 'setting_donate_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (78, 'setting_boss_record_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (79, 'setting_boss_record_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (80, 'setting_boss_record_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (81, 'setting_boss_record_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (82, 'setting_boss_record_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (83, 'setting_vote_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (84, 'setting_vote_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (85, 'setting_vote_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (86, 'setting_vote_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (87, 'setting_vote_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (88, 'game_user_create', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (89, 'game_user_edit', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (90, 'game_user_show', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (91, 'game_user_delete', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (92, 'game_user_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (93, 'profile_password_edit', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qa_messages
-- ----------------------------
DROP TABLE IF EXISTS `qa_messages`;
CREATE TABLE `qa_messages`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `read_at` timestamp(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qa_messages_topic_id_foreign`(`topic_id`) USING BTREE,
  INDEX `qa_messages_sender_id_foreign`(`sender_id`) USING BTREE,
  CONSTRAINT `qa_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `qa_messages_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `qa_topics` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qa_topics
-- ----------------------------
DROP TABLE IF EXISTS `qa_topics`;
CREATE TABLE `qa_topics`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qa_topics_creator_id_foreign`(`creator_id`) USING BTREE,
  INDEX `qa_topics_receiver_id_foreign`(`receiver_id`) USING BTREE,
  CONSTRAINT `qa_topics_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `qa_topics_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  INDEX `user_id_fk_9725118`(`user_id`) USING BTREE,
  INDEX `role_id_fk_9725118`(`role_id`) USING BTREE,
  CONSTRAINT `role_id_fk_9725118` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_id_fk_9725118` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (1, 1);
INSERT INTO `role_user` VALUES (2, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', NULL, NULL, NULL);
INSERT INTO `roles` VALUES (2, 'User', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('M738yotLfK3wHY5FHTrKRkL55nJwts05yczgZfkp', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNWVKWlo4OTdaWEVaT2lldzBKNGd1VU9Xd0trVkhGNlZ0TlN6Wkp5ZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9mcm9udGVuZC9ob21lIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTg7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwLyI7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1714309061);

-- ----------------------------
-- Table structure for setting_boss_records
-- ----------------------------
DROP TABLE IF EXISTS `setting_boss_records`;
CREATE TABLE `setting_boss_records`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_boss_records
-- ----------------------------
INSERT INTO `setting_boss_records` VALUES (1, 'Boss Record', 'BOSS RECORD', '2024-04-27 14:04:18', '2024-04-27 14:04:18', NULL);

-- ----------------------------
-- Table structure for setting_donates
-- ----------------------------
DROP TABLE IF EXISTS `setting_donates`;
CREATE TABLE `setting_donates`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setting_downloads
-- ----------------------------
DROP TABLE IF EXISTS `setting_downloads`;
CREATE TABLE `setting_downloads`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_downloads
-- ----------------------------
INSERT INTO `setting_downloads` VALUES (1, 'Download', 'DOWNLOAD', '<div class=\"raw-html-embed\"><center>\r\n        <div style=\"width: 50%;margin-top:25px;\">\r\n            <table class=\"nice_table\">\r\n                <tbody><tr>\r\n                    <td style=\"width:500px;\">Shaiya Ghostwire | <strong style=\"color: #e8a71b;\"> GOOGLE DRIVE </strong><p>05/04/2024 - 2,7 GB</p></td>\r\n                    <td> <input style=\"cursor: pointer;\" type=\"submit\" name=\"login_submit\" value=\"DOWNLOAD\" onclick=\"location.href=\'https://drive.google.com/file/d/10K7EzYJzQ9jwyXKRRLZv2lVyP1t11v3U/view?usp=sharing\';\"></td>\r\n                </tr>\r\n                </tbody></table>\r\n            <table class=\"nice_table\">\r\n                <tbody><tr>\r\n                    <td style=\"width:500px;\">Shaiya Ghostwire | <strong style=\"color: #e8a71b;\"> MEGA </strong><p>05/04/2024 - 2,7 GB</p></td>\r\n                    <td> <input style=\"cursor: pointer;\" type=\"submit\" name=\"login_submit\" value=\"DOWNLOAD\" onclick=\"location.href=\' https://mega.nz/file/x3dBELqY#uFbvxPLxtF4NMsCSXnHirANKBAGXhb8hrkxlhr2Iq-g\';\"></td>\r\n\r\n                </tr>\r\n                </tbody></table>\r\n            <table class=\"nice_table\">\r\n                <tbody><tr>\r\n                    <td style=\"width:500px;\">Shaiya Ghostwire | <strong style=\"color: #e8a71b;\"> MEDIAFIRE </strong><p>05/04/2024 - 2,7 GB</p></td>\r\n                    <td> <input style=\"cursor: pointer;\" type=\"submit\" name=\"login_submit\" value=\"DOWNLOAD\" onclick=\"location.href=\'https://www.mediafire.com/file/xgubyqoo9kl6pc1/Ghostwire.rar/file\';\"></td>\r\n\r\n                </tr>\r\n                </tbody></table>\r\n        </div>\r\n    </center></div>', '2024-04-27 14:01:17', '2024-04-27 14:02:38', NULL);

-- ----------------------------
-- Table structure for setting_generals
-- ----------------------------
DROP TABLE IF EXISTS `setting_generals`;
CREATE TABLE `setting_generals`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url_discord` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_des` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_generals
-- ----------------------------
INSERT INTO `setting_generals` VALUES (1, 'Shaiyald', 'https://www.facebook.com/shaiyaghostwire', 'https://discord.gg/shaiyaghostwire', NULL, NULL, '2024-04-27 07:37:07', '2024-04-27 07:37:07', NULL);
INSERT INTO `setting_generals` VALUES (2, 'Shaiyald', 'https://www.facebook.com/shaiyaghostwire', 'https://discord.gg/shaiyaghostwire', NULL, NULL, '2024-04-27 07:38:47', '2024-04-27 07:38:55', '2024-04-27 07:38:55');

-- ----------------------------
-- Table structure for setting_homes
-- ----------------------------
DROP TABLE IF EXISTS `setting_homes`;
CREATE TABLE `setting_homes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `events_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `events_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `announcement_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `announcement_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `content_server_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_homes
-- ----------------------------
INSERT INTO `setting_homes` VALUES (1, 'Home', 'NOTICE', 'EVENT', '<div class=\"raw-html-embed\"><h5 style=\"font-weight: bold;color:#ccc;\" \'=\"\">🔴YouTube PvP video event 🔴 02/04/2024</h5> <p></p><br>\r\n<div class=\"text\"><p markdown=\"1\">A PvP video event will be held for 2 weeks after the server opens.\r\nThe subject of the video is PvP only and must be uploaded to your personal YouTube channel.\r\n(No participation in other channels)\r\n\r\nEvent Period:\r\nApril 5, 2024 ~ April 19, 2024\r\n\r\nAnnouncement of winners\r\nApril 22, 2024\r\n\r\nEvent Rewards\r\n1st place: 30$ + 2k sp\r\n2nd place: 15$ + 1k sp\r\n3rd place: 2k sp\r\n4th place: 1.5k sp\r\n5th place: 1k sp\r\n\r\nA total of 5 people are selected, one from each \r\n\r\nThe chances of winning are higher if the video is high-definition or high-quality. </p>\r\n     </div></div>', 'ANNOUNCEMENT', '<div class=\"raw-html-embed\"><h5 style=\"font-weight: bold;color:#ccc;\" \'=\"\">✨OPEN DATE✨ 02/04/2024</h5> <p></p><br>\r\n<div class=\"text\"><p markdown=\"1\">Server Grand opening: April 5\r\n\r\nInvite lots of friends.\r\nSee you soon in the game\r\n</p>\r\n     </div></div>', '<div class=\"raw-html-embed\"><table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">Publication Date</td>\r\n    		<td><div class=\"onlinecount\"><span>05/04/2024</span></div></td>\r\n    	</tr>\r\n    </tbody></table>\r\n    <table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">Client Version</td>\r\n    		<td><div class=\"onlinecount\"><span>4.5</span></div></td>\r\n    	</tr>\r\n    </tbody></table>\r\n      <table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">Max Level</td>\r\n    		<td><div class=\"onlinecount\"><span>60</span></div></td>\r\n    	</tr>\r\n    </tbody></table>\r\n    <table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">Kill Rate</td>\r\n    		<td><div class=\"onlinecount\"><span>x1</span></div></td>\r\n    	</tr>\r\n    </tbody></table> \r\n	    <table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">Exp Rate</td>\r\n    		<td><div class=\"onlinecount\"><span>x100</span></div></td>\r\n    	</tr>\r\n    </tbody></table> \r\n    <table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">Maximum Enchant</td>\r\n    		<td><div class=\"onlinecount\"><span>[Armor +10 / Weapon +10]</span></div></td>\r\n    	</tr>\r\n    </tbody></table>   \r\n    <table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">GRB Schedule</td>\r\n    		<td><div class=\"onlinecount\"><span>Sunday 20:00 GMT +8</span></div></td>\r\n    	</tr>\r\n    </tbody></table>\r\n    <table class=\"nice_table\">\r\n    	<tbody><tr>\r\n    		<td width=\"175px;\">Server Status</td>\r\n    		<td><div class=\"onlinecount\"><span><span style=\"color: #4ec41d\">ONLINE</span></span></div></td>\r\n    	</tr>\r\n    </tbody></table></div>', '2024-04-27 07:44:18', '2024-04-27 13:49:31', NULL);

-- ----------------------------
-- Table structure for setting_item_malls
-- ----------------------------
DROP TABLE IF EXISTS `setting_item_malls`;
CREATE TABLE `setting_item_malls`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_item_malls
-- ----------------------------
INSERT INTO `setting_item_malls` VALUES (1, 'Item Mall', 'ITEM MALL', '<div class=\"raw-html-embed\"><center>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=1\">FEATURED</a>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=2\">ARMOR</a>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=3\">Goddess Lv 54 Weapon</a>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=4\">Goddess Lv 56 Weapon</a>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=5\">Cape</a>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=6\">GM Services</a>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=7\">Tag Object</a>\r\n                <a style=\"margin: 5px;width: 200px;\" class=\"nice_button\" href=\"?cat=8\">Noss</a>\r\n            </center> </div>', '2024-04-27 14:10:12', '2024-04-27 14:10:12', NULL);

-- ----------------------------
-- Table structure for setting_media
-- ----------------------------
DROP TABLE IF EXISTS `setting_media`;
CREATE TABLE `setting_media`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_media
-- ----------------------------
INSERT INTO `setting_media` VALUES (1, 'Media', 'MEDIA', '<div class=\"raw-html-embed\"><center>\r\n            <iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/WsP7xhuu6H0\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe>\r\n        </center></div>', '2024-04-27 13:56:56', '2024-04-27 13:56:56', NULL);

-- ----------------------------
-- Table structure for setting_rankings_guilds
-- ----------------------------
DROP TABLE IF EXISTS `setting_rankings_guilds`;
CREATE TABLE `setting_rankings_guilds`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `num_display` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_rankings_guilds
-- ----------------------------
INSERT INTO `setting_rankings_guilds` VALUES (1, 'Guild Ranking', 'GUILD RANKING', 20, '2024-04-27 14:20:03', '2024-04-27 14:20:03', NULL);

-- ----------------------------
-- Table structure for setting_rankings_pv_ps
-- ----------------------------
DROP TABLE IF EXISTS `setting_rankings_pv_ps`;
CREATE TABLE `setting_rankings_pv_ps`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `num_display` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_rankings_pv_ps
-- ----------------------------
INSERT INTO `setting_rankings_pv_ps` VALUES (1, 'Pvp Ranking', 'PVP RANKING', 20, '2024-04-27 14:15:24', '2024-04-27 14:15:24', NULL);

-- ----------------------------
-- Table structure for setting_votes
-- ----------------------------
DROP TABLE IF EXISTS `setting_votes`;
CREATE TABLE `setting_votes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supports
-- ----------------------------
DROP TABLE IF EXISTS `supports`;
CREATE TABLE `supports`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` datetime(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@admin.com', '2024-04-26 13:18:43', '$2y$12$ouQwC0v0cNAzMXKBjQp67.HFnUtOayfgTXgsz8ulMySwmlfuGOu2G', 'MgBikVAKyK5VPsoNqiNEtaCYcVkXoaRyiBr8de1LCZYKXcnljuKJ6e2S8Wa1', '2024-04-26 13:18:43', '2024-04-26 13:18:43', NULL);
INSERT INTO `users` VALUES (2, 'loild', 'loild@baityapp.online', '2024-04-26 13:18:43', '$2y$12$GLdGZZ4FkFwn7vU4W2E6HuEAiICO5IQ/CUIxglMntLA6Q.lDB18IK', NULL, '2024-04-26 06:49:36', '2024-04-28 12:52:54', NULL);

SET FOREIGN_KEY_CHECKS = 1;

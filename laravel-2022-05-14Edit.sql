/*
 Navicat Premium Data Transfer

 Source Server         : Laravel
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : laravel

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 14/05/2022 13:07:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subject`(`subject_type`, `subject_id`) USING BTREE,
  INDEX `causer`(`causer_type`, `causer_id`) USING BTREE,
  INDEX `activity_log_log_name_index`(`log_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
INSERT INTO `activity_log` VALUES (1034, 'default', 'created', 'App\\Models\\Balance', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"117714.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"117714.00\",\"balance_date\":\"2022-05-08\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-07 21:22:32', '2022-05-07 21:22:32');
INSERT INTO `activity_log` VALUES (1035, 'default', 'created', 'App\\Models\\Balance', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"117714.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"117714.00\",\"balance_date\":\"2022-05-11\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-11 05:20:09', '2022-05-11 05:20:09');
INSERT INTO `activity_log` VALUES (1036, 'default', 'created', 'App\\Models\\Order', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":805,\"vat\":0,\"discount\":0,\"grandtotal\":805,\"kh_grandtotal\":null}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1037, 'default', 'updated', 'App\\Models\\Balance', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"117714.00\",\"income\":\"805.00\",\"withdraw\":\"0.00\",\"balance\":\"118519.00\",\"balance_date\":\"2022-05-11\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"117714.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"117714.00\",\"balance_date\":\"2022-05-11\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1038, 'default', 'created', 'App\\Models\\OrderDetail', 390, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":63,\"product_id\":24,\"sellprice\":19,\"quantity\":\"10.00\"}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1039, 'default', 'updated', 'App\\Models\\Stock', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":30}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1040, 'default', 'created', 'App\\Models\\OrderDetail', 391, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":63,\"product_id\":37,\"sellprice\":21.5,\"quantity\":\"10.00\"}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1041, 'default', 'updated', 'App\\Models\\Stock', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":115},\"old\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":125}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1042, 'default', 'created', 'App\\Models\\OrderDetail', 392, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":63,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1043, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":55}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1044, 'default', 'created', 'App\\Models\\OrderDetail', 393, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":63,\"product_id\":9,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1045, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":320},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":330}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1046, 'default', 'created', 'App\\Models\\OrderDetail', 394, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":63,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1047, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":330},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":340}}', '2022-05-11 08:08:33', '2022-05-11 08:08:33');
INSERT INTO `activity_log` VALUES (1048, 'default', 'created', 'App\\Models\\Balance', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"118519.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"118519.00\",\"balance_date\":\"2022-05-12\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-12 01:15:35', '2022-05-12 01:15:35');
INSERT INTO `activity_log` VALUES (1049, 'default', 'created', 'App\\Models\\Order', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":9,\"user_id\":1,\"subtotal\":4270,\"vat\":0,\"discount\":0,\"grandtotal\":4270,\"kh_grandtotal\":null}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1050, 'default', 'updated', 'App\\Models\\Balance', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"118519.00\",\"income\":\"4270.00\",\"withdraw\":\"0.00\",\"balance\":\"122789.00\",\"balance_date\":\"2022-05-12\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"118519.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"118519.00\",\"balance_date\":\"2022-05-12\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1051, 'default', 'created', 'App\\Models\\OrderDetail', 395, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":9,\"sellprice\":13,\"quantity\":\"30.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1052, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":290},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":320}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1053, 'default', 'created', 'App\\Models\\OrderDetail', 396, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":10,\"sellprice\":20,\"quantity\":\"10.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1054, 'default', 'updated', 'App\\Models\\Stock', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":78},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":88}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1055, 'default', 'created', 'App\\Models\\OrderDetail', 397, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":33,\"sellprice\":24,\"quantity\":\"10.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1056, 'default', 'updated', 'App\\Models\\Stock', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":8},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":18}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1057, 'default', 'created', 'App\\Models\\OrderDetail', 398, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":24,\"sellprice\":19,\"quantity\":\"10.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1058, 'default', 'updated', 'App\\Models\\Stock', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":20}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1059, 'default', 'created', 'App\\Models\\OrderDetail', 399, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":51,\"sellprice\":16.5,\"quantity\":\"40.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1060, 'default', 'updated', 'App\\Models\\Stock', 45, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":170}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1061, 'default', 'created', 'App\\Models\\OrderDetail', 400, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"50.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1062, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":280},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":330}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1063, 'default', 'created', 'App\\Models\\OrderDetail', 401, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":6,\"sellprice\":16.5,\"quantity\":\"40.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1064, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":280},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":320}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1065, 'default', 'created', 'App\\Models\\OrderDetail', 402, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":7,\"sellprice\":14.5,\"quantity\":\"40.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1066, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":80}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1067, 'default', 'created', 'App\\Models\\OrderDetail', 403, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":64,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"50.00\"}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1068, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":170},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":220}}', '2022-05-12 01:23:24', '2022-05-12 01:23:24');
INSERT INTO `activity_log` VALUES (1069, 'default', 'updated', 'App\\Models\\Product', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"LCD IPHONE 11pro max gx\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\\u200b IPHONE 11 pro max\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80},\"old\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"11pro max gx\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80}}', '2022-05-12 01:37:04', '2022-05-12 01:37:04');
INSERT INTO `activity_log` VALUES (1070, 'default', 'updated', 'App\\Models\\Product', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"LCD IPHONE 11pro max gx\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\\u200b\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80},\"old\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"LCD IPHONE 11pro max gx\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\\u200b IPHONE 11 pro max\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80}}', '2022-05-12 01:38:40', '2022-05-12 01:38:40');
INSERT INTO `activity_log` VALUES (1071, 'default', 'updated', 'App\\Models\\Product', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"IPHONE 11pro max gx\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\\u200b\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80},\"old\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"LCD IPHONE 11pro max gx\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\\u200b\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80}}', '2022-05-12 01:40:21', '2022-05-12 01:40:21');
INSERT INTO `activity_log` VALUES (1072, 'default', 'updated', 'App\\Models\\Product', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"IPHONE 6G B\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6g b\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 01:44:26', '2022-05-12 01:44:26');
INSERT INTO `activity_log` VALUES (1073, 'default', 'updated', 'App\\Models\\Product', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6G B\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"IPHONE 6G B\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 01:53:34', '2022-05-12 01:53:34');
INSERT INTO `activity_log` VALUES (1074, 'default', 'updated', 'App\\Models\\Product', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"iphone 6g w\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"6g w\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 01:56:04', '2022-05-12 01:56:04');
INSERT INTO `activity_log` VALUES (1075, 'default', 'updated', 'App\\Models\\Product', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"6g iphone\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"iphone 6g w\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:01:56', '2022-05-12 02:01:56');
INSERT INTO `activity_log` VALUES (1076, 'default', 'updated', 'App\\Models\\Product', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"6g w iphone\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"6g iphone\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:02:32', '2022-05-12 02:02:32');
INSERT INTO `activity_log` VALUES (1077, 'default', 'updated', 'App\\Models\\Product', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6g b\",\"kh_name\":\"lc\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6G B\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:17:58', '2022-05-12 02:17:58');
INSERT INTO `activity_log` VALUES (1078, 'default', 'updated', 'App\\Models\\Product', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6g b\",\"kh_name\":\"lcd iphone\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6g b\",\"kh_name\":\"lc\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:18:52', '2022-05-12 02:18:52');
INSERT INTO `activity_log` VALUES (1079, 'default', 'updated', 'App\\Models\\Product', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6g b\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6g b\",\"kh_name\":\"lcd iphone\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:19:32', '2022-05-12 02:19:32');
INSERT INTO `activity_log` VALUES (1080, 'default', 'updated', 'App\\Models\\Product', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6G B\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349869\",\"en_name\":\"6g b\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:21:02', '2022-05-12 02:21:02');
INSERT INTO `activity_log` VALUES (1081, 'default', 'updated', 'App\\Models\\Product', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"6G W\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"908601349868\",\"en_name\":\"6g w iphone\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:21:35', '2022-05-12 02:21:35');
INSERT INTO `activity_log` VALUES (1082, 'default', 'updated', 'App\\Models\\Product', 40, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349886\",\"en_name\":\"6P B\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5},\"old\":{\"category_id\":5,\"code\":\"908601349886\",\"en_name\":\"6p b\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5}}', '2022-05-12 02:22:20', '2022-05-12 02:22:20');
INSERT INTO `activity_log` VALUES (1083, 'default', 'updated', 'App\\Models\\Product', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349885\",\"en_name\":\"6P W\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5},\"old\":{\"category_id\":5,\"code\":\"908601349885\",\"en_name\":\"6p w\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5}}', '2022-05-12 02:22:41', '2022-05-12 02:22:41');
INSERT INTO `activity_log` VALUES (1084, 'default', 'updated', 'App\\Models\\Product', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349867\",\"en_name\":\"6SP W\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":5,\"code\":\"908601349867\",\"en_name\":\"6sp w\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14}}', '2022-05-12 02:23:06', '2022-05-12 02:23:06');
INSERT INTO `activity_log` VALUES (1085, 'default', 'updated', 'App\\Models\\Product', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349864\",\"en_name\":\"7P B\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":5,\"code\":\"908601349864\",\"en_name\":\"7p b\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:23:40', '2022-05-12 02:23:40');
INSERT INTO `activity_log` VALUES (1086, 'default', 'updated', 'App\\Models\\Product', 43, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"143565364348\",\"en_name\":\"7P W\",\"kh_name\":\"LCD IPHONE\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":5,\"code\":\"143565364348\",\"en_name\":\"7p w\",\"kh_name\":\"LCD IPHONE\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:23:53', '2022-05-12 02:23:53');
INSERT INTO `activity_log` VALUES (1087, 'default', 'updated', 'App\\Models\\Product', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349866\",\"en_name\":\"8P B\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":5,\"code\":\"908601349866\",\"en_name\":\"8p b\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:25:26', '2022-05-12 02:25:26');
INSERT INTO `activity_log` VALUES (1088, 'default', 'updated', 'App\\Models\\Product', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349865\",\"en_name\":\"8P W\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":5,\"code\":\"908601349865\",\"en_name\":\"8p w\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:25:37', '2022-05-12 02:25:37');
INSERT INTO `activity_log` VALUES (1089, 'default', 'updated', 'App\\Models\\Product', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"11PRO MAX\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80},\"old\":{\"category_id\":5,\"code\":\"908601349863\",\"en_name\":\"IPHONE 11pro max gx\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\\u200b\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":80}}', '2022-05-12 02:26:43', '2022-05-12 02:26:43');
INSERT INTO `activity_log` VALUES (1090, 'default', 'updated', 'App\\Models\\Product', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349850\",\"en_name\":\"A15\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15},\"old\":{\"category_id\":1,\"code\":\"908601349850\",\"en_name\":\"a15\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15}}', '2022-05-12 02:28:04', '2022-05-12 02:28:04');
INSERT INTO `activity_log` VALUES (1091, 'default', 'updated', 'App\\Models\\Product', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349884\",\"en_name\":\"A15 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":18.5},\"old\":{\"category_id\":1,\"code\":\"908601349884\",\"en_name\":\"a15 ori\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":18.5}}', '2022-05-12 02:28:35', '2022-05-12 02:28:35');
INSERT INTO `activity_log` VALUES (1092, 'default', 'updated', 'App\\Models\\Product', 45, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"108960149410\",\"en_name\":\"A16\",\"kh_name\":\"LCD OPPO\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":17.5},\"old\":{\"category_id\":5,\"code\":\"108960149410\",\"en_name\":\"a16\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":175}}', '2022-05-12 02:29:07', '2022-05-12 02:29:07');
INSERT INTO `activity_log` VALUES (1093, 'default', 'updated', 'App\\Models\\Product', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"571501119594\",\"en_name\":\"A1K\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":1,\"code\":\"571501119594\",\"en_name\":\"a1k\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":11}}', '2022-05-12 02:29:35', '2022-05-12 02:29:35');
INSERT INTO `activity_log` VALUES (1094, 'default', 'updated', 'App\\Models\\Product', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"316466814841\",\"en_name\":\"A3S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"1651156393.jpg\",\"sale_price\":13.5},\"old\":{\"category_id\":1,\"code\":\"316466814841\",\"en_name\":\"a3s\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"1651156393.jpg\",\"sale_price\":13.5}}', '2022-05-12 02:30:15', '2022-05-12 02:30:15');
INSERT INTO `activity_log` VALUES (1095, 'default', 'updated', 'App\\Models\\Product', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":1,\"code\":\"908601349876\",\"en_name\":\"a3s \\u17a2\\u178f\\u17cb\\u1799\\u1780\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":1,\"code\":\"908601349876\",\"en_name\":\"a3s a\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:31:58', '2022-05-12 02:31:58');
INSERT INTO `activity_log` VALUES (1096, 'default', 'updated', 'App\\Models\\Product', 51, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"409509970859\",\"en_name\":\"A3S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":5,\"code\":\"409509970859\",\"en_name\":\"a3s ori\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-12 02:33:08', '2022-05-12 02:33:08');
INSERT INTO `activity_log` VALUES (1097, 'default', 'updated', 'App\\Models\\Product', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349871\",\"en_name\":\"A52 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19.5},\"old\":{\"category_id\":1,\"code\":\"908601349871\",\"en_name\":\"a52 ori\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19.5}}', '2022-05-12 02:33:35', '2022-05-12 02:33:35');
INSERT INTO `activity_log` VALUES (1098, 'default', 'updated', 'App\\Models\\Product', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349873\",\"en_name\":\"A53\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19},\"old\":{\"category_id\":1,\"code\":\"908601349873\",\"en_name\":\"a53\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19}}', '2022-05-12 02:33:50', '2022-05-12 02:33:50');
INSERT INTO `activity_log` VALUES (1099, 'default', 'updated', 'App\\Models\\Product', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349858\",\"en_name\":\"A53 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21},\"old\":{\"category_id\":1,\"code\":\"908601349858\",\"en_name\":\"a53 ori\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21}}', '2022-05-12 02:34:11', '2022-05-12 02:34:11');
INSERT INTO `activity_log` VALUES (1100, 'default', 'updated', 'App\\Models\\Product', 37, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349883\",\"en_name\":\"A54 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21.5},\"old\":{\"category_id\":1,\"code\":\"908601349883\",\"en_name\":\"a54 ori\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21.5}}', '2022-05-12 02:34:41', '2022-05-12 02:34:41');
INSERT INTO `activity_log` VALUES (1101, 'default', 'updated', 'App\\Models\\Product', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349849\",\"en_name\":\"A5S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5},\"old\":{\"category_id\":1,\"code\":\"908601349849\",\"en_name\":\"a5s\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5}}', '2022-05-12 02:35:00', '2022-05-12 02:35:00');
INSERT INTO `activity_log` VALUES (1102, 'default', 'updated', 'App\\Models\\Product', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349870\",\"en_name\":\"A5S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19.5},\"old\":{\"category_id\":1,\"code\":\"908601349870\",\"en_name\":\"a5s ori\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19.5}}', '2022-05-12 02:35:17', '2022-05-12 02:35:17');
INSERT INTO `activity_log` VALUES (1103, 'default', 'updated', 'App\\Models\\Product', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349861\",\"en_name\":\"A83 B\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5},\"old\":{\"category_id\":1,\"code\":\"908601349861\",\"en_name\":\"a83 b\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5}}', '2022-05-12 02:35:40', '2022-05-12 02:35:40');
INSERT INTO `activity_log` VALUES (1104, 'default', 'updated', 'App\\Models\\Product', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349860\",\"en_name\":\"A83 W\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5},\"old\":{\"category_id\":1,\"code\":\"908601349860\",\"en_name\":\"a83 w\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5}}', '2022-05-12 02:36:01', '2022-05-12 02:36:01');
INSERT INTO `activity_log` VALUES (1105, 'default', 'updated', 'App\\Models\\Product', 46, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"680278947227\",\"en_name\":\"C11 2021\",\"kh_name\":\"LCD REALME\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":5,\"code\":\"680278947227\",\"en_name\":\"c11 2021\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":null,\"image\":\"no image created\",\"sale_price\":17}}', '2022-05-12 02:36:57', '2022-05-12 02:36:57');
INSERT INTO `activity_log` VALUES (1106, 'default', 'updated', 'App\\Models\\Product', 53, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"672931669645\",\"en_name\":\"C15\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":5,\"code\":\"672931669645\",\"en_name\":\"c15\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-12 02:37:30', '2022-05-12 02:37:30');
INSERT INTO `activity_log` VALUES (1107, 'default', 'updated', 'App\\Models\\Product', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349852\",\"en_name\":\"C3 ORI\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":5,\"code\":\"908601349852\",\"en_name\":\"c3 ori\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":165}}', '2022-05-12 02:38:17', '2022-05-12 02:38:17');
INSERT INTO `activity_log` VALUES (1108, 'default', 'updated', 'App\\Models\\Product', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349874\",\"en_name\":\"F11PRO\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5},\"old\":{\"category_id\":1,\"code\":\"908601349874\",\"en_name\":\"f11pro\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-12 02:38:55', '2022-05-12 02:38:55');
INSERT INTO `activity_log` VALUES (1109, 'default', 'updated', 'App\\Models\\Product', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349878\",\"en_name\":\"C3\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":1,\"code\":\"908601349878\",\"en_name\":\"c3\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14}}', '2022-05-12 02:40:22', '2022-05-12 02:40:22');
INSERT INTO `activity_log` VALUES (1110, 'default', 'updated', 'App\\Models\\Product', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349857\",\"en_name\":\"F11PRO ORI\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21.5},\"old\":{\"category_id\":1,\"code\":\"908601349857\",\"en_name\":\"f11pro ori\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21.5}}', '2022-05-12 02:40:51', '2022-05-12 02:40:51');
INSERT INTO `activity_log` VALUES (1111, 'default', 'updated', 'App\\Models\\Product', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349857\",\"en_name\":\"F11PRO ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21.5},\"old\":{\"category_id\":5,\"code\":\"908601349857\",\"en_name\":\"F11PRO ORI\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21.5}}', '2022-05-12 02:41:27', '2022-05-12 02:41:27');
INSERT INTO `activity_log` VALUES (1112, 'default', 'updated', 'App\\Models\\Product', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349880\",\"en_name\":\"F7\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":1,\"code\":\"908601349880\",\"en_name\":\"f7\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-12 02:41:50', '2022-05-12 02:41:50');
INSERT INTO `activity_log` VALUES (1113, 'default', 'updated', 'App\\Models\\Product', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349851\",\"en_name\":\"F9\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5},\"old\":{\"category_id\":1,\"code\":\"908601349851\",\"en_name\":\"f9\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-12 02:42:07', '2022-05-12 02:42:07');
INSERT INTO `activity_log` VALUES (1114, 'default', 'updated', 'App\\Models\\Product', 41, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349887\",\"en_name\":\"POVA1\",\"kh_name\":\"LCD POVA\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20.5},\"old\":{\"category_id\":5,\"code\":\"908601349887\",\"en_name\":\"pova1\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20.5}}', '2022-05-12 02:42:41', '2022-05-12 02:42:41');
INSERT INTO `activity_log` VALUES (1115, 'default', 'updated', 'App\\Models\\Product', 42, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349888\",\"en_name\":\"POVA2\",\"kh_name\":\"LCD POVA\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":22},\"old\":{\"category_id\":5,\"code\":\"908601349888\",\"en_name\":\"pova2\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":22}}', '2022-05-12 02:43:10', '2022-05-12 02:43:10');
INSERT INTO `activity_log` VALUES (1116, 'default', 'updated', 'App\\Models\\Product', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349859\",\"en_name\":\"RENO2F\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":22.5},\"old\":{\"category_id\":1,\"code\":\"908601349859\",\"en_name\":\"reno2f\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":22.5}}', '2022-05-12 02:43:34', '2022-05-12 02:43:34');
INSERT INTO `activity_log` VALUES (1117, 'default', 'updated', 'App\\Models\\Product', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349862\",\"en_name\":\"X GX\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":41},\"old\":{\"category_id\":5,\"code\":\"908601349862\",\"en_name\":\"x gx\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":41}}', '2022-05-12 02:44:02', '2022-05-12 02:44:02');
INSERT INTO `activity_log` VALUES (1118, 'default', 'updated', 'App\\Models\\Product', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"441083965829\",\"en_name\":\"XS MAX OLED\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":60},\"old\":{\"category_id\":5,\"code\":\"441083965829\",\"en_name\":\"xs max oled\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":60}}', '2022-05-12 02:44:25', '2022-05-12 02:44:25');
INSERT INTO `activity_log` VALUES (1119, 'default', 'updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349853\",\"en_name\":\"Y12\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":5,\"code\":\"908601349853\",\"en_name\":\"y12\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:45:12', '2022-05-12 02:45:12');
INSERT INTO `activity_log` VALUES (1120, 'default', 'updated', 'App\\Models\\Product', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349854\",\"en_name\":\"Y12S\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":1,\"code\":\"908601349854\",\"en_name\":\"y12s\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:45:39', '2022-05-12 02:45:39');
INSERT INTO `activity_log` VALUES (1121, 'default', 'updated', 'App\\Models\\Product', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349875\",\"en_name\":\"y12s \\u17a2\\u178f\\u17cb\\u1799\\u1780\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5},\"old\":{\"category_id\":1,\"code\":\"908601349875\",\"en_name\":\"y12s a\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5}}', '2022-05-12 02:46:29', '2022-05-12 02:46:29');
INSERT INTO `activity_log` VALUES (1122, 'default', 'updated', 'App\\Models\\Product', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349872\",\"en_name\":\"Y12S ORI\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20},\"old\":{\"category_id\":1,\"code\":\"908601349872\",\"en_name\":\"y12s ori\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20}}', '2022-05-12 02:47:06', '2022-05-12 02:47:06');
INSERT INTO `activity_log` VALUES (1123, 'default', 'updated', 'App\\Models\\Product', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349856\",\"en_name\":\"Y19\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20},\"old\":{\"category_id\":1,\"code\":\"908601349856\",\"en_name\":\"y19\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20}}', '2022-05-12 02:47:25', '2022-05-12 02:47:25');
INSERT INTO `activity_log` VALUES (1124, 'default', 'updated', 'App\\Models\\Product', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"163793124994\",\"en_name\":\"Y21\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":5,\"code\":\"163793124994\",\"en_name\":\"y21\",\"kh_name\":\"\\u17a2\\u17c1\\u1780\\u17d2\\u179a\\u1784\\u17cb\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17}}', '2022-05-12 02:47:44', '2022-05-12 02:47:44');
INSERT INTO `activity_log` VALUES (1125, 'default', 'updated', 'App\\Models\\Product', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349879\",\"en_name\":\"Y30 ORI\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":24},\"old\":{\"category_id\":1,\"code\":\"908601349879\",\"en_name\":\"y30 ori\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":24}}', '2022-05-12 02:48:18', '2022-05-12 02:48:18');
INSERT INTO `activity_log` VALUES (1126, 'default', 'updated', 'App\\Models\\Product', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349881\",\"en_name\":\"Y81\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":1,\"code\":\"908601349881\",\"en_name\":\"y81\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14}}', '2022-05-12 02:48:32', '2022-05-12 02:48:32');
INSERT INTO `activity_log` VALUES (1127, 'default', 'updated', 'App\\Models\\Product', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349882\",\"en_name\":\"Y85\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":1,\"code\":\"908601349882\",\"en_name\":\"y85\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17}}', '2022-05-12 02:48:44', '2022-05-12 02:48:44');
INSERT INTO `activity_log` VALUES (1128, 'default', 'updated', 'App\\Models\\Product', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349855\",\"en_name\":\"Y91\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13},\"old\":{\"category_id\":1,\"code\":\"908601349855\",\"en_name\":\"y91\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13}}', '2022-05-12 02:49:00', '2022-05-12 02:49:00');
INSERT INTO `activity_log` VALUES (1129, 'default', 'updated', 'App\\Models\\Product', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349877\",\"en_name\":\"y91 \\u17a2\\u178f\\u17cb\\u1799\\u1780\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":1,\"code\":\"908601349877\",\"en_name\":\"y91 a\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-12 02:49:27', '2022-05-12 02:49:27');
INSERT INTO `activity_log` VALUES (1130, 'default', 'updated', 'App\\Models\\Product', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349870\",\"en_name\":\"A5S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19},\"old\":{\"category_id\":5,\"code\":\"908601349870\",\"en_name\":\"A5S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19.5}}', '2022-05-12 02:57:38', '2022-05-12 02:57:38');
INSERT INTO `activity_log` VALUES (1131, 'default', 'updated', 'App\\Models\\Product', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349874\",\"en_name\":\"F11PRO\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":18},\"old\":{\"category_id\":5,\"code\":\"908601349874\",\"en_name\":\"F11PRO\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-12 02:57:50', '2022-05-12 02:57:50');
INSERT INTO `activity_log` VALUES (1132, 'default', 'updated', 'App\\Models\\Product', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349851\",\"en_name\":\"F9\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":5,\"code\":\"908601349851\",\"en_name\":\"F9\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-12 02:57:59', '2022-05-12 02:57:59');
INSERT INTO `activity_log` VALUES (1133, 'default', 'updated', 'App\\Models\\Brand', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"VIVO\",\"kh_name\":null,\"description\":null},\"old\":{\"name\":\"Vivo\",\"kh_name\":null,\"description\":null}}', '2022-05-12 03:03:15', '2022-05-12 03:03:15');
INSERT INTO `activity_log` VALUES (1134, 'default', 'updated', 'App\\Models\\Brand', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"SAMSUNG\",\"kh_name\":null,\"description\":null},\"old\":{\"name\":\"Samsung\",\"kh_name\":null,\"description\":null}}', '2022-05-12 03:03:26', '2022-05-12 03:03:26');
INSERT INTO `activity_log` VALUES (1135, 'default', 'updated', 'App\\Models\\Brand', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"REALME\",\"kh_name\":null,\"description\":null},\"old\":{\"name\":\"RealMe\",\"kh_name\":null,\"description\":null}}', '2022-05-12 03:03:38', '2022-05-12 03:03:38');
INSERT INTO `activity_log` VALUES (1136, 'default', 'updated', 'App\\Models\\Brand', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"OPPO\",\"kh_name\":null,\"description\":null},\"old\":{\"name\":\"Oppo\",\"kh_name\":null,\"description\":null}}', '2022-05-12 03:03:47', '2022-05-12 03:03:47');
INSERT INTO `activity_log` VALUES (1137, 'default', 'updated', 'App\\Models\\Brand', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"HUAWEI\",\"kh_name\":null,\"description\":null},\"old\":{\"name\":\"Huawei\",\"kh_name\":null,\"description\":null}}', '2022-05-12 03:04:26', '2022-05-12 03:04:26');
INSERT INTO `activity_log` VALUES (1138, 'default', 'updated', 'App\\Models\\Brand', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"APPLE\",\"kh_name\":null,\"description\":null},\"old\":{\"name\":\"Apple\",\"kh_name\":null,\"description\":null}}', '2022-05-12 03:04:44', '2022-05-12 03:04:44');
INSERT INTO `activity_log` VALUES (1139, 'default', 'created', 'App\\Models\\Balance', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"122789.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"122789.00\",\"balance_date\":\"2022-05-13\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-13 01:59:54', '2022-05-13 01:59:54');
INSERT INTO `activity_log` VALUES (1140, 'default', 'created', 'App\\Models\\Order', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":315,\"vat\":0,\"discount\":0,\"grandtotal\":315,\"kh_grandtotal\":null}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1141, 'default', 'updated', 'App\\Models\\Balance', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"122789.00\",\"income\":\"315.00\",\"withdraw\":\"0.00\",\"balance\":\"123104.00\",\"balance_date\":\"2022-05-13\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"122789.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"122789.00\",\"balance_date\":\"2022-05-13\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1142, 'default', 'created', 'App\\Models\\OrderDetail', 404, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":51,\"sellprice\":16.5,\"quantity\":\"2.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1143, 'default', 'updated', 'App\\Models\\Stock', 45, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":128},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":130}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1144, 'default', 'created', 'App\\Models\\OrderDetail', 405, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":6,\"sellprice\":16.5,\"quantity\":\"2.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1145, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":278},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":280}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1146, 'default', 'created', 'App\\Models\\OrderDetail', 406, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":7,\"sellprice\":14.5,\"quantity\":\"3.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1147, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":37},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":40}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1148, 'default', 'created', 'App\\Models\\OrderDetail', 407, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"3.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1149, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":412},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":415}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1150, 'default', 'created', 'App\\Models\\OrderDetail', 408, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"3.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1151, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":277},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":280}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1152, 'default', 'created', 'App\\Models\\OrderDetail', 409, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"3.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1153, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":167},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":170}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1154, 'default', 'created', 'App\\Models\\OrderDetail', 410, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":32,\"sellprice\":14,\"quantity\":\"3.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1155, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":522},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":525}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1156, 'default', 'created', 'App\\Models\\OrderDetail', 411, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":65,\"product_id\":9,\"sellprice\":13,\"quantity\":\"3.00\"}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1157, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":287},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":290}}', '2022-05-13 02:03:19', '2022-05-13 02:03:19');
INSERT INTO `activity_log` VALUES (1158, 'default', 'created', 'App\\Models\\Order', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":1184,\"vat\":0,\"discount\":0,\"grandtotal\":1184,\"kh_grandtotal\":null}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1159, 'default', 'updated', 'App\\Models\\Balance', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"122789.00\",\"income\":\"1499.00\",\"withdraw\":\"0.00\",\"balance\":\"124288.00\",\"balance_date\":\"2022-05-13\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"122789.00\",\"income\":\"315.00\",\"withdraw\":\"0.00\",\"balance\":\"123104.00\",\"balance_date\":\"2022-05-13\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1160, 'default', 'created', 'App\\Models\\OrderDetail', 412, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":66,\"product_id\":27,\"sellprice\":19,\"quantity\":\"6.00\"}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1161, 'default', 'updated', 'App\\Models\\Stock', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":6}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1162, 'default', 'created', 'App\\Models\\OrderDetail', 413, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":66,\"product_id\":28,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1163, 'default', 'updated', 'App\\Models\\Stock', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":60}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1164, 'default', 'created', 'App\\Models\\OrderDetail', 414, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":66,\"product_id\":9,\"sellprice\":13,\"quantity\":\"20.00\"}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1165, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":267},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":287}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1166, 'default', 'created', 'App\\Models\\OrderDetail', 415, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":66,\"product_id\":7,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1167, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":17},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":37}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1168, 'default', 'created', 'App\\Models\\OrderDetail', 416, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":66,\"product_id\":46,\"sellprice\":17,\"quantity\":\"20.00\"}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1169, 'default', 'updated', 'App\\Models\\Stock', 43, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":46,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":46,\"alert\":\"0.00\",\"total\":60}}', '2022-05-13 02:19:21', '2022-05-13 02:19:21');
INSERT INTO `activity_log` VALUES (1170, 'default', 'created', 'App\\Models\\Purchase', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220514_v12__6_1652504818137\",\"subtotal\":675,\"vat\":0,\"grandtotal\":675}}', '2022-05-14 05:21:18', '2022-05-14 05:21:18');
INSERT INTO `activity_log` VALUES (1171, 'default', 'created', 'App\\Models\\PurchaseDetail', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":17,\"product_id\":17,\"unitprice\":\"67.50\",\"quantity\":\"10.00\"}}', '2022-05-14 05:21:18', '2022-05-14 05:21:18');
INSERT INTO `activity_log` VALUES (1172, 'default', 'updated', 'App\\Models\\Stock', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":10}}', '2022-05-14 05:21:18', '2022-05-14 05:21:18');
INSERT INTO `activity_log` VALUES (1173, 'default', 'created', 'App\\Models\\Balance', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"1.00\",\"balance_date\":\"2022-05-14\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-14 05:29:38', '2022-05-14 05:29:38');

-- ----------------------------
-- Table structure for balances
-- ----------------------------
DROP TABLE IF EXISTS `balances`;
CREATE TABLE `balances`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `remain` decimal(8, 2) NOT NULL,
  `income` decimal(8, 2) NOT NULL,
  `withdraw` decimal(8, 2) NOT NULL,
  `balance` decimal(8, 2) NOT NULL,
  `balance_date` date NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `balances_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `balances_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `balances_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of balances
-- ----------------------------
INSERT INTO `balances` VALUES (2, 0.00, 0.00, 0.00, 1.00, '2022-04-26', 1, 1, '2022-04-26 01:49:06', '2022-04-26 01:49:06');
INSERT INTO `balances` VALUES (16, 1.00, 0.00, 0.00, 1.00, '2022-05-14', 1, 1, '2022-05-14 05:29:38', '2022-05-14 05:29:38');

-- ----------------------------
-- Table structure for brand_category
-- ----------------------------
DROP TABLE IF EXISTS `brand_category`;
CREATE TABLE `brand_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `brand_category_brand_id_foreign`(`brand_id`) USING BTREE,
  INDEX `brand_category_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `brand_category_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `brand_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brand_category
-- ----------------------------
INSERT INTO `brand_category` VALUES (1, 12, 5);
INSERT INTO `brand_category` VALUES (2, 10, 5);
INSERT INTO `brand_category` VALUES (3, 9, 5);
INSERT INTO `brand_category` VALUES (4, 4, 5);
INSERT INTO `brand_category` VALUES (5, 1, 5);
INSERT INTO `brand_category` VALUES (6, 11, 5);
INSERT INTO `brand_category` VALUES (7, 14, 5);

-- ----------------------------
-- Table structure for brand_product
-- ----------------------------
DROP TABLE IF EXISTS `brand_product`;
CREATE TABLE `brand_product`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `brand_product_brand_id_foreign`(`brand_id`) USING BTREE,
  INDEX `brand_product_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `brand_product_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `brand_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brand_product
-- ----------------------------
INSERT INTO `brand_product` VALUES (1, 9, 1);
INSERT INTO `brand_product` VALUES (2, 1, 43);
INSERT INTO `brand_product` VALUES (3, 1, 44);
INSERT INTO `brand_product` VALUES (4, 1, 17);
INSERT INTO `brand_product` VALUES (5, 1, 40);
INSERT INTO `brand_product` VALUES (6, 1, 39);
INSERT INTO `brand_product` VALUES (7, 1, 21);
INSERT INTO `brand_product` VALUES (8, 1, 20);
INSERT INTO `brand_product` VALUES (9, 1, 19);
INSERT INTO `brand_product` VALUES (10, 1, 18);
INSERT INTO `brand_product` VALUES (11, 1, 16);
INSERT INTO `brand_product` VALUES (13, 1, 22);
INSERT INTO `brand_product` VALUES (14, 12, 7);
INSERT INTO `brand_product` VALUES (15, 9, 45);
INSERT INTO `brand_product` VALUES (16, 10, 6);
INSERT INTO `brand_product` VALUES (17, 10, 46);
INSERT INTO `brand_product` VALUES (18, 12, 47);
INSERT INTO `brand_product` VALUES (22, 9, 51);
INSERT INTO `brand_product` VALUES (24, 10, 53);
INSERT INTO `brand_product` VALUES (25, 14, 42);
INSERT INTO `brand_product` VALUES (26, 14, 41);
INSERT INTO `brand_product` VALUES (27, 1, 23);
INSERT INTO `brand_product` VALUES (28, 9, 4);
INSERT INTO `brand_product` VALUES (30, 9, 38);
INSERT INTO `brand_product` VALUES (31, 9, 2);
INSERT INTO `brand_product` VALUES (33, 9, 25);
INSERT INTO `brand_product` VALUES (34, 9, 27);
INSERT INTO `brand_product` VALUES (35, 9, 12);
INSERT INTO `brand_product` VALUES (36, 9, 37);
INSERT INTO `brand_product` VALUES (37, 9, 3);
INSERT INTO `brand_product` VALUES (38, 9, 24);
INSERT INTO `brand_product` VALUES (39, 9, 15);
INSERT INTO `brand_product` VALUES (40, 9, 14);
INSERT INTO `brand_product` VALUES (41, 9, 28);
INSERT INTO `brand_product` VALUES (42, 10, 32);
INSERT INTO `brand_product` VALUES (43, 9, 11);
INSERT INTO `brand_product` VALUES (44, 9, 34);
INSERT INTO `brand_product` VALUES (45, 9, 5);
INSERT INTO `brand_product` VALUES (46, 9, 13);
INSERT INTO `brand_product` VALUES (47, 12, 8);
INSERT INTO `brand_product` VALUES (49, 12, 26);
INSERT INTO `brand_product` VALUES (50, 12, 10);
INSERT INTO `brand_product` VALUES (51, 12, 33);
INSERT INTO `brand_product` VALUES (52, 12, 35);
INSERT INTO `brand_product` VALUES (53, 12, 36);
INSERT INTO `brand_product` VALUES (54, 12, 9);

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kh_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'APPLE', NULL, NULL, NULL, '2022-05-12 03:04:44', NULL);
INSERT INTO `brands` VALUES (2, 'Google', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (3, 'HTC', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (4, 'HUAWEI', NULL, NULL, NULL, '2022-05-12 03:04:26', NULL);
INSERT INTO `brands` VALUES (5, 'LG', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (6, 'Microsoft', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (7, 'Nokia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (8, 'OnePlus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (9, 'OPPO', NULL, NULL, NULL, '2022-05-12 03:03:47', NULL);
INSERT INTO `brands` VALUES (10, 'REALME', NULL, NULL, NULL, '2022-05-12 03:03:38', NULL);
INSERT INTO `brands` VALUES (11, 'SAMSUNG', NULL, NULL, NULL, '2022-05-12 03:03:26', NULL);
INSERT INTO `brands` VALUES (12, 'VIVO', NULL, NULL, NULL, '2022-05-12 03:03:15', NULL);
INSERT INTO `brands` VALUES (13, 'XiaoMe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (14, 'POVA', NULL, NULL, '2022-05-04 08:45:26', '2022-05-04 08:45:26', NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kh_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Case', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (2, 'Screen', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (3, 'Charger', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (4, 'Headset', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (5, 'LCD', 'អេក្រង់', NULL, '2022-04-30 03:41:53', '2022-04-30 03:41:53', NULL);

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owe` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customers_member_id_foreign`(`member_id`) USING BTREE,
  CONSTRAINT `customers_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 1, 'Normal', '00000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (2, 1, 'RAKSMEY', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (3, 1, 'Bong Hang', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (4, 1, 'SAM BO', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (5, 1, 'SO PHEAK', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (6, 1, 'SO CHEATA', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (7, 1, 'តា​ ម៉ាច', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (8, 1, 'PHA NUN', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (9, 1, 'KHHY', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (10, 1, 'BONG HONG', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (11, 1, 'RATHANAK', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (12, 1, 'BUN THAN', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (13, 1, 'BONG LONG', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (14, 1, 'NAKHIN', '0000', 'Phnom Penh', NULL, NULL, NULL, NULL);
INSERT INTO `customers` VALUES (15, 1, 'Bong Sokha', '017294949', 'pp', NULL, '2022-04-30 04:34:36', '2022-04-30 04:34:36', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for member_product
-- ----------------------------
DROP TABLE IF EXISTS `member_product`;
CREATE TABLE `member_product`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_product_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `member_product_member_id_foreign`(`member_id`) USING BTREE,
  CONSTRAINT `member_product_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_product
-- ----------------------------

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(8, 2) NOT NULL,
  `default` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES (1, 'Normal Member', 0.00, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_08_23_142852_create_suppliers_table', 1);
INSERT INTO `migrations` VALUES (7, '2021_08_23_143004_create_members_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_08_23_143005_create_customers_table', 1);
INSERT INTO `migrations` VALUES (9, '2021_08_23_143037_create_warehouses_table', 1);
INSERT INTO `migrations` VALUES (10, '2021_08_24_060655_create_sessions_table', 1);
INSERT INTO `migrations` VALUES (11, '2021_08_24_062106_create_roles_table', 1);
INSERT INTO `migrations` VALUES (12, '2021_08_24_062153_create_permissions_table', 1);
INSERT INTO `migrations` VALUES (13, '2021_08_24_062503_create_permission_role_pivot_table', 1);
INSERT INTO `migrations` VALUES (14, '2021_08_24_062513_create_role_user_pivot_table', 1);
INSERT INTO `migrations` VALUES (15, '2021_08_24_142620_create_brands_table', 1);
INSERT INTO `migrations` VALUES (16, '2021_08_24_142707_create_orders_table', 1);
INSERT INTO `migrations` VALUES (17, '2021_08_24_142739_create_categories_table', 1);
INSERT INTO `migrations` VALUES (18, '2021_08_24_142740_create_brand_category_pivote_table', 1);
INSERT INTO `migrations` VALUES (19, '2021_08_24_142745_create_products_table', 1);
INSERT INTO `migrations` VALUES (20, '2021_08_24_142746_create_order_details_table', 1);
INSERT INTO `migrations` VALUES (21, '2021_08_24_142818_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (22, '2021_08_24_142910_create_purchases_table', 1);
INSERT INTO `migrations` VALUES (23, '2021_08_24_142928_create_purchase_details_table', 1);
INSERT INTO `migrations` VALUES (24, '2021_08_24_142949_create_stocks_table', 1);
INSERT INTO `migrations` VALUES (25, '2021_09_05_090411_create_brand_product_pivot_table', 1);
INSERT INTO `migrations` VALUES (26, '2021_09_09_162739_create_member_product_pivot_table', 1);
INSERT INTO `migrations` VALUES (27, '2021_10_21_151145_create_stock_outs_table', 1);
INSERT INTO `migrations` VALUES (28, '2022_01_25_141800_create_settings_table', 1);
INSERT INTO `migrations` VALUES (29, '2022_01_26_062900_create_activity_log_table', 1);
INSERT INTO `migrations` VALUES (30, '2022_01_27_014114_create_balances_table', 1);
INSERT INTO `migrations` VALUES (31, '2022_02_03_052420_create_profiles_table', 1);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(8, 2) NOT NULL,
  `sellprice` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_details_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_details_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` double NOT NULL,
  `vat` double NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `grandtotal` double NOT NULL,
  `kh_grandtotal` double NULL DEFAULT NULL,
  `receive` double NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_invoice_id_unique`(`invoice_id`) USING BTREE,
  INDEX `orders_customer_id_foreign`(`customer_id`) USING BTREE,
  INDEX `orders_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  INDEX `permission_role_role_id_foreign`(`role_id`) USING BTREE,
  INDEX `permission_role_permission_id_foreign`(`permission_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (2, 3);
INSERT INTO `permission_role` VALUES (2, 4);
INSERT INTO `permission_role` VALUES (2, 5);
INSERT INTO `permission_role` VALUES (2, 6);
INSERT INTO `permission_role` VALUES (2, 7);
INSERT INTO `permission_role` VALUES (2, 8);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'product_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (2, 'user_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (3, 'category_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (4, 'brand_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (5, 'supplier_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (6, 'warehouse_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (7, 'permission_access', NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (8, 'role_access', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\Models\\User', 1, 'Apptoken', '171dddf9d72f50a43ea50cdcdf96329b6c475a3996795af33a9e415d1c1f5fc5', '[\"*\"]', '2022-05-06 00:40:13', '2022-05-06 00:39:46', '2022-05-06 00:40:13');
INSERT INTO `personal_access_tokens` VALUES (46, 'App\\Models\\User', 1, 'Apptoken', '5f09fff4d79c04b6a72ffe6053a29b96deb04ac3729b91b8c9d81523369d2d8e', '[\"*\"]', '2022-05-06 00:40:52', '2022-05-06 00:40:27', '2022-05-06 00:40:52');
INSERT INTO `personal_access_tokens` VALUES (47, 'App\\Models\\User', 1, 'Apptoken', '9c70cef4391dd36c47d6fef15a2a31c09319df799ef90cceafc4f5fc4303d470', '[\"*\"]', '2022-05-06 01:56:53', '2022-05-06 00:40:55', '2022-05-06 01:56:53');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\Models\\User', 1, 'Apptoken', 'e0fd09eb7fe0c6782e676565611c7e7b516db44599751c6be88185ce88ca1828', '[\"*\"]', '2022-05-06 04:24:00', '2022-05-06 04:23:23', '2022-05-06 04:24:00');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\Models\\User', 1, 'Apptoken', '0440bb0ae53d193d1fca18f13dcbd5d1157de62ba8c9ae4a368b3e8d0beaeb6c', '[\"*\"]', '2022-05-07 01:11:33', '2022-05-07 00:45:12', '2022-05-07 01:11:33');
INSERT INTO `personal_access_tokens` VALUES (50, 'App\\Models\\User', 1, 'Apptoken', '2df6e189addfeb581169b37b12a02ee2a4d8509745bbc656e69c351d67b08f12', '[\"*\"]', '2022-05-07 21:22:57', '2022-05-07 21:22:20', '2022-05-07 21:22:57');
INSERT INTO `personal_access_tokens` VALUES (51, 'App\\Models\\User', 1, 'Apptoken', '9177df129c035865a65bb34ca8b1f807ac2ea2e3423bc1723201154bcb08c8bf', '[\"*\"]', '2022-05-11 08:08:40', '2022-05-11 05:15:01', '2022-05-11 08:08:40');
INSERT INTO `personal_access_tokens` VALUES (52, 'App\\Models\\User', 1, 'Apptoken', '790dee167ea6a5296b37e8f73dd271c49a6aa8c05c300b9410256730039ec667', '[\"*\"]', '2022-05-11 07:26:57', '2022-05-11 07:26:45', '2022-05-11 07:26:57');
INSERT INTO `personal_access_tokens` VALUES (53, 'App\\Models\\User', 1, 'Apptoken', '48d9da5bd85c017655eb49944cf064c0cfda5e825283240f329f7307a9dbfe91', '[\"*\"]', '2022-05-12 03:36:15', '2022-05-12 01:07:48', '2022-05-12 03:36:15');
INSERT INTO `personal_access_tokens` VALUES (54, 'App\\Models\\User', 1, 'Apptoken', '16b0b9cf1bd1e6eda57b4dbdc7ab42fde1343663c7cb0b9f9bb6a36aa008090e', '[\"*\"]', NULL, '2022-05-13 01:46:29', '2022-05-13 01:46:29');
INSERT INTO `personal_access_tokens` VALUES (55, 'App\\Models\\User', 1, 'Apptoken', '8e6a3eb6edd0cc3907c3966e8030de44f6aec113f8a8f52f62a089d11f7f3291', '[\"*\"]', '2022-05-13 01:46:43', '2022-05-13 01:46:31', '2022-05-13 01:46:43');
INSERT INTO `personal_access_tokens` VALUES (56, 'App\\Models\\User', 1, 'Apptoken', 'd5ccf974f0bd8f412ac1efcc556f500a6fc24005005eed356fcda95c77895e72', '[\"*\"]', '2022-05-13 02:03:52', '2022-05-13 01:46:57', '2022-05-13 02:03:52');
INSERT INTO `personal_access_tokens` VALUES (57, 'App\\Models\\User', 1, 'Apptoken', 'bb8b629f0c2e8ea4c2f8b2f9106276bdbab303faad6ea3e052f242eca1885861', '[\"*\"]', '2022-05-13 02:22:42', '2022-05-13 02:17:56', '2022-05-13 02:22:42');
INSERT INTO `personal_access_tokens` VALUES (58, 'App\\Models\\User', 1, 'Apptoken', 'bc55c86ad44bdf0d55988caf36fe87504f9a50735076ef7bbf8a46a7d454b9aa', '[\"*\"]', '2022-05-13 08:05:57', '2022-05-13 08:05:13', '2022-05-13 08:05:57');
INSERT INTO `personal_access_tokens` VALUES (59, 'App\\Models\\User', 1, 'Apptoken', 'cf2e204b43d76478e019de72bd1b9471f76f8ff20f940f34aed485c5f46a8c73', '[\"*\"]', '2022-05-13 13:38:41', '2022-05-13 13:38:14', '2022-05-13 13:38:41');
INSERT INTO `personal_access_tokens` VALUES (60, 'App\\Models\\User', 1, 'Apptoken', 'fb902d7d7c36d23df03a1a4bca18fe1304a99c794f88b8a55f6446bb856d4988', '[\"*\"]', '2022-05-13 14:34:51', '2022-05-13 13:39:05', '2022-05-13 14:34:51');
INSERT INTO `personal_access_tokens` VALUES (61, 'App\\Models\\User', 1, 'Apptoken', 'f375471fa618a8d138796726f3831d7be17975a60b58881a8b7811e14efcdce6', '[\"*\"]', '2022-05-14 05:31:30', '2022-05-14 05:06:25', '2022-05-14 05:31:30');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `en_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kh_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sale_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_code_unique`(`code`) USING BTREE,
  UNIQUE INDEX `products_en_name_unique`(`en_name`) USING BTREE,
  INDEX `products_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 5, '316466814841', 'a3s', 'A3S', 'LCD OPPO', 'undefined', '1651156393.jpg', 13.5, '2022-04-13 07:59:33', '2022-05-12 02:30:15', NULL);
INSERT INTO `products` VALUES (2, 5, '571501119594', 'a1k', 'A1K', 'LCD OPPO', 'undefined', 'no image created', 11, '2022-04-13 08:00:23', '2022-05-12 02:29:35', NULL);
INSERT INTO `products` VALUES (3, 5, '908601349849', 'a5s', 'A5S', 'LCD OPPO', 'undefined', 'no image created', 13.5, '2022-04-13 08:00:52', '2022-05-12 02:35:00', NULL);
INSERT INTO `products` VALUES (4, 5, '908601349850', 'a15', 'A15', 'LCD OPPO', 'undefined', 'no image created', 15, '2022-04-13 08:00:52', '2022-05-12 02:28:04', NULL);
INSERT INTO `products` VALUES (5, 5, '908601349851', 'f9', 'F9', 'LCD OPPO', 'undefined', 'no image created', 17, '2022-04-13 08:00:52', '2022-05-12 02:57:59', NULL);
INSERT INTO `products` VALUES (6, 5, '908601349852', 'c3 ori', 'C3 ORI', 'LCD REALME', 'undefined', 'no image created', 16.5, '2022-04-13 08:00:52', '2022-05-12 02:38:17', NULL);
INSERT INTO `products` VALUES (7, 5, '908601349853', 'y12', 'Y12', 'LCD VIVO', 'undefined', 'no image created', 14.5, '2022-04-13 08:00:52', '2022-05-12 02:45:12', NULL);
INSERT INTO `products` VALUES (8, 5, '908601349854', 'y12s', 'Y12S', 'LCD VIVO', 'undefined', 'no image created', 14.5, '2022-04-13 08:00:52', '2022-05-12 02:45:39', NULL);
INSERT INTO `products` VALUES (9, 5, '908601349855', 'y91', 'Y91', 'LCD VIVO', 'undefined', 'no image created', 13, '2022-04-13 08:00:52', '2022-05-12 02:49:00', NULL);
INSERT INTO `products` VALUES (10, 5, '908601349856', 'y19', 'Y19', 'LCD VIVO', 'undefined', 'no image created', 20, '2022-04-13 08:00:52', '2022-05-12 02:47:25', NULL);
INSERT INTO `products` VALUES (11, 5, '908601349857', 'f11pro ori', 'F11PRO ORI', 'LCD OPPO', 'undefined', 'no image created', 21.5, '2022-04-13 08:00:52', '2022-05-12 02:41:27', NULL);
INSERT INTO `products` VALUES (12, 5, '908601349858', 'a53 ori', 'A53 ORI', 'LCD OPPO', 'undefined', 'no image created', 21, '2022-04-13 08:00:52', '2022-05-12 02:34:11', NULL);
INSERT INTO `products` VALUES (13, 5, '908601349859', 'reno2f', 'RENO2F', 'LCD OPPO', 'undefined', 'no image created', 22.5, '2022-04-13 08:00:52', '2022-05-12 02:43:34', NULL);
INSERT INTO `products` VALUES (14, 5, '908601349860', 'a83 w', 'A83 W', 'LCD OPPO', 'undefined', 'no image created', 15.5, '2022-04-13 08:00:52', '2022-05-12 02:36:01', NULL);
INSERT INTO `products` VALUES (15, 5, '908601349861', 'a83 b', 'A83 B', 'LCD OPPO', 'undefined', 'no image created', 15.5, '2022-04-13 08:00:52', '2022-05-12 02:35:40', NULL);
INSERT INTO `products` VALUES (16, 5, '908601349862', 'x gx', 'X GX', 'LCD IPHONE', 'undefined', 'no image created', 41, '2022-04-13 08:00:52', '2022-05-12 02:44:02', NULL);
INSERT INTO `products` VALUES (17, 5, '908601349863', '11pro max gx', '11PRO MAX GX', 'LCD IPHONE', 'undefined', 'no image created', 80, '2022-04-13 08:00:52', '2022-05-12 02:26:43', NULL);
INSERT INTO `products` VALUES (18, 5, '908601349864', '7p b', '7P B', 'LCD IPHONE', 'undefined', 'no image created', 14.5, '2022-04-13 08:00:52', '2022-05-12 02:23:40', NULL);
INSERT INTO `products` VALUES (19, 5, '908601349865', '8p w', '8P W', 'LCD IPHONE', 'undefined', 'no image created', 14.5, '2022-04-13 08:00:52', '2022-05-12 02:25:37', NULL);
INSERT INTO `products` VALUES (20, 5, '908601349866', '8p b', '8P B', 'LCD IPHONE', 'undefined', 'no image created', 14.5, '2022-04-13 08:00:52', '2022-05-12 02:25:26', NULL);
INSERT INTO `products` VALUES (21, 5, '908601349867', '6sp w', '6SP W', 'LCD IPHONE', 'undefined', 'no image created', 14, '2022-04-13 08:00:52', '2022-05-12 02:23:05', NULL);
INSERT INTO `products` VALUES (22, 5, '908601349868', '6g w', '6G W', 'LCD IPHONE', 'undefined', 'no image created', 11, '2022-04-13 08:00:52', '2022-05-12 02:21:35', NULL);
INSERT INTO `products` VALUES (23, 5, '908601349869', '6g b', '6G B', 'LCD IPHONE', 'undefined', 'no image created', 11, '2022-04-13 08:00:52', '2022-05-12 02:21:02', NULL);
INSERT INTO `products` VALUES (24, 5, '908601349870', 'a5s ori', 'A5S ORI', 'LCD OPPO', 'undefined', 'no image created', 19, '2022-04-13 08:00:52', '2022-05-12 02:57:38', NULL);
INSERT INTO `products` VALUES (25, 5, '908601349871', 'a52 ori', 'A52 ORI', 'LCD OPPO', 'undefined', 'no image created', 19.5, '2022-04-13 08:00:52', '2022-05-12 02:33:35', NULL);
INSERT INTO `products` VALUES (26, 5, '908601349872', 'y12s ori', 'Y12S ORI', 'LCD VIVO', 'undefined', 'no image created', 20, '2022-04-13 08:00:52', '2022-05-12 02:47:06', NULL);
INSERT INTO `products` VALUES (27, 5, '908601349873', 'a53', 'A53', 'LCD OPPO', 'undefined', 'no image created', 19, '2022-04-13 08:00:52', '2022-05-12 02:33:50', NULL);
INSERT INTO `products` VALUES (28, 5, '908601349874', 'f11pro', 'F11PRO', 'LCD OPPO', 'undefined', 'no image created', 18, '2022-04-13 08:00:52', '2022-05-12 02:57:50', NULL);
INSERT INTO `products` VALUES (32, 5, '908601349878', 'c3', 'C3', 'LCD REALME', 'undefined', 'no image created', 14, '2022-04-13 08:00:52', '2022-05-12 02:40:22', NULL);
INSERT INTO `products` VALUES (33, 5, '908601349879', 'y30 ori', 'Y30 ORI', 'LCD VIVO', 'undefined', 'no image created', 24, '2022-04-13 08:00:52', '2022-05-12 02:48:18', NULL);
INSERT INTO `products` VALUES (34, 5, '908601349880', 'f7', 'F7', 'LCD OPPO', 'undefined', 'no image created', 16.5, '2022-04-01 02:25:50', '2022-05-12 02:41:50', NULL);
INSERT INTO `products` VALUES (35, 5, '908601349881', 'y81', 'Y81', 'LCD VIVO', 'undefined', 'no image created', 14, '2022-04-01 02:25:50', '2022-05-12 02:48:32', NULL);
INSERT INTO `products` VALUES (36, 5, '908601349882', 'y85', 'Y85', 'LCD VIVO', 'undefined', 'no image created', 17, '2022-04-01 02:25:50', '2022-05-12 02:48:44', NULL);
INSERT INTO `products` VALUES (37, 5, '908601349883', 'a54 ori', 'A54 ORI', 'LCD OPPO', 'undefined', 'no image created', 21.5, '2022-04-01 02:25:50', '2022-05-12 02:34:41', NULL);
INSERT INTO `products` VALUES (38, 5, '908601349884', 'a15 ori', 'A15 ORI', 'LCD OPPO', 'undefined', 'no image created', 18.5, '2022-04-01 02:25:50', '2022-05-12 02:28:35', NULL);
INSERT INTO `products` VALUES (39, 5, '908601349885', '6p w', '6P W', 'LCD IPHONE', 'undefined', 'no image created', 13.5, '2022-04-01 02:25:50', '2022-05-12 02:22:41', NULL);
INSERT INTO `products` VALUES (40, 5, '908601349886', '6p b', '6P B', 'LCD IPHONE', 'undefined', 'no image created', 13.5, '2022-04-01 02:25:50', '2022-05-12 02:22:20', NULL);
INSERT INTO `products` VALUES (41, 5, '908601349887', 'pova1', 'POVA1', 'LCD POVA', 'undefined', 'no image created', 20.5, '2022-04-01 02:25:50', '2022-05-12 02:42:41', NULL);
INSERT INTO `products` VALUES (42, 5, '908601349888', 'pova2', 'POVA2', 'LCD POVA', 'undefined', 'no image created', 22, '2022-04-01 02:25:50', '2022-05-12 02:43:10', NULL);
INSERT INTO `products` VALUES (43, 5, '143565364348', '7p w', '7P W', 'LCD IPHONE', 'null', 'no image created', 14.5, '2022-04-30 02:43:18', '2022-05-12 02:23:53', NULL);
INSERT INTO `products` VALUES (44, 5, '441083965829', 'xs max oled', 'XS MAX OLED', 'LCD IPHONE', 'undefined', 'no image created', 60, '2022-04-30 02:44:54', '2022-05-12 02:44:25', NULL);
INSERT INTO `products` VALUES (45, 5, '108960149410', 'A16', 'A16', 'LCD OPPO', 'null', 'no image created', 17.5, '2022-05-04 01:02:00', '2022-05-12 02:29:07', NULL);
INSERT INTO `products` VALUES (46, 5, '680278947227', 'C11 2021', 'C11 2021', 'LCD REALME', 'null', 'no image created', 17, '2022-05-04 01:16:26', '2022-05-12 02:36:57', NULL);
INSERT INTO `products` VALUES (47, 5, '163793124994', 'Y21', 'Y21', 'LCD VIVO', 'undefined', 'no image created', 17, '2022-05-04 01:17:45', '2022-05-12 02:47:44', NULL);
INSERT INTO `products` VALUES (51, 5, '409509970859', 'A3S ORI', 'A3S ORI', 'LCD OPPO', 'undefined', 'no image created', 16.5, '2022-05-04 01:31:56', '2022-05-12 02:33:08', NULL);
INSERT INTO `products` VALUES (53, 5, '672931669645', 'C15', 'C15', 'LCD REALME', 'undefined', 'no image created', 16.5, '2022-05-04 08:41:15', '2022-05-12 02:37:30', NULL);

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `firstname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `occupation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birthdate` date NULL DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `profiles_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profiles
-- ----------------------------
INSERT INTO `profiles` VALUES (1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for purchase_details
-- ----------------------------
DROP TABLE IF EXISTS `purchase_details`;
CREATE TABLE `purchase_details`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unitprice` decimal(8, 2) NOT NULL,
  `quantity` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchase_details_purchase_id_foreign`(`purchase_id`) USING BTREE,
  INDEX `purchase_details_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_details
-- ----------------------------
INSERT INTO `purchase_details` VALUES (63, 17, 17, 67.50, 10.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (64, 17, 23, 9.50, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (65, 17, 22, 9.50, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (66, 17, 40, 12.00, 55.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (67, 17, 39, 12.00, 25.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (68, 17, 21, 12.50, 17.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (69, 17, 18, 12.80, 70.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (70, 17, 43, 0.00, 70.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (71, 17, 20, 12.80, 28.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (72, 17, 19, 12.80, 27.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (73, 17, 4, 13.00, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (74, 17, 38, 16.00, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (75, 17, 45, 15.40, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (76, 17, 2, 10.00, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (77, 17, 1, 11.30, 7.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (78, 17, 51, 14.60, 128.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (79, 17, 25, 17.70, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (80, 17, 27, 16.70, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (81, 17, 12, 19.20, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (82, 17, 37, 19.00, 105.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (83, 17, 3, 11.30, 195.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (84, 17, 24, 18.40, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (85, 17, 15, 13.70, 52.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (86, 17, 14, 13.70, 65.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (87, 17, 46, 14.50, 32.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (88, 17, 32, 12.00, 512.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (89, 17, 6, 16.30, 279.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (90, 17, 28, 15.30, 30.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (91, 17, 11, 19.50, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (92, 17, 34, 14.30, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (93, 17, 5, 15.80, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (94, 17, 41, 18.00, 11.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (95, 17, 42, 19.50, 20.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (96, 17, 13, 20.00, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (97, 17, 16, 34.60, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (98, 17, 44, 0.00, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (99, 17, 7, 13.30, 12.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (100, 17, 8, 13.00, 392.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (101, 17, 26, 0.00, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (102, 17, 10, 18.00, 73.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (103, 17, 47, 14.80, 65.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (104, 17, 33, 21.50, 3.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (105, 17, 35, 11.50, 0.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (106, 17, 36, 15.00, 90.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchase_details` VALUES (107, 17, 9, 11.00, 209.00, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);

-- ----------------------------
-- Table structure for purchases
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `batch` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '001',
  `subtotal` double NOT NULL,
  `vat` double NULL DEFAULT NULL,
  `grandtotal` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `purchases_invoice_id_unique`(`invoice_id`) USING BTREE,
  INDEX `purchases_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `purchases_supplier_id_foreign`(`supplier_id`) USING BTREE,
  INDEX `purchases_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `purchases_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES (17, 'P-2205140001', 1, 1, 1, '20220514_v12__6_1652504818137', 34644.6, 0, 34644.6, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  INDEX `role_user_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `role_user_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (1, 1);
INSERT INTO `role_user` VALUES (2, 2);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('D0fXlE1YCXUqdZliiiI6xmewNKZ41o77RifZW8tZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM09IQmszeU1MSGNDZ0xXMnpzdHhrdG5aa1VFeDVzdTBCaE1ZUUJwSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kb2NzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1650961907);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `digit` decimal(8, 2) NOT NULL,
  `negative` tinyint(4) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `settings_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 2.00, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for stock_outs
-- ----------------------------
DROP TABLE IF EXISTS `stock_outs`;
CREATE TABLE `stock_outs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `from_warehouse` bigint(20) UNSIGNED NOT NULL,
  `to_warehouse` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(8, 2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stock_outs_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `stock_outs_from_warehouse_foreign`(`from_warehouse`) USING BTREE,
  INDEX `stock_outs_to_warehouse_foreign`(`to_warehouse`) USING BTREE,
  INDEX `stock_outs_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `stock_outs_from_warehouse_foreign` FOREIGN KEY (`from_warehouse`) REFERENCES `warehouses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stock_outs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `stock_outs_to_warehouse_foreign` FOREIGN KEY (`to_warehouse`) REFERENCES `warehouses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stock_outs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_outs
-- ----------------------------

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `alert` decimal(8, 2) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stocks_warehouse_id_foreign`(`warehouse_id`) USING BTREE,
  INDEX `stocks_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `stocks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stocks
-- ----------------------------
INSERT INTO `stocks` VALUES (46, 1, 17, 0.00, 10, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (47, 1, 23, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (48, 1, 22, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (49, 1, 40, 0.00, 55, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (50, 1, 39, 0.00, 25, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (51, 1, 21, 0.00, 17, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (52, 1, 18, 0.00, 70, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (53, 1, 43, 0.00, 70, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (54, 1, 20, 0.00, 28, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (55, 1, 19, 0.00, 27, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (56, 1, 4, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (57, 1, 38, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (58, 1, 45, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (59, 1, 2, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (60, 1, 1, 0.00, 7, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (61, 1, 51, 0.00, 128, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (62, 1, 25, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (63, 1, 27, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (64, 1, 12, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (65, 1, 37, 0.00, 105, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (66, 1, 3, 0.00, 195, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (67, 1, 24, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (68, 1, 15, 0.00, 52, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (69, 1, 14, 0.00, 65, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (70, 1, 46, 0.00, 32, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (71, 1, 32, 0.00, 512, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (72, 1, 6, 0.00, 279, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (73, 1, 28, 0.00, 30, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (74, 1, 11, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (75, 1, 34, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (76, 1, 5, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (77, 1, 41, 0.00, 11, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (78, 1, 42, 0.00, 20, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (79, 1, 13, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (80, 1, 16, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (81, 1, 44, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (82, 1, 7, 0.00, 12, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (83, 1, 8, 0.00, 392, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (84, 1, 26, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (85, 1, 10, 0.00, 73, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (86, 1, 47, 0.00, 65, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (87, 1, 33, 0.00, 3, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (88, 1, 35, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (89, 1, 36, 0.00, 90, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (90, 1, 9, 0.00, 209, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `suppliers_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `suppliers_phone_unique`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES (1, 'None', 'Phnom Penh', 'test@test.com', '888888', '2022-04-25 23:00:10', '2022-04-25 23:00:10', NULL);

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `paid` double NOT NULL,
  `balance` double NOT NULL,
  `pay_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transactions_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `transactions_order_id_foreign`(`order_id`) USING BTREE,
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transactions
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@admin.com', NULL, '$2y$10$dydFbzEoloUWyVpFHv5wheoilvu20AKzjj2teT0qcmvjWORhth14W', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'User', 'user@user.com', NULL, '$2y$10$5zC6JPKE7raIxqFnzDeOLu.3i6aL514/l7GZUi7vAdDKyV2h488W6', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for warehouses
-- ----------------------------
DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE `warehouses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of warehouses
-- ----------------------------
INSERT INTO `warehouses` VALUES (1, 'P1', 'Phnom penh', '2022-04-13 08:11:25', '2022-04-13 08:11:25', NULL);

SET FOREIGN_KEY_CHECKS = 1;

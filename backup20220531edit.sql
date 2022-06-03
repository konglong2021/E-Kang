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

 Date: 31/05/2022 14:55:15
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
) ENGINE = InnoDB AUTO_INCREMENT = 2374 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `activity_log` VALUES (1174, 'default', 'updated', 'App\\Models\\Customer', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"RAKSMEY\",\"address\":\"Phnom Penh\",\"phone\":\"010 658585\"},\"old\":{\"member_id\":1,\"name\":\"RAKSMEY\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:14:47', '2022-05-14 06:14:47');
INSERT INTO `activity_log` VALUES (1175, 'default', 'updated', 'App\\Models\\Customer', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"BONG HENG\",\"address\":\"Kompong Cham\",\"phone\":\"097 4468079\"},\"old\":{\"member_id\":1,\"name\":\"Bong Hang\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:19:10', '2022-05-14 06:19:10');
INSERT INTO `activity_log` VALUES (1176, 'default', 'updated', 'App\\Models\\Customer', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"SAMBO\",\"address\":\"Por sat\",\"phone\":\"070 810001\"},\"old\":{\"member_id\":1,\"name\":\"SAM BO\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:20:17', '2022-05-14 06:20:17');
INSERT INTO `activity_log` VALUES (1177, 'default', 'updated', 'App\\Models\\Customer', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"SOPHEAK\",\"address\":\"Siem Reab\",\"phone\":\"087 456800\"},\"old\":{\"member_id\":1,\"name\":\"SO PHEAK\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:22:23', '2022-05-14 06:22:23');
INSERT INTO `activity_log` VALUES (1178, 'default', 'updated', 'App\\Models\\Customer', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"SOCHEATA\",\"address\":\"Phnom Penh\",\"phone\":\"096 6565834\"},\"old\":{\"member_id\":1,\"name\":\"SO CHEATA\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:23:10', '2022-05-14 06:23:10');
INSERT INTO `activity_log` VALUES (1179, 'default', 'updated', 'App\\Models\\Customer', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"TA MACH\",\"address\":\"Steung Treng\",\"phone\":\"097 6466645\"},\"old\":{\"member_id\":1,\"name\":\"\\u178f\\u17b6\\u200b \\u1798\\u17c9\\u17b6\\u1785\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:24:56', '2022-05-14 06:24:56');
INSERT INTO `activity_log` VALUES (1180, 'default', 'updated', 'App\\Models\\Customer', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"PHANUN\",\"address\":\"Kracheh\",\"phone\":\"071 4888843\"},\"old\":{\"member_id\":1,\"name\":\"PHA NUN\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:26:46', '2022-05-14 06:26:46');
INSERT INTO `activity_log` VALUES (1181, 'default', 'updated', 'App\\Models\\Customer', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"KHHY\",\"address\":\"Preah Vihear\",\"phone\":\"087 323355\"},\"old\":{\"member_id\":1,\"name\":\"KHHY\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:27:55', '2022-05-14 06:27:55');
INSERT INTO `activity_log` VALUES (1182, 'default', 'updated', 'App\\Models\\Customer', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"BONG HONG\",\"address\":\"Kompong Chhnang\",\"phone\":\"097 9901133\"},\"old\":{\"member_id\":1,\"name\":\"BONG HONG\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:29:21', '2022-05-14 06:29:21');
INSERT INTO `activity_log` VALUES (1183, 'default', 'updated', 'App\\Models\\Customer', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"RATHANAK\",\"address\":\"Kampong Cham\",\"phone\":\"092 737396\"},\"old\":{\"member_id\":1,\"name\":\"RATHANAK\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:31:10', '2022-05-14 06:31:10');
INSERT INTO `activity_log` VALUES (1184, 'default', 'updated', 'App\\Models\\Customer', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"BONG HENG\",\"address\":\"Kampong Cham\",\"phone\":\"097 4468079\"},\"old\":{\"member_id\":1,\"name\":\"BONG HENG\",\"address\":\"Kompong Cham\",\"phone\":\"097 4468079\"}}', '2022-05-14 06:31:24', '2022-05-14 06:31:24');
INSERT INTO `activity_log` VALUES (1185, 'default', 'updated', 'App\\Models\\Customer', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"BONG HONG\",\"address\":\"Kampong Chhnang\",\"phone\":\"097 9901133\"},\"old\":{\"member_id\":1,\"name\":\"BONG HONG\",\"address\":\"Kompong Chhnang\",\"phone\":\"097 9901133\"}}', '2022-05-14 06:31:36', '2022-05-14 06:31:36');
INSERT INTO `activity_log` VALUES (1186, 'default', 'updated', 'App\\Models\\Customer', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"BUNTHAN\",\"address\":\"Kampong Cham\",\"phone\":\"010 846446\"},\"old\":{\"member_id\":1,\"name\":\"BUN THAN\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:32:31', '2022-05-14 06:32:31');
INSERT INTO `activity_log` VALUES (1187, 'default', 'updated', 'App\\Models\\Customer', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"BONG LONG\",\"address\":\"Kandal\",\"phone\":\"010 292818\"},\"old\":{\"member_id\":1,\"name\":\"BONG LONG\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:33:56', '2022-05-14 06:33:56');
INSERT INTO `activity_log` VALUES (1188, 'default', 'updated', 'App\\Models\\Customer', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"NAKHHIN\",\"address\":\"Oddar Meanchey\",\"phone\":\"090 981877\"},\"old\":{\"member_id\":1,\"name\":\"NAKHIN\",\"address\":\"Phnom Penh\",\"phone\":\"0000\"}}', '2022-05-14 06:35:28', '2022-05-14 06:35:28');
INSERT INTO `activity_log` VALUES (1189, 'default', 'updated', 'App\\Models\\Customer', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"BONG SOKHA\",\"address\":\"Pursat\",\"phone\":\"017 294949\"},\"old\":{\"member_id\":1,\"name\":\"Bong Sokha\",\"address\":\"pp\",\"phone\":\"017294949\"}}', '2022-05-14 06:37:04', '2022-05-14 06:37:04');
INSERT INTO `activity_log` VALUES (1190, 'default', 'updated', 'App\\Models\\Customer', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"member_id\":1,\"name\":\"SAMBO\",\"address\":\"Pursat\",\"phone\":\"070 810001\"},\"old\":{\"member_id\":1,\"name\":\"SAMBO\",\"address\":\"Por sat\",\"phone\":\"070 810001\"}}', '2022-05-14 06:37:33', '2022-05-14 06:37:33');
INSERT INTO `activity_log` VALUES (1191, 'default', 'created', 'App\\Models\\Product', 54, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"597519322139\",\"en_name\":\"Y71 B\",\"kh_name\":\"LCD VIVO\",\"description\":null,\"image\":\"no image created\",\"sale_price\":15}}', '2022-05-15 13:40:34', '2022-05-15 13:40:34');
INSERT INTO `activity_log` VALUES (1192, 'default', 'created', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"1.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 13:49:07', '2022-05-15 13:49:07');
INSERT INTO `activity_log` VALUES (1193, 'default', 'created', 'App\\Models\\Purchase', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220515_v20__51_1652622692980\",\"subtotal\":390,\"vat\":0,\"grandtotal\":390}}', '2022-05-15 13:51:59', '2022-05-15 13:51:59');
INSERT INTO `activity_log` VALUES (1194, 'default', 'created', 'App\\Models\\PurchaseDetail', 108, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":18,\"product_id\":54,\"unitprice\":\"13.00\",\"quantity\":\"30.00\"}}', '2022-05-15 13:51:59', '2022-05-15 13:51:59');
INSERT INTO `activity_log` VALUES (1195, 'default', 'created', 'App\\Models\\Stock', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":30}}', '2022-05-15 13:51:59', '2022-05-15 13:51:59');
INSERT INTO `activity_log` VALUES (1196, 'default', 'created', 'App\\Models\\Product', 55, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"700595761489\",\"en_name\":\"Y71 W\",\"kh_name\":\"LCD VIVO\",\"description\":null,\"image\":\"no image created\",\"sale_price\":15}}', '2022-05-15 13:54:19', '2022-05-15 13:54:19');
INSERT INTO `activity_log` VALUES (1197, 'default', 'created', 'App\\Models\\Product', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"134068185103\",\"en_name\":\"Xs JK\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":36}}', '2022-05-15 13:56:19', '2022-05-15 13:56:19');
INSERT INTO `activity_log` VALUES (1198, 'default', 'created', 'App\\Models\\Product', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"119454641103\",\"en_name\":\"11 JK\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":43}}', '2022-05-15 13:57:06', '2022-05-15 13:57:06');
INSERT INTO `activity_log` VALUES (1199, 'default', 'created', 'App\\Models\\Purchase', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220515_v20__53_1652622781824\",\"subtotal\":1900,\"vat\":0,\"grandtotal\":1900}}', '2022-05-15 14:00:35', '2022-05-15 14:00:35');
INSERT INTO `activity_log` VALUES (1200, 'default', 'created', 'App\\Models\\PurchaseDetail', 109, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":19,\"product_id\":2,\"unitprice\":\"9.50\",\"quantity\":\"200.00\"}}', '2022-05-15 14:00:35', '2022-05-15 14:00:35');
INSERT INTO `activity_log` VALUES (1201, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":200},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:00:35', '2022-05-15 14:00:35');
INSERT INTO `activity_log` VALUES (1202, 'default', 'created', 'App\\Models\\Purchase', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220515_v21__2_1652623328254\",\"subtotal\":23135,\"vat\":0,\"grandtotal\":23135}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1203, 'default', 'created', 'App\\Models\\PurchaseDetail', 110, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":33,\"unitprice\":\"20.50\",\"quantity\":\"100.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1204, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":103},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":3}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1205, 'default', 'created', 'App\\Models\\PurchaseDetail', 111, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":55,\"unitprice\":\"13.00\",\"quantity\":\"30.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1206, 'default', 'created', 'App\\Models\\Stock', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":30}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1207, 'default', 'created', 'App\\Models\\PurchaseDetail', 112, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":4,\"unitprice\":\"12.00\",\"quantity\":\"300.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1208, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":300},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1209, 'default', 'created', 'App\\Models\\PurchaseDetail', 113, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":5,\"unitprice\":\"12.00\",\"quantity\":\"100.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1210, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1211, 'default', 'created', 'App\\Models\\PurchaseDetail', 114, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":34,\"unitprice\":\"14.00\",\"quantity\":\"100.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1212, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1213, 'default', 'created', 'App\\Models\\PurchaseDetail', 115, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":45,\"unitprice\":\"14.50\",\"quantity\":\"50.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1214, 'default', 'updated', 'App\\Models\\Stock', 58, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1215, 'default', 'created', 'App\\Models\\PurchaseDetail', 116, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":27,\"unitprice\":\"15.60\",\"quantity\":\"200.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1216, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":200},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1217, 'default', 'created', 'App\\Models\\PurchaseDetail', 117, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":7,\"unitprice\":\"12.90\",\"quantity\":\"300.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1218, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":312},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":12}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1219, 'default', 'created', 'App\\Models\\PurchaseDetail', 118, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":28,\"unitprice\":\"15.80\",\"quantity\":\"100.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1220, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":30}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1221, 'default', 'created', 'App\\Models\\PurchaseDetail', 119, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":35,\"unitprice\":\"10.90\",\"quantity\":\"100.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1222, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1223, 'default', 'created', 'App\\Models\\PurchaseDetail', 120, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":22,\"unitprice\":\"8.90\",\"quantity\":\"100.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1224, 'default', 'updated', 'App\\Models\\Stock', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1225, 'default', 'created', 'App\\Models\\PurchaseDetail', 121, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":23,\"unitprice\":\"8.90\",\"quantity\":\"100.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1226, 'default', 'updated', 'App\\Models\\Stock', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1227, 'default', 'created', 'App\\Models\\PurchaseDetail', 122, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":16,\"unitprice\":\"34.00\",\"quantity\":\"50.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1228, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":0}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1229, 'default', 'created', 'App\\Models\\PurchaseDetail', 123, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":56,\"unitprice\":\"31.00\",\"quantity\":\"10.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1230, 'default', 'created', 'App\\Models\\Stock', 93, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":56,\"alert\":\"0.00\",\"total\":10}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1231, 'default', 'created', 'App\\Models\\PurchaseDetail', 124, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":20,\"product_id\":57,\"unitprice\":\"32.00\",\"quantity\":\"10.00\"}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1232, 'default', 'created', 'App\\Models\\Stock', 94, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":10}}', '2022-05-15 14:15:54', '2022-05-15 14:15:54');
INSERT INTO `activity_log` VALUES (1233, 'default', 'updated', 'App\\Models\\Product', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349850\",\"en_name\":\"A15\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5},\"old\":{\"category_id\":5,\"code\":\"908601349850\",\"en_name\":\"A15\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15}}', '2022-05-15 14:20:18', '2022-05-15 14:20:18');
INSERT INTO `activity_log` VALUES (1234, 'default', 'updated', 'App\\Models\\Product', 45, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"108960149410\",\"en_name\":\"A16\",\"kh_name\":\"LCD OPPO\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":5,\"code\":\"108960149410\",\"en_name\":\"A16\",\"kh_name\":\"LCD OPPO\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-15 14:20:30', '2022-05-15 14:20:30');
INSERT INTO `activity_log` VALUES (1235, 'default', 'updated', 'App\\Models\\Product', 51, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"409509970859\",\"en_name\":\"A3S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16},\"old\":{\"category_id\":5,\"code\":\"409509970859\",\"en_name\":\"A3S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-15 14:30:15', '2022-05-15 14:30:15');
INSERT INTO `activity_log` VALUES (1236, 'default', 'updated', 'App\\Models\\Product', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349873\",\"en_name\":\"A53\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":18},\"old\":{\"category_id\":5,\"code\":\"908601349873\",\"en_name\":\"A53\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19}}', '2022-05-15 14:30:29', '2022-05-15 14:30:29');
INSERT INTO `activity_log` VALUES (1237, 'default', 'updated', 'App\\Models\\Product', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349849\",\"en_name\":\"A5S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13},\"old\":{\"category_id\":5,\"code\":\"908601349849\",\"en_name\":\"A5S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5}}', '2022-05-15 14:30:49', '2022-05-15 14:30:49');
INSERT INTO `activity_log` VALUES (1238, 'default', 'updated', 'App\\Models\\Product', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349852\",\"en_name\":\"C3 ORI\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16},\"old\":{\"category_id\":5,\"code\":\"908601349852\",\"en_name\":\"C3 ORI\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-15 14:31:24', '2022-05-15 14:31:24');
INSERT INTO `activity_log` VALUES (1239, 'default', 'updated', 'App\\Models\\Product', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349880\",\"en_name\":\"F7\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16},\"old\":{\"category_id\":5,\"code\":\"908601349880\",\"en_name\":\"F7\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-15 14:31:48', '2022-05-15 14:31:48');
INSERT INTO `activity_log` VALUES (1240, 'default', 'updated', 'App\\Models\\Product', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349851\",\"en_name\":\"F9\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15},\"old\":{\"category_id\":5,\"code\":\"908601349851\",\"en_name\":\"F9\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17}}', '2022-05-15 14:32:00', '2022-05-15 14:32:00');
INSERT INTO `activity_log` VALUES (1241, 'default', 'updated', 'App\\Models\\Product', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"441083965829\",\"en_name\":\"Xs MAX OLED\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":60},\"old\":{\"category_id\":5,\"code\":\"441083965829\",\"en_name\":\"XS MAX OLED\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":60}}', '2022-05-15 14:32:33', '2022-05-15 14:32:33');
INSERT INTO `activity_log` VALUES (1242, 'default', 'updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349853\",\"en_name\":\"Y12\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":5,\"code\":\"908601349853\",\"en_name\":\"Y12\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-15 14:32:58', '2022-05-15 14:32:58');
INSERT INTO `activity_log` VALUES (1243, 'default', 'updated', 'App\\Models\\Product', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349854\",\"en_name\":\"Y12S\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":5,\"code\":\"908601349854\",\"en_name\":\"Y12S\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-15 14:33:09', '2022-05-15 14:33:09');
INSERT INTO `activity_log` VALUES (1244, 'default', 'updated', 'App\\Models\\Product', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349856\",\"en_name\":\"Y19\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19.5},\"old\":{\"category_id\":5,\"code\":\"908601349856\",\"en_name\":\"Y19\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20}}', '2022-05-15 14:33:24', '2022-05-15 14:33:24');
INSERT INTO `activity_log` VALUES (1245, 'default', 'updated', 'App\\Models\\Product', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349879\",\"en_name\":\"Y30 ORI\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":23},\"old\":{\"category_id\":5,\"code\":\"908601349879\",\"en_name\":\"Y30 ORI\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":24}}', '2022-05-15 14:34:01', '2022-05-15 14:34:01');
INSERT INTO `activity_log` VALUES (1246, 'default', 'updated', 'App\\Models\\Product', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349881\",\"en_name\":\"Y81\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5},\"old\":{\"category_id\":5,\"code\":\"908601349881\",\"en_name\":\"Y81\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14}}', '2022-05-15 14:34:15', '2022-05-15 14:34:15');
INSERT INTO `activity_log` VALUES (1247, 'default', 'updated', 'App\\Models\\Product', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349855\",\"en_name\":\"Y91\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":12.5},\"old\":{\"category_id\":5,\"code\":\"908601349855\",\"en_name\":\"Y91\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13}}', '2022-05-15 14:34:25', '2022-05-15 14:34:25');
INSERT INTO `activity_log` VALUES (1248, 'default', 'created', 'App\\Models\\Order', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":1,\"user_id\":1,\"subtotal\":1590,\"vat\":0,\"discount\":0,\"grandtotal\":1590,\"kh_grandtotal\":null}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1249, 'default', 'updated', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"1590.00\",\"withdraw\":\"0.00\",\"balance\":\"1591.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"1.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"1.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1250, 'default', 'created', 'App\\Models\\OrderDetail', 417, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":3,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1251, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":185},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":195}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1252, 'default', 'created', 'App\\Models\\OrderDetail', 418, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":10,\"sellprice\":19.5,\"quantity\":\"5.00\"}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1253, 'default', 'updated', 'App\\Models\\Stock', 85, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":68},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":73}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1254, 'default', 'created', 'App\\Models\\OrderDetail', 419, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":41,\"sellprice\":20.5,\"quantity\":\"5.00\"}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1255, 'default', 'updated', 'App\\Models\\Stock', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":6},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":11}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1256, 'default', 'created', 'App\\Models\\OrderDetail', 420, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1257, 'default', 'updated', 'App\\Models\\Stock', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":25}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1258, 'default', 'created', 'App\\Models\\OrderDetail', 421, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-15 14:42:54', '2022-05-15 14:42:54');
INSERT INTO `activity_log` VALUES (1259, 'default', 'updated', 'App\\Models\\Stock', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":55}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1260, 'default', 'created', 'App\\Models\\OrderDetail', 422, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1261, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":100}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1262, 'default', 'created', 'App\\Models\\OrderDetail', 423, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":8,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1263, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":382},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":392}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1264, 'default', 'created', 'App\\Models\\OrderDetail', 424, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"20.00\"}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1265, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":189},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":209}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1266, 'default', 'created', 'App\\Models\\OrderDetail', 425, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":7,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1267, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":292},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":312}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1268, 'default', 'created', 'App\\Models\\OrderDetail', 426, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":67,\"product_id\":51,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1269, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":108},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":128}}', '2022-05-15 14:42:55', '2022-05-15 14:42:55');
INSERT INTO `activity_log` VALUES (1270, 'default', 'created', 'App\\Models\\Order', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":11,\"user_id\":1,\"subtotal\":1310,\"vat\":0,\"discount\":0,\"grandtotal\":1310,\"kh_grandtotal\":null}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1271, 'default', 'updated', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"2900.00\",\"withdraw\":\"0.00\",\"balance\":\"2901.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"1.00\",\"income\":\"1590.00\",\"withdraw\":\"0.00\",\"balance\":\"1591.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1272, 'default', 'created', 'App\\Models\\OrderDetail', 427, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":68,\"product_id\":28,\"sellprice\":18,\"quantity\":\"5.00\"}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1273, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":125},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":130}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1274, 'default', 'created', 'App\\Models\\OrderDetail', 428, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":68,\"product_id\":27,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1275, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":190},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":200}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1276, 'default', 'created', 'App\\Models\\OrderDetail', 429, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":68,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1277, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":190},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":200}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1278, 'default', 'created', 'App\\Models\\OrderDetail', 430, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":68,\"product_id\":3,\"sellprice\":13,\"quantity\":\"50.00\"}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1279, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":135},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":185}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1280, 'default', 'created', 'App\\Models\\OrderDetail', 431, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":68,\"product_id\":7,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1281, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":272},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":292}}', '2022-05-15 14:45:49', '2022-05-15 14:45:49');
INSERT INTO `activity_log` VALUES (1282, 'default', 'created', 'App\\Models\\Order', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":160,\"vat\":0,\"discount\":0,\"grandtotal\":160,\"kh_grandtotal\":null}}', '2022-05-15 14:46:47', '2022-05-15 14:46:47');
INSERT INTO `activity_log` VALUES (1283, 'default', 'updated', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"3060.00\",\"withdraw\":\"0.00\",\"balance\":\"3061.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"1.00\",\"income\":\"2900.00\",\"withdraw\":\"0.00\",\"balance\":\"2901.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 14:46:47', '2022-05-15 14:46:47');
INSERT INTO `activity_log` VALUES (1284, 'default', 'created', 'App\\Models\\OrderDetail', 432, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":69,\"product_id\":7,\"sellprice\":14,\"quantity\":\"5.00\"}}', '2022-05-15 14:46:47', '2022-05-15 14:46:47');
INSERT INTO `activity_log` VALUES (1285, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":267},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":272}}', '2022-05-15 14:46:47', '2022-05-15 14:46:47');
INSERT INTO `activity_log` VALUES (1286, 'default', 'created', 'App\\Models\\OrderDetail', 433, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":69,\"product_id\":27,\"sellprice\":18,\"quantity\":\"5.00\"}}', '2022-05-15 14:46:47', '2022-05-15 14:46:47');
INSERT INTO `activity_log` VALUES (1287, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":185},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":190}}', '2022-05-15 14:46:47', '2022-05-15 14:46:47');
INSERT INTO `activity_log` VALUES (1288, 'default', 'created', 'App\\Models\\Order', 70, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":585,\"vat\":0,\"discount\":0,\"grandtotal\":585,\"kh_grandtotal\":null}}', '2022-05-15 14:47:30', '2022-05-15 14:47:30');
INSERT INTO `activity_log` VALUES (1289, 'default', 'updated', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"3645.00\",\"withdraw\":\"0.00\",\"balance\":\"3646.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"1.00\",\"income\":\"3060.00\",\"withdraw\":\"0.00\",\"balance\":\"3061.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 14:47:30', '2022-05-15 14:47:30');
INSERT INTO `activity_log` VALUES (1290, 'default', 'created', 'App\\Models\\OrderDetail', 434, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":70,\"product_id\":5,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-15 14:47:30', '2022-05-15 14:47:30');
INSERT INTO `activity_log` VALUES (1291, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":100}}', '2022-05-15 14:47:30', '2022-05-15 14:47:30');
INSERT INTO `activity_log` VALUES (1292, 'default', 'created', 'App\\Models\\OrderDetail', 435, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":70,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"30.00\"}}', '2022-05-15 14:47:30', '2022-05-15 14:47:30');
INSERT INTO `activity_log` VALUES (1293, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":270},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":300}}', '2022-05-15 14:47:30', '2022-05-15 14:47:30');
INSERT INTO `activity_log` VALUES (1294, 'default', 'created', 'App\\Models\\Order', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":325,\"vat\":0,\"discount\":0,\"grandtotal\":325,\"kh_grandtotal\":null}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1295, 'default', 'updated', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"3970.00\",\"withdraw\":\"0.00\",\"balance\":\"3971.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"1.00\",\"income\":\"3645.00\",\"withdraw\":\"0.00\",\"balance\":\"3646.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1296, 'default', 'created', 'App\\Models\\OrderDetail', 436, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":71,\"product_id\":28,\"sellprice\":18,\"quantity\":\"3.00\"}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1297, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":122},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":125}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1298, 'default', 'created', 'App\\Models\\OrderDetail', 437, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":71,\"product_id\":32,\"sellprice\":14,\"quantity\":\"5.00\"}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1299, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":507},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":512}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1300, 'default', 'created', 'App\\Models\\OrderDetail', 438, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":71,\"product_id\":51,\"sellprice\":16,\"quantity\":\"5.00\"}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1301, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":103},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":108}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1302, 'default', 'created', 'App\\Models\\OrderDetail', 439, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":71,\"product_id\":47,\"sellprice\":17,\"quantity\":\"3.00\"}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1303, 'default', 'updated', 'App\\Models\\Stock', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":62},\"old\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":65}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1304, 'default', 'created', 'App\\Models\\OrderDetail', 440, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":71,\"product_id\":8,\"sellprice\":14,\"quantity\":\"5.00\"}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1305, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":377},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":382}}', '2022-05-15 14:49:03', '2022-05-15 14:49:03');
INSERT INTO `activity_log` VALUES (1306, 'default', 'created', 'App\\Models\\Order', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":3153.5,\"vat\":0,\"discount\":0,\"grandtotal\":3153.5,\"kh_grandtotal\":null}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1307, 'default', 'updated', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"7123.50\",\"withdraw\":\"0.00\",\"balance\":\"7124.50\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"1.00\",\"income\":\"3970.00\",\"withdraw\":\"0.00\",\"balance\":\"3971.00\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1308, 'default', 'created', 'App\\Models\\OrderDetail', 441, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":7,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1309, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":257},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":267}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1310, 'default', 'created', 'App\\Models\\OrderDetail', 442, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":55,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1311, 'default', 'updated', 'App\\Models\\Stock', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":30}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1312, 'default', 'created', 'App\\Models\\OrderDetail', 443, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":54,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1313, 'default', 'updated', 'App\\Models\\Stock', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":30}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1314, 'default', 'created', 'App\\Models\\OrderDetail', 444, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":5,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1315, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":90}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1316, 'default', 'created', 'App\\Models\\OrderDetail', 445, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":34,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1317, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":100}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1318, 'default', 'created', 'App\\Models\\OrderDetail', 446, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":2,\"sellprice\":11,\"quantity\":\"30.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1319, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":190}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1320, 'default', 'created', 'App\\Models\\OrderDetail', 447, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"30.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1321, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":240},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":270}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1322, 'default', 'created', 'App\\Models\\OrderDetail', 448, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1323, 'default', 'updated', 'App\\Models\\Stock', 52, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":70}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1324, 'default', 'created', 'App\\Models\\OrderDetail', 449, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":1,\"sellprice\":13,\"quantity\":\"7.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1325, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":7}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1326, 'default', 'created', 'App\\Models\\OrderDetail', 450, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":41,\"sellprice\":20.5,\"quantity\":\"5.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1327, 'default', 'updated', 'App\\Models\\Stock', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":1},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":6}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1328, 'default', 'created', 'App\\Models\\OrderDetail', 451, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1329, 'default', 'updated', 'App\\Models\\Stock', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":20}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1330, 'default', 'created', 'App\\Models\\OrderDetail', 452, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":8,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1331, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":347},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":377}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1332, 'default', 'created', 'App\\Models\\OrderDetail', 453, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":28,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1333, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":112},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":122}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1334, 'default', 'created', 'App\\Models\\OrderDetail', 454, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":72,\"product_id\":32,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1335, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":477},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":507}}', '2022-05-15 15:01:08', '2022-05-15 15:01:08');
INSERT INTO `activity_log` VALUES (1336, 'default', 'created', 'App\\Models\\Order', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":1033,\"vat\":0,\"discount\":0,\"grandtotal\":1033,\"kh_grandtotal\":null}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1337, 'default', 'updated', 'App\\Models\\Balance', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"1.00\",\"income\":\"8156.50\",\"withdraw\":\"0.00\",\"balance\":\"8157.50\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"1.00\",\"income\":\"7123.50\",\"withdraw\":\"0.00\",\"balance\":\"7124.50\",\"balance_date\":\"2022-05-15\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1338, 'default', 'created', 'App\\Models\\OrderDetail', 455, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":73,\"product_id\":57,\"sellprice\":43,\"quantity\":\"2.00\"}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1339, 'default', 'updated', 'App\\Models\\Stock', 94, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":8},\"old\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":10}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1340, 'default', 'created', 'App\\Models\\OrderDetail', 456, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":73,\"product_id\":56,\"sellprice\":36,\"quantity\":\"2.00\"}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1341, 'default', 'updated', 'App\\Models\\Stock', 93, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":56,\"alert\":\"0.00\",\"total\":8},\"old\":{\"warehouse_id\":1,\"product_id\":56,\"alert\":\"0.00\",\"total\":10}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1342, 'default', 'created', 'App\\Models\\OrderDetail', 457, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":73,\"product_id\":16,\"sellprice\":41,\"quantity\":\"10.00\"}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1343, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":50}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1344, 'default', 'created', 'App\\Models\\OrderDetail', 458, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":73,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1345, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":90}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1346, 'default', 'created', 'App\\Models\\OrderDetail', 459, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":73,\"product_id\":23,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1347, 'default', 'updated', 'App\\Models\\Stock', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":100}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1348, 'default', 'created', 'App\\Models\\OrderDetail', 460, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":73,\"product_id\":22,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1349, 'default', 'updated', 'App\\Models\\Stock', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":100}}', '2022-05-15 15:02:42', '2022-05-15 15:02:42');
INSERT INTO `activity_log` VALUES (1350, 'default', 'created', 'App\\Models\\Balance', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"8157.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"8157.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-16 03:16:12', '2022-05-16 03:16:12');
INSERT INTO `activity_log` VALUES (1351, 'default', 'created', 'App\\Models\\Order', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":3,\"user_id\":1,\"subtotal\":390,\"vat\":0,\"discount\":0,\"grandtotal\":390,\"kh_grandtotal\":null}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1352, 'default', 'updated', 'App\\Models\\Balance', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"8157.50\",\"income\":\"390.00\",\"withdraw\":\"0.00\",\"balance\":\"8547.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"8157.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"8157.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1353, 'default', 'created', 'App\\Models\\OrderDetail', 461, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":74,\"product_id\":16,\"sellprice\":41,\"quantity\":\"1.00\"}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1354, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":39},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":40}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1355, 'default', 'created', 'App\\Models\\OrderDetail', 462, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":74,\"product_id\":33,\"sellprice\":23,\"quantity\":\"3.00\"}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1356, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":103}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1357, 'default', 'created', 'App\\Models\\OrderDetail', 463, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":74,\"product_id\":8,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1358, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":337},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":347}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1359, 'default', 'created', 'App\\Models\\OrderDetail', 464, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":74,\"product_id\":7,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1360, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":247},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":257}}', '2022-05-16 03:17:46', '2022-05-16 03:17:46');
INSERT INTO `activity_log` VALUES (1361, 'default', 'created', 'App\\Models\\Order', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":10,\"user_id\":1,\"subtotal\":877,\"vat\":0,\"discount\":0,\"grandtotal\":877,\"kh_grandtotal\":null}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1362, 'default', 'updated', 'App\\Models\\Balance', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"8157.50\",\"income\":\"1267.00\",\"withdraw\":\"0.00\",\"balance\":\"9424.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"8157.50\",\"income\":\"390.00\",\"withdraw\":\"0.00\",\"balance\":\"8547.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1363, 'default', 'created', 'App\\Models\\OrderDetail', 465, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":54,\"sellprice\":15,\"quantity\":\"2.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1364, 'default', 'updated', 'App\\Models\\Stock', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":18},\"old\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":20}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1365, 'default', 'created', 'App\\Models\\OrderDetail', 466, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":55,\"sellprice\":15,\"quantity\":\"2.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1366, 'default', 'updated', 'App\\Models\\Stock', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":18},\"old\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":20}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1367, 'default', 'created', 'App\\Models\\OrderDetail', 467, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":23,\"sellprice\":11,\"quantity\":\"5.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1368, 'default', 'updated', 'App\\Models\\Stock', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":80}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1369, 'default', 'created', 'App\\Models\\OrderDetail', 468, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":16,\"sellprice\":41,\"quantity\":\"2.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1370, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":37},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":39}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1371, 'default', 'created', 'App\\Models\\OrderDetail', 469, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1372, 'default', 'updated', 'App\\Models\\Stock', 52, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":50}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1373, 'default', 'created', 'App\\Models\\OrderDetail', 470, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1374, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":150},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":160}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1375, 'default', 'created', 'App\\Models\\OrderDetail', 471, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1376, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":467},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":477}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1377, 'default', 'created', 'App\\Models\\OrderDetail', 472, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":8,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1378, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":327},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":337}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1379, 'default', 'created', 'App\\Models\\OrderDetail', 473, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":75,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1380, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":230},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":240}}', '2022-05-16 04:57:10', '2022-05-16 04:57:10');
INSERT INTO `activity_log` VALUES (1381, 'default', 'created', 'App\\Models\\Order', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":728,\"vat\":0,\"discount\":0,\"grandtotal\":728,\"kh_grandtotal\":null}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1382, 'default', 'updated', 'App\\Models\\Balance', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"8157.50\",\"income\":\"1995.00\",\"withdraw\":\"0.00\",\"balance\":\"10152.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"8157.50\",\"income\":\"1267.00\",\"withdraw\":\"0.00\",\"balance\":\"9424.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1383, 'default', 'created', 'App\\Models\\OrderDetail', 474, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":76,\"product_id\":16,\"sellprice\":41,\"quantity\":\"2.00\"}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1384, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":37}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1385, 'default', 'created', 'App\\Models\\OrderDetail', 475, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":76,\"product_id\":17,\"sellprice\":80,\"quantity\":\"2.00\"}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1386, 'default', 'updated', 'App\\Models\\Stock', 46, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":8},\"old\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":10}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1387, 'default', 'created', 'App\\Models\\OrderDetail', 476, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":76,\"product_id\":57,\"sellprice\":43,\"quantity\":\"2.00\"}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1388, 'default', 'updated', 'App\\Models\\Stock', 94, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":6},\"old\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":8}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1389, 'default', 'created', 'App\\Models\\OrderDetail', 477, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":76,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"10.00\"}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1390, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":179},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":189}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1391, 'default', 'created', 'App\\Models\\OrderDetail', 478, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":76,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1392, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":220},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":230}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1393, 'default', 'created', 'App\\Models\\OrderDetail', 479, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":76,\"product_id\":3,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1394, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":125},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":135}}', '2022-05-16 06:21:03', '2022-05-16 06:21:03');
INSERT INTO `activity_log` VALUES (1395, 'default', 'created', 'App\\Models\\Purchase', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220516_v13__23_1652682203513\",\"subtotal\":7910,\"vat\":0,\"grandtotal\":7910}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1396, 'default', 'created', 'App\\Models\\PurchaseDetail', 125, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":21,\"product_id\":41,\"unitprice\":\"16.40\",\"quantity\":\"50.00\"}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1397, 'default', 'updated', 'App\\Models\\Stock', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":51},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":1}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1398, 'default', 'created', 'App\\Models\\PurchaseDetail', 126, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":21,\"product_id\":53,\"unitprice\":\"11.80\",\"quantity\":\"150.00\"}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1399, 'default', 'created', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":150}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1400, 'default', 'created', 'App\\Models\\PurchaseDetail', 127, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":21,\"product_id\":26,\"unitprice\":\"13.40\",\"quantity\":\"200.00\"}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1401, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":200},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":0}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1402, 'default', 'created', 'App\\Models\\PurchaseDetail', 128, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":21,\"product_id\":13,\"unitprice\":\"16.00\",\"quantity\":\"100.00\"}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1403, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":0}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1404, 'default', 'created', 'App\\Models\\PurchaseDetail', 129, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":21,\"product_id\":44,\"unitprice\":\"52.00\",\"quantity\":\"20.00\"}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1405, 'default', 'updated', 'App\\Models\\Stock', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":0}}', '2022-05-16 06:32:57', '2022-05-16 06:32:57');
INSERT INTO `activity_log` VALUES (1406, 'default', 'created', 'App\\Models\\Product', 58, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"509358742384\",\"en_name\":\"S1\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-16 06:33:57', '2022-05-16 06:33:57');
INSERT INTO `activity_log` VALUES (1407, 'default', 'created', 'App\\Models\\Purchase', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220516_v13__34_1652682856226\",\"subtotal\":456,\"vat\":0,\"grandtotal\":456}}', '2022-05-16 06:35:02', '2022-05-16 06:35:02');
INSERT INTO `activity_log` VALUES (1408, 'default', 'created', 'App\\Models\\PurchaseDetail', 130, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":22,\"product_id\":58,\"unitprice\":\"15.20\",\"quantity\":\"30.00\"}}', '2022-05-16 06:35:02', '2022-05-16 06:35:02');
INSERT INTO `activity_log` VALUES (1409, 'default', 'created', 'App\\Models\\Stock', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":30}}', '2022-05-16 06:35:02', '2022-05-16 06:35:02');
INSERT INTO `activity_log` VALUES (1410, 'default', 'updated', 'App\\Models\\Product', 41, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349887\",\"en_name\":\"POVA1\",\"kh_name\":\"LCD POVA\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.4},\"old\":{\"category_id\":5,\"code\":\"908601349887\",\"en_name\":\"POVA1\",\"kh_name\":\"LCD POVA\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20.5}}', '2022-05-16 06:35:27', '2022-05-16 06:35:27');
INSERT INTO `activity_log` VALUES (1411, 'default', 'updated', 'App\\Models\\Product', 53, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"672931669645\",\"en_name\":\"C15\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":5,\"code\":\"672931669645\",\"en_name\":\"C15\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-16 06:36:07', '2022-05-16 06:36:07');
INSERT INTO `activity_log` VALUES (1412, 'default', 'updated', 'App\\Models\\Product', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349872\",\"en_name\":\"Y12S ORI\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5},\"old\":{\"category_id\":5,\"code\":\"908601349872\",\"en_name\":\"Y12S ORI\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20}}', '2022-05-16 06:36:29', '2022-05-16 06:36:29');
INSERT INTO `activity_log` VALUES (1413, 'default', 'updated', 'App\\Models\\Product', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349859\",\"en_name\":\"RENO2F\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":18.5},\"old\":{\"category_id\":5,\"code\":\"908601349859\",\"en_name\":\"RENO2F\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":22.5}}', '2022-05-16 06:36:57', '2022-05-16 06:36:57');
INSERT INTO `activity_log` VALUES (1414, 'default', 'updated', 'App\\Models\\Product', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"441083965829\",\"en_name\":\"Xs MAX OLED\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":59},\"old\":{\"category_id\":5,\"code\":\"441083965829\",\"en_name\":\"Xs MAX OLED\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":60}}', '2022-05-16 06:37:08', '2022-05-16 06:37:08');
INSERT INTO `activity_log` VALUES (1415, 'default', 'created', 'App\\Models\\Order', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":5,\"user_id\":1,\"subtotal\":1803.5,\"vat\":0,\"discount\":0,\"grandtotal\":1803.5,\"kh_grandtotal\":null}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1416, 'default', 'updated', 'App\\Models\\Balance', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"8157.50\",\"income\":\"3798.50\",\"withdraw\":\"0.00\",\"balance\":\"11956.00\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"8157.50\",\"income\":\"1995.00\",\"withdraw\":\"0.00\",\"balance\":\"10152.50\",\"balance_date\":\"2022-05-16\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1417, 'default', 'created', 'App\\Models\\OrderDetail', 480, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":45,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1418, 'default', 'updated', 'App\\Models\\Stock', 58, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":50}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1419, 'default', 'created', 'App\\Models\\OrderDetail', 481, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":46,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1420, 'default', 'updated', 'App\\Models\\Stock', 70, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":46,\"alert\":\"0.00\",\"total\":27},\"old\":{\"warehouse_id\":1,\"product_id\":46,\"alert\":\"0.00\",\"total\":32}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1421, 'default', 'created', 'App\\Models\\OrderDetail', 482, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":47,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1422, 'default', 'updated', 'App\\Models\\Stock', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":57},\"old\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":62}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1423, 'default', 'created', 'App\\Models\\OrderDetail', 483, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":58,\"sellprice\":17.5,\"quantity\":\"3.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1424, 'default', 'updated', 'App\\Models\\Stock', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":27},\"old\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":30}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1425, 'default', 'created', 'App\\Models\\OrderDetail', 484, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":5,\"sellprice\":15,\"quantity\":\"5.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1426, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":80}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1427, 'default', 'created', 'App\\Models\\OrderDetail', 485, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":42,\"sellprice\":22,\"quantity\":\"3.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1428, 'default', 'updated', 'App\\Models\\Stock', 78, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":17},\"old\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":20}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1429, 'default', 'created', 'App\\Models\\OrderDetail', 486, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":41,\"sellprice\":19,\"quantity\":\"5.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1430, 'default', 'updated', 'App\\Models\\Stock', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":46},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":51}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1431, 'default', 'created', 'App\\Models\\OrderDetail', 487, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":55,\"sellprice\":15,\"quantity\":\"5.00\"}}', '2022-05-16 08:27:13', '2022-05-16 08:27:13');
INSERT INTO `activity_log` VALUES (1432, 'default', 'updated', 'App\\Models\\Stock', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":13},\"old\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":18}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1433, 'default', 'created', 'App\\Models\\OrderDetail', 488, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":54,\"sellprice\":15,\"quantity\":\"5.00\"}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1434, 'default', 'updated', 'App\\Models\\Stock', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":13},\"old\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":18}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1435, 'default', 'created', 'App\\Models\\OrderDetail', 489, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":8,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1436, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":317},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":327}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1437, 'default', 'created', 'App\\Models\\OrderDetail', 490, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1438, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":457},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":467}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1439, 'default', 'created', 'App\\Models\\OrderDetail', 491, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"10.00\"}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1440, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":169},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":179}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1441, 'default', 'created', 'App\\Models\\OrderDetail', 492, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1442, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":210},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":220}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1443, 'default', 'created', 'App\\Models\\OrderDetail', 493, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":7,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1444, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":227},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":247}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1445, 'default', 'created', 'App\\Models\\OrderDetail', 494, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":77,\"product_id\":53,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1446, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":150}}', '2022-05-16 08:27:14', '2022-05-16 08:27:14');
INSERT INTO `activity_log` VALUES (1447, 'default', 'updated', 'App\\Models\\Product', 41, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349887\",\"en_name\":\"POVA1\",\"kh_name\":\"LCD POVA\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19},\"old\":{\"category_id\":5,\"code\":\"908601349887\",\"en_name\":\"POVA1\",\"kh_name\":\"LCD POVA\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.4}}', '2022-05-16 08:30:30', '2022-05-16 08:30:30');
INSERT INTO `activity_log` VALUES (1448, 'default', 'created', 'App\\Models\\Balance', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"11956.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"11956.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-17 04:01:32', '2022-05-17 04:01:32');
INSERT INTO `activity_log` VALUES (1449, 'default', 'created', 'App\\Models\\Order', 78, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":2525,\"vat\":0,\"discount\":0,\"grandtotal\":2525,\"kh_grandtotal\":null}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1450, 'default', 'updated', 'App\\Models\\Balance', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"11956.00\",\"income\":\"2525.00\",\"withdraw\":\"0.00\",\"balance\":\"14481.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"11956.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"11956.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1451, 'default', 'created', 'App\\Models\\OrderDetail', 495, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1452, 'default', 'updated', 'App\\Models\\Stock', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":10}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1453, 'default', 'created', 'App\\Models\\OrderDetail', 496, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1454, 'default', 'updated', 'App\\Models\\Stock', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":50}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1455, 'default', 'created', 'App\\Models\\OrderDetail', 497, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":32,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1456, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":437},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":457}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1457, 'default', 'created', 'App\\Models\\OrderDetail', 498, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":6,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1458, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":259},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":279}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1459, 'default', 'created', 'App\\Models\\OrderDetail', 499, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":3,\"sellprice\":13,\"quantity\":\"40.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1460, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":125}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1461, 'default', 'created', 'App\\Models\\OrderDetail', 500, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":58,\"sellprice\":17.5,\"quantity\":\"10.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1462, 'default', 'updated', 'App\\Models\\Stock', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":17},\"old\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":27}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1463, 'default', 'created', 'App\\Models\\OrderDetail', 501, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":53,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1464, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":130}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1465, 'default', 'created', 'App\\Models\\OrderDetail', 502, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"20.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1466, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":100}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1467, 'default', 'created', 'App\\Models\\OrderDetail', 503, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":78,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1468, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":180},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":200}}', '2022-05-17 04:04:01', '2022-05-17 04:04:01');
INSERT INTO `activity_log` VALUES (1469, 'default', 'created', 'App\\Models\\Order', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":118,\"vat\":0,\"discount\":0,\"grandtotal\":118,\"kh_grandtotal\":null}}', '2022-05-17 04:04:25', '2022-05-17 04:04:25');
INSERT INTO `activity_log` VALUES (1470, 'default', 'updated', 'App\\Models\\Balance', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"11956.00\",\"income\":\"2643.00\",\"withdraw\":\"0.00\",\"balance\":\"14599.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"11956.00\",\"income\":\"2525.00\",\"withdraw\":\"0.00\",\"balance\":\"14481.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-17 04:04:25', '2022-05-17 04:04:25');
INSERT INTO `activity_log` VALUES (1471, 'default', 'created', 'App\\Models\\OrderDetail', 504, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":79,\"product_id\":44,\"sellprice\":59,\"quantity\":\"2.00\"}}', '2022-05-17 04:04:25', '2022-05-17 04:04:25');
INSERT INTO `activity_log` VALUES (1472, 'default', 'updated', 'App\\Models\\Stock', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":18},\"old\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":20}}', '2022-05-17 04:04:25', '2022-05-17 04:04:25');
INSERT INTO `activity_log` VALUES (1473, 'default', 'created', 'App\\Models\\Purchase', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220517_v16__3_1652778219429\",\"subtotal\":5512,\"vat\":0,\"grandtotal\":5512}}', '2022-05-17 10:04:19', '2022-05-17 10:04:19');
INSERT INTO `activity_log` VALUES (1474, 'default', 'created', 'App\\Models\\PurchaseDetail', 131, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":23,\"product_id\":24,\"unitprice\":\"13.20\",\"quantity\":\"10.00\"}}', '2022-05-17 10:04:19', '2022-05-17 10:04:19');
INSERT INTO `activity_log` VALUES (1475, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":0}}', '2022-05-17 10:04:19', '2022-05-17 10:04:19');
INSERT INTO `activity_log` VALUES (1476, 'default', 'created', 'App\\Models\\PurchaseDetail', 132, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":23,\"product_id\":38,\"unitprice\":\"13.40\",\"quantity\":\"200.00\"}}', '2022-05-17 10:04:19', '2022-05-17 10:04:19');
INSERT INTO `activity_log` VALUES (1477, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":200},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":0}}', '2022-05-17 10:04:19', '2022-05-17 10:04:19');
INSERT INTO `activity_log` VALUES (1478, 'default', 'created', 'App\\Models\\PurchaseDetail', 133, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":23,\"product_id\":11,\"unitprice\":\"18.00\",\"quantity\":\"150.00\"}}', '2022-05-17 10:04:19', '2022-05-17 10:04:19');
INSERT INTO `activity_log` VALUES (1479, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":150},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":0}}', '2022-05-17 10:04:19', '2022-05-17 10:04:19');
INSERT INTO `activity_log` VALUES (1480, 'default', 'updated', 'App\\Models\\Product', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349857\",\"en_name\":\"F11PRO ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20.5},\"old\":{\"category_id\":5,\"code\":\"908601349857\",\"en_name\":\"F11PRO ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":21.5}}', '2022-05-17 10:07:28', '2022-05-17 10:07:28');
INSERT INTO `activity_log` VALUES (1481, 'default', 'updated', 'App\\Models\\Product', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349884\",\"en_name\":\"A15 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":5,\"code\":\"908601349884\",\"en_name\":\"A15 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":18.5}}', '2022-05-17 10:07:55', '2022-05-17 10:07:55');
INSERT INTO `activity_log` VALUES (1482, 'default', 'updated', 'App\\Models\\Product', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349870\",\"en_name\":\"A5S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16},\"old\":{\"category_id\":5,\"code\":\"908601349870\",\"en_name\":\"A5S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":19}}', '2022-05-17 10:08:09', '2022-05-17 10:08:09');
INSERT INTO `activity_log` VALUES (1483, 'default', 'created', 'App\\Models\\Order', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":7,\"user_id\":1,\"subtotal\":540,\"vat\":0,\"discount\":0,\"grandtotal\":540,\"kh_grandtotal\":null}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1484, 'default', 'updated', 'App\\Models\\Balance', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"11956.00\",\"income\":\"3183.00\",\"withdraw\":\"0.00\",\"balance\":\"15139.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"11956.00\",\"income\":\"2643.00\",\"withdraw\":\"0.00\",\"balance\":\"14599.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1485, 'default', 'created', 'App\\Models\\OrderDetail', 505, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":80,\"product_id\":24,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1486, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":10}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1487, 'default', 'created', 'App\\Models\\OrderDetail', 506, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":80,\"product_id\":6,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1488, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":249},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":259}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1489, 'default', 'created', 'App\\Models\\OrderDetail', 507, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":80,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1490, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":150}}', '2022-05-17 10:11:50', '2022-05-17 10:11:50');
INSERT INTO `activity_log` VALUES (1491, 'default', 'updated', 'App\\Models\\Product', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349884\",\"en_name\":\"A15 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16},\"old\":{\"category_id\":5,\"code\":\"908601349884\",\"en_name\":\"A15 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5}}', '2022-05-17 10:32:39', '2022-05-17 10:32:39');
INSERT INTO `activity_log` VALUES (1492, 'default', 'created', 'App\\Models\\Order', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":13,\"user_id\":1,\"subtotal\":401,\"vat\":0,\"discount\":0,\"grandtotal\":401,\"kh_grandtotal\":null}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1493, 'default', 'updated', 'App\\Models\\Balance', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"11956.00\",\"income\":\"3584.00\",\"withdraw\":\"0.00\",\"balance\":\"15540.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"11956.00\",\"income\":\"3183.00\",\"withdraw\":\"0.00\",\"balance\":\"15139.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1494, 'default', 'created', 'App\\Models\\OrderDetail', 508, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":81,\"product_id\":16,\"sellprice\":41,\"quantity\":\"1.00\"}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1495, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":34},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":35}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1496, 'default', 'created', 'App\\Models\\OrderDetail', 509, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":81,\"product_id\":11,\"sellprice\":20,\"quantity\":\"10.00\"}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1497, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":150}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1498, 'default', 'created', 'App\\Models\\OrderDetail', 510, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":81,\"product_id\":38,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1499, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":190},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":200}}', '2022-05-17 10:45:11', '2022-05-17 10:45:11');
INSERT INTO `activity_log` VALUES (1500, 'default', 'created', 'App\\Models\\Order', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":9,\"user_id\":1,\"subtotal\":1705,\"vat\":0,\"discount\":0,\"grandtotal\":1705,\"kh_grandtotal\":null}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1501, 'default', 'updated', 'App\\Models\\Balance', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"11956.00\",\"income\":\"5289.00\",\"withdraw\":\"0.00\",\"balance\":\"17245.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"11956.00\",\"income\":\"3584.00\",\"withdraw\":\"0.00\",\"balance\":\"15540.00\",\"balance_date\":\"2022-05-17\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1502, 'default', 'created', 'App\\Models\\OrderDetail', 511, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":82,\"product_id\":53,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1503, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":110}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1504, 'default', 'created', 'App\\Models\\OrderDetail', 512, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":82,\"product_id\":44,\"sellprice\":59,\"quantity\":\"5.00\"}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1505, 'default', 'updated', 'App\\Models\\Stock', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":13},\"old\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":18}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1506, 'default', 'created', 'App\\Models\\OrderDetail', 513, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":82,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1507, 'default', 'updated', 'App\\Models\\Stock', 52, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":40}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1508, 'default', 'created', 'App\\Models\\OrderDetail', 514, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":82,\"product_id\":37,\"sellprice\":21.5,\"quantity\":\"10.00\"}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1509, 'default', 'updated', 'App\\Models\\Stock', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":105}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1510, 'default', 'created', 'App\\Models\\OrderDetail', 515, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":82,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1511, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":180}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1512, 'default', 'created', 'App\\Models\\OrderDetail', 516, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":82,\"product_id\":6,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1513, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":229},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":249}}', '2022-05-17 11:30:26', '2022-05-17 11:30:26');
INSERT INTO `activity_log` VALUES (1514, 'default', 'created', 'App\\Models\\Balance', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"17245.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"17245.00\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-18 07:04:38', '2022-05-18 07:04:38');
INSERT INTO `activity_log` VALUES (1515, 'default', 'created', 'App\\Models\\Order', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":12,\"user_id\":1,\"subtotal\":377.5,\"vat\":0,\"discount\":0,\"grandtotal\":377.5,\"kh_grandtotal\":null}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1516, 'default', 'updated', 'App\\Models\\Balance', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"17245.00\",\"income\":\"377.50\",\"withdraw\":\"0.00\",\"balance\":\"17622.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"17245.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"17245.00\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1517, 'default', 'created', 'App\\Models\\OrderDetail', 517, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":83,\"product_id\":8,\"sellprice\":14,\"quantity\":\"5.00\"}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1518, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":312},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":317}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1519, 'default', 'created', 'App\\Models\\OrderDetail', 518, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":83,\"product_id\":11,\"sellprice\":20.5,\"quantity\":\"5.00\"}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1520, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":135},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":140}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1521, 'default', 'created', 'App\\Models\\OrderDetail', 519, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":83,\"product_id\":6,\"sellprice\":16,\"quantity\":\"5.00\"}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1522, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":224},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":229}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1523, 'default', 'created', 'App\\Models\\OrderDetail', 520, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":83,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"10.00\"}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1524, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":159},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":169}}', '2022-05-18 07:05:46', '2022-05-18 07:05:46');
INSERT INTO `activity_log` VALUES (1525, 'default', 'created', 'App\\Models\\Order', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":176,\"vat\":0,\"discount\":0,\"grandtotal\":176,\"kh_grandtotal\":null}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1526, 'default', 'updated', 'App\\Models\\Balance', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"17245.00\",\"income\":\"553.50\",\"withdraw\":\"0.00\",\"balance\":\"17798.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"17245.00\",\"income\":\"377.50\",\"withdraw\":\"0.00\",\"balance\":\"17622.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1527, 'default', 'created', 'App\\Models\\OrderDetail', 521, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":84,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"2.00\"}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1528, 'default', 'updated', 'App\\Models\\Stock', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":52}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1529, 'default', 'created', 'App\\Models\\OrderDetail', 522, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":84,\"product_id\":2,\"sellprice\":11,\"quantity\":\"5.00\"}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1530, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":125},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":130}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1531, 'default', 'created', 'App\\Models\\OrderDetail', 523, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":84,\"product_id\":28,\"sellprice\":18,\"quantity\":\"5.00\"}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1532, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":107},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":112}}', '2022-05-18 09:48:36', '2022-05-18 09:48:36');
INSERT INTO `activity_log` VALUES (1533, 'default', 'created', 'App\\Models\\Order', 85, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":203,\"vat\":0,\"discount\":0,\"grandtotal\":203,\"kh_grandtotal\":null}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1534, 'default', 'updated', 'App\\Models\\Balance', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"17245.00\",\"income\":\"756.50\",\"withdraw\":\"0.00\",\"balance\":\"18001.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"17245.00\",\"income\":\"553.50\",\"withdraw\":\"0.00\",\"balance\":\"17798.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1535, 'default', 'created', 'App\\Models\\OrderDetail', 524, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":85,\"product_id\":27,\"sellprice\":18,\"quantity\":\"2.00\"}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1536, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":183},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":185}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1537, 'default', 'created', 'App\\Models\\OrderDetail', 525, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":85,\"product_id\":32,\"sellprice\":14,\"quantity\":\"3.00\"}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1538, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":434},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":437}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1539, 'default', 'created', 'App\\Models\\OrderDetail', 526, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":85,\"product_id\":28,\"sellprice\":18,\"quantity\":\"2.00\"}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1540, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":105},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":107}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1541, 'default', 'created', 'App\\Models\\OrderDetail', 527, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":85,\"product_id\":7,\"sellprice\":14,\"quantity\":\"2.00\"}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1542, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":225},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":227}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1543, 'default', 'created', 'App\\Models\\OrderDetail', 528, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":85,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"2.00\"}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1544, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":208},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":210}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1545, 'default', 'created', 'App\\Models\\OrderDetail', 529, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":85,\"product_id\":51,\"sellprice\":16,\"quantity\":\"2.00\"}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1546, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":101},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":103}}', '2022-05-18 09:51:10', '2022-05-18 09:51:10');
INSERT INTO `activity_log` VALUES (1547, 'default', 'created', 'App\\Models\\Order', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":3530,\"vat\":0,\"discount\":0,\"grandtotal\":3530,\"kh_grandtotal\":null}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1548, 'default', 'updated', 'App\\Models\\Balance', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"17245.00\",\"income\":\"4286.50\",\"withdraw\":\"0.00\",\"balance\":\"21531.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"17245.00\",\"income\":\"756.50\",\"withdraw\":\"0.00\",\"balance\":\"18001.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1549, 'default', 'created', 'App\\Models\\OrderDetail', 530, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":86,\"product_id\":7,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1550, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":205},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":225}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1551, 'default', 'created', 'App\\Models\\OrderDetail', 531, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":86,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"30.00\"}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1552, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":160}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1553, 'default', 'created', 'App\\Models\\OrderDetail', 532, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":86,\"product_id\":6,\"sellprice\":16,\"quantity\":\"30.00\"}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1554, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":194},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":224}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1555, 'default', 'created', 'App\\Models\\OrderDetail', 533, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":86,\"product_id\":51,\"sellprice\":16,\"quantity\":\"30.00\"}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1556, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":71},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":101}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1557, 'default', 'created', 'App\\Models\\OrderDetail', 534, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":86,\"product_id\":11,\"sellprice\":20.5,\"quantity\":\"50.00\"}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1558, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":135}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1559, 'default', 'created', 'App\\Models\\OrderDetail', 535, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":86,\"product_id\":38,\"sellprice\":16,\"quantity\":\"50.00\"}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1560, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":190}}', '2022-05-18 10:48:43', '2022-05-18 10:48:43');
INSERT INTO `activity_log` VALUES (1561, 'default', 'created', 'App\\Models\\Order', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":4215,\"vat\":0,\"discount\":0,\"grandtotal\":4215,\"kh_grandtotal\":null}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1562, 'default', 'updated', 'App\\Models\\Balance', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"17245.00\",\"income\":\"8501.50\",\"withdraw\":\"0.00\",\"balance\":\"25746.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"17245.00\",\"income\":\"4286.50\",\"withdraw\":\"0.00\",\"balance\":\"21531.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1563, 'default', 'created', 'App\\Models\\OrderDetail', 536, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":42,\"sellprice\":22,\"quantity\":\"10.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1564, 'default', 'updated', 'App\\Models\\Stock', 78, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":7},\"old\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":17}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1565, 'default', 'created', 'App\\Models\\OrderDetail', 537, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":33,\"sellprice\":23,\"quantity\":\"10.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1566, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":100}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1567, 'default', 'created', 'App\\Models\\OrderDetail', 538, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":47,\"sellprice\":17,\"quantity\":\"10.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1568, 'default', 'updated', 'App\\Models\\Stock', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":47},\"old\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":57}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1569, 'default', 'created', 'App\\Models\\OrderDetail', 539, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":27,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1570, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":173},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":183}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1571, 'default', 'created', 'App\\Models\\OrderDetail', 540, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":37,\"sellprice\":21.5,\"quantity\":\"10.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1572, 'default', 'updated', 'App\\Models\\Stock', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":95}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1573, 'default', 'created', 'App\\Models\\OrderDetail', 541, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":11,\"sellprice\":20.5,\"quantity\":\"10.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1574, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":85}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1575, 'default', 'created', 'App\\Models\\OrderDetail', 542, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":46,\"sellprice\":17,\"quantity\":\"20.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1576, 'default', 'updated', 'App\\Models\\Stock', 70, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":46,\"alert\":\"0.00\",\"total\":7},\"old\":{\"warehouse_id\":1,\"product_id\":46,\"alert\":\"0.00\",\"total\":27}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1577, 'default', 'created', 'App\\Models\\OrderDetail', 543, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1578, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":188},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":208}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1579, 'default', 'created', 'App\\Models\\OrderDetail', 544, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":32,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1580, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":414},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":434}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1581, 'default', 'created', 'App\\Models\\OrderDetail', 545, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"30.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1582, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":129},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":159}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1583, 'default', 'created', 'App\\Models\\OrderDetail', 546, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":3,\"sellprice\":13,\"quantity\":\"30.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1584, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":85}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1585, 'default', 'created', 'App\\Models\\OrderDetail', 547, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":8,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1586, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":282},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":312}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1587, 'default', 'created', 'App\\Models\\OrderDetail', 548, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":7,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1588, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":175},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":205}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1589, 'default', 'created', 'App\\Models\\OrderDetail', 549, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":87,\"product_id\":51,\"sellprice\":16,\"quantity\":\"30.00\"}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1590, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":41},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":71}}', '2022-05-18 10:52:05', '2022-05-18 10:52:05');
INSERT INTO `activity_log` VALUES (1591, 'default', 'created', 'App\\Models\\Order', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":7,\"user_id\":1,\"subtotal\":642.5,\"vat\":0,\"discount\":0,\"grandtotal\":642.5,\"kh_grandtotal\":null}}', '2022-05-18 11:29:39', '2022-05-18 11:29:39');
INSERT INTO `activity_log` VALUES (1592, 'default', 'updated', 'App\\Models\\Balance', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"17245.00\",\"income\":\"9144.00\",\"withdraw\":\"0.00\",\"balance\":\"26389.00\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"17245.00\",\"income\":\"8501.50\",\"withdraw\":\"0.00\",\"balance\":\"25746.50\",\"balance_date\":\"2022-05-18\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-18 11:29:39', '2022-05-18 11:29:39');
INSERT INTO `activity_log` VALUES (1593, 'default', 'created', 'App\\Models\\OrderDetail', 550, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":88,\"product_id\":58,\"sellprice\":17.5,\"quantity\":\"2.00\"}}', '2022-05-18 11:29:39', '2022-05-18 11:29:39');
INSERT INTO `activity_log` VALUES (1594, 'default', 'updated', 'App\\Models\\Stock', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":17}}', '2022-05-18 11:29:39', '2022-05-18 11:29:39');
INSERT INTO `activity_log` VALUES (1595, 'default', 'created', 'App\\Models\\OrderDetail', 551, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":88,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"5.00\"}}', '2022-05-18 11:29:40', '2022-05-18 11:29:40');
INSERT INTO `activity_log` VALUES (1596, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":80}}', '2022-05-18 11:29:40', '2022-05-18 11:29:40');
INSERT INTO `activity_log` VALUES (1597, 'default', 'created', 'App\\Models\\OrderDetail', 552, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":88,\"product_id\":11,\"sellprice\":20.5,\"quantity\":\"10.00\"}}', '2022-05-18 11:29:40', '2022-05-18 11:29:40');
INSERT INTO `activity_log` VALUES (1598, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":65},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":75}}', '2022-05-18 11:29:40', '2022-05-18 11:29:40');
INSERT INTO `activity_log` VALUES (1599, 'default', 'created', 'App\\Models\\OrderDetail', 553, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":88,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-18 11:29:40', '2022-05-18 11:29:40');
INSERT INTO `activity_log` VALUES (1600, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":130}}', '2022-05-18 11:29:40', '2022-05-18 11:29:40');
INSERT INTO `activity_log` VALUES (1601, 'default', 'created', 'App\\Models\\Purchase', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220519_v19__58_1652965139720\",\"subtotal\":3960,\"vat\":0,\"grandtotal\":3960}}', '2022-05-19 12:59:59', '2022-05-19 12:59:59');
INSERT INTO `activity_log` VALUES (1602, 'default', 'created', 'App\\Models\\PurchaseDetail', 134, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":24,\"product_id\":1,\"unitprice\":\"11.00\",\"quantity\":\"360.00\"}}', '2022-05-19 12:59:59', '2022-05-19 12:59:59');
INSERT INTO `activity_log` VALUES (1603, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":360},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":0}}', '2022-05-19 12:59:59', '2022-05-19 12:59:59');
INSERT INTO `activity_log` VALUES (1604, 'default', 'updated', 'App\\Models\\Product', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"316466814841\",\"en_name\":\"A3S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"1651156393.jpg\",\"sale_price\":13},\"old\":{\"category_id\":5,\"code\":\"316466814841\",\"en_name\":\"A3S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"1651156393.jpg\",\"sale_price\":13.5}}', '2022-05-19 13:00:31', '2022-05-19 13:00:31');
INSERT INTO `activity_log` VALUES (1605, 'default', 'created', 'App\\Models\\Balance', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"26389.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"26389.00\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-20 07:45:42', '2022-05-20 07:45:42');
INSERT INTO `activity_log` VALUES (1606, 'default', 'created', 'App\\Models\\Order', 89, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":15,\"user_id\":1,\"subtotal\":1222.5,\"vat\":0,\"discount\":0,\"grandtotal\":1222.5,\"kh_grandtotal\":null}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1607, 'default', 'updated', 'App\\Models\\Balance', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"26389.00\",\"income\":\"1222.50\",\"withdraw\":\"0.00\",\"balance\":\"27611.50\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"26389.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"26389.00\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1608, 'default', 'created', 'App\\Models\\OrderDetail', 554, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":89,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1609, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":404},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":414}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1610, 'default', 'created', 'App\\Models\\OrderDetail', 555, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":89,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"13.00\"}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1611, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":175},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":188}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1612, 'default', 'created', 'App\\Models\\OrderDetail', 556, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":89,\"product_id\":8,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1613, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":272},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":282}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1614, 'default', 'created', 'App\\Models\\OrderDetail', 557, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":89,\"product_id\":7,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1615, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":165},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":175}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1616, 'default', 'created', 'App\\Models\\OrderDetail', 558, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":89,\"product_id\":3,\"sellprice\":13,\"quantity\":\"13.00\"}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1617, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":42},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":55}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1618, 'default', 'created', 'App\\Models\\OrderDetail', 559, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":89,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"20.00\"}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1619, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":109},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":129}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1620, 'default', 'created', 'App\\Models\\OrderDetail', 560, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":89,\"product_id\":1,\"sellprice\":13,\"quantity\":\"15.00\"}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1621, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":345},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":360}}', '2022-05-20 07:48:37', '2022-05-20 07:48:37');
INSERT INTO `activity_log` VALUES (1622, 'default', 'created', 'App\\Models\\Order', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":10,\"user_id\":1,\"subtotal\":640,\"vat\":0,\"discount\":0,\"grandtotal\":640,\"kh_grandtotal\":null}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1623, 'default', 'updated', 'App\\Models\\Balance', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"26389.00\",\"income\":\"1862.50\",\"withdraw\":\"0.00\",\"balance\":\"28251.50\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"26389.00\",\"income\":\"1222.50\",\"withdraw\":\"0.00\",\"balance\":\"27611.50\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1624, 'default', 'created', 'App\\Models\\OrderDetail', 561, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":90,\"product_id\":3,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1625, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":32},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":42}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1626, 'default', 'created', 'App\\Models\\OrderDetail', 562, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":90,\"product_id\":51,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1627, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":31},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":41}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1628, 'default', 'created', 'App\\Models\\OrderDetail', 563, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":90,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1629, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":165},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":175}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1630, 'default', 'created', 'App\\Models\\OrderDetail', 564, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":90,\"product_id\":33,\"sellprice\":23,\"quantity\":\"5.00\"}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1631, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":90}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1632, 'default', 'created', 'App\\Models\\OrderDetail', 565, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":90,\"product_id\":27,\"sellprice\":18,\"quantity\":\"5.00\"}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1633, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":168},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":173}}', '2022-05-20 08:00:58', '2022-05-20 08:00:58');
INSERT INTO `activity_log` VALUES (1634, 'default', 'created', 'App\\Models\\Order', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":10,\"user_id\":1,\"subtotal\":945.5,\"vat\":0,\"discount\":0,\"grandtotal\":945.5,\"kh_grandtotal\":null}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1635, 'default', 'updated', 'App\\Models\\Balance', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"26389.00\",\"income\":\"2808.00\",\"withdraw\":\"0.00\",\"balance\":\"29197.00\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"26389.00\",\"income\":\"1862.50\",\"withdraw\":\"0.00\",\"balance\":\"28251.50\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1636, 'default', 'created', 'App\\Models\\OrderDetail', 566, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":55,\"sellprice\":15,\"quantity\":\"2.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1637, 'default', 'updated', 'App\\Models\\Stock', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":11},\"old\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":13}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1638, 'default', 'created', 'App\\Models\\OrderDetail', 567, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":54,\"sellprice\":15,\"quantity\":\"2.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1639, 'default', 'updated', 'App\\Models\\Stock', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":11},\"old\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":13}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1640, 'default', 'created', 'App\\Models\\OrderDetail', 568, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"3.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1641, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":72},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":75}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1642, 'default', 'created', 'App\\Models\\OrderDetail', 569, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1643, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":394},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":404}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1644, 'default', 'created', 'App\\Models\\OrderDetail', 570, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":7,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1645, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":155},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":165}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1646, 'default', 'created', 'App\\Models\\OrderDetail', 571, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":1,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1647, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":335},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":345}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1648, 'default', 'created', 'App\\Models\\OrderDetail', 572, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":3,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1649, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":22},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":32}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1650, 'default', 'created', 'App\\Models\\OrderDetail', 573, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":91,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1651, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":145},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":165}}', '2022-05-20 08:03:07', '2022-05-20 08:03:07');
INSERT INTO `activity_log` VALUES (1652, 'default', 'created', 'App\\Models\\Order', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":11,\"user_id\":1,\"subtotal\":2860,\"vat\":0,\"discount\":0,\"grandtotal\":2860,\"kh_grandtotal\":null}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1653, 'default', 'updated', 'App\\Models\\Balance', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"26389.00\",\"income\":\"5668.00\",\"withdraw\":\"0.00\",\"balance\":\"32057.00\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"26389.00\",\"income\":\"2808.00\",\"withdraw\":\"0.00\",\"balance\":\"29197.00\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1654, 'default', 'created', 'App\\Models\\OrderDetail', 574, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":22,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1655, 'default', 'updated', 'App\\Models\\Stock', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":90}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1656, 'default', 'created', 'App\\Models\\OrderDetail', 575, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":34,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1657, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":90}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1658, 'default', 'created', 'App\\Models\\OrderDetail', 576, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"10.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1659, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":99},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":109}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1660, 'default', 'created', 'App\\Models\\OrderDetail', 577, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1661, 'default', 'updated', 'App\\Models\\Stock', 52, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":30}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1662, 'default', 'created', 'App\\Models\\OrderDetail', 578, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":53,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1663, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":80}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1664, 'default', 'created', 'App\\Models\\OrderDetail', 579, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1665, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":105},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":125}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1666, 'default', 'created', 'App\\Models\\OrderDetail', 580, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":32,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1667, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":374},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":394}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1668, 'default', 'created', 'App\\Models\\OrderDetail', 581, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":1,\"sellprice\":13,\"quantity\":\"50.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1669, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":285},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":335}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1670, 'default', 'created', 'App\\Models\\OrderDetail', 582, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":33,\"sellprice\":23,\"quantity\":\"5.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1671, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":85}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1672, 'default', 'created', 'App\\Models\\OrderDetail', 583, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":38,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1673, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":140}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1674, 'default', 'created', 'App\\Models\\OrderDetail', 584, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1675, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":110}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1676, 'default', 'created', 'App\\Models\\OrderDetail', 585, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":92,\"product_id\":51,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1677, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":21},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":31}}', '2022-05-20 08:39:50', '2022-05-20 08:39:50');
INSERT INTO `activity_log` VALUES (1678, 'default', 'created', 'App\\Models\\Order', 93, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":228.5,\"vat\":0,\"discount\":0,\"grandtotal\":228.5,\"kh_grandtotal\":null}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1679, 'default', 'updated', 'App\\Models\\Balance', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"26389.00\",\"income\":\"5896.50\",\"withdraw\":\"0.00\",\"balance\":\"32285.50\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"26389.00\",\"income\":\"5668.00\",\"withdraw\":\"0.00\",\"balance\":\"32057.00\",\"balance_date\":\"2022-05-20\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1680, 'default', 'created', 'App\\Models\\OrderDetail', 586, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":93,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"2.00\"}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1681, 'default', 'updated', 'App\\Models\\Stock', 52, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":8},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":10}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1682, 'default', 'created', 'App\\Models\\OrderDetail', 587, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":93,\"product_id\":43,\"sellprice\":14.5,\"quantity\":\"2.00\"}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1683, 'default', 'updated', 'App\\Models\\Stock', 53, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":43,\"alert\":\"0.00\",\"total\":68},\"old\":{\"warehouse_id\":1,\"product_id\":43,\"alert\":\"0.00\",\"total\":70}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1684, 'default', 'created', 'App\\Models\\OrderDetail', 588, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":93,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"5.00\"}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1685, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":145}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1686, 'default', 'created', 'App\\Models\\OrderDetail', 589, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":93,\"product_id\":27,\"sellprice\":18,\"quantity\":\"2.00\"}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1687, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":166},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":168}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1688, 'default', 'created', 'App\\Models\\OrderDetail', 590, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":93,\"product_id\":34,\"sellprice\":16,\"quantity\":\"2.00\"}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1689, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":78},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":80}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1690, 'default', 'created', 'App\\Models\\OrderDetail', 591, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":93,\"product_id\":5,\"sellprice\":15,\"quantity\":\"2.00\"}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1691, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":73},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":75}}', '2022-05-20 08:50:21', '2022-05-20 08:50:21');
INSERT INTO `activity_log` VALUES (1692, 'default', 'created', 'App\\Models\\Balance', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"32285.50\",\"balance_date\":\"2022-05-21\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-21 08:48:25', '2022-05-21 08:48:25');
INSERT INTO `activity_log` VALUES (1693, 'default', 'created', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"32285.50\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:09:09', '2022-05-22 04:09:09');
INSERT INTO `activity_log` VALUES (1694, 'default', 'created', 'App\\Models\\Order', 94, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":11,\"user_id\":1,\"subtotal\":1137.5,\"vat\":0,\"discount\":0,\"grandtotal\":1137.5,\"kh_grandtotal\":null}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1695, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"1137.50\",\"withdraw\":\"0.00\",\"balance\":\"33423.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"32285.50\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1696, 'default', 'created', 'App\\Models\\OrderDetail', 592, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":94,\"product_id\":38,\"sellprice\":16,\"quantity\":\"50.00\"}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1697, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":130}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1698, 'default', 'created', 'App\\Models\\OrderDetail', 593, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":94,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1699, 'default', 'updated', 'App\\Models\\Stock', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":40}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1700, 'default', 'created', 'App\\Models\\OrderDetail', 594, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":94,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1701, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":80}}', '2022-05-22 04:10:40', '2022-05-22 04:10:40');
INSERT INTO `activity_log` VALUES (1702, 'default', 'created', 'App\\Models\\Order', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":258,\"vat\":0,\"discount\":0,\"grandtotal\":258,\"kh_grandtotal\":null}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1703, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"1395.50\",\"withdraw\":\"0.00\",\"balance\":\"33681.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"1137.50\",\"withdraw\":\"0.00\",\"balance\":\"33423.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1704, 'default', 'created', 'App\\Models\\OrderDetail', 595, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":95,\"product_id\":6,\"sellprice\":16,\"quantity\":\"8.00\"}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1705, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":186},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":194}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1706, 'default', 'created', 'App\\Models\\OrderDetail', 596, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":95,\"product_id\":47,\"sellprice\":17,\"quantity\":\"4.00\"}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1707, 'default', 'updated', 'App\\Models\\Stock', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":43},\"old\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":47}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1708, 'default', 'created', 'App\\Models\\OrderDetail', 597, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":95,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"4.00\"}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1709, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":86},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":90}}', '2022-05-22 04:11:34', '2022-05-22 04:11:34');
INSERT INTO `activity_log` VALUES (1710, 'default', 'created', 'App\\Models\\Order', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":4075,\"vat\":0,\"discount\":0,\"grandtotal\":4075,\"kh_grandtotal\":null}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1711, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"5470.50\",\"withdraw\":\"0.00\",\"balance\":\"37756.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"1395.50\",\"withdraw\":\"0.00\",\"balance\":\"33681.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1712, 'default', 'created', 'App\\Models\\OrderDetail', 598, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1713, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":79},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":99}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1714, 'default', 'created', 'App\\Models\\OrderDetail', 599, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":32,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1715, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":354},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":374}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1716, 'default', 'created', 'App\\Models\\OrderDetail', 600, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1717, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":105}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1718, 'default', 'created', 'App\\Models\\OrderDetail', 601, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":5,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1719, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":63},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":73}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1720, 'default', 'created', 'App\\Models\\OrderDetail', 602, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":34,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1721, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":68},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":78}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1722, 'default', 'created', 'App\\Models\\OrderDetail', 603, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":28,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1723, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":105}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1724, 'default', 'created', 'App\\Models\\OrderDetail', 604, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":27,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1725, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":156},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":166}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1726, 'default', 'created', 'App\\Models\\OrderDetail', 605, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"30.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1727, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":140}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1728, 'default', 'created', 'App\\Models\\OrderDetail', 606, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":3,\"sellprice\":13,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1729, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":2},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":22}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1730, 'default', 'created', 'App\\Models\\OrderDetail', 607, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":1,\"sellprice\":13,\"quantity\":\"30.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1731, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":255},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":285}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1732, 'default', 'created', 'App\\Models\\OrderDetail', 608, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1733, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":66},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":86}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1734, 'default', 'created', 'App\\Models\\OrderDetail', 609, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":11,\"sellprice\":20.5,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1735, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":65}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1736, 'default', 'created', 'App\\Models\\OrderDetail', 610, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":38,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1737, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":80}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1738, 'default', 'created', 'App\\Models\\OrderDetail', 611, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":6,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1739, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":166},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":186}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1740, 'default', 'created', 'App\\Models\\OrderDetail', 612, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":96,\"product_id\":51,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1741, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":1},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":21}}', '2022-05-22 04:21:09', '2022-05-22 04:21:09');
INSERT INTO `activity_log` VALUES (1742, 'default', 'created', 'App\\Models\\Order', 97, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":1970,\"vat\":0,\"discount\":0,\"grandtotal\":1970,\"kh_grandtotal\":null}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1743, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"7440.50\",\"withdraw\":\"0.00\",\"balance\":\"39726.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"5470.50\",\"withdraw\":\"0.00\",\"balance\":\"37756.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1744, 'default', 'created', 'App\\Models\\OrderDetail', 613, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":54,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1745, 'default', 'updated', 'App\\Models\\Stock', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":1},\"old\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":11}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1746, 'default', 'created', 'App\\Models\\OrderDetail', 614, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":55,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1747, 'default', 'updated', 'App\\Models\\Stock', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":1},\"old\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":11}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1748, 'default', 'created', 'App\\Models\\OrderDetail', 615, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":45,\"sellprice\":17,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1749, 'default', 'updated', 'App\\Models\\Stock', 58, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":45}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1750, 'default', 'created', 'App\\Models\\OrderDetail', 616, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":47,\"sellprice\":17,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1751, 'default', 'updated', 'App\\Models\\Stock', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":33},\"old\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":43}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1752, 'default', 'created', 'App\\Models\\OrderDetail', 617, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1753, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":62},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":72}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1754, 'default', 'created', 'App\\Models\\OrderDetail', 618, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":53,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1755, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":60}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1756, 'default', 'created', 'App\\Models\\OrderDetail', 619, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":36,\"sellprice\":17,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1757, 'default', 'updated', 'App\\Models\\Stock', 89, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":90}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1758, 'default', 'created', 'App\\Models\\OrderDetail', 620, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1759, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":65},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":75}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1760, 'default', 'created', 'App\\Models\\OrderDetail', 621, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":8,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1761, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":242},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":272}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1762, 'default', 'created', 'App\\Models\\OrderDetail', 622, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":97,\"product_id\":7,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1763, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":135},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":155}}', '2022-05-22 04:23:40', '2022-05-22 04:23:40');
INSERT INTO `activity_log` VALUES (1764, 'default', 'created', 'App\\Models\\Order', 98, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":13,\"user_id\":1,\"subtotal\":370,\"vat\":0,\"discount\":0,\"grandtotal\":370,\"kh_grandtotal\":null}}', '2022-05-22 04:25:32', '2022-05-22 04:25:32');
INSERT INTO `activity_log` VALUES (1765, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"7810.50\",\"withdraw\":\"0.00\",\"balance\":\"40096.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"7440.50\",\"withdraw\":\"0.00\",\"balance\":\"39726.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:25:32', '2022-05-22 04:25:32');
INSERT INTO `activity_log` VALUES (1766, 'default', 'created', 'App\\Models\\OrderDetail', 623, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":98,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-22 04:25:32', '2022-05-22 04:25:32');
INSERT INTO `activity_log` VALUES (1767, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":95}}', '2022-05-22 04:25:32', '2022-05-22 04:25:32');
INSERT INTO `activity_log` VALUES (1768, 'default', 'created', 'App\\Models\\OrderDetail', 624, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":98,\"product_id\":1,\"sellprice\":13,\"quantity\":\"20.00\"}}', '2022-05-22 04:25:32', '2022-05-22 04:25:32');
INSERT INTO `activity_log` VALUES (1769, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":235},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":255}}', '2022-05-22 04:25:32', '2022-05-22 04:25:32');
INSERT INTO `activity_log` VALUES (1770, 'default', 'created', 'App\\Models\\Order', 99, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":5,\"user_id\":1,\"subtotal\":1445,\"vat\":0,\"discount\":0,\"grandtotal\":1445,\"kh_grandtotal\":null}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1771, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"9255.50\",\"withdraw\":\"0.00\",\"balance\":\"41541.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"7810.50\",\"withdraw\":\"0.00\",\"balance\":\"40096.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1772, 'default', 'created', 'App\\Models\\OrderDetail', 625, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":19,\"sellprice\":14.5,\"quantity\":\"3.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1773, 'default', 'updated', 'App\\Models\\Stock', 55, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":24},\"old\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":27}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1774, 'default', 'created', 'App\\Models\\OrderDetail', 626, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1775, 'default', 'updated', 'App\\Models\\Stock', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":20}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1776, 'default', 'created', 'App\\Models\\OrderDetail', 627, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":34,\"sellprice\":16,\"quantity\":\"5.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1777, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":63},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":68}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1778, 'default', 'created', 'App\\Models\\OrderDetail', 628, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":36,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1779, 'default', 'updated', 'App\\Models\\Stock', 89, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":80}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1780, 'default', 'created', 'App\\Models\\OrderDetail', 629, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":42,\"sellprice\":22,\"quantity\":\"3.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1781, 'default', 'updated', 'App\\Models\\Stock', 78, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":4},\"old\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":7}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1782, 'default', 'created', 'App\\Models\\OrderDetail', 630, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":41,\"sellprice\":19,\"quantity\":\"5.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1783, 'default', 'updated', 'App\\Models\\Stock', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":41},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":46}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1784, 'default', 'created', 'App\\Models\\OrderDetail', 631, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":58,\"sellprice\":17.5,\"quantity\":\"5.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1785, 'default', 'updated', 'App\\Models\\Stock', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":15}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1786, 'default', 'created', 'App\\Models\\OrderDetail', 632, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"3.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1787, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":59},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":62}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1788, 'default', 'created', 'App\\Models\\OrderDetail', 633, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":5,\"sellprice\":15,\"quantity\":\"2.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1789, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":61},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":63}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1790, 'default', 'created', 'App\\Models\\OrderDetail', 634, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1791, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":85}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1792, 'default', 'created', 'App\\Models\\OrderDetail', 635, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":28,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1793, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":95}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1794, 'default', 'created', 'App\\Models\\OrderDetail', 636, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1795, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":65}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1796, 'default', 'created', 'App\\Models\\OrderDetail', 637, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":8,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1797, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":232},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":242}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1798, 'default', 'created', 'App\\Models\\OrderDetail', 638, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":1,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1799, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":225},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":235}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1800, 'default', 'created', 'App\\Models\\OrderDetail', 639, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":99,\"product_id\":7,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1801, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":125},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":135}}', '2022-05-22 04:28:45', '2022-05-22 04:28:45');
INSERT INTO `activity_log` VALUES (1802, 'default', 'created', 'App\\Models\\Order', 100, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":5,\"user_id\":1,\"subtotal\":66,\"vat\":0,\"discount\":0,\"grandtotal\":66,\"kh_grandtotal\":null}}', '2022-05-22 04:31:43', '2022-05-22 04:31:43');
INSERT INTO `activity_log` VALUES (1803, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"9321.50\",\"withdraw\":\"0.00\",\"balance\":\"41607.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"9255.50\",\"withdraw\":\"0.00\",\"balance\":\"41541.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:31:43', '2022-05-22 04:31:43');
INSERT INTO `activity_log` VALUES (1804, 'default', 'created', 'App\\Models\\OrderDetail', 640, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":100,\"product_id\":23,\"sellprice\":11,\"quantity\":\"3.00\"}}', '2022-05-22 04:31:43', '2022-05-22 04:31:43');
INSERT INTO `activity_log` VALUES (1805, 'default', 'updated', 'App\\Models\\Stock', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":72},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":75}}', '2022-05-22 04:31:43', '2022-05-22 04:31:43');
INSERT INTO `activity_log` VALUES (1806, 'default', 'created', 'App\\Models\\OrderDetail', 641, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":100,\"product_id\":22,\"sellprice\":11,\"quantity\":\"3.00\"}}', '2022-05-22 04:31:43', '2022-05-22 04:31:43');
INSERT INTO `activity_log` VALUES (1807, 'default', 'updated', 'App\\Models\\Stock', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":77},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":80}}', '2022-05-22 04:31:43', '2022-05-22 04:31:43');
INSERT INTO `activity_log` VALUES (1808, 'default', 'created', 'App\\Models\\Order', 101, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":15,\"user_id\":1,\"subtotal\":28,\"vat\":0,\"discount\":0,\"grandtotal\":28,\"kh_grandtotal\":null}}', '2022-05-22 04:32:36', '2022-05-22 04:32:36');
INSERT INTO `activity_log` VALUES (1809, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"9349.50\",\"withdraw\":\"0.00\",\"balance\":\"41635.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"9321.50\",\"withdraw\":\"0.00\",\"balance\":\"41607.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:32:36', '2022-05-22 04:32:36');
INSERT INTO `activity_log` VALUES (1810, 'default', 'created', 'App\\Models\\OrderDetail', 642, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":101,\"product_id\":8,\"sellprice\":14,\"quantity\":\"2.00\"}}', '2022-05-22 04:32:36', '2022-05-22 04:32:36');
INSERT INTO `activity_log` VALUES (1811, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":230},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":232}}', '2022-05-22 04:32:36', '2022-05-22 04:32:36');
INSERT INTO `activity_log` VALUES (1812, 'default', 'created', 'App\\Models\\Order', 102, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":7,\"user_id\":1,\"subtotal\":336,\"vat\":0,\"discount\":0,\"grandtotal\":336,\"kh_grandtotal\":null}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1813, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"9685.50\",\"withdraw\":\"0.00\",\"balance\":\"41971.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"9349.50\",\"withdraw\":\"0.00\",\"balance\":\"41635.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1814, 'default', 'created', 'App\\Models\\OrderDetail', 643, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":102,\"product_id\":6,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1815, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":156},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":166}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1816, 'default', 'created', 'App\\Models\\OrderDetail', 644, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":102,\"product_id\":38,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1817, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":60}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1818, 'default', 'created', 'App\\Models\\OrderDetail', 645, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":102,\"product_id\":51,\"sellprice\":16,\"quantity\":\"1.00\"}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1819, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":1}}', '2022-05-22 04:34:05', '2022-05-22 04:34:05');
INSERT INTO `activity_log` VALUES (1820, 'default', 'created', 'App\\Models\\Order', 103, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":2545,\"vat\":0,\"discount\":0,\"grandtotal\":2545,\"kh_grandtotal\":null}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1821, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"12230.50\",\"withdraw\":\"0.00\",\"balance\":\"44516.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"9685.50\",\"withdraw\":\"0.00\",\"balance\":\"41971.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1822, 'default', 'created', 'App\\Models\\OrderDetail', 646, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":103,\"product_id\":16,\"sellprice\":41,\"quantity\":\"10.00\"}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1823, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":24},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":34}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1824, 'default', 'created', 'App\\Models\\OrderDetail', 647, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":103,\"product_id\":34,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1825, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":53},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":63}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1826, 'default', 'created', 'App\\Models\\OrderDetail', 648, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":103,\"product_id\":5,\"sellprice\":15,\"quantity\":\"20.00\"}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1827, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":41},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":61}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1828, 'default', 'created', 'App\\Models\\OrderDetail', 649, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":103,\"product_id\":33,\"sellprice\":23,\"quantity\":\"10.00\"}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1829, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":80}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1830, 'default', 'created', 'App\\Models\\OrderDetail', 650, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":103,\"product_id\":7,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1831, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":125}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1832, 'default', 'created', 'App\\Models\\OrderDetail', 651, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":103,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"30.00\"}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1833, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":49},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":79}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1834, 'default', 'created', 'App\\Models\\OrderDetail', 652, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":103,\"product_id\":1,\"sellprice\":13,\"quantity\":\"50.00\"}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1835, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":175},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":225}}', '2022-05-22 04:39:03', '2022-05-22 04:39:03');
INSERT INTO `activity_log` VALUES (1836, 'default', 'created', 'App\\Models\\Purchase', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220522_v13__17_1653200264804\",\"subtotal\":2508,\"vat\":0,\"grandtotal\":2508}}', '2022-05-22 13:18:47', '2022-05-22 13:18:47');
INSERT INTO `activity_log` VALUES (1837, 'default', 'created', 'App\\Models\\PurchaseDetail', 135, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":25,\"product_id\":24,\"unitprice\":\"13.20\",\"quantity\":\"190.00\"}}', '2022-05-22 13:18:47', '2022-05-22 13:18:47');
INSERT INTO `activity_log` VALUES (1838, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":190},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":0}}', '2022-05-22 13:18:47', '2022-05-22 13:18:47');
INSERT INTO `activity_log` VALUES (1839, 'default', 'created', 'App\\Models\\Order', 104, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":596.5,\"vat\":0,\"discount\":0,\"grandtotal\":596.5,\"kh_grandtotal\":null}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1840, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"12827.00\",\"withdraw\":\"0.00\",\"balance\":\"45112.50\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"12230.50\",\"withdraw\":\"0.00\",\"balance\":\"44516.00\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1841, 'default', 'created', 'App\\Models\\OrderDetail', 653, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"2.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1842, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":53},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":55}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1843, 'default', 'created', 'App\\Models\\OrderDetail', 654, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":55,\"sellprice\":15,\"quantity\":\"1.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1844, 'default', 'updated', 'App\\Models\\Stock', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":55,\"alert\":\"0.00\",\"total\":1}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1845, 'default', 'created', 'App\\Models\\OrderDetail', 655, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":54,\"sellprice\":15,\"quantity\":\"1.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1846, 'default', 'updated', 'App\\Models\\Stock', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":54,\"alert\":\"0.00\",\"total\":1}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1847, 'default', 'created', 'App\\Models\\OrderDetail', 656, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":37,\"sellprice\":21.5,\"quantity\":\"2.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1848, 'default', 'updated', 'App\\Models\\Stock', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":83},\"old\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":85}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1849, 'default', 'created', 'App\\Models\\OrderDetail', 657, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":27,\"sellprice\":18,\"quantity\":\"2.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1850, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":154},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":156}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1851, 'default', 'created', 'App\\Models\\OrderDetail', 658, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":1,\"sellprice\":13,\"quantity\":\"5.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1852, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":170},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":175}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1853, 'default', 'created', 'App\\Models\\OrderDetail', 659, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":33,\"sellprice\":23,\"quantity\":\"6.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1854, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":64},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":70}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1855, 'default', 'created', 'App\\Models\\OrderDetail', 660, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":7,\"sellprice\":14,\"quantity\":\"5.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1856, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":95}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1857, 'default', 'created', 'App\\Models\\OrderDetail', 661, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":104,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"15.00\"}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1858, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":34},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":49}}', '2022-05-22 17:00:07', '2022-05-22 17:00:07');
INSERT INTO `activity_log` VALUES (1859, 'default', 'created', 'App\\Models\\Order', 105, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":495,\"vat\":0,\"discount\":0,\"grandtotal\":495,\"kh_grandtotal\":null}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1860, 'default', 'updated', 'App\\Models\\Balance', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"32285.50\",\"income\":\"13322.00\",\"withdraw\":\"0.00\",\"balance\":\"45607.50\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"32285.50\",\"income\":\"12827.00\",\"withdraw\":\"0.00\",\"balance\":\"45112.50\",\"balance_date\":\"2022-05-22\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1861, 'default', 'created', 'App\\Models\\OrderDetail', 662, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":105,\"product_id\":1,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1862, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":170}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1863, 'default', 'created', 'App\\Models\\OrderDetail', 663, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":105,\"product_id\":11,\"sellprice\":20.5,\"quantity\":\"10.00\"}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1864, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":45}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1865, 'default', 'created', 'App\\Models\\OrderDetail', 664, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":105,\"product_id\":6,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1866, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":146},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":156}}', '2022-05-22 17:00:58', '2022-05-22 17:00:58');
INSERT INTO `activity_log` VALUES (1867, 'default', 'created', 'App\\Models\\Balance', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"45607.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"45607.50\",\"balance_date\":\"2022-05-23\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-23 09:47:10', '2022-05-23 09:47:10');
INSERT INTO `activity_log` VALUES (1868, 'default', 'created', 'App\\Models\\Order', 106, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":432.5,\"vat\":0,\"discount\":0,\"grandtotal\":432.5,\"kh_grandtotal\":null}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1869, 'default', 'updated', 'App\\Models\\Balance', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"45607.50\",\"income\":\"432.50\",\"withdraw\":\"0.00\",\"balance\":\"46040.00\",\"balance_date\":\"2022-05-23\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"45607.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"45607.50\",\"balance_date\":\"2022-05-23\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1870, 'default', 'created', 'App\\Models\\OrderDetail', 665, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":106,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1871, 'default', 'updated', 'App\\Models\\Stock', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":15}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1872, 'default', 'created', 'App\\Models\\OrderDetail', 666, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":106,\"product_id\":10,\"sellprice\":19.5,\"quantity\":\"10.00\"}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1873, 'default', 'updated', 'App\\Models\\Stock', 85, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":58},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":68}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1874, 'default', 'created', 'App\\Models\\OrderDetail', 667, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":106,\"product_id\":36,\"sellprice\":17,\"quantity\":\"10.00\"}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1875, 'default', 'updated', 'App\\Models\\Stock', 89, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":65},\"old\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":75}}', '2022-05-23 15:59:52', '2022-05-23 15:59:52');
INSERT INTO `activity_log` VALUES (1876, 'default', 'created', 'App\\Models\\Order', 107, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":386,\"vat\":0,\"discount\":0,\"grandtotal\":386,\"kh_grandtotal\":null}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1877, 'default', 'updated', 'App\\Models\\Balance', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"45607.50\",\"income\":\"818.50\",\"withdraw\":\"0.00\",\"balance\":\"46426.00\",\"balance_date\":\"2022-05-23\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"45607.50\",\"income\":\"432.50\",\"withdraw\":\"0.00\",\"balance\":\"46040.00\",\"balance_date\":\"2022-05-23\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1878, 'default', 'created', 'App\\Models\\OrderDetail', 668, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":107,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"8.00\"}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1879, 'default', 'updated', 'App\\Models\\Stock', 52, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":8}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1880, 'default', 'created', 'App\\Models\\OrderDetail', 669, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":107,\"product_id\":7,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1881, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":90}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1882, 'default', 'created', 'App\\Models\\OrderDetail', 670, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":107,\"product_id\":1,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1883, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":150},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":160}}', '2022-05-23 19:07:04', '2022-05-23 19:07:04');
INSERT INTO `activity_log` VALUES (1884, 'default', 'created', 'App\\Models\\Balance', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"46426.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"46426.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-25 08:26:59', '2022-05-25 08:26:59');
INSERT INTO `activity_log` VALUES (1885, 'default', 'created', 'App\\Models\\Order', 108, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":14,\"user_id\":1,\"subtotal\":1345,\"vat\":0,\"discount\":0,\"grandtotal\":1345,\"kh_grandtotal\":null}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1886, 'default', 'updated', 'App\\Models\\Balance', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"46426.00\",\"income\":\"1345.00\",\"withdraw\":\"0.00\",\"balance\":\"47771.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"46426.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"46426.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1887, 'default', 'created', 'App\\Models\\OrderDetail', 671, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":47,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1888, 'default', 'updated', 'App\\Models\\Stock', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":28},\"old\":{\"warehouse_id\":1,\"product_id\":47,\"alert\":\"0.00\",\"total\":33}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1889, 'default', 'created', 'App\\Models\\OrderDetail', 672, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":10,\"sellprice\":19.5,\"quantity\":\"3.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1890, 'default', 'updated', 'App\\Models\\Stock', 85, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":58}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1891, 'default', 'created', 'App\\Models\\OrderDetail', 673, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"2.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1892, 'default', 'updated', 'App\\Models\\Stock', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":48},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":50}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1893, 'default', 'created', 'App\\Models\\OrderDetail', 674, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":14,\"sellprice\":15.5,\"quantity\":\"3.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1894, 'default', 'updated', 'App\\Models\\Stock', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":62},\"old\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":65}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1895, 'default', 'created', 'App\\Models\\OrderDetail', 675, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":27,\"sellprice\":18,\"quantity\":\"3.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1896, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":151},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":154}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1897, 'default', 'created', 'App\\Models\\OrderDetail', 676, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":43,\"sellprice\":14.5,\"quantity\":\"5.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1898, 'default', 'updated', 'App\\Models\\Stock', 53, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":43,\"alert\":\"0.00\",\"total\":63},\"old\":{\"warehouse_id\":1,\"product_id\":43,\"alert\":\"0.00\",\"total\":68}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1899, 'default', 'created', 'App\\Models\\OrderDetail', 677, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":58,\"sellprice\":17.5,\"quantity\":\"5.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1900, 'default', 'updated', 'App\\Models\\Stock', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":5},\"old\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":10}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1901, 'default', 'created', 'App\\Models\\OrderDetail', 678, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":1,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1902, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":150}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1903, 'default', 'created', 'App\\Models\\OrderDetail', 679, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":53,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1904, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":50}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1905, 'default', 'created', 'App\\Models\\OrderDetail', 680, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":33,\"sellprice\":23,\"quantity\":\"10.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1906, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":54},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":64}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1907, 'default', 'created', 'App\\Models\\OrderDetail', 681, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1908, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":344},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":354}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1909, 'default', 'created', 'App\\Models\\OrderDetail', 682, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":9,\"sellprice\":12.5,\"quantity\":\"10.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1910, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":24},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":34}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1911, 'default', 'created', 'App\\Models\\OrderDetail', 683, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":108,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1912, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":110}}', '2022-05-25 08:30:15', '2022-05-25 08:30:15');
INSERT INTO `activity_log` VALUES (1913, 'default', 'created', 'App\\Models\\Order', 109, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":14,\"user_id\":1,\"subtotal\":1599,\"vat\":0,\"discount\":0,\"grandtotal\":1599,\"kh_grandtotal\":null}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1914, 'default', 'updated', 'App\\Models\\Balance', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"46426.00\",\"income\":\"2944.00\",\"withdraw\":\"0.00\",\"balance\":\"49370.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"46426.00\",\"income\":\"1345.00\",\"withdraw\":\"0.00\",\"balance\":\"47771.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1915, 'default', 'created', 'App\\Models\\OrderDetail', 684, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":17,\"sellprice\":80,\"quantity\":\"2.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1916, 'default', 'updated', 'App\\Models\\Stock', 46, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":6},\"old\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":8}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1917, 'default', 'created', 'App\\Models\\OrderDetail', 685, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":16,\"sellprice\":41,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1918, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":19},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":24}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1919, 'default', 'created', 'App\\Models\\OrderDetail', 686, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":44,\"sellprice\":59,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1920, 'default', 'updated', 'App\\Models\\Stock', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":8},\"old\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":13}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1921, 'default', 'created', 'App\\Models\\OrderDetail', 687, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":42,\"sellprice\":22,\"quantity\":\"2.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1922, 'default', 'updated', 'App\\Models\\Stock', 78, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":2},\"old\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":4}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1923, 'default', 'created', 'App\\Models\\OrderDetail', 688, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":45,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1924, 'default', 'updated', 'App\\Models\\Stock', 58, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":35}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1925, 'default', 'created', 'App\\Models\\OrderDetail', 689, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":28,\"sellprice\":18,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1926, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":85}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1927, 'default', 'created', 'App\\Models\\OrderDetail', 690, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":36,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1928, 'default', 'updated', 'App\\Models\\Stock', 89, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":65}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1929, 'default', 'created', 'App\\Models\\OrderDetail', 691, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1930, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":48},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":53}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1931, 'default', 'created', 'App\\Models\\OrderDetail', 692, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":2,\"sellprice\":11,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1932, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":75}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1933, 'default', 'created', 'App\\Models\\OrderDetail', 693, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":7,\"sellprice\":14,\"quantity\":\"15.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1934, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":65},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":80}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1935, 'default', 'created', 'App\\Models\\OrderDetail', 694, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"5.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1936, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":54},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":59}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1937, 'default', 'created', 'App\\Models\\OrderDetail', 695, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":109,\"product_id\":8,\"sellprice\":14,\"quantity\":\"15.00\"}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1938, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":215},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":230}}', '2022-05-25 08:32:55', '2022-05-25 08:32:55');
INSERT INTO `activity_log` VALUES (1939, 'default', 'created', 'App\\Models\\Order', 110, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":580,\"vat\":0,\"discount\":0,\"grandtotal\":580,\"kh_grandtotal\":null}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1940, 'default', 'updated', 'App\\Models\\Balance', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"46426.00\",\"income\":\"3524.00\",\"withdraw\":\"0.00\",\"balance\":\"49950.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"46426.00\",\"income\":\"2944.00\",\"withdraw\":\"0.00\",\"balance\":\"49370.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1941, 'default', 'created', 'App\\Models\\OrderDetail', 696, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":110,\"product_id\":14,\"sellprice\":15.5,\"quantity\":\"10.00\"}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1942, 'default', 'updated', 'App\\Models\\Stock', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":52},\"old\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":62}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1943, 'default', 'created', 'App\\Models\\OrderDetail', 697, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":110,\"product_id\":5,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1944, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":31},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":41}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1945, 'default', 'created', 'App\\Models\\OrderDetail', 698, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":110,\"product_id\":4,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1946, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":100}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1947, 'default', 'created', 'App\\Models\\OrderDetail', 699, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":110,\"product_id\":3,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1948, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":-8},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":2}}', '2022-05-25 08:34:08', '2022-05-25 08:34:08');
INSERT INTO `activity_log` VALUES (1949, 'default', 'created', 'App\\Models\\Order', 111, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":672,\"vat\":0,\"discount\":0,\"grandtotal\":672,\"kh_grandtotal\":null}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1950, 'default', 'updated', 'App\\Models\\Balance', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"46426.00\",\"income\":\"4196.00\",\"withdraw\":\"0.00\",\"balance\":\"50622.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"46426.00\",\"income\":\"3524.00\",\"withdraw\":\"0.00\",\"balance\":\"49950.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1951, 'default', 'created', 'App\\Models\\OrderDetail', 700, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":111,\"product_id\":44,\"sellprice\":59,\"quantity\":\"5.00\"}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1952, 'default', 'updated', 'App\\Models\\Stock', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":3},\"old\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":8}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1953, 'default', 'created', 'App\\Models\\OrderDetail', 701, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":111,\"product_id\":57,\"sellprice\":43,\"quantity\":\"4.00\"}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1954, 'default', 'updated', 'App\\Models\\Stock', 94, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":2},\"old\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":6}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1955, 'default', 'created', 'App\\Models\\OrderDetail', 702, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":111,\"product_id\":16,\"sellprice\":41,\"quantity\":\"5.00\"}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1956, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":14},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":19}}', '2022-05-25 08:39:10', '2022-05-25 08:39:10');
INSERT INTO `activity_log` VALUES (1957, 'default', 'created', 'App\\Models\\Order', 112, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":350,\"vat\":0,\"discount\":0,\"grandtotal\":350,\"kh_grandtotal\":null}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1958, 'default', 'updated', 'App\\Models\\Balance', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"46426.00\",\"income\":\"4546.00\",\"withdraw\":\"0.00\",\"balance\":\"50972.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"46426.00\",\"income\":\"4196.00\",\"withdraw\":\"0.00\",\"balance\":\"50622.00\",\"balance_date\":\"2022-05-25\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1959, 'default', 'created', 'App\\Models\\OrderDetail', 703, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":112,\"product_id\":56,\"sellprice\":36,\"quantity\":\"2.00\"}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1960, 'default', 'updated', 'App\\Models\\Stock', 93, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":56,\"alert\":\"0.00\",\"total\":6},\"old\":{\"warehouse_id\":1,\"product_id\":56,\"alert\":\"0.00\",\"total\":8}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1961, 'default', 'created', 'App\\Models\\OrderDetail', 704, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":112,\"product_id\":44,\"sellprice\":59,\"quantity\":\"2.00\"}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1962, 'default', 'updated', 'App\\Models\\Stock', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":1},\"old\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":3}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1963, 'default', 'created', 'App\\Models\\OrderDetail', 705, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":112,\"product_id\":17,\"sellprice\":80,\"quantity\":\"2.00\"}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1964, 'default', 'updated', 'App\\Models\\Stock', 46, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":4},\"old\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":6}}', '2022-05-25 16:07:11', '2022-05-25 16:07:11');
INSERT INTO `activity_log` VALUES (1965, 'default', 'created', 'App\\Models\\Product', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"310235118327\",\"en_name\":\"A52\",\"kh_name\":\"LCD OPPO\",\"description\":null,\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-25 20:21:52', '2022-05-25 20:21:52');
INSERT INTO `activity_log` VALUES (1966, 'default', 'created', 'App\\Models\\Product', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"293823743516\",\"en_name\":\"6\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20.5}}', '2022-05-25 20:23:31', '2022-05-25 20:23:31');
INSERT INTO `activity_log` VALUES (1967, 'default', 'created', 'App\\Models\\Purchase', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220525_v20__24_1653485049718\",\"subtotal\":14419.2,\"vat\":0,\"grandtotal\":14419.2}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1968, 'default', 'created', 'App\\Models\\PurchaseDetail', 136, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":26,\"product_id\":59,\"unitprice\":\"15.30\",\"quantity\":\"100.00\"}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1969, 'default', 'created', 'App\\Models\\Stock', 97, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":59,\"alert\":\"0.00\",\"total\":100}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1970, 'default', 'created', 'App\\Models\\PurchaseDetail', 137, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":26,\"product_id\":60,\"unitprice\":\"17.00\",\"quantity\":\"20.00\"}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1971, 'default', 'created', 'App\\Models\\Stock', 98, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":60,\"alert\":\"0.00\",\"total\":20}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1972, 'default', 'created', 'App\\Models\\PurchaseDetail', 138, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":26,\"product_id\":12,\"unitprice\":\"18.80\",\"quantity\":\"99.00\"}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1973, 'default', 'updated', 'App\\Models\\Stock', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":99},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":0}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1974, 'default', 'created', 'App\\Models\\PurchaseDetail', 139, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":26,\"product_id\":3,\"unitprice\":\"11.00\",\"quantity\":\"360.00\"}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1975, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":352},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":-8}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1976, 'default', 'created', 'App\\Models\\PurchaseDetail', 140, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":26,\"product_id\":39,\"unitprice\":\"11.20\",\"quantity\":\"170.00\"}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1977, 'default', 'updated', 'App\\Models\\Stock', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":170},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":0}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1978, 'default', 'created', 'App\\Models\\PurchaseDetail', 141, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":26,\"product_id\":51,\"unitprice\":\"13.40\",\"quantity\":\"360.00\"}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1979, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":360},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":0}}', '2022-05-25 20:38:28', '2022-05-25 20:38:28');
INSERT INTO `activity_log` VALUES (1980, 'default', 'updated', 'App\\Models\\Product', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"293823743516\",\"en_name\":\"6\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20},\"old\":{\"category_id\":5,\"code\":\"293823743516\",\"en_name\":\"6\",\"kh_name\":\"LCD REALME\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":20.5}}', '2022-05-25 20:46:46', '2022-05-25 20:46:46');
INSERT INTO `activity_log` VALUES (1981, 'default', 'updated', 'App\\Models\\Product', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"316466814841\",\"en_name\":\"A3S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"1651156393.jpg\",\"sale_price\":12.5},\"old\":{\"category_id\":5,\"code\":\"316466814841\",\"en_name\":\"A3S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"1651156393.jpg\",\"sale_price\":13}}', '2022-05-25 20:51:06', '2022-05-25 20:51:06');
INSERT INTO `activity_log` VALUES (1982, 'default', 'updated', 'App\\Models\\Product', 51, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"409509970859\",\"en_name\":\"A3S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5},\"old\":{\"category_id\":5,\"code\":\"409509970859\",\"en_name\":\"A3S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16}}', '2022-05-25 20:51:19', '2022-05-25 20:51:19');
INSERT INTO `activity_log` VALUES (1983, 'default', 'updated', 'App\\Models\\Product', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"310235118327\",\"en_name\":\"A52\",\"kh_name\":\"LCD OPPO\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":17.5},\"old\":{\"category_id\":5,\"code\":\"310235118327\",\"en_name\":\"A52\",\"kh_name\":\"LCD OPPO\",\"description\":null,\"image\":\"no image created\",\"sale_price\":17.5}}', '2022-05-25 20:51:36', '2022-05-25 20:51:36');
INSERT INTO `activity_log` VALUES (1984, 'default', 'updated', 'App\\Models\\Product', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349849\",\"en_name\":\"A5S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":12.5},\"old\":{\"category_id\":5,\"code\":\"908601349849\",\"en_name\":\"A5S\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13}}', '2022-05-25 20:52:02', '2022-05-25 20:52:02');
INSERT INTO `activity_log` VALUES (1985, 'default', 'updated', 'App\\Models\\Product', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349870\",\"en_name\":\"A5S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5},\"old\":{\"category_id\":5,\"code\":\"908601349870\",\"en_name\":\"A5S ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16}}', '2022-05-25 20:52:14', '2022-05-25 20:52:14');
INSERT INTO `activity_log` VALUES (1986, 'default', 'updated', 'App\\Models\\Product', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349854\",\"en_name\":\"Y12S\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.8},\"old\":{\"category_id\":5,\"code\":\"908601349854\",\"en_name\":\"Y12S\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14}}', '2022-05-25 20:52:55', '2022-05-25 20:52:55');
INSERT INTO `activity_log` VALUES (1987, 'default', 'updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349853\",\"en_name\":\"Y12\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.8},\"old\":{\"category_id\":5,\"code\":\"908601349853\",\"en_name\":\"Y12\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14}}', '2022-05-25 20:53:03', '2022-05-25 20:53:03');
INSERT INTO `activity_log` VALUES (1988, 'default', 'updated', 'App\\Models\\Product', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349850\",\"en_name\":\"A15\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":5,\"code\":\"908601349850\",\"en_name\":\"A15\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14.5}}', '2022-05-25 20:58:35', '2022-05-25 20:58:35');
INSERT INTO `activity_log` VALUES (1989, 'default', 'updated', 'App\\Models\\Product', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349884\",\"en_name\":\"A15 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":15.5},\"old\":{\"category_id\":5,\"code\":\"908601349884\",\"en_name\":\"A15 ORI\",\"kh_name\":\"LCD OPPO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16}}', '2022-05-25 20:59:08', '2022-05-25 20:59:08');
INSERT INTO `activity_log` VALUES (1990, 'default', 'updated', 'App\\Models\\Product', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349855\",\"en_name\":\"Y91\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":12},\"old\":{\"category_id\":5,\"code\":\"908601349855\",\"en_name\":\"Y91\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":12.5}}', '2022-05-25 21:00:57', '2022-05-25 21:00:57');
INSERT INTO `activity_log` VALUES (1991, 'default', 'updated', 'App\\Models\\Product', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"908601349882\",\"en_name\":\"Y85\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":5,\"code\":\"908601349882\",\"en_name\":\"Y85\",\"kh_name\":\"LCD VIVO\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17}}', '2022-05-25 21:02:35', '2022-05-25 21:02:35');
INSERT INTO `activity_log` VALUES (1992, 'default', 'created', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"50972.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 10:28:05', '2022-05-26 10:28:05');
INSERT INTO `activity_log` VALUES (1993, 'default', 'created', 'App\\Models\\Order', 113, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":708,\"vat\":0,\"discount\":0,\"grandtotal\":708,\"kh_grandtotal\":null}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (1994, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"708.00\",\"withdraw\":\"0.00\",\"balance\":\"51680.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"50972.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (1995, 'default', 'created', 'App\\Models\\OrderDetail', 706, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":113,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"10.00\"}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (1996, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":342},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":352}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (1997, 'default', 'created', 'App\\Models\\OrderDetail', 707, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":113,\"product_id\":16,\"sellprice\":41,\"quantity\":\"3.00\"}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (1998, 'default', 'updated', 'App\\Models\\Stock', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":11},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":14}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (1999, 'default', 'created', 'App\\Models\\OrderDetail', 708, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":113,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"10.00\"}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (2000, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":56},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":66}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (2001, 'default', 'created', 'App\\Models\\OrderDetail', 709, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":113,\"product_id\":28,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (2002, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":80}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (2003, 'default', 'created', 'App\\Models\\OrderDetail', 710, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":113,\"product_id\":1,\"sellprice\":12.5,\"quantity\":\"10.00\"}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (2004, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":140}}', '2022-05-26 10:29:11', '2022-05-26 10:29:11');
INSERT INTO `activity_log` VALUES (2005, 'default', 'created', 'App\\Models\\Order', 114, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":2490,\"vat\":0,\"discount\":0,\"grandtotal\":2490,\"kh_grandtotal\":null}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2006, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"3198.00\",\"withdraw\":\"0.00\",\"balance\":\"54170.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"708.00\",\"withdraw\":\"0.00\",\"balance\":\"51680.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2007, 'default', 'created', 'App\\Models\\OrderDetail', 711, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2008, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":70}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2009, 'default', 'created', 'App\\Models\\OrderDetail', 712, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":8,\"sellprice\":13.8,\"quantity\":\"30.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2010, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":185},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":215}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2011, 'default', 'created', 'App\\Models\\OrderDetail', 713, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":6,\"sellprice\":16,\"quantity\":\"30.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2012, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":116},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":146}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2013, 'default', 'created', 'App\\Models\\OrderDetail', 714, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":57,\"sellprice\":43,\"quantity\":\"2.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2014, 'default', 'updated', 'App\\Models\\Stock', 94, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":57,\"alert\":\"0.00\",\"total\":2}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2015, 'default', 'created', 'App\\Models\\OrderDetail', 715, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"10.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2016, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":44},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":54}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2017, 'default', 'created', 'App\\Models\\OrderDetail', 716, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":19,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2018, 'default', 'updated', 'App\\Models\\Stock', 55, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":14},\"old\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":24}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2019, 'default', 'created', 'App\\Models\\OrderDetail', 717, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2020, 'default', 'updated', 'App\\Models\\Stock', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":10}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2021, 'default', 'created', 'App\\Models\\OrderDetail', 718, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":53,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2022, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":40}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2023, 'default', 'created', 'App\\Models\\OrderDetail', 719, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":27,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2024, 'default', 'updated', 'App\\Models\\Stock', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":141},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":151}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2025, 'default', 'created', 'App\\Models\\OrderDetail', 720, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":4,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2026, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":90}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2027, 'default', 'created', 'App\\Models\\OrderDetail', 721, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2028, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":36},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":56}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2029, 'default', 'created', 'App\\Models\\OrderDetail', 722, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":114,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"2.00\"}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2030, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":340},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":342}}', '2022-05-26 11:00:10', '2022-05-26 11:00:10');
INSERT INTO `activity_log` VALUES (2031, 'default', 'created', 'App\\Models\\Order', 115, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":7,\"user_id\":1,\"subtotal\":520,\"vat\":0,\"discount\":0,\"grandtotal\":520,\"kh_grandtotal\":null}}', '2022-05-26 13:09:34', '2022-05-26 13:09:34');
INSERT INTO `activity_log` VALUES (2032, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"3718.00\",\"withdraw\":\"0.00\",\"balance\":\"54690.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"3198.00\",\"withdraw\":\"0.00\",\"balance\":\"54170.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 13:09:34', '2022-05-26 13:09:34');
INSERT INTO `activity_log` VALUES (2033, 'default', 'created', 'App\\Models\\OrderDetail', 723, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":115,\"product_id\":12,\"sellprice\":21,\"quantity\":\"10.00\"}}', '2022-05-26 13:09:34', '2022-05-26 13:09:34');
INSERT INTO `activity_log` VALUES (2034, 'default', 'updated', 'App\\Models\\Stock', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":89},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":99}}', '2022-05-26 13:09:34', '2022-05-26 13:09:34');
INSERT INTO `activity_log` VALUES (2035, 'default', 'created', 'App\\Models\\OrderDetail', 724, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":115,\"product_id\":24,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-26 13:09:34', '2022-05-26 13:09:34');
INSERT INTO `activity_log` VALUES (2036, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":170},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":190}}', '2022-05-26 13:09:34', '2022-05-26 13:09:34');
INSERT INTO `activity_log` VALUES (2037, 'default', 'created', 'App\\Models\\Order', 116, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":15,\"user_id\":1,\"subtotal\":148,\"vat\":0,\"discount\":0,\"grandtotal\":148,\"kh_grandtotal\":null}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2038, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"3866.00\",\"withdraw\":\"0.00\",\"balance\":\"54838.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"3718.00\",\"withdraw\":\"0.00\",\"balance\":\"54690.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2039, 'default', 'created', 'App\\Models\\OrderDetail', 725, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":33,\"sellprice\":23,\"quantity\":\"1.00\"}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2040, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":53},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":54}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2041, 'default', 'created', 'App\\Models\\OrderDetail', 726, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":32,\"sellprice\":14,\"quantity\":\"2.00\"}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2042, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":342},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":344}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2043, 'default', 'created', 'App\\Models\\OrderDetail', 727, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":4,\"sellprice\":14,\"quantity\":\"2.00\"}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2044, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":68},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":70}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2045, 'default', 'created', 'App\\Models\\OrderDetail', 728, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":7,\"sellprice\":13.8,\"quantity\":\"5.00\"}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2046, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":65}}', '2022-05-26 13:34:19', '2022-05-26 13:34:19');
INSERT INTO `activity_log` VALUES (2047, 'default', 'created', 'App\\Models\\Order', 117, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":234,\"vat\":0,\"discount\":0,\"grandtotal\":234,\"kh_grandtotal\":null}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2048, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"4100.00\",\"withdraw\":\"0.00\",\"balance\":\"55072.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"3866.00\",\"withdraw\":\"0.00\",\"balance\":\"54838.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2049, 'default', 'created', 'App\\Models\\OrderDetail', 729, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":117,\"product_id\":38,\"sellprice\":15.5,\"quantity\":\"4.00\"}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2050, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":46},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":50}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2051, 'default', 'created', 'App\\Models\\OrderDetail', 730, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":117,\"product_id\":24,\"sellprice\":15.5,\"quantity\":\"4.00\"}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2052, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":166},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":170}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2053, 'default', 'created', 'App\\Models\\OrderDetail', 731, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":117,\"product_id\":9,\"sellprice\":12,\"quantity\":\"5.00\"}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2054, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":19},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":24}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2055, 'default', 'created', 'App\\Models\\OrderDetail', 732, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":117,\"product_id\":1,\"sellprice\":12.5,\"quantity\":\"4.00\"}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2056, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":126},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":130}}', '2022-05-26 13:41:53', '2022-05-26 13:41:53');
INSERT INTO `activity_log` VALUES (2057, 'default', 'created', 'App\\Models\\Order', 118, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":7,\"user_id\":1,\"subtotal\":310,\"vat\":0,\"discount\":0,\"grandtotal\":310,\"kh_grandtotal\":null}}', '2022-05-26 16:58:53', '2022-05-26 16:58:53');
INSERT INTO `activity_log` VALUES (2058, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"4410.00\",\"withdraw\":\"0.00\",\"balance\":\"55382.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"4100.00\",\"withdraw\":\"0.00\",\"balance\":\"55072.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 16:58:53', '2022-05-26 16:58:53');
INSERT INTO `activity_log` VALUES (2059, 'default', 'created', 'App\\Models\\OrderDetail', 733, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":118,\"product_id\":51,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-26 16:58:53', '2022-05-26 16:58:53');
INSERT INTO `activity_log` VALUES (2060, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":340},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":360}}', '2022-05-26 16:58:53', '2022-05-26 16:58:53');
INSERT INTO `activity_log` VALUES (2061, 'default', 'created', 'App\\Models\\Order', 119, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":155,\"vat\":0,\"discount\":0,\"grandtotal\":155,\"kh_grandtotal\":null}}', '2022-05-26 16:59:31', '2022-05-26 16:59:31');
INSERT INTO `activity_log` VALUES (2062, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"4565.00\",\"withdraw\":\"0.00\",\"balance\":\"55537.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"4410.00\",\"withdraw\":\"0.00\",\"balance\":\"55382.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 16:59:31', '2022-05-26 16:59:31');
INSERT INTO `activity_log` VALUES (2063, 'default', 'created', 'App\\Models\\OrderDetail', 734, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":119,\"product_id\":51,\"sellprice\":15.5,\"quantity\":\"10.00\"}}', '2022-05-26 16:59:31', '2022-05-26 16:59:31');
INSERT INTO `activity_log` VALUES (2064, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":330},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":340}}', '2022-05-26 16:59:31', '2022-05-26 16:59:31');
INSERT INTO `activity_log` VALUES (2065, 'default', 'created', 'App\\Models\\Order', 120, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":11,\"user_id\":1,\"subtotal\":1550,\"vat\":0,\"discount\":0,\"grandtotal\":1550,\"kh_grandtotal\":null}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2066, 'default', 'updated', 'App\\Models\\Balance', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"50972.00\",\"income\":\"6115.00\",\"withdraw\":\"0.00\",\"balance\":\"57087.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"50972.00\",\"income\":\"4565.00\",\"withdraw\":\"0.00\",\"balance\":\"55537.00\",\"balance_date\":\"2022-05-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2067, 'default', 'created', 'App\\Models\\OrderDetail', 735, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"5.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2068, 'default', 'updated', 'App\\Models\\Stock', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":43},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":48}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2069, 'default', 'created', 'App\\Models\\OrderDetail', 736, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":14,\"sellprice\":15.5,\"quantity\":\"5.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2070, 'default', 'updated', 'App\\Models\\Stock', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":47},\"old\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":52}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2071, 'default', 'created', 'App\\Models\\OrderDetail', 737, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":34,\"sellprice\":16,\"quantity\":\"5.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2072, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":48},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":53}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2073, 'default', 'created', 'App\\Models\\OrderDetail', 738, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":5,\"sellprice\":15,\"quantity\":\"5.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2074, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":26},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":31}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2075, 'default', 'created', 'App\\Models\\OrderDetail', 739, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":28,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2076, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":70}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2077, 'default', 'created', 'App\\Models\\OrderDetail', 740, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":8,\"sellprice\":13.8,\"quantity\":\"20.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2078, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":165},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":185}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2079, 'default', 'created', 'App\\Models\\OrderDetail', 741, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":32,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2080, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":322},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":342}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2081, 'default', 'created', 'App\\Models\\OrderDetail', 742, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":7,\"sellprice\":13.8,\"quantity\":\"20.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2082, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":60}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2083, 'default', 'created', 'App\\Models\\OrderDetail', 743, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":120,\"product_id\":9,\"sellprice\":12,\"quantity\":\"19.00\"}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2084, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":19}}', '2022-05-26 17:03:13', '2022-05-26 17:03:13');
INSERT INTO `activity_log` VALUES (2085, 'default', 'created', 'App\\Models\\Purchase', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220526_v17__3_1653559425704\",\"subtotal\":4860,\"vat\":0,\"grandtotal\":4860}}', '2022-05-26 17:05:51', '2022-05-26 17:05:51');
INSERT INTO `activity_log` VALUES (2086, 'default', 'created', 'App\\Models\\PurchaseDetail', 142, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":27,\"product_id\":51,\"unitprice\":\"13.50\",\"quantity\":\"360.00\"}}', '2022-05-26 17:05:51', '2022-05-26 17:05:51');
INSERT INTO `activity_log` VALUES (2087, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":690},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":330}}', '2022-05-26 17:05:51', '2022-05-26 17:05:51');
INSERT INTO `activity_log` VALUES (2088, 'default', 'created', 'App\\Models\\Balance', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"57087.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"57087.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-27 09:21:40', '2022-05-27 09:21:40');
INSERT INTO `activity_log` VALUES (2089, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":330},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":690}}', '2022-05-27 02:51:10', '2022-05-27 02:51:10');
INSERT INTO `activity_log` VALUES (2090, 'default', 'deleted', 'App\\Models\\Purchase', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220526_v17__3_1653559425704\",\"subtotal\":4860,\"vat\":0,\"grandtotal\":4860}}', '2022-05-27 02:51:10', '2022-05-27 02:51:10');
INSERT INTO `activity_log` VALUES (2091, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":54},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":53}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2092, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":324},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":322}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2093, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":68}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2094, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":40}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2095, 'default', 'updated', 'App\\Models\\Balance', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"57087.00\",\"income\":\"148.00\",\"withdraw\":\"0.00\",\"balance\":\"57235.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"57087.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"57087.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2096, 'default', 'updated', 'App\\Models\\Balance', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"57087.00\",\"income\":\"296.00\",\"withdraw\":\"0.00\",\"balance\":\"57383.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"57087.00\",\"income\":\"148.00\",\"withdraw\":\"0.00\",\"balance\":\"57235.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2097, 'default', 'created', 'App\\Models\\OrderDetail', 744, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":33,\"sellprice\":23,\"quantity\":\"1.00\"}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2098, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":53},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":54}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2099, 'default', 'created', 'App\\Models\\OrderDetail', 745, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":32,\"sellprice\":14,\"quantity\":\"2.00\"}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2100, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":322},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":324}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2101, 'default', 'created', 'App\\Models\\OrderDetail', 746, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":4,\"sellprice\":14,\"quantity\":\"2.00\"}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2102, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":68},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":70}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2103, 'default', 'created', 'App\\Models\\OrderDetail', 747, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":116,\"product_id\":8,\"sellprice\":13.8,\"quantity\":\"5.00\"}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2104, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":165}}', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `activity_log` VALUES (2105, 'default', 'updated', 'App\\Models\\Brand', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"REDMI\",\"kh_name\":null,\"description\":null},\"old\":{\"name\":\"XiaoMe\",\"kh_name\":null,\"description\":null}}', '2022-05-27 12:59:35', '2022-05-27 12:59:35');
INSERT INTO `activity_log` VALUES (2106, 'default', 'created', 'App\\Models\\Product', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"555254924564\",\"en_name\":\"6A\",\"kh_name\":\"LCD REDMI\",\"description\":null,\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:02:45', '2022-05-27 13:02:45');
INSERT INTO `activity_log` VALUES (2107, 'default', 'created', 'App\\Models\\Product', 62, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"478248065370\",\"en_name\":\"A11\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:04:06', '2022-05-27 13:04:06');
INSERT INTO `activity_log` VALUES (2108, 'default', 'created', 'App\\Models\\Product', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"232976910064\",\"en_name\":\"A02S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:04:42', '2022-05-27 13:04:42');
INSERT INTO `activity_log` VALUES (2109, 'default', 'created', 'App\\Models\\Product', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"412014077396\",\"en_name\":\"A21S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:05:05', '2022-05-27 13:05:05');
INSERT INTO `activity_log` VALUES (2110, 'default', 'created', 'App\\Models\\Product', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"124142271060\",\"en_name\":\"J4P\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:05:32', '2022-05-27 13:05:32');
INSERT INTO `activity_log` VALUES (2111, 'default', 'created', 'App\\Models\\Product', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"122598239646\",\"en_name\":\"Y9 2019\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:06:34', '2022-05-27 13:06:34');
INSERT INTO `activity_log` VALUES (2112, 'default', 'created', 'App\\Models\\Product', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"244312071129\",\"en_name\":\"Y6P\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:07:12', '2022-05-27 13:07:12');
INSERT INTO `activity_log` VALUES (2113, 'default', 'created', 'App\\Models\\Product', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"302371121307\",\"en_name\":\"A10\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:07:32', '2022-05-27 13:07:32');
INSERT INTO `activity_log` VALUES (2114, 'default', 'created', 'App\\Models\\Product', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"989791238864\",\"en_name\":\"A12\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:07:48', '2022-05-27 13:07:48');
INSERT INTO `activity_log` VALUES (2115, 'default', 'created', 'App\\Models\\Product', 70, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"780385962419\",\"en_name\":\"A20S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:08:11', '2022-05-27 13:08:11');
INSERT INTO `activity_log` VALUES (2116, 'default', 'created', 'App\\Models\\Product', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"444525050465\",\"en_name\":\"A30\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:08:32', '2022-05-27 13:08:32');
INSERT INTO `activity_log` VALUES (2117, 'default', 'created', 'App\\Models\\Product', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"576587595348\",\"en_name\":\"NOVA 3I\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:09:05', '2022-05-27 13:09:05');
INSERT INTO `activity_log` VALUES (2118, 'default', 'created', 'App\\Models\\Product', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"679240813902\",\"en_name\":\"Y9 PRIME\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:09:58', '2022-05-27 13:09:58');
INSERT INTO `activity_log` VALUES (2119, 'default', 'created', 'App\\Models\\Purchase', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220527_v20__11_1653657063006\",\"subtotal\":3240,\"vat\":0,\"grandtotal\":3240}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2120, 'default', 'created', 'App\\Models\\PurchaseDetail', 143, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":61,\"unitprice\":\"9.00\",\"quantity\":\"30.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2121, 'default', 'created', 'App\\Models\\Stock', 99, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":61,\"alert\":\"0.00\",\"total\":30}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2122, 'default', 'created', 'App\\Models\\PurchaseDetail', 144, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":62,\"unitprice\":\"9.00\",\"quantity\":\"30.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2123, 'default', 'created', 'App\\Models\\Stock', 100, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":62,\"alert\":\"0.00\",\"total\":30}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2124, 'default', 'created', 'App\\Models\\PurchaseDetail', 145, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":63,\"unitprice\":\"9.00\",\"quantity\":\"30.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2125, 'default', 'created', 'App\\Models\\Stock', 101, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":63,\"alert\":\"0.00\",\"total\":30}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2126, 'default', 'created', 'App\\Models\\PurchaseDetail', 146, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":64,\"unitprice\":\"9.00\",\"quantity\":\"30.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2127, 'default', 'created', 'App\\Models\\Stock', 102, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":64,\"alert\":\"0.00\",\"total\":30}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2128, 'default', 'created', 'App\\Models\\PurchaseDetail', 147, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":65,\"unitprice\":\"9.00\",\"quantity\":\"50.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2129, 'default', 'created', 'App\\Models\\Stock', 103, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":65,\"alert\":\"0.00\",\"total\":50}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2130, 'default', 'created', 'App\\Models\\PurchaseDetail', 148, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":66,\"unitprice\":\"9.00\",\"quantity\":\"20.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2131, 'default', 'created', 'App\\Models\\Stock', 104, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":66,\"alert\":\"0.00\",\"total\":20}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2132, 'default', 'created', 'App\\Models\\PurchaseDetail', 149, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":67,\"unitprice\":\"9.00\",\"quantity\":\"20.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2133, 'default', 'created', 'App\\Models\\Stock', 105, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":67,\"alert\":\"0.00\",\"total\":20}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2134, 'default', 'created', 'App\\Models\\PurchaseDetail', 150, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":68,\"unitprice\":\"9.00\",\"quantity\":\"30.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2135, 'default', 'created', 'App\\Models\\Stock', 106, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":68,\"alert\":\"0.00\",\"total\":30}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2136, 'default', 'created', 'App\\Models\\PurchaseDetail', 151, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":69,\"unitprice\":\"9.00\",\"quantity\":\"30.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2137, 'default', 'created', 'App\\Models\\Stock', 107, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":69,\"alert\":\"0.00\",\"total\":30}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2138, 'default', 'created', 'App\\Models\\PurchaseDetail', 152, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":70,\"unitprice\":\"9.00\",\"quantity\":\"20.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2139, 'default', 'created', 'App\\Models\\Stock', 108, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":70,\"alert\":\"0.00\",\"total\":20}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2140, 'default', 'created', 'App\\Models\\PurchaseDetail', 153, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":71,\"unitprice\":\"9.00\",\"quantity\":\"30.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2141, 'default', 'created', 'App\\Models\\Stock', 109, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":71,\"alert\":\"0.00\",\"total\":30}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2142, 'default', 'created', 'App\\Models\\PurchaseDetail', 154, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":72,\"unitprice\":\"9.00\",\"quantity\":\"20.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2143, 'default', 'created', 'App\\Models\\Stock', 110, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":72,\"alert\":\"0.00\",\"total\":20}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2144, 'default', 'created', 'App\\Models\\PurchaseDetail', 155, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":28,\"product_id\":73,\"unitprice\":\"9.00\",\"quantity\":\"20.00\"}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2145, 'default', 'created', 'App\\Models\\Stock', 111, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":73,\"alert\":\"0.00\",\"total\":20}}', '2022-05-27 13:16:24', '2022-05-27 13:16:24');
INSERT INTO `activity_log` VALUES (2146, 'default', 'updated', 'App\\Models\\Product', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"679240813902\",\"en_name\":\"Y9 PRIME 2019\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10},\"old\":{\"category_id\":5,\"code\":\"679240813902\",\"en_name\":\"Y9 PRIME\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:17:12', '2022-05-27 13:17:12');
INSERT INTO `activity_log` VALUES (2147, 'default', 'updated', 'App\\Models\\Product', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"555254924564\",\"en_name\":\"6A B\",\"kh_name\":\"LCD REDMI\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":10},\"old\":{\"category_id\":5,\"code\":\"555254924564\",\"en_name\":\"6A\",\"kh_name\":\"LCD REDMI\",\"description\":null,\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-27 13:18:00', '2022-05-27 13:18:00');
INSERT INTO `activity_log` VALUES (2148, 'default', 'created', 'App\\Models\\Order', 121, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":9,\"user_id\":1,\"subtotal\":5170,\"vat\":0,\"discount\":0,\"grandtotal\":5170,\"kh_grandtotal\":null}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2149, 'default', 'updated', 'App\\Models\\Balance', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"57087.00\",\"income\":\"5466.00\",\"withdraw\":\"0.00\",\"balance\":\"62553.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"57087.00\",\"income\":\"296.00\",\"withdraw\":\"0.00\",\"balance\":\"57383.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2150, 'default', 'created', 'App\\Models\\OrderDetail', 748, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":17,\"sellprice\":80,\"quantity\":\"3.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2151, 'default', 'updated', 'App\\Models\\Stock', 46, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":1},\"old\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":4}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2152, 'default', 'created', 'App\\Models\\OrderDetail', 749, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":44,\"sellprice\":59,\"quantity\":\"1.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2153, 'default', 'updated', 'App\\Models\\Stock', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":44,\"alert\":\"0.00\",\"total\":1}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2154, 'default', 'created', 'App\\Models\\OrderDetail', 750, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":34,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2155, 'default', 'updated', 'App\\Models\\Stock', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":28},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":48}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2156, 'default', 'created', 'App\\Models\\OrderDetail', 751, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":36,\"sellprice\":16.5,\"quantity\":\"20.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2157, 'default', 'updated', 'App\\Models\\Stock', 89, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":60}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2158, 'default', 'created', 'App\\Models\\OrderDetail', 752, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":35,\"sellprice\":13.5,\"quantity\":\"30.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2159, 'default', 'updated', 'App\\Models\\Stock', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":18},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":48}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2160, 'default', 'created', 'App\\Models\\OrderDetail', 753, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":23,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2161, 'default', 'updated', 'App\\Models\\Stock', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":62},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":72}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2162, 'default', 'created', 'App\\Models\\OrderDetail', 754, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":22,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2163, 'default', 'updated', 'App\\Models\\Stock', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":67},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":77}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2164, 'default', 'created', 'App\\Models\\OrderDetail', 755, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2165, 'default', 'updated', 'App\\Models\\Stock', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":150},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":170}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2166, 'default', 'created', 'App\\Models\\OrderDetail', 756, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":28,\"sellprice\":18,\"quantity\":\"20.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2167, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":60}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2168, 'default', 'created', 'App\\Models\\OrderDetail', 757, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":7,\"sellprice\":13.8,\"quantity\":\"45.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2169, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":45}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2170, 'default', 'created', 'App\\Models\\OrderDetail', 758, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"30.00\"}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2171, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":6},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":36}}', '2022-05-27 13:22:38', '2022-05-27 13:22:38');
INSERT INTO `activity_log` VALUES (2172, 'default', 'created', 'App\\Models\\OrderDetail', 759, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":1,\"sellprice\":12.5,\"quantity\":\"50.00\"}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2173, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":76},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":126}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2174, 'default', 'created', 'App\\Models\\OrderDetail', 760, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"50.00\"}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2175, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":290},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":340}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2176, 'default', 'created', 'App\\Models\\OrderDetail', 761, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":51,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2177, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":310},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":330}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2178, 'default', 'created', 'App\\Models\\OrderDetail', 762, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":121,\"product_id\":6,\"sellprice\":16,\"quantity\":\"20.00\"}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2179, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":96},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":116}}', '2022-05-27 13:22:39', '2022-05-27 13:22:39');
INSERT INTO `activity_log` VALUES (2180, 'default', 'created', 'App\\Models\\Order', 122, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":9,\"user_id\":1,\"subtotal\":1696.5,\"vat\":0,\"discount\":0,\"grandtotal\":1696.5,\"kh_grandtotal\":null}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2181, 'default', 'updated', 'App\\Models\\Balance', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"57087.00\",\"income\":\"7162.50\",\"withdraw\":\"0.00\",\"balance\":\"64249.50\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"57087.00\",\"income\":\"5466.00\",\"withdraw\":\"0.00\",\"balance\":\"62553.00\",\"balance_date\":\"2022-05-27\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2182, 'default', 'created', 'App\\Models\\OrderDetail', 763, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":122,\"product_id\":8,\"sellprice\":13.8,\"quantity\":\"30.00\"}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2183, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":160}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2184, 'default', 'created', 'App\\Models\\OrderDetail', 764, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":122,\"product_id\":58,\"sellprice\":17.5,\"quantity\":\"5.00\"}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2185, 'default', 'updated', 'App\\Models\\Stock', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":58,\"alert\":\"0.00\",\"total\":5}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2186, 'default', 'created', 'App\\Models\\OrderDetail', 765, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":122,\"product_id\":33,\"sellprice\":23,\"quantity\":\"10.00\"}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2187, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":43},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":53}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2188, 'default', 'created', 'App\\Models\\OrderDetail', 766, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":122,\"product_id\":38,\"sellprice\":15.5,\"quantity\":\"30.00\"}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2189, 'default', 'updated', 'App\\Models\\Stock', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":16},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":46}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2190, 'default', 'created', 'App\\Models\\OrderDetail', 767, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":122,\"product_id\":24,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2191, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":146},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":166}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2192, 'default', 'created', 'App\\Models\\OrderDetail', 768, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":122,\"product_id\":41,\"sellprice\":19,\"quantity\":\"10.00\"}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2193, 'default', 'updated', 'App\\Models\\Stock', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":31},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":41}}', '2022-05-27 13:23:43', '2022-05-27 13:23:43');
INSERT INTO `activity_log` VALUES (2194, 'default', 'created', 'App\\Models\\Balance', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"64249.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"64249.50\",\"balance_date\":\"2022-05-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-28 06:13:27', '2022-05-28 06:13:27');
INSERT INTO `activity_log` VALUES (2195, 'default', 'created', 'App\\Models\\Order', 123, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":10,\"user_id\":1,\"subtotal\":526.5,\"vat\":0,\"discount\":0,\"grandtotal\":526.5,\"kh_grandtotal\":null}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2196, 'default', 'updated', 'App\\Models\\Balance', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"64249.50\",\"income\":\"526.50\",\"withdraw\":\"0.00\",\"balance\":\"64776.00\",\"balance_date\":\"2022-05-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"64249.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"64249.50\",\"balance_date\":\"2022-05-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2197, 'default', 'created', 'App\\Models\\OrderDetail', 769, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":123,\"product_id\":33,\"sellprice\":23,\"quantity\":\"3.00\"}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2198, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":43}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2199, 'default', 'created', 'App\\Models\\OrderDetail', 770, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":123,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2200, 'default', 'updated', 'App\\Models\\Stock', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":145},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":150}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2201, 'default', 'created', 'App\\Models\\OrderDetail', 771, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":123,\"product_id\":4,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2202, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":58},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":68}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2203, 'default', 'created', 'App\\Models\\OrderDetail', 772, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":123,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"20.00\"}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2204, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":270},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":290}}', '2022-05-28 06:15:01', '2022-05-28 06:15:01');
INSERT INTO `activity_log` VALUES (2205, 'default', 'created', 'App\\Models\\Order', 124, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":5934,\"vat\":0,\"discount\":0,\"grandtotal\":5934,\"kh_grandtotal\":null}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2206, 'default', 'updated', 'App\\Models\\Balance', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"64249.50\",\"income\":\"6460.50\",\"withdraw\":\"0.00\",\"balance\":\"70710.00\",\"balance_date\":\"2022-05-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"64249.50\",\"income\":\"526.50\",\"withdraw\":\"0.00\",\"balance\":\"64776.00\",\"balance_date\":\"2022-05-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2207, 'default', 'created', 'App\\Models\\OrderDetail', 773, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":53,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2208, 'default', 'updated', 'App\\Models\\Stock', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":53,\"alert\":\"0.00\",\"total\":30}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2209, 'default', 'created', 'App\\Models\\OrderDetail', 774, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":28,\"sellprice\":18,\"quantity\":\"30.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2210, 'default', 'updated', 'App\\Models\\Stock', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":40}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2211, 'default', 'created', 'App\\Models\\OrderDetail', 775, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":32,\"sellprice\":14,\"quantity\":\"30.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2212, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":292},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":322}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2213, 'default', 'created', 'App\\Models\\OrderDetail', 776, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":1,\"sellprice\":12.5,\"quantity\":\"40.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2214, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":36},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":76}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2215, 'default', 'created', 'App\\Models\\OrderDetail', 777, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":51,\"sellprice\":15.5,\"quantity\":\"50.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2216, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":260},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":310}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2217, 'default', 'created', 'App\\Models\\OrderDetail', 778, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":5,\"sellprice\":15,\"quantity\":\"20.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2218, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":6},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":26}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2219, 'default', 'created', 'App\\Models\\OrderDetail', 779, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":60,\"sellprice\":20,\"quantity\":\"3.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2220, 'default', 'updated', 'App\\Models\\Stock', 98, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":60,\"alert\":\"0.00\",\"total\":17},\"old\":{\"warehouse_id\":1,\"product_id\":60,\"alert\":\"0.00\",\"total\":20}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2221, 'default', 'created', 'App\\Models\\OrderDetail', 780, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":59,\"sellprice\":17.5,\"quantity\":\"20.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2222, 'default', 'updated', 'App\\Models\\Stock', 97, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":59,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":59,\"alert\":\"0.00\",\"total\":100}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2223, 'default', 'created', 'App\\Models\\OrderDetail', 781, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"30.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2224, 'default', 'updated', 'App\\Models\\Stock', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":115},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":145}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2225, 'default', 'created', 'App\\Models\\OrderDetail', 782, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":12,\"sellprice\":21,\"quantity\":\"49.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2226, 'default', 'updated', 'App\\Models\\Stock', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":89}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2227, 'default', 'created', 'App\\Models\\OrderDetail', 783, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"40.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2228, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":230},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":270}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2229, 'default', 'created', 'App\\Models\\OrderDetail', 784, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":124,\"product_id\":24,\"sellprice\":15.5,\"quantity\":\"50.00\"}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2230, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":96},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":146}}', '2022-05-28 06:24:41', '2022-05-28 06:24:41');
INSERT INTO `activity_log` VALUES (2231, 'default', 'updated', 'App\\Models\\Product', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"555254924564\",\"en_name\":\"6A B\",\"kh_name\":\"LCD REDMI\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":11},\"old\":{\"category_id\":5,\"code\":\"555254924564\",\"en_name\":\"6A B\",\"kh_name\":\"LCD REDMI\",\"description\":\"null\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:37:28', '2022-05-28 06:37:28');
INSERT INTO `activity_log` VALUES (2232, 'default', 'updated', 'App\\Models\\Product', 62, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"478248065370\",\"en_name\":\"A11\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":18},\"old\":{\"category_id\":5,\"code\":\"478248065370\",\"en_name\":\"A11\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:37:46', '2022-05-28 06:37:46');
INSERT INTO `activity_log` VALUES (2233, 'default', 'updated', 'App\\Models\\Product', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"232976910064\",\"en_name\":\"A02S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":5,\"code\":\"232976910064\",\"en_name\":\"A02S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:38:05', '2022-05-28 06:38:05');
INSERT INTO `activity_log` VALUES (2234, 'default', 'updated', 'App\\Models\\Product', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"412014077396\",\"en_name\":\"A21S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":5,\"code\":\"412014077396\",\"en_name\":\"A21S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:38:18', '2022-05-28 06:38:18');
INSERT INTO `activity_log` VALUES (2235, 'default', 'updated', 'App\\Models\\Product', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"124142271060\",\"en_name\":\"J4P\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":14},\"old\":{\"category_id\":5,\"code\":\"124142271060\",\"en_name\":\"J4P\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:38:32', '2022-05-28 06:38:32');
INSERT INTO `activity_log` VALUES (2236, 'default', 'updated', 'App\\Models\\Product', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"122598239646\",\"en_name\":\"Y9 2019\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":24},\"old\":{\"category_id\":5,\"code\":\"122598239646\",\"en_name\":\"Y9 2019\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:38:49', '2022-05-28 06:38:49');
INSERT INTO `activity_log` VALUES (2237, 'default', 'updated', 'App\\Models\\Product', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"244312071129\",\"en_name\":\"Y6P\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":5,\"code\":\"244312071129\",\"en_name\":\"Y6P\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:39:01', '2022-05-28 06:39:01');
INSERT INTO `activity_log` VALUES (2238, 'default', 'updated', 'App\\Models\\Product', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"302371121307\",\"en_name\":\"A10\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13},\"old\":{\"category_id\":5,\"code\":\"302371121307\",\"en_name\":\"A10\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:39:17', '2022-05-28 06:39:17');
INSERT INTO `activity_log` VALUES (2239, 'default', 'updated', 'App\\Models\\Product', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"989791238864\",\"en_name\":\"A12\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16},\"old\":{\"category_id\":5,\"code\":\"989791238864\",\"en_name\":\"A12\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:39:29', '2022-05-28 06:39:29');
INSERT INTO `activity_log` VALUES (2240, 'default', 'updated', 'App\\Models\\Product', 70, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"780385962419\",\"en_name\":\"A20S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":16.5},\"old\":{\"category_id\":5,\"code\":\"780385962419\",\"en_name\":\"A20S\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:39:42', '2022-05-28 06:39:42');
INSERT INTO `activity_log` VALUES (2241, 'default', 'updated', 'App\\Models\\Product', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"444525050465\",\"en_name\":\"A30\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17.5},\"old\":{\"category_id\":5,\"code\":\"444525050465\",\"en_name\":\"A30\",\"kh_name\":\"LCD SAMSUNG\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:39:54', '2022-05-28 06:39:54');
INSERT INTO `activity_log` VALUES (2242, 'default', 'updated', 'App\\Models\\Product', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"576587595348\",\"en_name\":\"NOVA 3I\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":17},\"old\":{\"category_id\":5,\"code\":\"576587595348\",\"en_name\":\"NOVA 3I\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:40:12', '2022-05-28 06:40:12');
INSERT INTO `activity_log` VALUES (2243, 'default', 'updated', 'App\\Models\\Product', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":5,\"code\":\"679240813902\",\"en_name\":\"Y9 PRIME 2019\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":25},\"old\":{\"category_id\":5,\"code\":\"679240813902\",\"en_name\":\"Y9 PRIME 2019\",\"kh_name\":\"LCD HUAWEI\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":10}}', '2022-05-28 06:40:29', '2022-05-28 06:40:29');
INSERT INTO `activity_log` VALUES (2244, 'default', 'created', 'App\\Models\\Order', 125, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":9,\"user_id\":1,\"subtotal\":435,\"vat\":0,\"discount\":0,\"grandtotal\":435,\"kh_grandtotal\":null}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2245, 'default', 'updated', 'App\\Models\\Balance', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"64249.50\",\"income\":\"6895.50\",\"withdraw\":\"0.00\",\"balance\":\"71145.00\",\"balance_date\":\"2022-05-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"64249.50\",\"income\":\"6460.50\",\"withdraw\":\"0.00\",\"balance\":\"70710.00\",\"balance_date\":\"2022-05-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2246, 'default', 'created', 'App\\Models\\OrderDetail', 785, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":125,\"product_id\":68,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2247, 'default', 'updated', 'App\\Models\\Stock', 106, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":68,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":68,\"alert\":\"0.00\",\"total\":30}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2248, 'default', 'created', 'App\\Models\\OrderDetail', 786, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":125,\"product_id\":43,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2249, 'default', 'updated', 'App\\Models\\Stock', 53, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":43,\"alert\":\"0.00\",\"total\":53},\"old\":{\"warehouse_id\":1,\"product_id\":43,\"alert\":\"0.00\",\"total\":63}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2250, 'default', 'created', 'App\\Models\\OrderDetail', 787, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":125,\"product_id\":69,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2251, 'default', 'updated', 'App\\Models\\Stock', 107, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":69,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":69,\"alert\":\"0.00\",\"total\":30}}', '2022-05-28 06:41:47', '2022-05-28 06:41:47');
INSERT INTO `activity_log` VALUES (2252, 'default', 'created', 'App\\Models\\Balance', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"71145.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"71145.00\",\"balance_date\":\"2022-05-29\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-29 06:13:44', '2022-05-29 06:13:44');
INSERT INTO `activity_log` VALUES (2253, 'default', 'created', 'App\\Models\\Order', 126, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":13,\"user_id\":1,\"subtotal\":320,\"vat\":0,\"discount\":0,\"grandtotal\":320,\"kh_grandtotal\":null}}', '2022-05-29 06:14:16', '2022-05-29 06:14:16');
INSERT INTO `activity_log` VALUES (2254, 'default', 'updated', 'App\\Models\\Balance', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"71145.00\",\"income\":\"320.00\",\"withdraw\":\"0.00\",\"balance\":\"71465.00\",\"balance_date\":\"2022-05-29\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"71145.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"71145.00\",\"balance_date\":\"2022-05-29\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-29 06:14:16', '2022-05-29 06:14:16');
INSERT INTO `activity_log` VALUES (2255, 'default', 'created', 'App\\Models\\OrderDetail', 788, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":126,\"product_id\":4,\"sellprice\":14,\"quantity\":\"5.00\"}}', '2022-05-29 06:14:16', '2022-05-29 06:14:16');
INSERT INTO `activity_log` VALUES (2256, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":53},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":58}}', '2022-05-29 06:14:16', '2022-05-29 06:14:16');
INSERT INTO `activity_log` VALUES (2257, 'default', 'created', 'App\\Models\\OrderDetail', 789, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":126,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"20.00\"}}', '2022-05-29 06:14:16', '2022-05-29 06:14:16');
INSERT INTO `activity_log` VALUES (2258, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":210},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":230}}', '2022-05-29 06:14:16', '2022-05-29 06:14:16');
INSERT INTO `activity_log` VALUES (2259, 'default', 'created', 'App\\Models\\Balance', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"71465.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"71465.00\",\"balance_date\":\"2022-05-30\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-30 01:28:05', '2022-05-30 01:28:05');
INSERT INTO `activity_log` VALUES (2260, 'default', 'created', 'App\\Models\\Order', 127, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":11,\"user_id\":1,\"subtotal\":1687.5,\"vat\":0,\"discount\":0,\"grandtotal\":1687.5,\"kh_grandtotal\":null}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2261, 'default', 'updated', 'App\\Models\\Balance', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"71465.00\",\"income\":\"1687.50\",\"withdraw\":\"0.00\",\"balance\":\"73152.50\",\"balance_date\":\"2022-05-30\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"71465.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"71465.00\",\"balance_date\":\"2022-05-30\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2262, 'default', 'created', 'App\\Models\\OrderDetail', 790, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":22,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2263, 'default', 'updated', 'App\\Models\\Stock', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":47},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":67}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2264, 'default', 'created', 'App\\Models\\OrderDetail', 791, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":23,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2265, 'default', 'updated', 'App\\Models\\Stock', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":52},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":62}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2266, 'default', 'created', 'App\\Models\\OrderDetail', 792, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":65,\"sellprice\":14,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2267, 'default', 'updated', 'App\\Models\\Stock', 103, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":65,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":65,\"alert\":\"0.00\",\"total\":50}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2268, 'default', 'created', 'App\\Models\\OrderDetail', 793, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":71,\"sellprice\":17.5,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2269, 'default', 'updated', 'App\\Models\\Stock', 109, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":71,\"alert\":\"0.00\",\"total\":25},\"old\":{\"warehouse_id\":1,\"product_id\":71,\"alert\":\"0.00\",\"total\":30}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2270, 'default', 'created', 'App\\Models\\OrderDetail', 794, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":64,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2271, 'default', 'updated', 'App\\Models\\Stock', 102, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":64,\"alert\":\"0.00\",\"total\":25},\"old\":{\"warehouse_id\":1,\"product_id\":64,\"alert\":\"0.00\",\"total\":30}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2272, 'default', 'created', 'App\\Models\\OrderDetail', 795, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":62,\"sellprice\":18,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2273, 'default', 'updated', 'App\\Models\\Stock', 100, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":62,\"alert\":\"0.00\",\"total\":25},\"old\":{\"warehouse_id\":1,\"product_id\":62,\"alert\":\"0.00\",\"total\":30}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2274, 'default', 'created', 'App\\Models\\OrderDetail', 796, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":63,\"sellprice\":16.5,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2275, 'default', 'updated', 'App\\Models\\Stock', 101, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":63,\"alert\":\"0.00\",\"total\":25},\"old\":{\"warehouse_id\":1,\"product_id\":63,\"alert\":\"0.00\",\"total\":30}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2276, 'default', 'created', 'App\\Models\\OrderDetail', 797, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":69,\"sellprice\":16,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2277, 'default', 'updated', 'App\\Models\\Stock', 107, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":69,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":69,\"alert\":\"0.00\",\"total\":20}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2278, 'default', 'created', 'App\\Models\\OrderDetail', 798, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":68,\"sellprice\":13,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2279, 'default', 'updated', 'App\\Models\\Stock', 106, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":68,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":68,\"alert\":\"0.00\",\"total\":20}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2280, 'default', 'created', 'App\\Models\\OrderDetail', 799, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":67,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2281, 'default', 'updated', 'App\\Models\\Stock', 105, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":67,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":67,\"alert\":\"0.00\",\"total\":20}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2282, 'default', 'created', 'App\\Models\\OrderDetail', 800, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":13,\"sellprice\":18.5,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2283, 'default', 'updated', 'App\\Models\\Stock', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":39},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":44}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2284, 'default', 'created', 'App\\Models\\OrderDetail', 801, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":45,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2285, 'default', 'updated', 'App\\Models\\Stock', 58, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":25},\"old\":{\"warehouse_id\":1,\"product_id\":45,\"alert\":\"0.00\",\"total\":30}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2286, 'default', 'created', 'App\\Models\\OrderDetail', 802, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":33,\"sellprice\":23,\"quantity\":\"5.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2287, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":40}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2288, 'default', 'created', 'App\\Models\\OrderDetail', 803, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":51,\"sellprice\":15.5,\"quantity\":\"20.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2289, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":240},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":260}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2290, 'default', 'created', 'App\\Models\\OrderDetail', 804, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":127,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2291, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":60}}', '2022-05-30 01:30:32', '2022-05-30 01:30:32');
INSERT INTO `activity_log` VALUES (2292, 'default', 'created', 'App\\Models\\Order', 128, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":2918,\"vat\":0,\"discount\":0,\"grandtotal\":2918,\"kh_grandtotal\":null}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2293, 'default', 'updated', 'App\\Models\\Balance', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"71465.00\",\"income\":\"4605.50\",\"withdraw\":\"0.00\",\"balance\":\"76070.50\",\"balance_date\":\"2022-05-30\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"71465.00\",\"income\":\"1687.50\",\"withdraw\":\"0.00\",\"balance\":\"73152.50\",\"balance_date\":\"2022-05-30\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2294, 'default', 'created', 'App\\Models\\OrderDetail', 805, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":26,\"sellprice\":15.5,\"quantity\":\"6.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2295, 'default', 'updated', 'App\\Models\\Stock', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":26,\"alert\":\"0.00\",\"total\":6}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2296, 'default', 'created', 'App\\Models\\OrderDetail', 806, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2297, 'default', 'updated', 'App\\Models\\Stock', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":50}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2298, 'default', 'created', 'App\\Models\\OrderDetail', 807, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":6,\"sellprice\":16,\"quantity\":\"30.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2299, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":66},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":96}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2300, 'default', 'created', 'App\\Models\\OrderDetail', 808, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":33,\"sellprice\":23,\"quantity\":\"20.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2301, 'default', 'updated', 'App\\Models\\Stock', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":35}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2302, 'default', 'created', 'App\\Models\\OrderDetail', 809, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":70,\"sellprice\":16.5,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2303, 'default', 'updated', 'App\\Models\\Stock', 108, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":70,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":70,\"alert\":\"0.00\",\"total\":20}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2304, 'default', 'created', 'App\\Models\\OrderDetail', 810, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":71,\"sellprice\":17.5,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2305, 'default', 'updated', 'App\\Models\\Stock', 109, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":71,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":71,\"alert\":\"0.00\",\"total\":25}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2306, 'default', 'created', 'App\\Models\\OrderDetail', 811, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":68,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2307, 'default', 'updated', 'App\\Models\\Stock', 106, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":68,\"alert\":\"0.00\",\"total\":5},\"old\":{\"warehouse_id\":1,\"product_id\":68,\"alert\":\"0.00\",\"total\":15}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2308, 'default', 'created', 'App\\Models\\OrderDetail', 812, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":65,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2309, 'default', 'updated', 'App\\Models\\Stock', 103, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":65,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":65,\"alert\":\"0.00\",\"total\":45}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2310, 'default', 'created', 'App\\Models\\OrderDetail', 813, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":63,\"sellprice\":16.5,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2311, 'default', 'updated', 'App\\Models\\Stock', 101, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":63,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":63,\"alert\":\"0.00\",\"total\":25}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2312, 'default', 'created', 'App\\Models\\OrderDetail', 814, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":62,\"sellprice\":18,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2313, 'default', 'updated', 'App\\Models\\Stock', 100, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":62,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":62,\"alert\":\"0.00\",\"total\":25}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2314, 'default', 'created', 'App\\Models\\OrderDetail', 815, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":64,\"sellprice\":17,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2315, 'default', 'updated', 'App\\Models\\Stock', 102, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":64,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":64,\"alert\":\"0.00\",\"total\":25}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2316, 'default', 'created', 'App\\Models\\OrderDetail', 816, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":72,\"sellprice\":17,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2317, 'default', 'updated', 'App\\Models\\Stock', 110, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":72,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":72,\"alert\":\"0.00\",\"total\":20}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2318, 'default', 'created', 'App\\Models\\OrderDetail', 817, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":73,\"sellprice\":25,\"quantity\":\"5.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2319, 'default', 'updated', 'App\\Models\\Stock', 111, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":73,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":73,\"alert\":\"0.00\",\"total\":20}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2320, 'default', 'created', 'App\\Models\\OrderDetail', 818, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":67,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2321, 'default', 'updated', 'App\\Models\\Stock', 105, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":67,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":67,\"alert\":\"0.00\",\"total\":15}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2322, 'default', 'created', 'App\\Models\\OrderDetail', 819, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":128,\"product_id\":69,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2323, 'default', 'updated', 'App\\Models\\Stock', 107, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":69,\"alert\":\"0.00\",\"total\":5},\"old\":{\"warehouse_id\":1,\"product_id\":69,\"alert\":\"0.00\",\"total\":15}}', '2022-05-30 01:39:29', '2022-05-30 01:39:29');
INSERT INTO `activity_log` VALUES (2324, 'default', 'created', 'App\\Models\\Order', 129, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":11,\"user_id\":1,\"subtotal\":1495,\"vat\":0,\"discount\":0,\"grandtotal\":1495,\"kh_grandtotal\":null}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2325, 'default', 'updated', 'App\\Models\\Balance', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"71465.00\",\"income\":\"6100.50\",\"withdraw\":\"0.00\",\"balance\":\"77565.50\",\"balance_date\":\"2022-05-30\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"71465.00\",\"income\":\"4605.50\",\"withdraw\":\"0.00\",\"balance\":\"76070.50\",\"balance_date\":\"2022-05-30\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2326, 'default', 'created', 'App\\Models\\OrderDetail', 820, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":129,\"product_id\":24,\"sellprice\":15.5,\"quantity\":\"10.00\"}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2327, 'default', 'updated', 'App\\Models\\Stock', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":86},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":96}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2328, 'default', 'created', 'App\\Models\\OrderDetail', 821, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":129,\"product_id\":5,\"sellprice\":15,\"quantity\":\"6.00\"}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2329, 'default', 'updated', 'App\\Models\\Stock', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":6}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2330, 'default', 'created', 'App\\Models\\OrderDetail', 822, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":129,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"100.00\"}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2331, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":210}}', '2022-05-30 09:13:44', '2022-05-30 09:13:44');
INSERT INTO `activity_log` VALUES (2332, 'default', 'created', 'App\\Models\\Balance', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"77565.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"77565.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-31 02:46:51', '2022-05-31 02:46:51');
INSERT INTO `activity_log` VALUES (2333, 'default', 'created', 'App\\Models\\Order', 130, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":772,\"vat\":0,\"discount\":0,\"grandtotal\":772,\"kh_grandtotal\":null}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2334, 'default', 'updated', 'App\\Models\\Balance', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"77565.50\",\"income\":\"772.00\",\"withdraw\":\"0.00\",\"balance\":\"78337.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"77565.50\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"77565.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2335, 'default', 'created', 'App\\Models\\OrderDetail', 823, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":130,\"product_id\":4,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2336, 'default', 'updated', 'App\\Models\\Stock', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":48},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":53}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2337, 'default', 'created', 'App\\Models\\OrderDetail', 824, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":130,\"product_id\":7,\"sellprice\":13.3,\"quantity\":\"10.00\"}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2338, 'default', 'updated', 'App\\Models\\Stock', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":-10},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":0}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2339, 'default', 'created', 'App\\Models\\OrderDetail', 825, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":130,\"product_id\":8,\"sellprice\":13.3,\"quantity\":\"5.00\"}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2340, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":125},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":130}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2341, 'default', 'created', 'App\\Models\\OrderDetail', 826, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":130,\"product_id\":32,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2342, 'default', 'updated', 'App\\Models\\Stock', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":282},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":292}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2343, 'default', 'created', 'App\\Models\\OrderDetail', 827, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":130,\"product_id\":1,\"sellprice\":12,\"quantity\":\"10.00\"}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2344, 'default', 'updated', 'App\\Models\\Stock', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":26},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":36}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2345, 'default', 'created', 'App\\Models\\OrderDetail', 828, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":130,\"product_id\":3,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2346, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":110}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2347, 'default', 'created', 'App\\Models\\OrderDetail', 829, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":130,\"product_id\":9,\"sellprice\":12,\"quantity\":\"10.00\"}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2348, 'default', 'updated', 'App\\Models\\Stock', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":-10},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":0}}', '2022-05-31 03:32:51', '2022-05-31 03:32:51');
INSERT INTO `activity_log` VALUES (2349, 'default', 'created', 'App\\Models\\Order', 131, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":830,\"vat\":0,\"discount\":0,\"grandtotal\":830,\"kh_grandtotal\":null}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2350, 'default', 'updated', 'App\\Models\\Balance', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"77565.50\",\"income\":\"1602.00\",\"withdraw\":\"0.00\",\"balance\":\"79167.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"77565.50\",\"income\":\"772.00\",\"withdraw\":\"0.00\",\"balance\":\"78337.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2351, 'default', 'created', 'App\\Models\\OrderDetail', 830, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":131,\"product_id\":60,\"sellprice\":20,\"quantity\":\"5.00\"}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2352, 'default', 'updated', 'App\\Models\\Stock', 98, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":60,\"alert\":\"0.00\",\"total\":12},\"old\":{\"warehouse_id\":1,\"product_id\":60,\"alert\":\"0.00\",\"total\":17}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2353, 'default', 'created', 'App\\Models\\OrderDetail', 831, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":131,\"product_id\":11,\"sellprice\":20.5,\"quantity\":\"10.00\"}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2354, 'default', 'updated', 'App\\Models\\Stock', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":25},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":35}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2355, 'default', 'created', 'App\\Models\\OrderDetail', 832, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":131,\"product_id\":51,\"sellprice\":15.5,\"quantity\":\"10.00\"}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2356, 'default', 'updated', 'App\\Models\\Stock', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":230},\"old\":{\"warehouse_id\":1,\"product_id\":51,\"alert\":\"0.00\",\"total\":240}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2357, 'default', 'created', 'App\\Models\\OrderDetail', 833, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":131,\"product_id\":12,\"sellprice\":21,\"quantity\":\"10.00\"}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2358, 'default', 'updated', 'App\\Models\\Stock', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":40}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2359, 'default', 'created', 'App\\Models\\OrderDetail', 834, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":131,\"product_id\":6,\"sellprice\":16,\"quantity\":\"10.00\"}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2360, 'default', 'updated', 'App\\Models\\Stock', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":56},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":66}}', '2022-05-31 03:34:42', '2022-05-31 03:34:42');
INSERT INTO `activity_log` VALUES (2361, 'default', 'created', 'App\\Models\\Order', 132, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":1,\"user_id\":1,\"subtotal\":138,\"vat\":0,\"discount\":0,\"grandtotal\":138,\"kh_grandtotal\":null}}', '2022-05-31 03:39:14', '2022-05-31 03:39:14');
INSERT INTO `activity_log` VALUES (2362, 'default', 'updated', 'App\\Models\\Balance', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"77565.50\",\"income\":\"1740.00\",\"withdraw\":\"0.00\",\"balance\":\"79305.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"77565.50\",\"income\":\"1602.00\",\"withdraw\":\"0.00\",\"balance\":\"79167.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-31 03:39:14', '2022-05-31 03:39:14');
INSERT INTO `activity_log` VALUES (2363, 'default', 'created', 'App\\Models\\OrderDetail', 835, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":132,\"product_id\":8,\"sellprice\":13.8,\"quantity\":\"10.00\"}}', '2022-05-31 03:39:14', '2022-05-31 03:39:14');
INSERT INTO `activity_log` VALUES (2364, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":115},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":125}}', '2022-05-31 03:39:14', '2022-05-31 03:39:14');
INSERT INTO `activity_log` VALUES (2365, 'default', 'created', 'App\\Models\\Order', 133, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":9,\"user_id\":1,\"subtotal\":1145,\"vat\":0,\"discount\":0,\"grandtotal\":1145,\"kh_grandtotal\":null}}', '2022-05-31 07:16:19', '2022-05-31 07:16:19');
INSERT INTO `activity_log` VALUES (2366, 'default', 'updated', 'App\\Models\\Balance', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"77565.50\",\"income\":\"2885.00\",\"withdraw\":\"0.00\",\"balance\":\"80450.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"77565.50\",\"income\":\"1740.00\",\"withdraw\":\"0.00\",\"balance\":\"79305.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-31 07:16:19', '2022-05-31 07:16:19');
INSERT INTO `activity_log` VALUES (2367, 'default', 'created', 'App\\Models\\OrderDetail', 836, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":133,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-05-31 07:16:19', '2022-05-31 07:16:19');
INSERT INTO `activity_log` VALUES (2368, 'default', 'updated', 'App\\Models\\Stock', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":-20},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":0}}', '2022-05-31 07:16:19', '2022-05-31 07:16:19');
INSERT INTO `activity_log` VALUES (2369, 'default', 'created', 'App\\Models\\OrderDetail', 837, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":133,\"product_id\":3,\"sellprice\":12.5,\"quantity\":\"70.00\"}}', '2022-05-31 07:16:19', '2022-05-31 07:16:19');
INSERT INTO `activity_log` VALUES (2370, 'default', 'updated', 'App\\Models\\Stock', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":100}}', '2022-05-31 07:16:19', '2022-05-31 07:16:19');
INSERT INTO `activity_log` VALUES (2371, 'default', 'updated', 'App\\Models\\Balance', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"77565.50\",\"income\":\"-2747.00\",\"withdraw\":\"0.00\",\"balance\":\"74818.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"77565.50\",\"income\":\"2885.00\",\"withdraw\":\"0.00\",\"balance\":\"80450.50\",\"balance_date\":\"2022-05-31\",\"warehouse_id\":1,\"user_id\":1}}', '2022-05-31 00:36:22', '2022-05-31 00:36:22');
INSERT INTO `activity_log` VALUES (2372, 'default', 'updated', 'App\\Models\\Stock', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":125},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":115}}', '2022-05-31 00:36:22', '2022-05-31 00:36:22');
INSERT INTO `activity_log` VALUES (2373, 'default', 'deleted', 'App\\Models\\Order', 132, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":1,\"user_id\":1,\"subtotal\":138,\"vat\":0,\"discount\":0,\"grandtotal\":138,\"kh_grandtotal\":null}}', '2022-05-31 00:36:22', '2022-05-31 00:36:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of balances
-- ----------------------------
INSERT INTO `balances` VALUES (2, 0.00, 0.00, 0.00, 1.00, '2022-04-26', 1, 1, '2022-04-26 01:49:06', '2022-04-26 01:49:06');
INSERT INTO `balances` VALUES (16, 1.00, 0.00, 0.00, 1.00, '2022-05-14', 1, 1, '2022-05-14 05:29:38', '2022-05-14 05:29:38');
INSERT INTO `balances` VALUES (17, 1.00, 8156.50, 0.00, 8157.50, '2022-05-15', 1, 1, '2022-05-15 13:49:07', '2022-05-15 15:02:42');
INSERT INTO `balances` VALUES (18, 8157.50, 3798.50, 0.00, 11956.00, '2022-05-16', 1, 1, '2022-05-16 03:16:12', '2022-05-16 08:27:13');
INSERT INTO `balances` VALUES (19, 11956.00, 5289.00, 0.00, 17245.00, '2022-05-17', 1, 1, '2022-05-17 04:01:32', '2022-05-17 11:30:26');
INSERT INTO `balances` VALUES (20, 17245.00, 9144.00, 0.00, 26389.00, '2022-05-18', 1, 1, '2022-05-18 07:04:38', '2022-05-18 11:29:39');
INSERT INTO `balances` VALUES (21, 26389.00, 5896.50, 0.00, 32285.50, '2022-05-20', 1, 1, '2022-05-20 07:45:42', '2022-05-20 08:50:21');
INSERT INTO `balances` VALUES (22, 32285.50, 0.00, 0.00, 32285.50, '2022-05-21', 1, 1, '2022-05-21 08:48:25', '2022-05-21 08:48:25');
INSERT INTO `balances` VALUES (23, 32285.50, 13322.00, 0.00, 45607.50, '2022-05-22', 1, 1, '2022-05-22 04:09:09', '2022-05-22 17:00:58');
INSERT INTO `balances` VALUES (24, 45607.50, 818.50, 0.00, 46426.00, '2022-05-23', 1, 1, '2022-05-23 09:47:10', '2022-05-23 19:07:04');
INSERT INTO `balances` VALUES (25, 46426.00, 4546.00, 0.00, 50972.00, '2022-05-25', 1, 1, '2022-05-25 08:26:59', '2022-05-25 16:07:11');
INSERT INTO `balances` VALUES (26, 50972.00, 6115.00, 0.00, 57087.00, '2022-05-26', 1, 1, '2022-05-26 10:28:05', '2022-05-26 17:03:13');
INSERT INTO `balances` VALUES (27, 57087.00, 7162.50, 0.00, 64249.50, '2022-05-27', 1, 1, '2022-05-27 09:21:40', '2022-05-27 13:23:43');
INSERT INTO `balances` VALUES (28, 64249.50, 6895.50, 0.00, 71145.00, '2022-05-28', 1, 1, '2022-05-28 06:13:27', '2022-05-28 06:41:47');
INSERT INTO `balances` VALUES (29, 71145.00, 320.00, 0.00, 71465.00, '2022-05-29', 1, 1, '2022-05-29 06:13:44', '2022-05-29 06:14:16');
INSERT INTO `balances` VALUES (30, 71465.00, 6100.50, 0.00, 77565.50, '2022-05-30', 1, 1, '2022-05-30 01:28:05', '2022-05-30 09:13:44');
INSERT INTO `balances` VALUES (31, 77565.50, 2885.00, 0.00, 80450.50, '2022-05-31', 1, 1, '2022-05-31 02:46:51', '2022-05-31 00:36:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `brand_product` VALUES (56, 12, 54);
INSERT INTO `brand_product` VALUES (57, 12, 55);
INSERT INTO `brand_product` VALUES (58, 1, 56);
INSERT INTO `brand_product` VALUES (59, 1, 57);
INSERT INTO `brand_product` VALUES (60, 12, 58);
INSERT INTO `brand_product` VALUES (61, 9, 59);
INSERT INTO `brand_product` VALUES (62, 10, 60);
INSERT INTO `brand_product` VALUES (63, 13, 61);
INSERT INTO `brand_product` VALUES (64, 11, 62);
INSERT INTO `brand_product` VALUES (65, 11, 63);
INSERT INTO `brand_product` VALUES (66, 11, 64);
INSERT INTO `brand_product` VALUES (67, 11, 65);
INSERT INTO `brand_product` VALUES (68, 4, 66);
INSERT INTO `brand_product` VALUES (69, 4, 67);
INSERT INTO `brand_product` VALUES (70, 11, 68);
INSERT INTO `brand_product` VALUES (71, 11, 69);
INSERT INTO `brand_product` VALUES (72, 11, 70);
INSERT INTO `brand_product` VALUES (73, 11, 71);
INSERT INTO `brand_product` VALUES (74, 4, 72);
INSERT INTO `brand_product` VALUES (75, 4, 73);

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
INSERT INTO `brands` VALUES (13, 'REDMI', NULL, NULL, NULL, '2022-05-27 12:59:35', NULL);
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
INSERT INTO `customers` VALUES (2, 1, 'RAKSMEY', '010 658585', 'Phnom Penh', NULL, NULL, '2022-05-14 06:14:47', NULL);
INSERT INTO `customers` VALUES (3, 1, 'BONG HENG', '097 4468079', 'Kampong Cham', NULL, NULL, '2022-05-14 06:31:24', NULL);
INSERT INTO `customers` VALUES (4, 1, 'SAMBO', '070 810001', 'Pursat', NULL, NULL, '2022-05-14 06:37:33', NULL);
INSERT INTO `customers` VALUES (5, 1, 'SOPHEAK', '087 456800', 'Siem Reab', NULL, NULL, '2022-05-14 06:22:23', NULL);
INSERT INTO `customers` VALUES (6, 1, 'SOCHEATA', '096 6565834', 'Phnom Penh', NULL, NULL, '2022-05-14 06:23:10', NULL);
INSERT INTO `customers` VALUES (7, 1, 'TA MACH', '097 6466645', 'Steung Treng', NULL, NULL, '2022-05-14 06:24:56', NULL);
INSERT INTO `customers` VALUES (8, 1, 'PHANUN', '071 4888843', 'Kracheh', NULL, NULL, '2022-05-14 06:26:46', NULL);
INSERT INTO `customers` VALUES (9, 1, 'KHHY', '087 323355', 'Preah Vihear', NULL, NULL, '2022-05-14 06:27:55', NULL);
INSERT INTO `customers` VALUES (10, 1, 'BONG HONG', '097 9901133', 'Kampong Chhnang', NULL, NULL, '2022-05-14 06:31:36', NULL);
INSERT INTO `customers` VALUES (11, 1, 'RATHANAK', '092 737396', 'Kampong Cham', NULL, NULL, '2022-05-14 06:31:10', NULL);
INSERT INTO `customers` VALUES (12, 1, 'BUNTHAN', '010 846446', 'Kampong Cham', NULL, NULL, '2022-05-14 06:32:31', NULL);
INSERT INTO `customers` VALUES (13, 1, 'BONG LONG', '010 292818', 'Kandal', NULL, NULL, '2022-05-14 06:33:56', NULL);
INSERT INTO `customers` VALUES (14, 1, 'NAKHHIN', '090 981877', 'Oddar Meanchey', NULL, NULL, '2022-05-14 06:35:28', NULL);
INSERT INTO `customers` VALUES (15, 1, 'BONG SOKHA', '017 294949', 'Pursat', NULL, '2022-04-30 04:34:36', '2022-05-14 06:37:04', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 838 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (417, 67, 3, 10.00, 13, '2022-05-15 14:42:54', '2022-05-15 14:42:54', NULL);
INSERT INTO `order_details` VALUES (418, 67, 10, 5.00, 19.5, '2022-05-15 14:42:54', '2022-05-15 14:42:54', NULL);
INSERT INTO `order_details` VALUES (419, 67, 41, 5.00, 20.5, '2022-05-15 14:42:54', '2022-05-15 14:42:54', NULL);
INSERT INTO `order_details` VALUES (420, 67, 39, 5.00, 13.5, '2022-05-15 14:42:54', '2022-05-15 14:42:54', NULL);
INSERT INTO `order_details` VALUES (421, 67, 40, 5.00, 13.5, '2022-05-15 14:42:54', '2022-05-15 14:42:54', NULL);
INSERT INTO `order_details` VALUES (422, 67, 35, 10.00, 13.5, '2022-05-15 14:42:55', '2022-05-15 14:42:55', NULL);
INSERT INTO `order_details` VALUES (423, 67, 8, 10.00, 14, '2022-05-15 14:42:55', '2022-05-15 14:42:55', NULL);
INSERT INTO `order_details` VALUES (424, 67, 9, 20.00, 12.5, '2022-05-15 14:42:55', '2022-05-15 14:42:55', NULL);
INSERT INTO `order_details` VALUES (425, 67, 7, 20.00, 14, '2022-05-15 14:42:55', '2022-05-15 14:42:55', NULL);
INSERT INTO `order_details` VALUES (426, 67, 51, 20.00, 16, '2022-05-15 14:42:55', '2022-05-15 14:42:55', NULL);
INSERT INTO `order_details` VALUES (427, 68, 28, 5.00, 18, '2022-05-15 14:45:49', '2022-05-15 14:45:49', NULL);
INSERT INTO `order_details` VALUES (428, 68, 27, 10.00, 18, '2022-05-15 14:45:49', '2022-05-15 14:45:49', NULL);
INSERT INTO `order_details` VALUES (429, 68, 2, 10.00, 11, '2022-05-15 14:45:49', '2022-05-15 14:45:49', NULL);
INSERT INTO `order_details` VALUES (430, 68, 3, 50.00, 13, '2022-05-15 14:45:49', '2022-05-15 14:45:49', NULL);
INSERT INTO `order_details` VALUES (431, 68, 7, 20.00, 14, '2022-05-15 14:45:49', '2022-05-15 14:45:49', NULL);
INSERT INTO `order_details` VALUES (432, 69, 7, 5.00, 14, '2022-05-15 14:46:47', '2022-05-15 14:46:47', NULL);
INSERT INTO `order_details` VALUES (433, 69, 27, 5.00, 18, '2022-05-15 14:46:47', '2022-05-15 14:46:47', NULL);
INSERT INTO `order_details` VALUES (434, 70, 5, 10.00, 15, '2022-05-15 14:47:30', '2022-05-15 14:47:30', NULL);
INSERT INTO `order_details` VALUES (435, 70, 4, 30.00, 14.5, '2022-05-15 14:47:30', '2022-05-15 14:47:30', NULL);
INSERT INTO `order_details` VALUES (436, 71, 28, 3.00, 18, '2022-05-15 14:49:03', '2022-05-15 14:49:03', NULL);
INSERT INTO `order_details` VALUES (437, 71, 32, 5.00, 14, '2022-05-15 14:49:03', '2022-05-15 14:49:03', NULL);
INSERT INTO `order_details` VALUES (438, 71, 51, 5.00, 16, '2022-05-15 14:49:03', '2022-05-15 14:49:03', NULL);
INSERT INTO `order_details` VALUES (439, 71, 47, 3.00, 17, '2022-05-15 14:49:03', '2022-05-15 14:49:03', NULL);
INSERT INTO `order_details` VALUES (440, 71, 8, 5.00, 14, '2022-05-15 14:49:03', '2022-05-15 14:49:03', NULL);
INSERT INTO `order_details` VALUES (441, 72, 7, 10.00, 14, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (442, 72, 55, 10.00, 15, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (443, 72, 54, 10.00, 15, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (444, 72, 5, 10.00, 15, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (445, 72, 34, 10.00, 16, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (446, 72, 2, 30.00, 11, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (447, 72, 4, 30.00, 14.5, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (448, 72, 18, 20.00, 14.5, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (449, 72, 1, 7.00, 13, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (450, 72, 41, 5.00, 20.5, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (451, 72, 39, 10.00, 13.5, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (452, 72, 8, 30.00, 14, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (453, 72, 28, 10.00, 18, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (454, 72, 32, 30.00, 14, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `order_details` VALUES (455, 73, 57, 2.00, 43, '2022-05-15 15:02:42', '2022-05-15 15:02:42', NULL);
INSERT INTO `order_details` VALUES (456, 73, 56, 2.00, 36, '2022-05-15 15:02:42', '2022-05-15 15:02:42', NULL);
INSERT INTO `order_details` VALUES (457, 73, 16, 10.00, 41, '2022-05-15 15:02:42', '2022-05-15 15:02:42', NULL);
INSERT INTO `order_details` VALUES (458, 73, 35, 10.00, 13.5, '2022-05-15 15:02:42', '2022-05-15 15:02:42', NULL);
INSERT INTO `order_details` VALUES (459, 73, 23, 20.00, 11, '2022-05-15 15:02:42', '2022-05-15 15:02:42', NULL);
INSERT INTO `order_details` VALUES (460, 73, 22, 10.00, 11, '2022-05-15 15:02:42', '2022-05-15 15:02:42', NULL);
INSERT INTO `order_details` VALUES (461, 74, 16, 1.00, 41, '2022-05-16 03:17:46', '2022-05-16 03:17:46', NULL);
INSERT INTO `order_details` VALUES (462, 74, 33, 3.00, 23, '2022-05-16 03:17:46', '2022-05-16 03:17:46', NULL);
INSERT INTO `order_details` VALUES (463, 74, 8, 10.00, 14, '2022-05-16 03:17:46', '2022-05-16 03:17:46', NULL);
INSERT INTO `order_details` VALUES (464, 74, 7, 10.00, 14, '2022-05-16 03:17:46', '2022-05-16 03:17:46', NULL);
INSERT INTO `order_details` VALUES (465, 75, 54, 2.00, 15, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (466, 75, 55, 2.00, 15, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (467, 75, 23, 5.00, 11, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (468, 75, 16, 2.00, 41, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (469, 75, 18, 10.00, 14.5, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (470, 75, 2, 10.00, 11, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (471, 75, 32, 10.00, 14, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (472, 75, 8, 10.00, 14, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (473, 75, 4, 10.00, 14.5, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `order_details` VALUES (474, 76, 16, 2.00, 41, '2022-05-16 06:21:03', '2022-05-16 06:21:03', NULL);
INSERT INTO `order_details` VALUES (475, 76, 17, 2.00, 80, '2022-05-16 06:21:03', '2022-05-16 06:21:03', NULL);
INSERT INTO `order_details` VALUES (476, 76, 57, 2.00, 43, '2022-05-16 06:21:03', '2022-05-16 06:21:03', NULL);
INSERT INTO `order_details` VALUES (477, 76, 9, 10.00, 12.5, '2022-05-16 06:21:03', '2022-05-16 06:21:03', NULL);
INSERT INTO `order_details` VALUES (478, 76, 4, 10.00, 14.5, '2022-05-16 06:21:03', '2022-05-16 06:21:03', NULL);
INSERT INTO `order_details` VALUES (479, 76, 3, 10.00, 13, '2022-05-16 06:21:03', '2022-05-16 06:21:03', NULL);
INSERT INTO `order_details` VALUES (480, 77, 45, 5.00, 17, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (481, 77, 46, 5.00, 17, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (482, 77, 47, 5.00, 17, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (483, 77, 58, 3.00, 17.5, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (484, 77, 5, 5.00, 15, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (485, 77, 42, 3.00, 22, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (486, 77, 41, 5.00, 19, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (487, 77, 55, 5.00, 15, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `order_details` VALUES (488, 77, 54, 5.00, 15, '2022-05-16 08:27:14', '2022-05-16 08:27:14', NULL);
INSERT INTO `order_details` VALUES (489, 77, 8, 10.00, 14, '2022-05-16 08:27:14', '2022-05-16 08:27:14', NULL);
INSERT INTO `order_details` VALUES (490, 77, 32, 10.00, 14, '2022-05-16 08:27:14', '2022-05-16 08:27:14', NULL);
INSERT INTO `order_details` VALUES (491, 77, 9, 10.00, 12.5, '2022-05-16 08:27:14', '2022-05-16 08:27:14', NULL);
INSERT INTO `order_details` VALUES (492, 77, 4, 10.00, 14.5, '2022-05-16 08:27:14', '2022-05-16 08:27:14', NULL);
INSERT INTO `order_details` VALUES (493, 77, 7, 20.00, 14, '2022-05-16 08:27:14', '2022-05-16 08:27:14', NULL);
INSERT INTO `order_details` VALUES (494, 77, 53, 20.00, 14, '2022-05-16 08:27:14', '2022-05-16 08:27:14', NULL);
INSERT INTO `order_details` VALUES (495, 78, 39, 10.00, 13.5, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (496, 78, 40, 10.00, 13.5, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (497, 78, 32, 20.00, 14, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (498, 78, 6, 20.00, 16, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (499, 78, 3, 40.00, 13, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (500, 78, 58, 10.00, 17.5, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (501, 78, 53, 20.00, 14, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (502, 78, 13, 20.00, 18.5, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (503, 78, 26, 20.00, 15.5, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `order_details` VALUES (504, 79, 44, 2.00, 59, '2022-05-17 04:04:25', '2022-05-17 04:04:25', NULL);
INSERT INTO `order_details` VALUES (505, 80, 24, 10.00, 16, '2022-05-17 10:11:50', '2022-05-17 10:11:50', NULL);
INSERT INTO `order_details` VALUES (506, 80, 6, 10.00, 16, '2022-05-17 10:11:50', '2022-05-17 10:11:50', NULL);
INSERT INTO `order_details` VALUES (507, 80, 2, 20.00, 11, '2022-05-17 10:11:50', '2022-05-17 10:11:50', NULL);
INSERT INTO `order_details` VALUES (508, 81, 16, 1.00, 41, '2022-05-17 10:45:11', '2022-05-17 10:45:11', NULL);
INSERT INTO `order_details` VALUES (509, 81, 11, 10.00, 20, '2022-05-17 10:45:11', '2022-05-17 10:45:11', NULL);
INSERT INTO `order_details` VALUES (510, 81, 38, 10.00, 16, '2022-05-17 10:45:11', '2022-05-17 10:45:11', NULL);
INSERT INTO `order_details` VALUES (511, 82, 53, 30.00, 14, '2022-05-17 11:30:26', '2022-05-17 11:30:26', NULL);
INSERT INTO `order_details` VALUES (512, 82, 44, 5.00, 59, '2022-05-17 11:30:26', '2022-05-17 11:30:26', NULL);
INSERT INTO `order_details` VALUES (513, 82, 18, 10.00, 14.5, '2022-05-17 11:30:26', '2022-05-17 11:30:26', NULL);
INSERT INTO `order_details` VALUES (514, 82, 37, 10.00, 21.5, '2022-05-17 11:30:26', '2022-05-17 11:30:26', NULL);
INSERT INTO `order_details` VALUES (515, 82, 26, 20.00, 15.5, '2022-05-17 11:30:26', '2022-05-17 11:30:26', NULL);
INSERT INTO `order_details` VALUES (516, 82, 6, 20.00, 16, '2022-05-17 11:30:26', '2022-05-17 11:30:26', NULL);
INSERT INTO `order_details` VALUES (517, 83, 8, 5.00, 14, '2022-05-18 07:05:46', '2022-05-18 07:05:46', NULL);
INSERT INTO `order_details` VALUES (518, 83, 11, 5.00, 20.5, '2022-05-18 07:05:46', '2022-05-18 07:05:46', NULL);
INSERT INTO `order_details` VALUES (519, 83, 6, 5.00, 16, '2022-05-18 07:05:46', '2022-05-18 07:05:46', NULL);
INSERT INTO `order_details` VALUES (520, 83, 9, 10.00, 12.5, '2022-05-18 07:05:46', '2022-05-18 07:05:46', NULL);
INSERT INTO `order_details` VALUES (521, 84, 15, 2.00, 15.5, '2022-05-18 09:48:36', '2022-05-18 09:48:36', NULL);
INSERT INTO `order_details` VALUES (522, 84, 2, 5.00, 11, '2022-05-18 09:48:36', '2022-05-18 09:48:36', NULL);
INSERT INTO `order_details` VALUES (523, 84, 28, 5.00, 18, '2022-05-18 09:48:36', '2022-05-18 09:48:36', NULL);
INSERT INTO `order_details` VALUES (524, 85, 27, 2.00, 18, '2022-05-18 09:51:10', '2022-05-18 09:51:10', NULL);
INSERT INTO `order_details` VALUES (525, 85, 32, 3.00, 14, '2022-05-18 09:51:10', '2022-05-18 09:51:10', NULL);
INSERT INTO `order_details` VALUES (526, 85, 28, 2.00, 18, '2022-05-18 09:51:10', '2022-05-18 09:51:10', NULL);
INSERT INTO `order_details` VALUES (527, 85, 7, 2.00, 14, '2022-05-18 09:51:10', '2022-05-18 09:51:10', NULL);
INSERT INTO `order_details` VALUES (528, 85, 4, 2.00, 14.5, '2022-05-18 09:51:10', '2022-05-18 09:51:10', NULL);
INSERT INTO `order_details` VALUES (529, 85, 51, 2.00, 16, '2022-05-18 09:51:10', '2022-05-18 09:51:10', NULL);
INSERT INTO `order_details` VALUES (530, 86, 7, 20.00, 14, '2022-05-18 10:48:43', '2022-05-18 10:48:43', NULL);
INSERT INTO `order_details` VALUES (531, 86, 26, 30.00, 15.5, '2022-05-18 10:48:43', '2022-05-18 10:48:43', NULL);
INSERT INTO `order_details` VALUES (532, 86, 6, 30.00, 16, '2022-05-18 10:48:43', '2022-05-18 10:48:43', NULL);
INSERT INTO `order_details` VALUES (533, 86, 51, 30.00, 16, '2022-05-18 10:48:43', '2022-05-18 10:48:43', NULL);
INSERT INTO `order_details` VALUES (534, 86, 11, 50.00, 20.5, '2022-05-18 10:48:43', '2022-05-18 10:48:43', NULL);
INSERT INTO `order_details` VALUES (535, 86, 38, 50.00, 16, '2022-05-18 10:48:43', '2022-05-18 10:48:43', NULL);
INSERT INTO `order_details` VALUES (536, 87, 42, 10.00, 22, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (537, 87, 33, 10.00, 23, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (538, 87, 47, 10.00, 17, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (539, 87, 27, 10.00, 18, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (540, 87, 37, 10.00, 21.5, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (541, 87, 11, 10.00, 20.5, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (542, 87, 46, 20.00, 17, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (543, 87, 4, 20.00, 14.5, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (544, 87, 32, 20.00, 14, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (545, 87, 9, 30.00, 12.5, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (546, 87, 3, 30.00, 13, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (547, 87, 8, 30.00, 14, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (548, 87, 7, 30.00, 14, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (549, 87, 51, 30.00, 16, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `order_details` VALUES (550, 88, 58, 2.00, 17.5, '2022-05-18 11:29:39', '2022-05-18 11:29:39', NULL);
INSERT INTO `order_details` VALUES (551, 88, 13, 5.00, 18.5, '2022-05-18 11:29:39', '2022-05-18 11:29:39', NULL);
INSERT INTO `order_details` VALUES (552, 88, 11, 10.00, 20.5, '2022-05-18 11:29:40', '2022-05-18 11:29:40', NULL);
INSERT INTO `order_details` VALUES (553, 88, 26, 20.00, 15.5, '2022-05-18 11:29:40', '2022-05-18 11:29:40', NULL);
INSERT INTO `order_details` VALUES (554, 89, 32, 10.00, 14, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `order_details` VALUES (555, 89, 4, 13.00, 14.5, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `order_details` VALUES (556, 89, 8, 10.00, 14, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `order_details` VALUES (557, 89, 7, 10.00, 14, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `order_details` VALUES (558, 89, 3, 13.00, 13, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `order_details` VALUES (559, 89, 9, 20.00, 12.5, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `order_details` VALUES (560, 89, 1, 15.00, 13, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `order_details` VALUES (561, 90, 3, 10.00, 13, '2022-05-20 08:00:58', '2022-05-20 08:00:58', NULL);
INSERT INTO `order_details` VALUES (562, 90, 51, 10.00, 16, '2022-05-20 08:00:58', '2022-05-20 08:00:58', NULL);
INSERT INTO `order_details` VALUES (563, 90, 4, 10.00, 14.5, '2022-05-20 08:00:58', '2022-05-20 08:00:58', NULL);
INSERT INTO `order_details` VALUES (564, 90, 33, 5.00, 23, '2022-05-20 08:00:58', '2022-05-20 08:00:58', NULL);
INSERT INTO `order_details` VALUES (565, 90, 27, 5.00, 18, '2022-05-20 08:00:58', '2022-05-20 08:00:58', NULL);
INSERT INTO `order_details` VALUES (566, 91, 55, 2.00, 15, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (567, 91, 54, 2.00, 15, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (568, 91, 13, 3.00, 18.5, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (569, 91, 32, 10.00, 14, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (570, 91, 7, 10.00, 14, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (571, 91, 1, 10.00, 13, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (572, 91, 3, 10.00, 13, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (573, 91, 4, 20.00, 14.5, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `order_details` VALUES (574, 92, 22, 10.00, 11, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (575, 92, 34, 10.00, 16, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (576, 92, 9, 10.00, 12.5, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (577, 92, 18, 20.00, 14.5, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (578, 92, 53, 20.00, 14, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (579, 92, 2, 20.00, 11, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (580, 92, 32, 20.00, 14, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (581, 92, 1, 50.00, 13, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (582, 92, 33, 5.00, 23, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (583, 92, 38, 10.00, 16, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (584, 92, 26, 20.00, 15.5, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (585, 92, 51, 10.00, 16, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `order_details` VALUES (586, 93, 18, 2.00, 14.5, '2022-05-20 08:50:21', '2022-05-20 08:50:21', NULL);
INSERT INTO `order_details` VALUES (587, 93, 43, 2.00, 14.5, '2022-05-20 08:50:21', '2022-05-20 08:50:21', NULL);
INSERT INTO `order_details` VALUES (588, 93, 4, 5.00, 14.5, '2022-05-20 08:50:21', '2022-05-20 08:50:21', NULL);
INSERT INTO `order_details` VALUES (589, 93, 27, 2.00, 18, '2022-05-20 08:50:21', '2022-05-20 08:50:21', NULL);
INSERT INTO `order_details` VALUES (590, 93, 34, 2.00, 16, '2022-05-20 08:50:21', '2022-05-20 08:50:21', NULL);
INSERT INTO `order_details` VALUES (591, 93, 5, 2.00, 15, '2022-05-20 08:50:21', '2022-05-20 08:50:21', NULL);
INSERT INTO `order_details` VALUES (592, 94, 38, 50.00, 16, '2022-05-22 04:10:40', '2022-05-22 04:10:40', NULL);
INSERT INTO `order_details` VALUES (593, 94, 40, 20.00, 13.5, '2022-05-22 04:10:40', '2022-05-22 04:10:40', NULL);
INSERT INTO `order_details` VALUES (594, 94, 35, 5.00, 13.5, '2022-05-22 04:10:40', '2022-05-22 04:10:40', NULL);
INSERT INTO `order_details` VALUES (595, 95, 6, 8.00, 16, '2022-05-22 04:11:34', '2022-05-22 04:11:34', NULL);
INSERT INTO `order_details` VALUES (596, 95, 47, 4.00, 17, '2022-05-22 04:11:34', '2022-05-22 04:11:34', NULL);
INSERT INTO `order_details` VALUES (597, 95, 26, 4.00, 15.5, '2022-05-22 04:11:34', '2022-05-22 04:11:34', NULL);
INSERT INTO `order_details` VALUES (598, 96, 9, 20.00, 12.5, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (599, 96, 32, 20.00, 14, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (600, 96, 2, 10.00, 11, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (601, 96, 5, 10.00, 15, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (602, 96, 34, 10.00, 16, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (603, 96, 28, 10.00, 18, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (604, 96, 27, 10.00, 18, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (605, 96, 4, 30.00, 14.5, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (606, 96, 3, 20.00, 13, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (607, 96, 1, 30.00, 13, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (608, 96, 26, 20.00, 15.5, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (609, 96, 11, 20.00, 20.5, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (610, 96, 38, 20.00, 16, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (611, 96, 6, 20.00, 16, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (612, 96, 51, 20.00, 16, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `order_details` VALUES (613, 97, 54, 10.00, 15, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (614, 97, 55, 10.00, 15, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (615, 97, 45, 10.00, 17, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (616, 97, 47, 10.00, 17, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (617, 97, 13, 10.00, 18.5, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (618, 97, 53, 10.00, 14, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (619, 97, 36, 10.00, 17, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (620, 97, 35, 10.00, 13.5, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (621, 97, 8, 30.00, 14, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (622, 97, 7, 20.00, 14, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `order_details` VALUES (623, 98, 2, 10.00, 11, '2022-05-22 04:25:32', '2022-05-22 04:25:32', NULL);
INSERT INTO `order_details` VALUES (624, 98, 1, 20.00, 13, '2022-05-22 04:25:32', '2022-05-22 04:25:32', NULL);
INSERT INTO `order_details` VALUES (625, 99, 19, 3.00, 14.5, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (626, 99, 40, 5.00, 13.5, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (627, 99, 34, 5.00, 16, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (628, 99, 36, 5.00, 17, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (629, 99, 42, 3.00, 22, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (630, 99, 41, 5.00, 19, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (631, 99, 58, 5.00, 17.5, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (632, 99, 13, 3.00, 18.5, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (633, 99, 5, 2.00, 15, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (634, 99, 2, 10.00, 11, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (635, 99, 28, 10.00, 18, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (636, 99, 35, 10.00, 13.5, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (637, 99, 8, 10.00, 14, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (638, 99, 1, 10.00, 13, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (639, 99, 7, 10.00, 14, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `order_details` VALUES (640, 100, 23, 3.00, 11, '2022-05-22 04:31:43', '2022-05-22 04:31:43', NULL);
INSERT INTO `order_details` VALUES (641, 100, 22, 3.00, 11, '2022-05-22 04:31:43', '2022-05-22 04:31:43', NULL);
INSERT INTO `order_details` VALUES (642, 101, 8, 2.00, 14, '2022-05-22 04:32:36', '2022-05-22 04:32:36', NULL);
INSERT INTO `order_details` VALUES (643, 102, 6, 10.00, 16, '2022-05-22 04:34:05', '2022-05-22 04:34:05', NULL);
INSERT INTO `order_details` VALUES (644, 102, 38, 10.00, 16, '2022-05-22 04:34:05', '2022-05-22 04:34:05', NULL);
INSERT INTO `order_details` VALUES (645, 102, 51, 1.00, 16, '2022-05-22 04:34:05', '2022-05-22 04:34:05', NULL);
INSERT INTO `order_details` VALUES (646, 103, 16, 10.00, 41, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `order_details` VALUES (647, 103, 34, 10.00, 16, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `order_details` VALUES (648, 103, 5, 20.00, 15, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `order_details` VALUES (649, 103, 33, 10.00, 23, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `order_details` VALUES (650, 103, 7, 30.00, 14, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `order_details` VALUES (651, 103, 9, 30.00, 12.5, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `order_details` VALUES (652, 103, 1, 50.00, 13, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `order_details` VALUES (653, 104, 35, 2.00, 13.5, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (654, 104, 55, 1.00, 15, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (655, 104, 54, 1.00, 15, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (656, 104, 37, 2.00, 21.5, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (657, 104, 27, 2.00, 18, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (658, 104, 1, 5.00, 13, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (659, 104, 33, 6.00, 23, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (660, 104, 7, 5.00, 14, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (661, 104, 9, 15.00, 12.5, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `order_details` VALUES (662, 105, 1, 10.00, 13, '2022-05-22 17:00:58', '2022-05-22 17:00:58', NULL);
INSERT INTO `order_details` VALUES (663, 105, 11, 10.00, 20.5, '2022-05-22 17:00:58', '2022-05-22 17:00:58', NULL);
INSERT INTO `order_details` VALUES (664, 105, 6, 10.00, 16, '2022-05-22 17:00:58', '2022-05-22 17:00:58', NULL);
INSERT INTO `order_details` VALUES (665, 106, 40, 5.00, 13.5, '2022-05-23 15:59:52', '2022-05-23 15:59:52', NULL);
INSERT INTO `order_details` VALUES (666, 106, 10, 10.00, 19.5, '2022-05-23 15:59:52', '2022-05-23 15:59:52', NULL);
INSERT INTO `order_details` VALUES (667, 106, 36, 10.00, 17, '2022-05-23 15:59:52', '2022-05-23 15:59:52', NULL);
INSERT INTO `order_details` VALUES (668, 107, 18, 8.00, 14.5, '2022-05-23 19:07:04', '2022-05-23 19:07:04', NULL);
INSERT INTO `order_details` VALUES (669, 107, 7, 10.00, 14, '2022-05-23 19:07:04', '2022-05-23 19:07:04', NULL);
INSERT INTO `order_details` VALUES (670, 107, 1, 10.00, 13, '2022-05-23 19:07:04', '2022-05-23 19:07:04', NULL);
INSERT INTO `order_details` VALUES (671, 108, 47, 5.00, 17, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (672, 108, 10, 3.00, 19.5, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (673, 108, 15, 2.00, 15.5, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (674, 108, 14, 3.00, 15.5, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (675, 108, 27, 3.00, 18, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (676, 108, 43, 5.00, 14.5, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (677, 108, 58, 5.00, 17.5, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (678, 108, 1, 10.00, 13, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (679, 108, 53, 10.00, 14, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (680, 108, 33, 10.00, 23, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (681, 108, 32, 10.00, 14, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (682, 108, 9, 10.00, 12.5, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (683, 108, 4, 10.00, 14.5, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `order_details` VALUES (684, 109, 17, 2.00, 80, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (685, 109, 16, 5.00, 41, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (686, 109, 44, 5.00, 59, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (687, 109, 42, 2.00, 22, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (688, 109, 45, 5.00, 17, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (689, 109, 28, 5.00, 18, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (690, 109, 36, 5.00, 17, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (691, 109, 35, 5.00, 13.5, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (692, 109, 2, 5.00, 11, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (693, 109, 7, 15.00, 14, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (694, 109, 13, 5.00, 18.5, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (695, 109, 8, 15.00, 14, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `order_details` VALUES (696, 110, 14, 10.00, 15.5, '2022-05-25 08:34:08', '2022-05-25 08:34:08', NULL);
INSERT INTO `order_details` VALUES (697, 110, 5, 10.00, 15, '2022-05-25 08:34:08', '2022-05-25 08:34:08', NULL);
INSERT INTO `order_details` VALUES (698, 110, 4, 10.00, 14.5, '2022-05-25 08:34:08', '2022-05-25 08:34:08', NULL);
INSERT INTO `order_details` VALUES (699, 110, 3, 10.00, 13, '2022-05-25 08:34:08', '2022-05-25 08:34:08', NULL);
INSERT INTO `order_details` VALUES (700, 111, 44, 5.00, 59, '2022-05-25 08:39:10', '2022-05-25 08:39:10', NULL);
INSERT INTO `order_details` VALUES (701, 111, 57, 4.00, 43, '2022-05-25 08:39:10', '2022-05-25 08:39:10', NULL);
INSERT INTO `order_details` VALUES (702, 111, 16, 5.00, 41, '2022-05-25 08:39:10', '2022-05-25 08:39:10', NULL);
INSERT INTO `order_details` VALUES (703, 112, 56, 2.00, 36, '2022-05-25 16:07:11', '2022-05-25 16:07:11', NULL);
INSERT INTO `order_details` VALUES (704, 112, 44, 2.00, 59, '2022-05-25 16:07:11', '2022-05-25 16:07:11', NULL);
INSERT INTO `order_details` VALUES (705, 112, 17, 2.00, 80, '2022-05-25 16:07:11', '2022-05-25 16:07:11', NULL);
INSERT INTO `order_details` VALUES (706, 113, 3, 10.00, 12.5, '2022-05-26 10:29:11', '2022-05-26 10:29:11', NULL);
INSERT INTO `order_details` VALUES (707, 113, 16, 3.00, 41, '2022-05-26 10:29:11', '2022-05-26 10:29:11', NULL);
INSERT INTO `order_details` VALUES (708, 113, 26, 10.00, 15.5, '2022-05-26 10:29:11', '2022-05-26 10:29:11', NULL);
INSERT INTO `order_details` VALUES (709, 113, 28, 10.00, 18, '2022-05-26 10:29:11', '2022-05-26 10:29:11', NULL);
INSERT INTO `order_details` VALUES (710, 113, 1, 10.00, 12.5, '2022-05-26 10:29:11', '2022-05-26 10:29:11', NULL);
INSERT INTO `order_details` VALUES (711, 114, 2, 10.00, 11, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (712, 114, 8, 30.00, 13.8, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (713, 114, 6, 30.00, 16, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (714, 114, 57, 2.00, 43, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (715, 114, 13, 10.00, 18.5, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (716, 114, 19, 10.00, 14.5, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (717, 114, 40, 10.00, 13.5, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (718, 114, 53, 10.00, 14, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (719, 114, 27, 10.00, 18, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (720, 114, 4, 20.00, 14, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (721, 114, 26, 20.00, 15.5, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (722, 114, 3, 2.00, 12.5, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `order_details` VALUES (723, 115, 12, 10.00, 21, '2022-05-26 13:09:34', '2022-05-26 13:09:34', NULL);
INSERT INTO `order_details` VALUES (724, 115, 24, 20.00, 15.5, '2022-05-26 13:09:34', '2022-05-26 13:09:34', NULL);
INSERT INTO `order_details` VALUES (725, 116, 33, 1.00, 23, '2022-05-26 13:34:19', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `order_details` VALUES (726, 116, 32, 2.00, 14, '2022-05-26 13:34:19', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `order_details` VALUES (727, 116, 4, 2.00, 14, '2022-05-26 13:34:19', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `order_details` VALUES (728, 116, 7, 5.00, 13.8, '2022-05-26 13:34:19', '2022-05-27 03:12:47', '2022-05-27 03:12:47');
INSERT INTO `order_details` VALUES (729, 117, 38, 4.00, 15.5, '2022-05-26 13:41:53', '2022-05-26 13:41:53', NULL);
INSERT INTO `order_details` VALUES (730, 117, 24, 4.00, 15.5, '2022-05-26 13:41:53', '2022-05-26 13:41:53', NULL);
INSERT INTO `order_details` VALUES (731, 117, 9, 5.00, 12, '2022-05-26 13:41:53', '2022-05-26 13:41:53', NULL);
INSERT INTO `order_details` VALUES (732, 117, 1, 4.00, 12.5, '2022-05-26 13:41:53', '2022-05-26 13:41:53', NULL);
INSERT INTO `order_details` VALUES (733, 118, 51, 20.00, 15.5, '2022-05-26 16:58:53', '2022-05-26 16:58:53', NULL);
INSERT INTO `order_details` VALUES (734, 119, 51, 10.00, 15.5, '2022-05-26 16:59:31', '2022-05-26 16:59:31', NULL);
INSERT INTO `order_details` VALUES (735, 120, 15, 5.00, 15.5, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (736, 120, 14, 5.00, 15.5, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (737, 120, 34, 5.00, 16, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (738, 120, 5, 5.00, 15, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (739, 120, 28, 10.00, 18, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (740, 120, 8, 20.00, 13.8, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (741, 120, 32, 20.00, 14, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (742, 120, 7, 20.00, 13.8, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (743, 120, 9, 19.00, 12, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `order_details` VALUES (744, 116, 33, 1.00, 23, '2022-05-27 03:12:47', '2022-05-27 03:12:47', NULL);
INSERT INTO `order_details` VALUES (745, 116, 32, 2.00, 14, '2022-05-27 03:12:47', '2022-05-27 03:12:47', NULL);
INSERT INTO `order_details` VALUES (746, 116, 4, 2.00, 14, '2022-05-27 03:12:47', '2022-05-27 03:12:47', NULL);
INSERT INTO `order_details` VALUES (747, 116, 8, 5.00, 13.8, '2022-05-27 03:12:47', '2022-05-27 03:12:47', NULL);
INSERT INTO `order_details` VALUES (748, 121, 17, 3.00, 80, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (749, 121, 44, 1.00, 59, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (750, 121, 34, 20.00, 16, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (751, 121, 36, 20.00, 16.5, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (752, 121, 35, 30.00, 13.5, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (753, 121, 23, 10.00, 11, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (754, 121, 22, 10.00, 11, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (755, 121, 39, 20.00, 13.5, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (756, 121, 28, 20.00, 18, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (757, 121, 7, 45.00, 13.8, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (758, 121, 26, 30.00, 15.5, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (759, 121, 1, 50.00, 12.5, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `order_details` VALUES (760, 121, 3, 50.00, 12.5, '2022-05-27 13:22:39', '2022-05-27 13:22:39', NULL);
INSERT INTO `order_details` VALUES (761, 121, 51, 20.00, 15.5, '2022-05-27 13:22:39', '2022-05-27 13:22:39', NULL);
INSERT INTO `order_details` VALUES (762, 121, 6, 20.00, 16, '2022-05-27 13:22:39', '2022-05-27 13:22:39', NULL);
INSERT INTO `order_details` VALUES (763, 122, 8, 30.00, 13.8, '2022-05-27 13:23:43', '2022-05-27 13:23:43', NULL);
INSERT INTO `order_details` VALUES (764, 122, 58, 5.00, 17.5, '2022-05-27 13:23:43', '2022-05-27 13:23:43', NULL);
INSERT INTO `order_details` VALUES (765, 122, 33, 10.00, 23, '2022-05-27 13:23:43', '2022-05-27 13:23:43', NULL);
INSERT INTO `order_details` VALUES (766, 122, 38, 30.00, 15.5, '2022-05-27 13:23:43', '2022-05-27 13:23:43', NULL);
INSERT INTO `order_details` VALUES (767, 122, 24, 20.00, 15.5, '2022-05-27 13:23:43', '2022-05-27 13:23:43', NULL);
INSERT INTO `order_details` VALUES (768, 122, 41, 10.00, 19, '2022-05-27 13:23:43', '2022-05-27 13:23:43', NULL);
INSERT INTO `order_details` VALUES (769, 123, 33, 3.00, 23, '2022-05-28 06:15:01', '2022-05-28 06:15:01', NULL);
INSERT INTO `order_details` VALUES (770, 123, 39, 5.00, 13.5, '2022-05-28 06:15:01', '2022-05-28 06:15:01', NULL);
INSERT INTO `order_details` VALUES (771, 123, 4, 10.00, 14, '2022-05-28 06:15:01', '2022-05-28 06:15:01', NULL);
INSERT INTO `order_details` VALUES (772, 123, 3, 20.00, 12.5, '2022-05-28 06:15:01', '2022-05-28 06:15:01', NULL);
INSERT INTO `order_details` VALUES (773, 124, 53, 20.00, 14, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (774, 124, 28, 30.00, 18, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (775, 124, 32, 30.00, 14, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (776, 124, 1, 40.00, 12.5, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (777, 124, 51, 50.00, 15.5, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (778, 124, 5, 20.00, 15, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (779, 124, 60, 3.00, 20, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (780, 124, 59, 20.00, 17.5, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (781, 124, 39, 30.00, 13.5, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (782, 124, 12, 49.00, 21, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (783, 124, 3, 40.00, 12.5, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (784, 124, 24, 50.00, 15.5, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `order_details` VALUES (785, 125, 68, 10.00, 13, '2022-05-28 06:41:47', '2022-05-28 06:41:47', NULL);
INSERT INTO `order_details` VALUES (786, 125, 43, 10.00, 14.5, '2022-05-28 06:41:47', '2022-05-28 06:41:47', NULL);
INSERT INTO `order_details` VALUES (787, 125, 69, 10.00, 16, '2022-05-28 06:41:47', '2022-05-28 06:41:47', NULL);
INSERT INTO `order_details` VALUES (788, 126, 4, 5.00, 14, '2022-05-29 06:14:16', '2022-05-29 06:14:16', NULL);
INSERT INTO `order_details` VALUES (789, 126, 3, 20.00, 12.5, '2022-05-29 06:14:16', '2022-05-29 06:14:16', NULL);
INSERT INTO `order_details` VALUES (790, 127, 22, 20.00, 11, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (791, 127, 23, 10.00, 11, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (792, 127, 65, 5.00, 14, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (793, 127, 71, 5.00, 17.5, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (794, 127, 64, 5.00, 17, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (795, 127, 62, 5.00, 18, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (796, 127, 63, 5.00, 16.5, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (797, 127, 69, 5.00, 16, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (798, 127, 68, 5.00, 13, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (799, 127, 67, 5.00, 17, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (800, 127, 13, 5.00, 18.5, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (801, 127, 45, 5.00, 17, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (802, 127, 33, 5.00, 23, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (803, 127, 51, 20.00, 15.5, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (804, 127, 2, 10.00, 11, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `order_details` VALUES (805, 128, 26, 6.00, 15.5, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (806, 128, 2, 20.00, 11, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (807, 128, 6, 30.00, 16, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (808, 128, 33, 20.00, 23, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (809, 128, 70, 10.00, 16.5, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (810, 128, 71, 10.00, 17.5, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (811, 128, 68, 10.00, 13, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (812, 128, 65, 10.00, 14, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (813, 128, 63, 10.00, 16.5, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (814, 128, 62, 10.00, 18, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (815, 128, 64, 10.00, 17, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (816, 128, 72, 10.00, 17, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (817, 128, 73, 5.00, 25, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (818, 128, 67, 5.00, 17, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (819, 128, 69, 10.00, 16, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `order_details` VALUES (820, 129, 24, 10.00, 15.5, '2022-05-30 09:13:44', '2022-05-30 09:13:44', NULL);
INSERT INTO `order_details` VALUES (821, 129, 5, 6.00, 15, '2022-05-30 09:13:44', '2022-05-30 09:13:44', NULL);
INSERT INTO `order_details` VALUES (822, 129, 3, 100.00, 12.5, '2022-05-30 09:13:44', '2022-05-30 09:13:44', NULL);
INSERT INTO `order_details` VALUES (823, 130, 4, 5.00, 13.5, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `order_details` VALUES (824, 130, 8, 10.00, 13.3, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `order_details` VALUES (825, 130, 8, 5.00, 13.3, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `order_details` VALUES (826, 130, 32, 10.00, 13.5, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `order_details` VALUES (827, 130, 1, 10.00, 12, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `order_details` VALUES (828, 130, 3, 10.00, 13, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `order_details` VALUES (829, 130, 9, 10.00, 12, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `order_details` VALUES (830, 131, 60, 5.00, 20, '2022-05-31 03:34:42', '2022-05-31 03:34:42', NULL);
INSERT INTO `order_details` VALUES (831, 131, 11, 10.00, 20.5, '2022-05-31 03:34:42', '2022-05-31 03:34:42', NULL);
INSERT INTO `order_details` VALUES (832, 131, 51, 10.00, 15.5, '2022-05-31 03:34:42', '2022-05-31 03:34:42', NULL);
INSERT INTO `order_details` VALUES (833, 131, 12, 10.00, 21, '2022-05-31 03:34:42', '2022-05-31 03:34:42', NULL);
INSERT INTO `order_details` VALUES (834, 131, 6, 10.00, 16, '2022-05-31 03:34:42', '2022-05-31 03:34:42', NULL);
INSERT INTO `order_details` VALUES (835, 132, 8, 10.00, 13.8, '2022-05-31 03:39:14', '2022-05-31 00:36:22', NULL);
INSERT INTO `order_details` VALUES (836, 133, 40, 20.00, 13.5, '2022-05-31 07:16:19', '2022-05-31 07:16:19', NULL);
INSERT INTO `order_details` VALUES (837, 133, 3, 70.00, 12.5, '2022-05-31 07:16:19', '2022-05-31 07:16:19', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (67, 'INV220515001', 8, 1, 1, 1590, 0, 0, 1590, NULL, 0, 000, '2022-05-15 14:42:54', '2022-05-15 14:42:54', NULL);
INSERT INTO `orders` VALUES (68, 'INV220515002', 11, 1, 1, 1310, 0, 0, 1310, NULL, 0, 000, '2022-05-15 14:45:49', '2022-05-15 14:45:49', NULL);
INSERT INTO `orders` VALUES (69, 'INV220515003', 4, 1, 1, 160, 0, 0, 160, NULL, 0, 000, '2022-05-15 14:46:47', '2022-05-15 14:46:47', NULL);
INSERT INTO `orders` VALUES (70, 'INV220515004', 4, 1, 1, 585, 0, 0, 585, NULL, 0, 000, '2022-05-15 14:47:30', '2022-05-15 14:47:30', NULL);
INSERT INTO `orders` VALUES (71, 'INV220515005', 4, 1, 1, 325, 0, 0, 325, NULL, 0, 000, '2022-05-15 14:49:03', '2022-05-15 14:49:03', NULL);
INSERT INTO `orders` VALUES (72, 'INV220515006', 2, 1, 1, 3153.5, 0, 0, 3153.5, NULL, 0, 000, '2022-05-15 15:01:08', '2022-05-15 15:01:08', NULL);
INSERT INTO `orders` VALUES (73, 'INV220515007', 2, 1, 1, 1033, 0, 0, 1033, NULL, 0, 000, '2022-05-15 15:02:42', '2022-05-15 15:02:42', NULL);
INSERT INTO `orders` VALUES (74, 'INV220516008', 3, 1, 1, 390, 0, 0, 390, NULL, 0, 000, '2022-05-16 03:17:46', '2022-05-16 03:17:46', NULL);
INSERT INTO `orders` VALUES (75, 'INV220516009', 10, 1, 1, 877, 0, 0, 877, NULL, 0, 000, '2022-05-16 04:57:10', '2022-05-16 04:57:10', NULL);
INSERT INTO `orders` VALUES (76, 'INV220516010', 6, 1, 1, 728, 0, 0, 728, NULL, 0, 000, '2022-05-16 06:21:03', '2022-05-16 06:21:03', NULL);
INSERT INTO `orders` VALUES (77, 'INV220516011', 5, 1, 1, 1803.5, 0, 0, 1803.5, NULL, 0, 000, '2022-05-16 08:27:13', '2022-05-16 08:27:13', NULL);
INSERT INTO `orders` VALUES (78, 'INV220517012', 2, 1, 1, 2525, 0, 0, 2525, NULL, 0, 000, '2022-05-17 04:04:01', '2022-05-17 04:04:01', NULL);
INSERT INTO `orders` VALUES (79, 'INV220517013', 6, 1, 1, 118, 0, 0, 118, NULL, 0, 000, '2022-05-17 04:04:25', '2022-05-17 04:04:25', NULL);
INSERT INTO `orders` VALUES (80, 'INV220517014', 7, 1, 1, 540, 0, 0, 540, NULL, 0, 000, '2022-05-17 10:11:50', '2022-05-17 10:11:50', NULL);
INSERT INTO `orders` VALUES (81, 'INV220517015', 13, 1, 1, 401, 0, 0, 401, NULL, 0, 000, '2022-05-17 10:45:11', '2022-05-17 10:45:11', NULL);
INSERT INTO `orders` VALUES (82, 'INV220517016', 9, 1, 1, 1705, 0, 0, 1705, NULL, 0, 000, '2022-05-17 11:30:26', '2022-05-17 11:30:26', NULL);
INSERT INTO `orders` VALUES (83, 'INV220518017', 12, 1, 1, 377.5, 0, 0, 377.5, NULL, 0, 000, '2022-05-18 07:05:46', '2022-05-18 07:05:46', NULL);
INSERT INTO `orders` VALUES (84, 'INV220518018', 4, 1, 1, 176, 0, 0, 176, NULL, 0, 000, '2022-05-18 09:48:36', '2022-05-18 09:48:36', NULL);
INSERT INTO `orders` VALUES (85, 'INV220518019', 4, 1, 1, 203, 0, 0, 203, NULL, 0, 000, '2022-05-18 09:51:10', '2022-05-18 09:51:10', NULL);
INSERT INTO `orders` VALUES (86, 'INV220518020', 2, 1, 1, 3530, 0, 0, 3530, NULL, 0, 000, '2022-05-18 10:48:42', '2022-05-18 10:48:42', NULL);
INSERT INTO `orders` VALUES (87, 'INV220518021', 2, 1, 1, 4215, 0, 0, 4215, NULL, 0, 000, '2022-05-18 10:52:05', '2022-05-18 10:52:05', NULL);
INSERT INTO `orders` VALUES (88, 'INV220518022', 7, 1, 1, 642.5, 0, 0, 642.5, NULL, 0, 000, '2022-05-18 11:29:39', '2022-05-18 11:29:39', NULL);
INSERT INTO `orders` VALUES (89, 'INV220520023', 15, 1, 1, 1222.5, 0, 0, 1222.5, NULL, 0, 000, '2022-05-20 07:48:37', '2022-05-20 07:48:37', NULL);
INSERT INTO `orders` VALUES (90, 'INV220520024', 10, 1, 1, 640, 0, 0, 640, NULL, 0, 000, '2022-05-20 08:00:58', '2022-05-20 08:00:58', NULL);
INSERT INTO `orders` VALUES (91, 'INV220520025', 10, 1, 1, 945.5, 0, 0, 945.5, NULL, 0, 000, '2022-05-20 08:03:07', '2022-05-20 08:03:07', NULL);
INSERT INTO `orders` VALUES (92, 'INV220520026', 11, 1, 1, 2860, 0, 0, 2860, NULL, 0, 000, '2022-05-20 08:39:50', '2022-05-20 08:39:50', NULL);
INSERT INTO `orders` VALUES (93, 'INV220520027', 4, 1, 1, 228.5, 0, 0, 228.5, NULL, 0, 000, '2022-05-20 08:50:21', '2022-05-20 08:50:21', NULL);
INSERT INTO `orders` VALUES (94, 'INV220522028', 11, 1, 1, 1137.5, 0, 0, 1137.5, NULL, 0, 000, '2022-05-22 04:10:40', '2022-05-22 04:10:40', NULL);
INSERT INTO `orders` VALUES (95, 'INV220522029', 4, 1, 1, 258, 0, 0, 258, NULL, 0, 000, '2022-05-22 04:11:34', '2022-05-22 04:11:34', NULL);
INSERT INTO `orders` VALUES (96, 'INV220522030', 4, 1, 1, 4075, 0, 0, 4075, NULL, 0, 000, '2022-05-22 04:21:09', '2022-05-22 04:21:09', NULL);
INSERT INTO `orders` VALUES (97, 'INV220522031', 4, 1, 1, 1970, 0, 0, 1970, NULL, 0, 000, '2022-05-22 04:23:40', '2022-05-22 04:23:40', NULL);
INSERT INTO `orders` VALUES (98, 'INV220522032', 13, 1, 1, 370, 0, 0, 370, NULL, 0, 000, '2022-05-22 04:25:32', '2022-05-22 04:25:32', NULL);
INSERT INTO `orders` VALUES (99, 'INV220522033', 5, 1, 1, 1445, 0, 0, 1445, NULL, 0, 000, '2022-05-22 04:28:45', '2022-05-22 04:28:45', NULL);
INSERT INTO `orders` VALUES (100, 'INV220522034', 5, 1, 1, 66, 0, 0, 66, NULL, 0, 000, '2022-05-22 04:31:43', '2022-05-22 04:31:43', NULL);
INSERT INTO `orders` VALUES (101, 'INV220522035', 15, 1, 1, 28, 0, 0, 28, NULL, 0, 000, '2022-05-22 04:32:36', '2022-05-22 04:32:36', NULL);
INSERT INTO `orders` VALUES (102, 'INV220522036', 7, 1, 1, 336, 0, 0, 336, NULL, 0, 000, '2022-05-22 04:34:05', '2022-05-22 04:34:05', NULL);
INSERT INTO `orders` VALUES (103, 'INV220522037', 2, 1, 1, 2545, 0, 0, 2545, NULL, 0, 000, '2022-05-22 04:39:03', '2022-05-22 04:39:03', NULL);
INSERT INTO `orders` VALUES (104, 'INV220522038', 4, 1, 1, 596.5, 0, 0, 596.5, NULL, 0, 000, '2022-05-22 17:00:07', '2022-05-22 17:00:07', NULL);
INSERT INTO `orders` VALUES (105, 'INV220522039', 6, 1, 1, 495, 0, 0, 495, NULL, 0, 000, '2022-05-22 17:00:58', '2022-05-22 17:00:58', NULL);
INSERT INTO `orders` VALUES (106, 'INV220523040', 6, 1, 1, 432.5, 0, 0, 432.5, NULL, 0, 000, '2022-05-23 15:59:52', '2022-05-23 15:59:52', NULL);
INSERT INTO `orders` VALUES (107, 'INV220523041', 6, 1, 1, 386, 0, 0, 386, NULL, 0, 000, '2022-05-23 19:07:04', '2022-05-23 19:07:04', NULL);
INSERT INTO `orders` VALUES (108, 'INV220525042', 14, 1, 1, 1345, 0, 0, 1345, NULL, 0, 000, '2022-05-25 08:30:15', '2022-05-25 08:30:15', NULL);
INSERT INTO `orders` VALUES (109, 'INV220525043', 14, 1, 1, 1599, 0, 0, 1599, NULL, 0, 000, '2022-05-25 08:32:55', '2022-05-25 08:32:55', NULL);
INSERT INTO `orders` VALUES (110, 'INV220525044', 6, 1, 1, 580, 0, 0, 580, NULL, 0, 000, '2022-05-25 08:34:08', '2022-05-25 08:34:08', NULL);
INSERT INTO `orders` VALUES (111, 'INV220525045', 4, 1, 1, 672, 0, 0, 672, NULL, 0, 000, '2022-05-25 08:39:10', '2022-05-25 08:39:10', NULL);
INSERT INTO `orders` VALUES (112, 'INV220525046', 6, 1, 1, 350, 0, 0, 350, NULL, 0, 000, '2022-05-25 16:07:11', '2022-05-25 16:07:11', NULL);
INSERT INTO `orders` VALUES (113, 'INV220526047', 6, 1, 1, 708, 0, 0, 708, NULL, 0, 000, '2022-05-26 10:29:11', '2022-05-26 10:29:11', NULL);
INSERT INTO `orders` VALUES (114, 'INV220526048', 2, 1, 1, 2490, 0, 0, 2490, NULL, 0, 000, '2022-05-26 11:00:10', '2022-05-26 11:00:10', NULL);
INSERT INTO `orders` VALUES (115, 'INV220526049', 7, 1, 1, 520, 0, 0, 520, NULL, 0, 000, '2022-05-26 13:09:34', '2022-05-26 13:09:34', NULL);
INSERT INTO `orders` VALUES (116, 'INV220526050', 15, 1, 1, 148, 0, 0, 148, NULL, 0, 000, '2022-05-26 13:34:19', '2022-05-26 13:34:19', NULL);
INSERT INTO `orders` VALUES (117, 'INV220526051', 4, 1, 1, 234, 0, 0, 234, NULL, 0, 000, '2022-05-26 13:41:53', '2022-05-26 13:41:53', NULL);
INSERT INTO `orders` VALUES (118, 'INV220526052', 7, 1, 1, 310, 0, 0, 310, NULL, 0, 000, '2022-05-26 16:58:53', '2022-05-26 16:58:53', NULL);
INSERT INTO `orders` VALUES (119, 'INV220526053', 6, 1, 1, 155, 0, 0, 155, NULL, 0, 000, '2022-05-26 16:59:31', '2022-05-26 16:59:31', NULL);
INSERT INTO `orders` VALUES (120, 'INV220526054', 11, 1, 1, 1550, 0, 0, 1550, NULL, 0, 000, '2022-05-26 17:03:13', '2022-05-26 17:03:13', NULL);
INSERT INTO `orders` VALUES (121, 'INV220527055', 9, 1, 1, 5170, 0, 0, 5170, NULL, 0, 000, '2022-05-27 13:22:38', '2022-05-27 13:22:38', NULL);
INSERT INTO `orders` VALUES (122, 'INV220527056', 9, 1, 1, 1696.5, 0, 0, 1696.5, NULL, 0, 000, '2022-05-27 13:23:43', '2022-05-27 13:23:43', NULL);
INSERT INTO `orders` VALUES (123, 'INV220528057', 10, 1, 1, 526.5, 0, 0, 526.5, NULL, 0, 000, '2022-05-28 06:15:01', '2022-05-28 06:15:01', NULL);
INSERT INTO `orders` VALUES (124, 'INV220528058', 2, 1, 1, 5934, 0, 0, 5934, NULL, 0, 000, '2022-05-28 06:24:41', '2022-05-28 06:24:41', NULL);
INSERT INTO `orders` VALUES (125, 'INV220528059', 9, 1, 1, 435, 0, 0, 435, NULL, 0, 000, '2022-05-28 06:41:47', '2022-05-28 06:41:47', NULL);
INSERT INTO `orders` VALUES (126, 'INV220529060', 13, 1, 1, 320, 0, 0, 320, NULL, 0, 000, '2022-05-29 06:14:16', '2022-05-29 06:14:16', NULL);
INSERT INTO `orders` VALUES (127, 'INV220530061', 11, 1, 1, 1687.5, 0, 0, 1687.5, NULL, 0, 000, '2022-05-30 01:30:32', '2022-05-30 01:30:32', NULL);
INSERT INTO `orders` VALUES (128, 'INV220530062', 2, 1, 1, 2918, 0, 0, 2918, NULL, 0, 000, '2022-05-30 01:39:29', '2022-05-30 01:39:29', NULL);
INSERT INTO `orders` VALUES (129, 'INV220530063', 11, 1, 1, 1495, 0, 0, 1495, NULL, 0, 000, '2022-05-30 09:13:44', '2022-05-30 09:13:44', NULL);
INSERT INTO `orders` VALUES (130, 'INV220531064', 4, 1, 1, 772, 0, 0, 772, NULL, 0, 000, '2022-05-31 03:32:51', '2022-05-31 03:32:51', NULL);
INSERT INTO `orders` VALUES (131, 'INV220531065', 6, 1, 1, 830, 0, 0, 830, NULL, 0, 000, '2022-05-31 03:34:42', '2022-05-31 03:34:42', NULL);
INSERT INTO `orders` VALUES (132, 'INV220531066', 1, 1, 1, 138, 0, 0, 138, NULL, 0, 000, '2022-05-31 03:39:14', '2022-05-31 00:36:22', NULL);
INSERT INTO `orders` VALUES (133, 'INV220531067', 9, 1, 1, 1145, 0, 0, 1145, NULL, 0, 000, '2022-05-31 07:16:19', '2022-05-31 07:16:19', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `personal_access_tokens` VALUES (62, 'App\\Models\\User', 1, 'Apptoken', '8d6a6ebcd6c28e704ceb23a31e298b48211b5dbfb4eef383719987dca46a9d2a', '[\"*\"]', '2022-05-14 06:37:48', '2022-05-14 05:46:42', '2022-05-14 06:37:48');
INSERT INTO `personal_access_tokens` VALUES (63, 'App\\Models\\User', 1, 'Apptoken', '10b7c6e440cf269161d30d330401d3616b769ec99e633fc6cc1c3b8faa8282bd', '[\"*\"]', '2022-05-14 10:48:28', '2022-05-14 09:10:48', '2022-05-14 10:48:28');
INSERT INTO `personal_access_tokens` VALUES (64, 'App\\Models\\User', 1, 'Apptoken', '4ff134926d87f1b1f3f3577a9a443218c95564ceb786682602cdee8d78576f0d', '[\"*\"]', '2022-05-15 00:45:40', '2022-05-15 00:45:34', '2022-05-15 00:45:40');
INSERT INTO `personal_access_tokens` VALUES (65, 'App\\Models\\User', 1, 'Apptoken', 'bcb27e5552f7e6957438737f9d13deb1fd241616338057a37fb7b19cde6d3629', '[\"*\"]', '2022-05-15 13:48:22', '2022-05-15 13:35:11', '2022-05-15 13:48:22');
INSERT INTO `personal_access_tokens` VALUES (66, 'App\\Models\\User', 1, 'Apptoken', '7eba64fa56926031f8fe3b704ea26ef16f52459b71f397f7ae4688f12d5db082', '[\"*\"]', '2022-05-15 15:05:06', '2022-05-15 13:48:59', '2022-05-15 15:05:06');
INSERT INTO `personal_access_tokens` VALUES (67, 'App\\Models\\User', 1, 'Apptoken', 'a855b9e7afb3a998200737f95e917e44e53ac9a0b3cdd2ee0d463e7928fd2ab5', '[\"*\"]', '2022-05-16 00:43:59', '2022-05-16 00:42:29', '2022-05-16 00:43:59');
INSERT INTO `personal_access_tokens` VALUES (68, 'App\\Models\\User', 1, 'Apptoken', 'a812a846b419d50966deeee04355a0ec06dc19d3da2d953584bbecf29cb788f5', '[\"*\"]', '2022-05-16 08:03:51', '2022-05-16 02:30:07', '2022-05-16 08:03:51');
INSERT INTO `personal_access_tokens` VALUES (69, 'App\\Models\\User', 1, 'Apptoken', '3e4a94a75c19cada5518a26e5ffe61ab701f3a8381caf25686f2bbbfc766f983', '[\"*\"]', '2022-05-16 08:31:46', '2022-05-16 08:04:28', '2022-05-16 08:31:46');
INSERT INTO `personal_access_tokens` VALUES (70, 'App\\Models\\User', 1, 'Apptoken', 'e4c07793b6034dec3397008cfc97943e323f44ea8e1dd813ae4952a1f1f54aa2', '[\"*\"]', '2022-05-17 09:00:27', '2022-05-17 03:52:43', '2022-05-17 09:00:27');
INSERT INTO `personal_access_tokens` VALUES (71, 'App\\Models\\User', 1, 'Apptoken', '1a8bf0c9e583c2ace7eadf7573a628840f1a402cc7e11f9821cdf81793ccd5b5', '[\"*\"]', '2022-05-17 10:45:11', '2022-05-17 09:00:45', '2022-05-17 10:45:11');
INSERT INTO `personal_access_tokens` VALUES (72, 'App\\Models\\User', 1, 'Apptoken', '55794f4cd6d18d51571a92a9599ca1eb675e56ecfa28d6570d9da022b5829d30', '[\"*\"]', '2022-05-17 11:30:26', '2022-05-17 11:29:03', '2022-05-17 11:30:26');
INSERT INTO `personal_access_tokens` VALUES (73, 'App\\Models\\User', 1, 'Apptoken', '169800239785a8dfff516c650bb14bc56ad07dbfc870f8b379dcfd9b94459338', '[\"*\"]', '2022-05-18 01:14:04', '2022-05-18 01:13:58', '2022-05-18 01:14:04');
INSERT INTO `personal_access_tokens` VALUES (74, 'App\\Models\\User', 1, 'Apptoken', '8dcdc8f3840fbabd8dc708134716ffdbc05e765db10f5220ccc4b75db1004286', '[\"*\"]', '2022-05-18 09:51:10', '2022-05-18 05:36:50', '2022-05-18 09:51:10');
INSERT INTO `personal_access_tokens` VALUES (75, 'App\\Models\\User', 1, 'Apptoken', 'f50b4b7445b14ae74bdd3804b8fafcfce61f553926560a756f5162a6f80dbb16', '[\"*\"]', '2022-05-18 10:52:28', '2022-05-18 10:45:29', '2022-05-18 10:52:28');
INSERT INTO `personal_access_tokens` VALUES (76, 'App\\Models\\User', 1, 'Apptoken', 'e293f96d567431c4c3933b5ab26f20e3201506476a2691c5eec2a31a2e089efe', '[\"*\"]', '2022-05-18 11:29:56', '2022-05-18 11:28:38', '2022-05-18 11:29:56');
INSERT INTO `personal_access_tokens` VALUES (77, 'App\\Models\\User', 1, 'Apptoken', '2efd2f9db1e8caeadef43bb4e72e46d345e5147f977474b258e24791cb772ad1', '[\"*\"]', NULL, '2022-05-19 02:14:36', '2022-05-19 02:14:36');
INSERT INTO `personal_access_tokens` VALUES (78, 'App\\Models\\User', 1, 'Apptoken', 'f0f2ad6c0748c26d4eaad822bb1186fab5fa84efc52044359157e1fc6049a294', '[\"*\"]', '2022-05-19 02:14:45', '2022-05-19 02:14:37', '2022-05-19 02:14:45');
INSERT INTO `personal_access_tokens` VALUES (79, 'App\\Models\\User', 1, 'Apptoken', '309e3b0a0ba00d831a6b0b100a160ac7cfaea013ae3612d2bf5cc9b691b3245f', '[\"*\"]', '2022-05-19 13:00:43', '2022-05-19 12:58:52', '2022-05-19 13:00:43');
INSERT INTO `personal_access_tokens` VALUES (80, 'App\\Models\\User', 1, 'Apptoken', '2d25e16b065fc06ac292ea4e2a0d4c7a02e6f470055914d7e0ef96e831e18e5f', '[\"*\"]', '2022-05-19 22:52:53', '2022-05-19 22:52:44', '2022-05-19 22:52:53');
INSERT INTO `personal_access_tokens` VALUES (81, 'App\\Models\\User', 1, 'Apptoken', 'caeccf938d6caaab5d34b3a49eb5e38a72e4fb7281795e6f80bad7762cbe84f6', '[\"*\"]', '2022-05-20 09:14:38', '2022-05-20 01:47:34', '2022-05-20 09:14:38');
INSERT INTO `personal_access_tokens` VALUES (82, 'App\\Models\\User', 1, 'Apptoken', '000284035a614f8d1fbdc8d7a5b18c0373eed1dc38d71e5c3c7a6e327b15a66a', '[\"*\"]', '2022-05-21 04:24:00', '2022-05-21 04:23:55', '2022-05-21 04:24:00');
INSERT INTO `personal_access_tokens` VALUES (83, 'App\\Models\\User', 1, 'Apptoken', '657c5a41e10bfa62fc2b74f8d7f0bf8ca77e5453a92b5def456954a93a439930', '[\"*\"]', '2022-05-21 08:48:28', '2022-05-21 08:48:14', '2022-05-21 08:48:28');
INSERT INTO `personal_access_tokens` VALUES (84, 'App\\Models\\User', 1, 'Apptoken', '5935bc90af7534c75b6713d003184942b6bd052e7d3eb9f0b4e2622d7a68933d', '[\"*\"]', '2022-05-21 09:06:22', '2022-05-21 08:53:57', '2022-05-21 09:06:22');
INSERT INTO `personal_access_tokens` VALUES (85, 'App\\Models\\User', 1, 'Apptoken', '150d261024dff56f2914f0231e8984ef3fc9c5cd21bde2d21e8280787bb01d6c', '[\"*\"]', '2022-05-22 04:46:02', '2022-05-22 04:08:03', '2022-05-22 04:46:02');
INSERT INTO `personal_access_tokens` VALUES (86, 'App\\Models\\User', 1, 'Apptoken', '74529402cfb30b634aba1a8da783785baa63deed010226f90f441ac564776713', '[\"*\"]', '2022-05-22 13:35:01', '2022-05-22 13:04:07', '2022-05-22 13:35:01');
INSERT INTO `personal_access_tokens` VALUES (87, 'App\\Models\\User', 1, 'Apptoken', '164143a90ab34430adf604fb747d63bfa58bc8c2a2fd948f8430f86b5bb7b7d9', '[\"*\"]', '2022-05-22 13:09:03', '2022-05-22 13:08:45', '2022-05-22 13:09:03');
INSERT INTO `personal_access_tokens` VALUES (88, 'App\\Models\\User', 1, 'Apptoken', '338852cf3b56f2eb9e753180ed1c717f18c6ec3e22c331cb95e904c33f15194a', '[\"*\"]', '2022-05-22 13:14:21', '2022-05-22 13:14:05', '2022-05-22 13:14:21');
INSERT INTO `personal_access_tokens` VALUES (89, 'App\\Models\\User', 1, 'Apptoken', '169ae2583d493aaa4a6bc7a4bc84ac327e1884cce461dc4d85554a7e49737859', '[\"*\"]', '2022-05-22 13:18:53', '2022-05-22 13:17:09', '2022-05-22 13:18:53');
INSERT INTO `personal_access_tokens` VALUES (90, 'App\\Models\\User', 1, 'Apptoken', 'bfa15d9a93d73d1d474d0178c133b7df6014059d3ea54aeabb9bab4ad6a3e813', '[\"*\"]', '2022-05-22 13:20:33', '2022-05-22 13:20:28', '2022-05-22 13:20:33');
INSERT INTO `personal_access_tokens` VALUES (91, 'App\\Models\\User', 1, 'Apptoken', 'd427ded6b17c8f2df275eb3e2dfa96bdabee22d0131bb4c282ee8f40060d2f87', '[\"*\"]', '2022-05-22 17:44:26', '2022-05-22 13:39:26', '2022-05-22 17:44:26');
INSERT INTO `personal_access_tokens` VALUES (92, 'App\\Models\\User', 1, 'Apptoken', 'a2814fa4f602c070d168cd0e63085efc7a29444de93ec127fbe99b16c521420a', '[\"*\"]', '2022-05-22 16:26:27', '2022-05-22 16:20:59', '2022-05-22 16:26:27');
INSERT INTO `personal_access_tokens` VALUES (93, 'App\\Models\\User', 1, 'Apptoken', 'ea872b1dfcbf325866de03acdb0371190d632772f87c033c4635fb63779cf809', '[\"*\"]', '2022-05-22 17:01:07', '2022-05-22 16:30:55', '2022-05-22 17:01:07');
INSERT INTO `personal_access_tokens` VALUES (94, 'App\\Models\\User', 1, 'Apptoken', '5f1f9dbbfcf3e71991455258977c89406ba5ac6a83dda3f521969d38db26c246', '[\"*\"]', '2022-05-23 09:52:45', '2022-05-23 09:17:14', '2022-05-23 09:52:45');
INSERT INTO `personal_access_tokens` VALUES (95, 'App\\Models\\User', 1, 'Apptoken', '02576fac87f9543ad74388563b07c1cf30ca315a956d6d450ee3485586441712', '[\"*\"]', '2022-05-23 15:59:52', '2022-05-23 13:26:01', '2022-05-23 15:59:52');
INSERT INTO `personal_access_tokens` VALUES (96, 'App\\Models\\User', 1, 'Apptoken', '400bccce69f141d3f95c46ae14ee4b0972574d86740e1f6b9184ee04ef4f4f9f', '[\"*\"]', '2022-05-23 19:14:09', '2022-05-23 18:52:28', '2022-05-23 19:14:09');
INSERT INTO `personal_access_tokens` VALUES (97, 'App\\Models\\User', 1, 'Apptoken', 'bdc7565a24b8446823089fc6a9e31cca7cd2bf638a03649ef381f36b0acaa67b', '[\"*\"]', '2022-05-23 19:07:18', '2022-05-23 19:02:42', '2022-05-23 19:07:18');
INSERT INTO `personal_access_tokens` VALUES (98, 'App\\Models\\User', 1, 'Apptoken', '3abc855a3d8e0304bb43e22741af54c512567c6c1e63bb4d40ef3c4f72f85c5e', '[\"*\"]', '2022-05-23 19:13:50', '2022-05-23 19:13:46', '2022-05-23 19:13:50');
INSERT INTO `personal_access_tokens` VALUES (99, 'App\\Models\\User', 1, 'Apptoken', 'a88780ddc0d8ea6f7fb4f53d7788dccad736efaa8b23ca56dc8ab9fd6451656b', '[\"*\"]', '2022-05-24 10:16:48', '2022-05-24 09:19:46', '2022-05-24 10:16:48');
INSERT INTO `personal_access_tokens` VALUES (100, 'App\\Models\\User', 1, 'Apptoken', '4b1465ee65a74fca45b336ef91a6e1fd78425f6ce791088f209fe3b46958df5e', '[\"*\"]', '2022-05-24 18:40:17', '2022-05-24 18:40:09', '2022-05-24 18:40:17');
INSERT INTO `personal_access_tokens` VALUES (101, 'App\\Models\\User', 1, 'Apptoken', 'a9bbc1b163112fd87e6064447c80455a8333e3cf3fe8adc94065ad79438c4a37', '[\"*\"]', '2022-05-25 08:54:19', '2022-05-25 07:27:12', '2022-05-25 08:54:19');
INSERT INTO `personal_access_tokens` VALUES (102, 'App\\Models\\User', 1, 'Apptoken', '03650f843ddd6d970147962b8c88d8c2260eca965d1278f30216277c4fbe9a3a', '[\"*\"]', '2022-05-25 13:22:19', '2022-05-25 11:47:48', '2022-05-25 13:22:19');
INSERT INTO `personal_access_tokens` VALUES (103, 'App\\Models\\User', 1, 'Apptoken', '6272b845b2cbd86fc61fd7232217b03cee71f21f0b3bdd3c4ec2ac2039c0e8b8', '[\"*\"]', '2022-05-25 13:25:55', '2022-05-25 13:24:35', '2022-05-25 13:25:55');
INSERT INTO `personal_access_tokens` VALUES (104, 'App\\Models\\User', 1, 'Apptoken', '8434e9dfcf13ace12a2655fbbf313266c29b568f3c7acc3956c72f0a4533231c', '[\"*\"]', '2022-05-25 16:46:12', '2022-05-25 15:55:35', '2022-05-25 16:46:12');
INSERT INTO `personal_access_tokens` VALUES (105, 'App\\Models\\User', 1, 'Apptoken', 'd2a59fbbd4b1dccc786ecdb4166f8dfccb67fce72eabcb8e5f45e64418c60e3d', '[\"*\"]', '2022-05-25 21:27:26', '2022-05-25 20:06:28', '2022-05-25 21:27:26');
INSERT INTO `personal_access_tokens` VALUES (106, 'App\\Models\\User', 1, 'Apptoken', 'e05b931412b9279c0a3e9daea9ce93e956cb8eb4af23c0017eb82e54934f8aca', '[\"*\"]', '2022-05-25 21:43:13', '2022-05-25 20:15:11', '2022-05-25 21:43:13');
INSERT INTO `personal_access_tokens` VALUES (107, 'App\\Models\\User', 1, 'Apptoken', '87d71d9007503b14798d3c80e1ecd06da6bb89484d8725f05c8d60016ae4850c', '[\"*\"]', '2022-05-26 11:01:31', '2022-05-26 10:27:57', '2022-05-26 11:01:31');
INSERT INTO `personal_access_tokens` VALUES (108, 'App\\Models\\User', 1, 'Apptoken', 'fe59786015467a330dc4bc729ac95066b98bda92ab02812255d428976aa5f62e', '[\"*\"]', '2022-05-26 11:56:48', '2022-05-26 11:56:32', '2022-05-26 11:56:48');
INSERT INTO `personal_access_tokens` VALUES (109, 'App\\Models\\User', 1, 'Apptoken', '32faa3f835a50c1e4f5d19caa462ef5075480da7ce0b48c0b7cd8165cc7874f5', '[\"*\"]', '2022-05-26 12:41:20', '2022-05-26 12:40:56', '2022-05-26 12:41:20');
INSERT INTO `personal_access_tokens` VALUES (110, 'App\\Models\\User', 1, 'Apptoken', '8881aebee1aa5468e42f2150afa46df659122cc06b00d94c46e8d8db8210ca39', '[\"*\"]', '2022-05-26 13:46:39', '2022-05-26 13:08:42', '2022-05-26 13:46:39');
INSERT INTO `personal_access_tokens` VALUES (111, 'App\\Models\\User', 1, 'Apptoken', 'c7b2e4b288f268777cb010deaf37831d4fbb3faecd79bf4b51588497b0e03e6e', '[\"*\"]', '2022-05-26 13:47:36', '2022-05-26 13:46:24', '2022-05-26 13:47:36');
INSERT INTO `personal_access_tokens` VALUES (112, 'App\\Models\\User', 1, 'Apptoken', 'aa799e2c10d3c36b36390cc5c0633b43af919db0ef610294f25dbb6d16fc6a7a', '[\"*\"]', '2022-05-26 14:28:56', '2022-05-26 14:25:30', '2022-05-26 14:28:56');
INSERT INTO `personal_access_tokens` VALUES (113, 'App\\Models\\User', 1, 'Apptoken', '0ad7f240fe3c1dd57861a9f880ea02962ac6c816803ae34f6c2c18ffa2934f91', '[\"*\"]', '2022-05-26 17:07:01', '2022-05-26 16:52:12', '2022-05-26 17:07:01');
INSERT INTO `personal_access_tokens` VALUES (114, 'App\\Models\\User', 1, 'Apptoken', '674e7a44877dff800bfa8025422b347df5f2b7e78f7194fcbc519401a4ac2bb7', '[\"*\"]', '2022-05-26 20:26:59', '2022-05-26 20:23:57', '2022-05-26 20:26:59');
INSERT INTO `personal_access_tokens` VALUES (115, 'App\\Models\\User', 1, 'Apptoken', 'e3507f5c009784019af7436685b30ceff14ee8d919fcdde7771e74522df969cc', '[\"*\"]', '2022-05-27 09:25:05', '2022-05-27 08:43:19', '2022-05-27 09:25:05');
INSERT INTO `personal_access_tokens` VALUES (116, 'App\\Models\\User', 1, 'Apptoken', 'c8adce7e09a95187acbd3c9146d158fccbf37a49f2b53adfde380f0a59182009', '[\"*\"]', '2022-05-27 03:07:38', '2022-05-27 02:50:48', '2022-05-27 03:07:38');
INSERT INTO `personal_access_tokens` VALUES (117, 'App\\Models\\User', 1, 'Apptoken', '22e9f956514cbad185844bb84e458a6ed8ea302312391d179277ad33cffc0096', '[\"*\"]', '2022-05-27 03:12:47', '2022-05-27 03:08:14', '2022-05-27 03:12:47');
INSERT INTO `personal_access_tokens` VALUES (118, 'App\\Models\\User', 1, 'Apptoken', 'fd2d3ec4cb156aae46e652ed693f1cbb7ac9c2c0a6ae08711f82ac763a34690a', '[\"*\"]', '2022-05-27 10:16:27', '2022-05-27 10:15:07', '2022-05-27 10:16:27');
INSERT INTO `personal_access_tokens` VALUES (119, 'App\\Models\\User', 1, 'Apptoken', '099f9553592495fce0aab24210b20f1f449bb403bd77391ebd1b0cbeab8f4f95', '[\"*\"]', '2022-05-27 11:46:33', '2022-05-27 11:46:19', '2022-05-27 11:46:33');
INSERT INTO `personal_access_tokens` VALUES (120, 'App\\Models\\User', 1, 'Apptoken', '99aaa3791d4a24c6ddc410a8bbdce5dad5d7aa8453709e28fa7ed6f92720b438', '[\"*\"]', '2022-05-27 13:24:11', '2022-05-27 12:49:57', '2022-05-27 13:24:11');
INSERT INTO `personal_access_tokens` VALUES (121, 'App\\Models\\User', 1, 'Apptoken', '5a231319b422633d1524a1ada23a0b4f9e06848f4d2e634bcda362e522a8847b', '[\"*\"]', '2022-05-27 13:27:51', '2022-05-27 12:53:10', '2022-05-27 13:27:51');
INSERT INTO `personal_access_tokens` VALUES (122, 'App\\Models\\User', 1, 'Apptoken', '5f68d0491a9d3325ab265961931eb9f8fbb4b49a107f29b5e160aca9fed8a2a1', '[\"*\"]', '2022-05-28 00:45:42', '2022-05-28 00:45:38', '2022-05-28 00:45:42');
INSERT INTO `personal_access_tokens` VALUES (123, 'App\\Models\\User', 1, 'Apptoken', '24ed32bb4af8097ca93ec828aa98bbbc13e862e97adda3df430c369f132d5efa', '[\"*\"]', '2022-05-28 06:54:42', '2022-05-28 05:30:38', '2022-05-28 06:54:42');
INSERT INTO `personal_access_tokens` VALUES (124, 'App\\Models\\User', 1, 'Apptoken', '6940e288bf7bfb89076c3dc989e04eb12a74ec3cef6859b9dc2ec852c641e6d4', '[\"*\"]', '2022-05-28 06:54:50', '2022-05-28 06:52:08', '2022-05-28 06:54:50');
INSERT INTO `personal_access_tokens` VALUES (125, 'App\\Models\\User', 1, 'Apptoken', '89a8911c5eb1ccb434c964fa4f5c48e407cfcbb8aeb0ab2adcbdf6d472d60a28', '[\"*\"]', '2022-05-28 14:30:40', '2022-05-28 14:30:32', '2022-05-28 14:30:40');
INSERT INTO `personal_access_tokens` VALUES (126, 'App\\Models\\User', 1, 'Apptoken', '29ffe340f3e9868aaa88589fe4e680612ee4e4aea235d063181356477a6b737f', '[\"*\"]', '2022-05-29 06:39:47', '2022-05-29 06:07:49', '2022-05-29 06:39:47');
INSERT INTO `personal_access_tokens` VALUES (127, 'App\\Models\\User', 1, 'Apptoken', 'c558e0d16a8ee3f5f4fa93c4700743cbff6aa66007b31c57f0912d5a6b75f172', '[\"*\"]', '2022-05-29 14:09:09', '2022-05-29 14:08:49', '2022-05-29 14:09:09');
INSERT INTO `personal_access_tokens` VALUES (128, 'App\\Models\\User', 1, 'Apptoken', 'f7d136e936d8b70060a17b4523858ff21142c9690ad60deffa6fa187b103192f', '[\"*\"]', '2022-05-30 02:08:46', '2022-05-30 01:20:13', '2022-05-30 02:08:46');
INSERT INTO `personal_access_tokens` VALUES (129, 'App\\Models\\User', 1, 'Apptoken', '1f5698b81582d86b2d86f637e5f2222acf8faf694e70bd5ca395de390c1f819d', '[\"*\"]', '2022-05-30 02:21:03', '2022-05-30 02:20:59', '2022-05-30 02:21:03');
INSERT INTO `personal_access_tokens` VALUES (130, 'App\\Models\\User', 1, 'Apptoken', '6c1467a597f6743faf6e531b684a7da5825dec75fb663eed209e6a7e182b2647', '[\"*\"]', '2022-05-30 10:52:33', '2022-05-30 06:33:37', '2022-05-30 10:52:33');
INSERT INTO `personal_access_tokens` VALUES (131, 'App\\Models\\User', 1, 'Apptoken', 'd3bec1b6e81b08d65af8902eed9139086b1aa41630604bad1f40109798edb10b', '[\"*\"]', '2022-05-30 13:51:09', '2022-05-30 13:50:21', '2022-05-30 13:51:09');
INSERT INTO `personal_access_tokens` VALUES (132, 'App\\Models\\User', 1, 'Apptoken', '6ea7fb39b5c3ce6acd8983debb14688e30216ec0af7bb7d2aef891b6fcf44056', '[\"*\"]', '2022-05-31 03:49:39', '2022-05-31 01:02:51', '2022-05-31 03:49:39');
INSERT INTO `personal_access_tokens` VALUES (133, 'App\\Models\\User', 1, 'Apptoken', '6f111715a079d92654773c248d77d50f5cd97cfb5e43bd15b21115305b7b3bfd', '[\"*\"]', '2022-05-31 07:22:48', '2022-05-31 07:09:13', '2022-05-31 07:22:48');
INSERT INTO `personal_access_tokens` VALUES (134, 'App\\Models\\User', 1, 'Apptoken', '3292a073d391ca8f72eb1e515c3eeabf021793fd05587b01ffe064a78b6e71f4', '[\"*\"]', '2022-05-31 07:10:47', '2022-05-31 07:09:43', '2022-05-31 07:10:47');
INSERT INTO `personal_access_tokens` VALUES (135, 'App\\Models\\User', 1, 'Apptoken', 'd9668522e5cb0516f8e490af693219f5a314c5d20ee05c8227cf3d41c0869f71', '[\"*\"]', '2022-05-31 00:36:22', '2022-05-31 00:34:21', '2022-05-31 00:36:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 5, '316466814841', 'a3s', 'A3S', 'LCD OPPO', 'undefined', '1651156393.jpg', 12.5, '2022-04-13 07:59:33', '2022-05-25 20:51:06', NULL);
INSERT INTO `products` VALUES (2, 5, '571501119594', 'a1k', 'A1K', 'LCD OPPO', 'undefined', 'no image created', 11, '2022-04-13 08:00:23', '2022-05-12 02:29:35', NULL);
INSERT INTO `products` VALUES (3, 5, '908601349849', 'a5s', 'A5S', 'LCD OPPO', 'undefined', 'no image created', 12.5, '2022-04-13 08:00:52', '2022-05-25 20:52:02', NULL);
INSERT INTO `products` VALUES (4, 5, '908601349850', 'a15', 'A15', 'LCD OPPO', 'undefined', 'no image created', 14, '2022-04-13 08:00:52', '2022-05-25 20:58:35', NULL);
INSERT INTO `products` VALUES (5, 5, '908601349851', 'f9', 'F9', 'LCD OPPO', 'undefined', 'no image created', 15, '2022-04-13 08:00:52', '2022-05-15 14:32:00', NULL);
INSERT INTO `products` VALUES (6, 5, '908601349852', 'c3 ori', 'C3 ORI', 'LCD REALME', 'undefined', 'no image created', 16, '2022-04-13 08:00:52', '2022-05-15 14:31:24', NULL);
INSERT INTO `products` VALUES (7, 5, '908601349853', 'y12', 'Y12', 'LCD VIVO', 'undefined', 'no image created', 13.8, '2022-04-13 08:00:52', '2022-05-25 20:53:03', NULL);
INSERT INTO `products` VALUES (8, 5, '908601349854', 'y12s', 'Y12S', 'LCD VIVO', 'undefined', 'no image created', 13.8, '2022-04-13 08:00:52', '2022-05-25 20:52:55', NULL);
INSERT INTO `products` VALUES (9, 5, '908601349855', 'y91', 'Y91', 'LCD VIVO', 'undefined', 'no image created', 12, '2022-04-13 08:00:52', '2022-05-25 21:00:57', NULL);
INSERT INTO `products` VALUES (10, 5, '908601349856', 'y19', 'Y19', 'LCD VIVO', 'undefined', 'no image created', 19.5, '2022-04-13 08:00:52', '2022-05-15 14:33:24', NULL);
INSERT INTO `products` VALUES (11, 5, '908601349857', 'f11pro ori', 'F11PRO ORI', 'LCD OPPO', 'undefined', 'no image created', 20.5, '2022-04-13 08:00:52', '2022-05-17 10:07:28', NULL);
INSERT INTO `products` VALUES (12, 5, '908601349858', 'a53 ori', 'A53 ORI', 'LCD OPPO', 'undefined', 'no image created', 21, '2022-04-13 08:00:52', '2022-05-12 02:34:11', NULL);
INSERT INTO `products` VALUES (13, 5, '908601349859', 'reno2f', 'RENO2F', 'LCD OPPO', 'undefined', 'no image created', 18.5, '2022-04-13 08:00:52', '2022-05-16 06:36:57', NULL);
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
INSERT INTO `products` VALUES (24, 5, '908601349870', 'a5s ori', 'A5S ORI', 'LCD OPPO', 'undefined', 'no image created', 15.5, '2022-04-13 08:00:52', '2022-05-25 20:52:14', NULL);
INSERT INTO `products` VALUES (25, 5, '908601349871', 'a52 ori', 'A52 ORI', 'LCD OPPO', 'undefined', 'no image created', 19.5, '2022-04-13 08:00:52', '2022-05-12 02:33:35', NULL);
INSERT INTO `products` VALUES (26, 5, '908601349872', 'y12s ori', 'Y12S ORI', 'LCD VIVO', 'undefined', 'no image created', 15.5, '2022-04-13 08:00:52', '2022-05-16 06:36:29', NULL);
INSERT INTO `products` VALUES (27, 5, '908601349873', 'a53', 'A53', 'LCD OPPO', 'undefined', 'no image created', 18, '2022-04-13 08:00:52', '2022-05-15 14:30:29', NULL);
INSERT INTO `products` VALUES (28, 5, '908601349874', 'f11pro', 'F11PRO', 'LCD OPPO', 'undefined', 'no image created', 18, '2022-04-13 08:00:52', '2022-05-12 02:57:50', NULL);
INSERT INTO `products` VALUES (32, 5, '908601349878', 'c3', 'C3', 'LCD REALME', 'undefined', 'no image created', 14, '2022-04-13 08:00:52', '2022-05-12 02:40:22', NULL);
INSERT INTO `products` VALUES (33, 5, '908601349879', 'y30 ori', 'Y30 ORI', 'LCD VIVO', 'undefined', 'no image created', 23, '2022-04-13 08:00:52', '2022-05-15 14:34:01', NULL);
INSERT INTO `products` VALUES (34, 5, '908601349880', 'f7', 'F7', 'LCD OPPO', 'undefined', 'no image created', 16, '2022-04-01 02:25:50', '2022-05-15 14:31:48', NULL);
INSERT INTO `products` VALUES (35, 5, '908601349881', 'y81', 'Y81', 'LCD VIVO', 'undefined', 'no image created', 13.5, '2022-04-01 02:25:50', '2022-05-15 14:34:15', NULL);
INSERT INTO `products` VALUES (36, 5, '908601349882', 'y85', 'Y85', 'LCD VIVO', 'undefined', 'no image created', 16.5, '2022-04-01 02:25:50', '2022-05-25 21:02:35', NULL);
INSERT INTO `products` VALUES (37, 5, '908601349883', 'a54 ori', 'A54 ORI', 'LCD OPPO', 'undefined', 'no image created', 21.5, '2022-04-01 02:25:50', '2022-05-12 02:34:41', NULL);
INSERT INTO `products` VALUES (38, 5, '908601349884', 'a15 ori', 'A15 ORI', 'LCD OPPO', 'undefined', 'no image created', 15.5, '2022-04-01 02:25:50', '2022-05-25 20:59:08', NULL);
INSERT INTO `products` VALUES (39, 5, '908601349885', '6p w', '6P W', 'LCD IPHONE', 'undefined', 'no image created', 13.5, '2022-04-01 02:25:50', '2022-05-12 02:22:41', NULL);
INSERT INTO `products` VALUES (40, 5, '908601349886', '6p b', '6P B', 'LCD IPHONE', 'undefined', 'no image created', 13.5, '2022-04-01 02:25:50', '2022-05-12 02:22:20', NULL);
INSERT INTO `products` VALUES (41, 5, '908601349887', 'pova1', 'POVA1', 'LCD POVA', 'undefined', 'no image created', 19, '2022-04-01 02:25:50', '2022-05-16 08:30:30', NULL);
INSERT INTO `products` VALUES (42, 5, '908601349888', 'pova2', 'POVA2', 'LCD POVA', 'undefined', 'no image created', 22, '2022-04-01 02:25:50', '2022-05-12 02:43:10', NULL);
INSERT INTO `products` VALUES (43, 5, '143565364348', '7p w', '7P W', 'LCD IPHONE', 'null', 'no image created', 14.5, '2022-04-30 02:43:18', '2022-05-12 02:23:53', NULL);
INSERT INTO `products` VALUES (44, 5, '441083965829', 'xs max oled', 'Xs MAX OLED', 'LCD IPHONE', 'undefined', 'no image created', 59, '2022-04-30 02:44:54', '2022-05-16 06:37:08', NULL);
INSERT INTO `products` VALUES (45, 5, '108960149410', 'A16', 'A16', 'LCD OPPO', 'null', 'no image created', 17, '2022-05-04 01:02:00', '2022-05-15 14:20:30', NULL);
INSERT INTO `products` VALUES (46, 5, '680278947227', 'C11 2021', 'C11 2021', 'LCD REALME', 'null', 'no image created', 17, '2022-05-04 01:16:26', '2022-05-12 02:36:57', NULL);
INSERT INTO `products` VALUES (47, 5, '163793124994', 'Y21', 'Y21', 'LCD VIVO', 'undefined', 'no image created', 17, '2022-05-04 01:17:45', '2022-05-12 02:47:44', NULL);
INSERT INTO `products` VALUES (51, 5, '409509970859', 'A3S ORI', 'A3S ORI', 'LCD OPPO', 'undefined', 'no image created', 15.5, '2022-05-04 01:31:56', '2022-05-25 20:51:19', NULL);
INSERT INTO `products` VALUES (53, 5, '672931669645', 'C15', 'C15', 'LCD REALME', 'undefined', 'no image created', 14, '2022-05-04 08:41:15', '2022-05-16 06:36:07', NULL);
INSERT INTO `products` VALUES (54, 5, '597519322139', NULL, 'Y71 B', 'LCD VIVO', NULL, 'no image created', 15, '2022-05-15 13:40:34', '2022-05-15 13:40:34', NULL);
INSERT INTO `products` VALUES (55, 5, '700595761489', NULL, 'Y71 W', 'LCD VIVO', NULL, 'no image created', 15, '2022-05-15 13:54:19', '2022-05-15 13:54:19', NULL);
INSERT INTO `products` VALUES (56, 5, '134068185103', NULL, 'Xs JK', 'LCD IPHONE', 'undefined', 'no image created', 36, '2022-05-15 13:56:19', '2022-05-15 13:56:19', NULL);
INSERT INTO `products` VALUES (57, 5, '119454641103', NULL, '11 JK', 'LCD IPHONE', 'undefined', 'no image created', 43, '2022-05-15 13:57:06', '2022-05-15 13:57:06', NULL);
INSERT INTO `products` VALUES (58, 5, '509358742384', NULL, 'S1', 'LCD VIVO', 'undefined', 'no image created', 17.5, '2022-05-16 06:33:57', '2022-05-16 06:33:57', NULL);
INSERT INTO `products` VALUES (59, 5, '310235118327', NULL, 'A52', 'LCD OPPO', 'null', 'no image created', 17.5, '2022-05-25 20:21:52', '2022-05-25 20:51:36', NULL);
INSERT INTO `products` VALUES (60, 5, '293823743516', NULL, '6', 'LCD REALME', 'undefined', 'no image created', 20, '2022-05-25 20:23:31', '2022-05-25 20:46:46', NULL);
INSERT INTO `products` VALUES (61, 5, '555254924564', NULL, '6A B', 'LCD REDMI', 'null', 'no image created', 11, '2022-05-27 13:02:45', '2022-05-28 06:37:28', NULL);
INSERT INTO `products` VALUES (62, 5, '478248065370', NULL, 'A11', 'LCD SAMSUNG', 'undefined', 'no image created', 18, '2022-05-27 13:04:06', '2022-05-28 06:37:46', NULL);
INSERT INTO `products` VALUES (63, 5, '232976910064', NULL, 'A02S', 'LCD SAMSUNG', 'undefined', 'no image created', 16.5, '2022-05-27 13:04:42', '2022-05-28 06:38:05', NULL);
INSERT INTO `products` VALUES (64, 5, '412014077396', NULL, 'A21S', 'LCD SAMSUNG', 'undefined', 'no image created', 17, '2022-05-27 13:05:05', '2022-05-28 06:38:18', NULL);
INSERT INTO `products` VALUES (65, 5, '124142271060', NULL, 'J4P', 'LCD SAMSUNG', 'undefined', 'no image created', 14, '2022-05-27 13:05:32', '2022-05-28 06:38:32', NULL);
INSERT INTO `products` VALUES (66, 5, '122598239646', NULL, 'Y9 2019', 'LCD HUAWEI', 'undefined', 'no image created', 24, '2022-05-27 13:06:34', '2022-05-28 06:38:49', NULL);
INSERT INTO `products` VALUES (67, 5, '244312071129', NULL, 'Y6P', 'LCD HUAWEI', 'undefined', 'no image created', 17, '2022-05-27 13:07:12', '2022-05-28 06:39:01', NULL);
INSERT INTO `products` VALUES (68, 5, '302371121307', NULL, 'A10', 'LCD SAMSUNG', 'undefined', 'no image created', 13, '2022-05-27 13:07:32', '2022-05-28 06:39:17', NULL);
INSERT INTO `products` VALUES (69, 5, '989791238864', NULL, 'A12', 'LCD SAMSUNG', 'undefined', 'no image created', 16, '2022-05-27 13:07:48', '2022-05-28 06:39:29', NULL);
INSERT INTO `products` VALUES (70, 5, '780385962419', NULL, 'A20S', 'LCD SAMSUNG', 'undefined', 'no image created', 16.5, '2022-05-27 13:08:11', '2022-05-28 06:39:42', NULL);
INSERT INTO `products` VALUES (71, 5, '444525050465', NULL, 'A30', 'LCD SAMSUNG', 'undefined', 'no image created', 17.5, '2022-05-27 13:08:32', '2022-05-28 06:39:54', NULL);
INSERT INTO `products` VALUES (72, 5, '576587595348', NULL, 'NOVA 3I', 'LCD HUAWEI', 'undefined', 'no image created', 17, '2022-05-27 13:09:05', '2022-05-28 06:40:12', NULL);
INSERT INTO `products` VALUES (73, 5, '679240813902', NULL, 'Y9 PRIME 2019', 'LCD HUAWEI', 'undefined', 'no image created', 25, '2022-05-27 13:09:58', '2022-05-28 06:40:29', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `purchase_details` VALUES (108, 18, 54, 13.00, 30.00, '2022-05-15 13:51:59', '2022-05-15 13:51:59', NULL);
INSERT INTO `purchase_details` VALUES (109, 19, 2, 9.50, 200.00, '2022-05-15 14:00:35', '2022-05-15 14:00:35', NULL);
INSERT INTO `purchase_details` VALUES (110, 20, 33, 20.50, 100.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (111, 20, 55, 13.00, 30.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (112, 20, 4, 12.00, 300.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (113, 20, 5, 12.00, 100.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (114, 20, 34, 14.00, 100.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (115, 20, 45, 14.50, 50.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (116, 20, 27, 15.60, 200.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (117, 20, 7, 12.90, 300.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (118, 20, 28, 15.80, 100.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (119, 20, 35, 10.90, 100.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (120, 20, 22, 8.90, 100.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (121, 20, 23, 8.90, 100.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (122, 20, 16, 34.00, 50.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (123, 20, 56, 31.00, 10.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (124, 20, 57, 32.00, 10.00, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchase_details` VALUES (125, 21, 41, 16.40, 50.00, '2022-05-16 06:32:57', '2022-05-16 06:32:57', NULL);
INSERT INTO `purchase_details` VALUES (126, 21, 53, 11.80, 150.00, '2022-05-16 06:32:57', '2022-05-16 06:32:57', NULL);
INSERT INTO `purchase_details` VALUES (127, 21, 26, 13.40, 200.00, '2022-05-16 06:32:57', '2022-05-16 06:32:57', NULL);
INSERT INTO `purchase_details` VALUES (128, 21, 13, 16.00, 100.00, '2022-05-16 06:32:57', '2022-05-16 06:32:57', NULL);
INSERT INTO `purchase_details` VALUES (129, 21, 44, 52.00, 20.00, '2022-05-16 06:32:57', '2022-05-16 06:32:57', NULL);
INSERT INTO `purchase_details` VALUES (130, 22, 58, 15.20, 30.00, '2022-05-16 06:35:02', '2022-05-16 06:35:02', NULL);
INSERT INTO `purchase_details` VALUES (131, 23, 24, 13.20, 10.00, '2022-05-17 10:04:19', '2022-05-17 10:04:19', NULL);
INSERT INTO `purchase_details` VALUES (132, 23, 38, 13.40, 200.00, '2022-05-17 10:04:19', '2022-05-17 10:04:19', NULL);
INSERT INTO `purchase_details` VALUES (133, 23, 11, 18.00, 150.00, '2022-05-17 10:04:19', '2022-05-17 10:04:19', NULL);
INSERT INTO `purchase_details` VALUES (134, 24, 1, 11.00, 360.00, '2022-05-19 12:59:59', '2022-05-19 12:59:59', NULL);
INSERT INTO `purchase_details` VALUES (135, 25, 24, 13.20, 190.00, '2022-05-22 13:18:47', '2022-05-22 13:18:47', NULL);
INSERT INTO `purchase_details` VALUES (136, 26, 59, 15.30, 100.00, '2022-05-25 20:38:28', '2022-05-25 20:38:28', NULL);
INSERT INTO `purchase_details` VALUES (137, 26, 60, 17.00, 20.00, '2022-05-25 20:38:28', '2022-05-25 20:38:28', NULL);
INSERT INTO `purchase_details` VALUES (138, 26, 12, 18.80, 99.00, '2022-05-25 20:38:28', '2022-05-25 20:38:28', NULL);
INSERT INTO `purchase_details` VALUES (139, 26, 3, 11.00, 360.00, '2022-05-25 20:38:28', '2022-05-25 20:38:28', NULL);
INSERT INTO `purchase_details` VALUES (140, 26, 39, 11.20, 170.00, '2022-05-25 20:38:28', '2022-05-25 20:38:28', NULL);
INSERT INTO `purchase_details` VALUES (141, 26, 51, 13.40, 360.00, '2022-05-25 20:38:28', '2022-05-25 20:38:28', NULL);
INSERT INTO `purchase_details` VALUES (142, 27, 51, 13.50, 360.00, '2022-05-26 17:05:51', '2022-05-27 02:51:10', '2022-05-27 02:51:10');
INSERT INTO `purchase_details` VALUES (143, 28, 61, 9.00, 30.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (144, 28, 62, 9.00, 30.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (145, 28, 63, 9.00, 30.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (146, 28, 64, 9.00, 30.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (147, 28, 65, 9.00, 50.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (148, 28, 66, 9.00, 20.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (149, 28, 67, 9.00, 20.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (150, 28, 68, 9.00, 30.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (151, 28, 69, 9.00, 30.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (152, 28, 70, 9.00, 20.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (153, 28, 71, 9.00, 30.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (154, 28, 72, 9.00, 20.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `purchase_details` VALUES (155, 28, 73, 9.00, 20.00, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES (17, 'P-2205140001', 1, 1, 1, '20220514_v12__6_1652504818137', 34644.6, 0, 34644.6, '2022-05-14 05:21:18', '2022-05-14 05:21:18', NULL);
INSERT INTO `purchases` VALUES (18, 'P-2205150002', 1, 1, 1, '20220515_v20__51_1652622692980', 390, 0, 390, '2022-05-15 13:51:59', '2022-05-15 13:51:59', NULL);
INSERT INTO `purchases` VALUES (19, 'P-2205150003', 1, 1, 1, '20220515_v20__53_1652622781824', 1900, 0, 1900, '2022-05-15 14:00:35', '2022-05-15 14:00:35', NULL);
INSERT INTO `purchases` VALUES (20, 'P-2205150004', 1, 1, 1, '20220515_v21__2_1652623328254', 23135, 0, 23135, '2022-05-15 14:15:54', '2022-05-15 14:15:54', NULL);
INSERT INTO `purchases` VALUES (21, 'P-2205160005', 1, 1, 1, '20220516_v13__23_1652682203513', 7910, 0, 7910, '2022-05-16 06:32:57', '2022-05-16 06:32:57', NULL);
INSERT INTO `purchases` VALUES (22, 'P-2205160006', 1, 1, 1, '20220516_v13__34_1652682856226', 456, 0, 456, '2022-05-16 06:35:02', '2022-05-16 06:35:02', NULL);
INSERT INTO `purchases` VALUES (23, 'P-2205170007', 1, 1, 1, '20220517_v16__3_1652778219429', 5512, 0, 5512, '2022-05-17 10:04:19', '2022-05-17 10:04:19', NULL);
INSERT INTO `purchases` VALUES (24, 'P-2205190008', 1, 1, 1, '20220519_v19__58_1652965139720', 3960, 0, 3960, '2022-05-19 12:59:59', '2022-05-19 12:59:59', NULL);
INSERT INTO `purchases` VALUES (25, 'P-2205220009', 1, 1, 1, '20220522_v13__17_1653200264804', 2508, 0, 2508, '2022-05-22 13:18:47', '2022-05-22 13:18:47', NULL);
INSERT INTO `purchases` VALUES (26, 'P-2205250010', 1, 1, 1, '20220525_v20__24_1653485049718', 14419.2, 0, 14419.2, '2022-05-25 20:38:28', '2022-05-25 20:38:28', NULL);
INSERT INTO `purchases` VALUES (27, 'P-2205260011', 1, 1, 1, '20220526_v17__3_1653559425704', 4860, 0, 4860, '2022-05-26 17:05:51', '2022-05-27 02:51:10', '2022-05-27 02:51:10');
INSERT INTO `purchases` VALUES (28, 'P-2205270012', 1, 1, 1, '20220527_v20__11_1653657063006', 3240, 0, 3240, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);

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
INSERT INTO `sessions` VALUES ('9Ei4il51z4iIYShnWiLUl8c5Xd75VmUdPN1jtXmm', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2E5czJ3T2tmQkl2Zk54RlBPQk5BZGtJU003bGRvaHJ0NDVNWDhKVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1653619771);
INSERT INTO `sessions` VALUES ('D0fXlE1YCXUqdZliiiI6xmewNKZ41o77RifZW8tZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM09IQmszeU1MSGNDZ0xXMnpzdHhrdG5aa1VFeDVzdTBCaE1ZUUJwSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kb2NzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1650961907);
INSERT INTO `sessions` VALUES ('IElfFXykYjmJYzlNwuQebs3U7SNEnEe7zVdi4l5p', NULL, '144.48.139.252', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienNCN3BBdkZHWnkwaE42QzIxTjFFRko1RE1ranh4cEdGcjdrWWoyZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xNjcuNzEuMTEuMTM1L2RvY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653454048);

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
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stocks
-- ----------------------------
INSERT INTO `stocks` VALUES (46, 1, 17, 0.00, 1, '2022-05-13 02:03:19', '2022-05-27 13:22:38', NULL);
INSERT INTO `stocks` VALUES (47, 1, 23, 0.00, 52, '2022-05-13 02:03:19', '2022-05-30 01:30:32', NULL);
INSERT INTO `stocks` VALUES (48, 1, 22, 0.00, 47, '2022-05-13 02:03:19', '2022-05-30 01:30:32', NULL);
INSERT INTO `stocks` VALUES (49, 1, 40, 0.00, -20, '2022-05-13 02:03:19', '2022-05-31 07:16:19', NULL);
INSERT INTO `stocks` VALUES (50, 1, 39, 0.00, 115, '2022-05-13 02:03:19', '2022-05-28 06:24:41', NULL);
INSERT INTO `stocks` VALUES (51, 1, 21, 0.00, 17, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (52, 1, 18, 0.00, 0, '2022-05-13 02:03:19', '2022-05-23 19:07:04', NULL);
INSERT INTO `stocks` VALUES (53, 1, 43, 0.00, 53, '2022-05-13 02:03:19', '2022-05-28 06:41:47', NULL);
INSERT INTO `stocks` VALUES (54, 1, 20, 0.00, 28, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (55, 1, 19, 0.00, 14, '2022-05-13 02:03:19', '2022-05-26 11:00:10', NULL);
INSERT INTO `stocks` VALUES (56, 1, 4, 0.00, 48, '2022-05-13 02:03:19', '2022-05-31 03:32:51', NULL);
INSERT INTO `stocks` VALUES (57, 1, 38, 0.00, 16, '2022-05-13 02:03:19', '2022-05-27 13:23:43', NULL);
INSERT INTO `stocks` VALUES (58, 1, 45, 0.00, 25, '2022-05-13 02:03:19', '2022-05-30 01:30:32', NULL);
INSERT INTO `stocks` VALUES (59, 1, 2, 0.00, 30, '2022-05-13 02:03:19', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (60, 1, 1, 0.00, 26, '2022-05-13 02:03:19', '2022-05-31 03:32:51', NULL);
INSERT INTO `stocks` VALUES (61, 1, 51, 0.00, 230, '2022-05-13 02:03:19', '2022-05-31 03:34:42', NULL);
INSERT INTO `stocks` VALUES (62, 1, 25, 0.00, 0, '2022-05-13 02:03:19', '2022-05-13 02:03:19', NULL);
INSERT INTO `stocks` VALUES (63, 1, 27, 0.00, 141, '2022-05-13 02:03:19', '2022-05-26 11:00:10', NULL);
INSERT INTO `stocks` VALUES (64, 1, 12, 0.00, 30, '2022-05-13 02:03:19', '2022-05-31 03:34:42', NULL);
INSERT INTO `stocks` VALUES (65, 1, 37, 0.00, 83, '2022-05-13 02:03:19', '2022-05-22 17:00:07', NULL);
INSERT INTO `stocks` VALUES (66, 1, 3, 0.00, 30, '2022-05-13 02:03:19', '2022-05-31 07:16:19', NULL);
INSERT INTO `stocks` VALUES (67, 1, 24, 0.00, 86, '2022-05-13 02:03:19', '2022-05-30 09:13:44', NULL);
INSERT INTO `stocks` VALUES (68, 1, 15, 0.00, 43, '2022-05-13 02:03:19', '2022-05-26 17:03:13', NULL);
INSERT INTO `stocks` VALUES (69, 1, 14, 0.00, 47, '2022-05-13 02:03:19', '2022-05-26 17:03:13', NULL);
INSERT INTO `stocks` VALUES (70, 1, 46, 0.00, 7, '2022-05-13 02:03:19', '2022-05-18 10:52:05', NULL);
INSERT INTO `stocks` VALUES (71, 1, 32, 0.00, 282, '2022-05-13 02:03:19', '2022-05-31 03:32:51', NULL);
INSERT INTO `stocks` VALUES (72, 1, 6, 0.00, 56, '2022-05-13 02:03:19', '2022-05-31 03:34:42', NULL);
INSERT INTO `stocks` VALUES (73, 1, 28, 0.00, 10, '2022-05-13 02:03:19', '2022-05-28 06:24:41', NULL);
INSERT INTO `stocks` VALUES (74, 1, 11, 0.00, 25, '2022-05-13 02:03:19', '2022-05-31 03:34:42', NULL);
INSERT INTO `stocks` VALUES (75, 1, 34, 0.00, 28, '2022-05-13 02:03:19', '2022-05-27 13:22:38', NULL);
INSERT INTO `stocks` VALUES (76, 1, 5, 0.00, 0, '2022-05-13 02:03:19', '2022-05-30 09:13:44', NULL);
INSERT INTO `stocks` VALUES (77, 1, 41, 0.00, 31, '2022-05-13 02:03:19', '2022-05-27 13:23:43', NULL);
INSERT INTO `stocks` VALUES (78, 1, 42, 0.00, 2, '2022-05-13 02:03:19', '2022-05-25 08:32:55', NULL);
INSERT INTO `stocks` VALUES (79, 1, 13, 0.00, 39, '2022-05-13 02:03:19', '2022-05-30 01:30:32', NULL);
INSERT INTO `stocks` VALUES (80, 1, 16, 0.00, 11, '2022-05-13 02:03:19', '2022-05-26 10:29:11', NULL);
INSERT INTO `stocks` VALUES (81, 1, 44, 0.00, 0, '2022-05-13 02:03:19', '2022-05-27 13:22:38', NULL);
INSERT INTO `stocks` VALUES (82, 1, 7, 0.00, 0, '2022-05-13 02:03:19', '2022-05-31 03:32:51', NULL);
INSERT INTO `stocks` VALUES (83, 1, 8, 0.00, 105, '2022-05-13 02:03:19', '2022-05-31 00:36:22', NULL);
INSERT INTO `stocks` VALUES (84, 1, 26, 0.00, 0, '2022-05-13 02:03:19', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (85, 1, 10, 0.00, 55, '2022-05-13 02:03:19', '2022-05-25 08:30:15', NULL);
INSERT INTO `stocks` VALUES (86, 1, 47, 0.00, 28, '2022-05-13 02:03:19', '2022-05-25 08:30:15', NULL);
INSERT INTO `stocks` VALUES (87, 1, 33, 0.00, 15, '2022-05-13 02:03:19', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (88, 1, 35, 0.00, 18, '2022-05-13 02:03:19', '2022-05-27 13:22:38', NULL);
INSERT INTO `stocks` VALUES (89, 1, 36, 0.00, 40, '2022-05-13 02:03:19', '2022-05-27 13:22:38', NULL);
INSERT INTO `stocks` VALUES (90, 1, 9, 0.00, -10, '2022-05-13 02:03:19', '2022-05-31 03:32:51', NULL);
INSERT INTO `stocks` VALUES (91, 1, 54, 0.00, 0, '2022-05-15 13:51:59', '2022-05-22 17:00:07', NULL);
INSERT INTO `stocks` VALUES (92, 1, 55, 0.00, 0, '2022-05-15 14:15:54', '2022-05-22 17:00:07', NULL);
INSERT INTO `stocks` VALUES (93, 1, 56, 0.00, 6, '2022-05-15 14:15:54', '2022-05-25 16:07:11', NULL);
INSERT INTO `stocks` VALUES (94, 1, 57, 0.00, 0, '2022-05-15 14:15:54', '2022-05-26 11:00:10', NULL);
INSERT INTO `stocks` VALUES (95, 1, 53, 0.00, 10, '2022-05-16 06:32:57', '2022-05-28 06:24:41', NULL);
INSERT INTO `stocks` VALUES (96, 1, 58, 0.00, 0, '2022-05-16 06:35:02', '2022-05-27 13:23:43', NULL);
INSERT INTO `stocks` VALUES (97, 1, 59, 0.00, 80, '2022-05-25 20:38:28', '2022-05-28 06:24:41', NULL);
INSERT INTO `stocks` VALUES (98, 1, 60, 0.00, 12, '2022-05-25 20:38:28', '2022-05-31 03:34:42', NULL);
INSERT INTO `stocks` VALUES (99, 1, 61, 0.00, 30, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `stocks` VALUES (100, 1, 62, 0.00, 15, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (101, 1, 63, 0.00, 15, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (102, 1, 64, 0.00, 15, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (103, 1, 65, 0.00, 35, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (104, 1, 66, 0.00, 20, '2022-05-27 13:16:24', '2022-05-27 13:16:24', NULL);
INSERT INTO `stocks` VALUES (105, 1, 67, 0.00, 10, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (106, 1, 68, 0.00, 5, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (107, 1, 69, 0.00, 5, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (108, 1, 70, 0.00, 10, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (109, 1, 71, 0.00, 15, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (110, 1, 72, 0.00, 10, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);
INSERT INTO `stocks` VALUES (111, 1, 73, 0.00, 15, '2022-05-27 13:16:24', '2022-05-30 01:39:29', NULL);

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
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `paid` double NOT NULL,
  `pay_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transactions_order_id_foreign`(`order_id`) USING BTREE,
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
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

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

 Date: 29/04/2022 14:23:40
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
) ENGINE = InnoDB AUTO_INCREMENT = 454 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
INSERT INTO `activity_log` VALUES (1, 'default', 'created', 'App\\Models\\Supplier', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"None\",\"address\":\"Phnom Penh\",\"email\":\"test@test.com\",\"phone\":\"888888\"}}', '2022-04-26 06:00:10', '2022-04-26 06:00:10');
INSERT INTO `activity_log` VALUES (2, 'default', 'created', 'App\\Models\\Purchase', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220426_v12__59_1650952763563\",\"subtotal\":14978,\"vat\":null,\"grandtotal\":14978}}', '2022-04-26 06:01:03', '2022-04-26 06:01:03');
INSERT INTO `activity_log` VALUES (3, 'default', 'created', 'App\\Models\\PurchaseDetail', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":1,\"product_id\":1,\"unitprice\":\"11.30\",\"quantity\":\"560.00\"}}', '2022-04-26 06:01:03', '2022-04-26 06:01:03');
INSERT INTO `activity_log` VALUES (4, 'default', 'created', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":560}}', '2022-04-26 06:01:03', '2022-04-26 06:01:03');
INSERT INTO `activity_log` VALUES (5, 'default', 'created', 'App\\Models\\PurchaseDetail', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":1,\"product_id\":2,\"unitprice\":\"10.00\",\"quantity\":\"300.00\"}}', '2022-04-26 06:01:03', '2022-04-26 06:01:03');
INSERT INTO `activity_log` VALUES (6, 'default', 'created', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":300}}', '2022-04-26 06:01:03', '2022-04-26 06:01:03');
INSERT INTO `activity_log` VALUES (7, 'default', 'created', 'App\\Models\\PurchaseDetail', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":1,\"product_id\":3,\"unitprice\":\"11.30\",\"quantity\":\"500.00\"}}', '2022-04-26 06:01:03', '2022-04-26 06:01:03');
INSERT INTO `activity_log` VALUES (8, 'default', 'created', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":500}}', '2022-04-26 06:01:03', '2022-04-26 06:01:03');
INSERT INTO `activity_log` VALUES (9, 'default', 'created', 'App\\Models\\Purchase', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"supplier_id\":1,\"user_id\":1,\"batch\":\"20220426_v13__4_1650953077518\",\"subtotal\":54670,\"vat\":null,\"grandtotal\":54670}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (10, 'default', 'created', 'App\\Models\\PurchaseDetail', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":4,\"unitprice\":\"13.00\",\"quantity\":\"500.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (11, 'default', 'created', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":500}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (12, 'default', 'created', 'App\\Models\\PurchaseDetail', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":5,\"unitprice\":\"15.80\",\"quantity\":\"200.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (13, 'default', 'created', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":200}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (14, 'default', 'created', 'App\\Models\\PurchaseDetail', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":6,\"unitprice\":\"16.30\",\"quantity\":\"200.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (15, 'default', 'created', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":200}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (16, 'default', 'created', 'App\\Models\\PurchaseDetail', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":7,\"unitprice\":\"13.30\",\"quantity\":\"300.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (17, 'default', 'created', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":300}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (18, 'default', 'created', 'App\\Models\\PurchaseDetail', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":8,\"unitprice\":\"13.00\",\"quantity\":\"200.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (19, 'default', 'created', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":200}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (20, 'default', 'created', 'App\\Models\\PurchaseDetail', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":9,\"unitprice\":\"11.00\",\"quantity\":\"400.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (21, 'default', 'created', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":400}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (22, 'default', 'created', 'App\\Models\\PurchaseDetail', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":10,\"unitprice\":\"18.00\",\"quantity\":\"250.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (23, 'default', 'created', 'App\\Models\\Stock', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":250}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (24, 'default', 'created', 'App\\Models\\PurchaseDetail', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":11,\"unitprice\":\"19.50\",\"quantity\":\"100.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (25, 'default', 'created', 'App\\Models\\Stock', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":100}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (26, 'default', 'created', 'App\\Models\\PurchaseDetail', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":12,\"unitprice\":\"19.20\",\"quantity\":\"100.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (27, 'default', 'created', 'App\\Models\\Stock', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":100}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (28, 'default', 'created', 'App\\Models\\PurchaseDetail', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":13,\"unitprice\":\"20.00\",\"quantity\":\"50.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (29, 'default', 'created', 'App\\Models\\Stock', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":50}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (30, 'default', 'created', 'App\\Models\\PurchaseDetail', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":14,\"unitprice\":\"13.70\",\"quantity\":\"100.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (31, 'default', 'created', 'App\\Models\\Stock', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":100}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (32, 'default', 'created', 'App\\Models\\PurchaseDetail', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":15,\"unitprice\":\"13.70\",\"quantity\":\"100.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (33, 'default', 'created', 'App\\Models\\Stock', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":100}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (34, 'default', 'created', 'App\\Models\\PurchaseDetail', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":16,\"unitprice\":\"34.60\",\"quantity\":\"500.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (35, 'default', 'created', 'App\\Models\\Stock', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":500}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (36, 'default', 'created', 'App\\Models\\PurchaseDetail', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"purchase_id\":2,\"product_id\":17,\"unitprice\":\"67.50\",\"quantity\":\"20.00\"}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (37, 'default', 'created', 'App\\Models\\Stock', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":20}}', '2022-04-26 06:42:00', '2022-04-26 06:42:00');
INSERT INTO `activity_log` VALUES (38, 'default', 'created', 'App\\Models\\Balance', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"0.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"10.00\",\"balance_date\":\"2022-04-26\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-26 08:49:06', '2022-04-26 08:49:06');
INSERT INTO `activity_log` VALUES (39, 'default', 'created', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"10.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 08:51:58', '2022-04-28 08:51:58');
INSERT INTO `activity_log` VALUES (40, 'default', 'created', 'App\\Models\\Order', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":6295,\"vat\":0,\"discount\":0,\"grandtotal\":6295,\"kh_grandtotal\":null}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (41, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"6295.00\",\"withdraw\":\"0.00\",\"balance\":\"6305.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"0.00\",\"withdraw\":\"0.00\",\"balance\":\"10.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (42, 'default', 'created', 'App\\Models\\OrderDetail', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":17,\"sellprice\":80,\"quantity\":\"6.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (43, 'default', 'updated', 'App\\Models\\Stock', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":14},\"old\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":20}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (44, 'default', 'created', 'App\\Models\\OrderDetail', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":23,\"sellprice\":11,\"quantity\":\"50.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (45, 'default', 'updated', 'App\\Models\\Stock', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (46, 'default', 'created', 'App\\Models\\OrderDetail', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":22,\"sellprice\":11,\"quantity\":\"30.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (47, 'default', 'updated', 'App\\Models\\Stock', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (48, 'default', 'created', 'App\\Models\\OrderDetail', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (49, 'default', 'updated', 'App\\Models\\Stock', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (50, 'default', 'created', 'App\\Models\\OrderDetail', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"40.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (51, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (52, 'default', 'created', 'App\\Models\\OrderDetail', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":21,\"sellprice\":14,\"quantity\":\"60.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (53, 'default', 'updated', 'App\\Models\\Stock', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":21,\"alert\":\"0.00\",\"total\":-10},\"old\":{\"warehouse_id\":1,\"product_id\":21,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (54, 'default', 'created', 'App\\Models\\OrderDetail', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"30.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (55, 'default', 'updated', 'App\\Models\\Stock', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (56, 'default', 'created', 'App\\Models\\OrderDetail', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":20,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (57, 'default', 'updated', 'App\\Models\\Stock', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":20,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":20,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (58, 'default', 'created', 'App\\Models\\OrderDetail', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":19,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (59, 'default', 'updated', 'App\\Models\\Stock', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (60, 'default', 'created', 'App\\Models\\OrderDetail', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":4,\"sellprice\":15,\"quantity\":\"110.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (61, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":390},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":500}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (62, 'default', 'created', 'App\\Models\\OrderDetail', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":38,\"sellprice\":18.5,\"quantity\":\"30.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (63, 'default', 'updated', 'App\\Models\\Stock', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":120},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":150}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (64, 'default', 'created', 'App\\Models\\OrderDetail', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (65, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":280},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":300}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (66, 'default', 'created', 'App\\Models\\OrderDetail', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":1,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (67, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":550},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":560}}', '2022-04-28 08:59:37', '2022-04-28 08:59:37');
INSERT INTO `activity_log` VALUES (68, 'default', 'created', 'App\\Models\\Order', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":2,\"user_id\":1,\"subtotal\":15190,\"vat\":0,\"discount\":0,\"grandtotal\":15190,\"kh_grandtotal\":null}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (69, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"21485.00\",\"withdraw\":\"0.00\",\"balance\":\"21495.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"6295.00\",\"withdraw\":\"0.00\",\"balance\":\"6305.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (70, 'default', 'created', 'App\\Models\\OrderDetail', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":25,\"sellprice\":19.5,\"quantity\":\"30.00\"}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (71, 'default', 'updated', 'App\\Models\\Stock', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":25,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":25,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (72, 'default', 'created', 'App\\Models\\OrderDetail', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":12,\"sellprice\":21,\"quantity\":\"45.00\"}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (73, 'default', 'updated', 'App\\Models\\Stock', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (74, 'default', 'created', 'App\\Models\\OrderDetail', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":37,\"sellprice\":21.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (75, 'default', 'updated', 'App\\Models\\Stock', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":150}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (76, 'default', 'created', 'App\\Models\\OrderDetail', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"80.00\"}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (77, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":420},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":500}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (78, 'default', 'created', 'App\\Models\\OrderDetail', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":24,\"sellprice\":19.5,\"quantity\":\"60.00\"}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (79, 'default', 'updated', 'App\\Models\\Stock', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":140}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (80, 'default', 'created', 'App\\Models\\OrderDetail', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":32,\"sellprice\":14,\"quantity\":\"75.00\"}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (81, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":425},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":500}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (82, 'default', 'created', 'App\\Models\\OrderDetail', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":6,\"sellprice\":18.5,\"quantity\":\"90.00\"}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (83, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":200}}', '2022-04-28 09:16:39', '2022-04-28 09:16:39');
INSERT INTO `activity_log` VALUES (84, 'default', 'created', 'App\\Models\\OrderDetail', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":28,\"sellprice\":17.5,\"quantity\":\"53.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (85, 'default', 'updated', 'App\\Models\\Stock', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":47},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (86, 'default', 'created', 'App\\Models\\OrderDetail', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":11,\"sellprice\":21.5,\"quantity\":\"50.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (87, 'default', 'updated', 'App\\Models\\Stock', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (88, 'default', 'created', 'App\\Models\\OrderDetail', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":34,\"sellprice\":16.5,\"quantity\":\"20.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (89, 'default', 'updated', 'App\\Models\\Stock', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (90, 'default', 'created', 'App\\Models\\OrderDetail', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"89.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (91, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":111},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":200}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (92, 'default', 'created', 'App\\Models\\OrderDetail', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":16,\"sellprice\":41,\"quantity\":\"15.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (93, 'default', 'updated', 'App\\Models\\Stock', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":485},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":500}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (94, 'default', 'created', 'App\\Models\\OrderDetail', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":7,\"sellprice\":15,\"quantity\":\"105.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (95, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":195},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":300}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (96, 'default', 'created', 'App\\Models\\OrderDetail', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"60.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (97, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":200}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (98, 'default', 'created', 'App\\Models\\OrderDetail', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":10,\"sellprice\":20,\"quantity\":\"20.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (99, 'default', 'updated', 'App\\Models\\Stock', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":230},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":250}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (100, 'default', 'created', 'App\\Models\\OrderDetail', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":33,\"sellprice\":24,\"quantity\":\"20.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (101, 'default', 'updated', 'App\\Models\\Stock', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":160}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (102, 'default', 'created', 'App\\Models\\OrderDetail', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":2,\"product_id\":9,\"sellprice\":13,\"quantity\":\"50.00\"}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (103, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":350},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":400}}', '2022-04-28 09:16:40', '2022-04-28 09:16:40');
INSERT INTO `activity_log` VALUES (104, 'default', 'created', 'App\\Models\\Order', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":3,\"user_id\":1,\"subtotal\":446,\"vat\":0,\"discount\":0,\"grandtotal\":446,\"kh_grandtotal\":null}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (105, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"21931.00\",\"withdraw\":\"0.00\",\"balance\":\"21941.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"21485.00\",\"withdraw\":\"0.00\",\"balance\":\"21495.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (106, 'default', 'created', 'App\\Models\\OrderDetail', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":3,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (107, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":540},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":550}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (108, 'default', 'created', 'App\\Models\\OrderDetail', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":3,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (109, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":410},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":420}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (110, 'default', 'created', 'App\\Models\\OrderDetail', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":3,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"2.00\"}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (111, 'default', 'updated', 'App\\Models\\Stock', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":98},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (112, 'default', 'created', 'App\\Models\\OrderDetail', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":3,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (113, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":130},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":140}}', '2022-04-28 09:18:00', '2022-04-28 09:18:00');
INSERT INTO `activity_log` VALUES (114, 'default', 'created', 'App\\Models\\Order', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":14,\"user_id\":1,\"subtotal\":2923.5,\"vat\":0,\"discount\":0,\"grandtotal\":2923.5,\"kh_grandtotal\":null}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (115, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"24854.50\",\"withdraw\":\"0.00\",\"balance\":\"24864.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"21931.00\",\"withdraw\":\"0.00\",\"balance\":\"21941.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (116, 'default', 'created', 'App\\Models\\OrderDetail', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":4,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (117, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":380},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":390}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (118, 'default', 'created', 'App\\Models\\OrderDetail', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":2,\"sellprice\":11,\"quantity\":\"5.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (119, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":275},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":280}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (120, 'default', 'created', 'App\\Models\\OrderDetail', 37, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"15.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (121, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":525},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":540}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (122, 'default', 'created', 'App\\Models\\OrderDetail', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":12,\"sellprice\":21,\"quantity\":\"5.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (123, 'default', 'updated', 'App\\Models\\Stock', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":55}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (124, 'default', 'created', 'App\\Models\\OrderDetail', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"31.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (125, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":379},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":410}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (126, 'default', 'created', 'App\\Models\\OrderDetail', 40, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"2.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (127, 'default', 'updated', 'App\\Models\\Stock', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":96},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":98}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (128, 'default', 'created', 'App\\Models\\OrderDetail', 41, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":14,\"sellprice\":15.5,\"quantity\":\"3.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (129, 'default', 'updated', 'App\\Models\\Stock', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":97},\"old\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (130, 'default', 'created', 'App\\Models\\OrderDetail', 42, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":32,\"sellprice\":14,\"quantity\":\"15.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (131, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":410},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":425}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (132, 'default', 'created', 'App\\Models\\OrderDetail', 43, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":6,\"sellprice\":18.5,\"quantity\":\"15.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (133, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":110}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (134, 'default', 'created', 'App\\Models\\OrderDetail', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"5.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (135, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":106},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":111}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (136, 'default', 'created', 'App\\Models\\OrderDetail', 45, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":13,\"sellprice\":22.5,\"quantity\":\"5.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (137, 'default', 'updated', 'App\\Models\\Stock', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (138, 'default', 'created', 'App\\Models\\OrderDetail', 46, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":7,\"sellprice\":15,\"quantity\":\"35.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (139, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":195}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (140, 'default', 'created', 'App\\Models\\OrderDetail', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"35.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (141, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":130}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (142, 'default', 'created', 'App\\Models\\OrderDetail', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":4,\"product_id\":9,\"sellprice\":13,\"quantity\":\"15.00\"}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (143, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":335},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":350}}', '2022-04-28 09:27:46', '2022-04-28 09:27:46');
INSERT INTO `activity_log` VALUES (144, 'default', 'created', 'App\\Models\\Order', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":4,\"user_id\":1,\"subtotal\":14204.5,\"vat\":0,\"discount\":0,\"grandtotal\":14204.5,\"kh_grandtotal\":null}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (145, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"39059.00\",\"withdraw\":\"0.00\",\"balance\":\"39069.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"24854.50\",\"withdraw\":\"0.00\",\"balance\":\"24864.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (146, 'default', 'created', 'App\\Models\\OrderDetail', 49, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":22,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (147, 'default', 'updated', 'App\\Models\\Stock', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":70}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (148, 'default', 'created', 'App\\Models\\OrderDetail', 50, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (149, 'default', 'updated', 'App\\Models\\Stock', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":80}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (150, 'default', 'created', 'App\\Models\\OrderDetail', 51, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (151, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":60}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (152, 'default', 'created', 'App\\Models\\OrderDetail', 52, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"15.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (153, 'default', 'updated', 'App\\Models\\Stock', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":70}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (154, 'default', 'created', 'App\\Models\\OrderDetail', 53, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":4,\"sellprice\":15,\"quantity\":\"90.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (155, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":290},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":380}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (156, 'default', 'created', 'App\\Models\\OrderDetail', 54, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (157, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":255},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":275}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (158, 'default', 'created', 'App\\Models\\OrderDetail', 55, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"70.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (159, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":455},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":525}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (160, 'default', 'created', 'App\\Models\\OrderDetail', 56, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":27,\"sellprice\":19,\"quantity\":\"32.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (161, 'default', 'updated', 'App\\Models\\Stock', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":68},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (162, 'default', 'created', 'App\\Models\\OrderDetail', 57, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"124.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (163, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":255},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":379}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (164, 'default', 'created', 'App\\Models\\OrderDetail', 58, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (165, 'default', 'updated', 'App\\Models\\Stock', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":86},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":96}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (166, 'default', 'created', 'App\\Models\\OrderDetail', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":14,\"sellprice\":15.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (167, 'default', 'updated', 'App\\Models\\Stock', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":87},\"old\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":97}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (168, 'default', 'created', 'App\\Models\\OrderDetail', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":32,\"sellprice\":14,\"quantity\":\"100.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (169, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":310},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":410}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (170, 'default', 'created', 'App\\Models\\OrderDetail', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":6,\"sellprice\":18.5,\"quantity\":\"5.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (171, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":95}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (172, 'default', 'created', 'App\\Models\\OrderDetail', 62, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":28,\"sellprice\":17.5,\"quantity\":\"32.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (173, 'default', 'updated', 'App\\Models\\Stock', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":47}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (174, 'default', 'created', 'App\\Models\\OrderDetail', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":34,\"sellprice\":16.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (175, 'default', 'updated', 'App\\Models\\Stock', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":80}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (176, 'default', 'created', 'App\\Models\\OrderDetail', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"36.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (177, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":106}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (178, 'default', 'created', 'App\\Models\\OrderDetail', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":41,\"sellprice\":20.5,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (179, 'default', 'updated', 'App\\Models\\Stock', 37, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (180, 'default', 'created', 'App\\Models\\OrderDetail', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":42,\"sellprice\":22,\"quantity\":\"10.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (181, 'default', 'updated', 'App\\Models\\Stock', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (182, 'default', 'created', 'App\\Models\\OrderDetail', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":13,\"sellprice\":22.5,\"quantity\":\"12.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (183, 'default', 'updated', 'App\\Models\\Stock', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":33},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":45}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (184, 'default', 'created', 'App\\Models\\OrderDetail', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":7,\"sellprice\":15,\"quantity\":\"85.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (185, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":160}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (186, 'default', 'created', 'App\\Models\\OrderDetail', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"45.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (187, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":95}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (188, 'default', 'created', 'App\\Models\\OrderDetail', 70, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":10,\"sellprice\":20,\"quantity\":\"55.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (189, 'default', 'updated', 'App\\Models\\Stock', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":175},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":230}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (190, 'default', 'created', 'App\\Models\\OrderDetail', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":33,\"sellprice\":24,\"quantity\":\"20.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (191, 'default', 'updated', 'App\\Models\\Stock', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":120},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":140}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (192, 'default', 'created', 'App\\Models\\OrderDetail', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":35,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (193, 'default', 'updated', 'App\\Models\\Stock', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":80},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (194, 'default', 'created', 'App\\Models\\OrderDetail', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":5,\"product_id\":9,\"sellprice\":13,\"quantity\":\"90.00\"}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (195, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":245},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":335}}', '2022-04-28 09:39:52', '2022-04-28 09:39:52');
INSERT INTO `activity_log` VALUES (196, 'default', 'created', 'App\\Models\\Order', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":5,\"user_id\":1,\"subtotal\":5272.5,\"vat\":0,\"discount\":0,\"grandtotal\":5272.5,\"kh_grandtotal\":null}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (197, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"44331.50\",\"withdraw\":\"0.00\",\"balance\":\"44341.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"39059.00\",\"withdraw\":\"0.00\",\"balance\":\"39069.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (198, 'default', 'created', 'App\\Models\\OrderDetail', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (199, 'default', 'updated', 'App\\Models\\Stock', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":70}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (200, 'default', 'created', 'App\\Models\\OrderDetail', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (201, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (202, 'default', 'created', 'App\\Models\\OrderDetail', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":4,\"sellprice\":15,\"quantity\":\"40.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (203, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":250},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":290}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (204, 'default', 'created', 'App\\Models\\OrderDetail', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":2,\"sellprice\":11,\"quantity\":\"25.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (205, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":230},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":255}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (206, 'default', 'created', 'App\\Models\\OrderDetail', 78, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"45.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (207, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":410},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":455}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (208, 'default', 'created', 'App\\Models\\OrderDetail', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":12,\"sellprice\":21,\"quantity\":\"10.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (209, 'default', 'updated', 'App\\Models\\Stock', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (210, 'default', 'created', 'App\\Models\\OrderDetail', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":37,\"sellprice\":21.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (211, 'default', 'updated', 'App\\Models\\Stock', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":135},\"old\":{\"warehouse_id\":1,\"product_id\":37,\"alert\":\"0.00\",\"total\":140}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (212, 'default', 'created', 'App\\Models\\OrderDetail', 81, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"45.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (213, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":210},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":255}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (214, 'default', 'created', 'App\\Models\\OrderDetail', 82, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (215, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":300},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":310}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (216, 'default', 'created', 'App\\Models\\OrderDetail', 83, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":6,\"sellprice\":18.5,\"quantity\":\"30.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (217, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":90}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (218, 'default', 'created', 'App\\Models\\OrderDetail', 84, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":28,\"sellprice\":17.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (219, 'default', 'updated', 'App\\Models\\Stock', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":15}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (220, 'default', 'created', 'App\\Models\\OrderDetail', 85, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":11,\"sellprice\":21.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (221, 'default', 'updated', 'App\\Models\\Stock', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (222, 'default', 'created', 'App\\Models\\OrderDetail', 86, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"15.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (223, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":70}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (224, 'default', 'created', 'App\\Models\\OrderDetail', 87, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":7,\"sellprice\":15,\"quantity\":\"30.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (225, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":75}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (226, 'default', 'created', 'App\\Models\\OrderDetail', 88, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (227, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (228, 'default', 'created', 'App\\Models\\OrderDetail', 89, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":33,\"sellprice\":24,\"quantity\":\"5.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (229, 'default', 'updated', 'App\\Models\\Stock', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":115},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":120}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (230, 'default', 'created', 'App\\Models\\OrderDetail', 90, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":6,\"product_id\":9,\"sellprice\":13,\"quantity\":\"50.00\"}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (231, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":195},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":245}}', '2022-04-28 14:11:12', '2022-04-28 14:11:12');
INSERT INTO `activity_log` VALUES (232, 'default', 'updated', 'App\\Models\\Product', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":1,\"code\":\"316466814841\",\"en_name\":\"a3s\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"1651155408.webp\",\"sale_price\":13.5},\"old\":{\"category_id\":1,\"code\":\"316466814841\",\"en_name\":\"a3s\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"no image created\",\"sale_price\":13.5}}', '2022-04-28 14:16:48', '2022-04-28 14:16:48');
INSERT INTO `activity_log` VALUES (233, 'default', 'updated', 'App\\Models\\Product', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"category_id\":1,\"code\":\"316466814841\",\"en_name\":\"a3s\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"1651156393.jpg\",\"sale_price\":13.5},\"old\":{\"category_id\":1,\"code\":\"316466814841\",\"en_name\":\"a3s\",\"kh_name\":\"LCD IPHONE\",\"description\":\"undefined\",\"image\":\"1651155408.jpg\",\"sale_price\":13.5}}', '2022-04-28 14:33:13', '2022-04-28 14:33:13');
INSERT INTO `activity_log` VALUES (234, 'default', 'created', 'App\\Models\\Order', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":6,\"user_id\":1,\"subtotal\":3437.5,\"vat\":0,\"discount\":0,\"grandtotal\":3437.5,\"kh_grandtotal\":null}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (235, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"47769.00\",\"withdraw\":\"0.00\",\"balance\":\"47779.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"44331.50\",\"withdraw\":\"0.00\",\"balance\":\"44341.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (236, 'default', 'created', 'App\\Models\\OrderDetail', 91, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":17,\"sellprice\":80,\"quantity\":\"1.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (237, 'default', 'updated', 'App\\Models\\Stock', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":13},\"old\":{\"warehouse_id\":1,\"product_id\":17,\"alert\":\"0.00\",\"total\":14}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (238, 'default', 'created', 'App\\Models\\OrderDetail', 92, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (239, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":45}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (240, 'default', 'created', 'App\\Models\\OrderDetail', 93, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":20,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (241, 'default', 'updated', 'App\\Models\\Stock', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":20,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":20,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (242, 'default', 'created', 'App\\Models\\OrderDetail', 94, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":19,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (243, 'default', 'updated', 'App\\Models\\Stock', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":19,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (244, 'default', 'created', 'App\\Models\\OrderDetail', 95, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":4,\"sellprice\":15,\"quantity\":\"30.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (245, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":220},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":250}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (246, 'default', 'created', 'App\\Models\\OrderDetail', 96, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":2,\"sellprice\":11,\"quantity\":\"15.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (247, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":215},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":230}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (248, 'default', 'created', 'App\\Models\\OrderDetail', 97, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (249, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":400},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":410}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (250, 'default', 'created', 'App\\Models\\OrderDetail', 98, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":27,\"sellprice\":19,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (251, 'default', 'updated', 'App\\Models\\Stock', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":58},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":68}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (252, 'default', 'created', 'App\\Models\\OrderDetail', 99, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":12,\"sellprice\":21,\"quantity\":\"20.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (253, 'default', 'updated', 'App\\Models\\Stock', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (254, 'default', 'created', 'App\\Models\\OrderDetail', 100, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (255, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":190},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":210}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (256, 'default', 'created', 'App\\Models\\OrderDetail', 101, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":24,\"sellprice\":19.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (257, 'default', 'updated', 'App\\Models\\Stock', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":80}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (258, 'default', 'created', 'App\\Models\\OrderDetail', 102, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":28,\"sellprice\":17.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (259, 'default', 'updated', 'App\\Models\\Stock', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":28,\"alert\":\"0.00\",\"total\":10}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (260, 'default', 'created', 'App\\Models\\OrderDetail', 103, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"20.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (261, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":55}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (262, 'default', 'created', 'App\\Models\\OrderDetail', 104, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":41,\"sellprice\":20.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (263, 'default', 'updated', 'App\\Models\\Stock', 37, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":41,\"alert\":\"0.00\",\"total\":90}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (264, 'default', 'created', 'App\\Models\\OrderDetail', 105, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":42,\"sellprice\":22,\"quantity\":\"5.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (265, 'default', 'updated', 'App\\Models\\Stock', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":85},\"old\":{\"warehouse_id\":1,\"product_id\":42,\"alert\":\"0.00\",\"total\":90}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (266, 'default', 'created', 'App\\Models\\OrderDetail', 106, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":33,\"sellprice\":24,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (267, 'default', 'updated', 'App\\Models\\Stock', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":105},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":115}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (268, 'default', 'created', 'App\\Models\\OrderDetail', 107, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":7,\"product_id\":9,\"sellprice\":13,\"quantity\":\"10.00\"}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (269, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":185},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":195}}', '2022-04-28 14:47:25', '2022-04-28 14:47:25');
INSERT INTO `activity_log` VALUES (270, 'default', 'created', 'App\\Models\\Order', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":12,\"user_id\":1,\"subtotal\":2900,\"vat\":0,\"discount\":0,\"grandtotal\":2900,\"kh_grandtotal\":null}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (271, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"50669.00\",\"withdraw\":\"0.00\",\"balance\":\"50679.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"47769.00\",\"withdraw\":\"0.00\",\"balance\":\"47779.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (272, 'default', 'created', 'App\\Models\\OrderDetail', 108, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":38,\"sellprice\":18.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (273, 'default', 'updated', 'App\\Models\\Stock', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":120}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (274, 'default', 'created', 'App\\Models\\OrderDetail', 109, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (275, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":195},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":215}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (276, 'default', 'created', 'App\\Models\\OrderDetail', 110, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (277, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":380},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":400}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (278, 'default', 'created', 'App\\Models\\OrderDetail', 111, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":27,\"sellprice\":19,\"quantity\":\"5.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (279, 'default', 'updated', 'App\\Models\\Stock', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":53},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":58}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (280, 'default', 'created', 'App\\Models\\OrderDetail', 112, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"30.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (281, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":190}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (282, 'default', 'created', 'App\\Models\\OrderDetail', 113, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":24,\"sellprice\":19.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (283, 'default', 'updated', 'App\\Models\\Stock', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":24,\"alert\":\"0.00\",\"total\":70}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (284, 'default', 'created', 'App\\Models\\OrderDetail', 114, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (285, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":290},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":300}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (286, 'default', 'created', 'App\\Models\\OrderDetail', 115, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":6,\"sellprice\":18.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (287, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":60}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (288, 'default', 'created', 'App\\Models\\OrderDetail', 116, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":11,\"sellprice\":21.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (289, 'default', 'updated', 'App\\Models\\Stock', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":35},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":45}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (290, 'default', 'created', 'App\\Models\\OrderDetail', 117, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":16,\"sellprice\":41,\"quantity\":\"5.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (291, 'default', 'updated', 'App\\Models\\Stock', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":480},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":485}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (292, 'default', 'created', 'App\\Models\\OrderDetail', 118, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":7,\"sellprice\":15,\"quantity\":\"5.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (293, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":45}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (294, 'default', 'created', 'App\\Models\\OrderDetail', 119, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (295, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (296, 'default', 'created', 'App\\Models\\OrderDetail', 120, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":33,\"sellprice\":24,\"quantity\":\"10.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (297, 'default', 'updated', 'App\\Models\\Stock', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":105}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (298, 'default', 'created', 'App\\Models\\OrderDetail', 121, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":8,\"product_id\":9,\"sellprice\":13,\"quantity\":\"25.00\"}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (299, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":185}}', '2022-04-28 14:52:35', '2022-04-28 14:52:35');
INSERT INTO `activity_log` VALUES (300, 'default', 'created', 'App\\Models\\Order', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":7,\"user_id\":1,\"subtotal\":1085,\"vat\":0,\"discount\":0,\"grandtotal\":1085,\"kh_grandtotal\":null}}', '2022-04-28 14:54:38', '2022-04-28 14:54:38');
INSERT INTO `activity_log` VALUES (301, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"51754.00\",\"withdraw\":\"0.00\",\"balance\":\"51764.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"50669.00\",\"withdraw\":\"0.00\",\"balance\":\"50679.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 14:54:38', '2022-04-28 14:54:38');
INSERT INTO `activity_log` VALUES (302, 'default', 'created', 'App\\Models\\OrderDetail', 122, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:54:38', '2022-04-28 14:54:38');
INSERT INTO `activity_log` VALUES (303, 'default', 'updated', 'App\\Models\\Stock', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":55}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (304, 'default', 'created', 'App\\Models\\OrderDetail', 123, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":4,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (305, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":210},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":220}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (306, 'default', 'created', 'App\\Models\\OrderDetail', 124, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":9,\"sellprice\":13,\"quantity\":\"20.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (307, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":160}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (308, 'default', 'created', 'App\\Models\\OrderDetail', 125, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (309, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":35}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (310, 'default', 'created', 'App\\Models\\OrderDetail', 126, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (311, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":35}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (312, 'default', 'created', 'App\\Models\\OrderDetail', 127, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (313, 'default', 'updated', 'App\\Models\\Stock', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":60}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (314, 'default', 'created', 'App\\Models\\OrderDetail', 128, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":34,\"sellprice\":16.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (315, 'default', 'updated', 'App\\Models\\Stock', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":65},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":70}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (316, 'default', 'created', 'App\\Models\\OrderDetail', 129, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":36,\"sellprice\":17,\"quantity\":\"5.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (317, 'default', 'updated', 'App\\Models\\Stock', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":95},\"old\":{\"warehouse_id\":1,\"product_id\":36,\"alert\":\"0.00\",\"total\":100}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (318, 'default', 'created', 'App\\Models\\OrderDetail', 130, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":9,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (319, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":280},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":290}}', '2022-04-28 14:54:39', '2022-04-28 14:54:39');
INSERT INTO `activity_log` VALUES (320, 'default', 'created', 'App\\Models\\Order', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":8,\"user_id\":1,\"subtotal\":2544.5,\"vat\":0,\"discount\":0,\"grandtotal\":2544.5,\"kh_grandtotal\":null}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (321, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"54298.50\",\"withdraw\":\"0.00\",\"balance\":\"54308.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"51754.00\",\"withdraw\":\"0.00\",\"balance\":\"51764.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (322, 'default', 'created', 'App\\Models\\OrderDetail', 131, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"5.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (323, 'default', 'updated', 'App\\Models\\Stock', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":45}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (324, 'default', 'created', 'App\\Models\\OrderDetail', 132, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":4,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (325, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":200},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":210}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (326, 'default', 'created', 'App\\Models\\OrderDetail', 133, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":38,\"sellprice\":18.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (327, 'default', 'updated', 'App\\Models\\Stock', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":100},\"old\":{\"warehouse_id\":1,\"product_id\":38,\"alert\":\"0.00\",\"total\":110}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (328, 'default', 'created', 'App\\Models\\OrderDetail', 134, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (329, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":185},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":195}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (330, 'default', 'created', 'App\\Models\\OrderDetail', 135, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (331, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":360},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":380}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (332, 'default', 'created', 'App\\Models\\OrderDetail', 136, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":12,\"sellprice\":21,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (333, 'default', 'updated', 'App\\Models\\Stock', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":20}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (334, 'default', 'created', 'App\\Models\\OrderDetail', 137, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (335, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":270},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":280}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (336, 'default', 'created', 'App\\Models\\OrderDetail', 138, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":6,\"sellprice\":18.5,\"quantity\":\"20.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (337, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (338, 'default', 'created', 'App\\Models\\OrderDetail', 139, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (339, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (340, 'default', 'created', 'App\\Models\\OrderDetail', 140, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":16,\"sellprice\":41,\"quantity\":\"2.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (341, 'default', 'updated', 'App\\Models\\Stock', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":478},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":480}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (342, 'default', 'created', 'App\\Models\\OrderDetail', 141, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":7,\"sellprice\":15,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (343, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (344, 'default', 'created', 'App\\Models\\OrderDetail', 142, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":10,\"sellprice\":20,\"quantity\":\"5.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (345, 'default', 'updated', 'App\\Models\\Stock', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":170},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":175}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (346, 'default', 'created', 'App\\Models\\OrderDetail', 143, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":35,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (347, 'default', 'updated', 'App\\Models\\Stock', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":70},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":80}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (348, 'default', 'created', 'App\\Models\\OrderDetail', 144, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":10,\"product_id\":9,\"sellprice\":13,\"quantity\":\"30.00\"}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (349, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":140}}', '2022-04-28 14:59:19', '2022-04-28 14:59:19');
INSERT INTO `activity_log` VALUES (350, 'default', 'created', 'App\\Models\\Order', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":9,\"user_id\":1,\"subtotal\":8700,\"vat\":0,\"discount\":0,\"grandtotal\":8700,\"kh_grandtotal\":null}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (351, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"62998.50\",\"withdraw\":\"0.00\",\"balance\":\"63008.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"54298.50\",\"withdraw\":\"0.00\",\"balance\":\"54308.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (352, 'default', 'created', 'App\\Models\\OrderDetail', 145, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":23,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (353, 'default', 'updated', 'App\\Models\\Stock', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":50}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (354, 'default', 'created', 'App\\Models\\OrderDetail', 146, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":22,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (355, 'default', 'updated', 'App\\Models\\Stock', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":60}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (356, 'default', 'created', 'App\\Models\\OrderDetail', 147, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":40,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (357, 'default', 'updated', 'App\\Models\\Stock', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":45},\"old\":{\"warehouse_id\":1,\"product_id\":40,\"alert\":\"0.00\",\"total\":55}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (358, 'default', 'created', 'App\\Models\\OrderDetail', 148, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (359, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (360, 'default', 'created', 'App\\Models\\OrderDetail', 149, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (361, 'default', 'updated', 'App\\Models\\Stock', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (362, 'default', 'created', 'App\\Models\\OrderDetail', 150, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":4,\"sellprice\":15,\"quantity\":\"60.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (363, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":200}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (364, 'default', 'created', 'App\\Models\\OrderDetail', 151, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (365, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":165},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":185}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (366, 'default', 'created', 'App\\Models\\OrderDetail', 152, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (367, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":340},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":360}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (368, 'default', 'created', 'App\\Models\\OrderDetail', 153, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":25,\"sellprice\":19.5,\"quantity\":\"10.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (369, 'default', 'updated', 'App\\Models\\Stock', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":25,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":25,\"alert\":\"0.00\",\"total\":10}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (370, 'default', 'created', 'App\\Models\\OrderDetail', 154, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":12,\"sellprice\":21,\"quantity\":\"10.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (371, 'default', 'updated', 'App\\Models\\Stock', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":12,\"alert\":\"0.00\",\"total\":10}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (372, 'default', 'created', 'App\\Models\\OrderDetail', 155, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"50.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (373, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":110},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":160}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (374, 'default', 'created', 'App\\Models\\OrderDetail', 156, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":32,\"sellprice\":14,\"quantity\":\"80.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (375, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":190},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":270}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (376, 'default', 'created', 'App\\Models\\OrderDetail', 157, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":6,\"sellprice\":18.5,\"quantity\":\"30.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (377, 'default', 'updated', 'App\\Models\\Stock', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":6,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (378, 'default', 'created', 'App\\Models\\OrderDetail', 158, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":34,\"sellprice\":16.5,\"quantity\":\"10.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (379, 'default', 'updated', 'App\\Models\\Stock', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":55},\"old\":{\"warehouse_id\":1,\"product_id\":34,\"alert\":\"0.00\",\"total\":65}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (380, 'default', 'created', 'App\\Models\\OrderDetail', 159, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":5,\"sellprice\":17.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (381, 'default', 'updated', 'App\\Models\\Stock', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":5,\"alert\":\"0.00\",\"total\":20}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (382, 'default', 'created', 'App\\Models\\OrderDetail', 160, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":16,\"sellprice\":41,\"quantity\":\"10.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (383, 'default', 'updated', 'App\\Models\\Stock', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":468},\"old\":{\"warehouse_id\":1,\"product_id\":16,\"alert\":\"0.00\",\"total\":478}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (384, 'default', 'created', 'App\\Models\\OrderDetail', 161, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":7,\"sellprice\":15,\"quantity\":\"30.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (385, 'default', 'updated', 'App\\Models\\Stock', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":7,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (386, 'default', 'created', 'App\\Models\\OrderDetail', 162, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":8,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (387, 'default', 'updated', 'App\\Models\\Stock', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":8,\"alert\":\"0.00\",\"total\":20}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (388, 'default', 'created', 'App\\Models\\OrderDetail', 163, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":10,\"sellprice\":20,\"quantity\":\"30.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (389, 'default', 'updated', 'App\\Models\\Stock', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":140},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":170}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (390, 'default', 'created', 'App\\Models\\OrderDetail', 164, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":33,\"sellprice\":24,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (391, 'default', 'updated', 'App\\Models\\Stock', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":75},\"old\":{\"warehouse_id\":1,\"product_id\":33,\"alert\":\"0.00\",\"total\":95}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (392, 'default', 'created', 'App\\Models\\OrderDetail', 165, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":35,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (393, 'default', 'updated', 'App\\Models\\Stock', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":50},\"old\":{\"warehouse_id\":1,\"product_id\":35,\"alert\":\"0.00\",\"total\":70}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (394, 'default', 'created', 'App\\Models\\OrderDetail', 166, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":11,\"product_id\":9,\"sellprice\":13,\"quantity\":\"50.00\"}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (395, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":60},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":110}}', '2022-04-28 15:06:15', '2022-04-28 15:06:15');
INSERT INTO `activity_log` VALUES (396, 'default', 'created', 'App\\Models\\Order', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":10,\"user_id\":1,\"subtotal\":1830,\"vat\":0,\"discount\":0,\"grandtotal\":1830,\"kh_grandtotal\":null}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (397, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"64828.50\",\"withdraw\":\"0.00\",\"balance\":\"64838.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"62998.50\",\"withdraw\":\"0.00\",\"balance\":\"63008.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (398, 'default', 'created', 'App\\Models\\OrderDetail', 167, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"10.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (399, 'default', 'updated', 'App\\Models\\Stock', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (400, 'default', 'created', 'App\\Models\\OrderDetail', 168, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":14,\"sellprice\":15.5,\"quantity\":\"5.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (401, 'default', 'updated', 'App\\Models\\Stock', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":82},\"old\":{\"warehouse_id\":1,\"product_id\":14,\"alert\":\"0.00\",\"total\":87}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (402, 'default', 'created', 'App\\Models\\OrderDetail', 169, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"5.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (403, 'default', 'updated', 'App\\Models\\Stock', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":81},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":86}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (404, 'default', 'created', 'App\\Models\\OrderDetail', 170, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":2,\"sellprice\":11,\"quantity\":\"20.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (405, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":145},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":165}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (406, 'default', 'created', 'App\\Models\\OrderDetail', 171, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":9,\"sellprice\":13,\"quantity\":\"20.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (407, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":40},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":60}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (408, 'default', 'created', 'App\\Models\\OrderDetail', 172, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":23,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (409, 'default', 'updated', 'App\\Models\\Stock', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (410, 'default', 'created', 'App\\Models\\OrderDetail', 173, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (411, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":320},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":340}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (412, 'default', 'created', 'App\\Models\\OrderDetail', 174, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":4,\"sellprice\":15,\"quantity\":\"20.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (413, 'default', 'updated', 'App\\Models\\Stock', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":120},\"old\":{\"warehouse_id\":1,\"product_id\":4,\"alert\":\"0.00\",\"total\":140}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (414, 'default', 'created', 'App\\Models\\OrderDetail', 175, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (415, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":90},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":110}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (416, 'default', 'created', 'App\\Models\\OrderDetail', 176, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":12,\"product_id\":10,\"sellprice\":20,\"quantity\":\"5.00\"}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (417, 'default', 'updated', 'App\\Models\\Stock', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":135},\"old\":{\"warehouse_id\":1,\"product_id\":10,\"alert\":\"0.00\",\"total\":140}}', '2022-04-28 15:09:03', '2022-04-28 15:09:03');
INSERT INTO `activity_log` VALUES (418, 'default', 'created', 'App\\Models\\Order', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":11,\"user_id\":1,\"subtotal\":930,\"vat\":0,\"discount\":0,\"grandtotal\":930,\"kh_grandtotal\":null}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (419, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"65758.50\",\"withdraw\":\"0.00\",\"balance\":\"65768.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"64828.50\",\"withdraw\":\"0.00\",\"balance\":\"64838.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (420, 'default', 'created', 'App\\Models\\OrderDetail', 177, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":13,\"product_id\":22,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (421, 'default', 'updated', 'App\\Models\\Stock', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (422, 'default', 'created', 'App\\Models\\OrderDetail', 178, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":13,\"product_id\":23,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (423, 'default', 'updated', 'App\\Models\\Stock', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (424, 'default', 'created', 'App\\Models\\OrderDetail', 179, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":13,\"product_id\":11,\"sellprice\":21.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (425, 'default', 'updated', 'App\\Models\\Stock', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":15},\"old\":{\"warehouse_id\":1,\"product_id\":11,\"alert\":\"0.00\",\"total\":35}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (426, 'default', 'created', 'App\\Models\\OrderDetail', 180, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":13,\"product_id\":32,\"sellprice\":14,\"quantity\":\"20.00\"}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (427, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":170},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":190}}', '2022-04-28 15:11:10', '2022-04-28 15:11:10');
INSERT INTO `activity_log` VALUES (428, 'default', 'created', 'App\\Models\\Order', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"customer_id\":13,\"user_id\":1,\"subtotal\":2677.5,\"vat\":0,\"discount\":0,\"grandtotal\":2677.5,\"kh_grandtotal\":null}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (429, 'default', 'updated', 'App\\Models\\Balance', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"remain\":\"10.00\",\"income\":\"68436.00\",\"withdraw\":\"0.00\",\"balance\":\"68446.00\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1},\"old\":{\"remain\":\"10.00\",\"income\":\"65758.50\",\"withdraw\":\"0.00\",\"balance\":\"65768.50\",\"balance_date\":\"2022-04-28\",\"warehouse_id\":1,\"user_id\":1}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (430, 'default', 'created', 'App\\Models\\OrderDetail', 181, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":23,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (431, 'default', 'updated', 'App\\Models\\Stock', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":10},\"old\":{\"warehouse_id\":1,\"product_id\":23,\"alert\":\"0.00\",\"total\":20}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (432, 'default', 'created', 'App\\Models\\OrderDetail', 182, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":22,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (433, 'default', 'updated', 'App\\Models\\Stock', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":22,\"alert\":\"0.00\",\"total\":30}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (434, 'default', 'created', 'App\\Models\\OrderDetail', 183, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":39,\"sellprice\":13.5,\"quantity\":\"5.00\"}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (435, 'default', 'updated', 'App\\Models\\Stock', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":5},\"old\":{\"warehouse_id\":1,\"product_id\":39,\"alert\":\"0.00\",\"total\":10}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (436, 'default', 'created', 'App\\Models\\OrderDetail', 184, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":18,\"sellprice\":14.5,\"quantity\":\"20.00\"}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (437, 'default', 'updated', 'App\\Models\\Stock', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":18,\"alert\":\"0.00\",\"total\":20}}', '2022-04-28 15:14:51', '2022-04-28 15:14:51');
INSERT INTO `activity_log` VALUES (438, 'default', 'created', 'App\\Models\\OrderDetail', 185, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":2,\"sellprice\":11,\"quantity\":\"10.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (439, 'default', 'updated', 'App\\Models\\Stock', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":135},\"old\":{\"warehouse_id\":1,\"product_id\":2,\"alert\":\"0.00\",\"total\":145}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (440, 'default', 'created', 'App\\Models\\OrderDetail', 186, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":1,\"sellprice\":13.5,\"quantity\":\"10.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (441, 'default', 'updated', 'App\\Models\\Stock', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":310},\"old\":{\"warehouse_id\":1,\"product_id\":1,\"alert\":\"0.00\",\"total\":320}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (442, 'default', 'created', 'App\\Models\\OrderDetail', 187, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":27,\"sellprice\":19,\"quantity\":\"5.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (443, 'default', 'updated', 'App\\Models\\Stock', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":48},\"old\":{\"warehouse_id\":1,\"product_id\":27,\"alert\":\"0.00\",\"total\":53}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (444, 'default', 'created', 'App\\Models\\OrderDetail', 188, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":3,\"sellprice\":13.5,\"quantity\":\"90.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (445, 'default', 'updated', 'App\\Models\\Stock', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":0},\"old\":{\"warehouse_id\":1,\"product_id\":3,\"alert\":\"0.00\",\"total\":90}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (446, 'default', 'created', 'App\\Models\\OrderDetail', 189, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":15,\"sellprice\":15.5,\"quantity\":\"5.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (447, 'default', 'updated', 'App\\Models\\Stock', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":76},\"old\":{\"warehouse_id\":1,\"product_id\":15,\"alert\":\"0.00\",\"total\":81}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (448, 'default', 'created', 'App\\Models\\OrderDetail', 190, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":32,\"sellprice\":14,\"quantity\":\"10.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (449, 'default', 'updated', 'App\\Models\\Stock', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":160},\"old\":{\"warehouse_id\":1,\"product_id\":32,\"alert\":\"0.00\",\"total\":170}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (450, 'default', 'created', 'App\\Models\\OrderDetail', 191, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":13,\"sellprice\":22.5,\"quantity\":\"3.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (451, 'default', 'updated', 'App\\Models\\Stock', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":30},\"old\":{\"warehouse_id\":1,\"product_id\":13,\"alert\":\"0.00\",\"total\":33}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (452, 'default', 'created', 'App\\Models\\OrderDetail', 192, 'App\\Models\\User', 1, '{\"attributes\":{\"order_id\":14,\"product_id\":9,\"sellprice\":13,\"quantity\":\"20.00\"}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');
INSERT INTO `activity_log` VALUES (453, 'default', 'updated', 'App\\Models\\Stock', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":20},\"old\":{\"warehouse_id\":1,\"product_id\":9,\"alert\":\"0.00\",\"total\":40}}', '2022-04-28 15:14:52', '2022-04-28 15:14:52');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of balances
-- ----------------------------
INSERT INTO `balances` VALUES (2, 0.00, 0.00, 0.00, 10.00, '2022-04-26', 1, 1, '2022-04-26 08:49:06', '2022-04-26 08:49:06');
INSERT INTO `balances` VALUES (3, 10.00, 68436.00, 0.00, 68446.00, '2022-04-28', 1, 1, '2022-04-28 08:51:58', '2022-04-28 15:14:51');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brand_category
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brand_product
-- ----------------------------
INSERT INTO `brand_product` VALUES (1, 9, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Apple', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (2, 'Google', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (3, 'HTC', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (4, 'Huawei', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (5, 'LG', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (6, 'Microsoft', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (7, 'Nokia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (8, 'OnePlus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (9, 'Oppo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (10, 'RealMe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (11, 'Samsung', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (12, 'Vivo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `brands` VALUES (13, 'XiaoMe', NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Case', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (2, 'Screen', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (3, 'Charger', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (4, 'Headset', NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, 1, 17, 6.00, 80, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (2, 1, 23, 50.00, 11, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (3, 1, 22, 30.00, 11, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (4, 1, 40, 20.00, 13.5, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (5, 1, 39, 40.00, 13.5, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (6, 1, 21, 60.00, 14, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (7, 1, 18, 30.00, 14.5, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (8, 1, 20, 10.00, 14.5, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (9, 1, 19, 10.00, 14.5, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (10, 1, 4, 110.00, 15, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (11, 1, 38, 30.00, 18.5, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (12, 1, 2, 20.00, 11, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (13, 1, 1, 10.00, 13.5, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `order_details` VALUES (14, 2, 25, 30.00, 19.5, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `order_details` VALUES (15, 2, 12, 45.00, 21, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `order_details` VALUES (16, 2, 37, 10.00, 21.5, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `order_details` VALUES (17, 2, 3, 80.00, 13.5, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `order_details` VALUES (18, 2, 24, 60.00, 19.5, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `order_details` VALUES (19, 2, 32, 75.00, 14, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `order_details` VALUES (20, 2, 6, 90.00, 18.5, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `order_details` VALUES (21, 2, 28, 53.00, 17.5, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (22, 2, 11, 50.00, 21.5, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (23, 2, 34, 20.00, 16.5, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (24, 2, 5, 89.00, 17.5, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (25, 2, 16, 15.00, 41, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (26, 2, 7, 105.00, 15, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (27, 2, 8, 60.00, 14.5, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (28, 2, 10, 20.00, 20, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (29, 2, 33, 20.00, 24, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (30, 2, 9, 50.00, 13, '2022-04-28 09:16:40', '2022-04-28 09:16:40', NULL);
INSERT INTO `order_details` VALUES (31, 3, 1, 10.00, 13.5, '2022-04-28 09:18:00', '2022-04-28 09:18:00', NULL);
INSERT INTO `order_details` VALUES (32, 3, 3, 10.00, 13.5, '2022-04-28 09:18:00', '2022-04-28 09:18:00', NULL);
INSERT INTO `order_details` VALUES (33, 3, 15, 2.00, 15.5, '2022-04-28 09:18:00', '2022-04-28 09:18:00', NULL);
INSERT INTO `order_details` VALUES (34, 3, 8, 10.00, 14.5, '2022-04-28 09:18:00', '2022-04-28 09:18:00', NULL);
INSERT INTO `order_details` VALUES (35, 4, 4, 10.00, 15, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (36, 4, 2, 5.00, 11, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (37, 4, 1, 15.00, 13.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (38, 4, 12, 5.00, 21, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (39, 4, 3, 31.00, 13.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (40, 4, 15, 2.00, 15.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (41, 4, 14, 3.00, 15.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (42, 4, 32, 15.00, 14, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (43, 4, 6, 15.00, 18.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (44, 4, 5, 5.00, 17.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (45, 4, 13, 5.00, 22.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (46, 4, 7, 35.00, 15, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (47, 4, 8, 35.00, 14.5, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (48, 4, 9, 15.00, 13, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `order_details` VALUES (49, 5, 22, 10.00, 11, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (50, 5, 40, 10.00, 13.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (51, 5, 39, 10.00, 13.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (52, 5, 18, 15.00, 14.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (53, 5, 4, 90.00, 15, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (54, 5, 2, 20.00, 11, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (55, 5, 1, 70.00, 13.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (56, 5, 27, 32.00, 19, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (57, 5, 3, 124.00, 13.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (58, 5, 15, 10.00, 15.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (59, 5, 14, 10.00, 15.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (60, 5, 32, 100.00, 14, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (61, 5, 6, 5.00, 18.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (62, 5, 28, 32.00, 17.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (63, 5, 34, 10.00, 16.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (64, 5, 5, 36.00, 17.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (65, 5, 41, 10.00, 20.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (66, 5, 42, 10.00, 22, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (67, 5, 13, 12.00, 22.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (68, 5, 7, 85.00, 15, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (69, 5, 8, 45.00, 14.5, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (70, 5, 10, 55.00, 20, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (71, 5, 33, 20.00, 24, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (72, 5, 35, 20.00, 14, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (73, 5, 9, 90.00, 13, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `order_details` VALUES (74, 6, 40, 10.00, 13.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (75, 6, 39, 5.00, 13.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (76, 6, 4, 40.00, 15, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (77, 6, 2, 25.00, 11, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (78, 6, 1, 45.00, 13.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (79, 6, 12, 10.00, 21, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (80, 6, 37, 5.00, 21.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (81, 6, 3, 45.00, 13.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (82, 6, 32, 10.00, 14, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (83, 6, 6, 30.00, 18.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (84, 6, 28, 5.00, 17.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (85, 6, 11, 5.00, 21.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (86, 6, 5, 15.00, 17.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (87, 6, 7, 30.00, 15, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (88, 6, 8, 20.00, 14.5, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (89, 6, 33, 5.00, 24, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (90, 6, 9, 50.00, 13, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `order_details` VALUES (91, 7, 17, 1.00, 80, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (92, 7, 39, 10.00, 13.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (93, 7, 20, 10.00, 14.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (94, 7, 19, 10.00, 14.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (95, 7, 4, 30.00, 15, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (96, 7, 2, 15.00, 11, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (97, 7, 1, 10.00, 13.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (98, 7, 27, 10.00, 19, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (99, 7, 12, 20.00, 21, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (100, 7, 3, 20.00, 13.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (101, 7, 24, 10.00, 19.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (102, 7, 28, 10.00, 17.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (103, 7, 5, 20.00, 17.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (104, 7, 41, 5.00, 20.5, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (105, 7, 42, 5.00, 22, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (106, 7, 33, 10.00, 24, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (107, 7, 9, 10.00, 13, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `order_details` VALUES (108, 8, 38, 10.00, 18.5, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (109, 8, 2, 20.00, 11, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (110, 8, 1, 20.00, 13.5, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (111, 8, 27, 5.00, 19, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (112, 8, 3, 30.00, 13.5, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (113, 8, 24, 10.00, 19.5, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (114, 8, 32, 10.00, 14, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (115, 8, 6, 10.00, 18.5, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (116, 8, 11, 10.00, 21.5, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (117, 8, 16, 5.00, 41, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (118, 8, 7, 5.00, 15, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (119, 8, 8, 10.00, 14.5, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (120, 8, 33, 10.00, 24, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (121, 8, 9, 25.00, 13, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `order_details` VALUES (122, 9, 18, 10.00, 14.5, '2022-04-28 14:54:38', '2022-04-28 14:54:38', NULL);
INSERT INTO `order_details` VALUES (123, 9, 4, 10.00, 15, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (124, 9, 9, 20.00, 13, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (125, 9, 5, 5.00, 17.5, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (126, 9, 39, 5.00, 13.5, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (127, 9, 40, 5.00, 13.5, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (128, 9, 34, 5.00, 16.5, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (129, 9, 36, 5.00, 17, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (130, 9, 32, 10.00, 14, '2022-04-28 14:54:39', '2022-04-28 14:54:39', NULL);
INSERT INTO `order_details` VALUES (131, 10, 18, 5.00, 14.5, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (132, 10, 4, 10.00, 15, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (133, 10, 38, 10.00, 18.5, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (134, 10, 2, 10.00, 11, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (135, 10, 1, 20.00, 13.5, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (136, 10, 12, 10.00, 21, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (137, 10, 32, 10.00, 14, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (138, 10, 6, 20.00, 18.5, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (139, 10, 5, 10.00, 17.5, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (140, 10, 16, 2.00, 41, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (141, 10, 7, 10.00, 15, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (142, 10, 10, 5.00, 20, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (143, 10, 35, 10.00, 14, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (144, 10, 9, 30.00, 13, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `order_details` VALUES (145, 11, 23, 10.00, 11, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (146, 11, 22, 20.00, 11, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (147, 11, 40, 10.00, 13.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (148, 11, 39, 20.00, 13.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (149, 11, 18, 10.00, 14.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (150, 11, 4, 60.00, 15, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (151, 11, 2, 20.00, 11, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (152, 11, 1, 20.00, 13.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (153, 11, 25, 10.00, 19.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (154, 11, 12, 10.00, 21, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (155, 11, 3, 50.00, 13.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (156, 11, 32, 80.00, 14, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (157, 11, 6, 30.00, 18.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (158, 11, 34, 10.00, 16.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (159, 11, 5, 20.00, 17.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (160, 11, 16, 10.00, 41, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (161, 11, 7, 30.00, 15, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (162, 11, 8, 20.00, 14.5, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (163, 11, 10, 30.00, 20, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (164, 11, 33, 20.00, 24, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (165, 11, 35, 20.00, 14, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (166, 11, 9, 50.00, 13, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `order_details` VALUES (167, 12, 18, 10.00, 14.5, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (168, 12, 14, 5.00, 15.5, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (169, 12, 15, 5.00, 15.5, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (170, 12, 2, 20.00, 11, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (171, 12, 9, 20.00, 13, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (172, 12, 23, 10.00, 11, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (173, 12, 1, 20.00, 13.5, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (174, 12, 4, 20.00, 15, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (175, 12, 3, 20.00, 13.5, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (176, 12, 10, 5.00, 20, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `order_details` VALUES (177, 13, 22, 10.00, 11, '2022-04-28 15:11:10', '2022-04-28 15:11:10', NULL);
INSERT INTO `order_details` VALUES (178, 13, 23, 10.00, 11, '2022-04-28 15:11:10', '2022-04-28 15:11:10', NULL);
INSERT INTO `order_details` VALUES (179, 13, 11, 20.00, 21.5, '2022-04-28 15:11:10', '2022-04-28 15:11:10', NULL);
INSERT INTO `order_details` VALUES (180, 13, 32, 20.00, 14, '2022-04-28 15:11:10', '2022-04-28 15:11:10', NULL);
INSERT INTO `order_details` VALUES (181, 14, 23, 10.00, 11, '2022-04-28 15:14:51', '2022-04-28 15:14:51', NULL);
INSERT INTO `order_details` VALUES (182, 14, 22, 10.00, 11, '2022-04-28 15:14:51', '2022-04-28 15:14:51', NULL);
INSERT INTO `order_details` VALUES (183, 14, 39, 5.00, 13.5, '2022-04-28 15:14:51', '2022-04-28 15:14:51', NULL);
INSERT INTO `order_details` VALUES (184, 14, 18, 20.00, 14.5, '2022-04-28 15:14:51', '2022-04-28 15:14:51', NULL);
INSERT INTO `order_details` VALUES (185, 14, 2, 10.00, 11, '2022-04-28 15:14:51', '2022-04-28 15:14:51', NULL);
INSERT INTO `order_details` VALUES (186, 14, 1, 10.00, 13.5, '2022-04-28 15:14:52', '2022-04-28 15:14:52', NULL);
INSERT INTO `order_details` VALUES (187, 14, 27, 5.00, 19, '2022-04-28 15:14:52', '2022-04-28 15:14:52', NULL);
INSERT INTO `order_details` VALUES (188, 14, 3, 90.00, 13.5, '2022-04-28 15:14:52', '2022-04-28 15:14:52', NULL);
INSERT INTO `order_details` VALUES (189, 14, 15, 5.00, 15.5, '2022-04-28 15:14:52', '2022-04-28 15:14:52', NULL);
INSERT INTO `order_details` VALUES (190, 14, 32, 10.00, 14, '2022-04-28 15:14:52', '2022-04-28 15:14:52', NULL);
INSERT INTO `order_details` VALUES (191, 14, 13, 3.00, 22.5, '2022-04-28 15:14:52', '2022-04-28 15:14:52', NULL);
INSERT INTO `order_details` VALUES (192, 14, 9, 20.00, 13, '2022-04-28 15:14:52', '2022-04-28 15:14:52', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'INV220428001', 2, 1, 1, 6295, 0, 0, 6295, NULL, 0, NULL, '2022-04-28 08:59:37', '2022-04-28 08:59:37', NULL);
INSERT INTO `orders` VALUES (2, 'INV220428002', 2, 1, 1, 15190, 0, 0, 15190, NULL, 0, NULL, '2022-04-28 09:16:39', '2022-04-28 09:16:39', NULL);
INSERT INTO `orders` VALUES (3, 'INV220428003', 3, 1, 1, 446, 0, 0, 446, NULL, 0, NULL, '2022-04-28 09:18:00', '2022-04-28 09:18:00', NULL);
INSERT INTO `orders` VALUES (4, 'INV220428004', 14, 1, 1, 2923.5, 0, 0, 2923.5, NULL, 0, NULL, '2022-04-28 09:27:46', '2022-04-28 09:27:46', NULL);
INSERT INTO `orders` VALUES (5, 'INV220428005', 4, 1, 1, 14204.5, 0, 0, 14204.5, NULL, 0, NULL, '2022-04-28 09:39:52', '2022-04-28 09:39:52', NULL);
INSERT INTO `orders` VALUES (6, 'INV220428006', 5, 1, 1, 5272.5, 0, 0, 5272.5, NULL, 0, NULL, '2022-04-28 14:11:12', '2022-04-28 14:11:12', NULL);
INSERT INTO `orders` VALUES (7, 'INV220428007', 6, 1, 1, 3437.5, 0, 0, 3437.5, NULL, 0, NULL, '2022-04-28 14:47:25', '2022-04-28 14:47:25', NULL);
INSERT INTO `orders` VALUES (8, 'INV220428008', 12, 1, 1, 2900, 0, 0, 2900, NULL, 0, NULL, '2022-04-28 14:52:35', '2022-04-28 14:52:35', NULL);
INSERT INTO `orders` VALUES (9, 'INV220428009', 7, 1, 1, 1085, 0, 0, 1085, NULL, 0, NULL, '2022-04-28 14:54:38', '2022-04-28 14:54:38', NULL);
INSERT INTO `orders` VALUES (10, 'INV220428010', 8, 1, 1, 2544.5, 0, 0, 2544.5, NULL, 0, NULL, '2022-04-28 14:59:19', '2022-04-28 14:59:19', NULL);
INSERT INTO `orders` VALUES (11, 'INV220428011', 9, 1, 1, 8700, 0, 0, 8700, NULL, 0, NULL, '2022-04-28 15:06:15', '2022-04-28 15:06:15', NULL);
INSERT INTO `orders` VALUES (12, 'INV220428012', 10, 1, 1, 1830, 0, 0, 1830, NULL, 0, NULL, '2022-04-28 15:09:03', '2022-04-28 15:09:03', NULL);
INSERT INTO `orders` VALUES (13, 'INV220428013', 11, 1, 1, 930, 0, 0, 930, NULL, 0, NULL, '2022-04-28 15:11:10', '2022-04-28 15:11:10', NULL);
INSERT INTO `orders` VALUES (14, 'INV220428014', 13, 1, 1, 2677.5, 0, 0, 2677.5, NULL, 0, NULL, '2022-04-28 15:14:51', '2022-04-28 15:14:51', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'Apptoken', 'c98d3ab1b289cb111b3efb9590e978ad2344309035c704595a2bc880a1237a09', '[\"*\"]', '2022-04-26 09:05:48', '2022-04-26 05:59:19', '2022-04-26 09:05:48');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'Apptoken', '6eef8f71333a1a91f51e20d4eefb76071b46d4d49576887a76dd678a71926ce7', '[\"*\"]', '2022-04-26 08:35:18', '2022-04-26 08:32:52', '2022-04-26 08:35:18');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 1, 'Apptoken', 'c0e65a1ef729ee64a09d9be19e773a3da4040e12dfd8b54847c4e72bd56b1c40', '[\"*\"]', '2022-04-28 09:39:52', '2022-04-28 08:49:56', '2022-04-28 09:39:52');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 1, 'Apptoken', '5fb435f5620c3777e73038f8be1352d08cbc56431285251d4ce2cee65e79c008', '[\"*\"]', '2022-04-28 15:21:14', '2022-04-28 14:01:27', '2022-04-28 15:21:14');

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
  INDEX `products_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, '316466814841', 'a3s', 'a3s', 'LCD IPHONE', 'undefined', '1651156393.jpg', 13.5, '2022-04-13 14:59:33', '2022-04-28 14:33:13', NULL);
INSERT INTO `products` VALUES (2, 1, '571501119594', 'a1k', 'a1k', 'LCD IPHONE', 'undefined', 'no image created', 11, '2022-04-13 15:00:23', '2022-04-13 15:00:23', NULL);
INSERT INTO `products` VALUES (3, 1, '908601349849', 'a5s', 'a5s', 'LCD IPHONE', 'undefined', 'no image created', 13.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (4, 1, '908601349850', 'a15', 'a15', 'LCD IPHONE', 'undefined', 'no image created', 15, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (5, 1, '908601349851', 'f9', 'f9', 'LCD IPHONE', 'undefined', 'no image created', 17.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (6, 1, '908601349852', 'c3 ori', 'c3 ori', 'LCD IPHONE', 'undefined', 'no image created', 18.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (7, 1, '908601349853', 'y12', 'y12', 'LCD IPHONE', 'undefined', 'no image created', 15, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (8, 1, '908601349854', 'y12s', 'y12s', 'LCD IPHONE', 'undefined', 'no image created', 14.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (9, 1, '908601349855', 'y91', 'y91', 'LCD IPHONE', 'undefined', 'no image created', 13, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (10, 1, '908601349856', 'y19', 'y19', 'LCD IPHONE', 'undefined', 'no image created', 20, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (11, 1, '908601349857', 'f11pro ori', 'f11pro ori', 'LCD IPHONE', 'undefined', 'no image created', 21.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (12, 1, '908601349858', 'a53 ori', 'a53 ori', 'LCD IPHONE', 'undefined', 'no image created', 21, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (13, 1, '908601349859', 'reno2f', 'reno2f', 'LCD IPHONE', 'undefined', 'no image created', 22.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (14, 1, '908601349860', 'a83 w', 'a83 w', 'LCD IPHONE', 'undefined', 'no image created', 15.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (15, 1, '908601349861', 'a83 b', 'a83 b', 'LCD IPHONE', 'undefined', 'no image created', 15.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (16, 1, '908601349862', 'x gx', 'x gx', 'LCD IPHONE', 'undefined', 'no image created', 41, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (17, 1, '908601349863', '11pro max gx', '11pro max gx', 'LCD IPHONE', 'undefined', 'no image created', 80, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (18, 1, '908601349864', '7p b', '7p b', 'LCD IPHONE', 'undefined', 'no image created', 14.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (19, 1, '908601349865', '8p w', '8p w', 'LCD IPHONE', 'undefined', 'no image created', 14.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (20, 1, '908601349866', '8p b', '8p b', 'LCD IPHONE', 'undefined', 'no image created', 14.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (21, 1, '908601349867', '6sp w', '6sp w', 'LCD IPHONE', 'undefined', 'no image created', 14, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (22, 1, '908601349868', '6g w', '6g w', 'LCD OPPO', 'undefined', 'no image created', 11, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (23, 1, '908601349869', '6g b', '6g b', 'LCD OPPO', 'undefined', 'no image created', 11, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (24, 1, '908601349870', 'a5s ori', 'a5s ori', 'LCD OPPO', 'undefined', 'no image created', 19.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (25, 1, '908601349871', 'a52 ori', 'a52 ori', 'LCD OPPO', 'undefined', 'no image created', 19.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (26, 1, '908601349872', 'y12s ori', 'y12s ori', 'LCD OPPO', 'undefined', 'no image created', 20, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (27, 1, '908601349873', 'a53', 'a53', 'LCD OPPO', 'undefined', 'no image created', 19, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (28, 1, '908601349874', 'f11pro', 'f11pro', 'LCD OPPO', 'undefined', 'no image created', 17.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (29, 1, '908601349875', 'y12s a', 'y12s a', 'LCD OPPO', 'undefined', 'no image created', 15.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (30, 1, '908601349876', 'a3s a', 'a3s a', 'LCD OPPO', 'undefined', 'no image created', 14.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (31, 1, '908601349877', 'y91 a', 'y91 a', 'LCD OPPO', 'undefined', 'no image created', 14.5, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (32, 1, '908601349878', 'c3', 'c3', 'LCD OPPO', 'undefined', 'no image created', 14, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (33, 1, '908601349879', 'y30 ori', 'y30 ori', 'LCD OPPO', 'undefined', 'no image created', 24, '2022-04-13 15:00:52', '2022-04-13 15:00:52', NULL);
INSERT INTO `products` VALUES (34, 1, '908601349880', 'f7', 'f7', 'LCD OPPO', 'undefined', 'no image created', 16.5, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (35, 1, '908601349881', 'y81', 'y81', 'LCD VIVO', 'undefined', 'no image created', 14, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (36, 1, '908601349882', 'y85', 'y85', 'LCD VIVO', 'undefined', 'no image created', 17, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (37, 1, '908601349883', 'a54 ori', 'a54 ori', 'LCD OPPO', 'undefined', 'no image created', 21.5, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (38, 1, '908601349884', 'a15 ori', 'a15 ori', 'LCD OPPO', 'undefined', 'no image created', 18.5, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (39, 1, '908601349885', '6p w', '6p w', 'LCD IPHONE', 'undefined', 'no image created', 13.5, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (40, 1, '908601349886', '6p b', '6p b', 'LCD IPHONE', 'undefined', 'no image created', 13.5, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (41, 1, '908601349887', 'pova1', 'pova1', 'POVA', 'undefined', 'no image created', 20.5, '2022-04-01 09:25:50', NULL, NULL);
INSERT INTO `products` VALUES (42, 1, '908601349888', 'pova2', 'pova2', 'POVA', 'undefined', 'no image created', 22, '2022-04-01 09:25:50', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_details
-- ----------------------------
INSERT INTO `purchase_details` VALUES (1, 1, 1, 11.30, 560.00, '2022-04-26 06:01:03', '2022-04-26 06:01:03', NULL);
INSERT INTO `purchase_details` VALUES (2, 1, 2, 10.00, 300.00, '2022-04-26 06:01:03', '2022-04-26 06:01:03', NULL);
INSERT INTO `purchase_details` VALUES (3, 1, 3, 11.30, 500.00, '2022-04-26 06:01:03', '2022-04-26 06:01:03', NULL);
INSERT INTO `purchase_details` VALUES (4, 2, 4, 13.00, 500.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (5, 2, 5, 15.80, 200.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (6, 2, 6, 16.30, 200.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (7, 2, 7, 13.30, 300.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (8, 2, 8, 13.00, 200.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (9, 2, 9, 11.00, 400.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (10, 2, 10, 18.00, 250.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (11, 2, 11, 19.50, 100.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (12, 2, 12, 19.20, 100.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (13, 2, 13, 20.00, 50.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (14, 2, 14, 13.70, 100.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (15, 2, 15, 13.70, 100.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (16, 2, 16, 34.60, 50.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (17, 2, 17, 67.50, 20.00, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);
INSERT INTO `purchase_details` VALUES (18, 2, 18, 12.80, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (19, 2, 19, 12.80, 50.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (20, 2, 20, 12.80, 50.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (21, 2, 21, 12.50, 50.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (22, 2, 22, 9.50, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (23, 2, 23, 9.50, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (24, 2, 24, 18.40, 140.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (25, 2, 25, 17.70, 40.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (26, 2, 27, 16.70, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (27, 2, 28, 15.30, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (28, 2, 32, 12.00, 500.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (29, 2, 33, 21.50, 160.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (30, 2, 34, 14.30, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (31, 2, 35, 11.50, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (32, 2, 36, 15.00, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (33, 2, 37, 19.00, 150.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (34, 2, 38, 16.00, 150.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (35, 2, 39, 12.00, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (36, 2, 40, 12.00, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (37, 2, 41, 18.00, 100.00, '2022-04-26 14:13:27', NULL, NULL);
INSERT INTO `purchase_details` VALUES (38, 2, 42, 19.50, 100.00, '2022-04-26 14:13:27', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES (1, 'P-2204260001', 1, 1, 1, '20220426_v12__59_1650952763563', 14978, NULL, 14978, '2022-04-26 06:01:03', '2022-04-26 06:01:03', NULL);
INSERT INTO `purchases` VALUES (2, 'P-2204260002', 1, 1, 1, '20220426_v13__4_1650953077518', 75589, NULL, 75589, '2022-04-26 06:42:00', '2022-04-26 06:42:00', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stocks
-- ----------------------------
INSERT INTO `stocks` VALUES (1, 1, 1, 0.00, 310, '2022-04-26 06:01:03', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (2, 1, 2, 0.00, 135, '2022-04-26 06:01:03', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (3, 1, 3, 0.00, 0, '2022-04-26 06:01:03', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (4, 1, 4, 0.00, 120, '2022-04-26 06:42:00', '2022-04-28 15:09:03', NULL);
INSERT INTO `stocks` VALUES (5, 1, 5, 0.00, 0, '2022-04-26 06:42:00', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (6, 1, 6, 0.00, 0, '2022-04-26 06:42:00', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (7, 1, 7, 0.00, 0, '2022-04-26 06:42:00', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (8, 1, 8, 0.00, 0, '2022-04-26 06:42:00', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (9, 1, 9, 0.00, 20, '2022-04-26 06:42:00', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (10, 1, 10, 0.00, 135, '2022-04-26 06:42:00', '2022-04-28 15:09:03', NULL);
INSERT INTO `stocks` VALUES (11, 1, 11, 0.00, 15, '2022-04-26 06:42:00', '2022-04-28 15:11:10', NULL);
INSERT INTO `stocks` VALUES (12, 1, 12, 0.00, 0, '2022-04-26 06:42:00', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (13, 1, 13, 0.00, 30, '2022-04-26 06:42:00', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (14, 1, 14, 0.00, 82, '2022-04-26 06:42:00', '2022-04-28 15:09:03', NULL);
INSERT INTO `stocks` VALUES (15, 1, 15, 0.00, 76, '2022-04-26 06:42:00', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (16, 1, 16, 0.00, 18, '2022-04-26 06:42:00', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (17, 1, 17, 0.00, 13, '2022-04-26 06:42:00', '2022-04-28 14:47:25', NULL);
INSERT INTO `stocks` VALUES (18, 1, 18, 0.00, 0, '2022-04-26 14:24:01', '2022-04-28 15:14:51', NULL);
INSERT INTO `stocks` VALUES (19, 1, 19, 0.00, 30, '2022-04-26 14:24:01', '2022-04-28 14:47:25', NULL);
INSERT INTO `stocks` VALUES (20, 1, 20, 0.00, 30, '2022-04-26 14:24:01', '2022-04-28 14:47:25', NULL);
INSERT INTO `stocks` VALUES (21, 1, 21, 0.00, -10, '2022-04-26 14:24:01', '2022-04-28 08:59:37', NULL);
INSERT INTO `stocks` VALUES (22, 1, 22, 0.00, 20, '2022-04-26 14:24:01', '2022-04-28 15:14:51', NULL);
INSERT INTO `stocks` VALUES (23, 1, 23, 0.00, 10, '2022-04-26 14:24:01', '2022-04-28 15:14:51', NULL);
INSERT INTO `stocks` VALUES (24, 1, 24, 0.00, 60, '2022-04-26 14:24:01', '2022-04-28 14:52:35', NULL);
INSERT INTO `stocks` VALUES (25, 1, 25, 0.00, 0, '2022-04-26 14:24:01', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (26, 1, 27, 0.00, 48, '2022-04-26 14:24:01', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (27, 1, 28, 0.00, 0, '2022-04-26 14:24:01', '2022-04-28 14:47:25', NULL);
INSERT INTO `stocks` VALUES (28, 1, 32, 0.00, 160, '2022-04-26 14:24:01', '2022-04-28 15:14:52', NULL);
INSERT INTO `stocks` VALUES (29, 1, 33, 0.00, 75, '2022-04-26 14:24:01', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (30, 1, 34, 0.00, 55, '2022-04-26 14:24:01', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (31, 1, 35, 0.00, 50, '2022-04-26 14:24:01', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (32, 1, 36, 0.00, 95, '2022-04-26 14:24:01', '2022-04-28 14:54:39', NULL);
INSERT INTO `stocks` VALUES (33, 1, 37, 0.00, 135, '2022-04-26 14:24:01', '2022-04-28 14:11:12', NULL);
INSERT INTO `stocks` VALUES (34, 1, 38, 0.00, 100, '2022-04-26 14:24:01', '2022-04-28 14:59:19', NULL);
INSERT INTO `stocks` VALUES (35, 1, 39, 0.00, 5, '2022-04-26 14:24:01', '2022-04-28 15:14:51', NULL);
INSERT INTO `stocks` VALUES (36, 1, 40, 0.00, 45, '2022-04-26 14:24:01', '2022-04-28 15:06:15', NULL);
INSERT INTO `stocks` VALUES (37, 1, 41, 0.00, 85, '2022-04-26 14:24:01', '2022-04-28 14:47:25', NULL);
INSERT INTO `stocks` VALUES (38, 1, 42, 0.00, 85, '2022-04-26 14:24:01', '2022-04-28 14:47:25', NULL);

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
INSERT INTO `suppliers` VALUES (1, 'None', 'Phnom Penh', 'test@test.com', '888888', '2022-04-26 06:00:10', '2022-04-26 06:00:10', NULL);

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
INSERT INTO `warehouses` VALUES (1, 'P1', 'Phnom penh', '2022-04-13 15:11:25', '2022-04-13 15:11:25', NULL);

SET FOREIGN_KEY_CHECKS = 1;

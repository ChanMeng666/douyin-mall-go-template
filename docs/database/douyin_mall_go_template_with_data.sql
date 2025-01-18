/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : douyin_mall_go_template

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 18/01/2025 16:02:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `level` tinyint NOT NULL,
  `sort_order` int NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '手机数码', NULL, 1, 1, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `categories` VALUES (2, '电脑办公', NULL, 1, 2, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `categories` VALUES (3, '智能手机', 1, 2, 1, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `categories` VALUES (4, '笔记本电脑', 2, 2, 1, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `categories` VALUES (5, '平板电脑', 1, 2, 2, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `product_snapshot` json NOT NULL COMMENT 'Snapshot of product at order time',
  `quantity` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 1, '{\"name\": \"iPhone 15 Pro 256GB 暗夜紫\", \"price\": 8999.0}', 1, 8999.00, '2025-01-18 15:58:50');
INSERT INTO `order_items` VALUES (2, 2, 3, '{\"name\": \"MacBook Pro 14寸 M3芯片\", \"price\": 14999.0}', 1, 14999.00, '2025-01-18 15:58:50');
INSERT INTO `order_items` VALUES (3, 3, 2, '{\"name\": \"小米14 Pro 512GB 钛金黑\", \"price\": 4999.0}', 2, 4999.00, '2025-01-18 15:58:50');
INSERT INTO `order_items` VALUES (4, 4, 4, '{\"name\": \"iPad Air 5 256GB WIFI版\", \"price\": 4699.0}', 1, 4699.00, '2025-01-18 15:58:50');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `total_amount` decimal(10, 2) NOT NULL,
  `actual_amount` decimal(10, 2) NOT NULL,
  `address_snapshot` json NOT NULL COMMENT 'Snapshot of address at order time',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '0: pending payment, 1: paid, 2: shipped, 3: delivered, 4: completed, -1: cancelled',
  `payment_type` tinyint NULL DEFAULT NULL COMMENT '1: alipay, 2: wechat, 3: credit card',
  `payment_time` timestamp NULL DEFAULT NULL,
  `shipping_time` timestamp NULL DEFAULT NULL,
  `delivery_time` timestamp NULL DEFAULT NULL,
  `completion_time` timestamp NULL DEFAULT NULL,
  `cancel_time` timestamp NULL DEFAULT NULL,
  `cancel_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '202501180001', 1, 8999.00, 8999.00, '{\"phone\": \"13800138001\", \"address\": \"广东省深圳市南山区科技园南区T3栋801\", \"recipient_name\": \"张三\"}', 4, 1, '2025-01-18 10:00:00', '2025-01-18 14:00:00', '2025-01-19 10:00:00', NULL, NULL, NULL, '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `orders` VALUES (2, '202501180002', 1, 14999.00, 14999.00, '{\"phone\": \"13800138001\", \"address\": \"广东省深圳市南山区科技园南区T3栋801\", \"recipient_name\": \"张三\"}', 2, 2, '2025-01-18 11:00:00', '2025-01-18 15:00:00', NULL, NULL, NULL, NULL, '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `orders` VALUES (3, '202501180003', 2, 9998.00, 9998.00, '{\"phone\": \"13800138002\", \"address\": \"广东省广州市天河区天河路222号\", \"recipient_name\": \"李四\"}', 1, 1, '2025-01-18 12:00:00', NULL, NULL, NULL, NULL, NULL, '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `orders` VALUES (4, '202501180004', 3, 4699.00, 4699.00, '{\"phone\": \"13800138003\", \"address\": \"北京市朝阳区朝阳门外大街19号\", \"recipient_name\": \"王五\"}', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 15:58:50', '2025-01-18 15:58:50');

-- ----------------------------
-- Table structure for payment_records
-- ----------------------------
DROP TABLE IF EXISTS `payment_records`;
CREATE TABLE `payment_records`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `payment_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `payment_type` tinyint NOT NULL COMMENT '1: alipay, 2: wechat, 3: credit card',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '0: pending, 1: success, 2: failed, 3: refunded',
  `callback_time` timestamp NULL DEFAULT NULL COMMENT 'Payment callback time',
  `callback_data` json NULL COMMENT 'Complete callback data',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `payment_no`(`payment_no` ASC) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_payment_no`(`payment_no` ASC) USING BTREE,
  INDEX `idx_transaction_id`(`transaction_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_records
-- ----------------------------
INSERT INTO `payment_records` VALUES (1, 1, 'PAY202501180001', 'ALIPAY123456', 8999.00, 1, 1, '2025-01-18 10:00:00', '{\"buyer_id\": \"2088123456\", \"trade_no\": \"ALIPAY123456\"}', '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `payment_records` VALUES (2, 2, 'PAY202501180002', 'WXPAY123456', 14999.00, 2, 1, '2025-01-18 11:00:00', '{\"openid\": \"wx123456\", \"transaction_id\": \"WXPAY123456\"}', '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `payment_records` VALUES (3, 3, 'PAY202501180003', 'ALIPAY123457', 9998.00, 1, 1, '2025-01-18 12:00:00', '{\"buyer_id\": \"2088123457\", \"trade_no\": \"ALIPAY123457\"}', '2025-01-18 15:58:50', '2025-01-18 15:58:50');

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `rating` tinyint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `images` json NULL,
  `status` tinyint NULL DEFAULT 1 COMMENT '1: visible, 0: hidden',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `product_reviews_chk_1` CHECK (`rating` between 1 and 5)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------
INSERT INTO `product_reviews` VALUES (1, 1, 1, 1, 5, '非常好用的手机，外观设计非常惊艳，性能也很强劲！', '[\"review1.jpg\", \"review2.jpg\"]', 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50', NULL);
INSERT INTO `product_reviews` VALUES (2, 1, 3, 2, 4, 'Mac的系统非常流畅，就是价格稍贵', '[\"review3.jpg\"]', 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50', NULL);
INSERT INTO `product_reviews` VALUES (3, 2, 2, 3, 5, '国产手机性价比之王，拍照效果很赞', '[\"review4.jpg\", \"review5.jpg\"]', 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50', NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` decimal(10, 2) NOT NULL,
  `original_price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int NOT NULL DEFAULT 0,
  `images` json NULL,
  `sales_count` int NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 1 COMMENT '1: on sale, 0: off sale, -1: deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_sales`(`sales_count` ASC) USING BTREE,
  INDEX `idx_updated_at`(`updated_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 3, 'iPhone 15 Pro 256GB 暗夜紫', '最新款iPhone，搭载A17芯片', 8999.00, 9999.00, 100, '[\"image1.jpg\", \"image2.jpg\"]', 500, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50', NULL);
INSERT INTO `products` VALUES (2, 3, '小米14 Pro 512GB 钛金黑', '年度旗舰，骁龙8 Gen 3处理器', 4999.00, 5999.00, 200, '[\"image3.jpg\", \"image4.jpg\"]', 300, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50', NULL);
INSERT INTO `products` VALUES (3, 4, 'MacBook Pro 14寸 M3芯片', '新款MacBook，搭载M3芯片', 14999.00, 15999.00, 50, '[\"image5.jpg\", \"image6.jpg\"]', 100, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50', NULL);
INSERT INTO `products` VALUES (4, 5, 'iPad Air 5 256GB WIFI版', '轻薄便携，生产力工具', 4699.00, 5099.00, 150, '[\"image7.jpg\", \"image8.jpg\"]', 200, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50', NULL);

-- ----------------------------
-- Table structure for shopping_cart_items
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_items`;
CREATE TABLE `shopping_cart_items`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT 1,
  `selected` tinyint(1) NULL DEFAULT 1,
  `status` tinyint NULL DEFAULT 1 COMMENT '1: valid, 0: invalid',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_product`(`user_id` ASC, `product_id` ASC, `status` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart_items
-- ----------------------------
INSERT INTO `shopping_cart_items` VALUES (1, 1, 1, 1, 1, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `shopping_cart_items` VALUES (2, 1, 3, 1, 1, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `shopping_cart_items` VALUES (3, 2, 2, 2, 1, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50');
INSERT INTO `shopping_cart_items` VALUES (4, 3, 4, 1, 0, 1, '2025-01-18 15:58:50', '2025-01-18 15:58:50');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `recipient_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailed_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 1 COMMENT '1: active, 0: inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES (1, 1, '张三', '13800138001', '广东省', '深圳市', '南山区', '科技园南区T3栋801', 1, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `user_addresses` VALUES (2, 1, '张三爸爸', '13800138011', '广东省', '深圳市', '福田区', '福强路1001号', 0, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `user_addresses` VALUES (3, 2, '李四', '13800138002', '广东省', '广州市', '天河区', '天河路222号', 1, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `user_addresses` VALUES (4, 3, '王五', '13800138003', '北京市', '北京市', '朝阳区', '朝阳门外大街19号', 1, 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'user',
  `status` tinyint NULL DEFAULT 1 COMMENT '1: active, 0: inactive, -1: deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_status_deleted`(`status` ASC, `deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhangsan', '$2a$10$1qAz2wSx3eDc4rFv5tGb5t', 'zhangsan@example.com', '13800138001', 'https://example.com/avatars/1.jpg', 'user', 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `users` VALUES (2, 'lisi', '$2a$10$2qAz2wSx3eDc4rFv5tGb5u', 'lisi@example.com', '13800138002', 'https://example.com/avatars/2.jpg', 'user', 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `users` VALUES (3, 'wangwu', '$2a$10$3qAz2wSx3eDc4rFv5tGb5v', 'wangwu@example.com', '13800138003', 'https://example.com/avatars/3.jpg', 'user', 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);
INSERT INTO `users` VALUES (4, 'admin', '$2a$10$4qAz2wSx3eDc4rFv5tGb5w', 'admin@example.com', '13800138004', 'https://example.com/avatars/4.jpg', 'admin', 1, '2025-01-18 15:58:49', '2025-01-18 15:58:49', NULL);

SET FOREIGN_KEY_CHECKS = 1;

-- 高端公寓租赁管理系统数据库设计
-- Database: apartment_system
-- Character Set: utf8mb4
-- Collation: utf8mb4_unicode_ci

-- ====================================
-- 用户表
-- ====================================
CREATE TABLE IF NOT EXISTS `user` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    `username` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    `password` VARCHAR(255) NOT NULL COMMENT '密码（加密）',
    `email` VARCHAR(100) NOT NULL UNIQUE COMMENT '邮箱',
    `phone` VARCHAR(20) NOT NULL UNIQUE COMMENT '手机号',
    `real_name` VARCHAR(50) COMMENT '真实姓名',
    `id_card` VARCHAR(18) COMMENT '身份证号',
    `avatar` VARCHAR(255) COMMENT '头像URL',
    `role` VARCHAR(20) NOT NULL DEFAULT 'USER' COMMENT '角色：USER-用户, LANDLORD-房东, ADMIN-管理员',
    `status` VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' COMMENT '状态：ACTIVE-正常, DISABLED-禁用',
    `credit_score` INT DEFAULT 100 COMMENT '信用分数',
    `verified` BOOLEAN DEFAULT FALSE COMMENT '是否实名认证',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX `idx_username` (`username`),
    INDEX `idx_email` (`email`),
    INDEX `idx_phone` (`phone`),
    INDEX `idx_role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ====================================
-- 房源表
-- ====================================
CREATE TABLE IF NOT EXISTS `property` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '房源ID',
    `landlord_id` BIGINT NOT NULL COMMENT '房东ID',
    `title` VARCHAR(200) NOT NULL COMMENT '房源标题',
    `description` TEXT COMMENT '房源描述',
    `province` VARCHAR(50) NOT NULL COMMENT '省份',
    `city` VARCHAR(50) NOT NULL COMMENT '城市',
    `district` VARCHAR(50) NOT NULL COMMENT '区域',
    `address` VARCHAR(255) NOT NULL COMMENT '详细地址',
    `longitude` DECIMAL(10, 7) COMMENT '经度',
    `latitude` DECIMAL(10, 7) COMMENT '纬度',
    `area` DECIMAL(10, 2) NOT NULL COMMENT '面积（平方米）',
    `room_count` INT NOT NULL COMMENT '房间数',
    `hall_count` INT NOT NULL COMMENT '客厅数',
    `bathroom_count` INT NOT NULL COMMENT '卫生间数',
    `floor` INT NOT NULL COMMENT '楼层',
    `total_floors` INT NOT NULL COMMENT '总楼层',
    `orientation` VARCHAR(20) COMMENT '朝向',
    `decoration` VARCHAR(20) COMMENT '装修等级：SIMPLE-简装, MEDIUM-中装, LUXURY-豪装',
    `rent_price` DECIMAL(10, 2) NOT NULL COMMENT '租金（元/月）',
    `deposit` DECIMAL(10, 2) NOT NULL COMMENT '押金（元）',
    `payment_method` VARCHAR(50) COMMENT '付款方式：押一付一、押一付三等',
    `facilities` JSON COMMENT '设施列表（JSON数组）',
    `nearby_facilities` JSON COMMENT '周边设施（JSON对象）',
    `cover_image` VARCHAR(255) COMMENT '封面图片URL',
    `vr_url` VARCHAR(255) COMMENT 'VR看房URL',
    `status` VARCHAR(20) NOT NULL DEFAULT 'PENDING' COMMENT '状态：PENDING-待审核, APPROVED-已通过, REJECTED-已拒绝, RENTED-已出租, OFFLINE-已下架',
    `view_count` INT DEFAULT 0 COMMENT '浏览次数',
    `favorite_count` INT DEFAULT 0 COMMENT '收藏次数',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (`landlord_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    INDEX `idx_landlord` (`landlord_id`),
    INDEX `idx_city_district` (`city`, `district`),
    INDEX `idx_price` (`rent_price`),
    INDEX `idx_status` (`status`),
    INDEX `idx_created` (`created_at`),
    FULLTEXT INDEX `ft_title_desc` (`title`, `description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='房源表';

-- ====================================
-- 房源图片表
-- ====================================
CREATE TABLE IF NOT EXISTS `property_image` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '图片ID',
    `property_id` BIGINT NOT NULL COMMENT '房源ID',
    `image_url` VARCHAR(255) NOT NULL COMMENT '图片URL',
    `image_type` VARCHAR(20) NOT NULL DEFAULT 'NORMAL' COMMENT '图片类型：NORMAL-普通, PANORAMA-全景',
    `sort_order` INT DEFAULT 0 COMMENT '排序',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    FOREIGN KEY (`property_id`) REFERENCES `property`(`id`) ON DELETE CASCADE,
    INDEX `idx_property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='房源图片表';

-- ====================================
-- 预约看房表
-- ====================================
CREATE TABLE IF NOT EXISTS `appointment` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '预约ID',
    `property_id` BIGINT NOT NULL COMMENT '房源ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `landlord_id` BIGINT NOT NULL COMMENT '房东ID',
    `appointment_date` DATE NOT NULL COMMENT '预约日期',
    `appointment_time` TIME NOT NULL COMMENT '预约时间',
    `contact_name` VARCHAR(50) NOT NULL COMMENT '联系人姓名',
    `contact_phone` VARCHAR(20) NOT NULL COMMENT '联系电话',
    `message` TEXT COMMENT '留言',
    `status` VARCHAR(20) NOT NULL DEFAULT 'PENDING' COMMENT '状态：PENDING-待确认, CONFIRMED-已确认, COMPLETED-已完成, CANCELLED-已取消',
    `cancel_reason` TEXT COMMENT '取消原因',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (`property_id`) REFERENCES `property`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`landlord_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    INDEX `idx_property` (`property_id`),
    INDEX `idx_user` (`user_id`),
    INDEX `idx_landlord` (`landlord_id`),
    INDEX `idx_date_time` (`appointment_date`, `appointment_time`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='预约看房表';

-- ====================================
-- 订单表
-- ====================================
CREATE TABLE IF NOT EXISTS `order` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '订单ID',
    `order_no` VARCHAR(50) NOT NULL UNIQUE COMMENT '订单号',
    `property_id` BIGINT NOT NULL COMMENT '房源ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `landlord_id` BIGINT NOT NULL COMMENT '房东ID',
    `rent_price` DECIMAL(10, 2) NOT NULL COMMENT '租金',
    `deposit` DECIMAL(10, 2) NOT NULL COMMENT '押金',
    `total_amount` DECIMAL(10, 2) NOT NULL COMMENT '总金额',
    `rent_start_date` DATE NOT NULL COMMENT '租期开始日期',
    `rent_end_date` DATE NOT NULL COMMENT '租期结束日期',
    `rent_months` INT NOT NULL COMMENT '租期月数',
    `status` VARCHAR(20) NOT NULL DEFAULT 'PENDING' COMMENT '状态：PENDING-待支付, PAID-已支付, COMPLETED-已完成, CANCELLED-已取消, REFUNDED-已退款',
    `contract_url` VARCHAR(255) COMMENT '合同URL',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (`property_id`) REFERENCES `property`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`landlord_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    INDEX `idx_order_no` (`order_no`),
    INDEX `idx_property` (`property_id`),
    INDEX `idx_user` (`user_id`),
    INDEX `idx_landlord` (`landlord_id`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

-- ====================================
-- 支付记录表
-- ====================================
CREATE TABLE IF NOT EXISTS `payment` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '支付ID',
    `order_id` BIGINT NOT NULL COMMENT '订单ID',
    `payment_no` VARCHAR(50) NOT NULL UNIQUE COMMENT '支付流水号',
    `payment_method` VARCHAR(20) NOT NULL COMMENT '支付方式：ALIPAY-支付宝, WECHAT-微信',
    `amount` DECIMAL(10, 2) NOT NULL COMMENT '支付金额',
    `status` VARCHAR(20) NOT NULL DEFAULT 'PENDING' COMMENT '状态：PENDING-待支付, SUCCESS-成功, FAILED-失败, REFUNDED-已退款',
    `transaction_id` VARCHAR(100) COMMENT '第三方交易号',
    `paid_at` TIMESTAMP NULL COMMENT '支付时间',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (`order_id`) REFERENCES `order`(`id`) ON DELETE CASCADE,
    INDEX `idx_order` (`order_id`),
    INDEX `idx_payment_no` (`payment_no`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付记录表';

-- ====================================
-- 收藏表
-- ====================================
CREATE TABLE IF NOT EXISTS `favorite` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '收藏ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `property_id` BIGINT NOT NULL COMMENT '房源ID',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`property_id`) REFERENCES `property`(`id`) ON DELETE CASCADE,
    UNIQUE KEY `uk_user_property` (`user_id`, `property_id`),
    INDEX `idx_user` (`user_id`),
    INDEX `idx_property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收藏表';

-- ====================================
-- 评价表
-- ====================================
CREATE TABLE IF NOT EXISTS `review` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '评价ID',
    `property_id` BIGINT NOT NULL COMMENT '房源ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `order_id` BIGINT NOT NULL COMMENT '订单ID',
    `rating` INT NOT NULL COMMENT '评分（1-5）',
    `content` TEXT COMMENT '评价内容',
    `images` JSON COMMENT '评价图片（JSON数组）',
    `landlord_reply` TEXT COMMENT '房东回复',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (`property_id`) REFERENCES `property`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`order_id`) REFERENCES `order`(`id`) ON DELETE CASCADE,
    INDEX `idx_property` (`property_id`),
    INDEX `idx_user` (`user_id`),
    INDEX `idx_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评价表';

-- ====================================
-- 用户行为记录表（用于推荐系统）
-- ====================================
CREATE TABLE IF NOT EXISTS `user_behavior` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '行为ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `property_id` BIGINT NOT NULL COMMENT '房源ID',
    `behavior_type` VARCHAR(20) NOT NULL COMMENT '行为类型：VIEW-浏览, FAVORITE-收藏, APPOINTMENT-预约, ORDER-下单',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`property_id`) REFERENCES `property`(`id`) ON DELETE CASCADE,
    INDEX `idx_user` (`user_id`),
    INDEX `idx_property` (`property_id`),
    INDEX `idx_behavior` (`behavior_type`),
    INDEX `idx_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户行为记录表';

-- ====================================
-- 操作日志表
-- ====================================
CREATE TABLE IF NOT EXISTS `operation_log` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '日志ID',
    `user_id` BIGINT COMMENT '操作用户ID',
    `username` VARCHAR(50) COMMENT '操作用户名',
    `operation` VARCHAR(100) NOT NULL COMMENT '操作类型',
    `method` VARCHAR(200) COMMENT '方法名',
    `params` TEXT COMMENT '请求参数',
    `ip` VARCHAR(50) COMMENT 'IP地址',
    `location` VARCHAR(100) COMMENT '操作地点',
    `status` VARCHAR(20) NOT NULL COMMENT '状态：SUCCESS-成功, FAILED-失败',
    `error_msg` TEXT COMMENT '错误信息',
    `execution_time` INT COMMENT '执行时间（毫秒）',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX `idx_user` (`user_id`),
    INDEX `idx_operation` (`operation`),
    INDEX `idx_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志表';

-- ====================================
-- 系统配置表
-- ====================================
CREATE TABLE IF NOT EXISTS `system_config` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '配置ID',
    `config_key` VARCHAR(100) NOT NULL UNIQUE COMMENT '配置键',
    `config_value` TEXT NOT NULL COMMENT '配置值',
    `config_type` VARCHAR(20) NOT NULL COMMENT '配置类型：STRING, NUMBER, BOOLEAN, JSON',
    `description` VARCHAR(255) COMMENT '配置描述',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX `idx_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置表';


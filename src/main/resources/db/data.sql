-- 初始化数据
-- 注意：密码使用BCrypt加密，这里的密码都是 "123456"

-- 插入管理员用户
INSERT INTO `user` (`username`, `password`, `email`, `phone`, `real_name`, `role`, `status`, `verified`) VALUES
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', 'admin@apartment.com', '13800000000', '系统管理员', 'ADMIN', 'ACTIVE', TRUE);

-- 插入测试房东
INSERT INTO `user` (`username`, `password`, `email`, `phone`, `real_name`, `role`, `status`, `verified`) VALUES
('landlord1', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', 'landlord1@apartment.com', '13800000001', '张房东', 'LANDLORD', 'ACTIVE', TRUE),
('landlord2', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', 'landlord2@apartment.com', '13800000002', '李房东', 'LANDLORD', 'ACTIVE', TRUE);

-- 插入测试用户
INSERT INTO `user` (`username`, `password`, `email`, `phone`, `real_name`, `role`, `status`, `verified`) VALUES
('user1', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', 'user1@apartment.com', '13900000001', '王用户', 'USER', 'ACTIVE', TRUE),
('user2', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', 'user2@apartment.com', '13900000002', '赵用户', 'USER', 'ACTIVE', TRUE);

-- 插入测试房源
INSERT INTO `property` (`landlord_id`, `title`, `description`, `province`, `city`, `district`, `address`, `longitude`, `latitude`, `area`, `room_count`, `hall_count`, `bathroom_count`, `floor`, `total_floors`, `orientation`, `decoration`, `rent_price`, `deposit`, `payment_method`, `facilities`, `nearby_facilities`, `status`) VALUES
(2, '豪华三室两厅 精装修 拎包入住', '位于市中心黄金地段，交通便利，周边配套设施齐全。房屋精装修，家具家电齐全，拎包即可入住。', '北京市', '北京', '朝阳区', '朝阳公园附近', 116.473454, 39.934886, 120.00, 3, 2, 2, 15, 30, '南北', 'LUXURY', 8000.00, 8000.00, '押一付三', '["空调", "冰箱", "洗衣机", "热水器", "宽带", "电视", "沙发", "床", "衣柜"]', '{"地铁": "朝阳公园地铁站500米", "商场": "朝阳大悦城1公里", "学校": "朝阳实验小学800米", "医院": "朝阳医院2公里"}', 'APPROVED'),
(2, '温馨两室一厅 近地铁 采光好', '房屋位于安静小区，环境优美，采光极佳。距离地铁站步行5分钟，出行便利。', '北京市', '北京', '海淀区', '中关村大街', 116.310316, 39.983424, 85.00, 2, 1, 1, 10, 20, '南', 'MEDIUM', 6000.00, 6000.00, '押一付一', '["空调", "冰箱", "洗衣机", "热水器", "宽带"]', '{"地铁": "中关村地铁站500米", "商场": "欧美汇购物中心800米", "学校": "中关村一小1公里"}', 'APPROVED'),
(3, '高端公寓 智能家居 全景落地窗', '顶级豪华公寓，配备智能家居系统，全景落地窗俯瞰城市美景。24小时安保，管家服务。', '上海市', '上海', '浦东新区', '陆家嘴金融中心', 121.505544, 31.245087, 150.00, 3, 2, 2, 28, 40, '东南', 'LUXURY', 15000.00, 30000.00, '押二付三', '["中央空调", "地暖", "新风系统", "智能家居", "冰箱", "洗衣机", "烘干机", "洗碗机", "热水器", "宽带", "电视", "沙发", "床", "衣柜", "书桌"]', '{"地铁": "陆家嘴地铁站300米", "商场": "国金中心200米", "学校": "浦东外国语小学1.5公里", "医院": "仁济医院1公里"}', 'APPROVED');

-- 插入房源图片
INSERT INTO `property_image` (`property_id`, `image_url`, `image_type`, `sort_order`) VALUES
(1, 'https://example.com/images/property1_1.jpg', 'NORMAL', 1),
(1, 'https://example.com/images/property1_2.jpg', 'NORMAL', 2),
(1, 'https://example.com/images/property1_3.jpg', 'NORMAL', 3),
(2, 'https://example.com/images/property2_1.jpg', 'NORMAL', 1),
(2, 'https://example.com/images/property2_2.jpg', 'NORMAL', 2),
(3, 'https://example.com/images/property3_1.jpg', 'NORMAL', 1),
(3, 'https://example.com/images/property3_2.jpg', 'PANORAMA', 2);

-- 插入系统配置
INSERT INTO `system_config` (`config_key`, `config_value`, `config_type`, `description`) VALUES
('site_name', '高端公寓租赁平台', 'STRING', '网站名称'),
('site_logo', 'https://example.com/logo.png', 'STRING', '网站Logo'),
('contact_phone', '400-888-8888', 'STRING', '客服电话'),
('contact_email', 'service@apartment.com', 'STRING', '客服邮箱'),
('commission_rate', '0.05', 'NUMBER', '平台佣金比例'),
('min_rent_days', '30', 'NUMBER', '最短租期（天）'),
('max_images_per_property', '20', 'NUMBER', '每个房源最多图片数'),
('enable_vr', 'true', 'BOOLEAN', '是否启用VR看房'),
('enable_recommendation', 'true', 'BOOLEAN', '是否启用智能推荐');


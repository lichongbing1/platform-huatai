/*
Navicat MySQL Data Transfer

Source Server         : 
Source Server Version : 
Source Host           : 
Source Database       : shopmall

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-04-23 14:30:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mall_ad
-- ----------------------------
DROP TABLE IF EXISTS `mall_ad`;
CREATE TABLE `mall_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '1',
  `ad_position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 普通 1活动广告 2新用户注册',
  `name` varchar(60) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `image_url` text,
  `content` varchar(255) DEFAULT '',
  `end_time` datetime DEFAULT NULL,
  `enabled` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `position_id` (`ad_position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-广告列表';

-- ----------------------------
-- Records of mall_ad
-- ----------------------------
INSERT INTO `mall_ad` VALUES ('3', '1', '1', '新用户注册', '/pages/auth/newuser/newuser', 'http://www.yofus.com/usrdata/images/upload/Image/xinhuiyuan(4).jpg', '新用户注册', '2017-09-07 21:48:34', '1');
INSERT INTO `mall_ad` VALUES ('4', '2', '1', '首页团购大图', '', 'https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171107/150324708d0a34.jpg', '首页团购大图', '2017-09-07 21:48:34', '1');
INSERT INTO `mall_ad` VALUES ('5', '3', '1', '首页砍价大图', '', 'http://image.meiping123.com/upload/20171125/1228205521fb15.png', '首页砍价大图', '2017-09-07 21:48:34', '1');
INSERT INTO `mall_ad` VALUES ('6', '4', '1', '大家都在美平选好物', '', 'https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171125/1057182334dfb2.png', '超级折扣', '2017-09-07 21:48:34', '1');

-- ----------------------------
-- Table structure for mall_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `mall_ad_position`;
CREATE TABLE `mall_ad_position` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '''',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-广告位置';

-- ----------------------------
-- Records of mall_ad_position
-- ----------------------------
INSERT INTO `mall_ad_position` VALUES ('1', '移动端首页轮播广告', '750', '200', '');
INSERT INTO `mall_ad_position` VALUES ('2', '首页团购大图', '750', '200', '');
INSERT INTO `mall_ad_position` VALUES ('3', '首页砍价大图', '600', '200', '');
INSERT INTO `mall_ad_position` VALUES ('4', '超级折扣', '200', '750', '超级折扣');

-- ----------------------------
-- Table structure for mall_address
-- ----------------------------
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT '',
  `tel_number` varchar(20) DEFAULT '',
  `postal_Code` varchar(20) DEFAULT '',
  `national_Code` varchar(20) DEFAULT '',
  `province_Name` varchar(50) DEFAULT '',
  `city_Name` varchar(100) DEFAULT '',
  `county_Name` varchar(100) DEFAULT '',
  `detail_Info` varchar(500) DEFAULT NULL,
  `is_default` int(2) DEFAULT '0' COMMENT '是否默认 1默认 0否',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '经度',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-会员地址';

-- ----------------------------
-- Records of mall_address
-- ----------------------------
INSERT INTO `mall_address` VALUES ('45', '15', 'guanhouming', '17775421415', null, null, '广东省', '深圳市', '福田区', '福中三路(深圳市民中心)', '0', '22.543270', '113.956090');
INSERT INTO `mall_address` VALUES ('85', '88', '张三', '020-81167888', '510000', '510000', '广东省', '广州市', '海珠区', '新港中路397号', '0', '23.096420', '113.323770');

-- ----------------------------
-- Table structure for mall_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mall_attribute`;
CREATE TABLE `mall_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attribute_category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `input_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '当添加商品时,该属性的添加类别; 0为手功输入;1为选择输入;2为多行文本输入',
  `value` text NOT NULL COMMENT '即选择输入,则attr_name对应的值的取值就是该这字段值 ',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`attribute_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品属性';

-- ----------------------------
-- Records of mall_attribute
-- ----------------------------
INSERT INTO `mall_attribute` VALUES ('1', '1008009', '材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('2', '1008009', '适用床尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('3', '1008009', '件数', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('4', '1008009', '工艺', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('5', '1008009', '执行标准', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('6', '1008009', '产地', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('7', '1008009', '温馨提示', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('8', '1008008', '填充物重量', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('9', '1008008', '尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('10', '1008008', '面料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('11', '1008008', '填充物', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('12', '1008008', '填充成分', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('13', '1008008', '面料成分', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('14', '1008008', '含绒量', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('15', '1008008', '重量', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('16', '1008002', '规格', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('17', '1008002', '外套材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('18', '1008002', '内胆材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('19', '1008002', '*温馨提示', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('20', '1036000', '产地', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('21', '1036000', '规格', '1', '', '1');
INSERT INTO `mall_attribute` VALUES ('22', '1008002', '面料成份', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('23', '1008002', '内芯面料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('24', '1008008', '颜色', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('25', '1008008', '适用人数', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('26', '1008009', '安全类别', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('27', '1008009', '根数', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('28', '1036000', '营养', '1', '', '2');
INSERT INTO `mall_attribute` VALUES ('29', '1036000', '储存方式', '1', '', '3');
INSERT INTO `mall_attribute` VALUES ('30', '1008008', '外层面料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('31', '1008008', '里层面料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('32', '1008008', '内芯', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('33', '1008008', '外用面料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('34', '1008008', '商品重量', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('35', '1008002', '坐垫外层面料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('36', '1008002', '坐垫内芯材料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('37', '1008002', '方形尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('38', '1008002', '圆形尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('39', '1008002', '坐垫套面料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('40', '1008009', '安全及时', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('41', '1008002', '填充克重', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('42', '1017000', '产品标准', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('43', '1008016', '额定电压', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('44', '1008016', '型号', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('45', '1008008', '厚度', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('46', '1036000', '印染工艺', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('47', '1017000', '配色', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('48', '1017000', '材料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('49', '1008008', '面料参数', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('50', '1011004', '鲜花', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('51', '1011004', '朵数', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('52', '1011004', '花材种植地', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('53', '1011004', '鲜花主材', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('54', '1011004', '鲜花辅材', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('55', '1017000', '搭扣', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('56', '1017000', '拉带规格', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('57', '1017000', '颈圈规格', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('58', '1017000', '颈圈', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('59', '1017000', '拉带', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('60', '1017000', '颈圈尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('61', '1017000', '拉带尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('62', '1008008', '外套', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('63', '1011004', '长度', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('64', '1011004', '花草种类', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('65', '1011004', '数量', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('66', '1015000', '涂漆', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('67', '1015000', '产品尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('68', '1015000', '安装方式', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('69', '1017000', '规格尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('70', '1011004', '机芯', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('71', '1011004', '能源', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('72', '1011004', '机芯类型', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('73', '1015000', '框架材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('74', '1015000', '是否组装', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('75', '1011004', 'USB线长', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('76', '1017000', '承重范围', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('77', '1011004', '花材', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('78', '1011004', '附加功能', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('79', '1015000', '主体材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('80', '1015000', '躺椅尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('81', '1015000', '脚蹬尺寸', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('82', '1015000', '*特别提醒', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('83', '1015000', '椅身材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('84', '1015000', '扶手材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('85', '1015000', '椅轮', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('86', '1015000', '气杆', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('87', '1011004', '摆件类型', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('88', '1008008', '弹簧结构特征', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('89', '1008008', '使用场所', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('90', '1008008', '主要原材料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('91', '1008008', '辅料', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('92', '1008008', '高度', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('93', '1008008', '配送范围', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('94', '1008002', '填充物克重', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('95', '1008002', '备注', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('96', '1036000', '鞣制方式', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('97', '1017000', '产品材质', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('98', '1017000', '产品净重', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('99', '1017000', '产品毛重', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('100', '1008002', '物理遮光率', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('101', '1008002', '物理遮光性', '1', '', '0');
INSERT INTO `mall_attribute` VALUES ('102', '1008008', '重要提醒', '1', '', '0');

-- ----------------------------
-- Table structure for mall_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_attribute_category`;
CREATE TABLE `mall_attribute_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1开启; 0关闭;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1036004 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品属性种类';

-- ----------------------------
-- Records of mall_attribute_category
-- ----------------------------
INSERT INTO `mall_attribute_category` VALUES ('1008002', '布艺软装', '1');
INSERT INTO `mall_attribute_category` VALUES ('1008008', '被枕', '1');
INSERT INTO `mall_attribute_category` VALUES ('1008009', '床品件套', '1');
INSERT INTO `mall_attribute_category` VALUES ('1008016', '灯具', '1');
INSERT INTO `mall_attribute_category` VALUES ('1011004', '家饰', '1');
INSERT INTO `mall_attribute_category` VALUES ('1015000', '奶饮', '1');
INSERT INTO `mall_attribute_category` VALUES ('1017000', '粮油', '1');
INSERT INTO `mall_attribute_category` VALUES ('1036000', '水果', '1');
INSERT INTO `mall_attribute_category` VALUES ('1036002', '零食', '1');
INSERT INTO `mall_attribute_category` VALUES ('1036003', '蔬菜', '1');

-- ----------------------------
-- Table structure for mall_bargain_open
-- ----------------------------
DROP TABLE IF EXISTS `mall_bargain_open`;
CREATE TABLE `mall_bargain_open` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bargain_id` bigint(20) DEFAULT NULL COMMENT '砍价Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '发起人',
  `launch_time` datetime DEFAULT NULL COMMENT '发起时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单Id',
  `launch_status` int(4) DEFAULT NULL COMMENT '状态 1砍价中 2完成 3取消',
  `retail_price` decimal(10,2) DEFAULT NULL COMMENT '当前砍价的价格',
  `form_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单提交formId',
  `store_id` int(20) NOT NULL COMMENT '门店Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商城-砍价记录';

-- ----------------------------
-- Records of mall_bargain_open
-- ----------------------------
INSERT INTO `mall_bargain_open` VALUES ('56', '313', '88', '2018-04-19 10:43:44', null, '1', '12.00', null, '0');
INSERT INTO `mall_bargain_open` VALUES ('57', '313', '88', '2018-04-19 10:46:34', null, '1', '12.00', null, '0');
INSERT INTO `mall_bargain_open` VALUES ('58', '313', '88', '2018-04-19 10:59:50', null, '2', '12.00', null, '8');

-- ----------------------------
-- Table structure for mall_bargain_open_record
-- ----------------------------
DROP TABLE IF EXISTS `mall_bargain_open_record`;
CREATE TABLE `mall_bargain_open_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `open_id` bigint(20) DEFAULT NULL COMMENT '砍价Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `bargain_price` decimal(10,2) DEFAULT NULL COMMENT '砍掉的金额',
  `bargain_time` datetime DEFAULT NULL COMMENT '砍价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商城-砍价详情记录';

-- ----------------------------
-- Records of mall_bargain_open_record
-- ----------------------------

-- ----------------------------
-- Table structure for mall_brand
-- ----------------------------
DROP TABLE IF EXISTS `mall_brand`;
CREATE TABLE `mall_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `list_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `simple_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  `floor_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `app_list_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'app显示图片',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '新品牌',
  `new_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `new_sort_order` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB AUTO_INCREMENT=1046011 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品品牌';

-- ----------------------------
-- Records of mall_brand
-- ----------------------------
INSERT INTO `mall_brand` VALUES ('1001000', 'MUJI制造商', 'http://yanxuan.nosdn.127.net/1541445967645114dd75f6b0edc4762d.png', '严选精选了MUJI制造商和生产原料，\n用几乎零利润的价格，剔除品牌溢价，\n让用户享受原品牌的品质生活。', 'http://yanxuan.nosdn.127.net/4ea3f1e60dd77c45c218e503d721a1ed.jpg', '2', '1', '12.90', 'http://yanxuan.nosdn.127.net/1541445967645114dd75f6b0edc4762d.png', '1', 'http://yanxuan.nosdn.127.net/4ea3f1e60dd77c45c218e503d721a1ed.jpg', '2');
INSERT INTO `mall_brand` VALUES ('1001002', '内野制造商', 'http://yanxuan.nosdn.127.net/8ca3ce091504f8aa1fba3fdbb7a6e351.png', '严选从世界各地挑选毛巾，最终选择了为日本内野代工的工厂，追求毛巾的柔软度与功能性。品质比肩商场几百元的毛巾。', 'http://yanxuan.nosdn.127.net/e50654982984206b54e9226e5ab7f90c.jpg', '10', '1', '29.00', 'http://yanxuan.nosdn.127.net/8ca3ce091504f8aa1fba3fdbb7a6e351.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001003', 'Adidas制造商', 'http://yanxuan.nosdn.127.net/335334d0deaff6dc3376334822ab3a2f.png', '严选找到为Adidas等品牌制造商，\n选取优质原材料，与厂方一起设计，\n为你提供好的理想的运动装备。', 'http://yanxuan.nosdn.127.net/6f954ea8cee30e161dda048ffbfd950f.png', '30', '1', '49.00', 'http://yanxuan.nosdn.127.net/335334d0deaff6dc3376334822ab3a2f.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001007', '优衣库制造商', 'http://yanxuan.nosdn.127.net/0d72832e37e7e3ea391b519abbbc95a3.png', '严选找到日本知名服装UNIQLO的制造商，\n选取优质长绒棉和精梳工艺，\n与厂方一起设计，为你提供理想的棉袜。', 'http://yanxuan.nosdn.127.net/f3d196c03f8aac5625faba00d670ee03.jpg', '12', '1', '29.00', 'http://yanxuan.nosdn.127.net/0d72832e37e7e3ea391b519abbbc95a3.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001008', '膳魔师制造商', 'http://yanxuan.nosdn.127.net/5fd51e29b9459dae7df8040c8219f241.png', '严选深入保温行业内部，\n找到德国膳魔师制造商的代工厂。\n同样的品质，却有更优的价格。', 'http://yanxuan.nosdn.127.net/c4ab88f475e375c5748fa13d8bf2858d.png', '40', '1', '45.00', 'http://yanxuan.nosdn.127.net/5fd51e29b9459dae7df8040c8219f241.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001010', '星巴克制造商', 'http://yanxuan.nosdn.127.net/5668bc50f2f2e551891044525710dc84.png', '严选寻访全国保温杯制造企业，\n最终找到高端咖啡品牌星巴克的制造商，\n专注保温杯生产20年，品质与颜值兼备。', 'http://yanxuan.nosdn.127.net/2433b04ea9d7adda1d2e834786872237.jpg', '34', '1', '39.00', 'http://yanxuan.nosdn.127.net/5668bc50f2f2e551891044525710dc84.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001012', 'Wedgwood制造商', 'http://yanxuan.nosdn.127.net/68940e8e23f96dbeb3548d943d83d5e4.png', '严选寻访英国皇室御用陶瓷Wedgwood制造商，\n制模到成品，历经25道工序、7次检验、3次烧制，\n你看不见的地方，我们也在坚持。', 'http://yanxuan.nosdn.127.net/6d6124123311f85903a8bc864d37464c.jpg', '21', '1', '39.00', 'http://yanxuan.nosdn.127.net/68940e8e23f96dbeb3548d943d83d5e4.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001013', 'Royal Doulton制造商', 'http://yanxuan.nosdn.127.net/0de643a02043fd9680b11e21c452adaa.png', '严选深入英国最大骨瓷品牌Royal Doulton制造商， \n顶级英国瓷器的代名词，广受世界皇室喜爱。\n每件瓷器，都有自己的故事。', 'http://yanxuan.nosdn.127.net/0e8311d2246e5643c622743d9684f235.jpg', '47', '1', '24.90', 'http://yanxuan.nosdn.127.net/0de643a02043fd9680b11e21c452adaa.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001015', '日本KEYUCA制造商', 'http://yanxuan.nosdn.127.net/9b85b45f23da558be101dbcc273b1d6d.png', 'KEYUCA是日本餐具及料理用具品牌，\n遵循极简原木风，高端餐具体验。\n严选的餐具正是来自这一品牌制造商。', 'http://yanxuan.nosdn.127.net/d91db0c68c50cd109c16f0ad1427ed0b.jpg', '49', '1', '14.90', 'http://yanxuan.nosdn.127.net/9b85b45f23da558be101dbcc273b1d6d.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001016', '爱慕制造商', 'http://yanxuan.nosdn.127.net/5104f84110eac111968c63c18ebd62c0.png', '150家样品比对筛选，20家工厂深入走访，\n严选最终选定高端内衣爱慕制造商，\n20年品质保证，为你打造天然舒适的衣物。', 'http://yanxuan.nosdn.127.net/833104a2ac047faccd90cc6b98ccf4be.jpg', '9', '1', '35.00', 'http://yanxuan.nosdn.127.net/5104f84110eac111968c63c18ebd62c0.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001020', 'Ralph Lauren制造商', 'http://yanxuan.nosdn.127.net/9df78eb751eae2546bd3ee7e61c9b854.png', '我们与Ralph Lauren Home的制造商成功接洽，掌握先进的生产设备，传承品牌工艺和工序。追求生活品质的你，值得拥有。', 'http://yanxuan.nosdn.127.net/089e4066f0c2bc6b062d17c6292735dc.png', '20', '1', '29.00', 'http://yanxuan.nosdn.127.net/9df78eb751eae2546bd3ee7e61c9b854.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001037', '新秀丽制造商', 'http://yanxuan.nosdn.127.net/80dce660938931956ee9a3a2b111bd37.jpg', '严选为制作品质与颜值兼具的箱包，\n选定新秀丽、CK、Ricardo等品牌合作的制造商，\n拥有国内先进流水线20余条，实力保障品质。', 'http://yanxuan.nosdn.127.net/af5719e20bdbd214a9ce7d961e9031c5.png', '5', '1', '59.00', 'http://yanxuan.nosdn.127.net/80dce660938931956ee9a3a2b111bd37.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001038', 'Coach制造商', 'http://yanxuan.nosdn.127.net/1b1cc16135fd8467d40983f75f644127.png', '严选为制作高品质高颜值皮具配件，\n由Coach、MK等品牌制造商生产，\n由严选360度全程监制，给你带来优质皮具。', 'http://yanxuan.nosdn.127.net/c933a662bb79b2a47280363e35ab994b.png', '3', '1', '49.00', 'http://yanxuan.nosdn.127.net/1b1cc16135fd8467d40983f75f644127.png', '1', 'http://yanxuan.nosdn.127.net/b5cd73d3b310bad02539412f064d4ea1.jpg', '10');
INSERT INTO `mall_brand` VALUES ('1001039', 'MK制造商', 'http://yanxuan.nosdn.127.net/fc9cd1309374f7707855de80522fb310.jpg', '严选为制造高品质的皮具，\n选择Michael Kors品牌合作的制造工厂，\n18年专业皮具生产经验，手工至美，品质保证。', 'http://yanxuan.nosdn.127.net/c302c82dafcb53ba233aa1e277063a1c.png', '17', '1', '79.00', 'http://yanxuan.nosdn.127.net/fc9cd1309374f7707855de80522fb310.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1001045', '罗莱制造商', 'http://yanxuan.nosdn.127.net/14122a41a4985d23e1a172302ee818e9.png', '严选团队为打造吸湿透气柔软的蚕丝被，\n从蚕茧原材到温感性能，多次甄选测试\n选择罗莱制造商工厂，手工处理，优质舒适。', 'http://yanxuan.nosdn.127.net/a88d8eae6d492492da07eca7616dce42.jpg', '45', '1', '699.00', 'http://yanxuan.nosdn.127.net/14122a41a4985d23e1a172302ee818e9.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1003000', 'Carters制造商', 'http://yanxuan.nosdn.127.net/efe9131599ced0297213e6ec67eb2174.png', '来自Carters大牌代工厂生产，\n严选纯天然材料，无荧光不添加，\nITS安心标志权威检测，安全护航。', 'http://yanxuan.nosdn.127.net/a3fd78f8cf429a34e1e2ea761466d428.jpg', '41', '1', '19.90', 'http://yanxuan.nosdn.127.net/efe9131599ced0297213e6ec67eb2174.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1005001', 'Goody制造商', 'http://yanxuan.nosdn.127.net/7c918f37de108f3687d69b39daab34eb.png', '严选深入美国百年发饰品牌Goody制造商，\n确保每把梳子做工精湛，养护头皮。\n戴安娜王妃的最爱，你也能拥有。', 'http://yanxuan.nosdn.127.net/431cd1e6bfca9964f96f1964a8b08ebb.jpg', '48', '1', '39.00', 'http://yanxuan.nosdn.127.net/7c918f37de108f3687d69b39daab34eb.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1006000', '范思哲制造商', 'http://yanxuan.nosdn.127.net/c80ae035387495a61a4515906205efff.png', '严选找寻意大利奢侈品牌范思哲Versace的制造商，\n致力于为用户带来精致、优雅、时尚的皮包，\n传承独特美感，体验品质生活。', 'http://yanxuan.nosdn.127.net/4e5e9e8cf9ce08f256494321ba4d3c2a.jpg', '18', '1', '99.00', 'http://yanxuan.nosdn.127.net/c80ae035387495a61a4515906205efff.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1008000', 'WPC制造商', 'http://yanxuan.nosdn.127.net/c4e97cc87186ce17f9316f3ba39e220c.png', '严选寻找日本雨伞品牌W.P.C制造商，\n采用严谨工艺以及环保材料，\n沉淀15年行业经验，打造精致雨具。', 'http://yanxuan.nosdn.127.net/83889aa01e7cf8e0ff605c317a01e55d.jpg', '22', '1', '59.00', 'http://yanxuan.nosdn.127.net/c4e97cc87186ce17f9316f3ba39e220c.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1010001', '竹宝堂制造商', 'http://yanxuan.nosdn.127.net/61b0b7ae4f0163422009defbceaa41ad.jpg', '严选走访河北、安徽等制刷基地，\n选定竹宝堂、丝芙兰等品牌的制造商，\n严格把关生产与质检，与您一同追求美的生活。', 'http://yanxuan.nosdn.127.net/279cf74ac294e67f7f99cf2d47a1365c.jpg', '39', '1', '29.00', 'http://yanxuan.nosdn.127.net/61b0b7ae4f0163422009defbceaa41ad.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1010002', '资生堂制造商', 'http://yanxuan.nosdn.127.net/5449236b80d1e678dedee2f626cd67c4.png', '发现美，成为美，是女性一生的追求。\n严选找寻资生堂代工厂，打造天然美妆产品，\n致力于带来更多美的体验和享受。', 'http://yanxuan.nosdn.127.net/af464d5281dfbd286dab569a03264a33.jpg', '19', '1', '29.00', 'http://yanxuan.nosdn.127.net/5449236b80d1e678dedee2f626cd67c4.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1015000', 'NITORI制造商', 'http://yanxuan.nosdn.127.net/6f3d310601b18610553c675e0e14d107.png', '宠物是人类最温情的陪伴，\n严选找寻日本最大家居品牌NITORI制造商，\n每一个脚印，都是为了更好地关怀你的TA', 'http://yanxuan.nosdn.127.net/0657854429c6717e8ace7dcff6a2468b.jpg', '43', '1', '69.00', 'http://yanxuan.nosdn.127.net/6f3d310601b18610553c675e0e14d107.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1016002', 'HUGO BOSS制造商', 'http://yanxuan.nosdn.127.net/70ada9877b2efa82227437af3231fe50.png', '严选深入德国知名奢侈品HUGO BOSS的制造商，\n开发睡衣、睡袍、休闲裤等轻奢品质家居服，\n希望你在家的每一天都优雅精致。', 'http://yanxuan.nosdn.127.net/888289da7fe200949806eefa069af019.jpg', '11', '1', '45.00', 'http://yanxuan.nosdn.127.net/70ada9877b2efa82227437af3231fe50.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1018000', 'Sperry制造商', 'http://yanxuan.nosdn.127.net/2eb12d84037346441088267432da31c4.png', '严选团队对比多家硫化鞋制造商产品质量，\n走访多个制鞋工厂，最终选定Sperry品牌制造商，\n为你提供一双舒适有型的高品质帆布鞋。', 'http://yanxuan.nosdn.127.net/952b9f38a729533a058ee88572a370fa.jpg', '32', '1', '199.00', 'http://yanxuan.nosdn.127.net/2eb12d84037346441088267432da31c4.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1021000', 'Marc Jacobs制造商', 'http://yanxuan.nosdn.127.net/c8dac4eb1a458d778420ba520edab3d0.png', '严选寻访独立设计品牌Marc Jacobs的制造商，\n严格选材，细究纺织与生产的细节，多次打磨，\n初心不忘，为你带来优雅高档的服饰配件。', 'http://yanxuan.nosdn.127.net/ce5762f1fd4bde61b57864e765c605e3.jpg', '24', '1', '69.00', 'http://yanxuan.nosdn.127.net/c8dac4eb1a458d778420ba520edab3d0.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1022000', 'UGG制造商', 'http://yanxuan.nosdn.127.net/4d2a3dea7e0172ae48e8161f04cfa045.jpg', '为寻找优质的皮毛一体雪地靴，\n严选走访多家雪地靴制造商，对比工艺，\n甄选UGG认可的代工厂，只为足下的优雅舒适。', 'http://yanxuan.nosdn.127.net/efbc6a6044dd07697d2f26bf5033c335.jpg', '29', '1', '59.00', 'http://yanxuan.nosdn.127.net/4d2a3dea7e0172ae48e8161f04cfa045.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1022001', 'Palladium制造商', 'http://yanxuan.nosdn.127.net/3480f2a4026c60eb4921f0aa3facbde8.png', '严选探访多个制鞋大厂，选定Palladium制造商，\n对比工艺选材，找到传承多年的制鞋配方，\n只为制作一款高品质休闲鞋。', 'http://yanxuan.nosdn.127.net/119717ea4459a8fb3185cec4eb80a284.jpg', '31', '1', '249.00', 'http://yanxuan.nosdn.127.net/3480f2a4026c60eb4921f0aa3facbde8.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1023000', 'PetitBateau小帆船制造商', 'http://yanxuan.nosdn.127.net/1a11438598f1bb52b1741e123b523cb5.jpg', '为打造适合宝宝的婴童服装，\n严选团队寻找PetitBateau小帆船的品牌制造商，\n无荧光剂，国家A类标准，让宝宝穿的放心。', 'http://yanxuan.nosdn.127.net/faad5a05a119b789956e4ce2e26e94ef.jpg', '25', '1', '36.00', 'http://yanxuan.nosdn.127.net/1a11438598f1bb52b1741e123b523cb5.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1024000', 'WMF制造商', 'http://yanxuan.nosdn.127.net/2018e9ac91ec37d9aaf437a1fd5d7070.png', '严选找寻德国百年高端厨具WMF的制造商，\n选择拥有14年经验的不锈钢生产工厂，\n为你甄选事半功倍的优质厨具。', 'http://yanxuan.nosdn.127.net/2a2ae0d49043e525db8d0d8d84460ac8.png', '8', '1', '9.90', 'http://yanxuan.nosdn.127.net/2018e9ac91ec37d9aaf437a1fd5d7070.png', '1', 'http://yanxuan.nosdn.127.net/abcfa79205679db51198adc19c184dd1.jpg', '3');
INSERT INTO `mall_brand` VALUES ('1024001', 'OBH制造商', 'http://yanxuan.nosdn.127.net/bf3499ac17a11ffb9bb7caa47ebef2dd.png', '严选寻找OBH品牌的制造商，打造精致厨具，\n韩国独资工厂制造，严格质检，品质雕琢\n力求为消费者带来全新的烹饪体验。', 'http://yanxuan.nosdn.127.net/44e14d6ec4db2e6c66b0fde521603f85.jpg', '42', '1', '39.00', 'http://yanxuan.nosdn.127.net/bf3499ac17a11ffb9bb7caa47ebef2dd.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1024003', 'Stoneline制造商', 'http://yanxuan.nosdn.127.net/3a44ae7db86f3f9b6e542720c54cc349.png', '严选找寻德国经典品牌Stoneline的制造商，\n追踪工艺，考量细节，亲自试用，\n为你甄选出最合心意的锅具和陶瓷刀，下厨如神。', 'http://yanxuan.nosdn.127.net/6dc7eecce99cb8f5ab6d86c76415cbec.png', '28', '1', '9.90', 'http://yanxuan.nosdn.127.net/3a44ae7db86f3f9b6e542720c54cc349.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1024006', 'KitchenAid制造商', 'http://yanxuan.nosdn.127.net/e11385bf29d1b3949435b80fcd000948.png', '严选寻访KitchenAid品牌的制造商，\n采用德国LFGB认证食品级专用不锈钢，\n欧式简约设计，可靠安心，尽享下厨乐趣。', 'http://yanxuan.nosdn.127.net/2f79a254cd4020966ea1272e2d27b510.jpg', '46', '1', '98.00', 'http://yanxuan.nosdn.127.net/e11385bf29d1b3949435b80fcd000948.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1025000', 'Timberland制造商', 'http://yanxuan.nosdn.127.net/6dcadb0791b33aa9fd00380b44fa6645.png', '为制作优质时尚的工装鞋靴，\n严选团队深入探访国内外制靴大厂，选择Timberland制造商，\n工厂拥有15年制鞋历史，专业品质有保证。', 'http://yanxuan.nosdn.127.net/5b35f510110d0c031eb6bf63854597b8.png', '37', '1', '359.00', 'http://yanxuan.nosdn.127.net/6dcadb0791b33aa9fd00380b44fa6645.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1025001', 'Kenneth Cole制造商', 'http://yanxuan.nosdn.127.net/236322546c6860e1662ab147d6b0ba2f.jpg', '为出品优质格调的商务鞋靴，\n严选团队选择Kenneth Cole品牌合作的制造商，\n一切努力，只为打造高品质鞋靴。', 'http://yanxuan.nosdn.127.net/63a1df6f5d26faadffa33bac2d51ddc4.jpg', '7', '1', '349.00', 'http://yanxuan.nosdn.127.net/236322546c6860e1662ab147d6b0ba2f.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1026000', 'CK制造商', 'http://yanxuan.nosdn.127.net/658f09b7ec522d31742b47b914d64338.png', '严选寻访Calvin Klein品牌的制造商，\n深入世界领带第一生产地，设计与品质并重，\n致力于给消费者带来优质典雅的服饰用品。', 'http://yanxuan.nosdn.127.net/fb139c9f11a10deb41beeb42aaad488e.png', '1', '1', '39.00', 'http://yanxuan.nosdn.127.net/658f09b7ec522d31742b47b914d64338.png', '1', 'http://yanxuan.nosdn.127.net/76638fb8e6990aadf837ce761c3b7399.jpg', '1');
INSERT INTO `mall_brand` VALUES ('1026001', 'Under Armour制造商', 'http://yanxuan.nosdn.127.net/4e93ea29b1d06fabfd24ba68a9b20a34.jpg', '严选为甄选优质好袜，走访东北、新疆等产袜基地，\n最终选定Under Armour品牌的合作制造商，\n从原料、工艺、品质多维度筛选监制，保证好品质。', 'http://yanxuan.nosdn.127.net/b00570a5edc8da2f4a629fbdddb0b03c.jpg', '35', '1', '39.00', 'http://yanxuan.nosdn.127.net/4e93ea29b1d06fabfd24ba68a9b20a34.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1028000', 'Gucci制造商', 'http://yanxuan.nosdn.127.net/278869cad9bf5411ffc18982686b88fb.jpg', '严选为设计一款优雅时尚的品质礼帽，\n找寻拥有10来年经验的大型毛毡帽厂商合作，\n坚持打造好设计、好工艺、好材质的潮流礼帽。', 'http://yanxuan.nosdn.127.net/7749ff4939c0a62689c5d1de7fba2860.png', '23', '1', '59.00', 'http://yanxuan.nosdn.127.net/278869cad9bf5411ffc18982686b88fb.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1028003', 'Burberry制造商', 'http://yanxuan.nosdn.127.net/07af01e281c7e0b912d162d611e22c32.jpg', '为打造时尚舒适的童装系列，\n严选选择Burberry制造商，优化版型配色\n英伦风情融入经典格纹，百搭优雅气质款。', 'http://yanxuan.nosdn.127.net/1a874a6b8cf8c17ef7420b2449179eae.jpg', '4', '1', '99.00', 'http://yanxuan.nosdn.127.net/07af01e281c7e0b912d162d611e22c32.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1033003', 'Armani制造商', 'http://yanxuan.nosdn.127.net/981e06f0f46f5f1f041d7de3dd3202e6.jpg', '严选团队携手国际标准化专业生产厂家，\n厂家长期为Armani、Alexander wang等知名品牌代工，\n专业进口设备，精密质量把控，精于品质居家体验。', 'http://yanxuan.nosdn.127.net/cc2513963d45c8a0787bc9650e95b3bc.jpg', '26', '1', '199.00', 'http://yanxuan.nosdn.127.net/981e06f0f46f5f1f041d7de3dd3202e6.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1033004', '爱马仕集团制造商', 'http://yanxuan.nosdn.127.net/d98470dd728fb5a91f7aceade07572b5.png', '严选采用欧洲一线品牌爱马仕的御用香料供应商，\n经过反复配比改良、试香调香、选品定样，\n为你带来独特馥郁的散香体验。', 'http://yanxuan.nosdn.127.net/dd4b9a6cb73e3e1c61c79cbd4bb0bca0.jpg', '33', '1', '19.00', 'http://yanxuan.nosdn.127.net/d98470dd728fb5a91f7aceade07572b5.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1034001', 'Alexander McQueen制造商', 'http://yanxuan.nosdn.127.net/db7ee9667d84cbce573688297586699c.jpg', '为制造精致实用的高品质包包，\n严选团队选择Alexander McQueen制造商，\n严格筛选，带来轻奢优雅体验。', 'http://yanxuan.nosdn.127.net/48d8b0a9cd41cd7028b055d6d2b4b57e.jpg', '16', '1', '69.00', 'http://yanxuan.nosdn.127.net/db7ee9667d84cbce573688297586699c.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1037000', '厚木ATSUGI制造商', 'http://yanxuan.nosdn.127.net/7df55c408dbac6085ed6c30836c828ac.jpg', '严选考究袜子品质，层层把关原料生产，\n携手12年行业生产资质的厚木品牌制造商，\n带来轻盈优雅，舒适显瘦的袜子系列。', 'http://yanxuan.nosdn.127.net/51f1a2b3e663989e8880066af929ce50.jpg', '27', '1', '29.00', 'http://yanxuan.nosdn.127.net/7df55c408dbac6085ed6c30836c828ac.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1038000', 'Birkenstock集团制造商', 'http://yanxuan.nosdn.127.net/05a2ecffb60b77e4c165bd8492e5c22a.jpg', '为打造一双舒适的软木拖鞋，\n严选团队寻找BIRKENSTOCK集团旗下产品制造商，\n360度全程监制，舒适随脚，百搭文艺。', 'http://yanxuan.nosdn.127.net/0996a492f86f01cb83cd3737ad325e23.jpg', '14', '1', '59.90', 'http://yanxuan.nosdn.127.net/05a2ecffb60b77e4c165bd8492e5c22a.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1038001', 'Nine West制造商', 'http://yanxuan.nosdn.127.net/ad4df7848ce450f00483c2d5e9f2bfa7.png', '为打造一双优雅舒适的高跟鞋，\n严选选择美国Nine West玖熙品牌的制造商，\n让美丽绽放在足尖。', 'http://yanxuan.nosdn.127.net/38d494067453afa08d2b26d8227558fc.jpg', '13', '1', '219.00', 'http://yanxuan.nosdn.127.net/ad4df7848ce450f00483c2d5e9f2bfa7.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1039000', 'TEFAL制造商', 'http://yanxuan.nosdn.127.net/2b7a07e25a3f3be886a7fb90ba975bb7.png', '严选对标国际品质，致力于高品质生活好物，\n执着寻求优质厨房电器供应商，\n携手WMF、Tefal制造商，打造高品质厨具。', 'http://yanxuan.nosdn.127.net/713daad73395a4f3d06f5dd07ed927d4.jpg', '44', '1', '259.00', 'http://yanxuan.nosdn.127.net/2b7a07e25a3f3be886a7fb90ba975bb7.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1039001', '京瓷制造商', 'http://yanxuan.nosdn.127.net/3dda530605e3ab1c82d5ed30f2489473.png', '严选想为你的厨房生活，带来新鲜感和活力，\n深入全国各地，选择日本京瓷等品牌代工厂，\n打造钻石系列厨具，颜值与品质兼具。', 'http://yanxuan.nosdn.127.net/de8c967f47c47e48aaaf461a5e24bc4c.jpg', '38', '1', '89.00', 'http://yanxuan.nosdn.127.net/3dda530605e3ab1c82d5ed30f2489473.png', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1040000', '金龙鱼', 'http://image.meiping123.com/upload/20180111/1653219316b5bf.jpg', '金龙鱼', 'http://image.meiping123.com/upload/20180111/165334553699ee.jpg', '15', '1', '59.00', 'http://image.meiping123.com/upload/20180111/16533721015dc0.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1041000', '德芙', 'http://image.meiping123.com/upload/20171227/171106798eb5cd.jpg', '巧克力厂商', 'http://image.meiping123.com/upload/20171227/1711161100d117.jpg', '36', '1', '99.00', 'http://image.meiping123.com/upload/20171227/1711305488c295.jpg', '0', '', '10');
INSERT INTO `mall_brand` VALUES ('1046000', '蓝月亮', 'http://yanxuan.nosdn.127.net/66e2cb956a9dd1efc7732bea278e901e.png', '', 'http://yanxuan.nosdn.127.net/d48930cbb91f0e3adafe5341ce270a4e.png', '6', '1', '109.00', 'http://yanxuan.nosdn.127.net/66e2cb956a9dd1efc7732bea278e901e.png', '0', '', '10');

-- ----------------------------
-- Table structure for mall_cart
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员Id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品Id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品序列号',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品Id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '产品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '零售价格',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `goods_specification_name_value` text COMMENT '规格属性组成的字符串，用来显示用',
  `goods_specification_ids` varchar(60) DEFAULT '' COMMENT 'product表对应的goods_specifition_ids',
  `checked` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `list_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `store_id` mediumint(11) DEFAULT NULL COMMENT '门店Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-购物车';

-- ----------------------------
-- Records of mall_cart
-- ----------------------------
INSERT INTO `mall_cart` VALUES ('371', '72', '1166008', '1166008', '244', 'Carat钻石 不粘厨具组合', '504.90', '459.00', '2', null, '', '1', 'http://yanxuan.nosdn.127.net/615a16e899e01efb780c488df4233f48.png', '8');
INSERT INTO `mall_cart` VALUES ('372', '68', '1166008', '1166008', '244', 'Carat钻石 不粘厨具组合', '504.90', '459.00', '2', null, '', '1', 'http://yanxuan.nosdn.127.net/615a16e899e01efb780c488df4233f48.png', '8');
INSERT INTO `mall_cart` VALUES ('392', '77', '1166008', '1166008', '244', 'Carat钻石 不粘厨具组合', '504.90', '459.00', '3', null, '', '1', 'http://yanxuan.nosdn.127.net/615a16e899e01efb780c488df4233f48.png', '8');
INSERT INTO `mall_cart` VALUES ('432', '36', '1181042', '122930', '364', '美人椒 约200g±20g/份', '10.00', '10.00', '1', '200g', '106', '1', 'http://image.meiping123.com/upload/20171229/1702589526ce44.jpg', '8');
INSERT INTO `mall_cart` VALUES ('433', '36', '1181023', '122912', '337', '荷兰豆 约350g±10g/份', '10.00', '10.00', '1', '350g', '79', '1', 'http://image.meiping123.com/upload/20171229/16321336392cf9.jpg', '8');
INSERT INTO `mall_cart` VALUES ('467', '15', '1143020', '1143020', '224', '粽横四海端午粽礼盒 800克', '184.80', '168.00', '1', null, '', '1', 'http://yanxuan.nosdn.127.net/200d4d59763af9a0781cca4a06175de7.png', '5');
INSERT INTO `mall_cart` VALUES ('468', '15', '1152101', '1152101', '238', '魔兽世界 部落 奥格瑞玛 拉杆箱 可登机', '976.80', '888.00', '1', null, '', '1', 'http://yanxuan.nosdn.127.net/c1c62211a17b71a634fa0c705d11fb42.png', '5');
INSERT INTO `mall_cart` VALUES ('484', '15', '1181121', '11002', '497', '安慕希风味酸奶草莓味205g*12瓶', '75.00', '72.00', '3', '箱', '239', '0', 'http://image.meiping123.com/upload/20180305/133004370b0a44.jpg', '8');
INSERT INTO `mall_cart` VALUES ('491', '18', '1181117', '05080', '476', '鲁花5S压榨一级花生油4L', '55.00', '44.00', '1', '4L', '218', '1', 'http://image.meiping123.com/upload/20180206/1805508022321e.jpg', '8');
INSERT INTO `mall_cart` VALUES ('492', '18', '1181116', '011921', '470', '小红锅玉和园剁辣椒248g', '10.00', '10.00', '1', '248g', '212', '1', 'http://image.meiping123.com/upload/20180119/17064029290291.jpg', '8');
INSERT INTO `mall_cart` VALUES ('495', '87', '1181121', '11002', '497', '安慕希风味酸奶草莓味205g*12瓶', '75.00', '72.00', '2', '箱', '239', '1', 'http://image.meiping123.com/upload/20180305/133004370b0a44.jpg', '8');
INSERT INTO `mall_cart` VALUES ('497', '15', '1181010', '10080010001', '285', '德芙 轻柔威化巧克力22.5g', '20.00', '20.00', '1', '22.5', '27', '1', 'http://image.meiping123.com/upload/20171227/1729071646f21a.png', '8');
INSERT INTO `mall_cart` VALUES ('498', '88', '1181012', '122901', '329', '白金针菇 约250g±10g/份', '10.00', '12.00', '1', '250g', '71', '1', 'http://image.meiping123.com/upload/20171229/15110973674e5a.jpg', '8');

-- ----------------------------
-- Table structure for mall_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) DEFAULT '',
  `front_desc` varchar(255) DEFAULT '',
  `parent_id` int(11) unsigned DEFAULT '0',
  `sort_order` tinyint(1) unsigned DEFAULT '50',
  `show_index` tinyint(1) DEFAULT '0',
  `is_show` tinyint(1) unsigned DEFAULT '1',
  `banner_url` varchar(255) DEFAULT '',
  `icon_url` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `wap_banner_url` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `front_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1036007 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品分类';

-- ----------------------------
-- Records of mall_category
-- ----------------------------
INSERT INTO `mall_category` VALUES ('1005000', '水果', '', '水果啊，多吃点就能美美的', '0', '2', '1', '1', 'http://yanxuan.nosdn.127.net/92357337378cce650797444bc107b0f7.jpg', 'https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171106/1643099348fc8b.png', '//nos.netease.com/yanxuan/f0d0e1a542e2095861b42bf789d948ce.jpg', 'http://image.meiping123.com/upload/20171125/170926975530e0.jpg', 'L1', '0', '水果啊，多吃点就能美美的');
INSERT INTO `mall_category` VALUES ('1005001', '海产', '', '优质蛋白，只长肌肉不长膘', '0', '3', '2', '1', 'http://yanxuan.nosdn.127.net/f4ff8b3d5b0767d4e578575c1fd6b921.jpg', 'http://yanxuan.nosdn.127.net/ad8b00d084cb7d0958998edb5fee9c0a.png', '//nos.netease.com/yanxuan/88855173a0cfcfd889ee6394a3259c4f.jpg', 'http://image.meiping123.com/upload/20171125/1656548717a6b1.jpg', 'L1', '0', '优质蛋白，只长肌肉不长膘');
INSERT INTO `mall_category` VALUES ('1005002', '肉蛋', '', '肉要吃啊，都是蛋白质啊蛋白质蛋白质啊', '0', '4', '3', '1', 'http://yanxuan.nosdn.127.net/dd6cc8a7e996936768db5634f12447ed.jpg', 'http://yanxuan.nosdn.127.net/c9280327a3fd2374c000f6bf52dff6eb.png', '//nos.netease.com/yanxuan/9a29ef4f41c305a12e1459f12abd290f.jpg', 'http://image.meiping123.com/upload/20171125/1653282102eb76.jpg', 'L1', '0', '肉要吃啊，都是蛋白质啊蛋白质蛋白质啊');
INSERT INTO `mall_category` VALUES ('1005007', '鱼', '', '好好吃鱼，天天向上', '1005001', '1', '1', '1', 'http://yanxuan.nosdn.127.net/4aab4598017b5749e3b63309d25e9f6b.png', '', '', 'http://image.meiping123.com/upload/20171127/225305525b9171.png', 'L2', '0', '好好吃鱼，天天向上');
INSERT INTO `mall_category` VALUES ('1005008', '虾', '', '不扯蛋的虾，真不扯', '1005001', '2', '2', '1', 'http://yanxuan.nosdn.127.net/f109afbb7e7a00c243c1da29991a5aa3.png', '', '', 'http://image.meiping123.com/upload/20171127/23063545c6cb0.png', 'L2', '0', '不扯蛋的虾，真不扯');
INSERT INTO `mall_category` VALUES ('1005009', '蟹', '', '有钳的蟹，吃了就有钳', '1005001', '3', '3', '1', 'http://yanxuan.nosdn.127.net/e8b67fe8b8db2ecc2e126a0aa631def0.png', '', '', 'http://image.meiping123.com/upload/20171127/225533196d0385.png', 'L2', '0', '有钳的蟹，吃了就有钳');
INSERT INTO `mall_category` VALUES ('1005010', '牛', '', '富含锌、镁、铁、维生素B、蛋白质', '1005002', '1', '1', '1', 'http://yanxuan.nosdn.127.net/6c43063003207168c1d8e83a923e8515.png', '', '', 'http://image.meiping123.com/upload/20171128/021348428e2a12.png', 'L2', '0', '富含锌、镁、铁、维生素B、蛋白质');
INSERT INTO `mall_category` VALUES ('1005011', '羊', '', '羊肉炖花生，养胃，我叔说的', '1005002', '2', '2', '1', 'http://yanxuan.nosdn.127.net/663f568475c994358bf31bcb67d122fe.png', '', '', 'http://image.meiping123.com/upload/20171128/0208009962ea50.png', 'L2', '0', '羊肉炖花生，养胃，我叔说的');
INSERT INTO `mall_category` VALUES ('1005012', '猪', '', '猪', '1005002', '4', '4', '1', 'http://yanxuan.nosdn.127.net/e050980992725b7932bb3645fe5aec08.png', '', '', 'http://image.meiping123.com/upload/20171128/020813480ba32c.png', 'L2', '0', '猪');
INSERT INTO `mall_category` VALUES ('1005013', '鸡鸭鹅', '', '反正你就吃吧', '1005002', '5', '5', '1', 'http://yanxuan.nosdn.127.net/2919b0d6eec79182cca31dc827f4d00a.png', '', '', 'http://image.meiping123.com/upload/20171128/021137635618cf.png', 'L2', '0', '反正你就吃吧');
INSERT INTO `mall_category` VALUES ('1007000', '贝类', '', '波ei贝', '1005001', '4', '4', '1', 'http://yanxuan.nosdn.127.net/0b244d3575b737c8f0ed7e84c5c4abd2.png', '', '', 'http://image.meiping123.com/upload/20171127/22571578907e5c.png', 'L2', '0', '波ei贝');
INSERT INTO `mall_category` VALUES ('1008000', '蔬菜', '', '各种天然维生素', '0', '5', '4', '1', 'http://yanxuan.nosdn.127.net/cad5aba2bc52d3b8adfd0232c9814de2.jpg', 'http://yanxuan.nosdn.127.net/11abb11c4cfdee59abfb6d16caca4c6a.png', '//nos.netease.com/yanxuan/935f1ab7dcfeb4bbd4a5da9935161aaf.jpg', 'http://image.meiping123.com/upload/20171125/1655174882002f.jpg', 'L1', '0', '各种天然维生素');
INSERT INTO `mall_category` VALUES ('1008001', '瓜子、蜜饯、糖果', '', '瓜子、蜜饯、糖果', '1013001', '1', '1', '1', 'http://yanxuan.nosdn.127.net/44ad9a739380aa6b7cf956fb2a06e7a7.png', '', '', 'http://image.meiping123.com/upload/20171130/0113359675a0f2.png', 'L2', '0', '瓜子、蜜饯、糖果');
INSERT INTO `mall_category` VALUES ('1008002', '苹果、梨', '', '维生素与矿物质含量比较全面的水果', '1005000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/8bbcd7de60a678846664af998f57e71c.png', '', '', 'http://image.meiping123.com/upload/20171125/22302687e1ed2.png', 'L2', '0', '维生素与矿物质含量比较全面的水果');
INSERT INTO `mall_category` VALUES ('1008003', '各种菜', '', '有没有你的菜我就不知道了', '1008000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/4316c2d05745bc90d1f333e363e571bd.png', '', '', 'http://image.meiping123.com/upload/20171128/2341534165d322.png', 'L2', '0', '有没有你的菜我就不知道了');
INSERT INTO `mall_category` VALUES ('1008004', '牛奶', '', '不是所有的牛奶都叫特仑苏┑(￣▽ ￣)┍ ', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/f123c74f54d9acff0bd1546c60034814.png', '', '', 'http://image.meiping123.com/upload/20171128/233208454e000a.png', 'L2', '0', '不是所有的牛奶都叫特仑苏┑(￣▽ ￣)┍ ');
INSERT INTO `mall_category` VALUES ('1008005', '食用油', '', '食用油', '1012000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/83d22ca3d1c8f94ee23ca96de489864c.png', '', '', 'http://image.meiping123.com/upload/20171129/1410276547f483.png', 'L2', '0', '食用油');
INSERT INTO `mall_category` VALUES ('1008006', '调味品', '', '调味品', '1012000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/9b93e661ff59cbda6094e8b30a63724e.png', '', '', 'http://image.meiping123.com/upload/20171129/141043153f79cd.png', 'L2', '0', '调味品');
INSERT INTO `mall_category` VALUES ('1008007', '各种瓜', '', '仅供食用', '1008000', '2', '2', '1', 'http://yanxuan.nosdn.127.net/3a8c7ae5b9dc5c1c4b7f2b656abb0279.png', '', '', 'http://image.meiping123.com/upload/20171128/2342103809e361.png', 'L2', '0', '仅供食用');
INSERT INTO `mall_category` VALUES ('1008008', '橘橙柑柚', '', '维c库，美白淡斑促进脂肪分解', '1005000', '2', '2', '1', 'http://yanxuan.nosdn.127.net/927bc33f7ae2895dd6c11cf91f5e3228.png', '', '', 'http://image.meiping123.com/upload/20171126/0949042144f948.png', 'L2', '0', '维c库，美白淡斑促进脂肪分解');
INSERT INTO `mall_category` VALUES ('1008009', '各种瓜', '', '西瓜，甜瓜，哈密瓜...黄瓜不在这儿', '1005000', '3', '3', '1', 'http://yanxuan.nosdn.127.net/243e5bf327a87217ad1f54592f0176ec.png', '', '', 'http://image.meiping123.com/upload/20171126/095552248636ae.png', 'L2', '0', '西瓜，甜瓜，哈密瓜...黄瓜不在这儿');
INSERT INTO `mall_category` VALUES ('1008010', '各种豆', '', '红豆生南国...下一句是什么', '1008000', '3', '3', '1', 'http://yanxuan.nosdn.127.net/1121696544ed9b0c2a70e82f1088fa0e.png', '', '', 'http://image.meiping123.com/upload/20171128/23422438160579.png', 'L2', '0', '红豆生南国...下一句是什么');
INSERT INTO `mall_category` VALUES ('1008011', '干货', '', '好好描述，这个是各种晒干的海产', '1005001', '5', '5', '1', 'http://yanxuan.nosdn.127.net/dc4d6c35b9f4abb42d2eeaf345710589.png', '', '', 'http://image.meiping123.com/upload/20171127/2258315232249c.png', 'L2', '0', '好好描述，这个是各种晒干的海产');
INSERT INTO `mall_category` VALUES ('1008012', '功能厨具', '', '日日使用的物件，制作精良才能更耐用', '1005001', '1', '1', '0', 'http://yanxuan.nosdn.127.net/22db4ccbf52dc62c723ac83aa587812a.png', '', '', 'http://yanxuan.nosdn.127.net/5b94463017437467a93ae4af17c2ba4f.png', 'L2', '0', '下厨省力小帮手');
INSERT INTO `mall_category` VALUES ('1008013', '茶具咖啡具', '', '好茶配好器', '1005001', '1', '1', '0', 'http://yanxuan.nosdn.127.net/9ea192cd2719c8348f42ec17842ba763.png', '', '', 'http://yanxuan.nosdn.127.net/be3ba4056e274e311d1c23bd2931018d.png', 'L2', '0', '先进工艺制造，功夫体验');
INSERT INTO `mall_category` VALUES ('1008014', '蛋类', '', '一天最少得一个蛋', '1005002', '5', '5', '1', 'http://yanxuan.nosdn.127.net/db48a1db4daab74233656caaea4a06f3.png', '', '', 'http://image.meiping123.com/upload/20171128/0211499f5e1f.png', 'L2', '0', '一天最少得一个蛋');
INSERT INTO `mall_category` VALUES ('1008015', '糕点', '', '无人工添加香精、防腐剂', '1005002', '1', '1', '0', 'http://yanxuan.nosdn.127.net/93168242df456b5f7bf3c89653b3db76.png', '', '', 'http://yanxuan.nosdn.127.net/66ea1d6ad602a8e441af7cada93bdc7a.png', 'L2', '0', '四季糕点，用心烘焙');
INSERT INTO `mall_category` VALUES ('1008016', '各种果', '', '牛油果，圣女果，百香果，等等果', '1005000', '4', '4', '1', 'http://yanxuan.nosdn.127.net/c48e0d9dcfac01499a437774a915842b.png', '', '', 'http://image.meiping123.com/upload/20171126/1010449175eaea.png', 'L2', '0', '牛油果，圣女果，百香果，等等果');
INSERT INTO `mall_category` VALUES ('1008017', '大米白面', '', '大米白面', '1012000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/fdc048e1bf4f04d1c20b32eda5d1dc6e.png', '', '', 'http://image.meiping123.com/upload/20171129/141055138496e6.png', 'L2', '0', '大米白面');
INSERT INTO `mall_category` VALUES ('1008018', '菇类', '', '啥,菌类?...咱平潭人叫菇类...哥屋菇', '1008000', '4', '4', '1', 'http://yanxuan.nosdn.127.net/2f71c7710f0bf857e787e1adb449c8a2.png', '', '', 'http://image.meiping123.com/upload/20171128/234234785c1457.png', 'L2', '0', '啥,菌类?...咱平潭人叫菇类...哥屋菇');
INSERT INTO `mall_category` VALUES ('1009000', '蛋糕、面包、冰淇淋', '', '蛋糕、面包、冰淇淋', '1013001', '1', '1', '1', 'http://yanxuan.nosdn.127.net/e071686c212e93aa2fcafd0062a9c613.png', '', '', 'http://image.meiping123.com/upload/20171130/012401277d61f6.png', 'L2', '0', '蛋糕、面包、冰淇淋');
INSERT INTO `mall_category` VALUES ('1010000', '奶饮', '', '牛奶多喝会长高，真的，不骗你', '0', '6', '5', '1', 'http://yanxuan.nosdn.127.net/003e1d1289f4f290506ac2aedbd09d35.jpg', 'http://yanxuan.nosdn.127.net/28a685c96f91584e7e4876f1397767db.png', '//nos.netease.com/yanxuan/135113d6a43536b717063413fa24d69a.jpg', 'http://image.meiping123.com/upload/20171125/1636065772a9fb.jpg', 'L1', '0', '牛奶多喝会长高，真的，不骗你');
INSERT INTO `mall_category` VALUES ('1010001', '饮料、凉茶', '', '。。。。。。', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/20279e1753e4eedc6e347857acda9681.png', '', '', 'http://image.meiping123.com/upload/20171128/2332196738063e.png', 'L2', '0', '。。。。。。');
INSERT INTO `mall_category` VALUES ('1010002', '果汁、水', '', '果汁、水', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/364269344ed69adafe1b70ab7998fc50.png', '', '', 'http://image.meiping123.com/upload/20171128/23334662572c7c.png', 'L2', '0', '果汁、水');
INSERT INTO `mall_category` VALUES ('1010003', '热带水果', '', '很热很热的地方生长的水果', '1005000', '5', '5', '1', 'http://yanxuan.nosdn.127.net/83d4c87f28c993af1aa8d3e4d30a2fa2.png', '', '', 'http://image.meiping123.com/upload/20171126/104311608f51b5.png', 'L2', '0', '很热很热的地方生长的水果');
INSERT INTO `mall_category` VALUES ('1010004', '葱姜蒜', '', '不装，是真蒜', '1008000', '5', '5', '1', 'http://yanxuan.nosdn.127.net/5197c44b610d786796f955334b55c7a5.png', '', '', 'http://image.meiping123.com/upload/20171128/23424673539796.png', 'L2', '0', '不装，是真蒜');
INSERT INTO `mall_category` VALUES ('1011000', '日用', '', '日用品，不解释', '0', '7', '6', '1', 'http://yanxuan.nosdn.127.net/7dc78383e44df530f543659a977740de.jpg', 'http://yanxuan.nosdn.127.net/1ba9967b8de1ac50fad21774a4494f5d.png', '//nos.netease.com/yanxuan/8ab3c73fe90951a942e8b06d848f8743.jpg', 'http://image.meiping123.com/upload/20171125/191612705bacfc.jpg', 'L1', '0', '日用品，不解释');
INSERT INTO `mall_category` VALUES ('1011001', '身体洗护', '', '身体洗护', '1011000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/720aebaa529df9391b95a078dfb2fd5c.png', '', '', 'http://image.meiping123.com/upload/20171129/004858401e4eac.png', 'L2', '0', '身体洗护');
INSERT INTO `mall_category` VALUES ('1011002', '五谷杂粮', '', '五谷杂粮', '1012000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/da884ff3b9e9d5276986c99e85722461.png', '', '', 'http://image.meiping123.com/upload/20171129/141015794503c3.png', 'L2', '0', '五谷杂粮');
INSERT INTO `mall_category` VALUES ('1011003', '其他', '', '编辑太懒了，就一块打包在这儿了吧', '1005000', '6', '6', '1', 'http://yanxuan.nosdn.127.net/316afeb3948b295dfe073e4c51f77a42.png', '', '', 'http://image.meiping123.com/upload/20171126/10533383973401.png', 'L2', '0', '编辑太懒了，就一块打包在这儿了吧');
INSERT INTO `mall_category` VALUES ('1011004', '家饰', '', '点缀美好生活，品质在于细节', '1005000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/ab0df9445d985bf6719ac415313a8e88.png', '', '', 'http://yanxuan.nosdn.127.net/79275db76b5865e6167b0fbd141f2d7e.png', 'L2', '0', '装饰你的家');
INSERT INTO `mall_category` VALUES ('1012000', '粮油', '', '五谷丰登', '0', '8', '7', '1', 'http://yanxuan.nosdn.127.net/d233a1a9060a22e8eb0e2b326252eece.jpg', 'http://yanxuan.nosdn.127.net/c2a3d6349e72c35931fe3b5bcd0966be.png', '//nos.netease.com/yanxuan/a0c91ae573079830743dec6ee08f5841.jpg', 'http://image.meiping123.com/upload/20171125/194007462cf781.jpg', 'L1', '0', '五谷丰登');
INSERT INTO `mall_category` VALUES ('1012001', '功能箱包', '', '箱子里装着你的生活', '1008000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/3050a2b3052d766c4b460d4b766353a3.png', '', '', 'http://yanxuan.nosdn.127.net/0645dcda6172118f9295630c2a6f234f.png', 'L2', '0', '范思哲、Coach等品牌制造商出品');
INSERT INTO `mall_category` VALUES ('1012002', '罐头食品', '', '罐头食品', '1012000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/4e929a21baebdb1200361d8097e35e45.png', '', '', 'http://image.meiping123.com/upload/20171129/14112757534cc1.png', 'L2', '0', '罐头食品');
INSERT INTO `mall_category` VALUES ('1012003', '速冻食品', '', '速冻食品', '1012000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/e1743239e41ca9af76875aedc73be7f0.png', '', '', 'http://image.meiping123.com/upload/20171129/14212922524225.png', 'L2', '0', '速冻食品');
INSERT INTO `mall_category` VALUES ('1013000', '靴', '', 'UGG制造商出品', '1008000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/868c2a976719cd508e9ddf807167a446.png', '', '', 'http://yanxuan.nosdn.127.net/59485f1aa100e4210e16175f3412fa41.png', 'L2', '0', '经典的温暖');
INSERT INTO `mall_category` VALUES ('1013001', '零食', '', '这个还是少吃点，小心胖哦', '0', '9', '8', '1', 'http://yanxuan.nosdn.127.net/ef8c49f8c92d1f86eb76dec0b5bc7cef.jpg', 'http://yanxuan.nosdn.127.net/9fe068776b6b1fca13053d68e9c0a83f.png', '//nos.netease.com/yanxuan/14bb4a29498a0f93a1ea001f26fea1dd.jpg', 'http://image.meiping123.com/upload/20171125/1959148218be96.jpg', 'L1', '0', '这个还是少吃点，小心胖哦');
INSERT INTO `mall_category` VALUES ('1013002', '果冻、饼干、巧克力', '', '果冻、饼干、巧克力', '1013001', '1', '1', '1', 'http://yanxuan.nosdn.127.net/aa49c088f74a1c318f1765cc2703495a.png', '', '', 'http://image.meiping123.com/upload/20171130/012351339bdf12.png', 'L2', '0', '果冻、饼干、巧克力');
INSERT INTO `mall_category` VALUES ('1013003', '卤味、肉干、火腿', '', '卤味、肉干、火腿', '1013001', '1', '1', '1', 'http://yanxuan.nosdn.127.net/672ddbed88d9762d2be789080880b16a.png', '', '', 'http://image.meiping123.com/upload/20171130/011415670d2820.png', 'L2', '0', '卤味、肉干、火腿');
INSERT INTO `mall_category` VALUES ('1013004', '薯片、方便面', '', '薯片、方便面', '1013001', '1', '1', '1', 'http://yanxuan.nosdn.127.net/d43e7af0a6a9385d88be2ca1df679158.png', '', '', 'http://image.meiping123.com/upload/20171130/012341725ec904.png', 'L2', '0', '薯片、方便面');
INSERT INTO `mall_category` VALUES ('1013005', '刀剪砧板', '', '厨房实用利器', '1005001', '1', '1', '0', 'http://yanxuan.nosdn.127.net/9d481ea4c2e9e6eda35aa720d407332e.png', '', '', 'http://yanxuan.nosdn.127.net/555afbfe05dab48c1a3b90dcaf89b4f2.png', 'L2', '0', '传统工艺 源自中国刀城');
INSERT INTO `mall_category` VALUES ('1013006', '茶、咖啡、冲饮', '', '茶、咖啡、冲饮', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/71f391af17fce739a6a57a1eeadbcbf0.png', '', '', 'http://image.meiping123.com/upload/20171128/2334009423714.png', 'L2', '0', '茶、咖啡、冲饮');
INSERT INTO `mall_category` VALUES ('1015000', '家具', '', '一级原木，严苛工艺', '1005000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/4f00675caefd0d4177892ad18bfc2df6.png', '', '', 'http://yanxuan.nosdn.127.net/d5d41841136182bf49c1f99f5c452dd6.png', 'L2', '0', '大师级工艺');
INSERT INTO `mall_category` VALUES ('1015001', '啤酒', '', '啤酒', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/24a7a33cfeac0bb87a737480db79e053.png', '', '', 'http://image.meiping123.com/upload/20171128/2331214245bc12.png', 'L2', '0', '啤酒');
INSERT INTO `mall_category` VALUES ('1017000', '宠物', '', '出口品质，严选贴合萌宠生活习惯用品。', '1005000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/a0352c57c60ce4f68370ecdab6a30857.png', '', '', 'http://yanxuan.nosdn.127.net/dae4d6e89ab8a0cd3e8da026e4660137.png', 'L2', '0', '抑菌除味，打造宠物舒适空间');
INSERT INTO `mall_category` VALUES ('1018000', '奶粉', '', '奶粉', '1019000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/b5e9f174404ef81b8603d6ecc304c62e.png', '', '', 'http://image.meiping123.com/upload/20171130/01385217829cae.png', 'L2', '0', '奶粉');
INSERT INTO `mall_category` VALUES ('1019000', '母婴', '奶粉,纸尿裤,纸尿布', '良心把控', '0', '10', '9', '1', 'http://yanxuan.nosdn.127.net/99107fbd76eb66cd537213e478189ae1.png', 'http://yanxuan.nosdn.127.net/7093cfecb9dde1dd3eaf459623df4071.png', '//nos.netease.com/yanxuan/72de912b6350b33ecf88a27498840e62.jpg', 'http://image.meiping123.com/upload/20171125/203010273002ca.jpg', 'L1', '0', '良心');
INSERT INTO `mall_category` VALUES ('1020000', '出行用品', '', '便携设计，轻便旅途', '1012000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/b29a11afa76b9f4a57131555f1a54c77.png', '', '', 'http://yanxuan.nosdn.127.net/81e18c6970a7809ee0d86f0545428aa4.png', 'L2', '0', '出行小物，贴心相伴');
INSERT INTO `mall_category` VALUES ('1020001', '罐头食品', '', '罐头食品', '1013001', '1', '1', '1', 'http://yanxuan.nosdn.127.net/f73df75f334126cf1f3823696ea0663c.png', '', '', 'http://image.meiping123.com/upload/20171130/011321764b24b.png', 'L2', '0', '罐头食品');
INSERT INTO `mall_category` VALUES ('1020002', '用具', '', '环保材料，耐用不发霉', '1013001', '1', '1', '0', 'http://yanxuan.nosdn.127.net/1a851b2b3c9e16bdfd020a5fc03e9140.png', '', '', 'http://yanxuan.nosdn.127.net/4e3aebbd7ffef5bb250d19f13cb85620.png', 'L2', '0', '小工具成就美好浴室');
INSERT INTO `mall_category` VALUES ('1020003', '面部洗护', '', '面部洗护', '1011000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/4e50f3c4e4d0a64cd0ad14cfc0b6bd17.png', '', '', 'http://image.meiping123.com/upload/20171129/00461474679bbc.png', 'L2', '0', '面部洗护');
INSERT INTO `mall_category` VALUES ('1020004', '口腔护理', '', '口腔护理', '1011000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/c55338691ebd46bee9ebf225f80363ce.png', '', '', 'http://image.meiping123.com/upload/20171129/00411574818e53.png', 'L2', '0', '口腔护理');
INSERT INTO `mall_category` VALUES ('1020005', '洗涤用品', '', '洗涤用品', '1011000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/0f3c5ad63139096fd0760219e12149af.png', '', '', 'http://image.meiping123.com/upload/20171129/00420560d667b.png', 'L2', '0', '洗涤用品');
INSERT INTO `mall_category` VALUES ('1020006', '纸巾', '', '纸巾', '1011000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/7aac7c5819f71345a52a4b9df23d6239.png', '', '', 'http://image.meiping123.com/upload/20171129/004150685d2260.png', 'L2', '0', '纸巾');
INSERT INTO `mall_category` VALUES ('1020007', '女士专区', '', '女士专区', '1011000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/5db40a5bf84c177515610471d4d08687.png', '', '', 'http://image.meiping123.com/upload/20171129/004723823f36bc.png', 'L2', '0', '女士专区');
INSERT INTO `mall_category` VALUES ('1020008', '配饰', '', '优选设计，让细节显示好品味', '1008000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/d835a76e56a88905194f543b67089b4b.png', '', '', 'http://yanxuan.nosdn.127.net/57ce29ca06f592d65aabfa5f0f87ad43.png', 'L2', '0', '与众不同的点睛之笔');
INSERT INTO `mall_category` VALUES ('1020009', '洋酒', '', '洋酒', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/883d89e54a9287569a201eca388a7cda.png', '', '', 'http://image.meiping123.com/upload/20171128/233132308d7bc4.png', 'L2', '0', '洋酒');
INSERT INTO `mall_category` VALUES ('1020010', '国酒', '', '何以解忧、唯有杜康', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/94aa4a4814e2a7a97639438f1d52dcee.png', '', '', 'http://image.meiping123.com/upload/20171128/233142939f2b13.png', 'L2', '0', '何以解忧、唯有杜康');
INSERT INTO `mall_category` VALUES ('1021000', '节日礼盒', '', '遇见节日的美好', '1012000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/e7b37b1ed5c18d63dc3e6c3f1aa85d8a.png', '', '', 'http://yanxuan.nosdn.127.net/bbb6f0ab4f6321121250c12583b0ff9a.png', 'L2', '0', '限量礼盒限时发售');
INSERT INTO `mall_category` VALUES ('1022000', '数码', '', '享受安全智能的科技生活', '1008000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/3ec003761d346bc866de2ec249d7ff19.png', '', '', 'http://yanxuan.nosdn.127.net/c33b13875a86da535c935e3d454a6fd2.png', 'L2', '0', '智能硬件，匠心出品');
INSERT INTO `mall_category` VALUES ('1023000', '厨房小电', '', '省心省力，厨房高效能手', '1005001', '1', '1', '0', 'http://yanxuan.nosdn.127.net/521bd0c02d283b80ba49e73ca84df250.png', '', '', 'http://yanxuan.nosdn.127.net/c09d784ba592e4fadabbaef6b2e95a95.png', 'L2', '0', '厨房里的省心小电器');
INSERT INTO `mall_category` VALUES ('1025000', '纸尿布', '', '纸尿布', '1019000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/bb9232716b2fc96d9bdbac4955360dfa.png', '', '', 'http://image.meiping123.com/upload/20171130/013914500fe14.png', 'L2', '0', '纸尿布');
INSERT INTO `mall_category` VALUES ('1027000', '茗茶', '', '一品茶香，品茗即是观心，饮茶涤净尘虑', '1005002', '1', '1', '0', 'http://yanxuan.nosdn.127.net/0c5af0575176c4a3023783bef7a87a0f.png', '', '', 'http://yanxuan.nosdn.127.net/cfeb623929f3936cc882ffc6a9a2e927.png', 'L2', '0', '一品茶香，品茗即是观心，饮茶涤净尘虑');
INSERT INTO `mall_category` VALUES ('1027001', '果干', '', '品尝与收获到的是自然的味道', '1005002', '1', '1', '0', 'http://yanxuan.nosdn.127.net/60f4ae2beef4754347fa36208f84efab.png', '', '', 'http://yanxuan.nosdn.127.net/4cdbf6ae196671cca154fe16e152d8d4.png', 'L2', '0', '品尝与收获到的是自然的味道');
INSERT INTO `mall_category` VALUES ('1028001', '婴儿洗护', '', '婴儿洗护', '1019000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/71feb3efd3eaee01a74e8aa78430de9d.png', '', '', 'http://image.meiping123.com/upload/20171130/0139435731cc0.png', 'L2', '0', '婴儿洗护');
INSERT INTO `mall_category` VALUES ('1032000', '魔兽世界', '', '魔兽世界周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/336f0186a9920eb0f93a3912f3662ffe.png', '', '', 'http://yanxuan.nosdn.127.net/becfba90e8a5c95d403b8a6b9bb77825.png', 'L2', '0', '艾泽拉斯的冒险，才刚刚开始');
INSERT INTO `mall_category` VALUES ('1032001', '炉石传说', '', '炉石传说周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/97937fcf2defb864d9e53d98a337d78a.png', '', '', 'http://yanxuan.nosdn.127.net/b5af3f6bfcbeb459d6c448ba87f8cc35.png', 'L2', '0', '快进来坐下吧，看看酒馆的新玩意');
INSERT INTO `mall_category` VALUES ('1032002', '守望先锋', '', '守望先锋周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/8cab7bf1225dc9893bd9de06fc51921d.png', '', '', 'http://yanxuan.nosdn.127.net/a562f05bf38f5ee478fefb81856aad3d.png', 'L2', '0', '物美价廉的补给箱');
INSERT INTO `mall_category` VALUES ('1032003', '暗黑破坏神III', '', '暗黑破坏神III周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/8fe4eb999f748236228a73e09878e277.png', '', '', 'http://yanxuan.nosdn.127.net/1e19e948de63a1d0895a8620250c441f.png', 'L2', '0', '奈非天们，停下脚步整理下行囊');
INSERT INTO `mall_category` VALUES ('1032004', '星际争霸II', '', '星际争霸II周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/433ff879a3686625535ca0304be22ab2.png', '', '', 'http://yanxuan.nosdn.127.net/7394ce778791ae8242013d6c974f47e0.png', 'L2', '0', '记录科普卢星区的战斗时光');
INSERT INTO `mall_category` VALUES ('1032005', '风暴英雄', '', '风暴英雄周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/e091aae0c8cafc5ab48dfabcc52c79b6.png', '', '', 'http://yanxuan.nosdn.127.net/ff1e28fb7151008f8dc46bbf8b357f63.png', 'L2', '0', '时空枢纽，是个充满惊喜的地方');
INSERT INTO `mall_category` VALUES ('1033000', '梦幻西游', '', '梦幻西游精品周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/f0698297aaac41b778c1ea65eefb8b34.png', '', '', 'http://yanxuan.nosdn.127.net/36711325781ca50fdfe234489fca973e.png', 'L2', '0', '梦幻西游精品周边');
INSERT INTO `mall_category` VALUES ('1034000', '葡萄酒', '', '葡萄美酒玻璃杯', '1010000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/d82d0bacfd7243c2ad09dbf2513cfcf9.png', '', '', 'http://image.meiping123.com/upload/20171128/23315861411a04.png', 'L2', '0', '葡萄美酒玻璃杯');
INSERT INTO `mall_category` VALUES ('1034001', '你懂的', '', '你懂的', '1011000', '1', '1', '1', 'http://yanxuan.nosdn.127.net/06bbfb293b6194b27ebdb3350203a1f7.png', '', '', 'http://image.meiping123.com/upload/20171129/004216935fb8f5.png', 'L2', '0', '你懂的');
INSERT INTO `mall_category` VALUES ('1035000', '卫衣', '', '舒适百搭，时尚选择', '1010000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/97bb55280b8ffa40390f2ee36486314a.png', '', '', 'http://yanxuan.nosdn.127.net/0282a81bbcae6c39918808fe7c4e1b93.png', 'L2', '0', '舒适百搭，时尚选择');
INSERT INTO `mall_category` VALUES ('1035001', '毛衣', '', '温暖柔软，品质之选', '1010000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/cc886f16c8b9893305f1b3b6ad4eb0b1.png', '', '', 'http://yanxuan.nosdn.127.net/b610b058cfd73a9211dc890b7b0cbc66.png', 'L2', '0', '温暖柔软，品质之选');
INSERT INTO `mall_category` VALUES ('1035002', '裤装', '', '高质感面料', '1010000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/a3906045b1367d70f658ce9de03e8193.png', '', '', 'http://yanxuan.nosdn.127.net/1728b4eeaa7a3928f5416884f0e75b1c.png', 'L2', '0', '高质感面料，休闲商务两相宜');
INSERT INTO `mall_category` VALUES ('1035003', '肉制品', '', '真嗜肉者，都爱这一味，或麻辣鲜香、或五味俱全，都是佳肴美馔真滋味', '1005002', '1', '1', '0', 'http://yanxuan.nosdn.127.net/db3e11b8a6974a253818ae0d6fb2d24e.png', '', '', 'http://yanxuan.nosdn.127.net/94480324b376a51af47cf92df70d1ade.png', 'L2', '0', '真嗜肉者，都爱这一味，佳肴美馔真滋味');
INSERT INTO `mall_category` VALUES ('1036000', '夏凉', '', '夏凉床品，舒适一夏', '1005000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/13ff4decdf38fe1a5bde34f0e0cc635a.png', '', '', 'http://yanxuan.nosdn.127.net/bd17c985bacb9b9ab1ab6e9d66ee343c.png', 'L2', '0', '夏凉床品，舒适一夏');
INSERT INTO `mall_category` VALUES ('1036001', '眼镜', '', '实用加时尚，造型百搭单品', '1012000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/97f5f75ea1209dfbb85e91932d26c3ed.png', '', '', 'http://yanxuan.nosdn.127.net/c25fb420ccb6f692a2d16f1740b60d21.png', 'L2', '0', '实用加时尚，造型百搭单品');
INSERT INTO `mall_category` VALUES ('1036002', '汽车用品', '', '给你的爱车添装备', '1012000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/382cda1ef9cca77d99bcef05070d7db0.png', '', '', 'http://yanxuan.nosdn.127.net/552e943e585a999169fdbc57b59524d6.png', 'L2', '0', '给你的爱车添装备');
INSERT INTO `mall_category` VALUES ('1036003', '调味', '', '烹饪必备，美食调味', '1005002', '1', '1', '0', 'http://yanxuan.nosdn.127.net/2ae44a3944f2bc737416e1cff3d4bcef.png', '', '', 'http://yanxuan.nosdn.127.net/13d58949a8c72ec914b5ef63ac726a43.png', 'L2', '0', '烹饪必备，美食调味');
INSERT INTO `mall_category` VALUES ('1036004', '大话西游', '', '大话西游正版周边', '1019000', '1', '1', '0', 'http://yanxuan.nosdn.127.net/b60618db213322bdc2c5b1208655bd7e.png', '', '', 'http://yanxuan.nosdn.127.net/470a017f508e9a18f3068be7b315e14b.png', 'L2', '0', '大话西游正版周边');

-- ----------------------------
-- Table structure for mall_channel
-- ----------------------------
DROP TABLE IF EXISTS `mall_channel`;
CREATE TABLE `mall_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(4) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商城-渠道';

-- ----------------------------
-- Records of mall_channel
-- ----------------------------
INSERT INTO `mall_channel` VALUES ('1', '水果', '/pages/category/category?id=1005000', 'http://image.meiping123.com/upload/20171123/2010324562d50c.png', '1');
INSERT INTO `mall_channel` VALUES ('2', '海产', '/pages/category/category?id=1005001', 'http://image.meiping123.com/upload/20171123/200552574378.png', '2');
INSERT INTO `mall_channel` VALUES ('3', '肉蛋', '/pages/category/category?id=1005002', 'http://image.meiping123.com/upload/20171123/20055893987026.png', '3');
INSERT INTO `mall_channel` VALUES ('4', '蔬菜', '/pages/category/category?id=1008000', 'http://image.meiping123.com/upload/20171123/20060663e68bb.png', '4');
INSERT INTO `mall_channel` VALUES ('5', '奶饮', '/pages/category/category?id=1010000', 'http://image.meiping123.com/upload/20171123/2006152201d63a.png', '5');

-- ----------------------------
-- Table structure for mall_collect
-- ----------------------------
DROP TABLE IF EXISTS `mall_collect`;
CREATE TABLE `mall_collect` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户Id',
  `value_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品Id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒',
  `type_id` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`value_id`),
  KEY `is_attention` (`is_attention`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-会员收藏';

-- ----------------------------
-- Records of mall_collect
-- ----------------------------
INSERT INTO `mall_collect` VALUES ('77', '15', '1181010', '1508678249', '0', '0');

-- ----------------------------
-- Table structure for mall_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_comment`;
CREATE TABLE `mall_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户评论的类型;0评论的是商品,1评论的是文章',
  `value_id` int(11) DEFAULT '0' COMMENT 'type_id=0为goods_id',
  `user_id` int(11) DEFAULT '0' COMMENT '会员Id',
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '产品Id',
  `goods_specifition_name_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品规格详情',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '状态 是否被管理员批准显示;1是;0未批准显示',
  `content` varchar(6550) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '储存为base64编码',
  `add_time` bigint(12) unsigned DEFAULT '0' COMMENT '记录时间',
  `eval_level` tinyint(4) DEFAULT NULL COMMENT '评价级别 1-5级 默认 5 ',
  `delivery_level` tinyint(4) DEFAULT NULL COMMENT '配送质量',
  `goods_level` tinyint(4) DEFAULT NULL COMMENT '商品服务',
  `value_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`),
  KEY `id_value` (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商城-评论';

-- ----------------------------
-- Records of mall_comment
-- ----------------------------

-- ----------------------------
-- Table structure for mall_comment_picture
-- ----------------------------
DROP TABLE IF EXISTS `mall_comment_picture`;
CREATE TABLE `mall_comment_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评价Id',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '评价图片',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城-评论图片存储';

-- ----------------------------
-- Records of mall_comment_picture
-- ----------------------------

-- ----------------------------
-- Table structure for mall_coupon
-- ----------------------------
DROP TABLE IF EXISTS `mall_coupon`;
CREATE TABLE `mall_coupon` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT '' COMMENT '优惠券名称',
  `type_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `send_type` tinyint(3) unsigned DEFAULT '0' COMMENT '发放方式 0：按订单发放 1：按用户发放(通用优惠券，用户点击领取) 2:商品转发送券 3：按商品发放 4:新用户注册 5：线下发放 6评价好评红包（固定或随机红包） 7包邮（不入会员优惠券表）',
  `min_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '最小金额(send_type=2、6使用，随机)',
  `max_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '最小金额(send_type=2、6使用，随机)',
  `send_start_date` datetime DEFAULT NULL COMMENT '发放时间（暂时不用）',
  `send_end_date` datetime DEFAULT NULL COMMENT '发放时间（暂时不用）',
  `use_start_date` datetime DEFAULT NULL COMMENT '使用开始时间',
  `use_end_date` datetime DEFAULT NULL COMMENT '使用结束时间',
  `min_goods_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '最小订单金额',
  `min_transmit_num` int(4) DEFAULT NULL COMMENT '转发次数 send_type=2使用',
  `pic_url` varchar(100) DEFAULT NULL COMMENT '活动大图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-优惠券';

-- ----------------------------
-- Records of mall_coupon
-- ----------------------------
INSERT INTO `mall_coupon` VALUES ('1', '满100减10元', '10.00', '0', '0.00', '0.00', '2017-08-28 11:51:49', '2020-09-29 11:51:53', '2017-05-01 16:50:40', '2019-11-27 16:50:48', '100.00', null, null);
INSERT INTO `mall_coupon` VALUES ('3', '满100减5元', '5.00', '2', '100.00', '0.00', '2017-08-28 11:50:51', '2020-12-02 11:50:56', '2017-06-14 11:50:56', '2020-12-02 11:50:56', '100.00', '1', null);
INSERT INTO `mall_coupon` VALUES ('4', '新用户注册5元', '5.00', '4', '0.00', '0.00', '2017-08-28 11:50:51', '2020-12-02 11:50:56', '2017-06-14 11:50:56', '2020-12-02 11:50:56', '200.00', null, null);
INSERT INTO `mall_coupon` VALUES ('7', '满88元免配送费', '0.00', '7', '0.00', '0.00', '2017-08-28 11:50:51', '2020-12-02 11:50:56', '2017-05-01 16:50:40', '2019-11-27 16:50:48', '88.00', null, null);
INSERT INTO `mall_coupon` VALUES ('8', '满150减20元', '20.00', '0', '0.00', '0.00', '2017-08-28 11:51:49', '2020-09-29 11:51:53', '2017-05-01 16:50:40', '2019-11-27 16:50:48', '150.00', null, null);
INSERT INTO `mall_coupon` VALUES ('9', '满20元减1元', '1.00', '6', '20.00', '0.00', '2017-08-28 11:51:49', '2020-09-29 11:51:53', '2017-05-01 16:50:40', '2019-11-27 16:50:48', '20.00', '10', null);
INSERT INTO `mall_coupon` VALUES ('11', '满100减10', '10.00', '0', '0.00', '0.00', null, null, null, null, null, null, null);
INSERT INTO `mall_coupon` VALUES ('12', '满59，3元配送费', '3.00', '7', '0.00', '0.00', '2018-03-05 00:00:00', '2089-01-01 00:00:00', '2018-01-01 00:00:00', '2079-01-06 00:00:00', '59.00', null, null);

-- ----------------------------
-- Table structure for mall_coupon_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_coupon_goods`;
CREATE TABLE `mall_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券Id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券关联商品';

-- ----------------------------
-- Records of mall_coupon_goods
-- ----------------------------
INSERT INTO `mall_coupon_goods` VALUES ('1', '4', '1181000');
INSERT INTO `mall_coupon_goods` VALUES ('2', '4', '1155015');

-- ----------------------------
-- Table structure for mall_feedback
-- ----------------------------
DROP TABLE IF EXISTS `mall_feedback`;
CREATE TABLE `mall_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员Id',
  `user_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '会员会员名称',
  `mobile` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机',
  `feed_Type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '反馈类型',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '详细内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `add_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商城-反馈';

-- ----------------------------
-- Records of mall_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for mall_footprint
-- ----------------------------
DROP TABLE IF EXISTS `mall_footprint`;
CREATE TABLE `mall_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员Id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `referrer` int(11) DEFAULT NULL COMMENT '转发人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2926 DEFAULT CHARSET=utf8 COMMENT='商城-会员足迹';

-- ----------------------------
-- Records of mall_footprint
-- ----------------------------
INSERT INTO `mall_footprint` VALUES ('1126', '15', '1006013', '1509416111', '0');

-- ----------------------------
-- Table structure for mall_form_ids
-- ----------------------------
DROP TABLE IF EXISTS `mall_form_ids`;
CREATE TABLE `mall_form_ids` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `form_id` varchar(64) DEFAULT '',
  `valid_num` tinyint(3) unsigned DEFAULT '0' COMMENT '有效次数',
  `expire_time` datetime DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-小程序form_id收集';

-- ----------------------------
-- Records of mall_form_ids
-- ----------------------------
INSERT INTO `mall_form_ids` VALUES ('117', '88', 'the formId is a mock one', '3', '2018-04-07 10:05:33');
INSERT INTO `mall_form_ids` VALUES ('118', '88', 'the formId is a mock one', '3', '2018-04-07 10:07:31');
INSERT INTO `mall_form_ids` VALUES ('119', '88', 'the formId is a mock one', '3', '2018-04-07 10:10:46');
INSERT INTO `mall_form_ids` VALUES ('120', '88', 'the formId is a mock one', '3', '2018-04-07 10:43:44');
INSERT INTO `mall_form_ids` VALUES ('121', '88', 'the formId is a mock one', '3', '2018-04-07 10:46:34');
INSERT INTO `mall_form_ids` VALUES ('122', '88', 'the formId is a mock one', '3', '2018-04-07 10:57:44');
INSERT INTO `mall_form_ids` VALUES ('123', '88', 'the formId is a mock one', '3', '2018-04-07 10:59:50');

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT '0',
  `goods_sn` varchar(60) DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `brand_id` int(11) unsigned DEFAULT '0',
  `goods_number` mediumint(8) unsigned DEFAULT '0',
  `keywords` varchar(255) DEFAULT '',
  `goods_brief` varchar(255) DEFAULT '',
  `goods_desc` text,
  `is_on_sale` tinyint(1) unsigned DEFAULT '1',
  `add_time` datetime DEFAULT NULL,
  `sort_order` smallint(4) unsigned DEFAULT '100',
  `is_delete` tinyint(1) unsigned DEFAULT '0',
  `attribute_category` int(11) unsigned DEFAULT '0',
  `counter_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '专柜价格',
  `extra_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '附加价格',
  `is_new` tinyint(1) unsigned DEFAULT '0',
  `goods_unit` varchar(45) DEFAULT NULL COMMENT '商品单位',
  `primary_pic_url` varchar(255) DEFAULT NULL COMMENT '商品主图',
  `list_pic_url` varchar(255) DEFAULT NULL COMMENT '商品列表图',
  `retail_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '零售价格',
  `sell_volume` int(11) unsigned DEFAULT '0' COMMENT '销售量',
  `primary_product_id` int(11) unsigned DEFAULT '0' COMMENT '主sku　product_id',
  `unit_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '单位价格，单价',
  `promotion_desc` varchar(255) DEFAULT NULL,
  `promotion_tag` varchar(45) DEFAULT NULL,
  `app_exclusive_price` decimal(10,2) unsigned DEFAULT NULL COMMENT 'APP专享价',
  `is_app_exclusive` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是APP专属',
  `is_limited` tinyint(1) unsigned DEFAULT NULL,
  `is_hot` tinyint(1) unsigned DEFAULT '0',
  `market_price` decimal(10,2) DEFAULT '0.00',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user_dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1181122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品信息';

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES ('1181001', '1035000', '12', '卫衣测试', '1022000', '13', '测试关键字', '这个是测试商品', '<h1 style=\"text-align: center;\">测试商品</h1><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171005/1454028590870.png\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171005/1454028590870.png\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171005/15103264329336.png\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171015/213256620af6ff.png\" width=\"300\"></p><p><br></p><p><br></p><p><br></p>', '1', '2017-10-15 21:58:38', null, '0', '1008002', null, null, '1', null, 'https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171015/2131056346fd09.png', 'https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171015/2131241443e171.png', '299.00', null, '253', null, '测试', null, null, '0', '0', '0', '388.00', '1', '1', '2017-10-15 21:58:51', null);
INSERT INTO `mall_goods` VALUES ('1181010', '1013002', '10080010001', '德芙 轻柔威化巧克力22.5g', '1041000', '10', '巧克力', '巧克力', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/172027820e288.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/172030332e599b.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/172033645f79af.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/172037672af21.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/172049661f5e87.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/1720523798ae68.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/172055161fd0e7.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171227/17205755115c8d.jpg\" width=\"300\"></p><p><br></p><p><br></p>', '1', '2017-12-27 17:13:06', '1', '0', '1036002', '10.00', null, null, null, 'http://image.meiping123.com/upload/20171227/173439463fc029.jpg', 'http://image.meiping123.com/upload/20171227/1729071646f21a.png', '20.00', null, null, null, null, null, null, '0', '0', '0', '20.00', '1', '1', '2017-12-28 12:21:47', null);
INSERT INTO `mall_goods` VALUES ('1181011', '1013002', '10080010005', '德芙 脆香米奶香白巧克力24g', '1041000', '100', '', '巧克力', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171228/123518976ea816.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171228/1235221481e7f8.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171228/12352532032e53.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171228/123529773c8fb0.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171228/1235412892c2da.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171228/123547492ffcda.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171228/1235525546759c.jpg\" width=\"300\"></p><p><br></p>', '1', '2017-12-28 12:36:27', null, '0', '1036002', '20.00', null, null, null, 'http://image.meiping123.com/upload/20171228/1730281925ee39.jpg', 'http://image.meiping123.com/upload/20171228/17303247952d7c.jpg', '15.00', null, '288', null, null, null, null, '0', '0', '0', '20.00', '1', '1', '2017-12-29 09:26:48', null);
INSERT INTO `mall_goods` VALUES ('1181012', '1008018', '122901', '白金针菇 约250g±10g/份', null, '10', '', '金针菇', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171229/15120312fbc94.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171229/151205931b3ee8.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171229/151208982efa8c.jpg\" width=\"300\"></p><p><br></p>', '0', '2017-12-29 15:12:48', null, '0', '1036003', '10.00', null, null, null, '', 'http://image.meiping123.com/upload/20171229/15110973674e5a.jpg', '10.00', null, '298', null, null, null, null, '0', '0', '0', '10.00', '1', '1', '2018-04-20 19:04:57', null);
INSERT INTO `mall_goods` VALUES ('1181013', '1008003', '122902', '白萝卜 约900±50g/份', null, '10', null, '新鲜白萝卜', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171229/151455741b08d7.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171229/1514579799b991.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171229/15150086424747.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20171229/15150346687a74.jpg\" width=\"300\"></p><p><br></p>', '1', '2017-12-29 15:15:20', null, '0', '1036003', '10.00', null, null, null, '', 'http://image.meiping123.com/upload/20171229/1514178169abce.jpg', '10.00', null, '299', null, null, null, null, '0', '0', '0', '10.00', '1', '1', '2017-12-29 16:29:38', null);
INSERT INTO `mall_goods` VALUES ('1181121', '1008004', '11002', '安慕希风味酸奶草莓味205g*12瓶', null, '10', null, '安慕希风味酸奶草莓味205g', '<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/133021581f370e.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/1330233998d9c4.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/1330254386458f.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/133030438fb39.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/1330323965c3b7.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/1330348846aebc.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/1330374818be16.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/1330397618d577.jpg\" width=\"300\"></p><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"http://image.meiping123.com/upload/20180305/133045681f93a6.jpg\" width=\"300\"></p><p><br></p>', '1', '2018-03-05 13:31:00', null, '0', '1015000', '60.00', null, null, null, '', 'http://image.meiping123.com/upload/20180305/133004370b0a44.jpg', '72.00', null, '497', null, '安慕希风味酸奶草莓味205g*12瓶', null, null, '0', '0', '1', '75.00', '1', '1', '2018-03-26 13:45:36', null);

-- ----------------------------
-- Table structure for mall_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_attribute`;
CREATE TABLE `mall_goods_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品Id',
  `attribute_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '属性Id',
  `value` text NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=875 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品属性关联';

-- ----------------------------
-- Records of mall_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_bargain
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_bargain`;
CREATE TABLE `mall_goods_bargain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价大图',
  `item_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动条例图片',
  `abbr_pic_url` varchar(100) DEFAULT NULL COMMENT '简略图片',
  `goods_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '产品Id',
  `subtitle` varchar(255) NOT NULL,
  `bargain_money` decimal(10,2) DEFAULT NULL COMMENT '每次砍价最高金额 （范围，1-当前金额）',
  `retail_min_price` decimal(10,2) DEFAULT NULL COMMENT '商品最低价格',
  `open_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `goods_specification_name_value` varchar(500) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '删除标识  1删除 0正常',
  KEY `topic_id` (`id`),
  KEY `bargain_goods_id_index` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-砍价设置';

-- ----------------------------
-- Records of mall_goods_bargain
-- ----------------------------
INSERT INTO `mall_goods_bargain` VALUES ('314', '专业运动品牌同厂', 'https://yanxuan.nosdn.127.net/14943267735961674.jpg', 'http://image.meiping123.com/upload/20171220/2347302619fc27.png', '1181010', '285', '专业运动品牌同厂，毛毛虫鞋买二送一', '500.00', '1.00', '2017-11-21 00:00:00', '2019-11-22 00:00:00', null, '0');
INSERT INTO `mall_goods_bargain` VALUES ('313', '一次解决5个节日送礼难题', 'https://yanxuan.nosdn.127.net/14942996754171334.jpg', 'http://image.meiping123.com/upload/20171220/2347302619fc27.png', '1181011', '297', '这些就是他们想要的礼物清单', '1.00', '60.00', '2017-01-01 13:54:00', '2019-12-06 13:54:00', null, '0');

-- ----------------------------
-- Table structure for mall_goods_crash
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_crash`;
CREATE TABLE `mall_goods_crash` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品Id',
  `goods_crash_id` int(11) NOT NULL COMMENT '搭配商品Id',
  `product_crash_id` int(11) NOT NULL COMMENT '搭配产品Id',
  `retail_crash_price` decimal(10,2) NOT NULL COMMENT '搭配商品价格，需要小于原始价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC COMMENT='商城-商品搭配减';

-- ----------------------------
-- Records of mall_goods_crash
-- ----------------------------
INSERT INTO `mall_goods_crash` VALUES ('1', '1166008', '1181000', '1', '11.00');
INSERT INTO `mall_goods_crash` VALUES ('2', '1152101', '1006002', '7', '20.00');

-- ----------------------------
-- Table structure for mall_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_gallery`;
CREATE TABLE `mall_goods_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `img_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '描述',
  `sort_order` int(11) DEFAULT '5' COMMENT '排序',
  `img_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1579 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商城-商品gallery图';

-- ----------------------------
-- Records of mall_goods_gallery
-- ----------------------------
INSERT INTO `mall_goods_gallery` VALUES ('5', '1006007', '', '5', 'http://yanxuan.nosdn.127.net/b7e3438c473a296a7e9feecbd4139af5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('6', '1006007', '', '5', 'http://yanxuan.nosdn.127.net/70422011e5a9855a0723c9c08d0cbbb0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('7', '1006007', '', '5', 'http://yanxuan.nosdn.127.net/f65dbb00aff8b43be02f2c8104208877.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('8', '1006007', '', '5', 'http://yanxuan.nosdn.127.net/85e8575c8e473a2f71054e9e36b1211c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('9', '1006010', '', '5', 'http://yanxuan.nosdn.127.net/9b40ba300851af1b84ca0749bae70718.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('10', '1006010', '', '5', 'http://yanxuan.nosdn.127.net/fd7465ba32e23fd107161306d6b580cc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('11', '1006010', '', '5', 'http://yanxuan.nosdn.127.net/288dc3fe3238962519f3abd5201e411e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('12', '1006010', '', '5', 'http://yanxuan.nosdn.127.net/06cb7ac0991cb4ea236c826e8e6f0a9c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('21', '1009009', '', '5', 'http://yanxuan.nosdn.127.net/33a04714bc15a43d0ce87d71d1d9694a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('22', '1009009', '', '5', 'http://yanxuan.nosdn.127.net/e0999e26962b6e88b05fdfe9ba8ff644.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('23', '1009009', '', '5', 'http://yanxuan.nosdn.127.net/dd2aff7f4edb26f5e0f691e94a51c66a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('24', '1009009', '', '5', 'http://yanxuan.nosdn.127.net/78059fd78b649d395f8e5740ba8eb99e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('25', '1009012', '', '5', 'http://yanxuan.nosdn.127.net/c2f88baff6d3d9c954bf437649d26954.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('26', '1009012', '', '5', 'http://yanxuan.nosdn.127.net/36176eb5337c5048cf4403b145f43bc4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('27', '1009012', '', '5', 'http://yanxuan.nosdn.127.net/13aae0f61d87198867c088aa50c00043.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('28', '1009012', '', '5', 'http://yanxuan.nosdn.127.net/40e881087eae3ef541aa13f6b4e9d356.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('29', '1009013', '', '5', 'http://yanxuan.nosdn.127.net/34bb2ff0358432c3f15e6afa0d5d2104.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('30', '1009013', '', '5', 'http://yanxuan.nosdn.127.net/5114eb391397033eca305055e21d9cb3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('31', '1009013', '', '5', 'http://yanxuan.nosdn.127.net/73a866b532183dec74232b0cc1b36428.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('32', '1009013', '', '5', 'http://yanxuan.nosdn.127.net/331a2954f81d0cfe764cbdf2e5b6b328.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('37', '1010000', '', '5', 'http://yanxuan.nosdn.127.net/57779dbcd9cbb95241123d798f4693c2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('38', '1010000', '', '5', 'http://yanxuan.nosdn.127.net/64c52113e0c5ca42cd363d5854280119.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('39', '1010000', '', '5', 'http://yanxuan.nosdn.127.net/b578539da6f0e39eb74991e9a0b74a90.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('40', '1010000', '', '5', 'http://yanxuan.nosdn.127.net/b544dee2401c02e95c0a7bc70960eadf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('45', '1011004', '', '5', 'http://yanxuan.nosdn.127.net/f7e77331229098060bbacf2fc6c1708b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('46', '1011004', '', '5', 'http://yanxuan.nosdn.127.net/2720383ea168872acc8d492de9573cc6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('47', '1011004', '', '5', 'http://yanxuan.nosdn.127.net/45e4c14029626178419c82f2837f51ca.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('48', '1011004', '', '5', 'http://yanxuan.nosdn.127.net/bb6c28d502704d5c1645d066f79bf61d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('49', '1015007', '', '5', 'http://yanxuan.nosdn.127.net/013657a5a5faf8a9a7e3f39b5bba4eac.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('50', '1015007', '', '5', 'http://yanxuan.nosdn.127.net/d46ba997e163430e43735e4ad1caeff0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('51', '1015007', '', '5', 'http://yanxuan.nosdn.127.net/a90e545295d22de031b10aee631e48fe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('52', '1015007', '', '5', 'http://yanxuan.nosdn.127.net/f7188ec871d1f721f64cbe04860a4fe2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('53', '1019000', '', '5', 'http://yanxuan.nosdn.127.net/129cf4c83627828d8c68134eed07acba.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('54', '1019000', '', '5', 'http://yanxuan.nosdn.127.net/155cd16ef921a10849eb6f353a81711d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('55', '1019000', '', '5', 'http://yanxuan.nosdn.127.net/50c44c65dc8913fbc87da4d29e4e16a1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('56', '1019000', '', '5', 'http://yanxuan.nosdn.127.net/007f21a042e9bc44ac4f44db11e5428b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('57', '1019001', '', '5', 'http://yanxuan.nosdn.127.net/35634c85786bb56314df11c0dbea1b57.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('58', '1019001', '', '5', 'http://yanxuan.nosdn.127.net/cdcdee30c0d89fd4defb57539dfab468.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('59', '1019001', '', '5', 'http://yanxuan.nosdn.127.net/9bbfbeead2e0b038f6ee002a2f556281.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('60', '1019001', '', '5', 'http://yanxuan.nosdn.127.net/e86e34c26d2b6d6caa02cd6cf4039cf5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('61', '1019002', '', '5', 'http://yanxuan.nosdn.127.net/c51baecb5f1b3ae106edca6921f74ba8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('62', '1019002', '', '5', 'http://yanxuan.nosdn.127.net/26a804344502042242df6c3d38ccd3d4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('63', '1019002', '', '5', 'http://yanxuan.nosdn.127.net/a3c11ba31e777302be5569b8f76eadc1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('64', '1019002', '', '5', 'http://yanxuan.nosdn.127.net/dbb20bd6803e83b02f4880e1a4f22ad2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('65', '1019006', '', '5', 'http://yanxuan.nosdn.127.net/7d5b06bf24cf343ac939b38fb8c1a1c7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('66', '1019006', '', '5', 'http://yanxuan.nosdn.127.net/343d55292417edd5c3959f3ff5c28020.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('67', '1019006', '', '5', 'http://yanxuan.nosdn.127.net/3e2d677726a32443cfb4e82b15829ff3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('68', '1019006', '', '5', 'http://yanxuan.nosdn.127.net/fff8d78ae12dfe5477e16669664ba4f5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('69', '1020000', '', '5', 'http://yanxuan.nosdn.127.net/e163b42594b58936ee8500abb8b4112c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('70', '1020000', '', '5', 'http://yanxuan.nosdn.127.net/1f6f41a8c5cdafe375548d77e9f06d78.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('71', '1020000', '', '5', 'http://yanxuan.nosdn.127.net/b69fd91ecc1c9b9aa431b8df4298a6a1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('72', '1020000', '', '5', 'http://yanxuan.nosdn.127.net/a621c700d49357a4ab46c6c7a97fa83c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('73', '1021004', '', '5', 'http://yanxuan.nosdn.127.net/7040cb7e6982c3e008575a4ef28c9ca2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('74', '1021004', '', '5', 'http://yanxuan.nosdn.127.net/28f75df99da69ef03d1a9eb581571438.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('75', '1021004', '', '5', 'http://yanxuan.nosdn.127.net/21bdfbb496ba391223b1ea35cecf61a5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('76', '1021004', '', '5', 'http://yanxuan.nosdn.127.net/6b00e7da23c7d6db26e6d7b6a7615dd2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('77', '1021010', '', '5', 'http://yanxuan.nosdn.127.net/4b0e35f974567e45c3070e85e228fae0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('78', '1021010', '', '5', 'http://yanxuan.nosdn.127.net/b7dfccd8bdc97d8823ac0e7ef788ffb3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('79', '1021010', '', '5', 'http://yanxuan.nosdn.127.net/7a4b5ffb08ac487647c2988ec0d8186d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('80', '1021010', '', '5', 'http://yanxuan.nosdn.127.net/13f2f859d43aff3f67b4d81f74b84cc3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('81', '1022000', '', '5', 'http://yanxuan.nosdn.127.net/61a44e7426fbc32db87afd48d85f2e99.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('82', '1022000', '', '5', 'http://yanxuan.nosdn.127.net/ac649a9fc8332aae1c60e8a10fb5a775.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('83', '1022000', '', '5', 'http://yanxuan.nosdn.127.net/3664e1b166b8dd54d05edd631e6966f9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('84', '1022000', '', '5', 'http://yanxuan.nosdn.127.net/989d0d84d55e4a77a1c6dafa0a3bc207.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('85', '1022001', '', '5', 'http://yanxuan.nosdn.127.net/7c782187c209bed0457ed114569cdedf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('86', '1022001', '', '5', 'http://yanxuan.nosdn.127.net/045f5f28165e3f1144fe86ddbbab2ba3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('87', '1022001', '', '5', 'http://yanxuan.nosdn.127.net/afda747fab1299be4594f00b3e4e31d2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('88', '1022001', '', '5', 'http://yanxuan.nosdn.127.net/2860490e0349016cfc4a6a1d4f57c55d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('89', '1023012', '', '5', 'http://yanxuan.nosdn.127.net/184c7ed8ac2ac4f8a7b33ee9d41fde77.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('90', '1023012', '', '5', 'http://yanxuan.nosdn.127.net/46f42df107e2e338503fd13c4c8be128.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('91', '1023012', '', '5', 'http://yanxuan.nosdn.127.net/a584f3f733da004d602b3be9d07c3473.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('92', '1023012', '', '5', 'http://yanxuan.nosdn.127.net/733430be1402c5e645bb40f0682b8ae5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('93', '1023032', '', '5', 'http://yanxuan.nosdn.127.net/bbd9bf40c371e5beb0b380f3f431082f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('94', '1023032', '', '5', 'http://yanxuan.nosdn.127.net/2b786fa55756292a644dcf7b6f85b1d8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('95', '1023032', '', '5', 'http://yanxuan.nosdn.127.net/61a92631136272bf12cba53a4f27edfe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('96', '1023032', '', '5', 'http://yanxuan.nosdn.127.net/4c36bfcea9ca68e120f3aadd072bfd1e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('97', '1023034', '', '5', 'http://yanxuan.nosdn.127.net/8c244a002f59df20637f3562b768621e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('98', '1023034', '', '5', 'http://yanxuan.nosdn.127.net/cc6efd29fb63ff82996f748770efb3de.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('99', '1023034', '', '5', 'http://yanxuan.nosdn.127.net/66104d84d806a01ff1b97efb730ea577.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('100', '1023034', '', '5', 'http://yanxuan.nosdn.127.net/a16b2d6dc024e24cf1472c3f0f78940a.png');
INSERT INTO `mall_goods_gallery` VALUES ('101', '1027004', '', '5', 'http://yanxuan.nosdn.127.net/d2e98b8645e07db420f19433079c690b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('102', '1027004', '', '5', 'http://yanxuan.nosdn.127.net/a32ae0e783c87db508689b42acaf45d5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('103', '1027004', '', '5', 'http://yanxuan.nosdn.127.net/0eaf73715435fd18573b523ceb14125c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('104', '1027004', '', '5', 'http://yanxuan.nosdn.127.net/55ef8f825782fef23d88479cec7691d9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('105', '1029005', '', '5', 'http://yanxuan.nosdn.127.net/7ef08c09c7322d9cb24528aec8802155.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('106', '1029005', '', '5', 'http://yanxuan.nosdn.127.net/5807317c3918f1ac2cf060cf5944602f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('107', '1029005', '', '5', 'http://yanxuan.nosdn.127.net/838453906fdbcd5009186356e356ee62.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('108', '1029005', '', '5', 'http://yanxuan.nosdn.127.net/d131ee4307756bcc72054f9a8d9c9b43.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('109', '1030001', '', '5', 'http://yanxuan.nosdn.127.net/b57e971ab0de96e159c2e8de13df25bd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('110', '1030001', '', '5', 'http://yanxuan.nosdn.127.net/1e06cd5c6107e37214ea9cf13ef08676.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('111', '1030001', '', '5', 'http://yanxuan.nosdn.127.net/a7351368b2e1d57958c66a7225230b24.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('112', '1030001', '', '5', 'http://yanxuan.nosdn.127.net/3b9d726451cbe3c2d4432613d48bc6e9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('113', '1030002', '', '5', 'http://yanxuan.nosdn.127.net/63096efbd6271a42d3d830e79bf9635f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('114', '1030002', '', '5', 'http://yanxuan.nosdn.127.net/50643ebbcf8a243ca609477f431fe75a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('115', '1030002', '', '5', 'http://yanxuan.nosdn.127.net/bfc9ea77fa117eaa6be19ca7329d4c95.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('116', '1030002', '', '5', 'http://yanxuan.nosdn.127.net/a8540865c48fb297f77d30cdf3fb4884.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('117', '1030003', '', '5', 'http://yanxuan.nosdn.127.net/1e0a3442eba15bcff79112b6462a8e08.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('118', '1030003', '', '5', 'http://yanxuan.nosdn.127.net/9750ed0f968d4c879c37396f533f02dc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('119', '1030003', '', '5', 'http://yanxuan.nosdn.127.net/725bf6af1c14901068370aa051acecea.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('120', '1030003', '', '5', 'http://yanxuan.nosdn.127.net/aff411a94562694cbdba5a415ff5dda2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('121', '1030004', '', '5', 'http://yanxuan.nosdn.127.net/ff71d72ea77f23c6ebc7f77dd88ab947.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('122', '1030004', '', '5', 'http://yanxuan.nosdn.127.net/a846819b20cde76700c3e6c9179fff03.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('123', '1030004', '', '5', 'http://yanxuan.nosdn.127.net/8862d704f5590dc42c538a85120e1525.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('124', '1030004', '', '5', 'http://yanxuan.nosdn.127.net/cc182d01d83a3aea2f2928190ce523b6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('125', '1030005', '', '5', 'http://yanxuan.nosdn.127.net/d01e245eaeeff36003b083f9e48421a0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('126', '1030005', '', '5', 'http://yanxuan.nosdn.127.net/71fbb4653d7de33f53f8d272eebe9c8e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('127', '1030005', '', '5', 'http://yanxuan.nosdn.127.net/66a750c2205b4ed159818cfefc961d32.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('128', '1030005', '', '5', 'http://yanxuan.nosdn.127.net/59b6eeb70a31992b1ea9b5fb3c781c27.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('129', '1030006', '', '5', 'http://yanxuan.nosdn.127.net/ef222b9012932fa7b19bef69069156ed.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('130', '1030006', '', '5', 'http://yanxuan.nosdn.127.net/e367cc48de5c3fd5f52bbf76cb65ee5a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('131', '1030006', '', '5', 'http://yanxuan.nosdn.127.net/3bf6f6d4d373c572d7444a935a3e1e3b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('132', '1030006', '', '5', 'http://yanxuan.nosdn.127.net/226a9cd3bed63052e40d2de2fd3c7b6f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('133', '1035006', '', '5', 'http://yanxuan.nosdn.127.net/da263f1716b141df0339ea6b8176ce6f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('134', '1035006', '', '5', 'http://yanxuan.nosdn.127.net/873f61c908523bc4257a4b511e9e422f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('135', '1035006', '', '5', 'http://yanxuan.nosdn.127.net/ecc95cf18f99dee5bfe65f016fa8535f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('136', '1035006', '', '5', 'http://yanxuan.nosdn.127.net/80ef121faf019295c15d73ee8cf35425.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('137', '1036002', '', '5', 'http://yanxuan.nosdn.127.net/1c3acbfaa67a1a2034c53d6a12b87b5b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('138', '1036002', '', '5', 'http://yanxuan.nosdn.127.net/49366cac271c5614501660ccf2c886a6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('139', '1036002', '', '5', 'http://yanxuan.nosdn.127.net/6def3e5d0f22d46c20f88304f2dd1f23.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('140', '1036002', '', '5', 'http://yanxuan.nosdn.127.net/49844b0d390c2a1cf6147e80de8c2e51.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('141', '1036013', '', '5', 'http://yanxuan.nosdn.127.net/e78d08c1c34aac63f3b73f2029ca4e77.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('142', '1036013', '', '5', 'http://yanxuan.nosdn.127.net/29f185e123c9e1f4c075ff014db44324.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('143', '1036013', '', '5', 'http://yanxuan.nosdn.127.net/b2f4d0efc4dc1baf94aaa36712681da5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('144', '1036013', '', '5', 'http://yanxuan.nosdn.127.net/b342166f7e4c5eb4a430d524f248ef07.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('145', '1036016', '', '5', 'http://yanxuan.nosdn.127.net/e4cd24991107bf5f020877ae356d5e91.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('146', '1036016', '', '5', 'http://yanxuan.nosdn.127.net/a98f3626eddeb5840c1ad3f72b5ba368.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('147', '1036016', '', '5', 'http://yanxuan.nosdn.127.net/2766b097e1b9b3993cf11c68c5581631.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('148', '1036016', '', '5', 'http://yanxuan.nosdn.127.net/1fe07019b1a38aa1ff5e4da9c301642e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('149', '1037011', '', '5', 'http://yanxuan.nosdn.127.net/52e1230341bde01128645c65650f601c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('150', '1037011', '', '5', 'http://yanxuan.nosdn.127.net/49b3a096adad4ba4228d5d4fc00eb85f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('151', '1037011', '', '5', 'http://yanxuan.nosdn.127.net/01460a9963bdecead79ce86c7df1e90a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('152', '1037011', '', '5', 'http://yanxuan.nosdn.127.net/ed12a0fc67eea2fec8a81dd044af28d2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('153', '1037012', '', '5', 'http://yanxuan.nosdn.127.net/d37e9d2b6bf71d4afa92928313abb69a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('154', '1037012', '', '5', 'http://yanxuan.nosdn.127.net/8ab74790baa735d1afba16aae5464180.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('155', '1037012', '', '5', 'http://yanxuan.nosdn.127.net/2e1cb4e60899b883dd1824ad9ad8f6d3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('156', '1037012', '', '5', 'http://yanxuan.nosdn.127.net/cac91a5d7952110cda8b857c7b92703c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('157', '1039051', '', '5', 'http://yanxuan.nosdn.127.net/0b89243ca9fbfbc22469a5970cb1e626.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('158', '1039051', '', '5', 'http://yanxuan.nosdn.127.net/73c86d83c8b691609dadf738b1c5fc04.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('159', '1039051', '', '5', 'http://yanxuan.nosdn.127.net/ce894f867b1e3db7ba780726406c86f0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('160', '1039051', '', '5', 'http://yanxuan.nosdn.127.net/c031141657ed452c8ef2ab72aae4618e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('161', '1043005', '', '5', 'http://yanxuan.nosdn.127.net/e48d2eb849c4426894fad347e9b8691a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('162', '1043005', '', '5', 'http://yanxuan.nosdn.127.net/b19866dcc87474faed9e1dbc46f65bcc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('163', '1043005', '', '5', 'http://yanxuan.nosdn.127.net/1a63d1f3785071edcc40e98440950f7c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('164', '1043005', '', '5', 'http://yanxuan.nosdn.127.net/ba5890ed54ea33c387e9773ab3f5523c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('165', '1044012', '', '5', 'http://yanxuan.nosdn.127.net/01cfb372bafa59df04933cd8eeaba197.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('166', '1044012', '', '5', 'http://yanxuan.nosdn.127.net/193969cf544ac650325e36672e219137.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('167', '1044012', '', '5', 'http://yanxuan.nosdn.127.net/e08100fe3969def50321373bcfb2b0a8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('168', '1044012', '', '5', 'http://yanxuan.nosdn.127.net/72a8bb704e9485c512fdc4831207eec0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('169', '1046044', '', '5', 'http://yanxuan.nosdn.127.net/20289753360694c2787b3d65ce9377ac.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('170', '1046044', '', '5', 'http://yanxuan.nosdn.127.net/17b3b43e437cfe1c764710ff5d1834a5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('171', '1046044', '', '5', 'http://yanxuan.nosdn.127.net/1133086c5ee5994545ff68587ded4cb5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('172', '1046044', '', '5', 'http://yanxuan.nosdn.127.net/72177689d24d3684d341bb38b94468fa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('173', '1048005', '', '5', 'http://yanxuan.nosdn.127.net/112dfb2b0d975c8d525230e91d0b8add.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('174', '1048005', '', '5', 'http://yanxuan.nosdn.127.net/7fe261a864417c0b78bca12b207678b5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('175', '1048005', '', '5', 'http://yanxuan.nosdn.127.net/d3491f2073d31d68af1dd5e050e54efb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('176', '1048005', '', '5', 'http://yanxuan.nosdn.127.net/63721e6063a5ba7e218441efd011066e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('177', '1055012', '', '5', 'http://yanxuan.nosdn.127.net/55d2d990f71f618146238f5bbf36d650.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('178', '1055012', '', '5', 'http://yanxuan.nosdn.127.net/4663facadd6c50f7ff11cd92b3cd8e7a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('179', '1055012', '', '5', 'http://yanxuan.nosdn.127.net/1c8123fb59473106eb829b6001c59701.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('180', '1055012', '', '5', 'http://yanxuan.nosdn.127.net/0eeb46f412322fe591fcf134b877c74f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('181', '1055016', '', '5', 'http://yanxuan.nosdn.127.net/16fe67152585f306df7de145af71315d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('182', '1055016', '', '5', 'http://yanxuan.nosdn.127.net/1ade16619d245b1edcd2179321e6387b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('183', '1055016', '', '5', 'http://yanxuan.nosdn.127.net/688a1f344a0d898d4ef9c834f236addc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('184', '1055016', '', '5', 'http://yanxuan.nosdn.127.net/7d8801b01b1c53cbdfc07678099ebe80.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('185', '1057036', '', '5', 'http://yanxuan.nosdn.127.net/bec107bf0cc86dcf90fa084584d68c76.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('186', '1057036', '', '5', 'http://yanxuan.nosdn.127.net/d5da1d907ce3e5dcc8cf72e925d9494b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('187', '1057036', '', '5', 'http://yanxuan.nosdn.127.net/2f82661892afb0fd5efa8ff343f9941e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('188', '1057036', '', '5', 'http://yanxuan.nosdn.127.net/fd1d9edc261fb68844c0fb65f0c1a4a4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('189', '1064000', '', '5', 'http://yanxuan.nosdn.127.net/d37918aa7193ac6b593f312b521468f0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('190', '1064000', '', '5', 'http://yanxuan.nosdn.127.net/31b03320d8a2d98ba118af4bb9d95c27.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('191', '1064000', '', '5', 'http://yanxuan.nosdn.127.net/cdf49298d942c0326b544bb4cbe68fef.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('192', '1064000', '', '5', 'http://yanxuan.nosdn.127.net/4a33476bcd469d4e94d2d400c738de04.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('193', '1064002', '', '5', 'http://yanxuan.nosdn.127.net/874a3f226d63546ca28f774cd9242251.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('194', '1064002', '', '5', 'http://yanxuan.nosdn.127.net/5e728b405af9d32114162800ffa67d8b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('195', '1064002', '', '5', 'http://yanxuan.nosdn.127.net/eb83d490f564fd34b18b65583d0658d1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('196', '1064002', '', '5', 'http://yanxuan.nosdn.127.net/af4347f2c2333dfbf654d6b5e549f9e8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('197', '1064003', '', '5', 'http://yanxuan.nosdn.127.net/b2de2ebcee090213861612909374f9f8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('198', '1064003', '', '5', 'http://yanxuan.nosdn.127.net/3b905dd63fc81b0359a2716fe2a48b65.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('199', '1064003', '', '5', 'http://yanxuan.nosdn.127.net/dbb11f9a0277b957ee7fa1c82f77d0bd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('200', '1064003', '', '5', 'http://yanxuan.nosdn.127.net/9e2f6edb8edfedb03a2e3e6cdfe37b51.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('201', '1064004', '', '5', 'http://yanxuan.nosdn.127.net/0ce6d033a3550d293737007a088026e1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('202', '1064004', '', '5', 'http://yanxuan.nosdn.127.net/510b4711672df2d9b2d83e1505cdc4a3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('203', '1064004', '', '5', 'http://yanxuan.nosdn.127.net/d7e4f07329f9ff163ae0e37512ff56d3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('204', '1064004', '', '5', 'http://yanxuan.nosdn.127.net/b5cfb249243d2e0d7704c4b84d71e4c1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('205', '1064006', '', '5', 'http://yanxuan.nosdn.127.net/d129f712c8aac8835695f61980c621c0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('206', '1064006', '', '5', 'http://yanxuan.nosdn.127.net/b4b6641252b78dbcf1572a8995f9666d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('207', '1064006', '', '5', 'http://yanxuan.nosdn.127.net/11d466acd868271a6b6c04aa80013232.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('208', '1064006', '', '5', 'http://yanxuan.nosdn.127.net/a40d02a081b575d8d01808aab3eb2720.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('209', '1064007', '', '5', 'http://yanxuan.nosdn.127.net/08d319bdd8632420431ff35f23b3578c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('210', '1064007', '', '5', 'http://yanxuan.nosdn.127.net/67dd8f238eb459a745094c2d6cba0499.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('211', '1064007', '', '5', 'http://yanxuan.nosdn.127.net/b4622b31990831f1bfc9116ced8f4e5c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('212', '1064007', '', '5', 'http://yanxuan.nosdn.127.net/9931432a7e088a9cd9e62839f4a8c3cd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('213', '1064021', '', '5', 'http://yanxuan.nosdn.127.net/fbe15281f89334032ab69e4e6751da64.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('214', '1064021', '', '5', 'http://yanxuan.nosdn.127.net/997b3ceebb607dde42a17e320a830495.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('215', '1064021', '', '5', 'http://yanxuan.nosdn.127.net/4b8d97703408cac441e0e0f47f8494da.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('216', '1064021', '', '5', 'http://yanxuan.nosdn.127.net/b827d1d35e69f6e96e8b99889d322f57.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('217', '1064022', '', '5', 'http://yanxuan.nosdn.127.net/42b2a421dd83bcf26162b044ff363769.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('218', '1064022', '', '5', 'http://yanxuan.nosdn.127.net/0e38e0c1b48d36865d8303988631cb9c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('219', '1064022', '', '5', 'http://yanxuan.nosdn.127.net/4ddffcd3a434d9a11c6499dd88f7587e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('220', '1064022', '', '5', 'http://yanxuan.nosdn.127.net/d9ec4d2b23122e2c234bfec9a864cb67.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('221', '1065004', '', '5', 'http://yanxuan.nosdn.127.net/3ca2cf7fcfb2bf2b9eba22157a636344.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('222', '1065004', '', '5', 'http://yanxuan.nosdn.127.net/95d190d1f69187f02385ebc493342cb8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('223', '1065004', '', '5', 'http://yanxuan.nosdn.127.net/954b84c81b137c4cf15c93d21d4e4945.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('224', '1065004', '', '5', 'http://yanxuan.nosdn.127.net/38d3e733df9a3c7dc2b47f4895fe36cb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('225', '1065005', '', '5', 'http://yanxuan.nosdn.127.net/6908648f0e5168369d13e8f376b7ed22.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('226', '1065005', '', '5', 'http://yanxuan.nosdn.127.net/7bf78e4b6bfad80b2d64b7f43e952962.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('227', '1065005', '', '5', 'http://yanxuan.nosdn.127.net/35777d14d555a8f502587e8d8ed8330e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('228', '1065005', '', '5', 'http://yanxuan.nosdn.127.net/8cf033728913902f68f0b081ab118b5f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('229', '1068010', '', '5', 'http://yanxuan.nosdn.127.net/84d68d030d379712544c1df2fe5dd75a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('230', '1068010', '', '5', 'http://yanxuan.nosdn.127.net/977d1c16a4902d50712a00a0b2415d55.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('231', '1068010', '', '5', 'http://yanxuan.nosdn.127.net/4794dea6cd4bf39626b00335c00b2257.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('232', '1068010', '', '5', 'http://yanxuan.nosdn.127.net/8e3c52a8645ab6c83ceff377f33a5500.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('233', '1068011', '', '5', 'http://yanxuan.nosdn.127.net/ccd6d04356b4b8fa00659b7c287a742f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('234', '1068011', '', '5', 'http://yanxuan.nosdn.127.net/a3fddd5ba2d029c8adc22f4346d15be2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('235', '1068011', '', '5', 'http://yanxuan.nosdn.127.net/afe43ecb0839d0f1d91551a357db65a9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('236', '1068011', '', '5', 'http://yanxuan.nosdn.127.net/85dcb0a492eefb8a64c963400fac48a8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('237', '1068012', '', '5', 'http://yanxuan.nosdn.127.net/b99da1e1f21b0fe977c170ab9c06d43b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('238', '1068012', '', '5', 'http://yanxuan.nosdn.127.net/bbad82d64b6e7a02d0b1d98189ed4fa2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('239', '1068012', '', '5', 'http://yanxuan.nosdn.127.net/e50f8e392c50d9c0538ccfd452849e6a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('240', '1068012', '', '5', 'http://yanxuan.nosdn.127.net/98d6ac6863c11e016ab620dc5d79c13c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('241', '1071004', '', '5', 'http://yanxuan.nosdn.127.net/38bc080faa7fc71f0659d8f01c2732cb.png');
INSERT INTO `mall_goods_gallery` VALUES ('242', '1071004', '', '5', 'http://yanxuan.nosdn.127.net/2fb5b6d817c8abe928499b38e85f9175.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('243', '1071004', '', '5', 'http://yanxuan.nosdn.127.net/a7b14f413a7880aeab33d54273b75a61.png');
INSERT INTO `mall_goods_gallery` VALUES ('244', '1071004', '', '5', 'http://yanxuan.nosdn.127.net/86a75ab34cdc6dba5f86917dbfc5c573.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('245', '1071005', '', '5', 'http://yanxuan.nosdn.127.net/821f3e9e08116060fef28f24f787d05c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('246', '1071005', '', '5', 'http://yanxuan.nosdn.127.net/508d8f7768e53fd2e8666a10882ae09a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('247', '1071005', '', '5', 'http://yanxuan.nosdn.127.net/1df6745760f5c35089e542835e6e0c9f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('248', '1071005', '', '5', 'http://yanxuan.nosdn.127.net/100d0c180c2569cb2e4b221620a9d7ca.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('249', '1071006', '', '5', 'http://yanxuan.nosdn.127.net/1abb129cd7cab1f6469adf6bcde59a3d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('250', '1071006', '', '5', 'http://yanxuan.nosdn.127.net/1b5b295e3dfc745c0759e0ebbf683bdf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('251', '1071006', '', '5', 'http://yanxuan.nosdn.127.net/07b8e6b55ebcbb5554c99f8d4a43d9aa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('252', '1071006', '', '5', 'http://yanxuan.nosdn.127.net/07fb9bad42bc23e248039fdd61abfb31.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('253', '1072000', '', '5', 'http://yanxuan.nosdn.127.net/7814d8085b2258f916a3697bca6aea83.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('254', '1072000', '', '5', 'http://yanxuan.nosdn.127.net/cef89da34299cd7cebd7a73f0ae3c04a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('255', '1072000', '', '5', 'http://yanxuan.nosdn.127.net/e4649c66dd5541878d4ff55eb3991bcd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('256', '1072000', '', '5', 'http://yanxuan.nosdn.127.net/0e36b9e351760706e6c15d8e82d671bb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('257', '1072001', '', '5', 'http://yanxuan.nosdn.127.net/cfde5301ba393421dc2e3ae718f1e1df.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('258', '1072001', '', '5', 'http://yanxuan.nosdn.127.net/09fb1d7566f5eaf4a1888e986e22d680.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('259', '1072001', '', '5', 'http://yanxuan.nosdn.127.net/f9cefc0ae2125053eda113e9ffc46625.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('260', '1072001', '', '5', 'http://yanxuan.nosdn.127.net/a06657b204eeec45cc40137711c8ab87.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('261', '1075023', '', '5', 'http://yanxuan.nosdn.127.net/db89f8742e3bda3bae05ea56c2d4d6b3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('262', '1075023', '', '5', 'http://yanxuan.nosdn.127.net/4943dc2f6192742f25b3d53a4dab9dcf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('263', '1075023', '', '5', 'http://yanxuan.nosdn.127.net/ad02e74a05f02d1d347a34612f673783.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('264', '1075023', '', '5', 'http://yanxuan.nosdn.127.net/cf2b3277065fd8cf027fad31cc1c2290.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('265', '1075024', '', '5', 'http://yanxuan.nosdn.127.net/20b8099e0b733dd772eddc867286e4ef.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('266', '1075024', '', '5', 'http://yanxuan.nosdn.127.net/24d57fc1aaee7ef34d5ad742dbe71c75.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('267', '1075024', '', '5', 'http://yanxuan.nosdn.127.net/2e9cf29302ae0d14eb86765d4f04b280.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('268', '1075024', '', '5', 'http://yanxuan.nosdn.127.net/32fe42db040cebe98cdac1cb03fcbe10.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('269', '1081000', '', '5', 'http://yanxuan.nosdn.127.net/a4fda9721fda4cb644f7eaf8e07a26f0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('270', '1081000', '', '5', 'http://yanxuan.nosdn.127.net/086010dccc921d77f21c67d15b3f4233.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('271', '1081000', '', '5', 'http://yanxuan.nosdn.127.net/f652505736cd034a74c2dc89637dcd4e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('272', '1081000', '', '5', 'http://yanxuan.nosdn.127.net/bb03b98fb84fa9cdbc3ea4616c7db915.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('273', '1081002', '', '5', 'http://yanxuan.nosdn.127.net/73c8f8fdbbbafc138ed2c19f7a7e518f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('274', '1081002', '', '5', 'http://yanxuan.nosdn.127.net/ab092f06061931198edcf473286efd0e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('275', '1081002', '', '5', 'http://yanxuan.nosdn.127.net/4881e1b07627266a2c67d2f26db1cbfe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('276', '1081002', '', '5', 'http://yanxuan.nosdn.127.net/d08aa4841b37ef3f78ef6c27e093857a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('277', '1083009', '', '5', 'http://yanxuan.nosdn.127.net/157be86783a0cab72ac5bd73d9de79aa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('278', '1083009', '', '5', 'http://yanxuan.nosdn.127.net/238d39c9f49c2ab186be2cdbe21ebad4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('279', '1083009', '', '5', 'http://yanxuan.nosdn.127.net/d361a0c72f4c3d8b61d1502d47878d97.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('280', '1083009', '', '5', 'http://yanxuan.nosdn.127.net/7f1ab428fbea15ea9c02af2b44b452e1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('281', '1083010', '', '5', 'http://yanxuan.nosdn.127.net/d22c4d48a852444f82f411ab8527e197.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('282', '1083010', '', '5', 'http://yanxuan.nosdn.127.net/31627021573831753fd8635a73b2186c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('283', '1083010', '', '5', 'http://yanxuan.nosdn.127.net/172d2bfb2ad0dccd79c2e3cd64557cac.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('284', '1083010', '', '5', 'http://yanxuan.nosdn.127.net/16e3828d30c2fcde21c503849cd4fb27.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('285', '1084001', '', '5', 'http://yanxuan.nosdn.127.net/8e316090dd262ca0a4fe8f37bdc1f1aa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('286', '1084001', '', '5', 'http://yanxuan.nosdn.127.net/3eb572eef0f47c125cbe99514e021d8f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('287', '1084001', '', '5', 'http://yanxuan.nosdn.127.net/cf87ca367a793e250f27a831da7e142e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('288', '1084001', '', '5', 'http://yanxuan.nosdn.127.net/0e6431e884c7afbe4c648f0317a368eb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('289', '1084003', '', '5', 'http://yanxuan.nosdn.127.net/400d5759394edc78db8006bbd459e911.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('290', '1084003', '', '5', 'http://yanxuan.nosdn.127.net/f63ac83618c3bfb00b6d27336be0485c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('291', '1084003', '', '5', 'http://yanxuan.nosdn.127.net/f5566e6a2b7e3e90472beda8e057d78a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('292', '1084003', '', '5', 'http://yanxuan.nosdn.127.net/74817e867e569dbd06133b3eead467b4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('293', '1086015', '', '5', 'http://yanxuan.nosdn.127.net/9331158a10c79a0663e53865cd1689ec.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('294', '1086015', '', '5', 'http://yanxuan.nosdn.127.net/b4706343b3817e690d778e5f8a68a8de.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('295', '1086015', '', '5', 'http://yanxuan.nosdn.127.net/7a8499c2ded7790addffb9d87fc4532b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('296', '1086015', '', '5', 'http://yanxuan.nosdn.127.net/2831d02bb34fabbcaf602fdf7a9cc409.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('297', '1086023', '', '5', 'http://yanxuan.nosdn.127.net/5a16ce8c351ee6d0dc8f27bed1e29e15.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('298', '1086023', '', '5', 'http://yanxuan.nosdn.127.net/eddb587eb4b502e4abb186eac0a819bb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('299', '1086023', '', '5', 'http://yanxuan.nosdn.127.net/28844a40fc7a7ad714c796769fa54df2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('300', '1086023', '', '5', 'http://yanxuan.nosdn.127.net/f6185198a77cd6c98758b4757f17c703.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('301', '1086024', '', '5', 'http://yanxuan.nosdn.127.net/431b952038783b216b8a75e132025ea2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('302', '1086024', '', '5', 'http://yanxuan.nosdn.127.net/32704d4062a4a1224ce18721519d640e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('303', '1086024', '', '5', 'http://yanxuan.nosdn.127.net/ecc74550afbf00a3d73f4b7109304f44.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('304', '1086024', '', '5', 'http://yanxuan.nosdn.127.net/9b01c6a0aa47de63a25558a0c26f8ff2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('305', '1086025', '', '5', 'http://yanxuan.nosdn.127.net/7073844c6513a8b11a6777fdcc09d1a6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('306', '1086025', '', '5', 'http://yanxuan.nosdn.127.net/a5381526f8578910804a5745e7e1f23a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('307', '1086025', '', '5', 'http://yanxuan.nosdn.127.net/910fe6194082bcf813fa6442261398b7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('308', '1086025', '', '5', 'http://yanxuan.nosdn.127.net/ff22d298cf6835407913f257f39bf1d5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('309', '1086026', '', '5', 'http://yanxuan.nosdn.127.net/75b103689a95765ada0639fc5b4dee12.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('310', '1086026', '', '5', 'http://yanxuan.nosdn.127.net/f254d7b695ac6cb9a8b4593174a5e0b0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('311', '1086026', '', '5', 'http://yanxuan.nosdn.127.net/9cf92ae9057a03482b27437578c484c5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('312', '1086026', '', '5', 'http://yanxuan.nosdn.127.net/77771fc2202855c26bf58788837e8097.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('313', '1090004', '', '5', 'http://yanxuan.nosdn.127.net/fd485228946efc3d3b54f4bf6bf9dd9e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('314', '1090004', '', '5', 'http://yanxuan.nosdn.127.net/184ec60b12c918282cfc9c8b3d6fdff4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('315', '1090004', '', '5', 'http://yanxuan.nosdn.127.net/63952024af0379a53ae88513b87a6a47.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('316', '1090004', '', '5', 'http://yanxuan.nosdn.127.net/1180f6fd43359f216c9b9af6339f17f2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('317', '1092024', '', '5', 'http://yanxuan.nosdn.127.net/9c42a6bac4380d79d4dccb68ac2b4bcc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('318', '1092024', '', '5', 'http://yanxuan.nosdn.127.net/18f86419d1f26597087a999b3e539b50.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('319', '1092024', '', '5', 'http://yanxuan.nosdn.127.net/2cca81110d5a9ae4a012ab69b86a2246.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('320', '1092024', '', '5', 'http://yanxuan.nosdn.127.net/c00fcd20e4147e3f5b32db47161eae81.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('321', '1092038', '', '5', 'http://yanxuan.nosdn.127.net/c66754d7643f2a2436aee1195ad01251.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('322', '1092038', '', '5', 'http://yanxuan.nosdn.127.net/80fbb65d15520920326e9fcd881c9725.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('323', '1092038', '', '5', 'http://yanxuan.nosdn.127.net/ff2ee56c1ebdb228591950364f209fb1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('324', '1092038', '', '5', 'http://yanxuan.nosdn.127.net/da541d4964c64a4065ce16f08da162c1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('325', '1092039', '', '5', 'http://yanxuan.nosdn.127.net/b50a9a25a4bce5e5ed533dfbb79a2291.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('326', '1092039', '', '5', 'http://yanxuan.nosdn.127.net/cfb74ab8c094ef7d6ea81691ccbcd72b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('327', '1092039', '', '5', 'http://yanxuan.nosdn.127.net/d55ec11fb9f3fd8d7427de1e4e597cbe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('328', '1092039', '', '5', 'http://yanxuan.nosdn.127.net/9e1821d07934c717c3ff8a031e57ee48.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('329', '1093000', '', '5', 'http://yanxuan.nosdn.127.net/e5143014acaf1831007c3a90eb4f2ed8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('330', '1093000', '', '5', 'http://yanxuan.nosdn.127.net/70dffe9b1f565e57866c8d2cbaaf35fc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('331', '1093000', '', '5', 'http://yanxuan.nosdn.127.net/8d411259e7af9b37f859858b5cd9027a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('332', '1093000', '', '5', 'http://yanxuan.nosdn.127.net/5d467a34e978f99ad5a36b5cff7de7d9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('333', '1093001', '', '5', 'http://yanxuan.nosdn.127.net/1bfba99384357392f90cd06a63d1f152.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('334', '1093001', '', '5', 'http://yanxuan.nosdn.127.net/9d9b14c89edd8ebfeb886b7aed80e79c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('335', '1093001', '', '5', 'http://yanxuan.nosdn.127.net/3aff9a88b67003e08ebe2f75c3e71aed.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('336', '1093001', '', '5', 'http://yanxuan.nosdn.127.net/eee4ccfba75b991d6fc4b3a25ee253bd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('337', '1093002', '', '5', 'http://yanxuan.nosdn.127.net/327762ee4559fb78ca99bdfec4ba2941.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('338', '1093002', '', '5', 'http://yanxuan.nosdn.127.net/63014fa05d18b3b8d312c37646ac78c5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('339', '1093002', '', '5', 'http://yanxuan.nosdn.127.net/0c6554fa7977ab5afb9405053f04885c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('340', '1093002', '', '5', 'http://yanxuan.nosdn.127.net/7c9340a889501907e5315a572eb0bc9f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('341', '1097004', '', '5', 'http://yanxuan.nosdn.127.net/dea90e7c308bb1bd9e926cfbe493f243.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('342', '1097004', '', '5', 'http://yanxuan.nosdn.127.net/308fab883bb2a72adac0e724a3d9aabd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('343', '1097004', '', '5', 'http://yanxuan.nosdn.127.net/3d13ba389f3be260c930f582545b9d5d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('344', '1097004', '', '5', 'http://yanxuan.nosdn.127.net/524175ab6d501444ac03cb0c89963ca0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('345', '1097005', '', '5', 'http://yanxuan.nosdn.127.net/3dcd74c8999973a1acc95adbb36e03c6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('346', '1097005', '', '5', 'http://yanxuan.nosdn.127.net/80dda4e65f1d9773261133dcf039f7af.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('347', '1097005', '', '5', 'http://yanxuan.nosdn.127.net/99e6011cd4a60538e195f006c5aaa149.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('348', '1097005', '', '5', 'http://yanxuan.nosdn.127.net/0162fbe591f22997baf27237b9d3f2c5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('349', '1097006', '', '5', 'http://yanxuan.nosdn.127.net/ad2a04fdb774ab47d0b5b3dee963d723.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('350', '1097006', '', '5', 'http://yanxuan.nosdn.127.net/babab8572b7c88ad774ab70bfad4a84a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('351', '1097006', '', '5', 'http://yanxuan.nosdn.127.net/6528419efacdae10bc9e44a7c73c6489.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('352', '1097006', '', '5', 'http://yanxuan.nosdn.127.net/38978a1165dde6b85d5b989103a95b26.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('353', '1097007', '', '5', 'http://yanxuan.nosdn.127.net/92bd1250c8a3754514d7d2413b140e6f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('354', '1097007', '', '5', 'http://yanxuan.nosdn.127.net/a38077a8b7f2f973e0690f4a64a84dea.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('355', '1097007', '', '5', 'http://yanxuan.nosdn.127.net/260dad27e017fb2d99fc41466ed43079.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('356', '1097007', '', '5', 'http://yanxuan.nosdn.127.net/c1b74831df9bf78eb866fc69669dcf80.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('357', '1097009', '', '5', 'http://yanxuan.nosdn.127.net/afde10721fa5d6004f98a1e3a4f91db8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('358', '1097009', '', '5', 'http://yanxuan.nosdn.127.net/f10669167b6ab602064045e0c4134afd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('359', '1097009', '', '5', 'http://yanxuan.nosdn.127.net/5e0ab33f6849c890fcce2c3e61fa3fc2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('360', '1097009', '', '5', 'http://yanxuan.nosdn.127.net/a514463e8908df89cb25719ad7eaa077.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('361', '1097011', '', '5', 'http://yanxuan.nosdn.127.net/181897e9942cb5331442e5f6b9dee863.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('362', '1097011', '', '5', 'http://yanxuan.nosdn.127.net/303deaccd2b467ab0ac796348da2f6c2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('363', '1097011', '', '5', 'http://yanxuan.nosdn.127.net/86bf916dd76e5a855fbc8aa49d4557b2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('364', '1097011', '', '5', 'http://yanxuan.nosdn.127.net/1a734852ebcca0a0a328f82b15be2cd8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('365', '1097012', '', '5', 'http://yanxuan.nosdn.127.net/01b5b444615b342c554d22c58d044e35.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('366', '1097012', '', '5', 'http://yanxuan.nosdn.127.net/90eb435f5c0e4f98977a4c1fea3bd537.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('367', '1097012', '', '5', 'http://yanxuan.nosdn.127.net/8d9922c1f2a3cea91f0b5e808ca9245d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('368', '1097012', '', '5', 'http://yanxuan.nosdn.127.net/89ee10d06789cda29a697446c014ef70.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('369', '1097013', '', '5', 'http://yanxuan.nosdn.127.net/397dfb128336c9054753179a04bcfb9d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('370', '1097013', '', '5', 'http://yanxuan.nosdn.127.net/a668ea514089b6825743444132e7c0ab.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('371', '1097013', '', '5', 'http://yanxuan.nosdn.127.net/cdcce8f4a28fdb66f131f960055fffa4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('372', '1097013', '', '5', 'http://yanxuan.nosdn.127.net/cf35bdb41354da6243f08d0e886eb796.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('373', '1097014', '', '5', 'http://yanxuan.nosdn.127.net/756b9ad8168b6f05faed90f010cddc13.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('374', '1097014', '', '5', 'http://yanxuan.nosdn.127.net/3b963f2d5ad9ccbf17753ccadd1d46b7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('375', '1097014', '', '5', 'http://yanxuan.nosdn.127.net/efd1ccfdd46a2f40f9e825a6d4348252.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('376', '1097014', '', '5', 'http://yanxuan.nosdn.127.net/7fa5dc7c08d7a1b6da3f17029a93b93d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('377', '1097016', '', '5', 'http://yanxuan.nosdn.127.net/3f8eaea08de42601c4fbbbf44f57a51f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('378', '1097016', '', '5', 'http://yanxuan.nosdn.127.net/ba098f23eb7e21ecf524b7f8833d117f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('379', '1097016', '', '5', 'http://yanxuan.nosdn.127.net/c569bc70282462cae8cf948612429b33.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('380', '1097016', '', '5', 'http://yanxuan.nosdn.127.net/a5a3e4c0825751977900838aba75df90.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('381', '1097017', '', '5', 'http://yanxuan.nosdn.127.net/4973ea5a10f2c52ca2e2d416f1e7898d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('382', '1097017', '', '5', 'http://yanxuan.nosdn.127.net/56993e4764ce4cdb6469bd4d963929aa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('383', '1097017', '', '5', 'http://yanxuan.nosdn.127.net/22807c5a25e0d8d49fd46da143c1b23f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('384', '1097017', '', '5', 'http://yanxuan.nosdn.127.net/2b1b8ce51e1f41d073a5ef980ef5887c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('385', '1100000', '', '5', 'http://yanxuan.nosdn.127.net/66bd23f2d520195c487cf6afbe1e1f82.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('386', '1100000', '', '5', 'http://yanxuan.nosdn.127.net/1ee354a7e3cf58a6317fced4107cd6a1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('387', '1100000', '', '5', 'http://yanxuan.nosdn.127.net/7419b0bf5554c3f17fe5d999d779555e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('388', '1100000', '', '5', 'http://yanxuan.nosdn.127.net/d8f74a7c9836024618a322b1da9f410f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('389', '1100001', '', '5', 'http://yanxuan.nosdn.127.net/22948407b79bf9cf67c39f111fb9024b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('390', '1100001', '', '5', 'http://yanxuan.nosdn.127.net/14d9efa1bfbe9d0747e950bb74fa07e7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('391', '1100001', '', '5', 'http://yanxuan.nosdn.127.net/46bf309e5ebc33f38d19957f9f2664f3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('392', '1100001', '', '5', 'http://yanxuan.nosdn.127.net/de5093b5353259604b68418fe58c6cea.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('393', '1100002', '', '5', 'http://yanxuan.nosdn.127.net/b2f5fd5577d07a69e4f4f8919132901d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('394', '1100002', '', '5', 'http://yanxuan.nosdn.127.net/fb7b80643e0bc30a78688a964c3aee57.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('395', '1100002', '', '5', 'http://yanxuan.nosdn.127.net/393e848f1da052784efe77f565b86dbb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('396', '1100002', '', '5', 'http://yanxuan.nosdn.127.net/8f4ed88b7550586de659a767bb409799.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('397', '1108029', '', '5', 'http://yanxuan.nosdn.127.net/0c8df971748c9e84759dbacaf8b6d1b9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('398', '1108029', '', '5', 'http://yanxuan.nosdn.127.net/870481d2629256214d404cb42af00cbc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('399', '1108029', '', '5', 'http://yanxuan.nosdn.127.net/43f94a4f78c77078194f882534c73dd1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('400', '1108029', '', '5', 'http://yanxuan.nosdn.127.net/b8f00bf92940a0f65d251df91afb586b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('401', '1108030', '', '5', 'http://yanxuan.nosdn.127.net/139b7be83a064eaa5f99feeea44729fd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('402', '1108030', '', '5', 'http://yanxuan.nosdn.127.net/ad6757535783bbbba22325943caad862.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('403', '1108030', '', '5', 'http://yanxuan.nosdn.127.net/3528b0ec40265759371405415b74c734.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('404', '1108030', '', '5', 'http://yanxuan.nosdn.127.net/61d995604039df8026fee4b3c15e8692.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('405', '1108031', '', '5', 'http://yanxuan.nosdn.127.net/f2c5d5f0e1628cd1e834b7b0221cf513.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('406', '1108031', '', '5', 'http://yanxuan.nosdn.127.net/49c00c7cffcbc5fc6438bdac50f772e0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('407', '1108031', '', '5', 'http://yanxuan.nosdn.127.net/7ae6591eca8cedeb94270d0c73eaebd7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('408', '1108031', '', '5', 'http://yanxuan.nosdn.127.net/2d0e71288124d5ca4ba44f826b53c78b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('409', '1108032', '', '5', 'http://yanxuan.nosdn.127.net/971ba39166439705d7a254d5d736a753.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('410', '1108032', '', '5', 'http://yanxuan.nosdn.127.net/16c11f11c03b0f0e596f6c9cd85170bc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('411', '1108032', '', '5', 'http://yanxuan.nosdn.127.net/31469f008127ea2f1c7ffed1755fff42.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('412', '1108032', '', '5', 'http://yanxuan.nosdn.127.net/31376f28a3d00cfe767713b93d3a84be.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('413', '1109004', '', '5', 'http://yanxuan.nosdn.127.net/ed50cbf7fab10b35f676e2451e112130.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('414', '1109004', '', '5', 'http://yanxuan.nosdn.127.net/6e13c6483850a3fb217b888ff22eee6d.png');
INSERT INTO `mall_goods_gallery` VALUES ('415', '1109004', '', '5', 'http://yanxuan.nosdn.127.net/d5d2f5173682bcd9e1d5472b7dcac591.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('416', '1109004', '', '5', 'http://yanxuan.nosdn.127.net/cb465057857eade369ace03ad95d6765.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('417', '1109005', '', '5', 'http://yanxuan.nosdn.127.net/fc5bf833a02a3be40e3e396a1c5a9c13.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('418', '1109005', '', '5', 'http://yanxuan.nosdn.127.net/43870fe7ec3c7186fb093ab50d94fa3a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('419', '1109005', '', '5', 'http://yanxuan.nosdn.127.net/66ac578985180b614c88fda44a2eb26b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('420', '1109005', '', '5', 'http://yanxuan.nosdn.127.net/afcd8c99f588072f1ad755762294dca1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('421', '1109008', '', '5', 'http://yanxuan.nosdn.127.net/52e1a79197af9b1cc73c836f74b190d4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('422', '1109008', '', '5', 'http://yanxuan.nosdn.127.net/4c07ef11f91c4139411f5fff38c78750.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('423', '1109008', '', '5', 'http://yanxuan.nosdn.127.net/6ac6c255e6ad5039e903f3051b56e25e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('424', '1109008', '', '5', 'http://yanxuan.nosdn.127.net/88aef8f37fd7be612875d93a1b3867c4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('425', '1109034', '', '5', 'http://yanxuan.nosdn.127.net/0251bd141f5b55bd4311678750a6b344.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('426', '1109034', '', '5', 'http://yanxuan.nosdn.127.net/59c2d5822cda19f8caa2d9034937f565.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('427', '1109034', '', '5', 'http://yanxuan.nosdn.127.net/3d089c7c2a04ee17767a283a9f115dd0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('428', '1109034', '', '5', 'http://yanxuan.nosdn.127.net/0421111cdef15b0c9777da80eb66f696.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('429', '1110002', '', '5', 'http://yanxuan.nosdn.127.net/375db2797db92b446d45b3003ca84660.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('430', '1110002', '', '5', 'http://yanxuan.nosdn.127.net/9d2c517b9da985b9c997f6d9cb597ac0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('431', '1110002', '', '5', 'http://yanxuan.nosdn.127.net/6eb39c3ee3db8d9a6a2cbf3d2d2f581c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('432', '1110002', '', '5', 'http://yanxuan.nosdn.127.net/5e230a93445d2791719f9421a66113e3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('433', '1110003', '', '5', 'http://yanxuan.nosdn.127.net/0d2a885f2219169d4b3d3181d908b2da.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('434', '1110003', '', '5', 'http://yanxuan.nosdn.127.net/28f7b964e1e1b7987d17d768f4a22d1b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('435', '1110003', '', '5', 'http://yanxuan.nosdn.127.net/e78c22d19f799f135db2e32f7f6ad3a8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('436', '1110003', '', '5', 'http://yanxuan.nosdn.127.net/fc7d7e380bd62bec289526c753196d1d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('437', '1110004', '', '5', 'http://yanxuan.nosdn.127.net/cdae3aeda693e7cc1c4661d4f41da4d7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('438', '1110004', '', '5', 'http://yanxuan.nosdn.127.net/9a75d83304a780d04ada95c2c0a952ca.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('439', '1110004', '', '5', 'http://yanxuan.nosdn.127.net/ed832cdde16e90331f2a304c6ee43da4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('440', '1110004', '', '5', 'http://yanxuan.nosdn.127.net/11741a9c889d09114fea3ee39031f6c3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('441', '1110007', '', '5', 'http://yanxuan.nosdn.127.net/02dc9714d67ac3aca20740e19b9a724a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('442', '1110007', '', '5', 'http://yanxuan.nosdn.127.net/38aaf23e7a2739e45dcdd5c50c6baa7e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('443', '1110007', '', '5', 'http://yanxuan.nosdn.127.net/0dfe050d6971180cb8cb1ea721b54e1d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('444', '1110007', '', '5', 'http://yanxuan.nosdn.127.net/51edc362a09630fd04030bcc16c2072d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('445', '1110008', '', '5', 'http://yanxuan.nosdn.127.net/4ded1e09f09d9eb1d2f24d87759fb232.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('446', '1110008', '', '5', 'http://yanxuan.nosdn.127.net/ce801d4915ecca7befb5e88159b3dbb3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('447', '1110008', '', '5', 'http://yanxuan.nosdn.127.net/406423eeb3c5c5347462246767ef6bd9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('448', '1110008', '', '5', 'http://yanxuan.nosdn.127.net/4e912ca54b45f3b0cf00b5f6977d1110.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('449', '1110013', '', '5', 'http://yanxuan.nosdn.127.net/26500a7b609debb80a022aa256ee2b36.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('450', '1110013', '', '5', 'http://yanxuan.nosdn.127.net/2672ee0f40415c9b1fea5801f05d6a76.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('451', '1110013', '', '5', 'http://yanxuan.nosdn.127.net/128554ea9fa7e86d19fff59266fe4546.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('452', '1110013', '', '5', 'http://yanxuan.nosdn.127.net/a89db6a94e7a9cd260fa8de0152ff36c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('453', '1110014', '', '5', 'http://yanxuan.nosdn.127.net/ca37e1842a65ac4a062180078505687d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('454', '1110014', '', '5', 'http://yanxuan.nosdn.127.net/962a87f554c0f75d835900726608bb1b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('455', '1110014', '', '5', 'http://yanxuan.nosdn.127.net/d296eb099d54186e4b71f13aa63f71b7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('456', '1110014', '', '5', 'http://yanxuan.nosdn.127.net/4c10c26db96847b86ffe12cb4bd3c47b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('457', '1110015', '', '5', 'http://yanxuan.nosdn.127.net/34d4b8718eec825a7524934f35f6cf5b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('458', '1110015', '', '5', 'http://yanxuan.nosdn.127.net/61bd5e5bff93731eb2996d904ef4cf50.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('459', '1110015', '', '5', 'http://yanxuan.nosdn.127.net/b4a80a423a5b46efe55275518ff25040.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('460', '1110015', '', '5', 'http://yanxuan.nosdn.127.net/bc61a2ec7c87267d4a4055d47b4a9d8c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('461', '1110016', '', '5', 'http://yanxuan.nosdn.127.net/c53c22c14524bfe91c058b2d9f93f9bf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('462', '1110016', '', '5', 'http://yanxuan.nosdn.127.net/9c1ad6c3bf65dd9d71978e99dd9fb21f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('463', '1110016', '', '5', 'http://yanxuan.nosdn.127.net/76485086ff248ead29955f42395f050c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('464', '1110016', '', '5', 'http://yanxuan.nosdn.127.net/4642e54295c5beac2129f351c6dfa79e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('465', '1110017', '', '5', 'http://yanxuan.nosdn.127.net/0f8d2e25768ef00d8ad328fbd92a1d4b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('466', '1110017', '', '5', 'http://yanxuan.nosdn.127.net/9bfd2f6191e26c276fd9d99f8530e150.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('467', '1110017', '', '5', 'http://yanxuan.nosdn.127.net/3558e5371c834f01406dc8bf8d21ea8a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('468', '1110017', '', '5', 'http://yanxuan.nosdn.127.net/5db8e913ce14b68e4edf9bc6097ee7a9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('469', '1110018', '', '5', 'http://yanxuan.nosdn.127.net/ac5f93bd705e97e96d18c44729adf111.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('470', '1110018', '', '5', 'http://yanxuan.nosdn.127.net/863069f626e8093858bd944961672116.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('471', '1110018', '', '5', 'http://yanxuan.nosdn.127.net/3f54aad95403f6763d2971cf64ee0f02.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('472', '1110018', '', '5', 'http://yanxuan.nosdn.127.net/95fd3351c1be18c3b9ed445ef0a38434.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('473', '1110019', '', '5', 'http://yanxuan.nosdn.127.net/af0a2d9555caec30d2af98cdcdeb77e8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('474', '1110019', '', '5', 'http://yanxuan.nosdn.127.net/4189295e3a005a63caddd72504381aa0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('475', '1110019', '', '5', 'http://yanxuan.nosdn.127.net/baf8d25090cebda506f461ae7224378c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('476', '1110019', '', '5', 'http://yanxuan.nosdn.127.net/93c84592192c3b89b7df46b51e7c5ab6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('477', '1115023', '', '5', 'http://yanxuan.nosdn.127.net/fc0291ab325830575c58b281c6e4ee09.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('478', '1115023', '', '5', 'http://yanxuan.nosdn.127.net/d22a24b970152c1aa25386ec8d8b6db3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('479', '1115023', '', '5', 'http://yanxuan.nosdn.127.net/3d3aa5935fa24e083f2deb2697b89e93.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('480', '1115023', '', '5', 'http://yanxuan.nosdn.127.net/ef5ef16cc4ddd39127e4f6d66874544a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('481', '1115028', '', '5', 'http://yanxuan.nosdn.127.net/dcc215390ba15aa8673c5cc4c56b6fae.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('482', '1115028', '', '5', 'http://yanxuan.nosdn.127.net/aa8d17bcd7c0d5fa18b5b862a3484948.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('483', '1115028', '', '5', 'http://yanxuan.nosdn.127.net/c99a4ecf10ca320714b437b40a68c82c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('484', '1115028', '', '5', 'http://yanxuan.nosdn.127.net/a020bf35bfa7c1b6dc75ea790c07b3d0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('485', '1115052', '', '5', 'http://yanxuan.nosdn.127.net/f6ebbc20006a323db3aea566eced761c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('486', '1115052', '', '5', 'http://yanxuan.nosdn.127.net/82f2e4d1e138b3d336570de8f2c5ba1c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('487', '1115052', '', '5', 'http://yanxuan.nosdn.127.net/feff39d9bf8340aa3ecddc8ae23d5167.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('488', '1115052', '', '5', 'http://yanxuan.nosdn.127.net/cc0ccf5d41022439f0d8eb6a4830b094.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('489', '1115053', '', '5', 'http://yanxuan.nosdn.127.net/41287cc5618eb5e2c01db90f569d58b7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('490', '1115053', '', '5', 'http://yanxuan.nosdn.127.net/5518a8efdbad43a695a979dc6669261d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('491', '1115053', '', '5', 'http://yanxuan.nosdn.127.net/f401c84a0b444bd4b3057aff4bf01170.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('492', '1115053', '', '5', 'http://yanxuan.nosdn.127.net/253d95942c92f2ee44fa598a17288d41.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('493', '1116030', '', '5', 'http://yanxuan.nosdn.127.net/30ed774f89cd6f59b4f0ed5d9e6cbc77.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('494', '1116030', '', '5', 'http://yanxuan.nosdn.127.net/f079e52277f71656936a0350451ffad2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('495', '1116030', '', '5', 'http://yanxuan.nosdn.127.net/26c25328c6e044f47534b3e9582d1f2a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('496', '1116030', '', '5', 'http://yanxuan.nosdn.127.net/9dad4607a678e730230b68bf4fbf5255.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('497', '1116031', '', '5', 'http://yanxuan.nosdn.127.net/562ef1acdc8c2a7d5c1fd1de8d778074.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('498', '1116031', '', '5', 'http://yanxuan.nosdn.127.net/2c74a79d58a9f77cc5214bfdc807d4be.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('499', '1116031', '', '5', 'http://yanxuan.nosdn.127.net/46a7feb93c24ce74b6a686053e2ddbc8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('500', '1116031', '', '5', 'http://yanxuan.nosdn.127.net/7b3084f82ec3a4389f5e5db63a82b087.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('501', '1116032', '', '5', 'http://yanxuan.nosdn.127.net/25e3cedac39679c138abbe24826aaa89.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('502', '1116032', '', '5', 'http://yanxuan.nosdn.127.net/d8ec444138673ac90b7932aee798b0ae.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('503', '1116032', '', '5', 'http://yanxuan.nosdn.127.net/e1c3a86d25d7865d8bd25330d55044ac.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('504', '1116032', '', '5', 'http://yanxuan.nosdn.127.net/8ba91bc71a0d9670d2b3436bfc802376.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('505', '1116033', '', '5', 'http://yanxuan.nosdn.127.net/dc4b2d5ddc48557bd9bdce6742b66562.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('506', '1116033', '', '5', 'http://yanxuan.nosdn.127.net/72cb7039372e43b4dbb9394d08374933.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('507', '1116033', '', '5', 'http://yanxuan.nosdn.127.net/c8633b2b24e03bf7d5d43e39d34af757.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('508', '1116033', '', '5', 'http://yanxuan.nosdn.127.net/22c0a95be135ea04bf1133e566906f4e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('509', '1125016', '', '5', 'http://yanxuan.nosdn.127.net/16dd2a12b4ab2651dc7450127eed6d68.png');
INSERT INTO `mall_goods_gallery` VALUES ('510', '1125016', '', '5', 'http://yanxuan.nosdn.127.net/fe0f0fbc76283801b5b565c629f9cf35.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('511', '1125016', '', '5', 'http://yanxuan.nosdn.127.net/1d316791256871884416a4ae770e0a00.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('512', '1125016', '', '5', 'http://yanxuan.nosdn.127.net/6617f833f475070d3302644032c82f03.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('513', '1125017', '', '5', 'http://yanxuan.nosdn.127.net/c8527661e3c87a530e30bd110a14faa9.png');
INSERT INTO `mall_goods_gallery` VALUES ('514', '1125017', '', '5', 'http://yanxuan.nosdn.127.net/fbef44dbf82b0b92c60e71b41c447f72.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('515', '1125017', '', '5', 'http://yanxuan.nosdn.127.net/0890a572df4316f7020c84535b696bfe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('516', '1125017', '', '5', 'http://yanxuan.nosdn.127.net/cb3615bf2bcbc52b1f2ef1c64e2b3cac.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('517', '1127003', '', '5', 'http://yanxuan.nosdn.127.net/6bd1ea1d237244d05e8fafea82f90c5b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('518', '1127003', '', '5', 'http://yanxuan.nosdn.127.net/15efb5c5c2510fe797551abaded09ae0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('519', '1127003', '', '5', 'http://yanxuan.nosdn.127.net/71c211ce909a414279004c244997f6e9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('520', '1127003', '', '5', 'http://yanxuan.nosdn.127.net/677f5d85fdd17be748446cb082def361.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('521', '1127038', '', '5', 'http://yanxuan.nosdn.127.net/ea16e3e56b5e59b1e9ed06794d1b2c40.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('522', '1127038', '', '5', 'http://yanxuan.nosdn.127.net/41bd77e384f61ebc93d8233709ba13f1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('523', '1127038', '', '5', 'http://yanxuan.nosdn.127.net/baf5b87ba6a481defecdc5742c9ca515.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('524', '1127038', '', '5', 'http://yanxuan.nosdn.127.net/e5a5058060355b4e4c2f653ab7fbadb7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('525', '1127039', '', '5', 'http://yanxuan.nosdn.127.net/5da516d917bf7a02251ff40bd9a153c7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('526', '1127039', '', '5', 'http://yanxuan.nosdn.127.net/13c0996e62c82f00b0ba010d49447747.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('527', '1127039', '', '5', 'http://yanxuan.nosdn.127.net/bd0c6fff729b4d4fa859441262d88c4c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('528', '1127039', '', '5', 'http://yanxuan.nosdn.127.net/0e8093d4a27ee7a1d0c81e3a82a49c27.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('529', '1127052', '', '5', 'http://yanxuan.nosdn.127.net/be1c0672aa4f82de4179ff25c9728359.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('530', '1127052', '', '5', 'http://yanxuan.nosdn.127.net/a0451cd98141887b78a48414d82f1a9a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('531', '1127052', '', '5', 'http://yanxuan.nosdn.127.net/9cdc625066ff4124e5b3dc2518529706.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('532', '1127052', '', '5', 'http://yanxuan.nosdn.127.net/398686c2483deb75ca4afeee62250fc9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('533', '1128002', '', '5', 'http://yanxuan.nosdn.127.net/15a42a487b167c83a3e4f2ea099088c5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('534', '1128002', '', '5', 'http://yanxuan.nosdn.127.net/2996456487cd6e916319ad80e41c935f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('535', '1128002', '', '5', 'http://yanxuan.nosdn.127.net/fb6d907e5fa419c6b3706ed07d7343c9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('536', '1128002', '', '5', 'http://yanxuan.nosdn.127.net/a4a58f132454ba2e4bd657458c10d89b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('537', '1130037', '', '5', 'http://yanxuan.nosdn.127.net/b0ba668ae100729eb7e64926d7770780.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('538', '1130037', '', '5', 'http://yanxuan.nosdn.127.net/b4f245f54e4e98f064e7fefac6a16642.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('539', '1130037', '', '5', 'http://yanxuan.nosdn.127.net/f8cb009f605f1d0425627452ec8c1fd8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('540', '1130037', '', '5', 'http://yanxuan.nosdn.127.net/de3bf0eef433d216b782b9cb0830e66e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('541', '1130038', '', '5', 'http://yanxuan.nosdn.127.net/39de8ddff1b400d9a97f1e5f9e9dbfeb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('542', '1130038', '', '5', 'http://yanxuan.nosdn.127.net/3e26ee5ec4d49970a0325ca7cc2cea15.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('543', '1130038', '', '5', 'http://yanxuan.nosdn.127.net/993bb3da9f03945eaef6e6199efc86c9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('544', '1130038', '', '5', 'http://yanxuan.nosdn.127.net/d39ad81f2e6babc693edaf08817bd308.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('545', '1130039', '', '5', 'http://yanxuan.nosdn.127.net/19b1375334f2e19130a3ba0e993d7e91.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('546', '1130039', '', '5', 'http://yanxuan.nosdn.127.net/aba31dea912ac4fa9526ddf6a014876e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('547', '1130039', '', '5', 'http://yanxuan.nosdn.127.net/7046f8b5eb83dea640eea187c6a43b11.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('548', '1130039', '', '5', 'http://yanxuan.nosdn.127.net/a3d635f82a5bae0c4fa29a49367f3451.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('549', '1130041', '', '5', 'http://yanxuan.nosdn.127.net/173d269f6c7b875bc433640a7cf12be4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('550', '1130041', '', '5', 'http://yanxuan.nosdn.127.net/ccec1687cfa1a47c26d5eb952074bba9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('551', '1130041', '', '5', 'http://yanxuan.nosdn.127.net/0de6c515b07b96f902b42eb4262a0c6c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('552', '1130041', '', '5', 'http://yanxuan.nosdn.127.net/f3d5ec834ce5028f306e1e1d47d868ab.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('553', '1130042', '', '5', 'http://yanxuan.nosdn.127.net/b07878f08b72752e382aabb5f3e2953a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('554', '1130042', '', '5', 'http://yanxuan.nosdn.127.net/686fcb1f88a347074e403100b11bbfab.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('555', '1130042', '', '5', 'http://yanxuan.nosdn.127.net/d63f27a42ba184ae7b901a8b325f3647.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('556', '1130042', '', '5', 'http://yanxuan.nosdn.127.net/2ff09addcb19551f5b988a1ec2b436b3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('557', '1130049', '', '5', 'http://yanxuan.nosdn.127.net/c7ed6fa62ee79921ac580dc025df5f54.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('558', '1130049', '', '5', 'http://yanxuan.nosdn.127.net/efc598e817aa7cb220fa7aa962162105.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('559', '1130049', '', '5', 'http://yanxuan.nosdn.127.net/80082370ca7df234210a664f1915b717.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('560', '1130049', '', '5', 'http://yanxuan.nosdn.127.net/91e49302cf4cfe00937972b103809836.png');
INSERT INTO `mall_goods_gallery` VALUES ('561', '1130056', '', '5', 'http://yanxuan.nosdn.127.net/1845c55a5c2c3c04b77fcdb31b5ea7d9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('562', '1130056', '', '5', 'http://yanxuan.nosdn.127.net/1b1a13146260738645cb9c9ee022a3e5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('563', '1130056', '', '5', 'http://yanxuan.nosdn.127.net/a4d40245f7330fc95172cc7f290b9f8e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('564', '1130056', '', '5', 'http://yanxuan.nosdn.127.net/3b9a09ffa1c18a4c28545e4dea06766a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('565', '1131017', '', '5', 'http://yanxuan.nosdn.127.net/44af43b45ba5c2cdfcc4708cc9e2a724.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('566', '1131017', '', '5', 'http://yanxuan.nosdn.127.net/2f8fb59b6ee20eadae2534ff7872cb23.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('567', '1131017', '', '5', 'http://yanxuan.nosdn.127.net/a7896c18b39b560cec229f119d4151dc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('568', '1131017', '', '5', 'http://yanxuan.nosdn.127.net/d80addb9b62a41d3fe2c2a9036de4686.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('569', '1134022', '', '5', 'http://yanxuan.nosdn.127.net/64be227c6953e0bcf44a496aabd0d83f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('570', '1134022', '', '5', 'http://yanxuan.nosdn.127.net/ce9f1dfb57b8867361dab7afcc7c8fa1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('571', '1134022', '', '5', 'http://yanxuan.nosdn.127.net/4eb77d3e6a9d94899bad5230d189c74f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('572', '1134022', '', '5', 'http://yanxuan.nosdn.127.net/93966bbbe3f80a41c47580d83a115741.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('573', '1134030', '', '5', 'http://yanxuan.nosdn.127.net/97c6d4c7e80855966f0d38392b42a570.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('574', '1134030', '', '5', 'http://yanxuan.nosdn.127.net/35538160e3b41ae559031fa8c82fcebb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('575', '1134030', '', '5', 'http://yanxuan.nosdn.127.net/f2107c529bcc5c51bc3ce2b5cc9948db.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('576', '1134030', '', '5', 'http://yanxuan.nosdn.127.net/9b4ee214032f7707c15943a1f1dfc881.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('577', '1134032', '', '5', 'http://yanxuan.nosdn.127.net/5a9050413ef325301e5e5b6bfdcc4b58.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('578', '1134032', '', '5', 'http://yanxuan.nosdn.127.net/e866882f7bb9acde7c4e1d00171741f9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('579', '1134032', '', '5', 'http://yanxuan.nosdn.127.net/23947cb71c6c2f9635b53da910ac788d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('580', '1134032', '', '5', 'http://yanxuan.nosdn.127.net/bf80a04940ae1cd3e6c584d26fdee6ed.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('581', '1134056', '', '5', 'http://yanxuan.nosdn.127.net/de53227c5300dc2a4a7e25a7d6dcf5a1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('582', '1134056', '', '5', 'http://yanxuan.nosdn.127.net/8c237329b54caeef7bd7613443796db0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('583', '1134056', '', '5', 'http://yanxuan.nosdn.127.net/99b68bf325279102597cbd2829bffc09.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('584', '1134056', '', '5', 'http://yanxuan.nosdn.127.net/a72497e9a412babf1143ab64394ca9de.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('589', '1135001', '', '5', 'http://yanxuan.nosdn.127.net/ff010423d0808d21f45a052378833c8b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('590', '1135001', '', '5', 'http://yanxuan.nosdn.127.net/d1eb900e90832c246c60c4cca13ccea5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('591', '1135001', '', '5', 'http://yanxuan.nosdn.127.net/7554ea2b1723eb3b521b9825c3c35d52.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('592', '1135001', '', '5', 'http://yanxuan.nosdn.127.net/39695757fe860202cf2455614576adf4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('593', '1135002', '', '5', 'http://yanxuan.nosdn.127.net/cb78d268c517c15381aeb5b5905101fe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('594', '1135002', '', '5', 'http://yanxuan.nosdn.127.net/47c131a02d5d5b97ddcd19c16b391bbb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('595', '1135002', '', '5', 'http://yanxuan.nosdn.127.net/5300c083dcc0c6a856364d883f3284e8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('596', '1135002', '', '5', 'http://yanxuan.nosdn.127.net/586f42c66523559838fbb97b7315bab6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('597', '1135050', '', '5', 'http://yanxuan.nosdn.127.net/2a7f492c870c603bbb8619d6ff40c22b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('598', '1135050', '', '5', 'http://yanxuan.nosdn.127.net/c43ff066b17207c21bb99e261d23a40d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('599', '1135050', '', '5', 'http://yanxuan.nosdn.127.net/e3d397a574d0867906a69278741a1562.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('600', '1135050', '', '5', 'http://yanxuan.nosdn.127.net/64c1dd9a8a3cb26f9105ac68c8700171.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('601', '1135051', '', '5', 'http://yanxuan.nosdn.127.net/f3ab20a6f488fdfdadd15402f07b1794.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('602', '1135051', '', '5', 'http://yanxuan.nosdn.127.net/9afed203129a696d682eb005fdf980ed.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('603', '1135051', '', '5', 'http://yanxuan.nosdn.127.net/6436743044528b017ea8b40a276dde7d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('604', '1135051', '', '5', 'http://yanxuan.nosdn.127.net/7b2f3a9be300acdcb580fe75620d8133.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('605', '1135052', '', '5', 'http://yanxuan.nosdn.127.net/4a052c9a96ef8f424ddb35e6a1dae822.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('606', '1135052', '', '5', 'http://yanxuan.nosdn.127.net/1ad1192c393500a7d6e31036af44b0aa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('607', '1135052', '', '5', 'http://yanxuan.nosdn.127.net/de46fc2984dea187c6d95036a3ca7852.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('608', '1135052', '', '5', 'http://yanxuan.nosdn.127.net/e3fc3ff866a0ac4d588f890cdc45ab20.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('609', '1135053', '', '5', 'http://yanxuan.nosdn.127.net/01578bfc12384b74c0f4ce44f01ee448.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('610', '1135053', '', '5', 'http://yanxuan.nosdn.127.net/e9764d9aac2a990abe7bac475d5ce116.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('611', '1135053', '', '5', 'http://yanxuan.nosdn.127.net/9aa7059dc52afc82894e12c05dee3775.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('612', '1135053', '', '5', 'http://yanxuan.nosdn.127.net/c77e566a855a84f69241d5db0939e160.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('613', '1135054', '', '5', 'http://yanxuan.nosdn.127.net/4973d54026070f1d9083c83d5951be8b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('614', '1135054', '', '5', 'http://yanxuan.nosdn.127.net/1f6a9ce98a3e955946d52d3139b14d11.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('615', '1135054', '', '5', 'http://yanxuan.nosdn.127.net/b60b64ca87333bf3601b9e502a4b4961.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('616', '1135054', '', '5', 'http://yanxuan.nosdn.127.net/7255eb59c0cf8312d70a06c4ff818f64.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('617', '1135055', '', '5', 'http://yanxuan.nosdn.127.net/c893004aca22660dac6b3edf8e6070cc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('618', '1135055', '', '5', 'http://yanxuan.nosdn.127.net/19f4225226cc3d044cdf22fdb5155314.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('619', '1135055', '', '5', 'http://yanxuan.nosdn.127.net/8fcd82bbd0995d31310c70bb59bab52b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('620', '1135055', '', '5', 'http://yanxuan.nosdn.127.net/0e733fc07e89bb025ff5738837cc3d5a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('621', '1135056', '', '5', 'http://yanxuan.nosdn.127.net/42d0d0b58137b50c41a472b721817110.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('622', '1135056', '', '5', 'http://yanxuan.nosdn.127.net/384ab49a469f592b9c3c23bdd1d99456.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('623', '1135056', '', '5', 'http://yanxuan.nosdn.127.net/a0351b55ae128410718d9abbe048d59d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('624', '1135056', '', '5', 'http://yanxuan.nosdn.127.net/05a7288be96a45435fa942dfe73a37c7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('625', '1135057', '', '5', 'http://yanxuan.nosdn.127.net/86755475669812cad499b1611ea8f3e3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('626', '1135057', '', '5', 'http://yanxuan.nosdn.127.net/1521ee48cff67a3d5170b393179d8032.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('627', '1135057', '', '5', 'http://yanxuan.nosdn.127.net/28aa5ccf88a314821b0e0efe25bbd356.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('628', '1135057', '', '5', 'http://yanxuan.nosdn.127.net/0b18fd03be66943110e1541f2cdd1dd1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('629', '1135058', '', '5', 'http://yanxuan.nosdn.127.net/45765c794a67f43ae09e2558158e99ea.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('630', '1135058', '', '5', 'http://yanxuan.nosdn.127.net/2343dfbfd4a564ce5a0c0342c754dc96.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('631', '1135058', '', '5', 'http://yanxuan.nosdn.127.net/6d8a21d7dadcac97cc0fe16f4de91b7a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('632', '1135058', '', '5', 'http://yanxuan.nosdn.127.net/8bf410efc12c23f3b6a65ba3023d2f10.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('633', '1138000', '', '5', 'http://yanxuan.nosdn.127.net/6c077e6fdbb1097c530ec38f805bef96.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('634', '1138000', '', '5', 'http://yanxuan.nosdn.127.net/18327e601ce72fce5295c3e8a4e5edb8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('635', '1138000', '', '5', 'http://yanxuan.nosdn.127.net/5599380c7fcccc15cb60d1e1f2f4ebca.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('636', '1138000', '', '5', 'http://yanxuan.nosdn.127.net/aa818e0f542b19dca3dedbd82299f5d4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('637', '1138001', '', '5', 'http://yanxuan.nosdn.127.net/26a98380a4bfc87e5bf1f284fa0e5326.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('638', '1138001', '', '5', 'http://yanxuan.nosdn.127.net/0aaf361547fbf53416e39577b643f37f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('639', '1138001', '', '5', 'http://yanxuan.nosdn.127.net/d1162dd41523cacb74d55c2f020623f1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('640', '1138001', '', '5', 'http://yanxuan.nosdn.127.net/416067a61b4911bf7f6d26cd7adf8058.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('641', '1143015', '', '5', 'http://yanxuan.nosdn.127.net/dee547def90dc27928f7da892059cdf4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('642', '1143015', '', '5', 'http://yanxuan.nosdn.127.net/0eaba4e65f5842069dc3701064206bbb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('643', '1143015', '', '5', 'http://yanxuan.nosdn.127.net/b6f6f87724f792525236f243aca134ad.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('644', '1143015', '', '5', 'http://yanxuan.nosdn.127.net/8267a06caded158b3d59e687f8464bdd.png');
INSERT INTO `mall_goods_gallery` VALUES ('645', '1147045', '', '5', 'http://yanxuan.nosdn.127.net/fc2cc85988f5dff0cb279f71defb70e9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('646', '1147045', '', '5', 'http://yanxuan.nosdn.127.net/e4bd418068967198c004c553baeb96ea.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('647', '1147045', '', '5', 'http://yanxuan.nosdn.127.net/80c19798d0c56e1c10b7b8221d6decd9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('648', '1147045', '', '5', 'http://yanxuan.nosdn.127.net/9160dde4aa5d7f961607d3e6c9d04843.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('649', '1147046', '', '5', 'http://yanxuan.nosdn.127.net/bf827be7365ce9cbf63e5c09a3d02c03.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('650', '1147046', '', '5', 'http://yanxuan.nosdn.127.net/dba153ee3fd18775ba79b34cfedbe7f4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('651', '1147046', '', '5', 'http://yanxuan.nosdn.127.net/b92912b2c65d2a62fcdd1167fb1aec03.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('652', '1147046', '', '5', 'http://yanxuan.nosdn.127.net/efb43b046cc0102a65b967b835c3cdd9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('653', '1147047', '', '5', 'http://yanxuan.nosdn.127.net/014530f37555bba33eec154a36b78a02.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('654', '1147047', '', '5', 'http://yanxuan.nosdn.127.net/7e1e516c116a663e587fc5dd3cd2f47b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('655', '1147047', '', '5', 'http://yanxuan.nosdn.127.net/db03baeb92ec4be50203dc690b793830.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('656', '1147047', '', '5', 'http://yanxuan.nosdn.127.net/a9239c7e79510a1218f94da58a278a8d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('657', '1147048', '', '5', 'http://yanxuan.nosdn.127.net/cb0fc84a590f63e61b0eb3ee0833fcff.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('658', '1147048', '', '5', 'http://yanxuan.nosdn.127.net/cab7242933b1d129f4f66b05e1652641.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('659', '1147048', '', '5', 'http://yanxuan.nosdn.127.net/e65c7df582c401681bdaa31925cf86e4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('660', '1147048', '', '5', 'http://yanxuan.nosdn.127.net/586bdb8102b0fa378e554055a5aa58aa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('661', '1151012', '', '5', 'http://yanxuan.nosdn.127.net/a0d154954426b63e3b52f772e94d67d3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('662', '1151012', '', '5', 'http://yanxuan.nosdn.127.net/f5d8ad0faa0259483f9449de25c75060.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('663', '1151012', '', '5', 'http://yanxuan.nosdn.127.net/d22ce947923b8a0411c20f603bca30cb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('664', '1151012', '', '5', 'http://yanxuan.nosdn.127.net/f7fa2262219eab101a9ae4be2f8f9376.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('665', '1151013', '', '5', 'http://yanxuan.nosdn.127.net/36995f44ed0f31a66d689f60b2cf6b9c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('666', '1151013', '', '5', 'http://yanxuan.nosdn.127.net/00f009599828ba02994cf1db7ce1bf06.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('667', '1151013', '', '5', 'http://yanxuan.nosdn.127.net/381ba1d947afd3ca6180c503114ebb47.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('668', '1151013', '', '5', 'http://yanxuan.nosdn.127.net/40a15ca9468f56e3a3743b1afb17a8b6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('669', '1152161', '', '5', 'http://yanxuan.nosdn.127.net/38a0b23950b79611fb565bae14351a11.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('670', '1152161', '', '5', 'http://yanxuan.nosdn.127.net/810555afa6919c766a33422edefb1bc8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('671', '1152161', '', '5', 'http://yanxuan.nosdn.127.net/b97b54e854660fedabc4dd07d3215216.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('672', '1152161', '', '5', 'http://yanxuan.nosdn.127.net/79200063ab5893cf3fdd16f428e4d505.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('689', '1152100', null, null, 'http://yanxuan.nosdn.127.net/4eb09e08ac9de543d2291d27a6be0b54.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('694', '1006014', '', '5', 'http://yanxuan.nosdn.127.net/1479bec93b57855889d93a9f4eef0b72.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('695', '1006014', '', '5', 'http://yanxuan.nosdn.127.net/ccc21b29557929ec99067a445fc74ea3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('696', '1006014', '', '5', 'http://yanxuan.nosdn.127.net/6e93d7d868d918bef0138748ffbd9458.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('697', '1006014', '', '5', 'http://yanxuan.nosdn.127.net/22535d179b6796fbd45a83d6ecea3b50.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('700', '1181001', null, null, 'http://yanxuan.nosdn.127.net/8cfc7b6bfd28687ab3399da08e5ba61b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('701', '1181001', null, null, 'http://yanxuan.nosdn.127.net/b98cfd7f197b62abd1679321eae253a6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('716', '1006013', '', '5', 'http://yanxuan.nosdn.127.net/d83cbd9ec177276ba2582ee393eff3db.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('717', '1006013', '', '5', 'http://yanxuan.nosdn.127.net/b73852cf22939c4995a5bc8996a4afdd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('718', '1006013', '', '5', 'http://yanxuan.nosdn.127.net/d2fe16d259e0187d6b53eef028e843d1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('719', '1006013', '', '5', 'http://yanxuan.nosdn.127.net/4e8f5c09ae9dd03b5ae5b1287b598cc5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('720', '1010001', '', '5', 'http://yanxuan.nosdn.127.net/01a2844b480d2456d2e764c0ea2f8201.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('721', '1010001', '', '5', 'http://yanxuan.nosdn.127.net/057bee2ec4c883077f4dc710c4076369.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('722', '1010001', '', '5', 'http://yanxuan.nosdn.127.net/36cb5783a102c30b818adb7bf5dfde5b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('723', '1010001', '', '5', 'http://yanxuan.nosdn.127.net/5abc565d5b01e8de15fa16acf58ed40e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('730', '1181000', null, null, 'https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171031/214209267ba50e.png');
INSERT INTO `mall_goods_gallery` VALUES ('731', '1181000', '', '5', 'http://yanxuan.nosdn.127.net/43e283df216881037b70d8b34f8846d3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('732', '1181000', '', '5', 'http://yanxuan.nosdn.127.net/12e41d7e5dabaf9150a8bb45c41cf422.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('735', '1135000', '', '5', 'http://yanxuan.nosdn.127.net/127286b130ba377c46550d3829aa19e2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('736', '1135000', '', '5', 'http://yanxuan.nosdn.127.net/79f396a5eb345081078bf8e9c25314a8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('737', '1135000', '', '5', 'http://yanxuan.nosdn.127.net/6a869e79b45fbc8604bda086d8d4515e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('738', '1135000', '', '5', 'http://yanxuan.nosdn.127.net/94d2aaf45d453e491a90ea2a12c8c119.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('740', '1155000', '', '5', 'http://yanxuan.nosdn.127.net/2eca5d0f8a1ce61baf32311264cebdd1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('741', '1155000', '', '5', 'http://yanxuan.nosdn.127.net/6fa8774f6da6cc473ba3714aec95f6b6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('742', '1155000', '', '5', 'http://yanxuan.nosdn.127.net/6bdf224d6c0276a2737d6af775b6ed8a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('743', '1155000', '', '5', 'http://yanxuan.nosdn.127.net/517914d4f7d872b17a55e9c3864df717.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('744', '1166008', null, null, 'https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171031/2143264602ae18.png');
INSERT INTO `mall_goods_gallery` VALUES ('759', '1006002', '', '5', 'http://yanxuan.nosdn.127.net/b98cfd7f197b62abd1679321eae253a6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('760', '1006002', '', '5', 'http://yanxuan.nosdn.127.net/8cfc7b6bfd28687ab3399da08e5ba61b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('761', '1006002', '', '5', 'http://yanxuan.nosdn.127.net/0c9eb81c7594dbe42802ff1ebbece51a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('762', '1006002', '', '5', 'http://yanxuan.nosdn.127.net/4eb09e08ac9de543d2291d27a6be0b54.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('763', '1009024', null, null, 'http://image.meiping123.com/upload/20171130/194221941ca570.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('843', '1181010', null, null, 'http://image.meiping123.com/upload/20171228/1155311018e3ed.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('844', '1181010', null, null, 'http://image.meiping123.com/upload/20171228/11553392978523.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('845', '1181010', null, null, 'http://image.meiping123.com/upload/20171228/11553623aca0d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('848', '1181002', null, null, 'http://image.meiping123.com/upload/20171227/17462483511190.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('849', '1181002', null, null, 'http://image.meiping123.com/upload/20171227/17462767948a5f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('874', '1181011', null, null, 'http://image.meiping123.com/upload/20171228/123514445ee241.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('875', '1181011', null, null, 'http://image.meiping123.com/upload/20171228/1235123051baea.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('876', '1181011', null, null, 'http://image.meiping123.com/upload/20171228/1235107005e0a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('903', '1181014', null, null, 'http://image.meiping123.com/upload/20171229/151946484625a2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('904', '1181014', null, null, 'http://image.meiping123.com/upload/20171229/15194446a6e93.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('905', '1181015', null, null, 'http://image.meiping123.com/upload/20171229/15230634541b0b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('906', '1181015', null, null, 'http://image.meiping123.com/upload/20171229/1523082229b637.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('907', '1181015', null, null, 'http://image.meiping123.com/upload/20171229/152309848f85c6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('908', '1181015', null, null, 'http://image.meiping123.com/upload/20171229/152311601b4af5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('909', '1181015', null, null, 'http://image.meiping123.com/upload/20171229/152313306de7dd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('954', '1181016', null, null, 'http://image.meiping123.com/upload/20171229/152654877cc8f5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('955', '1181016', null, null, 'http://image.meiping123.com/upload/20171229/1526532165695e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('956', '1181016', null, null, 'http://image.meiping123.com/upload/20171229/152651568ca640.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('957', '1181016', null, null, 'http://image.meiping123.com/upload/20171229/152649865ba0f6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1003', '1181013', null, null, 'http://image.meiping123.com/upload/20171229/1514527892a145.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1004', '1181013', null, null, 'http://image.meiping123.com/upload/20171229/15145090257d2d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1005', '1181013', null, null, 'http://image.meiping123.com/upload/20171229/1514489409422b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1006', '1181013', null, null, 'http://image.meiping123.com/upload/20171229/151447162d7d48.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1007', '1181013', null, null, 'http://image.meiping123.com/upload/20171229/15144522559ec8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1008', '1181017', null, null, 'http://image.meiping123.com/upload/20171229/16173520c71cf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1009', '1181017', null, null, 'http://image.meiping123.com/upload/20171229/1617332261d9df.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1010', '1181017', null, null, 'http://image.meiping123.com/upload/20171229/1617314318e7a9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1011', '1181017', null, null, 'http://image.meiping123.com/upload/20171229/1617295189cdba.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1012', '1181017', null, null, 'http://image.meiping123.com/upload/20171229/161727528a684f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1013', '1181018', null, null, 'http://image.meiping123.com/upload/20171229/16190083765567.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1014', '1181018', null, null, 'http://image.meiping123.com/upload/20171229/1618589734171d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1015', '1181018', null, null, 'http://image.meiping123.com/upload/20171229/1618569861a3ac.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1016', '1181018', null, null, 'http://image.meiping123.com/upload/20171229/16185490063b42.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1017', '1181019', null, null, 'http://image.meiping123.com/upload/20171229/16205057cc863.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1018', '1181019', null, null, 'http://image.meiping123.com/upload/20171229/16205187174bd4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1019', '1181019', null, null, 'http://image.meiping123.com/upload/20171229/1620535497e02a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1020', '1181019', null, null, 'http://image.meiping123.com/upload/20171229/162055367e880c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1021', '1181020', null, null, 'http://image.meiping123.com/upload/20171229/162210308e0523.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1022', '1181020', null, null, 'http://image.meiping123.com/upload/20171229/1622124469560b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1023', '1181020', null, null, 'http://image.meiping123.com/upload/20171229/16221429710e2c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1024', '1181020', null, null, 'http://image.meiping123.com/upload/20171229/162216204b53a4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1025', '1181020', null, null, 'http://image.meiping123.com/upload/20171229/162218191ca917.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1026', '1181021', null, null, 'http://image.meiping123.com/upload/20171229/16234757617766.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1027', '1181021', null, null, 'http://image.meiping123.com/upload/20171229/162345835bd7b1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1028', '1181021', null, null, 'http://image.meiping123.com/upload/20171229/162343658ce71a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1029', '1181021', null, null, 'http://image.meiping123.com/upload/20171229/1623416327ff85.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1030', '1181022', null, null, 'http://image.meiping123.com/upload/20171229/1627521611ce24.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1031', '1181022', null, null, 'http://image.meiping123.com/upload/20171229/16275055056c2d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1032', '1181022', null, null, 'http://image.meiping123.com/upload/20171229/16274898752ea0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1033', '1181023', null, null, 'http://image.meiping123.com/upload/20171229/16323379652b41.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1034', '1181023', null, null, 'http://image.meiping123.com/upload/20171229/163235399ba279.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1035', '1181023', null, null, 'http://image.meiping123.com/upload/20171229/163237291113de.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1036', '1181024', null, null, 'http://image.meiping123.com/upload/20171229/1634185018b148.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1037', '1181024', null, null, 'http://image.meiping123.com/upload/20171229/163420141b0fb9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1038', '1181025', null, null, 'http://image.meiping123.com/upload/20171229/163620630795d5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1039', '1181025', null, null, 'http://image.meiping123.com/upload/20171229/16362221999731.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1040', '1181025', null, null, 'http://image.meiping123.com/upload/20171229/1636249594144.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1044', '1181026', null, null, 'http://image.meiping123.com/upload/20171229/164029915bbfce.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1045', '1181026', null, null, 'http://image.meiping123.com/upload/20171229/164031821ccf19.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1046', '1181026', null, null, 'http://image.meiping123.com/upload/20171229/164033256de2e5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1047', '1181026', null, null, 'http://image.meiping123.com/upload/20171229/16403519721bd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1048', '1181027', null, null, 'http://image.meiping123.com/upload/20171229/164140453dbd87.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1049', '1181027', null, null, 'http://image.meiping123.com/upload/20171229/16414188528012.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1050', '1181027', null, null, 'http://image.meiping123.com/upload/20171229/164143659f1bf5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1051', '1181028', null, null, 'http://image.meiping123.com/upload/20171229/164249743b0d5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1052', '1181028', null, null, 'http://image.meiping123.com/upload/20171229/16425093103200.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1053', '1181028', null, null, 'http://image.meiping123.com/upload/20171229/164252636befe1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1058', '1181030', null, null, 'http://image.meiping123.com/upload/20171229/16454018561640.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1059', '1181030', null, null, 'http://image.meiping123.com/upload/20171229/164541895215d0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1060', '1181030', null, null, 'http://image.meiping123.com/upload/20171229/1645437281ac22.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1061', '1181031', null, null, 'http://image.meiping123.com/upload/20171229/164710596d64e4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1062', '1181031', null, null, 'http://image.meiping123.com/upload/20171229/164712374744e3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1063', '1181031', null, null, 'http://image.meiping123.com/upload/20171229/1647141921b0a4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1064', '1181031', null, null, 'http://image.meiping123.com/upload/20171229/16471579552fdc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1065', '1181032', null, null, 'http://image.meiping123.com/upload/20171229/164828794e200d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1066', '1181032', null, null, 'http://image.meiping123.com/upload/20171229/1648305593abd0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1067', '1181033', null, null, 'http://image.meiping123.com/upload/20171229/164948907624c7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1068', '1181034', null, null, 'http://image.meiping123.com/upload/20171229/16514621191474.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1069', '1181034', null, null, 'http://image.meiping123.com/upload/20171229/165148311b103d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1070', '1181034', null, null, 'http://image.meiping123.com/upload/20171229/1651502ec978.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1071', '1181034', null, null, 'http://image.meiping123.com/upload/20171229/165151973c1a28.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1072', '1181035', null, null, 'http://image.meiping123.com/upload/20171229/1653037569ab60.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1073', '1181035', null, null, 'http://image.meiping123.com/upload/20171229/16530558067731.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1074', '1181035', null, null, 'http://image.meiping123.com/upload/20171229/165307483653c4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1075', '1181036', null, null, 'http://image.meiping123.com/upload/20171229/16541445246dc1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1076', '1181036', null, null, 'http://image.meiping123.com/upload/20171229/1654163859d324.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1077', '1181037', null, null, 'http://image.meiping123.com/upload/20171229/16554865182e12.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1078', '1181037', null, null, 'http://image.meiping123.com/upload/20171229/1655513681484a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1079', '1181037', null, null, 'http://image.meiping123.com/upload/20171229/165554314636d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1080', '1181038', null, null, 'http://image.meiping123.com/upload/20171229/1657568010fd64.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1081', '1181038', null, null, 'http://image.meiping123.com/upload/20171229/16575877216bf0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1082', '1181038', null, null, 'http://image.meiping123.com/upload/20171229/165800400f03ae.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1084', '1181040', null, null, 'http://image.meiping123.com/upload/20171229/1701346085eff4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1085', '1181040', null, null, 'http://image.meiping123.com/upload/20171229/1701363768e37e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1086', '1181040', null, null, 'http://image.meiping123.com/upload/20171229/170138532ebc92.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1087', '1181039', null, null, 'http://image.meiping123.com/upload/20171229/1700107256f1f7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1088', '1181041', null, null, 'http://image.meiping123.com/upload/20171229/1703107642ed6b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1089', '1181041', null, null, 'http://image.meiping123.com/upload/20171229/170313139418d9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1090', '1181041', null, null, 'http://image.meiping123.com/upload/20171229/170314877d2eb5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1109', '1181042', null, null, 'http://image.meiping123.com/upload/20171229/1703107642ed6b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1110', '1181042', null, null, 'http://image.meiping123.com/upload/20171229/170313139418d9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1111', '1181042', null, null, 'http://image.meiping123.com/upload/20171229/170314877d2eb5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1116', '1181029', null, null, 'http://image.meiping123.com/upload/20171229/16442478566055.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1117', '1181029', null, null, 'http://image.meiping123.com/upload/20171229/164426611ade30.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1118', '1181029', null, null, 'http://image.meiping123.com/upload/20171229/16442819174833.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1119', '1181029', null, null, 'http://image.meiping123.com/upload/20171229/16442986688aad.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1162', '1181043', null, null, 'http://image.meiping123.com/upload/20180111/165909545c9d0a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1163', '1181043', null, null, 'http://image.meiping123.com/upload/20180111/1659123479ad41.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1164', '1181043', null, null, 'http://image.meiping123.com/upload/20180111/16591483808a84.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1165', '1181043', null, null, 'http://image.meiping123.com/upload/20180111/165916828d177b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1166', '1181043', null, null, 'http://image.meiping123.com/upload/20180111/1659191902b1ba.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1167', '1181044', null, null, 'http://image.meiping123.com/upload/20180111/170416379a3aa8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1168', '1181044', null, null, 'http://image.meiping123.com/upload/20180111/17041432273039.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1169', '1181044', null, null, 'http://image.meiping123.com/upload/20180111/17041178132e6b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1170', '1181045', null, null, 'http://image.meiping123.com/upload/20180111/1706487404b33.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1171', '1181045', null, null, 'http://image.meiping123.com/upload/20180111/170645828ca06a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1172', '1181045', null, null, 'http://image.meiping123.com/upload/20180111/170644713831b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1173', '1181045', null, null, 'http://image.meiping123.com/upload/20180111/170642115f8c92.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1174', '1181045', null, null, 'http://image.meiping123.com/upload/20180111/170639908f3807.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1175', '1181046', null, null, 'http://image.meiping123.com/upload/20180111/1709342222c8fe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1176', '1181046', null, null, 'http://image.meiping123.com/upload/20180111/170932220dbaf7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1177', '1181046', null, null, 'http://image.meiping123.com/upload/20180111/170930443f1b98.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1178', '1181046', null, null, 'http://image.meiping123.com/upload/20180111/170928175c473c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1179', '1181047', null, null, 'http://image.meiping123.com/upload/20180111/1711113996cc9c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1180', '1181047', null, null, 'http://image.meiping123.com/upload/20180111/171109545e793c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1181', '1181047', null, null, 'http://image.meiping123.com/upload/20180111/1711076314b6db.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1182', '1181047', null, null, 'http://image.meiping123.com/upload/20180111/17110542485b86.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1183', '1181048', null, null, 'http://image.meiping123.com/upload/20180111/1713067013d508.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1184', '1181048', null, null, 'http://image.meiping123.com/upload/20180111/171304536475f5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1185', '1181048', null, null, 'http://image.meiping123.com/upload/20180111/171302185380f9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1186', '1181048', null, null, 'http://image.meiping123.com/upload/20180111/171259925a0841.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1187', '1181049', null, null, 'http://image.meiping123.com/upload/20180111/172446366ab373.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1188', '1181049', null, null, 'http://image.meiping123.com/upload/20180111/1724441745e295.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1189', '1181049', null, null, 'http://image.meiping123.com/upload/20180111/172442398bf68d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1190', '1181049', null, null, 'http://image.meiping123.com/upload/20180111/172439771eb5b4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1199', '1181051', null, null, 'http://image.meiping123.com/upload/20180111/17412771173da2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1200', '1181051', null, null, 'http://image.meiping123.com/upload/20180111/1741298714eb7f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1201', '1181051', null, null, 'http://image.meiping123.com/upload/20180111/174132116aff16.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1202', '1181051', null, null, 'http://image.meiping123.com/upload/20180111/174134800d877.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1203', '1181051', null, null, 'http://image.meiping123.com/upload/20180111/17413630365371.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1204', '1181052', null, null, 'http://image.meiping123.com/upload/20180111/1743598481bfb6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1205', '1181052', null, null, 'http://image.meiping123.com/upload/20180111/174402761a177d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1206', '1181052', null, null, 'http://image.meiping123.com/upload/20180111/174405321c5af1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1207', '1181052', null, null, 'http://image.meiping123.com/upload/20180111/1744073518e0a2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1208', '1181052', null, null, 'http://image.meiping123.com/upload/20180111/1744099401bc32.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1209', '1181050', null, null, 'http://image.meiping123.com/upload/20180111/17394964501ec7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1210', '1181050', null, null, 'http://image.meiping123.com/upload/20180111/17394719030b5b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1211', '1181050', null, null, 'http://image.meiping123.com/upload/20180111/173944450c7611.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1212', '1181050', null, null, 'http://image.meiping123.com/upload/20180111/1739416664b141.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1213', '1181053', null, null, 'http://image.meiping123.com/upload/20180111/174707379805a7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1214', '1181053', null, null, 'http://image.meiping123.com/upload/20180111/17470963180a37.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1215', '1181053', null, null, 'http://image.meiping123.com/upload/20180111/1747115862d063.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1216', '1181053', null, null, 'http://image.meiping123.com/upload/20180111/17471350124bce.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1217', '1181054', null, null, 'http://image.meiping123.com/upload/20180111/174906430f6511.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1218', '1181054', null, null, 'http://image.meiping123.com/upload/20180111/17490860905c8b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1219', '1181054', null, null, 'http://image.meiping123.com/upload/20180111/174910411c5dd3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1220', '1181054', null, null, 'http://image.meiping123.com/upload/20180111/174912687675fe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1221', '1181054', null, null, 'http://image.meiping123.com/upload/20180111/1749146850bb8a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1222', '1181055', null, null, 'http://image.meiping123.com/upload/20180111/175038967212b8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1223', '1181055', null, null, 'http://image.meiping123.com/upload/20180111/175041107e274c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1224', '1181055', null, null, 'http://image.meiping123.com/upload/20180111/17504337984450.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1225', '1181055', null, null, 'http://image.meiping123.com/upload/20180111/175045378d6f6d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1226', '1181055', null, null, 'http://image.meiping123.com/upload/20180111/17504740357461.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1227', '1181056', null, null, 'http://image.meiping123.com/upload/20180111/175226673e45ff.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1228', '1181056', null, null, 'http://image.meiping123.com/upload/20180111/175228600ff2dd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1229', '1181056', null, null, 'http://image.meiping123.com/upload/20180111/1752309870c917.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1230', '1181056', null, null, 'http://image.meiping123.com/upload/20180111/17523335230d8b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1231', '1181057', null, null, 'http://image.meiping123.com/upload/20180111/175408907cc9c4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1232', '1181057', null, null, 'http://image.meiping123.com/upload/20180111/175410735903d2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1233', '1181057', null, null, 'http://image.meiping123.com/upload/20180111/1754125919758e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1234', '1181057', null, null, 'http://image.meiping123.com/upload/20180111/175414406ed3da.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1235', '1181057', null, null, 'http://image.meiping123.com/upload/20180111/175416113b9f86.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1236', '1181058', null, null, 'http://image.meiping123.com/upload/20180111/175549109a3d9c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1237', '1181058', null, null, 'http://image.meiping123.com/upload/20180111/1755513450fcc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1238', '1181058', null, null, 'http://image.meiping123.com/upload/20180111/175552802dae74.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1239', '1181058', null, null, 'http://image.meiping123.com/upload/20180111/175554470332e0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1240', '1181058', null, null, 'http://image.meiping123.com/upload/20180111/17555614862e29.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1241', '1181059', null, null, 'http://image.meiping123.com/upload/20180111/194025954a7a0a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1242', '1181059', null, null, 'http://image.meiping123.com/upload/20180111/194028281b2756.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1243', '1181059', null, null, 'http://image.meiping123.com/upload/20180111/194030235ce7b9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1244', '1181059', null, null, 'http://image.meiping123.com/upload/20180111/1940324619de7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1245', '1181059', null, null, 'http://image.meiping123.com/upload/20180111/194033903687e8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1246', '1181060', null, null, 'http://image.meiping123.com/upload/20180111/19415555575262.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1247', '1181060', null, null, 'http://image.meiping123.com/upload/20180111/1941589170523.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1248', '1181060', null, null, 'http://image.meiping123.com/upload/20180111/1942007417f3c0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1249', '1181060', null, null, 'http://image.meiping123.com/upload/20180111/194202704e2a22.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1250', '1181060', null, null, 'http://image.meiping123.com/upload/20180111/194204652f95e6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1251', '1181061', null, null, 'http://image.meiping123.com/upload/20180111/194332866cb72f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1252', '1181061', null, null, 'http://image.meiping123.com/upload/20180111/1943359958135.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1253', '1181061', null, null, 'http://image.meiping123.com/upload/20180111/19433686876862.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1254', '1181061', null, null, 'http://image.meiping123.com/upload/20180111/194338914f83ac.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1255', '1181061', null, null, 'http://image.meiping123.com/upload/20180111/194340940f8cab.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1256', '1181062', null, null, 'http://image.meiping123.com/upload/20180111/194553021bb6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1257', '1181062', null, null, 'http://image.meiping123.com/upload/20180111/194555171d7f4d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1258', '1181062', null, null, 'http://image.meiping123.com/upload/20180111/194557393c6737.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1259', '1181062', null, null, 'http://image.meiping123.com/upload/20180111/194559356ac68a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1260', '1181062', null, null, 'http://image.meiping123.com/upload/20180111/194601582fb0ca.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1261', '1181063', null, null, 'http://image.meiping123.com/upload/20180111/1947256328c1db.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1262', '1181063', null, null, 'http://image.meiping123.com/upload/20180111/194729370a12b7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1263', '1181063', null, null, 'http://image.meiping123.com/upload/20180111/194731685fe1f4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1264', '1181063', null, null, 'http://image.meiping123.com/upload/20180111/1947338304e408.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1265', '1181064', null, null, 'http://image.meiping123.com/upload/20180111/19492857b8362.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1266', '1181064', null, null, 'http://image.meiping123.com/upload/20180111/1949302969b08d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1267', '1181064', null, null, 'http://image.meiping123.com/upload/20180111/194932307664fe.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1268', '1181064', null, null, 'http://image.meiping123.com/upload/20180111/194934333cba76.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1269', '1181065', null, null, 'http://image.meiping123.com/upload/20180111/19523495803670.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1270', '1181065', null, null, 'http://image.meiping123.com/upload/20180111/195237222f5bff.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1271', '1181065', null, null, 'http://image.meiping123.com/upload/20180111/195239795e6a4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1272', '1181066', null, null, 'http://image.meiping123.com/upload/20180111/195414624bea8c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1273', '1181066', null, null, 'http://image.meiping123.com/upload/20180111/195416808cc841.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1274', '1181066', null, null, 'http://image.meiping123.com/upload/20180111/195418794517c4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1275', '1181066', null, null, 'http://image.meiping123.com/upload/20180111/19542072375275.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1276', '1181066', null, null, 'http://image.meiping123.com/upload/20180111/1954229729abe9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1277', '1181067', null, null, 'http://image.meiping123.com/upload/20180111/195633373d172e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1278', '1181067', null, null, 'http://image.meiping123.com/upload/20180111/195636622f4b62.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1279', '1181067', null, null, 'http://image.meiping123.com/upload/20180111/1956391087a6e0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1280', '1181068', null, null, 'http://image.meiping123.com/upload/20180111/20004481811968.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1281', '1181068', null, null, 'http://image.meiping123.com/upload/20180111/20004814640418.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1282', '1181068', null, null, 'http://image.meiping123.com/upload/20180111/20005161021be8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1283', '1181068', null, null, 'http://image.meiping123.com/upload/20180111/20005391093e93.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1284', '1181068', null, null, 'http://image.meiping123.com/upload/20180111/200056864190e2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1285', '1181069', null, null, 'http://image.meiping123.com/upload/20180111/2005448760f133.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1286', '1181069', null, null, 'http://image.meiping123.com/upload/20180111/2005475118e9d6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1287', '1181069', null, null, 'http://image.meiping123.com/upload/20180111/200550233b282.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1288', '1181069', null, null, 'http://image.meiping123.com/upload/20180111/2005523414270e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1289', '1181069', null, null, 'http://image.meiping123.com/upload/20180111/2005546358fde8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1290', '1181070', null, null, 'http://image.meiping123.com/upload/20180111/2008126999ea30.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1291', '1181070', null, null, 'http://image.meiping123.com/upload/20180111/200814910345c6.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1292', '1181070', null, null, 'http://image.meiping123.com/upload/20180111/2008169314edbf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1293', '1181070', null, null, 'http://image.meiping123.com/upload/20180111/200819113c0d6c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1294', '1181070', null, null, 'http://image.meiping123.com/upload/20180111/200821449c6df1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1295', '1181071', null, null, 'http://image.meiping123.com/upload/20180114/19124152b317a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1296', '1181071', null, null, 'http://image.meiping123.com/upload/20180114/1912434190d22f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1297', '1181071', null, null, 'http://image.meiping123.com/upload/20180114/19124574507be3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1298', '1181071', null, null, 'http://image.meiping123.com/upload/20180114/191247748959e5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1299', '1181072', null, null, 'http://image.meiping123.com/upload/20180114/19141763ea73.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1300', '1181072', null, null, 'http://image.meiping123.com/upload/20180114/191419544d9273.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1301', '1181072', null, null, 'http://image.meiping123.com/upload/20180114/1914227325a97.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1302', '1181072', null, null, 'http://image.meiping123.com/upload/20180114/191424435ed6aa.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1303', '1181073', null, null, 'http://image.meiping123.com/upload/20180114/1916496650b11f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1304', '1181073', null, null, 'http://image.meiping123.com/upload/20180114/1916526120c0b4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1305', '1181073', null, null, 'http://image.meiping123.com/upload/20180114/191655928aa40.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1306', '1181074', null, null, 'http://image.meiping123.com/upload/20180114/191852229617cf.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1307', '1181074', null, null, 'http://image.meiping123.com/upload/20180114/19185515fb55a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1308', '1181074', null, null, 'http://image.meiping123.com/upload/20180114/19185690261a40.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1309', '1181075', null, null, 'http://image.meiping123.com/upload/20180114/1920341341eab9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1310', '1181075', null, null, 'http://image.meiping123.com/upload/20180114/192036365feddc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1311', '1181075', null, null, 'http://image.meiping123.com/upload/20180114/1920382768f290.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1312', '1181076', null, null, 'http://image.meiping123.com/upload/20180114/19214727891786.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1313', '1181076', null, null, 'http://image.meiping123.com/upload/20180114/1921498381d923.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1314', '1181076', null, null, 'http://image.meiping123.com/upload/20180114/19215217757319.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1315', '1181076', null, null, 'http://image.meiping123.com/upload/20180114/1921546170f447.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1316', '1181077', null, null, 'http://image.meiping123.com/upload/20180114/192345906ce98b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1317', '1181077', null, null, 'http://image.meiping123.com/upload/20180114/19234854247c7c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1318', '1181077', null, null, 'http://image.meiping123.com/upload/20180114/192350191041f7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1319', '1181077', null, null, 'http://image.meiping123.com/upload/20180114/1923519817b6af.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1320', '1181078', null, null, 'http://image.meiping123.com/upload/20180114/1927194699d6a8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1321', '1181078', null, null, 'http://image.meiping123.com/upload/20180114/192721982ef654.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1322', '1181078', null, null, 'http://image.meiping123.com/upload/20180114/19272365376033.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1323', '1181078', null, null, 'http://image.meiping123.com/upload/20180114/192725540b234b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1324', '1181079', null, null, 'http://image.meiping123.com/upload/20180114/1929041305aa70.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1325', '1181079', null, null, 'http://image.meiping123.com/upload/20180114/1929063937e075.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1326', '1181079', null, null, 'http://image.meiping123.com/upload/20180114/19290893ad588.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1327', '1181080', null, null, 'http://image.meiping123.com/upload/20180114/193112411a8f05.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1328', '1181080', null, null, 'http://image.meiping123.com/upload/20180114/193114481a6106.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1329', '1181080', null, null, 'http://image.meiping123.com/upload/20180114/193116221c67b4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1330', '1181081', null, null, 'http://image.meiping123.com/upload/20180114/193229990013c3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1331', '1181081', null, null, 'http://image.meiping123.com/upload/20180114/19323240770b58.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1332', '1181081', null, null, 'http://image.meiping123.com/upload/20180114/193234216a9a2b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1333', '1181081', null, null, 'http://image.meiping123.com/upload/20180114/19323612239f62.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1362', '1181082', null, null, 'http://image.meiping123.com/upload/20180114/1934113848b93a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1363', '1181082', null, null, 'http://image.meiping123.com/upload/20180114/193409558fdb37.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1364', '1181082', null, null, 'http://image.meiping123.com/upload/20180114/193407129998b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1365', '1181083', null, null, 'http://image.meiping123.com/upload/20180114/1936183888f7ae.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1366', '1181083', null, null, 'http://image.meiping123.com/upload/20180114/1936165313ad65.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1367', '1181083', null, null, 'http://image.meiping123.com/upload/20180114/193611865fb84d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1368', '1181084', null, null, 'http://image.meiping123.com/upload/20180114/193758927456a5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1369', '1181084', null, null, 'http://image.meiping123.com/upload/20180114/193757903b22e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1370', '1181084', null, null, 'http://image.meiping123.com/upload/20180114/19375530786440.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1371', '1181085', null, null, 'http://image.meiping123.com/upload/20180114/19392587587124.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1372', '1181085', null, null, 'http://image.meiping123.com/upload/20180114/1939242454267.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1373', '1181085', null, null, 'http://image.meiping123.com/upload/20180114/193922494a006.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1374', '1181085', null, null, 'http://image.meiping123.com/upload/20180114/19391989759430.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1375', '1181086', null, null, 'http://image.meiping123.com/upload/20180114/194102310ffc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1376', '1181086', null, null, 'http://image.meiping123.com/upload/20180114/1941041334a28c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1377', '1181086', null, null, 'http://image.meiping123.com/upload/20180114/19410592197667.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1378', '1181087', null, null, 'http://image.meiping123.com/upload/20180114/194247899cbf68.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1379', '1181087', null, null, 'http://image.meiping123.com/upload/20180114/19424659f43b8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1380', '1181087', null, null, 'http://image.meiping123.com/upload/20180114/194244426974e8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1381', '1181088', null, null, 'http://image.meiping123.com/upload/20180114/1944417648c237.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1382', '1181088', null, null, 'http://image.meiping123.com/upload/20180114/194440841f8da.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1383', '1181088', null, null, 'http://image.meiping123.com/upload/20180114/19443873890fd.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1384', '1181089', null, null, 'http://image.meiping123.com/upload/20180114/1946086525269d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1385', '1181089', null, null, 'http://image.meiping123.com/upload/20180114/194605973a5e43.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1386', '1181089', null, null, 'http://image.meiping123.com/upload/20180114/1946037342905d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1387', '1181090', null, null, 'http://image.meiping123.com/upload/20180114/1950144556ce92.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1388', '1181090', null, null, 'http://image.meiping123.com/upload/20180114/1950165619c5e0.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1389', '1181090', null, null, 'http://image.meiping123.com/upload/20180114/195018556938df.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1390', '1181090', null, null, 'http://image.meiping123.com/upload/20180114/195020452801ea.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1391', '1181091', null, null, 'http://image.meiping123.com/upload/20180114/195308155d8157.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1392', '1181091', null, null, 'http://image.meiping123.com/upload/20180114/195309880608f5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1393', '1181091', null, null, 'http://image.meiping123.com/upload/20180114/195311798943ce.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1394', '1181092', null, null, 'http://image.meiping123.com/upload/20180114/195511156aa442.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1395', '1181092', null, null, 'http://image.meiping123.com/upload/20180114/1955129574a10a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1396', '1181092', null, null, 'http://image.meiping123.com/upload/20180114/1955149377505f.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1397', '1181093', null, null, 'http://image.meiping123.com/upload/20180114/2001296167c413.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1398', '1181093', null, null, 'http://image.meiping123.com/upload/20180114/2001313938273e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1399', '1181093', null, null, 'http://image.meiping123.com/upload/20180114/2001336583304c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1400', '1181094', null, null, 'http://image.meiping123.com/upload/20180114/2002556692a949.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1401', '1181094', null, null, 'http://image.meiping123.com/upload/20180114/200257924036bc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1402', '1181094', null, null, 'http://image.meiping123.com/upload/20180114/2002598467f7c4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1403', '1181094', null, null, 'http://image.meiping123.com/upload/20180114/2003018662c661.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1404', '1181095', null, null, 'http://image.meiping123.com/upload/20180114/2004428561e0b1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1405', '1181095', null, null, 'http://image.meiping123.com/upload/20180114/200444707e0950.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1406', '1181095', null, null, 'http://image.meiping123.com/upload/20180114/2004467655951c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1407', '1181095', null, null, 'http://image.meiping123.com/upload/20180114/200448965753a8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1408', '1181095', null, null, 'http://image.meiping123.com/upload/20180114/20045131547411.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1410', '1181096', null, null, 'http://image.meiping123.com/upload/20180119/112017481f4f96.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1412', '1181097', null, null, 'http://image.meiping123.com/upload/20180119/1130152420b89b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1413', '1181098', null, null, 'http://image.meiping123.com/upload/20180119/1133081430c9c8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1414', '1181099', null, null, 'http://image.meiping123.com/upload/20180119/113436345700bb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1415', '1181099', null, null, 'http://image.meiping123.com/upload/20180119/1134382341dd94.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1416', '1181099', null, null, 'http://image.meiping123.com/upload/20180119/11344014612cad.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1417', '1181099', null, null, 'http://image.meiping123.com/upload/20180119/11344270194389.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1421', '1181100', null, null, 'http://image.meiping123.com/upload/20180119/1144259137ffdc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1422', '1181100', null, null, 'http://image.meiping123.com/upload/20180119/114423790cc758.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1423', '1181100', null, null, 'http://image.meiping123.com/upload/20180119/11442199c71e4.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1428', '1181101', null, null, 'http://image.meiping123.com/upload/20180119/114615548f67d7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1429', '1181101', null, null, 'http://image.meiping123.com/upload/20180119/114610634adbec.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1430', '1181101', null, null, 'http://image.meiping123.com/upload/20180119/114608336b9fa7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1431', '1181101', null, null, 'http://image.meiping123.com/upload/20180119/114551717e1577.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1432', '1181102', null, null, 'http://image.meiping123.com/upload/20180119/163917377568c7.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1433', '1181102', null, null, 'http://image.meiping123.com/upload/20180119/1639231527cf8a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1434', '1181102', null, null, 'http://image.meiping123.com/upload/20180119/163925255e2fe3.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1435', '1181102', null, null, 'http://image.meiping123.com/upload/20180119/1639275943c77d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1441', '1181103', null, null, 'http://image.meiping123.com/upload/20180119/1640546118b3af.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1442', '1181103', null, null, 'http://image.meiping123.com/upload/20180119/164052699ee908.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1443', '1181103', null, null, 'http://image.meiping123.com/upload/20180119/1640505922b78d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1444', '1181103', null, null, 'http://image.meiping123.com/upload/20180119/164048721efc4d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1445', '1181103', null, null, 'http://image.meiping123.com/upload/20180119/164046443dcc77.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1450', '1181104', null, null, 'http://image.meiping123.com/upload/20180119/16424381783f8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1451', '1181104', null, null, 'http://image.meiping123.com/upload/20180119/16424070961e98.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1452', '1181104', null, null, 'http://image.meiping123.com/upload/20180119/164238898c43f8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1453', '1181104', null, null, 'http://image.meiping123.com/upload/20180119/1642366243479d.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1458', '1181106', null, null, 'http://image.meiping123.com/upload/20180119/1646568968d171.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1459', '1181106', null, null, 'http://image.meiping123.com/upload/20180119/1647071018536c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1460', '1181106', null, null, 'http://image.meiping123.com/upload/20180119/164709221ff9e1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1461', '1181105', null, null, 'http://image.meiping123.com/upload/20180119/1645252685f927.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1462', '1181105', null, null, 'http://image.meiping123.com/upload/20180119/16452396e9a88.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1463', '1181105', null, null, 'http://image.meiping123.com/upload/20180119/1645217892bdb.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1464', '1181105', null, null, 'http://image.meiping123.com/upload/20180119/16451651968146.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1465', '1181107', null, null, 'http://image.meiping123.com/upload/20180119/16503450036666.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1466', '1181107', null, null, 'http://image.meiping123.com/upload/20180119/165036614d1739.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1467', '1181107', null, null, 'http://image.meiping123.com/upload/20180119/165038786a5a90.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1468', '1181108', null, null, 'http://image.meiping123.com/upload/20180119/16515264577577.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1469', '1181109', null, null, 'http://image.meiping123.com/upload/20180119/165342137c0e30.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1470', '1181109', null, null, 'http://image.meiping123.com/upload/20180119/16534431012fdc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1471', '1181110', null, null, 'http://image.meiping123.com/upload/20180119/1655115402982b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1472', '1181110', null, null, 'http://image.meiping123.com/upload/20180119/165513460f7f16.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1473', '1181111', null, null, 'http://image.meiping123.com/upload/20180119/165657159e8e42.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1474', '1181111', null, null, 'http://image.meiping123.com/upload/20180119/165659385458f9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1475', '1181111', null, null, 'http://image.meiping123.com/upload/20180119/16570116162d47.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1476', '1181112', null, null, 'http://image.meiping123.com/upload/20180119/165830362ad425.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1477', '1181112', null, null, 'http://image.meiping123.com/upload/20180119/16583244013375.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1478', '1181112', null, null, 'http://image.meiping123.com/upload/20180119/16583418343365.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1479', '1181113', null, null, 'http://image.meiping123.com/upload/20180119/170040485c5b8.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1480', '1181114', null, null, 'http://image.meiping123.com/upload/20180119/170147793f09b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1481', '1181115', null, null, 'http://image.meiping123.com/upload/20180119/170507255ace9.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1482', '1181115', null, null, 'http://image.meiping123.com/upload/20180119/170510326d75c2.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1483', '1181116', null, null, 'http://image.meiping123.com/upload/20180119/170544323f9f5e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1484', '1181116', null, null, 'http://image.meiping123.com/upload/20180119/17054644346f8a.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1485', '1181116', null, null, 'http://image.meiping123.com/upload/20180119/1705483865910c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1501', '1181117', null, null, 'http://image.meiping123.com/upload/20180206/1806222363b9ed.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1502', '1181117', null, null, 'http://image.meiping123.com/upload/20180206/1806239109b77e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1503', '1181117', null, null, 'http://image.meiping123.com/upload/20180206/18062624e555.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1546', '1181118', null, null, 'http://image.meiping123.com/upload/20180209/16291680678623.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1547', '1181118', null, null, 'http://image.meiping123.com/upload/20180209/1629188797c18c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1548', '1181118', null, null, 'http://image.meiping123.com/upload/20180209/162920709fb5c1.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1558', '1181119', null, null, 'http://image.meiping123.com/upload/20180209/163457863a6aef.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1559', '1181119', null, null, 'http://image.meiping123.com/upload/20180209/163459670eb492.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1560', '1181119', null, null, 'http://image.meiping123.com/upload/20180209/163501470ea82e.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1561', '1181120', null, null, 'http://image.meiping123.com/upload/20180305/132824301fcc5b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1562', '1181120', null, null, 'http://image.meiping123.com/upload/20180305/13282626670a9c.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1563', '1181120', null, null, 'http://image.meiping123.com/upload/20180305/13282814539635.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1567', '1181121', null, null, 'http://image.meiping123.com/upload/20180305/133013649bb6dc.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1568', '1181121', null, null, 'http://image.meiping123.com/upload/20180305/133015765b4c59.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1569', '1181121', null, null, 'http://image.meiping123.com/upload/20180305/133018932fdf0b.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1576', '1181012', null, null, 'http://image.meiping123.com/upload/20171229/1511552861edd5.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1577', '1181012', null, null, 'http://image.meiping123.com/upload/20171229/151157413c4573.jpg');
INSERT INTO `mall_goods_gallery` VALUES ('1578', '1181012', null, null, 'http://image.meiping123.com/upload/20171229/151159412404ae.jpg');

-- ----------------------------
-- Table structure for mall_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_group`;
CREATE TABLE `mall_goods_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '团购主题',
  `item_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动条例图片',
  `abbr_pic_url` varchar(100) DEFAULT NULL COMMENT '简略图片',
  `launch_num` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `min_open_group` int(4) DEFAULT NULL,
  `subtitle` varchar(255) NOT NULL,
  `retail_min_price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `open_time` datetime DEFAULT NULL COMMENT '开团时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `open_status` int(4) DEFAULT NULL COMMENT '状态 1开团中 2过期 3失效',
  `ad_desc` varchar(255) DEFAULT NULL COMMENT '广告语',
  `valid_days` int(4) DEFAULT NULL COMMENT '开团有效期',
  KEY `topic_id` (`id`),
  KEY `group_goods_id_index` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-团购设置';

-- ----------------------------
-- Records of mall_goods_group
-- ----------------------------
INSERT INTO `mall_goods_group` VALUES ('313', '卫衣测试卫衣测试', 'https://yanxuan.nosdn.127.net/14942996754171334.jpg', 'http://image.meiping123.com/upload/20171220/23545572fa233.png', '1', '1181001', '5', '9', '卫衣测试卫衣测试', '0.10', '2017-10-01 10:58:43', '2018-11-08 00:00:00', '1', '测试广告语', '30');
INSERT INTO `mall_goods_group` VALUES ('295', '白萝卜', 'https://yanxuan.nosdn.127.net/14938092956370380.jpg', 'http://image.meiping123.com/upload/20171220/23545572fa233.png', '1', '1181013', '2', '2', '槟榔芋', '50.00', '2017-10-01 10:58:43', '2018-11-01 10:58:43', '1', '测试广告语', '30');
INSERT INTO `mall_goods_group` VALUES ('316', '金龙鱼清香玉米油4L团购优惠', 'http://image.meiping123.com/upload/20180202/180634944ebe23.jpg', 'http://image.meiping123.com/upload/20180202/180651476bf393.jpg', '10', '1181121', '1', '2', '金龙鱼清香玉米油4L', '8.00', '2018-02-02 00:00:00', '2018-03-02 00:00:00', '1', '金龙鱼清香玉米油4L优惠大酬宾', '30');

-- ----------------------------
-- Table structure for mall_goods_group_open
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_group_open`;
CREATE TABLE `mall_goods_group_open` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL COMMENT '开团Id',
  `user_id` bigint(20) NOT NULL COMMENT '开团人',
  `open_time` datetime NOT NULL COMMENT '参团时间',
  `end_time` datetime DEFAULT NULL,
  `attend_status` int(4) NOT NULL COMMENT '参团状态 0待付款  1拼团中 2拼团成功 3拼团失败',
  `attend_num` int(4) DEFAULT NULL COMMENT '当前参团人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商城-开团信息';

-- ----------------------------
-- Records of mall_goods_group_open
-- ----------------------------
INSERT INTO `mall_goods_group_open` VALUES ('7', '313', '16', '2017-10-31 16:55:31', '2017-11-30 16:55:31', '1', '4');
INSERT INTO `mall_goods_group_open` VALUES ('8', '300', '28', '2017-10-31 17:58:46', '2017-11-30 17:58:46', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('9', '313', '18', '2017-11-04 17:40:02', '2017-12-04 17:40:02', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('10', '313', '18', '2017-11-05 12:41:46', '2017-12-05 12:41:46', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('11', '313', '28', '2017-11-06 16:25:06', '2017-12-06 16:25:06', '1', '1');
INSERT INTO `mall_goods_group_open` VALUES ('12', '300', '15', '2017-11-06 17:15:16', '2017-12-06 17:15:16', '1', '1');
INSERT INTO `mall_goods_group_open` VALUES ('13', '313', '18', '2017-11-08 17:11:53', '2017-12-08 17:11:53', '1', '1');
INSERT INTO `mall_goods_group_open` VALUES ('14', '313', '18', '2017-11-17 22:19:42', '2017-12-17 22:19:42', '1', '1');
INSERT INTO `mall_goods_group_open` VALUES ('15', '313', '18', '2017-11-21 22:15:01', '2017-12-21 22:15:01', '1', '1');
INSERT INTO `mall_goods_group_open` VALUES ('16', '300', '68', '2018-01-08 08:46:53', '2018-02-07 08:46:53', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('17', '295', '64', '2018-01-18 10:21:21', '2018-02-17 10:21:21', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('18', '300', '64', '2018-01-18 10:21:56', '2018-02-17 10:21:56', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('19', '300', '64', '2018-01-18 10:22:22', '2018-02-17 10:22:22', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('20', '300', '64', '2018-01-18 10:23:48', '2018-02-17 10:23:48', '0', '0');
INSERT INTO `mall_goods_group_open` VALUES ('22', '300', '15', '2018-01-24 16:12:31', '2018-02-23 16:12:31', '2', '2');
INSERT INTO `mall_goods_group_open` VALUES ('23', '300', '15', '2018-04-16 13:48:57', '2018-05-16 13:48:57', '1', '1');
INSERT INTO `mall_goods_group_open` VALUES ('24', '299', '88', '2018-04-19 11:56:48', '2018-05-19 11:56:48', '0', '0');

-- ----------------------------
-- Table structure for mall_goods_group_open_detail
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_group_open_detail`;
CREATE TABLE `mall_goods_group_open_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `open_id` bigint(20) NOT NULL COMMENT '开团Id',
  `user_id` bigint(20) NOT NULL,
  `attend_time` datetime NOT NULL COMMENT '参团时间',
  `attend_status` int(2) NOT NULL COMMENT '参团状态 0待付款  1拼团中 2拼团成功 3拼团失败',
  `form_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表单提交formId',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商城-团购记录';

-- ----------------------------
-- Records of mall_goods_group_open_detail
-- ----------------------------
INSERT INTO `mall_goods_group_open_detail` VALUES ('6', '7', '16', '2017-10-31 16:55:31', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('7', '7', '15', '2017-10-31 17:37:10', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('8', '8', '28', '2017-10-31 17:58:46', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('9', '8', '28', '2017-10-31 17:59:55', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('10', '9', '18', '2017-11-04 17:40:02', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('11', '9', '18', '2017-11-04 17:40:55', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('12', '10', '18', '2017-11-05 12:41:46', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('13', '11', '28', '2017-11-06 16:25:06', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('14', '12', '15', '2017-11-06 17:15:16', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('15', '7', '15', '2017-11-07 15:31:43', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('16', '7', '28', '2017-11-07 16:12:31', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('17', '13', '18', '2017-11-08 17:11:53', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('18', '14', '18', '2017-11-17 22:19:42', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('19', '15', '18', '2017-11-21 22:15:01', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('20', '11', '28', '2017-11-29 11:06:03', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('21', '16', '68', '2018-01-08 08:46:53', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('22', '17', '64', '2018-01-18 10:21:21', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('23', '18', '64', '2018-01-18 10:21:56', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('24', '19', '64', '2018-01-18 10:22:22', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('25', '20', '64', '2018-01-18 10:23:48', '0', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('27', '22', '15', '2018-01-24 16:12:32', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('28', '22', '38', '2018-01-24 17:10:23', '2', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('29', '23', '15', '2018-04-16 13:48:57', '1', null);
INSERT INTO `mall_goods_group_open_detail` VALUES ('30', '24', '88', '2018-04-19 11:56:49', '0', null);

-- ----------------------------
-- Table structure for mall_goods_issue
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_issue`;
CREATE TABLE `mall_goods_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商城-问题列表';

-- ----------------------------
-- Records of mall_goods_issue
-- ----------------------------
INSERT INTO `mall_goods_issue` VALUES ('1', '购买运费如何收取？', '单笔订单金额（不含运费）满88元免邮费；不满88元，每单收取10元运费。\n(港澳台地区需满');
INSERT INTO `mall_goods_issue` VALUES ('2', '使用什么快递发货？', '严选默认使用顺丰快递发货（个别商品使用其他快递），配送范围覆盖全国大部分地区（港澳台地区除');
INSERT INTO `mall_goods_issue` VALUES ('3', '如何申请退货？', '1.自收到商品之日起30日内，顾客可申请无忧退货，退款将原路返还，不同的银行处理时间不同，');
INSERT INTO `mall_goods_issue` VALUES ('4', '如何开具发票？', '1.如需开具普通发票，请在下单时选择“我要开发票”并填写相关信息（APP仅限2.4.0及以');

-- ----------------------------
-- Table structure for mall_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_specification`;
CREATE TABLE `mall_goods_specification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `specification_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` varchar(50) DEFAULT '',
  `pic_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `specification_id` (`specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品对应规格表值';

-- ----------------------------
-- Records of mall_goods_specification
-- ----------------------------
INSERT INTO `mall_goods_specification` VALUES ('27', '1181010', '1', '22.5', null);
INSERT INTO `mall_goods_specification` VALUES ('39', '1181011', '1', '24', null);
INSERT INTO `mall_goods_specification` VALUES ('71', '1181012', '1', '红色', null);
INSERT INTO `mall_goods_specification` VALUES ('72', '1181013', '1', '900g', null);
INSERT INTO `mall_goods_specification` VALUES ('239', '1181121', '1', '箱', null);

-- ----------------------------
-- Table structure for mall_help_issue
-- ----------------------------
DROP TABLE IF EXISTS `mall_help_issue`;
CREATE TABLE `mall_help_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '问题分类',
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='商城-问题列表';

-- ----------------------------
-- Records of mall_help_issue
-- ----------------------------
INSERT INTO `mall_help_issue` VALUES ('1', '1', 'Q1: 24小时配送吗？', '商品配送到户时间为：7:30-21:00。晚上20:30后下单，次日指定时间送达。', '1');
INSERT INTO `mall_help_issue` VALUES ('2', '1', 'Q2: 活虾送到家还能活吗？', '采用特殊保温装置确保经短途运输虾能保持最大活度，美平保证商品的新鲜度，力争做到虾称量时100%是活的，但受商品自身特性影响，美平并不保证送达时每只虾都是活的。', '2');
INSERT INTO `mall_help_issue` VALUES ('3', '1', 'Q3: 我提交订单后想更换地址可以吗？', '如您的新地址在同一站点的配送范围，您可以致电客服热线申请更改地址，但配送时间需要相应调整；如您的新地址不在同一站点配送范围，则您的订单将被取消。', '3');
INSERT INTO `mall_help_issue` VALUES ('4', '1', 'Q4: 你们30分钟一定会送到吗？', '致力为您提供最佳购物体验，绝大部分订单将在您完成支付后30分钟左右送达您府上；高峰期或者恶劣天气等特殊情况配送时间可能需要延长一些，美平程序平台上会有相应提示，您可以根据个人需要进行选择。因配送时间受同一时间订单数量、订单商品数量、距离、交通、天气及车辆故障等意外事件影响，有时配送时间会超过您选择的送达时间，对此美平将尽可能提前告知，但目前美平暂时无法实现所有订单30分钟必达，也暂不能做到每个订单都提前告知送达时间延后。', '4');
INSERT INTO `mall_help_issue` VALUES ('5', '1', 'Q5: 几分钟可以送达？', '一般30分钟送达。如遇天气、高峰时段等特殊情况，会另做通知。', '5');
INSERT INTO `mall_help_issue` VALUES ('6', '1', 'Q6: 冰淇淋是不是也能送？', '可以，采用特殊保温装置确保冰淇淋极速送达您府上时仍保持最佳商品品质，请您放心。', '6');
INSERT INTO `mall_help_issue` VALUES ('7', '1', 'Q7: 需要配送费吗？', '订单金额满88元人民币免配送费，订单金额不足88元人民币，则需要支付相应配送费。', '7');
INSERT INTO `mall_help_issue` VALUES ('8', '1', 'Q8: 是不是所有地方都有送啊？', '非常抱歉，目前我们是根据城市的注册用户数逐步开放配送服务，非常感谢您的支持，也欢迎您帮我们多多宣传，争取早日开始为大家提供配送服务，谢谢您！', '8');
INSERT INTO `mall_help_issue` VALUES ('9', '2', 'Q1: 你们的鱼新鲜吗？', '保证所有活鲜商品在称量时是鲜活的，您可以根据需求处理或无需预处理。', null);
INSERT INTO `mall_help_issue` VALUES ('10', '2', 'Q2: 果蔬是不是会有农药超标？', '会对农产品进行严格的检测，确保果蔬的质量安全。', null);
INSERT INTO `mall_help_issue` VALUES ('11', '2', 'Q3: 你们的产品新鲜吗？', '严格管理商品采购源头、严格管理商品保质期、水果、蔬菜均在冷库保存，配送采用特殊保温设备等确保商品质量，您可以放心选购。', null);
INSERT INTO `mall_help_issue` VALUES ('12', '2', 'Q4:有发票吗？', '我们是正规的公司行为，可以给您开正式发票的，不过需要您下单的时候，留言给我们，不要忘记哦。', null);
INSERT INTO `mall_help_issue` VALUES ('13', '2', 'Q5: 你们的产品会有假货吗？', '商品均是直接由生产厂家、有资质及良好声誉的供应商提供，或由美平直接从原产地采购。美平保证所有商品品质优良、保证所有商品均是正品，假一罚十，欢迎监督。', null);
INSERT INTO `mall_help_issue` VALUES ('14', '3', 'Q1: 优惠券怎么使用？', '优惠券设有消费限额，下单时满足使用条件即可抵扣商品金额。优惠券不能抵配送费，一个订单只能使用一张优惠券。不同方式获得的优惠券有指定的使用规则，使用过程中请仔细阅读优惠券使用说明。', null);
INSERT INTO `mall_help_issue` VALUES ('15', '3', 'Q2: 退货时优惠券可以退吗？', '优惠券一旦使用成功将无法退回，且不找零、不兑现；使用优惠券支付的订单，如发生退货，退款按照实际结算金额退款，优惠券不予兑现且不返还。', null);
INSERT INTO `mall_help_issue` VALUES ('16', '3', 'Q3: 优惠券可以开发票吗？', '优惠券中的优惠金额不开具发票。', null);
INSERT INTO `mall_help_issue` VALUES ('17', '3', 'Q4: 我忘了支付了，可以重新支付吗？', '您可以在提交订单后15分钟内前往“我的”账户中“待付款”栏选择需要付款的订单进行支付，预期订单将自动作废，如有需要商品则需重新提交订单。', null);
INSERT INTO `mall_help_issue` VALUES ('18', '3', 'Q5: 怎么领取优惠券？', '成功注册超市用户账号即可领取新人专享优惠券；领取成功的优惠券可在【我的—优惠券】查看。', null);
INSERT INTO `mall_help_issue` VALUES ('19', '3', 'Q6: 可以货到付款吗，可以用微信支付吗？', '目前暂不支持货到付款方式，您可以使用微信支付。', null);
INSERT INTO `mall_help_issue` VALUES ('20', '4', 'Q1: 发票可以累计开吗？', '发票可以累计开，您可以申请开票的时候选择您要开的多个订单即可，一般可以开2个月内的发票。', null);
INSERT INTO `mall_help_issue` VALUES ('21', '4', 'Q2: 购买的是食品，可以开日用品发票吗？', '发票开具的明细必须与您订单购买的商品一致，按实际购买商品种类开具发票。', null);
INSERT INTO `mall_help_issue` VALUES ('22', '4', 'Q3：为什么申请不了发票？', '请刷新一下你的程序，在您的订单签收成功后，可以申请开具电子发票。', null);
INSERT INTO `mall_help_issue` VALUES ('23', '4', 'Q4: 可以提供纸质发票吗？', '目前美平只支持开具电子发票，电子发票与纸质发票具有相同法律效力，如需报销，可将电子文档进行打印。', null);
INSERT INTO `mall_help_issue` VALUES ('24', '4', 'Q5: 如何申请开发票？', '可以在订单签收后进入小程序【我的】—【发票与报销】—【开具电子发票】，然后选择您要申请开发票订单，填写发票抬头与查收电子发票的邮箱即可，可多个订单合并开具发票。', null);
INSERT INTO `mall_help_issue` VALUES ('25', '5', 'Q1: 为什么我找不到我的小区？', '为保证商品品质并避免您长时间等候，目前配送范围仅限配送点半径2公里左右范围，我们将加紧站点建设，不断扩大服务范围。', null);
INSERT INTO `mall_help_issue` VALUES ('26', '5', 'Q2: 需要设置密码吗？', '目前无需设置密码，但您必须输入手机验证码。', null);
INSERT INTO `mall_help_issue` VALUES ('27', '6', 'Q1: 退款需要多久到账？', '符合退款条件的申请，将在1个工作日内完成操作，实际到款时间为1-3个工作日，具体视不同银行规定实行。', null);
INSERT INTO `mall_help_issue` VALUES ('28', '6', 'Q2: 配送员走了才发现东西少了能不能补啊？', '商品一旦完成交接，恕不受理事后数量短少问题，请务必与配送员当场核对所订购商品。', null);
INSERT INTO `mall_help_issue` VALUES ('29', '6', 'Q3: 付款后我不要了可以吗？', '非定制或预售商品在商品送出前您可以致电客服热线要求取消，商品送出后非商品质量问题由顾客发起的退换货行为，需要由顾客自行承担退换货运费；定制或预售商品非质量问题恕不接受退换货。水果、蔬菜、肉制品、饮料等食品、个人洗护计生用品、贴身用品不享受7天无理由退换货，具体见退换货政策。', null);
INSERT INTO `mall_help_issue` VALUES ('30', '6', 'Q4: 接收时发现东西破损、短少、错误或者有质量问题怎么办？', '您可以当场向配送员或拨打客服热线提出拒绝接收商品、补足商品、更换或退款。Q5: 退换货需要支付配送费吗？因非商品质量问题由顾客发起的退换货行为，需由顾客自行承担退换货运费。', null);
INSERT INTO `mall_help_issue` VALUES ('31', '6', 'Q7: 退款是退到哪个账户？', '一般是原路返回。', null);

-- ----------------------------
-- Table structure for mall_help_type
-- ----------------------------
DROP TABLE IF EXISTS `mall_help_type`;
CREATE TABLE `mall_help_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL COMMENT '问题分类',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商城-问题分类';

-- ----------------------------
-- Records of mall_help_type
-- ----------------------------
INSERT INTO `mall_help_type` VALUES ('1', '配送问题', '1');
INSERT INTO `mall_help_type` VALUES ('2', '商品问题', '2');
INSERT INTO `mall_help_type` VALUES ('3', '支付问题', '3');
INSERT INTO `mall_help_type` VALUES ('4', '发票问题', '4');
INSERT INTO `mall_help_type` VALUES ('5', '账户问题', '5');
INSERT INTO `mall_help_type` VALUES ('6', '售后问题', '6');

-- ----------------------------
-- Table structure for mall_keywords
-- ----------------------------
DROP TABLE IF EXISTS `mall_keywords`;
CREATE TABLE `mall_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '热销',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `scheme_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词的跳转链接',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商城-热闹关键词表';

-- ----------------------------
-- Records of mall_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_type` varchar(1) DEFAULT NULL COMMENT '订单类型 1普通订单 2团购订单 3砍价订单',
  `order_sn` varchar(32) DEFAULT '',
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `order_status` int(3) unsigned DEFAULT '0' COMMENT '    订单状态',
  `pay_status` tinyint(1) unsigned DEFAULT '0' COMMENT '付款状态 支付状态;0未付款;1付款中;2已付款;4退款',
  `pay_id` varchar(64) DEFAULT '0',
  `pay_name` varchar(120) DEFAULT '' COMMENT '付款时间',
  `pay_time` datetime DEFAULT NULL,
  `shipping_status` tinyint(1) unsigned DEFAULT '0' COMMENT '发货状态 商品配送情况;0未发货,1已发货,2已收货,4退货',
  `shipping_id` int(3) DEFAULT '0' COMMENT '配送员',
  `shipping_name` varchar(120) DEFAULT '' COMMENT '配送员名称',
  `shipping_mobile` varchar(255) DEFAULT NULL COMMENT '配送员手机',
  `shipping_fee` decimal(10,2) DEFAULT '0.00',
  `shipping_no` int(11) DEFAULT NULL COMMENT '配送单号，rider_order表id',
  `consignee` varchar(60) DEFAULT '' COMMENT '收货人',
  `mobile` varchar(60) DEFAULT '',
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT '',
  `address_id` int(11) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT '' COMMENT '补充说明',
  `actual_price` decimal(10,2) DEFAULT '0.00' COMMENT '实际需要支付的金额',
  `integral` int(10) unsigned DEFAULT '0' COMMENT '积分',
  `integral_money` decimal(10,2) DEFAULT '0.00' COMMENT '积分抵扣金额',
  `order_price` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品总价',
  `add_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '订单确认时间',
  `freight_price` int(10) unsigned DEFAULT '0' COMMENT '配送费用，废弃',
  `parent_id` mediumint(8) unsigned DEFAULT '0' COMMENT '父订单，废弃',
  `coupon_id` mediumint(8) unsigned DEFAULT '0' COMMENT '使用的优惠券id',
  `coupon_name` varchar(100) DEFAULT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠金额',
  `callback_status` enum('true','false') DEFAULT 'true' COMMENT '废弃',
  `full_cut_price` decimal(10,2) DEFAULT NULL COMMENT '满减费用',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动Id',
  `store_id` int(11) DEFAULT NULL COMMENT '门店Id',
  `delivery_date` datetime DEFAULT NULL COMMENT '送达日期',
  `delivery_remark` varchar(20) DEFAULT NULL COMMENT '送到说明',
  `predict_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-订单';

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES ('8', '1', '20180105134805402157759', '18', '201', '2', 'wx20180105134854f447f149fc0288693917', null, '2018-01-05 13:49:00', '0', '0', '', null, '0.00', null, 'aa', '18888888888', null, '福建省', '福州', '市', '平潭县政府路14(平潭县政府)', '69', '', '609.00', '0', '0.00', '629.00', '629.00', '2018-01-05 13:48:05', null, '0', null, '0', '', '0.00', 'true', '20.00', null, null, '2018-01-05 13:48:05', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('13', '1', '20180109164402345175905', '15', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, '夏利', '12341421145', null, '福建省', '福州', '市', '平潭县东门庄50号E区7号(阿瓦山寨(平潭店))', '68', '', '70.00', '0', '0.00', '70.00', '60.00', '2018-01-09 16:44:02', null, '10', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-01-09 16:44:02', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('17', '1', '20180118101819589559863', '64', '101', '1', 'wx201801181019108cbf8850ea0442564510', null, null, '0', '0', '', null, '0.00', null, '游高远', '18659121001', null, '福建省', '福州', '市', '平潭县潭城镇桂山路235号(平潭县海滨小学)', '80', '', '20.00', '0', '0.00', '20.00', '10.00', '2018-01-18 10:18:19', null, '10', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-01-18 10:18:20', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('36', '1', '20180210120729346258257', '15', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, '夏利', '12341421145', null, '福建省', '福州', '市', '平潭县东门庄50号E区7号(阿瓦山寨(平潭店))', '68', '', '180.00', '0', '0.00', '200.00', '200.00', '2018-02-10 11:07:22', null, '0', null, '0', '', '0.00', 'true', '20.00', null, '5', '2018-02-10 12:07:29', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('43', '1', '20180305143005407712028', '64', '301', '2', 'wx20180305143007e1acc005760529965491', null, '2018-03-05 14:30:13', '2', '0', '', null, '0.00', null, '游高远', '18659121001', null, '福建省', '福州', '市', '平潭县潭城镇桂山路235号(平潭县海滨小学)', '80', '', '144.00', '0', '0.00', '144.00', '144.00', '2018-03-05 14:30:05', '2018-03-05 14:44:54', '0', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-03-05 14:30:05', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('56', '1', '20180309095359926178455', '64', '201', '2', 'wx2018030909540265828c41190047267177', null, '2018-03-09 09:54:09', '0', '0', '', null, '0.00', null, '游高远', '18659121001', null, '福建省', '福州', '市', '平潭县潭城镇桂山路235号(平潭县海滨小学)', '80', '', '72.00', '0', '0.00', '72.00', '72.00', '2018-03-09 09:53:59', null, '0', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-03-09 09:54:00', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('57', '1', '20180325140402260751673', '18', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, 'aa', '18888888888', null, '福建省', '福州', '市', '平潭县政府路14(平潭县政府)', '69', '', '130.00', '0', '0.00', '130.00', '130.00', '2018-03-25 14:04:02', null, '0', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-03-25 14:04:02', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('58', '1', '20180325140809955250112', '18', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, 'aa', '18888888888', null, '福建省', '福州', '市', '平潭县政府路14(平潭县政府)', '69', '999', '150.00', '0', '0.00', '170.00', '170.00', '2018-03-25 14:08:09', null, '0', null, '0', '', '0.00', 'true', '20.00', null, '8', '2018-03-25 14:08:10', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('59', '1', '20180325141926557677821', '18', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, 'aa', '18888888888', null, '福建省', '福州', '市', '平潭县政府路14(平潭县政府)', '69', '', '182.00', '0', '0.00', '202.00', '202.00', '2018-03-25 14:19:26', null, '0', null, '0', '', '0.00', 'true', '20.00', null, '8', '2018-03-25 00:00:00', '14:30-15:00', null);
INSERT INTO `mall_order` VALUES ('60', '1', '20180326091435557150697', '18', '201', '2', 'wx20180326091436841ae735f90214944690', null, '2018-03-26 09:14:44', '0', '0', '', null, '0.00', null, 'aa', '18888888888', null, '福建省', '福州', '市', '平潭县政府路14(平潭县政府)', '69', '', '54.00', '0', '0.00', '54.00', '44.00', '2018-03-26 09:14:35', null, '10', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-03-26 09:14:36', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('61', '1', '20180326183210757306326', '15', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, '夏利', '12341421145', null, '福建省', '福州', '市', '平潭县东门庄50号E区7号(阿瓦山寨(平潭店))', '68', '', '90.00', '0', '0.00', '100.00', '100.00', '2018-03-26 18:32:09', null, '0', null, '0', '', '0.00', 'true', '10.00', null, '8', '2018-03-26 18:32:11', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('62', '1', '20180328130049102006354', '18', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, 'aa', '18888888888', null, '福建省', '福州', '市', '平潭县政府路14(平潭县政府)', '69', '', '974.00', '0', '0.00', '562.00', '562.00', '2018-03-28 13:00:49', null, '0', null, '0', '', '0.00', 'true', '-412.00', null, '8', '2018-03-28 13:00:49', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('63', '1', '20180328130817993256725', '18', '101', '1', 'wx20180328130819f74e56b0ec0338966000', null, null, '0', '0', '', null, '0.00', null, 'aa', '18888888888', null, '福建省', '福州', '市', '平潭县政府路14(平潭县政府)', '69', '', '64.00', '0', '0.00', '64.00', '54.00', '2018-03-28 13:08:17', null, '10', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-03-28 13:08:18', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('64', '1', '20180416115124390825718', '15', '201', '2', 'wx16115126411710080608a4021496729147', null, '2018-04-16 11:51:38', '0', '0', '', null, '0.00', null, '夏利', '12341421145', null, '福建省', '福州', '市', '平潭县东门庄50号E区7号(阿瓦山寨(平潭店))', '68', '', '40.00', '0', '0.00', '40.00', '30.00', '2018-04-16 11:51:24', null, '10', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-04-16 11:51:24', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('65', '1', '20180416120035529913885', '23', '201', '2', 'wx161200376060047c4c4e04e81425924328', null, '2018-04-16 12:00:49', '0', '0', '', null, '0.00', null, '李鹏军', '15209831990', '340104', '安徽省', '合肥市', '蜀山区', '肥西路与望江西路交叉口汽修小区', '83', '', '20.00', '0', '0.00', '20.00', '10.00', '2018-04-16 12:00:35', null, '10', null, '0', '', '0.00', 'true', '0.00', null, '8', '2018-04-16 12:00:36', '尽快送达', null);
INSERT INTO `mall_order` VALUES ('66', '2', '20180416134856634993540', '15', '101', '2', 'wx161405087231577d35d1171b0894165921', null, '2018-04-16 14:05:23', '0', '0', '', null, '0.00', null, '夏利', '12341421145', null, '福建省', '福州', '市', '平潭县东门庄50号E区7号(阿瓦山寨(平潭店))', '68', '', '1499.00', '0', '0.00', '1499.00', '1499.00', '2018-04-16 13:48:56', null, '0', null, null, null, null, 'true', null, '29', '8', null, null, null);
INSERT INTO `mall_order` VALUES ('68', '2', '20180419112723684116062', '88', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, '张三', '020-81167888', '510000', '广东省', '广州市', '海珠区', '新港中路397号', '85', '', '12.00', '0', '0.00', '12.00', '12.00', '2018-04-19 11:27:19', null, '0', null, null, null, null, 'true', null, '58', '8', null, null, null);
INSERT INTO `mall_order` VALUES ('69', '2', '20180419115648558965461', '88', '101', '0', null, null, null, '0', '0', '', null, '0.00', null, '张三', '020-81167888', '510000', '广东省', '广州市', '海珠区', '新港中路397号', '85', '', '39.00', '0', '0.00', '39.00', '39.00', '2018-04-19 11:56:44', null, '0', null, null, null, null, 'true', null, '30', '8', null, null, null);

-- ----------------------------
-- Table structure for mall_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_order_goods`;
CREATE TABLE `mall_order_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单Id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品序列号',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品Id',
  `number` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '零售价格',
  `goods_specification_name_value` text COMMENT '商品规格详情',
  `is_real` tinyint(1) unsigned DEFAULT '0' COMMENT '虚拟商品',
  `goods_specification_ids` varchar(255) DEFAULT '' COMMENT '商品规格Ids',
  `list_pic_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-订单商品明细';

-- ----------------------------
-- Records of mall_order_goods
-- ----------------------------
INSERT INTO `mall_order_goods` VALUES ('16', '8', '1181037', '莲藕 约750g±30g/份', '122926', '352', '3', '10.00', '10.00', '750g', null, '94', 'http://image.meiping123.com/upload/20171229/165536747d5c4b.jpg');
INSERT INTO `mall_order_goods` VALUES ('22', '13', '1181042', '美人椒 约200g±20g/份', '122930', '364', '6', '10.00', '10.00', '200g', null, '106', 'http://image.meiping123.com/upload/20171229/1702589526ce44.jpg');
INSERT INTO `mall_order_goods` VALUES ('31', '17', '1181069', '金龙鱼阳光葵花油900ml', '130127', '405', '1', '10.00', '10.00', '900ml', null, '147', 'http://image.meiping123.com/upload/20180111/200523333d7ed0.jpg');
INSERT INTO `mall_order_goods` VALUES ('73', '36', '1181007', '测试', '00018', '262', '2', '200.00', '100.00', null, null, null, '');
INSERT INTO `mall_order_goods` VALUES ('91', '43', '1181121', '安慕希风味酸奶草莓味205g*12瓶', '11001', '497', '2', '75.00', '72.00', '箱', null, '239', 'http://image.meiping123.com/upload/20180305/133004370b0a44.jpg');
INSERT INTO `mall_order_goods` VALUES ('95', '56', '1181120', '特仑苏低脂牛奶250ml*12瓶', '11001', '496', '1', '75.00', '72.00', '箱', null, '238', 'http://image.meiping123.com/upload/20180305/13280096199563.jpg');
INSERT INTO `mall_order_goods` VALUES ('96', '57', '1181034', '韭黄 约200g±10g/份', '122923', '349', '1', '10.00', '10.00', '200g', null, '91', 'http://image.meiping123.com/upload/20171229/165059101cda14.jpg');
INSERT INTO `mall_order_goods` VALUES ('97', '57', '1181011', '德芙 脆香米奶香白巧克力24g', '10080010002', '297', '2', '20.00', '15.00', '24', null, '39', 'http://image.meiping123.com/upload/20171228/17303247952d7c.jpg');
INSERT INTO `mall_order_goods` VALUES ('98', '57', '1181111', '味事达极鲜380ml', '011916', '465', '1', '10.00', '10.00', '380ml', null, '207', 'http://image.meiping123.com/upload/20180119/165649915659a3.jpg');
INSERT INTO `mall_order_goods` VALUES ('99', '57', '1181031', '茭白 约300g±30g/份', '122920', '346', '1', '10.00', '10.00', '300g', null, '88', 'http://image.meiping123.com/upload/20171229/16464670947919.jpg');
INSERT INTO `mall_order_goods` VALUES ('100', '57', '1181033', '韭菜花 约350g±30g/份', '122922', '348', '1', '10.00', '10.00', '350g', null, '90', 'http://image.meiping123.com/upload/20171229/164933509a579f.jpg');
INSERT INTO `mall_order_goods` VALUES ('101', '57', '1181036', '苦瓜 约750g±30g/份', '122925', '351', '1', '10.00', '10.00', '750g', null, '93', 'http://image.meiping123.com/upload/20171229/1654014065df04.jpg');
INSERT INTO `mall_order_goods` VALUES ('102', '57', '1181029', '西兰花 约560g±50g/份', '122918', '366', '1', '10.00', '10.00', '1400g', null, '108', 'http://image.meiping123.com/upload/20171229/164359781ee921.jpg');
INSERT INTO `mall_order_goods` VALUES ('103', '57', '1181032', '芥菜 约450g±30g/份', '122921', '347', '1', '10.00', '10.00', '450g', null, '89', 'http://image.meiping123.com/upload/20171229/164813915d0e45.jpg');
INSERT INTO `mall_order_goods` VALUES ('104', '57', '1181035', '空心菜 约900g±50g/份', '122924', '350', '1', '10.00', '10.00', '900g', null, '92', 'http://image.meiping123.com/upload/20171229/1652497082814a.jpg');
INSERT INTO `mall_order_goods` VALUES ('105', '57', '1181037', '莲藕 约750g±30g/份', '122926', '352', '2', '10.00', '10.00', '750g', null, '94', 'http://image.meiping123.com/upload/20171229/165536747d5c4b.jpg');
INSERT INTO `mall_order_goods` VALUES ('106', '58', '1181039', '毛山药 约500g±50g/份', '122928', '356', '4', '10.00', '10.00', '500g', null, '98', 'http://image.meiping123.com/upload/20171229/16595821826327.jpg');
INSERT INTO `mall_order_goods` VALUES ('107', '58', '1181034', '韭黄 约200g±10g/份', '122923', '349', '1', '10.00', '10.00', '200g', null, '91', 'http://image.meiping123.com/upload/20171229/165059101cda14.jpg');
INSERT INTO `mall_order_goods` VALUES ('108', '58', '1181011', '德芙 脆香米奶香白巧克力24g', '10080010002', '297', '2', '20.00', '15.00', '24', null, '39', 'http://image.meiping123.com/upload/20171228/17303247952d7c.jpg');
INSERT INTO `mall_order_goods` VALUES ('109', '58', '1181111', '味事达极鲜380ml', '011916', '465', '1', '10.00', '10.00', '380ml', null, '207', 'http://image.meiping123.com/upload/20180119/165649915659a3.jpg');
INSERT INTO `mall_order_goods` VALUES ('110', '58', '1181031', '茭白 约300g±30g/份', '122920', '346', '1', '10.00', '10.00', '300g', null, '88', 'http://image.meiping123.com/upload/20171229/16464670947919.jpg');
INSERT INTO `mall_order_goods` VALUES ('111', '58', '1181033', '韭菜花 约350g±30g/份', '122922', '348', '1', '10.00', '10.00', '350g', null, '90', 'http://image.meiping123.com/upload/20171229/164933509a579f.jpg');
INSERT INTO `mall_order_goods` VALUES ('112', '58', '1181036', '苦瓜 约750g±30g/份', '122925', '351', '1', '10.00', '10.00', '750g', null, '93', 'http://image.meiping123.com/upload/20171229/1654014065df04.jpg');
INSERT INTO `mall_order_goods` VALUES ('113', '58', '1181029', '西兰花 约560g±50g/份', '122918', '366', '1', '10.00', '10.00', '1400g', null, '108', 'http://image.meiping123.com/upload/20171229/164359781ee921.jpg');
INSERT INTO `mall_order_goods` VALUES ('114', '58', '1181032', '芥菜 约450g±30g/份', '122921', '347', '1', '10.00', '10.00', '450g', null, '89', 'http://image.meiping123.com/upload/20171229/164813915d0e45.jpg');
INSERT INTO `mall_order_goods` VALUES ('115', '58', '1181035', '空心菜 约900g±50g/份', '122924', '350', '1', '10.00', '10.00', '900g', null, '92', 'http://image.meiping123.com/upload/20171229/1652497082814a.jpg');
INSERT INTO `mall_order_goods` VALUES ('116', '58', '1181037', '莲藕 约750g±30g/份', '122926', '352', '2', '10.00', '10.00', '750g', null, '94', 'http://image.meiping123.com/upload/20171229/165536747d5c4b.jpg');
INSERT INTO `mall_order_goods` VALUES ('117', '59', '1181121', '安慕希风味酸奶草莓味205g*12瓶', '11002', '497', '1', '75.00', '72.00', '箱', null, '239', 'http://image.meiping123.com/upload/20180305/133004370b0a44.jpg');
INSERT INTO `mall_order_goods` VALUES ('118', '59', '1181114', '小红锅火锅底料红汤鸡汁150g', '011919', '468', '3', '10.00', '10.00', '150g', null, '210', 'http://image.meiping123.com/upload/20180119/170136121f06c4.jpg');
INSERT INTO `mall_order_goods` VALUES ('119', '59', '1181113', '小红锅典林小米辣300g', '011918', '467', '1', '10.00', '10.00', '300g', null, '209', 'http://image.meiping123.com/upload/20180119/170026692d93dc.jpg');
INSERT INTO `mall_order_goods` VALUES ('120', '59', '1181115', '小红锅三鲜火锅150g', '011920', '469', '6', '10.00', '10.00', '150g', null, '211', 'http://image.meiping123.com/upload/20180119/170459439dd283.jpg');
INSERT INTO `mall_order_goods` VALUES ('121', '59', '1181038', '流星包菜 约1000g±100g/份', '122927', '353', '1', '10.00', '10.00', '1000g', null, '95', 'http://image.meiping123.com/upload/20171229/16574389b4f12.jpg');
INSERT INTO `mall_order_goods` VALUES ('122', '59', '1181039', '毛山药 约500g±50g/份', '122928', '356', '1', '10.00', '10.00', '500g', null, '98', 'http://image.meiping123.com/upload/20171229/16595821826327.jpg');
INSERT INTO `mall_order_goods` VALUES ('123', '59', '1181040', '毛芋仔 约450±30g/份', '122929', '355', '1', '10.00', '10.00', '450g', null, '97', 'http://image.meiping123.com/upload/20171229/170120197db52f.jpg');
INSERT INTO `mall_order_goods` VALUES ('124', '60', '1181117', '鲁花5S压榨一级花生油4L', '05080', '476', '1', '55.00', '44.00', '4L', null, '218', 'http://image.meiping123.com/upload/20180206/1805508022321e.jpg');
INSERT INTO `mall_order_goods` VALUES ('125', '61', '1181116', '小红锅玉和园剁辣椒248g', '011921', '470', '8', '10.00', '10.00', '248g', null, '212', 'http://image.meiping123.com/upload/20180119/17064029290291.jpg');
INSERT INTO `mall_order_goods` VALUES ('126', '61', '1181113', '小红锅典林小米辣300g', '011918', '467', '1', '10.00', '10.00', '300g', null, '209', 'http://image.meiping123.com/upload/20180119/170026692d93dc.jpg');
INSERT INTO `mall_order_goods` VALUES ('127', '61', '1181038', '流星包菜 约1000g±100g/份', '122927', '353', '1', '10.00', '10.00', '1000g', null, '95', 'http://image.meiping123.com/upload/20171229/16574389b4f12.jpg');
INSERT INTO `mall_order_goods` VALUES ('128', '62', '1181026', '红苋菜 约450g±30g/份', '122915', '341', '2', '10.00', '10.00', '450g', null, '83', 'http://image.meiping123.com/upload/20171229/164013211ce61b.jpg');
INSERT INTO `mall_order_goods` VALUES ('129', '62', '1181038', '流星包菜 约1000g±100g/份', '122927', '353', '1', '10.00', '10.00', '1000g', null, '95', 'http://image.meiping123.com/upload/20171229/16574389b4f12.jpg');
INSERT INTO `mall_order_goods` VALUES ('130', '62', '1181039', '毛山药 约500g±50g/份', '122928', '356', '3', '10.00', '10.00', '500g', null, '98', 'http://image.meiping123.com/upload/20171229/16595821826327.jpg');
INSERT INTO `mall_order_goods` VALUES ('131', '62', '1181040', '毛芋仔 约450±30g/份', '122929', '355', '5', '10.00', '10.00', '450g', null, '97', 'http://image.meiping123.com/upload/20171229/170120197db52f.jpg');
INSERT INTO `mall_order_goods` VALUES ('132', '62', '1181113', '小红锅典林小米辣300g', '011918', '467', '1', '10.00', '10.00', '300g', null, '209', 'http://image.meiping123.com/upload/20180119/170026692d93dc.jpg');
INSERT INTO `mall_order_goods` VALUES ('133', '62', '1181114', '小红锅火锅底料红汤鸡汁150g', '011919', '468', '1', '10.00', '10.00', '150g', null, '210', 'http://image.meiping123.com/upload/20180119/170136121f06c4.jpg');
INSERT INTO `mall_order_goods` VALUES ('134', '62', '1181121', '安慕希风味酸奶草莓味205g*12瓶', '11002', '497', '6', '75.00', '72.00', '箱', null, '239', 'http://image.meiping123.com/upload/20180305/133004370b0a44.jpg');
INSERT INTO `mall_order_goods` VALUES ('135', '63', '1181116', '小红锅玉和园剁辣椒248g', '011921', '470', '1', '10.00', '10.00', '248g', null, '212', 'http://image.meiping123.com/upload/20180119/17064029290291.jpg');
INSERT INTO `mall_order_goods` VALUES ('136', '63', '1181117', '鲁花5S压榨一级花生油4L', '05080', '476', '1', '55.00', '44.00', '4L', null, '218', 'http://image.meiping123.com/upload/20180206/1805508022321e.jpg');
INSERT INTO `mall_order_goods` VALUES ('137', '64', '1181042', '美人椒 约200g±20g/份', '122930', '364', '3', '10.00', '10.00', '200g', null, '106', 'http://image.meiping123.com/upload/20171229/1702589526ce44.jpg');
INSERT INTO `mall_order_goods` VALUES ('138', '65', '1181116', '小红锅玉和园剁辣椒248g', '011921', '470', '1', '10.00', '10.00', '248g', null, '212', 'http://image.meiping123.com/upload/20180119/17064029290291.jpg');
INSERT INTO `mall_order_goods` VALUES ('139', '66', '1181010', '德芙 轻柔威化巧克力22.5g', '10080010001', '285', '1', '20.00', '20.00', '22.5', null, '27', 'http://image.meiping123.com/upload/20171227/1729071646f21a.png');
INSERT INTO `mall_order_goods` VALUES ('141', '68', '1181011', '德芙 脆香米奶香白巧克力24g', '10080010005', '297', '1', '10.00', '12.00', '24', null, '39', 'http://image.meiping123.com/upload/20171228/17303247952d7c.jpg');
INSERT INTO `mall_order_goods` VALUES ('142', '69', '1181011', '德芙 脆香米奶香白巧克力24g', '10080010005', '297', '1', '20.00', '15.00', '24', null, '39', 'http://image.meiping123.com/upload/20171228/17303247952d7c.jpg');

-- ----------------------------
-- Table structure for mall_product
-- ----------------------------
DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE `mall_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` mediumint(8) unsigned DEFAULT '0' COMMENT '商品Id',
  `goods_specification_ids` varchar(50) DEFAULT '' COMMENT '商品规格ids',
  `goods_sn` varchar(60) DEFAULT '' COMMENT '商品序列号',
  `goods_number` mediumint(8) unsigned DEFAULT '0' COMMENT '商品编码',
  `retail_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '零售价格',
  `market_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '团购价格',
  `goods_specification_name_value` text COMMENT '规格属性组成的字符串，用来显示用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品规格';

-- ----------------------------
-- Records of mall_product
-- ----------------------------
INSERT INTO `mall_product` VALUES ('248', '1181001', '10', '12345', '13', '299.00', '300.00', '22.5');
INSERT INTO `mall_product` VALUES ('285', '1181010', '27', '10080010001', '100', '20.00', '20.00', '22.5');
INSERT INTO `mall_product` VALUES ('297', '1181011', '39', '10080010002', '100', '15.00', '20.00', '24');
INSERT INTO `mall_product` VALUES ('329', '1181012', '71', '122901', '10', '10.00', '10.00', '红色');
INSERT INTO `mall_product` VALUES ('330', '1181013', '72', '122902', '10', '10.00', '10.00', '900g');
INSERT INTO `mall_product` VALUES ('497', '1181121', '239', '11002', '10', '72.00', '75.00', '箱');

-- ----------------------------
-- Table structure for mall_product_store_rela
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_store_rela`;
CREATE TABLE `mall_product_store_rela` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` mediumint(8) NOT NULL COMMENT '门店Id',
  `product_id` mediumint(8) NOT NULL COMMENT '门店产品Id',
  `stock_num` int(6) DEFAULT NULL COMMENT '库存数量',
  `goods_id` int(11) NOT NULL COMMENT '商品Id',
  `retail_price` decimal(10,2) DEFAULT NULL COMMENT '零售价格',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价格',
  `stock_price` decimal(10,2) DEFAULT NULL COMMENT '库存价格',
  `sell_volume` int(11) unsigned DEFAULT '0' COMMENT '销售量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3335 DEFAULT CHARSET=utf8 COMMENT='商城-门店库存商品规格明细';

-- ----------------------------
-- Records of mall_product_store_rela
-- ----------------------------
INSERT INTO `mall_product_store_rela` VALUES ('3333', '8', '329', '100', '1181012', '12.00', '10.00', '10.00', '3');
INSERT INTO `mall_product_store_rela` VALUES ('3334', '8', '248', '100', '1181001', '120.00', '150.00', '150.00', '10');

-- ----------------------------
-- Table structure for mall_region
-- ----------------------------
DROP TABLE IF EXISTS `mall_region`;
CREATE TABLE `mall_region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4045 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-城市字典表';

-- ----------------------------
-- Records of mall_region
-- ----------------------------
INSERT INTO `mall_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `mall_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `mall_region` VALUES ('3', '1', '天津', '1', '0');
INSERT INTO `mall_region` VALUES ('4', '1', '河北省', '1', '0');
INSERT INTO `mall_region` VALUES ('5', '1', '山西省', '1', '0');
INSERT INTO `mall_region` VALUES ('6', '1', '内蒙古自治区', '1', '0');
INSERT INTO `mall_region` VALUES ('7', '1', '辽宁省', '1', '0');
INSERT INTO `mall_region` VALUES ('8', '1', '吉林省', '1', '0');
INSERT INTO `mall_region` VALUES ('9', '1', '黑龙江省', '1', '0');
INSERT INTO `mall_region` VALUES ('10', '1', '上海', '1', '0');
INSERT INTO `mall_region` VALUES ('11', '1', '江苏省', '1', '0');
INSERT INTO `mall_region` VALUES ('12', '1', '浙江省', '1', '0');
INSERT INTO `mall_region` VALUES ('13', '1', '安徽省', '1', '0');
INSERT INTO `mall_region` VALUES ('14', '1', '福建省', '1', '0');
INSERT INTO `mall_region` VALUES ('15', '1', '江西省', '1', '0');
INSERT INTO `mall_region` VALUES ('16', '1', '山东省', '1', '0');
INSERT INTO `mall_region` VALUES ('17', '1', '河南省', '1', '0');
INSERT INTO `mall_region` VALUES ('18', '1', '湖北省', '1', '0');
INSERT INTO `mall_region` VALUES ('19', '1', '湖南省', '1', '0');
INSERT INTO `mall_region` VALUES ('20', '1', '广东省', '1', '0');
INSERT INTO `mall_region` VALUES ('21', '1', '广西壮族自治区', '1', '0');
INSERT INTO `mall_region` VALUES ('22', '1', '海南省', '1', '0');
INSERT INTO `mall_region` VALUES ('23', '1', '重庆', '1', '0');
INSERT INTO `mall_region` VALUES ('24', '1', '四川省', '1', '0');
INSERT INTO `mall_region` VALUES ('25', '1', '贵州省', '1', '0');
INSERT INTO `mall_region` VALUES ('26', '1', '云南省', '1', '0');
INSERT INTO `mall_region` VALUES ('27', '1', '西藏自治区', '1', '0');
INSERT INTO `mall_region` VALUES ('28', '1', '陕西省', '1', '0');
INSERT INTO `mall_region` VALUES ('29', '1', '甘肃省', '1', '0');
INSERT INTO `mall_region` VALUES ('30', '1', '青海省', '1', '0');
INSERT INTO `mall_region` VALUES ('31', '1', '宁夏回族自治区', '1', '0');
INSERT INTO `mall_region` VALUES ('32', '1', '新疆维吾尔自治区', '1', '0');
INSERT INTO `mall_region` VALUES ('33', '1', '台湾', '1', '0');
INSERT INTO `mall_region` VALUES ('34', '1', '香港特别行政区', '1', '0');
INSERT INTO `mall_region` VALUES ('35', '1', '澳门特别行政区', '1', '0');
INSERT INTO `mall_region` VALUES ('36', '1', '海外', '1', '0');
INSERT INTO `mall_region` VALUES ('37', '2', '北京市', '2', '0');
INSERT INTO `mall_region` VALUES ('38', '3', '天津市', '2', '0');
INSERT INTO `mall_region` VALUES ('39', '4', '石家庄市', '2', '0');
INSERT INTO `mall_region` VALUES ('40', '4', '唐山市', '2', '0');
INSERT INTO `mall_region` VALUES ('41', '4', '秦皇岛市', '2', '0');
INSERT INTO `mall_region` VALUES ('42', '4', '邯郸市', '2', '0');
INSERT INTO `mall_region` VALUES ('43', '4', '邢台市', '2', '0');
INSERT INTO `mall_region` VALUES ('44', '4', '保定市', '2', '0');
INSERT INTO `mall_region` VALUES ('45', '4', '张家口市', '2', '0');
INSERT INTO `mall_region` VALUES ('46', '4', '承德市', '2', '0');
INSERT INTO `mall_region` VALUES ('47', '4', '沧州市', '2', '0');
INSERT INTO `mall_region` VALUES ('48', '4', '廊坊市', '2', '0');
INSERT INTO `mall_region` VALUES ('49', '4', '衡水市', '2', '0');
INSERT INTO `mall_region` VALUES ('50', '5', '太原市', '2', '0');
INSERT INTO `mall_region` VALUES ('51', '5', '大同市', '2', '0');
INSERT INTO `mall_region` VALUES ('52', '5', '阳泉市', '2', '0');
INSERT INTO `mall_region` VALUES ('53', '5', '长治市', '2', '0');
INSERT INTO `mall_region` VALUES ('54', '5', '晋城市', '2', '0');
INSERT INTO `mall_region` VALUES ('55', '5', '朔州市', '2', '0');
INSERT INTO `mall_region` VALUES ('56', '5', '晋中市', '2', '0');
INSERT INTO `mall_region` VALUES ('57', '5', '运城市', '2', '0');
INSERT INTO `mall_region` VALUES ('58', '5', '忻州市', '2', '0');
INSERT INTO `mall_region` VALUES ('59', '5', '临汾市', '2', '0');
INSERT INTO `mall_region` VALUES ('60', '5', '吕梁市', '2', '0');
INSERT INTO `mall_region` VALUES ('61', '6', '呼和浩特市', '2', '0');
INSERT INTO `mall_region` VALUES ('62', '6', '包头市', '2', '0');
INSERT INTO `mall_region` VALUES ('63', '6', '乌海市', '2', '0');
INSERT INTO `mall_region` VALUES ('64', '6', '赤峰市', '2', '0');
INSERT INTO `mall_region` VALUES ('65', '6', '通辽市', '2', '0');
INSERT INTO `mall_region` VALUES ('66', '6', '鄂尔多斯市', '2', '0');
INSERT INTO `mall_region` VALUES ('67', '6', '呼伦贝尔市', '2', '0');
INSERT INTO `mall_region` VALUES ('68', '6', '巴彦淖尔市', '2', '0');
INSERT INTO `mall_region` VALUES ('69', '6', '乌兰察布市', '2', '0');
INSERT INTO `mall_region` VALUES ('70', '6', '兴安盟', '2', '0');
INSERT INTO `mall_region` VALUES ('71', '6', '锡林郭勒盟', '2', '0');
INSERT INTO `mall_region` VALUES ('72', '6', '阿拉善盟', '2', '0');
INSERT INTO `mall_region` VALUES ('73', '7', '沈阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('74', '7', '大连市', '2', '0');
INSERT INTO `mall_region` VALUES ('75', '7', '鞍山市', '2', '0');
INSERT INTO `mall_region` VALUES ('76', '7', '抚顺市', '2', '0');
INSERT INTO `mall_region` VALUES ('77', '7', '本溪市', '2', '0');
INSERT INTO `mall_region` VALUES ('78', '7', '丹东市', '2', '0');
INSERT INTO `mall_region` VALUES ('79', '7', '锦州市', '2', '0');
INSERT INTO `mall_region` VALUES ('80', '7', '营口市', '2', '0');
INSERT INTO `mall_region` VALUES ('81', '7', '阜新市', '2', '0');
INSERT INTO `mall_region` VALUES ('82', '7', '辽阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('83', '7', '盘锦市', '2', '0');
INSERT INTO `mall_region` VALUES ('84', '7', '铁岭市', '2', '0');
INSERT INTO `mall_region` VALUES ('85', '7', '朝阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('86', '7', '葫芦岛市', '2', '0');
INSERT INTO `mall_region` VALUES ('87', '8', '长春市', '2', '0');
INSERT INTO `mall_region` VALUES ('88', '8', '吉林市', '2', '0');
INSERT INTO `mall_region` VALUES ('89', '8', '四平市', '2', '0');
INSERT INTO `mall_region` VALUES ('90', '8', '辽源市', '2', '0');
INSERT INTO `mall_region` VALUES ('91', '8', '通化市', '2', '0');
INSERT INTO `mall_region` VALUES ('92', '8', '白山市', '2', '0');
INSERT INTO `mall_region` VALUES ('93', '8', '松原市', '2', '0');
INSERT INTO `mall_region` VALUES ('94', '8', '白城市', '2', '0');
INSERT INTO `mall_region` VALUES ('95', '8', '延边朝鲜族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('96', '9', '哈尔滨市', '2', '0');
INSERT INTO `mall_region` VALUES ('97', '9', '齐齐哈尔市', '2', '0');
INSERT INTO `mall_region` VALUES ('98', '9', '鸡西市', '2', '0');
INSERT INTO `mall_region` VALUES ('99', '9', '鹤岗市', '2', '0');
INSERT INTO `mall_region` VALUES ('100', '9', '双鸭山市', '2', '0');
INSERT INTO `mall_region` VALUES ('101', '9', '大庆市', '2', '0');
INSERT INTO `mall_region` VALUES ('102', '9', '伊春市', '2', '0');
INSERT INTO `mall_region` VALUES ('103', '9', '佳木斯市', '2', '0');
INSERT INTO `mall_region` VALUES ('104', '9', '七台河市', '2', '0');
INSERT INTO `mall_region` VALUES ('105', '9', '牡丹江市', '2', '0');
INSERT INTO `mall_region` VALUES ('106', '9', '黑河市', '2', '0');
INSERT INTO `mall_region` VALUES ('107', '9', '绥化市', '2', '0');
INSERT INTO `mall_region` VALUES ('108', '9', '大兴安岭地区', '2', '0');
INSERT INTO `mall_region` VALUES ('109', '10', '上海市', '2', '0');
INSERT INTO `mall_region` VALUES ('110', '11', '南京市', '2', '0');
INSERT INTO `mall_region` VALUES ('111', '11', '无锡市', '2', '0');
INSERT INTO `mall_region` VALUES ('112', '11', '徐州市', '2', '0');
INSERT INTO `mall_region` VALUES ('113', '11', '常州市', '2', '0');
INSERT INTO `mall_region` VALUES ('114', '11', '苏州市', '2', '0');
INSERT INTO `mall_region` VALUES ('115', '11', '南通市', '2', '0');
INSERT INTO `mall_region` VALUES ('116', '11', '连云港市', '2', '0');
INSERT INTO `mall_region` VALUES ('117', '11', '淮安市', '2', '0');
INSERT INTO `mall_region` VALUES ('118', '11', '盐城市', '2', '0');
INSERT INTO `mall_region` VALUES ('119', '11', '扬州市', '2', '0');
INSERT INTO `mall_region` VALUES ('120', '11', '镇江市', '2', '0');
INSERT INTO `mall_region` VALUES ('121', '11', '泰州市', '2', '0');
INSERT INTO `mall_region` VALUES ('122', '11', '宿迁市', '2', '0');
INSERT INTO `mall_region` VALUES ('123', '12', '杭州市', '2', '0');
INSERT INTO `mall_region` VALUES ('124', '12', '宁波市', '2', '0');
INSERT INTO `mall_region` VALUES ('125', '12', '温州市', '2', '0');
INSERT INTO `mall_region` VALUES ('126', '12', '嘉兴市', '2', '0');
INSERT INTO `mall_region` VALUES ('127', '12', '湖州市', '2', '0');
INSERT INTO `mall_region` VALUES ('128', '12', '绍兴市', '2', '0');
INSERT INTO `mall_region` VALUES ('129', '12', '金华市', '2', '0');
INSERT INTO `mall_region` VALUES ('130', '12', '衢州市', '2', '0');
INSERT INTO `mall_region` VALUES ('131', '12', '舟山市', '2', '0');
INSERT INTO `mall_region` VALUES ('132', '12', '台州市', '2', '0');
INSERT INTO `mall_region` VALUES ('133', '12', '丽水市', '2', '0');
INSERT INTO `mall_region` VALUES ('134', '13', '合肥市', '2', '0');
INSERT INTO `mall_region` VALUES ('135', '13', '芜湖市', '2', '0');
INSERT INTO `mall_region` VALUES ('136', '13', '蚌埠市', '2', '0');
INSERT INTO `mall_region` VALUES ('137', '13', '淮南市', '2', '0');
INSERT INTO `mall_region` VALUES ('138', '13', '马鞍山市', '2', '0');
INSERT INTO `mall_region` VALUES ('139', '13', '淮北市', '2', '0');
INSERT INTO `mall_region` VALUES ('140', '13', '铜陵市', '2', '0');
INSERT INTO `mall_region` VALUES ('141', '13', '安庆市', '2', '0');
INSERT INTO `mall_region` VALUES ('142', '13', '黄山市', '2', '0');
INSERT INTO `mall_region` VALUES ('143', '13', '滁州市', '2', '0');
INSERT INTO `mall_region` VALUES ('144', '13', '阜阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('145', '13', '宿州市', '2', '0');
INSERT INTO `mall_region` VALUES ('146', '13', '六安市', '2', '0');
INSERT INTO `mall_region` VALUES ('147', '13', '亳州市', '2', '0');
INSERT INTO `mall_region` VALUES ('148', '13', '池州市', '2', '0');
INSERT INTO `mall_region` VALUES ('149', '13', '宣城市', '2', '0');
INSERT INTO `mall_region` VALUES ('150', '14', '福州市', '2', '0');
INSERT INTO `mall_region` VALUES ('151', '14', '厦门市', '2', '0');
INSERT INTO `mall_region` VALUES ('152', '14', '莆田市', '2', '0');
INSERT INTO `mall_region` VALUES ('153', '14', '三明市', '2', '0');
INSERT INTO `mall_region` VALUES ('154', '14', '泉州市', '2', '0');
INSERT INTO `mall_region` VALUES ('155', '14', '漳州市', '2', '0');
INSERT INTO `mall_region` VALUES ('156', '14', '南平市', '2', '0');
INSERT INTO `mall_region` VALUES ('157', '14', '龙岩市', '2', '0');
INSERT INTO `mall_region` VALUES ('158', '14', '宁德市', '2', '0');
INSERT INTO `mall_region` VALUES ('159', '15', '南昌市', '2', '0');
INSERT INTO `mall_region` VALUES ('160', '15', '景德镇市', '2', '0');
INSERT INTO `mall_region` VALUES ('161', '15', '萍乡市', '2', '0');
INSERT INTO `mall_region` VALUES ('162', '15', '九江市', '2', '0');
INSERT INTO `mall_region` VALUES ('163', '15', '新余市', '2', '0');
INSERT INTO `mall_region` VALUES ('164', '15', '鹰潭市', '2', '0');
INSERT INTO `mall_region` VALUES ('165', '15', '赣州市', '2', '0');
INSERT INTO `mall_region` VALUES ('166', '15', '吉安市', '2', '0');
INSERT INTO `mall_region` VALUES ('167', '15', '宜春市', '2', '0');
INSERT INTO `mall_region` VALUES ('168', '15', '抚州市', '2', '0');
INSERT INTO `mall_region` VALUES ('169', '15', '上饶市', '2', '0');
INSERT INTO `mall_region` VALUES ('170', '16', '济南市', '2', '0');
INSERT INTO `mall_region` VALUES ('171', '16', '青岛市', '2', '0');
INSERT INTO `mall_region` VALUES ('172', '16', '淄博市', '2', '0');
INSERT INTO `mall_region` VALUES ('173', '16', '枣庄市', '2', '0');
INSERT INTO `mall_region` VALUES ('174', '16', '东营市', '2', '0');
INSERT INTO `mall_region` VALUES ('175', '16', '烟台市', '2', '0');
INSERT INTO `mall_region` VALUES ('176', '16', '潍坊市', '2', '0');
INSERT INTO `mall_region` VALUES ('177', '16', '济宁市', '2', '0');
INSERT INTO `mall_region` VALUES ('178', '16', '泰安市', '2', '0');
INSERT INTO `mall_region` VALUES ('179', '16', '威海市', '2', '0');
INSERT INTO `mall_region` VALUES ('180', '16', '日照市', '2', '0');
INSERT INTO `mall_region` VALUES ('181', '16', '莱芜市', '2', '0');
INSERT INTO `mall_region` VALUES ('182', '16', '临沂市', '2', '0');
INSERT INTO `mall_region` VALUES ('183', '16', '德州市', '2', '0');
INSERT INTO `mall_region` VALUES ('184', '16', '聊城市', '2', '0');
INSERT INTO `mall_region` VALUES ('185', '16', '滨州市', '2', '0');
INSERT INTO `mall_region` VALUES ('186', '16', '菏泽市', '2', '0');
INSERT INTO `mall_region` VALUES ('187', '17', '郑州市', '2', '0');
INSERT INTO `mall_region` VALUES ('188', '17', '开封市', '2', '0');
INSERT INTO `mall_region` VALUES ('189', '17', '洛阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('190', '17', '平顶山市', '2', '0');
INSERT INTO `mall_region` VALUES ('191', '17', '安阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('192', '17', '鹤壁市', '2', '0');
INSERT INTO `mall_region` VALUES ('193', '17', '新乡市', '2', '0');
INSERT INTO `mall_region` VALUES ('194', '17', '焦作市', '2', '0');
INSERT INTO `mall_region` VALUES ('195', '17', '濮阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('196', '17', '许昌市', '2', '0');
INSERT INTO `mall_region` VALUES ('197', '17', '漯河市', '2', '0');
INSERT INTO `mall_region` VALUES ('198', '17', '三门峡市', '2', '0');
INSERT INTO `mall_region` VALUES ('199', '17', '南阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('200', '17', '商丘市', '2', '0');
INSERT INTO `mall_region` VALUES ('201', '17', '信阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('202', '17', '周口市', '2', '0');
INSERT INTO `mall_region` VALUES ('203', '17', '驻马店市', '2', '0');
INSERT INTO `mall_region` VALUES ('204', '18', '武汉市', '2', '0');
INSERT INTO `mall_region` VALUES ('205', '18', '黄石市', '2', '0');
INSERT INTO `mall_region` VALUES ('206', '18', '十堰市', '2', '0');
INSERT INTO `mall_region` VALUES ('207', '18', '宜昌市', '2', '0');
INSERT INTO `mall_region` VALUES ('208', '18', '襄阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('209', '18', '鄂州市', '2', '0');
INSERT INTO `mall_region` VALUES ('210', '18', '荆门市', '2', '0');
INSERT INTO `mall_region` VALUES ('211', '18', '孝感市', '2', '0');
INSERT INTO `mall_region` VALUES ('212', '18', '荆州市', '2', '0');
INSERT INTO `mall_region` VALUES ('213', '18', '黄冈市', '2', '0');
INSERT INTO `mall_region` VALUES ('214', '18', '咸宁市', '2', '0');
INSERT INTO `mall_region` VALUES ('215', '18', '随州市', '2', '0');
INSERT INTO `mall_region` VALUES ('216', '18', '恩施土家族苗族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('217', '19', '长沙市', '2', '0');
INSERT INTO `mall_region` VALUES ('218', '19', '株洲市', '2', '0');
INSERT INTO `mall_region` VALUES ('219', '19', '湘潭市', '2', '0');
INSERT INTO `mall_region` VALUES ('220', '19', '衡阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('221', '19', '邵阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('222', '19', '岳阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('223', '19', '常德市', '2', '0');
INSERT INTO `mall_region` VALUES ('224', '19', '张家界市', '2', '0');
INSERT INTO `mall_region` VALUES ('225', '19', '益阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('226', '19', '郴州市', '2', '0');
INSERT INTO `mall_region` VALUES ('227', '19', '永州市', '2', '0');
INSERT INTO `mall_region` VALUES ('228', '19', '怀化市', '2', '0');
INSERT INTO `mall_region` VALUES ('229', '19', '娄底市', '2', '0');
INSERT INTO `mall_region` VALUES ('230', '19', '湘西土家族苗族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('231', '20', '广州市', '2', '0');
INSERT INTO `mall_region` VALUES ('232', '20', '韶关市', '2', '0');
INSERT INTO `mall_region` VALUES ('233', '20', '深圳市', '2', '0');
INSERT INTO `mall_region` VALUES ('234', '20', '珠海市', '2', '0');
INSERT INTO `mall_region` VALUES ('235', '20', '汕头市', '2', '0');
INSERT INTO `mall_region` VALUES ('236', '20', '佛山市', '2', '0');
INSERT INTO `mall_region` VALUES ('237', '20', '江门市', '2', '0');
INSERT INTO `mall_region` VALUES ('238', '20', '湛江市', '2', '0');
INSERT INTO `mall_region` VALUES ('239', '20', '茂名市', '2', '0');
INSERT INTO `mall_region` VALUES ('240', '20', '肇庆市', '2', '0');
INSERT INTO `mall_region` VALUES ('241', '20', '惠州市', '2', '0');
INSERT INTO `mall_region` VALUES ('242', '20', '梅州市', '2', '0');
INSERT INTO `mall_region` VALUES ('243', '20', '汕尾市', '2', '0');
INSERT INTO `mall_region` VALUES ('244', '20', '河源市', '2', '0');
INSERT INTO `mall_region` VALUES ('245', '20', '阳江市', '2', '0');
INSERT INTO `mall_region` VALUES ('246', '20', '清远市', '2', '0');
INSERT INTO `mall_region` VALUES ('247', '20', '东莞市', '2', '0');
INSERT INTO `mall_region` VALUES ('248', '20', '中山市', '2', '0');
INSERT INTO `mall_region` VALUES ('249', '20', '东沙群岛', '2', '0');
INSERT INTO `mall_region` VALUES ('250', '20', '潮州市', '2', '0');
INSERT INTO `mall_region` VALUES ('251', '20', '揭阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('252', '20', '云浮市', '2', '0');
INSERT INTO `mall_region` VALUES ('253', '21', '南宁市', '2', '0');
INSERT INTO `mall_region` VALUES ('254', '21', '柳州市', '2', '0');
INSERT INTO `mall_region` VALUES ('255', '21', '桂林市', '2', '0');
INSERT INTO `mall_region` VALUES ('256', '21', '梧州市', '2', '0');
INSERT INTO `mall_region` VALUES ('257', '21', '北海市', '2', '0');
INSERT INTO `mall_region` VALUES ('258', '21', '防城港市', '2', '0');
INSERT INTO `mall_region` VALUES ('259', '21', '钦州市', '2', '0');
INSERT INTO `mall_region` VALUES ('260', '21', '贵港市', '2', '0');
INSERT INTO `mall_region` VALUES ('261', '21', '玉林市', '2', '0');
INSERT INTO `mall_region` VALUES ('262', '21', '百色市', '2', '0');
INSERT INTO `mall_region` VALUES ('263', '21', '贺州市', '2', '0');
INSERT INTO `mall_region` VALUES ('264', '21', '河池市', '2', '0');
INSERT INTO `mall_region` VALUES ('265', '21', '来宾市', '2', '0');
INSERT INTO `mall_region` VALUES ('266', '21', '崇左市', '2', '0');
INSERT INTO `mall_region` VALUES ('267', '22', '海口市', '2', '0');
INSERT INTO `mall_region` VALUES ('268', '22', '三亚市', '2', '0');
INSERT INTO `mall_region` VALUES ('269', '22', '三沙市', '2', '0');
INSERT INTO `mall_region` VALUES ('270', '23', '重庆市', '2', '0');
INSERT INTO `mall_region` VALUES ('271', '24', '成都市', '2', '0');
INSERT INTO `mall_region` VALUES ('272', '24', '自贡市', '2', '0');
INSERT INTO `mall_region` VALUES ('273', '24', '攀枝花市', '2', '0');
INSERT INTO `mall_region` VALUES ('274', '24', '泸州市', '2', '0');
INSERT INTO `mall_region` VALUES ('275', '24', '德阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('276', '24', '绵阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('277', '24', '广元市', '2', '0');
INSERT INTO `mall_region` VALUES ('278', '24', '遂宁市', '2', '0');
INSERT INTO `mall_region` VALUES ('279', '24', '内江市', '2', '0');
INSERT INTO `mall_region` VALUES ('280', '24', '乐山市', '2', '0');
INSERT INTO `mall_region` VALUES ('281', '24', '南充市', '2', '0');
INSERT INTO `mall_region` VALUES ('282', '24', '眉山市', '2', '0');
INSERT INTO `mall_region` VALUES ('283', '24', '宜宾市', '2', '0');
INSERT INTO `mall_region` VALUES ('284', '24', '广安市', '2', '0');
INSERT INTO `mall_region` VALUES ('285', '24', '达州市', '2', '0');
INSERT INTO `mall_region` VALUES ('286', '24', '雅安市', '2', '0');
INSERT INTO `mall_region` VALUES ('287', '24', '巴中市', '2', '0');
INSERT INTO `mall_region` VALUES ('288', '24', '资阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('289', '24', '阿坝藏族羌族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('290', '24', '甘孜藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('291', '24', '凉山彝族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('292', '25', '贵阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('293', '25', '六盘水市', '2', '0');
INSERT INTO `mall_region` VALUES ('294', '25', '遵义市', '2', '0');
INSERT INTO `mall_region` VALUES ('295', '25', '安顺市', '2', '0');
INSERT INTO `mall_region` VALUES ('296', '25', '铜仁市', '2', '0');
INSERT INTO `mall_region` VALUES ('297', '25', '黔西南布依族苗族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('298', '25', '毕节市', '2', '0');
INSERT INTO `mall_region` VALUES ('299', '25', '黔东南苗族侗族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('300', '25', '黔南布依族苗族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('301', '26', '昆明市', '2', '0');
INSERT INTO `mall_region` VALUES ('302', '26', '曲靖市', '2', '0');
INSERT INTO `mall_region` VALUES ('303', '26', '玉溪市', '2', '0');
INSERT INTO `mall_region` VALUES ('304', '26', '保山市', '2', '0');
INSERT INTO `mall_region` VALUES ('305', '26', '昭通市', '2', '0');
INSERT INTO `mall_region` VALUES ('306', '26', '丽江市', '2', '0');
INSERT INTO `mall_region` VALUES ('307', '26', '普洱市', '2', '0');
INSERT INTO `mall_region` VALUES ('308', '26', '临沧市', '2', '0');
INSERT INTO `mall_region` VALUES ('309', '26', '楚雄彝族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('310', '26', '红河哈尼族彝族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('311', '26', '文山壮族苗族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('312', '26', '西双版纳傣族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('313', '26', '大理白族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('314', '26', '德宏傣族景颇族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('315', '26', '怒江傈僳族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('316', '26', '迪庆藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('317', '27', '拉萨市', '2', '0');
INSERT INTO `mall_region` VALUES ('318', '27', '昌都市', '2', '0');
INSERT INTO `mall_region` VALUES ('319', '27', '山南地区', '2', '0');
INSERT INTO `mall_region` VALUES ('320', '27', '日喀则市', '2', '0');
INSERT INTO `mall_region` VALUES ('321', '27', '那曲地区', '2', '0');
INSERT INTO `mall_region` VALUES ('322', '27', '阿里地区', '2', '0');
INSERT INTO `mall_region` VALUES ('323', '27', '林芝市', '2', '0');
INSERT INTO `mall_region` VALUES ('324', '28', '西安市', '2', '0');
INSERT INTO `mall_region` VALUES ('325', '28', '铜川市', '2', '0');
INSERT INTO `mall_region` VALUES ('326', '28', '宝鸡市', '2', '0');
INSERT INTO `mall_region` VALUES ('327', '28', '咸阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('328', '28', '渭南市', '2', '0');
INSERT INTO `mall_region` VALUES ('329', '28', '延安市', '2', '0');
INSERT INTO `mall_region` VALUES ('330', '28', '汉中市', '2', '0');
INSERT INTO `mall_region` VALUES ('331', '28', '榆林市', '2', '0');
INSERT INTO `mall_region` VALUES ('332', '28', '安康市', '2', '0');
INSERT INTO `mall_region` VALUES ('333', '28', '商洛市', '2', '0');
INSERT INTO `mall_region` VALUES ('334', '29', '兰州市', '2', '0');
INSERT INTO `mall_region` VALUES ('335', '29', '嘉峪关市', '2', '0');
INSERT INTO `mall_region` VALUES ('336', '29', '金昌市', '2', '0');
INSERT INTO `mall_region` VALUES ('337', '29', '白银市', '2', '0');
INSERT INTO `mall_region` VALUES ('338', '29', '天水市', '2', '0');
INSERT INTO `mall_region` VALUES ('339', '29', '武威市', '2', '0');
INSERT INTO `mall_region` VALUES ('340', '29', '张掖市', '2', '0');
INSERT INTO `mall_region` VALUES ('341', '29', '平凉市', '2', '0');
INSERT INTO `mall_region` VALUES ('342', '29', '酒泉市', '2', '0');
INSERT INTO `mall_region` VALUES ('343', '29', '庆阳市', '2', '0');
INSERT INTO `mall_region` VALUES ('344', '29', '定西市', '2', '0');
INSERT INTO `mall_region` VALUES ('345', '29', '陇南市', '2', '0');
INSERT INTO `mall_region` VALUES ('346', '29', '临夏回族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('347', '29', '甘南藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('348', '30', '西宁市', '2', '0');
INSERT INTO `mall_region` VALUES ('349', '30', '海东市', '2', '0');
INSERT INTO `mall_region` VALUES ('350', '30', '海北藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('351', '30', '黄南藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('352', '30', '海南藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('353', '30', '果洛藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('354', '30', '玉树藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('355', '30', '海西蒙古族藏族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('356', '31', '银川市', '2', '0');
INSERT INTO `mall_region` VALUES ('357', '31', '石嘴山市', '2', '0');
INSERT INTO `mall_region` VALUES ('358', '31', '吴忠市', '2', '0');
INSERT INTO `mall_region` VALUES ('359', '31', '固原市', '2', '0');
INSERT INTO `mall_region` VALUES ('360', '31', '中卫市', '2', '0');
INSERT INTO `mall_region` VALUES ('361', '32', '乌鲁木齐市', '2', '0');
INSERT INTO `mall_region` VALUES ('362', '32', '克拉玛依市', '2', '0');
INSERT INTO `mall_region` VALUES ('363', '32', '吐鲁番市', '2', '0');
INSERT INTO `mall_region` VALUES ('364', '32', '哈密地区', '2', '0');
INSERT INTO `mall_region` VALUES ('365', '32', '昌吉回族自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('366', '32', '博尔塔拉蒙古自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('367', '32', '巴音郭楞蒙古自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('368', '32', '阿克苏地区', '2', '0');
INSERT INTO `mall_region` VALUES ('369', '32', '克孜勒苏柯尔克孜自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('370', '32', '喀什地区', '2', '0');
INSERT INTO `mall_region` VALUES ('371', '32', '和田地区', '2', '0');
INSERT INTO `mall_region` VALUES ('372', '32', '伊犁哈萨克自治州', '2', '0');
INSERT INTO `mall_region` VALUES ('373', '32', '塔城地区', '2', '0');
INSERT INTO `mall_region` VALUES ('374', '32', '阿勒泰地区', '2', '0');
INSERT INTO `mall_region` VALUES ('375', '33', '台北市', '2', '0');
INSERT INTO `mall_region` VALUES ('376', '33', '高雄市', '2', '0');
INSERT INTO `mall_region` VALUES ('377', '33', '台南市', '2', '0');
INSERT INTO `mall_region` VALUES ('378', '33', '台中市', '2', '0');
INSERT INTO `mall_region` VALUES ('379', '33', '金门县', '2', '0');
INSERT INTO `mall_region` VALUES ('380', '33', '南投县', '2', '0');
INSERT INTO `mall_region` VALUES ('381', '33', '基隆市', '2', '0');
INSERT INTO `mall_region` VALUES ('382', '33', '新竹市', '2', '0');
INSERT INTO `mall_region` VALUES ('383', '33', '嘉义市', '2', '0');
INSERT INTO `mall_region` VALUES ('384', '33', '新北市', '2', '0');
INSERT INTO `mall_region` VALUES ('385', '33', '宜兰县', '2', '0');
INSERT INTO `mall_region` VALUES ('386', '33', '新竹县', '2', '0');
INSERT INTO `mall_region` VALUES ('387', '33', '桃园县', '2', '0');
INSERT INTO `mall_region` VALUES ('388', '33', '苗栗县', '2', '0');
INSERT INTO `mall_region` VALUES ('389', '33', '彰化县', '2', '0');
INSERT INTO `mall_region` VALUES ('390', '33', '嘉义县', '2', '0');
INSERT INTO `mall_region` VALUES ('391', '33', '云林县', '2', '0');
INSERT INTO `mall_region` VALUES ('392', '33', '屏东县', '2', '0');
INSERT INTO `mall_region` VALUES ('393', '33', '台东县', '2', '0');
INSERT INTO `mall_region` VALUES ('394', '33', '花莲县', '2', '0');
INSERT INTO `mall_region` VALUES ('395', '33', '澎湖县', '2', '0');
INSERT INTO `mall_region` VALUES ('396', '33', '连江县', '2', '0');
INSERT INTO `mall_region` VALUES ('397', '34', '香港岛', '2', '0');
INSERT INTO `mall_region` VALUES ('398', '34', '九龙', '2', '0');
INSERT INTO `mall_region` VALUES ('399', '34', '新界', '2', '0');
INSERT INTO `mall_region` VALUES ('400', '35', '澳门半岛', '2', '0');
INSERT INTO `mall_region` VALUES ('401', '35', '离岛', '2', '0');
INSERT INTO `mall_region` VALUES ('402', '36', '海外', '2', '0');
INSERT INTO `mall_region` VALUES ('403', '37', '东城区', '3', '0');
INSERT INTO `mall_region` VALUES ('404', '37', '西城区', '3', '0');
INSERT INTO `mall_region` VALUES ('405', '37', '崇文区', '3', '0');
INSERT INTO `mall_region` VALUES ('406', '37', '宣武区', '3', '0');
INSERT INTO `mall_region` VALUES ('407', '37', '朝阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('408', '37', '丰台区', '3', '0');
INSERT INTO `mall_region` VALUES ('409', '37', '石景山区', '3', '0');
INSERT INTO `mall_region` VALUES ('410', '37', '海淀区', '3', '0');
INSERT INTO `mall_region` VALUES ('411', '37', '门头沟区', '3', '0');
INSERT INTO `mall_region` VALUES ('412', '37', '房山区', '3', '0');
INSERT INTO `mall_region` VALUES ('413', '37', '通州区', '3', '0');
INSERT INTO `mall_region` VALUES ('414', '37', '顺义区', '3', '0');
INSERT INTO `mall_region` VALUES ('415', '37', '昌平区', '3', '0');
INSERT INTO `mall_region` VALUES ('416', '37', '大兴区', '3', '0');
INSERT INTO `mall_region` VALUES ('417', '37', '怀柔区', '3', '0');
INSERT INTO `mall_region` VALUES ('418', '37', '平谷区', '3', '0');
INSERT INTO `mall_region` VALUES ('419', '37', '密云县', '3', '0');
INSERT INTO `mall_region` VALUES ('420', '37', '延庆县', '3', '0');
INSERT INTO `mall_region` VALUES ('421', '37', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('422', '38', '和平区', '3', '0');
INSERT INTO `mall_region` VALUES ('423', '38', '河东区', '3', '0');
INSERT INTO `mall_region` VALUES ('424', '38', '河西区', '3', '0');
INSERT INTO `mall_region` VALUES ('425', '38', '南开区', '3', '0');
INSERT INTO `mall_region` VALUES ('426', '38', '河北区', '3', '0');
INSERT INTO `mall_region` VALUES ('427', '38', '红桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('428', '38', '塘沽区', '3', '0');
INSERT INTO `mall_region` VALUES ('429', '38', '汉沽区', '3', '0');
INSERT INTO `mall_region` VALUES ('430', '38', '大港区', '3', '0');
INSERT INTO `mall_region` VALUES ('431', '38', '东丽区', '3', '0');
INSERT INTO `mall_region` VALUES ('432', '38', '西青区', '3', '0');
INSERT INTO `mall_region` VALUES ('433', '38', '津南区', '3', '0');
INSERT INTO `mall_region` VALUES ('434', '38', '北辰区', '3', '0');
INSERT INTO `mall_region` VALUES ('435', '38', '武清区', '3', '0');
INSERT INTO `mall_region` VALUES ('436', '38', '宝坻区', '3', '0');
INSERT INTO `mall_region` VALUES ('437', '38', '滨海新区', '3', '0');
INSERT INTO `mall_region` VALUES ('438', '38', '宁河县', '3', '0');
INSERT INTO `mall_region` VALUES ('439', '38', '静海县', '3', '0');
INSERT INTO `mall_region` VALUES ('440', '38', '蓟县', '3', '0');
INSERT INTO `mall_region` VALUES ('441', '38', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('442', '39', '长安区', '3', '0');
INSERT INTO `mall_region` VALUES ('443', '39', '桥东区', '3', '0');
INSERT INTO `mall_region` VALUES ('444', '39', '桥西区', '3', '0');
INSERT INTO `mall_region` VALUES ('445', '39', '新华区', '3', '0');
INSERT INTO `mall_region` VALUES ('446', '39', '井陉矿区', '3', '0');
INSERT INTO `mall_region` VALUES ('447', '39', '裕华区', '3', '0');
INSERT INTO `mall_region` VALUES ('448', '39', '井陉县', '3', '0');
INSERT INTO `mall_region` VALUES ('449', '39', '正定县', '3', '0');
INSERT INTO `mall_region` VALUES ('450', '39', '栾城区', '3', '0');
INSERT INTO `mall_region` VALUES ('451', '39', '行唐县', '3', '0');
INSERT INTO `mall_region` VALUES ('452', '39', '灵寿县', '3', '0');
INSERT INTO `mall_region` VALUES ('453', '39', '高邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('454', '39', '深泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('455', '39', '赞皇县', '3', '0');
INSERT INTO `mall_region` VALUES ('456', '39', '无极县', '3', '0');
INSERT INTO `mall_region` VALUES ('457', '39', '平山县', '3', '0');
INSERT INTO `mall_region` VALUES ('458', '39', '元氏县', '3', '0');
INSERT INTO `mall_region` VALUES ('459', '39', '赵县', '3', '0');
INSERT INTO `mall_region` VALUES ('460', '39', '辛集市', '3', '0');
INSERT INTO `mall_region` VALUES ('461', '39', '藁城区', '3', '0');
INSERT INTO `mall_region` VALUES ('462', '39', '晋州市', '3', '0');
INSERT INTO `mall_region` VALUES ('463', '39', '新乐市', '3', '0');
INSERT INTO `mall_region` VALUES ('464', '39', '鹿泉区', '3', '0');
INSERT INTO `mall_region` VALUES ('465', '39', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('466', '40', '路南区', '3', '0');
INSERT INTO `mall_region` VALUES ('467', '40', '路北区', '3', '0');
INSERT INTO `mall_region` VALUES ('468', '40', '古冶区', '3', '0');
INSERT INTO `mall_region` VALUES ('469', '40', '开平区', '3', '0');
INSERT INTO `mall_region` VALUES ('470', '40', '丰南区', '3', '0');
INSERT INTO `mall_region` VALUES ('471', '40', '丰润区', '3', '0');
INSERT INTO `mall_region` VALUES ('472', '40', '滦县', '3', '0');
INSERT INTO `mall_region` VALUES ('473', '40', '滦南县', '3', '0');
INSERT INTO `mall_region` VALUES ('474', '40', '乐亭县', '3', '0');
INSERT INTO `mall_region` VALUES ('475', '40', '迁西县', '3', '0');
INSERT INTO `mall_region` VALUES ('476', '40', '玉田县', '3', '0');
INSERT INTO `mall_region` VALUES ('477', '40', '曹妃甸区', '3', '0');
INSERT INTO `mall_region` VALUES ('478', '40', '遵化市', '3', '0');
INSERT INTO `mall_region` VALUES ('479', '40', '迁安市', '3', '0');
INSERT INTO `mall_region` VALUES ('480', '40', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('481', '41', '海港区', '3', '0');
INSERT INTO `mall_region` VALUES ('482', '41', '山海关区', '3', '0');
INSERT INTO `mall_region` VALUES ('483', '41', '北戴河区', '3', '0');
INSERT INTO `mall_region` VALUES ('484', '41', '青龙满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('485', '41', '昌黎县', '3', '0');
INSERT INTO `mall_region` VALUES ('486', '41', '抚宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('487', '41', '卢龙县', '3', '0');
INSERT INTO `mall_region` VALUES ('488', '41', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('489', '41', '经济技术开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('490', '42', '邯山区', '3', '0');
INSERT INTO `mall_region` VALUES ('491', '42', '丛台区', '3', '0');
INSERT INTO `mall_region` VALUES ('492', '42', '复兴区', '3', '0');
INSERT INTO `mall_region` VALUES ('493', '42', '峰峰矿区', '3', '0');
INSERT INTO `mall_region` VALUES ('494', '42', '邯郸县', '3', '0');
INSERT INTO `mall_region` VALUES ('495', '42', '临漳县', '3', '0');
INSERT INTO `mall_region` VALUES ('496', '42', '成安县', '3', '0');
INSERT INTO `mall_region` VALUES ('497', '42', '大名县', '3', '0');
INSERT INTO `mall_region` VALUES ('498', '42', '涉县', '3', '0');
INSERT INTO `mall_region` VALUES ('499', '42', '磁县', '3', '0');
INSERT INTO `mall_region` VALUES ('500', '42', '肥乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('501', '42', '永年县', '3', '0');
INSERT INTO `mall_region` VALUES ('502', '42', '邱县', '3', '0');
INSERT INTO `mall_region` VALUES ('503', '42', '鸡泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('504', '42', '广平县', '3', '0');
INSERT INTO `mall_region` VALUES ('505', '42', '馆陶县', '3', '0');
INSERT INTO `mall_region` VALUES ('506', '42', '魏县', '3', '0');
INSERT INTO `mall_region` VALUES ('507', '42', '曲周县', '3', '0');
INSERT INTO `mall_region` VALUES ('508', '42', '武安市', '3', '0');
INSERT INTO `mall_region` VALUES ('509', '42', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('510', '43', '桥东区', '3', '0');
INSERT INTO `mall_region` VALUES ('511', '43', '桥西区', '3', '0');
INSERT INTO `mall_region` VALUES ('512', '43', '邢台县', '3', '0');
INSERT INTO `mall_region` VALUES ('513', '43', '临城县', '3', '0');
INSERT INTO `mall_region` VALUES ('514', '43', '内丘县', '3', '0');
INSERT INTO `mall_region` VALUES ('515', '43', '柏乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('516', '43', '隆尧县', '3', '0');
INSERT INTO `mall_region` VALUES ('517', '43', '任县', '3', '0');
INSERT INTO `mall_region` VALUES ('518', '43', '南和县', '3', '0');
INSERT INTO `mall_region` VALUES ('519', '43', '宁晋县', '3', '0');
INSERT INTO `mall_region` VALUES ('520', '43', '巨鹿县', '3', '0');
INSERT INTO `mall_region` VALUES ('521', '43', '新河县', '3', '0');
INSERT INTO `mall_region` VALUES ('522', '43', '广宗县', '3', '0');
INSERT INTO `mall_region` VALUES ('523', '43', '平乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('524', '43', '威县', '3', '0');
INSERT INTO `mall_region` VALUES ('525', '43', '清河县', '3', '0');
INSERT INTO `mall_region` VALUES ('526', '43', '临西县', '3', '0');
INSERT INTO `mall_region` VALUES ('527', '43', '南宫市', '3', '0');
INSERT INTO `mall_region` VALUES ('528', '43', '沙河市', '3', '0');
INSERT INTO `mall_region` VALUES ('529', '43', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('530', '44', '新市区', '3', '0');
INSERT INTO `mall_region` VALUES ('531', '44', '北市区', '3', '0');
INSERT INTO `mall_region` VALUES ('532', '44', '南市区', '3', '0');
INSERT INTO `mall_region` VALUES ('533', '44', '满城县', '3', '0');
INSERT INTO `mall_region` VALUES ('534', '44', '清苑县', '3', '0');
INSERT INTO `mall_region` VALUES ('535', '44', '涞水县', '3', '0');
INSERT INTO `mall_region` VALUES ('536', '44', '阜平县', '3', '0');
INSERT INTO `mall_region` VALUES ('537', '44', '徐水县', '3', '0');
INSERT INTO `mall_region` VALUES ('538', '44', '定兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('539', '44', '唐县', '3', '0');
INSERT INTO `mall_region` VALUES ('540', '44', '高阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('541', '44', '容城县', '3', '0');
INSERT INTO `mall_region` VALUES ('542', '44', '涞源县', '3', '0');
INSERT INTO `mall_region` VALUES ('543', '44', '望都县', '3', '0');
INSERT INTO `mall_region` VALUES ('544', '44', '安新县', '3', '0');
INSERT INTO `mall_region` VALUES ('545', '44', '易县', '3', '0');
INSERT INTO `mall_region` VALUES ('546', '44', '曲阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('547', '44', '蠡县', '3', '0');
INSERT INTO `mall_region` VALUES ('548', '44', '顺平县', '3', '0');
INSERT INTO `mall_region` VALUES ('549', '44', '博野县', '3', '0');
INSERT INTO `mall_region` VALUES ('550', '44', '雄县', '3', '0');
INSERT INTO `mall_region` VALUES ('551', '44', '涿州市', '3', '0');
INSERT INTO `mall_region` VALUES ('552', '44', '定州市', '3', '0');
INSERT INTO `mall_region` VALUES ('553', '44', '安国市', '3', '0');
INSERT INTO `mall_region` VALUES ('554', '44', '高碑店市', '3', '0');
INSERT INTO `mall_region` VALUES ('555', '44', '高开区', '3', '0');
INSERT INTO `mall_region` VALUES ('556', '44', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('557', '45', '桥东区', '3', '0');
INSERT INTO `mall_region` VALUES ('558', '45', '桥西区', '3', '0');
INSERT INTO `mall_region` VALUES ('559', '45', '宣化区', '3', '0');
INSERT INTO `mall_region` VALUES ('560', '45', '下花园区', '3', '0');
INSERT INTO `mall_region` VALUES ('561', '45', '宣化县', '3', '0');
INSERT INTO `mall_region` VALUES ('562', '45', '张北县', '3', '0');
INSERT INTO `mall_region` VALUES ('563', '45', '康保县', '3', '0');
INSERT INTO `mall_region` VALUES ('564', '45', '沽源县', '3', '0');
INSERT INTO `mall_region` VALUES ('565', '45', '尚义县', '3', '0');
INSERT INTO `mall_region` VALUES ('566', '45', '蔚县', '3', '0');
INSERT INTO `mall_region` VALUES ('567', '45', '阳原县', '3', '0');
INSERT INTO `mall_region` VALUES ('568', '45', '怀安县', '3', '0');
INSERT INTO `mall_region` VALUES ('569', '45', '万全县', '3', '0');
INSERT INTO `mall_region` VALUES ('570', '45', '怀来县', '3', '0');
INSERT INTO `mall_region` VALUES ('571', '45', '涿鹿县', '3', '0');
INSERT INTO `mall_region` VALUES ('572', '45', '赤城县', '3', '0');
INSERT INTO `mall_region` VALUES ('573', '45', '崇礼县', '3', '0');
INSERT INTO `mall_region` VALUES ('574', '45', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('575', '46', '双桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('576', '46', '双滦区', '3', '0');
INSERT INTO `mall_region` VALUES ('577', '46', '鹰手营子矿区', '3', '0');
INSERT INTO `mall_region` VALUES ('578', '46', '承德县', '3', '0');
INSERT INTO `mall_region` VALUES ('579', '46', '兴隆县', '3', '0');
INSERT INTO `mall_region` VALUES ('580', '46', '平泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('581', '46', '滦平县', '3', '0');
INSERT INTO `mall_region` VALUES ('582', '46', '隆化县', '3', '0');
INSERT INTO `mall_region` VALUES ('583', '46', '丰宁满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('584', '46', '宽城满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('585', '46', '围场满族蒙古族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('586', '46', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('587', '47', '新华区', '3', '0');
INSERT INTO `mall_region` VALUES ('588', '47', '运河区', '3', '0');
INSERT INTO `mall_region` VALUES ('589', '47', '沧县', '3', '0');
INSERT INTO `mall_region` VALUES ('590', '47', '青县', '3', '0');
INSERT INTO `mall_region` VALUES ('591', '47', '东光县', '3', '0');
INSERT INTO `mall_region` VALUES ('592', '47', '海兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('593', '47', '盐山县', '3', '0');
INSERT INTO `mall_region` VALUES ('594', '47', '肃宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('595', '47', '南皮县', '3', '0');
INSERT INTO `mall_region` VALUES ('596', '47', '吴桥县', '3', '0');
INSERT INTO `mall_region` VALUES ('597', '47', '献县', '3', '0');
INSERT INTO `mall_region` VALUES ('598', '47', '孟村回族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('599', '47', '泊头市', '3', '0');
INSERT INTO `mall_region` VALUES ('600', '47', '任丘市', '3', '0');
INSERT INTO `mall_region` VALUES ('601', '47', '黄骅市', '3', '0');
INSERT INTO `mall_region` VALUES ('602', '47', '河间市', '3', '0');
INSERT INTO `mall_region` VALUES ('603', '47', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('604', '48', '安次区', '3', '0');
INSERT INTO `mall_region` VALUES ('605', '48', '广阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('606', '48', '固安县', '3', '0');
INSERT INTO `mall_region` VALUES ('607', '48', '永清县', '3', '0');
INSERT INTO `mall_region` VALUES ('608', '48', '香河县', '3', '0');
INSERT INTO `mall_region` VALUES ('609', '48', '大城县', '3', '0');
INSERT INTO `mall_region` VALUES ('610', '48', '文安县', '3', '0');
INSERT INTO `mall_region` VALUES ('611', '48', '大厂回族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('612', '48', '开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('613', '48', '燕郊经济技术开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('614', '48', '霸州市', '3', '0');
INSERT INTO `mall_region` VALUES ('615', '48', '三河市', '3', '0');
INSERT INTO `mall_region` VALUES ('616', '48', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('617', '49', '桃城区', '3', '0');
INSERT INTO `mall_region` VALUES ('618', '49', '枣强县', '3', '0');
INSERT INTO `mall_region` VALUES ('619', '49', '武邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('620', '49', '武强县', '3', '0');
INSERT INTO `mall_region` VALUES ('621', '49', '饶阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('622', '49', '安平县', '3', '0');
INSERT INTO `mall_region` VALUES ('623', '49', '故城县', '3', '0');
INSERT INTO `mall_region` VALUES ('624', '49', '景县', '3', '0');
INSERT INTO `mall_region` VALUES ('625', '49', '阜城县', '3', '0');
INSERT INTO `mall_region` VALUES ('626', '49', '冀州市', '3', '0');
INSERT INTO `mall_region` VALUES ('627', '49', '深州市', '3', '0');
INSERT INTO `mall_region` VALUES ('628', '49', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('629', '50', '小店区', '3', '0');
INSERT INTO `mall_region` VALUES ('630', '50', '迎泽区', '3', '0');
INSERT INTO `mall_region` VALUES ('631', '50', '杏花岭区', '3', '0');
INSERT INTO `mall_region` VALUES ('632', '50', '尖草坪区', '3', '0');
INSERT INTO `mall_region` VALUES ('633', '50', '万柏林区', '3', '0');
INSERT INTO `mall_region` VALUES ('634', '50', '晋源区', '3', '0');
INSERT INTO `mall_region` VALUES ('635', '50', '清徐县', '3', '0');
INSERT INTO `mall_region` VALUES ('636', '50', '阳曲县', '3', '0');
INSERT INTO `mall_region` VALUES ('637', '50', '娄烦县', '3', '0');
INSERT INTO `mall_region` VALUES ('638', '50', '古交市', '3', '0');
INSERT INTO `mall_region` VALUES ('639', '50', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('640', '51', '城区', '3', '0');
INSERT INTO `mall_region` VALUES ('641', '51', '矿区', '3', '0');
INSERT INTO `mall_region` VALUES ('642', '51', '南郊区', '3', '0');
INSERT INTO `mall_region` VALUES ('643', '51', '新荣区', '3', '0');
INSERT INTO `mall_region` VALUES ('644', '51', '阳高县', '3', '0');
INSERT INTO `mall_region` VALUES ('645', '51', '天镇县', '3', '0');
INSERT INTO `mall_region` VALUES ('646', '51', '广灵县', '3', '0');
INSERT INTO `mall_region` VALUES ('647', '51', '灵丘县', '3', '0');
INSERT INTO `mall_region` VALUES ('648', '51', '浑源县', '3', '0');
INSERT INTO `mall_region` VALUES ('649', '51', '左云县', '3', '0');
INSERT INTO `mall_region` VALUES ('650', '51', '大同县', '3', '0');
INSERT INTO `mall_region` VALUES ('651', '51', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('652', '52', '城区', '3', '0');
INSERT INTO `mall_region` VALUES ('653', '52', '矿区', '3', '0');
INSERT INTO `mall_region` VALUES ('654', '52', '郊区', '3', '0');
INSERT INTO `mall_region` VALUES ('655', '52', '平定县', '3', '0');
INSERT INTO `mall_region` VALUES ('656', '52', '盂县', '3', '0');
INSERT INTO `mall_region` VALUES ('657', '52', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('658', '53', '长治县', '3', '0');
INSERT INTO `mall_region` VALUES ('659', '53', '襄垣县', '3', '0');
INSERT INTO `mall_region` VALUES ('660', '53', '屯留县', '3', '0');
INSERT INTO `mall_region` VALUES ('661', '53', '平顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('662', '53', '黎城县', '3', '0');
INSERT INTO `mall_region` VALUES ('663', '53', '壶关县', '3', '0');
INSERT INTO `mall_region` VALUES ('664', '53', '长子县', '3', '0');
INSERT INTO `mall_region` VALUES ('665', '53', '武乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('666', '53', '沁县', '3', '0');
INSERT INTO `mall_region` VALUES ('667', '53', '沁源县', '3', '0');
INSERT INTO `mall_region` VALUES ('668', '53', '潞城市', '3', '0');
INSERT INTO `mall_region` VALUES ('669', '53', '城区', '3', '0');
INSERT INTO `mall_region` VALUES ('670', '53', '郊区', '3', '0');
INSERT INTO `mall_region` VALUES ('671', '53', '高新区', '3', '0');
INSERT INTO `mall_region` VALUES ('672', '53', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('673', '54', '城区', '3', '0');
INSERT INTO `mall_region` VALUES ('674', '54', '沁水县', '3', '0');
INSERT INTO `mall_region` VALUES ('675', '54', '阳城县', '3', '0');
INSERT INTO `mall_region` VALUES ('676', '54', '陵川县', '3', '0');
INSERT INTO `mall_region` VALUES ('677', '54', '泽州县', '3', '0');
INSERT INTO `mall_region` VALUES ('678', '54', '高平市', '3', '0');
INSERT INTO `mall_region` VALUES ('679', '54', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('680', '55', '朔城区', '3', '0');
INSERT INTO `mall_region` VALUES ('681', '55', '平鲁区', '3', '0');
INSERT INTO `mall_region` VALUES ('682', '55', '山阴县', '3', '0');
INSERT INTO `mall_region` VALUES ('683', '55', '应县', '3', '0');
INSERT INTO `mall_region` VALUES ('684', '55', '右玉县', '3', '0');
INSERT INTO `mall_region` VALUES ('685', '55', '怀仁县', '3', '0');
INSERT INTO `mall_region` VALUES ('686', '55', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('687', '56', '榆次区', '3', '0');
INSERT INTO `mall_region` VALUES ('688', '56', '榆社县', '3', '0');
INSERT INTO `mall_region` VALUES ('689', '56', '左权县', '3', '0');
INSERT INTO `mall_region` VALUES ('690', '56', '和顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('691', '56', '昔阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('692', '56', '寿阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('693', '56', '太谷县', '3', '0');
INSERT INTO `mall_region` VALUES ('694', '56', '祁县', '3', '0');
INSERT INTO `mall_region` VALUES ('695', '56', '平遥县', '3', '0');
INSERT INTO `mall_region` VALUES ('696', '56', '灵石县', '3', '0');
INSERT INTO `mall_region` VALUES ('697', '56', '介休市', '3', '0');
INSERT INTO `mall_region` VALUES ('698', '56', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('699', '57', '盐湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('700', '57', '临猗县', '3', '0');
INSERT INTO `mall_region` VALUES ('701', '57', '万荣县', '3', '0');
INSERT INTO `mall_region` VALUES ('702', '57', '闻喜县', '3', '0');
INSERT INTO `mall_region` VALUES ('703', '57', '稷山县', '3', '0');
INSERT INTO `mall_region` VALUES ('704', '57', '新绛县', '3', '0');
INSERT INTO `mall_region` VALUES ('705', '57', '绛县', '3', '0');
INSERT INTO `mall_region` VALUES ('706', '57', '垣曲县', '3', '0');
INSERT INTO `mall_region` VALUES ('707', '57', '夏县', '3', '0');
INSERT INTO `mall_region` VALUES ('708', '57', '平陆县', '3', '0');
INSERT INTO `mall_region` VALUES ('709', '57', '芮城县', '3', '0');
INSERT INTO `mall_region` VALUES ('710', '57', '永济市', '3', '0');
INSERT INTO `mall_region` VALUES ('711', '57', '河津市', '3', '0');
INSERT INTO `mall_region` VALUES ('712', '57', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('713', '58', '忻府区', '3', '0');
INSERT INTO `mall_region` VALUES ('714', '58', '定襄县', '3', '0');
INSERT INTO `mall_region` VALUES ('715', '58', '五台县', '3', '0');
INSERT INTO `mall_region` VALUES ('716', '58', '代县', '3', '0');
INSERT INTO `mall_region` VALUES ('717', '58', '繁峙县', '3', '0');
INSERT INTO `mall_region` VALUES ('718', '58', '宁武县', '3', '0');
INSERT INTO `mall_region` VALUES ('719', '58', '静乐县', '3', '0');
INSERT INTO `mall_region` VALUES ('720', '58', '神池县', '3', '0');
INSERT INTO `mall_region` VALUES ('721', '58', '五寨县', '3', '0');
INSERT INTO `mall_region` VALUES ('722', '58', '岢岚县', '3', '0');
INSERT INTO `mall_region` VALUES ('723', '58', '河曲县', '3', '0');
INSERT INTO `mall_region` VALUES ('724', '58', '保德县', '3', '0');
INSERT INTO `mall_region` VALUES ('725', '58', '偏关县', '3', '0');
INSERT INTO `mall_region` VALUES ('726', '58', '原平市', '3', '0');
INSERT INTO `mall_region` VALUES ('727', '58', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('728', '59', '尧都区', '3', '0');
INSERT INTO `mall_region` VALUES ('729', '59', '曲沃县', '3', '0');
INSERT INTO `mall_region` VALUES ('730', '59', '翼城县', '3', '0');
INSERT INTO `mall_region` VALUES ('731', '59', '襄汾县', '3', '0');
INSERT INTO `mall_region` VALUES ('732', '59', '洪洞县', '3', '0');
INSERT INTO `mall_region` VALUES ('733', '59', '古县', '3', '0');
INSERT INTO `mall_region` VALUES ('734', '59', '安泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('735', '59', '浮山县', '3', '0');
INSERT INTO `mall_region` VALUES ('736', '59', '吉县', '3', '0');
INSERT INTO `mall_region` VALUES ('737', '59', '乡宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('738', '59', '大宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('739', '59', '隰县', '3', '0');
INSERT INTO `mall_region` VALUES ('740', '59', '永和县', '3', '0');
INSERT INTO `mall_region` VALUES ('741', '59', '蒲县', '3', '0');
INSERT INTO `mall_region` VALUES ('742', '59', '汾西县', '3', '0');
INSERT INTO `mall_region` VALUES ('743', '59', '侯马市', '3', '0');
INSERT INTO `mall_region` VALUES ('744', '59', '霍州市', '3', '0');
INSERT INTO `mall_region` VALUES ('745', '59', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('746', '60', '离石区', '3', '0');
INSERT INTO `mall_region` VALUES ('747', '60', '文水县', '3', '0');
INSERT INTO `mall_region` VALUES ('748', '60', '交城县', '3', '0');
INSERT INTO `mall_region` VALUES ('749', '60', '兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('750', '60', '临县', '3', '0');
INSERT INTO `mall_region` VALUES ('751', '60', '柳林县', '3', '0');
INSERT INTO `mall_region` VALUES ('752', '60', '石楼县', '3', '0');
INSERT INTO `mall_region` VALUES ('753', '60', '岚县', '3', '0');
INSERT INTO `mall_region` VALUES ('754', '60', '方山县', '3', '0');
INSERT INTO `mall_region` VALUES ('755', '60', '中阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('756', '60', '交口县', '3', '0');
INSERT INTO `mall_region` VALUES ('757', '60', '孝义市', '3', '0');
INSERT INTO `mall_region` VALUES ('758', '60', '汾阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('759', '60', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('760', '61', '新城区', '3', '0');
INSERT INTO `mall_region` VALUES ('761', '61', '回民区', '3', '0');
INSERT INTO `mall_region` VALUES ('762', '61', '玉泉区', '3', '0');
INSERT INTO `mall_region` VALUES ('763', '61', '赛罕区', '3', '0');
INSERT INTO `mall_region` VALUES ('764', '61', '土默特左旗', '3', '0');
INSERT INTO `mall_region` VALUES ('765', '61', '托克托县', '3', '0');
INSERT INTO `mall_region` VALUES ('766', '61', '和林格尔县', '3', '0');
INSERT INTO `mall_region` VALUES ('767', '61', '清水河县', '3', '0');
INSERT INTO `mall_region` VALUES ('768', '61', '武川县', '3', '0');
INSERT INTO `mall_region` VALUES ('769', '61', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('770', '62', '东河区', '3', '0');
INSERT INTO `mall_region` VALUES ('771', '62', '昆都仑区', '3', '0');
INSERT INTO `mall_region` VALUES ('772', '62', '青山区', '3', '0');
INSERT INTO `mall_region` VALUES ('773', '62', '石拐区', '3', '0');
INSERT INTO `mall_region` VALUES ('774', '62', '白云鄂博矿区', '3', '0');
INSERT INTO `mall_region` VALUES ('775', '62', '九原区', '3', '0');
INSERT INTO `mall_region` VALUES ('776', '62', '土默特右旗', '3', '0');
INSERT INTO `mall_region` VALUES ('777', '62', '固阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('778', '62', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `mall_region` VALUES ('779', '62', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('780', '63', '海勃湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('781', '63', '海南区', '3', '0');
INSERT INTO `mall_region` VALUES ('782', '63', '乌达区', '3', '0');
INSERT INTO `mall_region` VALUES ('783', '63', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('784', '64', '红山区', '3', '0');
INSERT INTO `mall_region` VALUES ('785', '64', '元宝山区', '3', '0');
INSERT INTO `mall_region` VALUES ('786', '64', '松山区', '3', '0');
INSERT INTO `mall_region` VALUES ('787', '64', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `mall_region` VALUES ('788', '64', '巴林左旗', '3', '0');
INSERT INTO `mall_region` VALUES ('789', '64', '巴林右旗', '3', '0');
INSERT INTO `mall_region` VALUES ('790', '64', '林西县', '3', '0');
INSERT INTO `mall_region` VALUES ('791', '64', '克什克腾旗', '3', '0');
INSERT INTO `mall_region` VALUES ('792', '64', '翁牛特旗', '3', '0');
INSERT INTO `mall_region` VALUES ('793', '64', '喀喇沁旗', '3', '0');
INSERT INTO `mall_region` VALUES ('794', '64', '宁城县', '3', '0');
INSERT INTO `mall_region` VALUES ('795', '64', '敖汉旗', '3', '0');
INSERT INTO `mall_region` VALUES ('796', '64', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('797', '65', '科尔沁区', '3', '0');
INSERT INTO `mall_region` VALUES ('798', '65', '科尔沁左翼中旗', '3', '0');
INSERT INTO `mall_region` VALUES ('799', '65', '科尔沁左翼后旗', '3', '0');
INSERT INTO `mall_region` VALUES ('800', '65', '开鲁县', '3', '0');
INSERT INTO `mall_region` VALUES ('801', '65', '库伦旗', '3', '0');
INSERT INTO `mall_region` VALUES ('802', '65', '奈曼旗', '3', '0');
INSERT INTO `mall_region` VALUES ('803', '65', '扎鲁特旗', '3', '0');
INSERT INTO `mall_region` VALUES ('804', '65', '霍林郭勒市', '3', '0');
INSERT INTO `mall_region` VALUES ('805', '65', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('806', '66', '东胜区', '3', '0');
INSERT INTO `mall_region` VALUES ('807', '66', '达拉特旗', '3', '0');
INSERT INTO `mall_region` VALUES ('808', '66', '准格尔旗', '3', '0');
INSERT INTO `mall_region` VALUES ('809', '66', '鄂托克前旗', '3', '0');
INSERT INTO `mall_region` VALUES ('810', '66', '鄂托克旗', '3', '0');
INSERT INTO `mall_region` VALUES ('811', '66', '杭锦旗', '3', '0');
INSERT INTO `mall_region` VALUES ('812', '66', '乌审旗', '3', '0');
INSERT INTO `mall_region` VALUES ('813', '66', '伊金霍洛旗', '3', '0');
INSERT INTO `mall_region` VALUES ('814', '66', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('815', '67', '海拉尔区', '3', '0');
INSERT INTO `mall_region` VALUES ('816', '67', '扎赉诺尔区', '3', '0');
INSERT INTO `mall_region` VALUES ('817', '67', '阿荣旗', '3', '0');
INSERT INTO `mall_region` VALUES ('818', '67', '莫力达瓦达斡尔族自治旗', '3', '0');
INSERT INTO `mall_region` VALUES ('819', '67', '鄂伦春自治旗', '3', '0');
INSERT INTO `mall_region` VALUES ('820', '67', '鄂温克族自治旗', '3', '0');
INSERT INTO `mall_region` VALUES ('821', '67', '陈巴尔虎旗', '3', '0');
INSERT INTO `mall_region` VALUES ('822', '67', '新巴尔虎左旗', '3', '0');
INSERT INTO `mall_region` VALUES ('823', '67', '新巴尔虎右旗', '3', '0');
INSERT INTO `mall_region` VALUES ('824', '67', '满洲里市', '3', '0');
INSERT INTO `mall_region` VALUES ('825', '67', '牙克石市', '3', '0');
INSERT INTO `mall_region` VALUES ('826', '67', '扎兰屯市', '3', '0');
INSERT INTO `mall_region` VALUES ('827', '67', '额尔古纳市', '3', '0');
INSERT INTO `mall_region` VALUES ('828', '67', '根河市', '3', '0');
INSERT INTO `mall_region` VALUES ('829', '67', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('830', '68', '临河区', '3', '0');
INSERT INTO `mall_region` VALUES ('831', '68', '五原县', '3', '0');
INSERT INTO `mall_region` VALUES ('832', '68', '磴口县', '3', '0');
INSERT INTO `mall_region` VALUES ('833', '68', '乌拉特前旗', '3', '0');
INSERT INTO `mall_region` VALUES ('834', '68', '乌拉特中旗', '3', '0');
INSERT INTO `mall_region` VALUES ('835', '68', '乌拉特后旗', '3', '0');
INSERT INTO `mall_region` VALUES ('836', '68', '杭锦后旗', '3', '0');
INSERT INTO `mall_region` VALUES ('837', '68', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('838', '69', '集宁区', '3', '0');
INSERT INTO `mall_region` VALUES ('839', '69', '卓资县', '3', '0');
INSERT INTO `mall_region` VALUES ('840', '69', '化德县', '3', '0');
INSERT INTO `mall_region` VALUES ('841', '69', '商都县', '3', '0');
INSERT INTO `mall_region` VALUES ('842', '69', '兴和县', '3', '0');
INSERT INTO `mall_region` VALUES ('843', '69', '凉城县', '3', '0');
INSERT INTO `mall_region` VALUES ('844', '69', '察哈尔右翼前旗', '3', '0');
INSERT INTO `mall_region` VALUES ('845', '69', '察哈尔右翼中旗', '3', '0');
INSERT INTO `mall_region` VALUES ('846', '69', '察哈尔右翼后旗', '3', '0');
INSERT INTO `mall_region` VALUES ('847', '69', '四子王旗', '3', '0');
INSERT INTO `mall_region` VALUES ('848', '69', '丰镇市', '3', '0');
INSERT INTO `mall_region` VALUES ('849', '69', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('850', '70', '乌兰浩特市', '3', '0');
INSERT INTO `mall_region` VALUES ('851', '70', '阿尔山市', '3', '0');
INSERT INTO `mall_region` VALUES ('852', '70', '科尔沁右翼前旗', '3', '0');
INSERT INTO `mall_region` VALUES ('853', '70', '科尔沁右翼中旗', '3', '0');
INSERT INTO `mall_region` VALUES ('854', '70', '扎赉特旗', '3', '0');
INSERT INTO `mall_region` VALUES ('855', '70', '突泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('856', '70', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('857', '71', '二连浩特市', '3', '0');
INSERT INTO `mall_region` VALUES ('858', '71', '锡林浩特市', '3', '0');
INSERT INTO `mall_region` VALUES ('859', '71', '阿巴嘎旗', '3', '0');
INSERT INTO `mall_region` VALUES ('860', '71', '苏尼特左旗', '3', '0');
INSERT INTO `mall_region` VALUES ('861', '71', '苏尼特右旗', '3', '0');
INSERT INTO `mall_region` VALUES ('862', '71', '东乌珠穆沁旗', '3', '0');
INSERT INTO `mall_region` VALUES ('863', '71', '西乌珠穆沁旗', '3', '0');
INSERT INTO `mall_region` VALUES ('864', '71', '太仆寺旗', '3', '0');
INSERT INTO `mall_region` VALUES ('865', '71', '镶黄旗', '3', '0');
INSERT INTO `mall_region` VALUES ('866', '71', '正镶白旗', '3', '0');
INSERT INTO `mall_region` VALUES ('867', '71', '正蓝旗', '3', '0');
INSERT INTO `mall_region` VALUES ('868', '71', '多伦县', '3', '0');
INSERT INTO `mall_region` VALUES ('869', '71', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('870', '72', '阿拉善左旗', '3', '0');
INSERT INTO `mall_region` VALUES ('871', '72', '阿拉善右旗', '3', '0');
INSERT INTO `mall_region` VALUES ('872', '72', '额济纳旗', '3', '0');
INSERT INTO `mall_region` VALUES ('873', '72', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('874', '73', '和平区', '3', '0');
INSERT INTO `mall_region` VALUES ('875', '73', '沈河区', '3', '0');
INSERT INTO `mall_region` VALUES ('876', '73', '大东区', '3', '0');
INSERT INTO `mall_region` VALUES ('877', '73', '皇姑区', '3', '0');
INSERT INTO `mall_region` VALUES ('878', '73', '铁西区', '3', '0');
INSERT INTO `mall_region` VALUES ('879', '73', '苏家屯区', '3', '0');
INSERT INTO `mall_region` VALUES ('880', '73', '浑南区', '3', '0');
INSERT INTO `mall_region` VALUES ('881', '73', '新城子区', '3', '0');
INSERT INTO `mall_region` VALUES ('882', '73', '于洪区', '3', '0');
INSERT INTO `mall_region` VALUES ('883', '73', '辽中县', '3', '0');
INSERT INTO `mall_region` VALUES ('884', '73', '康平县', '3', '0');
INSERT INTO `mall_region` VALUES ('885', '73', '法库县', '3', '0');
INSERT INTO `mall_region` VALUES ('886', '73', '新民市', '3', '0');
INSERT INTO `mall_region` VALUES ('887', '73', '浑南新区', '3', '0');
INSERT INTO `mall_region` VALUES ('888', '73', '张士开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('889', '73', '沈北新区', '3', '0');
INSERT INTO `mall_region` VALUES ('890', '73', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('891', '74', '中山区', '3', '0');
INSERT INTO `mall_region` VALUES ('892', '74', '西岗区', '3', '0');
INSERT INTO `mall_region` VALUES ('893', '74', '沙河口区', '3', '0');
INSERT INTO `mall_region` VALUES ('894', '74', '甘井子区', '3', '0');
INSERT INTO `mall_region` VALUES ('895', '74', '旅顺口区', '3', '0');
INSERT INTO `mall_region` VALUES ('896', '74', '金州区', '3', '0');
INSERT INTO `mall_region` VALUES ('897', '74', '长海县', '3', '0');
INSERT INTO `mall_region` VALUES ('898', '74', '开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('899', '74', '瓦房店市', '3', '0');
INSERT INTO `mall_region` VALUES ('900', '74', '普兰店市', '3', '0');
INSERT INTO `mall_region` VALUES ('901', '74', '庄河市', '3', '0');
INSERT INTO `mall_region` VALUES ('902', '74', '岭前区', '3', '0');
INSERT INTO `mall_region` VALUES ('903', '74', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('904', '75', '铁东区', '3', '0');
INSERT INTO `mall_region` VALUES ('905', '75', '铁西区', '3', '0');
INSERT INTO `mall_region` VALUES ('906', '75', '立山区', '3', '0');
INSERT INTO `mall_region` VALUES ('907', '75', '千山区', '3', '0');
INSERT INTO `mall_region` VALUES ('908', '75', '台安县', '3', '0');
INSERT INTO `mall_region` VALUES ('909', '75', '岫岩满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('910', '75', '高新区', '3', '0');
INSERT INTO `mall_region` VALUES ('911', '75', '海城市', '3', '0');
INSERT INTO `mall_region` VALUES ('912', '75', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('913', '76', '新抚区', '3', '0');
INSERT INTO `mall_region` VALUES ('914', '76', '东洲区', '3', '0');
INSERT INTO `mall_region` VALUES ('915', '76', '望花区', '3', '0');
INSERT INTO `mall_region` VALUES ('916', '76', '顺城区', '3', '0');
INSERT INTO `mall_region` VALUES ('917', '76', '抚顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('918', '76', '新宾满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('919', '76', '清原满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('920', '76', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('921', '77', '平山区', '3', '0');
INSERT INTO `mall_region` VALUES ('922', '77', '溪湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('923', '77', '明山区', '3', '0');
INSERT INTO `mall_region` VALUES ('924', '77', '南芬区', '3', '0');
INSERT INTO `mall_region` VALUES ('925', '77', '本溪满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('926', '77', '桓仁满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('927', '77', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('928', '78', '元宝区', '3', '0');
INSERT INTO `mall_region` VALUES ('929', '78', '振兴区', '3', '0');
INSERT INTO `mall_region` VALUES ('930', '78', '振安区', '3', '0');
INSERT INTO `mall_region` VALUES ('931', '78', '宽甸满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('932', '78', '东港市', '3', '0');
INSERT INTO `mall_region` VALUES ('933', '78', '凤城市', '3', '0');
INSERT INTO `mall_region` VALUES ('934', '78', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('935', '79', '古塔区', '3', '0');
INSERT INTO `mall_region` VALUES ('936', '79', '凌河区', '3', '0');
INSERT INTO `mall_region` VALUES ('937', '79', '太和区', '3', '0');
INSERT INTO `mall_region` VALUES ('938', '79', '黑山县', '3', '0');
INSERT INTO `mall_region` VALUES ('939', '79', '义县', '3', '0');
INSERT INTO `mall_region` VALUES ('940', '79', '凌海市', '3', '0');
INSERT INTO `mall_region` VALUES ('941', '79', '北镇市', '3', '0');
INSERT INTO `mall_region` VALUES ('942', '79', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('943', '80', '站前区', '3', '0');
INSERT INTO `mall_region` VALUES ('944', '80', '西市区', '3', '0');
INSERT INTO `mall_region` VALUES ('945', '80', '鲅鱼圈区', '3', '0');
INSERT INTO `mall_region` VALUES ('946', '80', '老边区', '3', '0');
INSERT INTO `mall_region` VALUES ('947', '80', '盖州市', '3', '0');
INSERT INTO `mall_region` VALUES ('948', '80', '大石桥市', '3', '0');
INSERT INTO `mall_region` VALUES ('949', '80', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('950', '81', '海州区', '3', '0');
INSERT INTO `mall_region` VALUES ('951', '81', '新邱区', '3', '0');
INSERT INTO `mall_region` VALUES ('952', '81', '太平区', '3', '0');
INSERT INTO `mall_region` VALUES ('953', '81', '清河门区', '3', '0');
INSERT INTO `mall_region` VALUES ('954', '81', '细河区', '3', '0');
INSERT INTO `mall_region` VALUES ('955', '81', '阜新蒙古族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('956', '81', '彰武县', '3', '0');
INSERT INTO `mall_region` VALUES ('957', '81', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('958', '82', '白塔区', '3', '0');
INSERT INTO `mall_region` VALUES ('959', '82', '文圣区', '3', '0');
INSERT INTO `mall_region` VALUES ('960', '82', '宏伟区', '3', '0');
INSERT INTO `mall_region` VALUES ('961', '82', '弓长岭区', '3', '0');
INSERT INTO `mall_region` VALUES ('962', '82', '太子河区', '3', '0');
INSERT INTO `mall_region` VALUES ('963', '82', '辽阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('964', '82', '灯塔市', '3', '0');
INSERT INTO `mall_region` VALUES ('965', '82', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('966', '83', '双台子区', '3', '0');
INSERT INTO `mall_region` VALUES ('967', '83', '兴隆台区', '3', '0');
INSERT INTO `mall_region` VALUES ('968', '83', '大洼县', '3', '0');
INSERT INTO `mall_region` VALUES ('969', '83', '盘山县', '3', '0');
INSERT INTO `mall_region` VALUES ('970', '83', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('971', '84', '银州区', '3', '0');
INSERT INTO `mall_region` VALUES ('972', '84', '清河区', '3', '0');
INSERT INTO `mall_region` VALUES ('973', '84', '铁岭县', '3', '0');
INSERT INTO `mall_region` VALUES ('974', '84', '西丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('975', '84', '昌图县', '3', '0');
INSERT INTO `mall_region` VALUES ('976', '84', '调兵山市', '3', '0');
INSERT INTO `mall_region` VALUES ('977', '84', '开原市', '3', '0');
INSERT INTO `mall_region` VALUES ('978', '84', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('979', '85', '双塔区', '3', '0');
INSERT INTO `mall_region` VALUES ('980', '85', '龙城区', '3', '0');
INSERT INTO `mall_region` VALUES ('981', '85', '朝阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('982', '85', '建平县', '3', '0');
INSERT INTO `mall_region` VALUES ('983', '85', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('984', '85', '北票市', '3', '0');
INSERT INTO `mall_region` VALUES ('985', '85', '凌源市', '3', '0');
INSERT INTO `mall_region` VALUES ('986', '85', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('987', '86', '连山区', '3', '0');
INSERT INTO `mall_region` VALUES ('988', '86', '龙港区', '3', '0');
INSERT INTO `mall_region` VALUES ('989', '86', '南票区', '3', '0');
INSERT INTO `mall_region` VALUES ('990', '86', '绥中县', '3', '0');
INSERT INTO `mall_region` VALUES ('991', '86', '建昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('992', '86', '兴城市', '3', '0');
INSERT INTO `mall_region` VALUES ('993', '86', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('994', '87', '南关区', '3', '0');
INSERT INTO `mall_region` VALUES ('995', '87', '宽城区', '3', '0');
INSERT INTO `mall_region` VALUES ('996', '87', '朝阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('997', '87', '二道区', '3', '0');
INSERT INTO `mall_region` VALUES ('998', '87', '绿园区', '3', '0');
INSERT INTO `mall_region` VALUES ('999', '87', '双阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1000', '87', '农安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1001', '87', '九台区', '3', '0');
INSERT INTO `mall_region` VALUES ('1002', '87', '榆树市', '3', '0');
INSERT INTO `mall_region` VALUES ('1003', '87', '德惠市', '3', '0');
INSERT INTO `mall_region` VALUES ('1004', '87', '高新技术产业开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1005', '87', '汽车产业开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1006', '87', '经济技术开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1007', '87', '净月旅游开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1008', '87', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1009', '88', '昌邑区', '3', '0');
INSERT INTO `mall_region` VALUES ('1010', '88', '龙潭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1011', '88', '船营区', '3', '0');
INSERT INTO `mall_region` VALUES ('1012', '88', '丰满区', '3', '0');
INSERT INTO `mall_region` VALUES ('1013', '88', '永吉县', '3', '0');
INSERT INTO `mall_region` VALUES ('1014', '88', '蛟河市', '3', '0');
INSERT INTO `mall_region` VALUES ('1015', '88', '桦甸市', '3', '0');
INSERT INTO `mall_region` VALUES ('1016', '88', '舒兰市', '3', '0');
INSERT INTO `mall_region` VALUES ('1017', '88', '磐石市', '3', '0');
INSERT INTO `mall_region` VALUES ('1018', '88', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1019', '89', '铁西区', '3', '0');
INSERT INTO `mall_region` VALUES ('1020', '89', '铁东区', '3', '0');
INSERT INTO `mall_region` VALUES ('1021', '89', '梨树县', '3', '0');
INSERT INTO `mall_region` VALUES ('1022', '89', '伊通满族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('1023', '89', '公主岭市', '3', '0');
INSERT INTO `mall_region` VALUES ('1024', '89', '双辽市', '3', '0');
INSERT INTO `mall_region` VALUES ('1025', '89', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1026', '90', '龙山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1027', '90', '西安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1028', '90', '东丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1029', '90', '东辽县', '3', '0');
INSERT INTO `mall_region` VALUES ('1030', '90', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1031', '91', '东昌区', '3', '0');
INSERT INTO `mall_region` VALUES ('1032', '91', '二道江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1033', '91', '通化县', '3', '0');
INSERT INTO `mall_region` VALUES ('1034', '91', '辉南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1035', '91', '柳河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1036', '91', '梅河口市', '3', '0');
INSERT INTO `mall_region` VALUES ('1037', '91', '集安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1038', '91', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1039', '92', '浑江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1040', '92', '抚松县', '3', '0');
INSERT INTO `mall_region` VALUES ('1041', '92', '靖宇县', '3', '0');
INSERT INTO `mall_region` VALUES ('1042', '92', '长白朝鲜族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('1043', '92', '江源区', '3', '0');
INSERT INTO `mall_region` VALUES ('1044', '92', '临江市', '3', '0');
INSERT INTO `mall_region` VALUES ('1045', '92', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1046', '93', '宁江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1047', '93', '前郭尔罗斯蒙古族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('1048', '93', '长岭县', '3', '0');
INSERT INTO `mall_region` VALUES ('1049', '93', '乾安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1050', '93', '扶余市', '3', '0');
INSERT INTO `mall_region` VALUES ('1051', '93', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1052', '94', '洮北区', '3', '0');
INSERT INTO `mall_region` VALUES ('1053', '94', '镇赉县', '3', '0');
INSERT INTO `mall_region` VALUES ('1054', '94', '通榆县', '3', '0');
INSERT INTO `mall_region` VALUES ('1055', '94', '洮南市', '3', '0');
INSERT INTO `mall_region` VALUES ('1056', '94', '大安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1057', '94', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1058', '95', '延吉市', '3', '0');
INSERT INTO `mall_region` VALUES ('1059', '95', '图们市', '3', '0');
INSERT INTO `mall_region` VALUES ('1060', '95', '敦化市', '3', '0');
INSERT INTO `mall_region` VALUES ('1061', '95', '珲春市', '3', '0');
INSERT INTO `mall_region` VALUES ('1062', '95', '龙井市', '3', '0');
INSERT INTO `mall_region` VALUES ('1063', '95', '和龙市', '3', '0');
INSERT INTO `mall_region` VALUES ('1064', '95', '汪清县', '3', '0');
INSERT INTO `mall_region` VALUES ('1065', '95', '安图县', '3', '0');
INSERT INTO `mall_region` VALUES ('1066', '95', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1067', '96', '道里区', '3', '0');
INSERT INTO `mall_region` VALUES ('1068', '96', '南岗区', '3', '0');
INSERT INTO `mall_region` VALUES ('1069', '96', '道外区', '3', '0');
INSERT INTO `mall_region` VALUES ('1070', '96', '香坊区', '3', '0');
INSERT INTO `mall_region` VALUES ('1071', '96', '动力区', '3', '0');
INSERT INTO `mall_region` VALUES ('1072', '96', '平房区', '3', '0');
INSERT INTO `mall_region` VALUES ('1073', '96', '松北区', '3', '0');
INSERT INTO `mall_region` VALUES ('1074', '96', '呼兰区', '3', '0');
INSERT INTO `mall_region` VALUES ('1075', '96', '依兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1076', '96', '方正县', '3', '0');
INSERT INTO `mall_region` VALUES ('1077', '96', '宾县', '3', '0');
INSERT INTO `mall_region` VALUES ('1078', '96', '巴彦县', '3', '0');
INSERT INTO `mall_region` VALUES ('1079', '96', '木兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1080', '96', '通河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1081', '96', '延寿县', '3', '0');
INSERT INTO `mall_region` VALUES ('1082', '96', '阿城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1083', '96', '双城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1084', '96', '尚志市', '3', '0');
INSERT INTO `mall_region` VALUES ('1085', '96', '五常市', '3', '0');
INSERT INTO `mall_region` VALUES ('1086', '96', '阿城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1087', '96', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1088', '97', '龙沙区', '3', '0');
INSERT INTO `mall_region` VALUES ('1089', '97', '建华区', '3', '0');
INSERT INTO `mall_region` VALUES ('1090', '97', '铁锋区', '3', '0');
INSERT INTO `mall_region` VALUES ('1091', '97', '昂昂溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('1092', '97', '富拉尔基区', '3', '0');
INSERT INTO `mall_region` VALUES ('1093', '97', '碾子山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1094', '97', '梅里斯达斡尔族区', '3', '0');
INSERT INTO `mall_region` VALUES ('1095', '97', '龙江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1096', '97', '依安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1097', '97', '泰来县', '3', '0');
INSERT INTO `mall_region` VALUES ('1098', '97', '甘南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1099', '97', '富裕县', '3', '0');
INSERT INTO `mall_region` VALUES ('1100', '97', '克山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1101', '97', '克东县', '3', '0');
INSERT INTO `mall_region` VALUES ('1102', '97', '拜泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('1103', '97', '讷河市', '3', '0');
INSERT INTO `mall_region` VALUES ('1104', '97', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1105', '98', '鸡冠区', '3', '0');
INSERT INTO `mall_region` VALUES ('1106', '98', '恒山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1107', '98', '滴道区', '3', '0');
INSERT INTO `mall_region` VALUES ('1108', '98', '梨树区', '3', '0');
INSERT INTO `mall_region` VALUES ('1109', '98', '城子河区', '3', '0');
INSERT INTO `mall_region` VALUES ('1110', '98', '麻山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1111', '98', '鸡东县', '3', '0');
INSERT INTO `mall_region` VALUES ('1112', '98', '虎林市', '3', '0');
INSERT INTO `mall_region` VALUES ('1113', '98', '密山市', '3', '0');
INSERT INTO `mall_region` VALUES ('1114', '98', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1115', '99', '向阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1116', '99', '工农区', '3', '0');
INSERT INTO `mall_region` VALUES ('1117', '99', '南山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1118', '99', '兴安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1119', '99', '东山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1120', '99', '兴山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1121', '99', '萝北县', '3', '0');
INSERT INTO `mall_region` VALUES ('1122', '99', '绥滨县', '3', '0');
INSERT INTO `mall_region` VALUES ('1123', '99', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1124', '100', '尖山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1125', '100', '岭东区', '3', '0');
INSERT INTO `mall_region` VALUES ('1126', '100', '四方台区', '3', '0');
INSERT INTO `mall_region` VALUES ('1127', '100', '宝山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1128', '100', '集贤县', '3', '0');
INSERT INTO `mall_region` VALUES ('1129', '100', '友谊县', '3', '0');
INSERT INTO `mall_region` VALUES ('1130', '100', '宝清县', '3', '0');
INSERT INTO `mall_region` VALUES ('1131', '100', '饶河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1132', '100', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1133', '101', '萨尔图区', '3', '0');
INSERT INTO `mall_region` VALUES ('1134', '101', '龙凤区', '3', '0');
INSERT INTO `mall_region` VALUES ('1135', '101', '让胡路区', '3', '0');
INSERT INTO `mall_region` VALUES ('1136', '101', '红岗区', '3', '0');
INSERT INTO `mall_region` VALUES ('1137', '101', '大同区', '3', '0');
INSERT INTO `mall_region` VALUES ('1138', '101', '肇州县', '3', '0');
INSERT INTO `mall_region` VALUES ('1139', '101', '肇源县', '3', '0');
INSERT INTO `mall_region` VALUES ('1140', '101', '林甸县', '3', '0');
INSERT INTO `mall_region` VALUES ('1141', '101', '杜尔伯特蒙古族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('1142', '101', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1143', '102', '伊春区', '3', '0');
INSERT INTO `mall_region` VALUES ('1144', '102', '南岔区', '3', '0');
INSERT INTO `mall_region` VALUES ('1145', '102', '友好区', '3', '0');
INSERT INTO `mall_region` VALUES ('1146', '102', '西林区', '3', '0');
INSERT INTO `mall_region` VALUES ('1147', '102', '翠峦区', '3', '0');
INSERT INTO `mall_region` VALUES ('1148', '102', '新青区', '3', '0');
INSERT INTO `mall_region` VALUES ('1149', '102', '美溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('1150', '102', '金山屯区', '3', '0');
INSERT INTO `mall_region` VALUES ('1151', '102', '五营区', '3', '0');
INSERT INTO `mall_region` VALUES ('1152', '102', '乌马河区', '3', '0');
INSERT INTO `mall_region` VALUES ('1153', '102', '汤旺河区', '3', '0');
INSERT INTO `mall_region` VALUES ('1154', '102', '带岭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1155', '102', '乌伊岭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1156', '102', '红星区', '3', '0');
INSERT INTO `mall_region` VALUES ('1157', '102', '上甘岭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1158', '102', '嘉荫县', '3', '0');
INSERT INTO `mall_region` VALUES ('1159', '102', '铁力市', '3', '0');
INSERT INTO `mall_region` VALUES ('1160', '102', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1161', '103', '永红区', '3', '0');
INSERT INTO `mall_region` VALUES ('1162', '103', '向阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1163', '103', '前进区', '3', '0');
INSERT INTO `mall_region` VALUES ('1164', '103', '东风区', '3', '0');
INSERT INTO `mall_region` VALUES ('1165', '103', '郊区', '3', '0');
INSERT INTO `mall_region` VALUES ('1166', '103', '桦南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1167', '103', '桦川县', '3', '0');
INSERT INTO `mall_region` VALUES ('1168', '103', '汤原县', '3', '0');
INSERT INTO `mall_region` VALUES ('1169', '103', '抚远县', '3', '0');
INSERT INTO `mall_region` VALUES ('1170', '103', '同江市', '3', '0');
INSERT INTO `mall_region` VALUES ('1171', '103', '富锦市', '3', '0');
INSERT INTO `mall_region` VALUES ('1172', '103', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1173', '104', '新兴区', '3', '0');
INSERT INTO `mall_region` VALUES ('1174', '104', '桃山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1175', '104', '茄子河区', '3', '0');
INSERT INTO `mall_region` VALUES ('1176', '104', '勃利县', '3', '0');
INSERT INTO `mall_region` VALUES ('1177', '104', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1178', '105', '东安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1179', '105', '阳明区', '3', '0');
INSERT INTO `mall_region` VALUES ('1180', '105', '爱民区', '3', '0');
INSERT INTO `mall_region` VALUES ('1181', '105', '西安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1182', '105', '东宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1183', '105', '林口县', '3', '0');
INSERT INTO `mall_region` VALUES ('1184', '105', '绥芬河市', '3', '0');
INSERT INTO `mall_region` VALUES ('1185', '105', '海林市', '3', '0');
INSERT INTO `mall_region` VALUES ('1186', '105', '宁安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1187', '105', '穆棱市', '3', '0');
INSERT INTO `mall_region` VALUES ('1188', '105', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1189', '106', '爱辉区', '3', '0');
INSERT INTO `mall_region` VALUES ('1190', '106', '嫩江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1191', '106', '逊克县', '3', '0');
INSERT INTO `mall_region` VALUES ('1192', '106', '孙吴县', '3', '0');
INSERT INTO `mall_region` VALUES ('1193', '106', '北安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1194', '106', '五大连池市', '3', '0');
INSERT INTO `mall_region` VALUES ('1195', '106', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1196', '107', '北林区', '3', '0');
INSERT INTO `mall_region` VALUES ('1197', '107', '望奎县', '3', '0');
INSERT INTO `mall_region` VALUES ('1198', '107', '兰西县', '3', '0');
INSERT INTO `mall_region` VALUES ('1199', '107', '青冈县', '3', '0');
INSERT INTO `mall_region` VALUES ('1200', '107', '庆安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1201', '107', '明水县', '3', '0');
INSERT INTO `mall_region` VALUES ('1202', '107', '绥棱县', '3', '0');
INSERT INTO `mall_region` VALUES ('1203', '107', '安达市', '3', '0');
INSERT INTO `mall_region` VALUES ('1204', '107', '肇东市', '3', '0');
INSERT INTO `mall_region` VALUES ('1205', '107', '海伦市', '3', '0');
INSERT INTO `mall_region` VALUES ('1206', '107', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1207', '108', '松岭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1208', '108', '新林区', '3', '0');
INSERT INTO `mall_region` VALUES ('1209', '108', '呼中区', '3', '0');
INSERT INTO `mall_region` VALUES ('1210', '108', '呼玛县', '3', '0');
INSERT INTO `mall_region` VALUES ('1211', '108', '塔河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1212', '108', '漠河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1213', '108', '加格达奇区', '3', '0');
INSERT INTO `mall_region` VALUES ('1214', '108', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1215', '109', '黄浦区', '3', '0');
INSERT INTO `mall_region` VALUES ('1216', '109', '卢湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('1217', '109', '徐汇区', '3', '0');
INSERT INTO `mall_region` VALUES ('1218', '109', '长宁区', '3', '0');
INSERT INTO `mall_region` VALUES ('1219', '109', '静安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1220', '109', '普陀区', '3', '0');
INSERT INTO `mall_region` VALUES ('1221', '109', '闸北区', '3', '0');
INSERT INTO `mall_region` VALUES ('1222', '109', '虹口区', '3', '0');
INSERT INTO `mall_region` VALUES ('1223', '109', '杨浦区', '3', '0');
INSERT INTO `mall_region` VALUES ('1224', '109', '闵行区', '3', '0');
INSERT INTO `mall_region` VALUES ('1225', '109', '宝山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1226', '109', '嘉定区', '3', '0');
INSERT INTO `mall_region` VALUES ('1227', '109', '浦东新区', '3', '0');
INSERT INTO `mall_region` VALUES ('1228', '109', '金山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1229', '109', '松江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1230', '109', '青浦区', '3', '0');
INSERT INTO `mall_region` VALUES ('1231', '109', '南汇区', '3', '0');
INSERT INTO `mall_region` VALUES ('1232', '109', '奉贤区', '3', '0');
INSERT INTO `mall_region` VALUES ('1233', '109', '川沙区', '3', '0');
INSERT INTO `mall_region` VALUES ('1234', '109', '崇明县', '3', '0');
INSERT INTO `mall_region` VALUES ('1235', '109', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1236', '110', '玄武区', '3', '0');
INSERT INTO `mall_region` VALUES ('1237', '110', '白下区', '3', '0');
INSERT INTO `mall_region` VALUES ('1238', '110', '秦淮区', '3', '0');
INSERT INTO `mall_region` VALUES ('1239', '110', '建邺区', '3', '0');
INSERT INTO `mall_region` VALUES ('1240', '110', '鼓楼区', '3', '0');
INSERT INTO `mall_region` VALUES ('1241', '110', '下关区', '3', '0');
INSERT INTO `mall_region` VALUES ('1242', '110', '浦口区', '3', '0');
INSERT INTO `mall_region` VALUES ('1243', '110', '栖霞区', '3', '0');
INSERT INTO `mall_region` VALUES ('1244', '110', '雨花台区', '3', '0');
INSERT INTO `mall_region` VALUES ('1245', '110', '江宁区', '3', '0');
INSERT INTO `mall_region` VALUES ('1246', '110', '六合区', '3', '0');
INSERT INTO `mall_region` VALUES ('1247', '110', '溧水区', '3', '0');
INSERT INTO `mall_region` VALUES ('1248', '110', '高淳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1249', '110', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1250', '111', '崇安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1251', '111', '南长区', '3', '0');
INSERT INTO `mall_region` VALUES ('1252', '111', '北塘区', '3', '0');
INSERT INTO `mall_region` VALUES ('1253', '111', '锡山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1254', '111', '惠山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1255', '111', '滨湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1256', '111', '江阴市', '3', '0');
INSERT INTO `mall_region` VALUES ('1257', '111', '宜兴市', '3', '0');
INSERT INTO `mall_region` VALUES ('1258', '111', '新区', '3', '0');
INSERT INTO `mall_region` VALUES ('1259', '111', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1260', '112', '鼓楼区', '3', '0');
INSERT INTO `mall_region` VALUES ('1261', '112', '云龙区', '3', '0');
INSERT INTO `mall_region` VALUES ('1262', '112', '九里区', '3', '0');
INSERT INTO `mall_region` VALUES ('1263', '112', '贾汪区', '3', '0');
INSERT INTO `mall_region` VALUES ('1264', '112', '泉山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1265', '112', '丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1266', '112', '沛县', '3', '0');
INSERT INTO `mall_region` VALUES ('1267', '112', '铜山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1268', '112', '睢宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1269', '112', '新沂市', '3', '0');
INSERT INTO `mall_region` VALUES ('1270', '112', '邳州市', '3', '0');
INSERT INTO `mall_region` VALUES ('1271', '112', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1272', '113', '天宁区', '3', '0');
INSERT INTO `mall_region` VALUES ('1273', '113', '钟楼区', '3', '0');
INSERT INTO `mall_region` VALUES ('1274', '113', '戚墅堰区', '3', '0');
INSERT INTO `mall_region` VALUES ('1275', '113', '新北区', '3', '0');
INSERT INTO `mall_region` VALUES ('1276', '113', '武进区', '3', '0');
INSERT INTO `mall_region` VALUES ('1277', '113', '溧阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('1278', '113', '金坛市', '3', '0');
INSERT INTO `mall_region` VALUES ('1279', '113', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1280', '114', '沧浪区', '3', '0');
INSERT INTO `mall_region` VALUES ('1281', '114', '平江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1282', '114', '金阊区', '3', '0');
INSERT INTO `mall_region` VALUES ('1283', '114', '虎丘区', '3', '0');
INSERT INTO `mall_region` VALUES ('1284', '114', '吴中区', '3', '0');
INSERT INTO `mall_region` VALUES ('1285', '114', '相城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1286', '114', '姑苏区', '3', '0');
INSERT INTO `mall_region` VALUES ('1287', '114', '常熟市', '3', '0');
INSERT INTO `mall_region` VALUES ('1288', '114', '张家港市', '3', '0');
INSERT INTO `mall_region` VALUES ('1289', '114', '昆山市', '3', '0');
INSERT INTO `mall_region` VALUES ('1290', '114', '吴江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1291', '114', '太仓市', '3', '0');
INSERT INTO `mall_region` VALUES ('1292', '114', '新区', '3', '0');
INSERT INTO `mall_region` VALUES ('1293', '114', '园区', '3', '0');
INSERT INTO `mall_region` VALUES ('1294', '114', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1295', '115', '崇川区', '3', '0');
INSERT INTO `mall_region` VALUES ('1296', '115', '港闸区', '3', '0');
INSERT INTO `mall_region` VALUES ('1297', '115', '通州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1298', '115', '海安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1299', '115', '如东县', '3', '0');
INSERT INTO `mall_region` VALUES ('1300', '115', '启东市', '3', '0');
INSERT INTO `mall_region` VALUES ('1301', '115', '如皋市', '3', '0');
INSERT INTO `mall_region` VALUES ('1302', '115', '通州市', '3', '0');
INSERT INTO `mall_region` VALUES ('1303', '115', '海门市', '3', '0');
INSERT INTO `mall_region` VALUES ('1304', '115', '开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1305', '115', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1306', '116', '连云区', '3', '0');
INSERT INTO `mall_region` VALUES ('1307', '116', '新浦区', '3', '0');
INSERT INTO `mall_region` VALUES ('1308', '116', '海州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1309', '116', '赣榆区', '3', '0');
INSERT INTO `mall_region` VALUES ('1310', '116', '东海县', '3', '0');
INSERT INTO `mall_region` VALUES ('1311', '116', '灌云县', '3', '0');
INSERT INTO `mall_region` VALUES ('1312', '116', '灌南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1313', '116', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1314', '117', '清河区', '3', '0');
INSERT INTO `mall_region` VALUES ('1315', '117', '淮安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1316', '117', '淮阴区', '3', '0');
INSERT INTO `mall_region` VALUES ('1317', '117', '清浦区', '3', '0');
INSERT INTO `mall_region` VALUES ('1318', '117', '涟水县', '3', '0');
INSERT INTO `mall_region` VALUES ('1319', '117', '洪泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('1320', '117', '盱眙县', '3', '0');
INSERT INTO `mall_region` VALUES ('1321', '117', '金湖县', '3', '0');
INSERT INTO `mall_region` VALUES ('1322', '117', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1323', '118', '亭湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1324', '118', '盐都区', '3', '0');
INSERT INTO `mall_region` VALUES ('1325', '118', '响水县', '3', '0');
INSERT INTO `mall_region` VALUES ('1326', '118', '滨海县', '3', '0');
INSERT INTO `mall_region` VALUES ('1327', '118', '阜宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1328', '118', '射阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1329', '118', '建湖县', '3', '0');
INSERT INTO `mall_region` VALUES ('1330', '118', '东台市', '3', '0');
INSERT INTO `mall_region` VALUES ('1331', '118', '大丰市', '3', '0');
INSERT INTO `mall_region` VALUES ('1332', '118', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1333', '119', '广陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('1334', '119', '邗江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1335', '119', '维扬区', '3', '0');
INSERT INTO `mall_region` VALUES ('1336', '119', '宝应县', '3', '0');
INSERT INTO `mall_region` VALUES ('1337', '119', '仪征市', '3', '0');
INSERT INTO `mall_region` VALUES ('1338', '119', '高邮市', '3', '0');
INSERT INTO `mall_region` VALUES ('1339', '119', '江都区', '3', '0');
INSERT INTO `mall_region` VALUES ('1340', '119', '经济开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1341', '119', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1342', '120', '京口区', '3', '0');
INSERT INTO `mall_region` VALUES ('1343', '120', '润州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1344', '120', '丹徒区', '3', '0');
INSERT INTO `mall_region` VALUES ('1345', '120', '丹阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('1346', '120', '扬中市', '3', '0');
INSERT INTO `mall_region` VALUES ('1347', '120', '句容市', '3', '0');
INSERT INTO `mall_region` VALUES ('1348', '120', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1349', '121', '海陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('1350', '121', '高港区', '3', '0');
INSERT INTO `mall_region` VALUES ('1351', '121', '兴化市', '3', '0');
INSERT INTO `mall_region` VALUES ('1352', '121', '靖江市', '3', '0');
INSERT INTO `mall_region` VALUES ('1353', '121', '泰兴市', '3', '0');
INSERT INTO `mall_region` VALUES ('1354', '121', '姜堰区', '3', '0');
INSERT INTO `mall_region` VALUES ('1355', '121', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1356', '122', '宿城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1357', '122', '宿豫区', '3', '0');
INSERT INTO `mall_region` VALUES ('1358', '122', '沭阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1359', '122', '泗阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1360', '122', '泗洪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1361', '122', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1362', '123', '上城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1363', '123', '下城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1364', '123', '江干区', '3', '0');
INSERT INTO `mall_region` VALUES ('1365', '123', '拱墅区', '3', '0');
INSERT INTO `mall_region` VALUES ('1366', '123', '西湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1367', '123', '滨江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1368', '123', '萧山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1369', '123', '余杭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1370', '123', '桐庐县', '3', '0');
INSERT INTO `mall_region` VALUES ('1371', '123', '淳安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1372', '123', '建德市', '3', '0');
INSERT INTO `mall_region` VALUES ('1373', '123', '富阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1374', '123', '临安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1375', '123', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1376', '124', '海曙区', '3', '0');
INSERT INTO `mall_region` VALUES ('1377', '124', '江东区', '3', '0');
INSERT INTO `mall_region` VALUES ('1378', '124', '江北区', '3', '0');
INSERT INTO `mall_region` VALUES ('1379', '124', '北仑区', '3', '0');
INSERT INTO `mall_region` VALUES ('1380', '124', '镇海区', '3', '0');
INSERT INTO `mall_region` VALUES ('1381', '124', '鄞州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1382', '124', '象山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1383', '124', '宁海县', '3', '0');
INSERT INTO `mall_region` VALUES ('1384', '124', '余姚市', '3', '0');
INSERT INTO `mall_region` VALUES ('1385', '124', '慈溪市', '3', '0');
INSERT INTO `mall_region` VALUES ('1386', '124', '奉化市', '3', '0');
INSERT INTO `mall_region` VALUES ('1387', '124', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1388', '125', '鹿城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1389', '125', '龙湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('1390', '125', '瓯海区', '3', '0');
INSERT INTO `mall_region` VALUES ('1391', '125', '洞头县', '3', '0');
INSERT INTO `mall_region` VALUES ('1392', '125', '永嘉县', '3', '0');
INSERT INTO `mall_region` VALUES ('1393', '125', '平阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1394', '125', '苍南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1395', '125', '文成县', '3', '0');
INSERT INTO `mall_region` VALUES ('1396', '125', '泰顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('1397', '125', '瑞安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1398', '125', '乐清市', '3', '0');
INSERT INTO `mall_region` VALUES ('1399', '125', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1400', '126', '南湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1401', '126', '秀洲区', '3', '0');
INSERT INTO `mall_region` VALUES ('1402', '126', '嘉善县', '3', '0');
INSERT INTO `mall_region` VALUES ('1403', '126', '海盐县', '3', '0');
INSERT INTO `mall_region` VALUES ('1404', '126', '海宁市', '3', '0');
INSERT INTO `mall_region` VALUES ('1405', '126', '平湖市', '3', '0');
INSERT INTO `mall_region` VALUES ('1406', '126', '桐乡市', '3', '0');
INSERT INTO `mall_region` VALUES ('1407', '126', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1408', '127', '吴兴区', '3', '0');
INSERT INTO `mall_region` VALUES ('1409', '127', '南浔区', '3', '0');
INSERT INTO `mall_region` VALUES ('1410', '127', '德清县', '3', '0');
INSERT INTO `mall_region` VALUES ('1411', '127', '长兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('1412', '127', '安吉县', '3', '0');
INSERT INTO `mall_region` VALUES ('1413', '127', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1414', '128', '越城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1415', '128', '柯桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('1416', '128', '新昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1417', '128', '诸暨市', '3', '0');
INSERT INTO `mall_region` VALUES ('1418', '128', '上虞区', '3', '0');
INSERT INTO `mall_region` VALUES ('1419', '128', '嵊州市', '3', '0');
INSERT INTO `mall_region` VALUES ('1420', '128', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1421', '129', '婺城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1422', '129', '金东区', '3', '0');
INSERT INTO `mall_region` VALUES ('1423', '129', '武义县', '3', '0');
INSERT INTO `mall_region` VALUES ('1424', '129', '浦江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1425', '129', '磐安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1426', '129', '兰溪市', '3', '0');
INSERT INTO `mall_region` VALUES ('1427', '129', '义乌市', '3', '0');
INSERT INTO `mall_region` VALUES ('1428', '129', '东阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('1429', '129', '永康市', '3', '0');
INSERT INTO `mall_region` VALUES ('1430', '129', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1431', '130', '柯城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1432', '130', '衢江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1433', '130', '常山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1434', '130', '开化县', '3', '0');
INSERT INTO `mall_region` VALUES ('1435', '130', '龙游县', '3', '0');
INSERT INTO `mall_region` VALUES ('1436', '130', '江山市', '3', '0');
INSERT INTO `mall_region` VALUES ('1437', '130', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1438', '131', '定海区', '3', '0');
INSERT INTO `mall_region` VALUES ('1439', '131', '普陀区', '3', '0');
INSERT INTO `mall_region` VALUES ('1440', '131', '岱山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1441', '131', '嵊泗县', '3', '0');
INSERT INTO `mall_region` VALUES ('1442', '131', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1443', '132', '椒江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1444', '132', '黄岩区', '3', '0');
INSERT INTO `mall_region` VALUES ('1445', '132', '路桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('1446', '132', '玉环县', '3', '0');
INSERT INTO `mall_region` VALUES ('1447', '132', '三门县', '3', '0');
INSERT INTO `mall_region` VALUES ('1448', '132', '天台县', '3', '0');
INSERT INTO `mall_region` VALUES ('1449', '132', '仙居县', '3', '0');
INSERT INTO `mall_region` VALUES ('1450', '132', '温岭市', '3', '0');
INSERT INTO `mall_region` VALUES ('1451', '132', '临海市', '3', '0');
INSERT INTO `mall_region` VALUES ('1452', '132', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1453', '133', '莲都区', '3', '0');
INSERT INTO `mall_region` VALUES ('1454', '133', '青田县', '3', '0');
INSERT INTO `mall_region` VALUES ('1455', '133', '缙云县', '3', '0');
INSERT INTO `mall_region` VALUES ('1456', '133', '遂昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1457', '133', '松阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1458', '133', '云和县', '3', '0');
INSERT INTO `mall_region` VALUES ('1459', '133', '庆元县', '3', '0');
INSERT INTO `mall_region` VALUES ('1460', '133', '景宁畲族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('1461', '133', '龙泉市', '3', '0');
INSERT INTO `mall_region` VALUES ('1462', '133', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1463', '134', '瑶海区', '3', '0');
INSERT INTO `mall_region` VALUES ('1464', '134', '庐阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1465', '134', '蜀山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1466', '134', '包河区', '3', '0');
INSERT INTO `mall_region` VALUES ('1467', '134', '长丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1468', '134', '肥东县', '3', '0');
INSERT INTO `mall_region` VALUES ('1469', '134', '肥西县', '3', '0');
INSERT INTO `mall_region` VALUES ('1470', '134', '高新区', '3', '0');
INSERT INTO `mall_region` VALUES ('1471', '134', '中区', '3', '0');
INSERT INTO `mall_region` VALUES ('1472', '134', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1473', '135', '镜湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1474', '135', '弋江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1475', '135', '鸠江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1476', '135', '三山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1477', '135', '芜湖县', '3', '0');
INSERT INTO `mall_region` VALUES ('1478', '135', '繁昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1479', '135', '南陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('1480', '135', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1481', '136', '龙子湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1482', '136', '蚌山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1483', '136', '禹会区', '3', '0');
INSERT INTO `mall_region` VALUES ('1484', '136', '淮上区', '3', '0');
INSERT INTO `mall_region` VALUES ('1485', '136', '怀远县', '3', '0');
INSERT INTO `mall_region` VALUES ('1486', '136', '五河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1487', '136', '固镇县', '3', '0');
INSERT INTO `mall_region` VALUES ('1488', '136', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1489', '137', '大通区', '3', '0');
INSERT INTO `mall_region` VALUES ('1490', '137', '田家庵区', '3', '0');
INSERT INTO `mall_region` VALUES ('1491', '137', '谢家集区', '3', '0');
INSERT INTO `mall_region` VALUES ('1492', '137', '八公山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1493', '137', '潘集区', '3', '0');
INSERT INTO `mall_region` VALUES ('1494', '137', '凤台县', '3', '0');
INSERT INTO `mall_region` VALUES ('1495', '137', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1496', '138', '金家庄区', '3', '0');
INSERT INTO `mall_region` VALUES ('1497', '138', '花山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1498', '138', '雨山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1499', '138', '博望区', '3', '0');
INSERT INTO `mall_region` VALUES ('1500', '138', '当涂县', '3', '0');
INSERT INTO `mall_region` VALUES ('1501', '138', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1502', '139', '杜集区', '3', '0');
INSERT INTO `mall_region` VALUES ('1503', '139', '相山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1504', '139', '烈山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1505', '139', '濉溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1506', '139', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1507', '140', '铜官山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1508', '140', '狮子山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1509', '140', '郊区', '3', '0');
INSERT INTO `mall_region` VALUES ('1510', '140', '铜陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('1511', '140', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1512', '141', '迎江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1513', '141', '大观区', '3', '0');
INSERT INTO `mall_region` VALUES ('1514', '141', '宜秀区', '3', '0');
INSERT INTO `mall_region` VALUES ('1515', '141', '怀宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1516', '141', '枞阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1517', '141', '潜山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1518', '141', '太湖县', '3', '0');
INSERT INTO `mall_region` VALUES ('1519', '141', '宿松县', '3', '0');
INSERT INTO `mall_region` VALUES ('1520', '141', '望江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1521', '141', '岳西县', '3', '0');
INSERT INTO `mall_region` VALUES ('1522', '141', '桐城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1523', '141', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1524', '142', '屯溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('1525', '142', '黄山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1526', '142', '徽州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1527', '142', '歙县', '3', '0');
INSERT INTO `mall_region` VALUES ('1528', '142', '休宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1529', '142', '黟县', '3', '0');
INSERT INTO `mall_region` VALUES ('1530', '142', '祁门县', '3', '0');
INSERT INTO `mall_region` VALUES ('1531', '142', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1532', '143', '琅琊区', '3', '0');
INSERT INTO `mall_region` VALUES ('1533', '143', '南谯区', '3', '0');
INSERT INTO `mall_region` VALUES ('1534', '143', '来安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1535', '143', '全椒县', '3', '0');
INSERT INTO `mall_region` VALUES ('1536', '143', '定远县', '3', '0');
INSERT INTO `mall_region` VALUES ('1537', '143', '凤阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1538', '143', '天长市', '3', '0');
INSERT INTO `mall_region` VALUES ('1539', '143', '明光市', '3', '0');
INSERT INTO `mall_region` VALUES ('1540', '143', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1541', '144', '颍州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1542', '144', '颍东区', '3', '0');
INSERT INTO `mall_region` VALUES ('1543', '144', '颍泉区', '3', '0');
INSERT INTO `mall_region` VALUES ('1544', '144', '临泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('1545', '144', '太和县', '3', '0');
INSERT INTO `mall_region` VALUES ('1546', '144', '阜南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1547', '144', '颍上县', '3', '0');
INSERT INTO `mall_region` VALUES ('1548', '144', '界首市', '3', '0');
INSERT INTO `mall_region` VALUES ('1549', '144', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1550', '145', '埇桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('1551', '145', '砀山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1552', '145', '萧县', '3', '0');
INSERT INTO `mall_region` VALUES ('1553', '145', '灵璧县', '3', '0');
INSERT INTO `mall_region` VALUES ('1554', '145', '泗县', '3', '0');
INSERT INTO `mall_region` VALUES ('1555', '145', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1556', '134', '巢湖市', '3', '0');
INSERT INTO `mall_region` VALUES ('1557', '134', '居巢区', '3', '0');
INSERT INTO `mall_region` VALUES ('1558', '134', '庐江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1559', '135', '无为县', '3', '0');
INSERT INTO `mall_region` VALUES ('1560', '138', '含山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1561', '138', '和县', '3', '0');
INSERT INTO `mall_region` VALUES ('1562', '146', '金安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1563', '146', '裕安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1564', '146', '寿县', '3', '0');
INSERT INTO `mall_region` VALUES ('1565', '146', '霍邱县', '3', '0');
INSERT INTO `mall_region` VALUES ('1566', '146', '舒城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1567', '146', '金寨县', '3', '0');
INSERT INTO `mall_region` VALUES ('1568', '146', '霍山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1569', '146', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1570', '147', '谯城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1571', '147', '涡阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1572', '147', '蒙城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1573', '147', '利辛县', '3', '0');
INSERT INTO `mall_region` VALUES ('1574', '147', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1575', '148', '贵池区', '3', '0');
INSERT INTO `mall_region` VALUES ('1576', '148', '东至县', '3', '0');
INSERT INTO `mall_region` VALUES ('1577', '148', '石台县', '3', '0');
INSERT INTO `mall_region` VALUES ('1578', '148', '青阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1579', '148', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1580', '149', '宣州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1581', '149', '郎溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1582', '149', '广德县', '3', '0');
INSERT INTO `mall_region` VALUES ('1583', '149', '泾县', '3', '0');
INSERT INTO `mall_region` VALUES ('1584', '149', '绩溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1585', '149', '旌德县', '3', '0');
INSERT INTO `mall_region` VALUES ('1586', '149', '宁国市', '3', '0');
INSERT INTO `mall_region` VALUES ('1587', '149', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1588', '150', '鼓楼区', '3', '0');
INSERT INTO `mall_region` VALUES ('1589', '150', '台江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1590', '150', '仓山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1591', '150', '马尾区', '3', '0');
INSERT INTO `mall_region` VALUES ('1592', '150', '晋安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1593', '150', '闽侯县', '3', '0');
INSERT INTO `mall_region` VALUES ('1594', '150', '连江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1595', '150', '罗源县', '3', '0');
INSERT INTO `mall_region` VALUES ('1596', '150', '闽清县', '3', '0');
INSERT INTO `mall_region` VALUES ('1597', '150', '永泰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1598', '150', '平潭县', '3', '0');
INSERT INTO `mall_region` VALUES ('1599', '150', '福清市', '3', '0');
INSERT INTO `mall_region` VALUES ('1600', '150', '长乐市', '3', '0');
INSERT INTO `mall_region` VALUES ('1601', '150', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1602', '151', '思明区', '3', '0');
INSERT INTO `mall_region` VALUES ('1603', '151', '海沧区', '3', '0');
INSERT INTO `mall_region` VALUES ('1604', '151', '湖里区', '3', '0');
INSERT INTO `mall_region` VALUES ('1605', '151', '集美区', '3', '0');
INSERT INTO `mall_region` VALUES ('1606', '151', '同安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1607', '151', '翔安区', '3', '0');
INSERT INTO `mall_region` VALUES ('1608', '151', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1609', '152', '城厢区', '3', '0');
INSERT INTO `mall_region` VALUES ('1610', '152', '涵江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1611', '152', '荔城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1612', '152', '秀屿区', '3', '0');
INSERT INTO `mall_region` VALUES ('1613', '152', '仙游县', '3', '0');
INSERT INTO `mall_region` VALUES ('1614', '152', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1615', '153', '梅列区', '3', '0');
INSERT INTO `mall_region` VALUES ('1616', '153', '三元区', '3', '0');
INSERT INTO `mall_region` VALUES ('1617', '153', '明溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1618', '153', '清流县', '3', '0');
INSERT INTO `mall_region` VALUES ('1619', '153', '宁化县', '3', '0');
INSERT INTO `mall_region` VALUES ('1620', '153', '大田县', '3', '0');
INSERT INTO `mall_region` VALUES ('1621', '153', '尤溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1622', '153', '沙县', '3', '0');
INSERT INTO `mall_region` VALUES ('1623', '153', '将乐县', '3', '0');
INSERT INTO `mall_region` VALUES ('1624', '153', '泰宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1625', '153', '建宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1626', '153', '永安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1627', '153', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1628', '154', '鲤城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1629', '154', '丰泽区', '3', '0');
INSERT INTO `mall_region` VALUES ('1630', '154', '洛江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1631', '154', '泉港区', '3', '0');
INSERT INTO `mall_region` VALUES ('1632', '154', '惠安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1633', '154', '安溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1634', '154', '永春县', '3', '0');
INSERT INTO `mall_region` VALUES ('1635', '154', '德化县', '3', '0');
INSERT INTO `mall_region` VALUES ('1636', '154', '金门县', '3', '0');
INSERT INTO `mall_region` VALUES ('1637', '154', '石狮市', '3', '0');
INSERT INTO `mall_region` VALUES ('1638', '154', '晋江市', '3', '0');
INSERT INTO `mall_region` VALUES ('1639', '154', '南安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1640', '154', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1641', '155', '芗城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1642', '155', '龙文区', '3', '0');
INSERT INTO `mall_region` VALUES ('1643', '155', '云霄县', '3', '0');
INSERT INTO `mall_region` VALUES ('1644', '155', '漳浦县', '3', '0');
INSERT INTO `mall_region` VALUES ('1645', '155', '诏安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1646', '155', '长泰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1647', '155', '东山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1648', '155', '南靖县', '3', '0');
INSERT INTO `mall_region` VALUES ('1649', '155', '平和县', '3', '0');
INSERT INTO `mall_region` VALUES ('1650', '155', '华安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1651', '155', '龙海市', '3', '0');
INSERT INTO `mall_region` VALUES ('1652', '155', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1653', '156', '延平区', '3', '0');
INSERT INTO `mall_region` VALUES ('1654', '156', '顺昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1655', '156', '浦城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1656', '156', '光泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('1657', '156', '松溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1658', '156', '政和县', '3', '0');
INSERT INTO `mall_region` VALUES ('1659', '156', '邵武市', '3', '0');
INSERT INTO `mall_region` VALUES ('1660', '156', '武夷山市', '3', '0');
INSERT INTO `mall_region` VALUES ('1661', '156', '建瓯市', '3', '0');
INSERT INTO `mall_region` VALUES ('1662', '156', '建阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1663', '156', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1664', '157', '新罗区', '3', '0');
INSERT INTO `mall_region` VALUES ('1665', '157', '长汀县', '3', '0');
INSERT INTO `mall_region` VALUES ('1666', '157', '永定区', '3', '0');
INSERT INTO `mall_region` VALUES ('1667', '157', '上杭县', '3', '0');
INSERT INTO `mall_region` VALUES ('1668', '157', '武平县', '3', '0');
INSERT INTO `mall_region` VALUES ('1669', '157', '连城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1670', '157', '漳平市', '3', '0');
INSERT INTO `mall_region` VALUES ('1671', '157', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1672', '158', '蕉城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1673', '158', '霞浦县', '3', '0');
INSERT INTO `mall_region` VALUES ('1674', '158', '古田县', '3', '0');
INSERT INTO `mall_region` VALUES ('1675', '158', '屏南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1676', '158', '寿宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1677', '158', '周宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1678', '158', '柘荣县', '3', '0');
INSERT INTO `mall_region` VALUES ('1679', '158', '福安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1680', '158', '福鼎市', '3', '0');
INSERT INTO `mall_region` VALUES ('1681', '158', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1682', '159', '东湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1683', '159', '西湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1684', '159', '青云谱区', '3', '0');
INSERT INTO `mall_region` VALUES ('1685', '159', '湾里区', '3', '0');
INSERT INTO `mall_region` VALUES ('1686', '159', '青山湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1687', '159', '南昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1688', '159', '新建县', '3', '0');
INSERT INTO `mall_region` VALUES ('1689', '159', '安义县', '3', '0');
INSERT INTO `mall_region` VALUES ('1690', '159', '进贤县', '3', '0');
INSERT INTO `mall_region` VALUES ('1691', '159', '红谷滩新区', '3', '0');
INSERT INTO `mall_region` VALUES ('1692', '159', '经济技术开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1693', '159', '昌北区', '3', '0');
INSERT INTO `mall_region` VALUES ('1694', '159', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1695', '160', '昌江区', '3', '0');
INSERT INTO `mall_region` VALUES ('1696', '160', '珠山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1697', '160', '浮梁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1698', '160', '乐平市', '3', '0');
INSERT INTO `mall_region` VALUES ('1699', '160', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1700', '161', '安源区', '3', '0');
INSERT INTO `mall_region` VALUES ('1701', '161', '湘东区', '3', '0');
INSERT INTO `mall_region` VALUES ('1702', '161', '莲花县', '3', '0');
INSERT INTO `mall_region` VALUES ('1703', '161', '上栗县', '3', '0');
INSERT INTO `mall_region` VALUES ('1704', '161', '芦溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1705', '161', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1706', '162', '庐山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1707', '162', '浔阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1708', '162', '九江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1709', '162', '武宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1710', '162', '修水县', '3', '0');
INSERT INTO `mall_region` VALUES ('1711', '162', '永修县', '3', '0');
INSERT INTO `mall_region` VALUES ('1712', '162', '德安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1713', '162', '星子县', '3', '0');
INSERT INTO `mall_region` VALUES ('1714', '162', '都昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1715', '162', '湖口县', '3', '0');
INSERT INTO `mall_region` VALUES ('1716', '162', '彭泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('1717', '162', '瑞昌市', '3', '0');
INSERT INTO `mall_region` VALUES ('1718', '162', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1719', '162', '共青城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1720', '163', '渝水区', '3', '0');
INSERT INTO `mall_region` VALUES ('1721', '163', '分宜县', '3', '0');
INSERT INTO `mall_region` VALUES ('1722', '163', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1723', '164', '月湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('1724', '164', '余江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1725', '164', '贵溪市', '3', '0');
INSERT INTO `mall_region` VALUES ('1726', '164', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1727', '165', '章贡区', '3', '0');
INSERT INTO `mall_region` VALUES ('1728', '165', '赣县', '3', '0');
INSERT INTO `mall_region` VALUES ('1729', '165', '信丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1730', '165', '大余县', '3', '0');
INSERT INTO `mall_region` VALUES ('1731', '165', '上犹县', '3', '0');
INSERT INTO `mall_region` VALUES ('1732', '165', '崇义县', '3', '0');
INSERT INTO `mall_region` VALUES ('1733', '165', '安远县', '3', '0');
INSERT INTO `mall_region` VALUES ('1734', '165', '龙南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1735', '165', '定南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1736', '165', '全南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1737', '165', '宁都县', '3', '0');
INSERT INTO `mall_region` VALUES ('1738', '165', '于都县', '3', '0');
INSERT INTO `mall_region` VALUES ('1739', '165', '兴国县', '3', '0');
INSERT INTO `mall_region` VALUES ('1740', '165', '会昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1741', '165', '寻乌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1742', '165', '石城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1743', '165', '黄金区', '3', '0');
INSERT INTO `mall_region` VALUES ('1744', '165', '瑞金市', '3', '0');
INSERT INTO `mall_region` VALUES ('1745', '165', '南康区', '3', '0');
INSERT INTO `mall_region` VALUES ('1746', '165', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1747', '166', '吉州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1748', '166', '青原区', '3', '0');
INSERT INTO `mall_region` VALUES ('1749', '166', '吉安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1750', '166', '吉水县', '3', '0');
INSERT INTO `mall_region` VALUES ('1751', '166', '峡江县', '3', '0');
INSERT INTO `mall_region` VALUES ('1752', '166', '新干县', '3', '0');
INSERT INTO `mall_region` VALUES ('1753', '166', '永丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1754', '166', '泰和县', '3', '0');
INSERT INTO `mall_region` VALUES ('1755', '166', '遂川县', '3', '0');
INSERT INTO `mall_region` VALUES ('1756', '166', '万安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1757', '166', '安福县', '3', '0');
INSERT INTO `mall_region` VALUES ('1758', '166', '永新县', '3', '0');
INSERT INTO `mall_region` VALUES ('1759', '166', '井冈山市', '3', '0');
INSERT INTO `mall_region` VALUES ('1760', '166', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1761', '167', '袁州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1762', '167', '奉新县', '3', '0');
INSERT INTO `mall_region` VALUES ('1763', '167', '万载县', '3', '0');
INSERT INTO `mall_region` VALUES ('1764', '167', '上高县', '3', '0');
INSERT INTO `mall_region` VALUES ('1765', '167', '宜丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1766', '167', '靖安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1767', '167', '铜鼓县', '3', '0');
INSERT INTO `mall_region` VALUES ('1768', '167', '丰城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1769', '167', '樟树市', '3', '0');
INSERT INTO `mall_region` VALUES ('1770', '167', '高安市', '3', '0');
INSERT INTO `mall_region` VALUES ('1771', '167', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1772', '168', '临川区', '3', '0');
INSERT INTO `mall_region` VALUES ('1773', '168', '南城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1774', '168', '黎川县', '3', '0');
INSERT INTO `mall_region` VALUES ('1775', '168', '南丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1776', '168', '崇仁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1777', '168', '乐安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1778', '168', '宜黄县', '3', '0');
INSERT INTO `mall_region` VALUES ('1779', '168', '金溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1780', '168', '资溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('1781', '168', '东乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('1782', '168', '广昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('1783', '168', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1784', '169', '信州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1785', '169', '上饶县', '3', '0');
INSERT INTO `mall_region` VALUES ('1786', '169', '广丰区', '3', '0');
INSERT INTO `mall_region` VALUES ('1787', '169', '玉山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1788', '169', '铅山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1789', '169', '横峰县', '3', '0');
INSERT INTO `mall_region` VALUES ('1790', '169', '弋阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1791', '169', '余干县', '3', '0');
INSERT INTO `mall_region` VALUES ('1792', '169', '鄱阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1793', '169', '万年县', '3', '0');
INSERT INTO `mall_region` VALUES ('1794', '169', '婺源县', '3', '0');
INSERT INTO `mall_region` VALUES ('1795', '169', '德兴市', '3', '0');
INSERT INTO `mall_region` VALUES ('1796', '169', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1797', '170', '历下区', '3', '0');
INSERT INTO `mall_region` VALUES ('1798', '170', '市中区', '3', '0');
INSERT INTO `mall_region` VALUES ('1799', '170', '槐荫区', '3', '0');
INSERT INTO `mall_region` VALUES ('1800', '170', '天桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('1801', '170', '历城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1802', '170', '长清区', '3', '0');
INSERT INTO `mall_region` VALUES ('1803', '170', '平阴县', '3', '0');
INSERT INTO `mall_region` VALUES ('1804', '170', '济阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1805', '170', '商河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1806', '170', '章丘市', '3', '0');
INSERT INTO `mall_region` VALUES ('1807', '170', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1808', '171', '市南区', '3', '0');
INSERT INTO `mall_region` VALUES ('1809', '171', '市北区', '3', '0');
INSERT INTO `mall_region` VALUES ('1810', '171', '四方区', '3', '0');
INSERT INTO `mall_region` VALUES ('1811', '171', '黄岛区', '3', '0');
INSERT INTO `mall_region` VALUES ('1812', '171', '崂山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1813', '171', '李沧区', '3', '0');
INSERT INTO `mall_region` VALUES ('1814', '171', '城阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1815', '171', '开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1816', '171', '胶州市', '3', '0');
INSERT INTO `mall_region` VALUES ('1817', '171', '即墨市', '3', '0');
INSERT INTO `mall_region` VALUES ('1818', '171', '平度市', '3', '0');
INSERT INTO `mall_region` VALUES ('1819', '171', '胶南市', '3', '0');
INSERT INTO `mall_region` VALUES ('1820', '171', '莱西市', '3', '0');
INSERT INTO `mall_region` VALUES ('1821', '171', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1822', '172', '淄川区', '3', '0');
INSERT INTO `mall_region` VALUES ('1823', '172', '张店区', '3', '0');
INSERT INTO `mall_region` VALUES ('1824', '172', '博山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1825', '172', '临淄区', '3', '0');
INSERT INTO `mall_region` VALUES ('1826', '172', '周村区', '3', '0');
INSERT INTO `mall_region` VALUES ('1827', '172', '桓台县', '3', '0');
INSERT INTO `mall_region` VALUES ('1828', '172', '高青县', '3', '0');
INSERT INTO `mall_region` VALUES ('1829', '172', '沂源县', '3', '0');
INSERT INTO `mall_region` VALUES ('1830', '172', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1831', '173', '市中区', '3', '0');
INSERT INTO `mall_region` VALUES ('1832', '173', '薛城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1833', '173', '峄城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1834', '173', '台儿庄区', '3', '0');
INSERT INTO `mall_region` VALUES ('1835', '173', '山亭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1836', '173', '滕州市', '3', '0');
INSERT INTO `mall_region` VALUES ('1837', '173', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1838', '174', '东营区', '3', '0');
INSERT INTO `mall_region` VALUES ('1839', '174', '河口区', '3', '0');
INSERT INTO `mall_region` VALUES ('1840', '174', '垦利县', '3', '0');
INSERT INTO `mall_region` VALUES ('1841', '174', '利津县', '3', '0');
INSERT INTO `mall_region` VALUES ('1842', '174', '广饶县', '3', '0');
INSERT INTO `mall_region` VALUES ('1843', '174', '西城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1844', '174', '东城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1845', '174', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1846', '175', '芝罘区', '3', '0');
INSERT INTO `mall_region` VALUES ('1847', '175', '福山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1848', '175', '牟平区', '3', '0');
INSERT INTO `mall_region` VALUES ('1849', '175', '莱山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1850', '175', '长岛县', '3', '0');
INSERT INTO `mall_region` VALUES ('1851', '175', '龙口市', '3', '0');
INSERT INTO `mall_region` VALUES ('1852', '175', '莱阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('1853', '175', '莱州市', '3', '0');
INSERT INTO `mall_region` VALUES ('1854', '175', '蓬莱市', '3', '0');
INSERT INTO `mall_region` VALUES ('1855', '175', '招远市', '3', '0');
INSERT INTO `mall_region` VALUES ('1856', '175', '栖霞市', '3', '0');
INSERT INTO `mall_region` VALUES ('1857', '175', '海阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('1858', '175', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1859', '176', '潍城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1860', '176', '寒亭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1861', '176', '坊子区', '3', '0');
INSERT INTO `mall_region` VALUES ('1862', '176', '奎文区', '3', '0');
INSERT INTO `mall_region` VALUES ('1863', '176', '临朐县', '3', '0');
INSERT INTO `mall_region` VALUES ('1864', '176', '昌乐县', '3', '0');
INSERT INTO `mall_region` VALUES ('1865', '176', '开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1866', '176', '青州市', '3', '0');
INSERT INTO `mall_region` VALUES ('1867', '176', '诸城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1868', '176', '寿光市', '3', '0');
INSERT INTO `mall_region` VALUES ('1869', '176', '安丘市', '3', '0');
INSERT INTO `mall_region` VALUES ('1870', '176', '高密市', '3', '0');
INSERT INTO `mall_region` VALUES ('1871', '176', '昌邑市', '3', '0');
INSERT INTO `mall_region` VALUES ('1872', '176', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1873', '177', '市中区', '3', '0');
INSERT INTO `mall_region` VALUES ('1874', '177', '任城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1875', '177', '微山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1876', '177', '鱼台县', '3', '0');
INSERT INTO `mall_region` VALUES ('1877', '177', '金乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('1878', '177', '嘉祥县', '3', '0');
INSERT INTO `mall_region` VALUES ('1879', '177', '汶上县', '3', '0');
INSERT INTO `mall_region` VALUES ('1880', '177', '泗水县', '3', '0');
INSERT INTO `mall_region` VALUES ('1881', '177', '梁山县', '3', '0');
INSERT INTO `mall_region` VALUES ('1882', '177', '曲阜市', '3', '0');
INSERT INTO `mall_region` VALUES ('1883', '177', '兖州区', '3', '0');
INSERT INTO `mall_region` VALUES ('1884', '177', '邹城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1885', '177', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1886', '178', '泰山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1887', '178', '岱岳区', '3', '0');
INSERT INTO `mall_region` VALUES ('1888', '178', '宁阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1889', '178', '东平县', '3', '0');
INSERT INTO `mall_region` VALUES ('1890', '178', '新泰市', '3', '0');
INSERT INTO `mall_region` VALUES ('1891', '178', '肥城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1892', '178', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1893', '179', '环翠区', '3', '0');
INSERT INTO `mall_region` VALUES ('1894', '179', '文登区', '3', '0');
INSERT INTO `mall_region` VALUES ('1895', '179', '荣成市', '3', '0');
INSERT INTO `mall_region` VALUES ('1896', '179', '乳山市', '3', '0');
INSERT INTO `mall_region` VALUES ('1897', '179', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1898', '180', '东港区', '3', '0');
INSERT INTO `mall_region` VALUES ('1899', '180', '岚山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1900', '180', '五莲县', '3', '0');
INSERT INTO `mall_region` VALUES ('1901', '180', '莒县', '3', '0');
INSERT INTO `mall_region` VALUES ('1902', '180', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1903', '181', '莱城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1904', '181', '钢城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1905', '181', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1906', '182', '兰山区', '3', '0');
INSERT INTO `mall_region` VALUES ('1907', '182', '罗庄区', '3', '0');
INSERT INTO `mall_region` VALUES ('1908', '182', '河东区', '3', '0');
INSERT INTO `mall_region` VALUES ('1909', '182', '沂南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1910', '182', '郯城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1911', '182', '沂水县', '3', '0');
INSERT INTO `mall_region` VALUES ('1912', '182', '兰陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('1913', '182', '费县', '3', '0');
INSERT INTO `mall_region` VALUES ('1914', '182', '平邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('1915', '182', '莒南县', '3', '0');
INSERT INTO `mall_region` VALUES ('1916', '182', '蒙阴县', '3', '0');
INSERT INTO `mall_region` VALUES ('1917', '182', '临沭县', '3', '0');
INSERT INTO `mall_region` VALUES ('1918', '182', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1919', '183', '德城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1920', '183', '陵城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1921', '183', '宁津县', '3', '0');
INSERT INTO `mall_region` VALUES ('1922', '183', '庆云县', '3', '0');
INSERT INTO `mall_region` VALUES ('1923', '183', '临邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('1924', '183', '齐河县', '3', '0');
INSERT INTO `mall_region` VALUES ('1925', '183', '平原县', '3', '0');
INSERT INTO `mall_region` VALUES ('1926', '183', '夏津县', '3', '0');
INSERT INTO `mall_region` VALUES ('1927', '183', '武城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1928', '183', '开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('1929', '183', '乐陵市', '3', '0');
INSERT INTO `mall_region` VALUES ('1930', '183', '禹城市', '3', '0');
INSERT INTO `mall_region` VALUES ('1931', '183', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1932', '184', '东昌府区', '3', '0');
INSERT INTO `mall_region` VALUES ('1933', '184', '阳谷县', '3', '0');
INSERT INTO `mall_region` VALUES ('1934', '184', '莘县', '3', '0');
INSERT INTO `mall_region` VALUES ('1935', '184', '茌平县', '3', '0');
INSERT INTO `mall_region` VALUES ('1936', '184', '东阿县', '3', '0');
INSERT INTO `mall_region` VALUES ('1937', '184', '冠县', '3', '0');
INSERT INTO `mall_region` VALUES ('1938', '184', '高唐县', '3', '0');
INSERT INTO `mall_region` VALUES ('1939', '184', '临清市', '3', '0');
INSERT INTO `mall_region` VALUES ('1940', '184', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1941', '185', '滨城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1942', '185', '惠民县', '3', '0');
INSERT INTO `mall_region` VALUES ('1943', '185', '阳信县', '3', '0');
INSERT INTO `mall_region` VALUES ('1944', '185', '无棣县', '3', '0');
INSERT INTO `mall_region` VALUES ('1945', '185', '沾化区', '3', '0');
INSERT INTO `mall_region` VALUES ('1946', '185', '博兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('1947', '185', '邹平县', '3', '0');
INSERT INTO `mall_region` VALUES ('1948', '185', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1949', '186', '牡丹区', '3', '0');
INSERT INTO `mall_region` VALUES ('1950', '186', '曹县', '3', '0');
INSERT INTO `mall_region` VALUES ('1951', '186', '单县', '3', '0');
INSERT INTO `mall_region` VALUES ('1952', '186', '成武县', '3', '0');
INSERT INTO `mall_region` VALUES ('1953', '186', '巨野县', '3', '0');
INSERT INTO `mall_region` VALUES ('1954', '186', '郓城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1955', '186', '鄄城县', '3', '0');
INSERT INTO `mall_region` VALUES ('1956', '186', '定陶县', '3', '0');
INSERT INTO `mall_region` VALUES ('1957', '186', '东明县', '3', '0');
INSERT INTO `mall_region` VALUES ('1958', '186', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1959', '187', '中原区', '3', '0');
INSERT INTO `mall_region` VALUES ('1960', '187', '二七区', '3', '0');
INSERT INTO `mall_region` VALUES ('1961', '187', '管城回族区', '3', '0');
INSERT INTO `mall_region` VALUES ('1962', '187', '金水区', '3', '0');
INSERT INTO `mall_region` VALUES ('1963', '187', '上街区', '3', '0');
INSERT INTO `mall_region` VALUES ('1964', '187', '惠济区', '3', '0');
INSERT INTO `mall_region` VALUES ('1965', '187', '中牟县', '3', '0');
INSERT INTO `mall_region` VALUES ('1966', '187', '巩义市', '3', '0');
INSERT INTO `mall_region` VALUES ('1967', '187', '荥阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('1968', '187', '新密市', '3', '0');
INSERT INTO `mall_region` VALUES ('1969', '187', '新郑市', '3', '0');
INSERT INTO `mall_region` VALUES ('1970', '187', '登封市', '3', '0');
INSERT INTO `mall_region` VALUES ('1971', '187', '郑东新区', '3', '0');
INSERT INTO `mall_region` VALUES ('1972', '187', '高新区', '3', '0');
INSERT INTO `mall_region` VALUES ('1973', '187', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1974', '188', '龙亭区', '3', '0');
INSERT INTO `mall_region` VALUES ('1975', '188', '顺河回族区', '3', '0');
INSERT INTO `mall_region` VALUES ('1976', '188', '鼓楼区', '3', '0');
INSERT INTO `mall_region` VALUES ('1977', '188', '禹王台区', '3', '0');
INSERT INTO `mall_region` VALUES ('1978', '188', '金明区', '3', '0');
INSERT INTO `mall_region` VALUES ('1979', '188', '杞县', '3', '0');
INSERT INTO `mall_region` VALUES ('1980', '188', '通许县', '3', '0');
INSERT INTO `mall_region` VALUES ('1981', '188', '尉氏县', '3', '0');
INSERT INTO `mall_region` VALUES ('1982', '188', '祥符区', '3', '0');
INSERT INTO `mall_region` VALUES ('1983', '188', '兰考县', '3', '0');
INSERT INTO `mall_region` VALUES ('1984', '188', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('1985', '189', '老城区', '3', '0');
INSERT INTO `mall_region` VALUES ('1986', '189', '西工区', '3', '0');
INSERT INTO `mall_region` VALUES ('1987', '189', '瀍河回族区', '3', '0');
INSERT INTO `mall_region` VALUES ('1988', '189', '涧西区', '3', '0');
INSERT INTO `mall_region` VALUES ('1989', '189', '吉利区', '3', '0');
INSERT INTO `mall_region` VALUES ('1990', '189', '洛龙区', '3', '0');
INSERT INTO `mall_region` VALUES ('1991', '189', '孟津县', '3', '0');
INSERT INTO `mall_region` VALUES ('1992', '189', '新安县', '3', '0');
INSERT INTO `mall_region` VALUES ('1993', '189', '栾川县', '3', '0');
INSERT INTO `mall_region` VALUES ('1994', '189', '嵩县', '3', '0');
INSERT INTO `mall_region` VALUES ('1995', '189', '汝阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1996', '189', '宜阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('1997', '189', '洛宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('1998', '189', '伊川县', '3', '0');
INSERT INTO `mall_region` VALUES ('1999', '189', '偃师市', '3', '0');
INSERT INTO `mall_region` VALUES ('2000', '190', '新华区', '3', '0');
INSERT INTO `mall_region` VALUES ('2001', '190', '卫东区', '3', '0');
INSERT INTO `mall_region` VALUES ('2002', '190', '石龙区', '3', '0');
INSERT INTO `mall_region` VALUES ('2003', '190', '湛河区', '3', '0');
INSERT INTO `mall_region` VALUES ('2004', '190', '宝丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2005', '190', '叶县', '3', '0');
INSERT INTO `mall_region` VALUES ('2006', '190', '鲁山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2007', '190', '郏县', '3', '0');
INSERT INTO `mall_region` VALUES ('2008', '190', '舞钢市', '3', '0');
INSERT INTO `mall_region` VALUES ('2009', '190', '汝州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2010', '190', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2011', '191', '文峰区', '3', '0');
INSERT INTO `mall_region` VALUES ('2012', '191', '北关区', '3', '0');
INSERT INTO `mall_region` VALUES ('2013', '191', '殷都区', '3', '0');
INSERT INTO `mall_region` VALUES ('2014', '191', '龙安区', '3', '0');
INSERT INTO `mall_region` VALUES ('2015', '191', '安阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2016', '191', '汤阴县', '3', '0');
INSERT INTO `mall_region` VALUES ('2017', '191', '滑县', '3', '0');
INSERT INTO `mall_region` VALUES ('2018', '191', '内黄县', '3', '0');
INSERT INTO `mall_region` VALUES ('2019', '191', '林州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2020', '191', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2021', '192', '鹤山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2022', '192', '山城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2023', '192', '淇滨区', '3', '0');
INSERT INTO `mall_region` VALUES ('2024', '192', '浚县', '3', '0');
INSERT INTO `mall_region` VALUES ('2025', '192', '淇县', '3', '0');
INSERT INTO `mall_region` VALUES ('2026', '192', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2027', '193', '红旗区', '3', '0');
INSERT INTO `mall_region` VALUES ('2028', '193', '卫滨区', '3', '0');
INSERT INTO `mall_region` VALUES ('2029', '193', '凤泉区', '3', '0');
INSERT INTO `mall_region` VALUES ('2030', '193', '牧野区', '3', '0');
INSERT INTO `mall_region` VALUES ('2031', '193', '新乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2032', '193', '获嘉县', '3', '0');
INSERT INTO `mall_region` VALUES ('2033', '193', '原阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2034', '193', '延津县', '3', '0');
INSERT INTO `mall_region` VALUES ('2035', '193', '封丘县', '3', '0');
INSERT INTO `mall_region` VALUES ('2036', '193', '长垣县', '3', '0');
INSERT INTO `mall_region` VALUES ('2037', '193', '卫辉市', '3', '0');
INSERT INTO `mall_region` VALUES ('2038', '193', '辉县市', '3', '0');
INSERT INTO `mall_region` VALUES ('2039', '193', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2040', '194', '解放区', '3', '0');
INSERT INTO `mall_region` VALUES ('2041', '194', '中站区', '3', '0');
INSERT INTO `mall_region` VALUES ('2042', '194', '马村区', '3', '0');
INSERT INTO `mall_region` VALUES ('2043', '194', '山阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2044', '194', '修武县', '3', '0');
INSERT INTO `mall_region` VALUES ('2045', '194', '博爱县', '3', '0');
INSERT INTO `mall_region` VALUES ('2046', '194', '武陟县', '3', '0');
INSERT INTO `mall_region` VALUES ('2047', '194', '温县', '3', '0');
INSERT INTO `mall_region` VALUES ('2048', '194', '沁阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('2049', '194', '孟州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2050', '194', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2051', '195', '华龙区', '3', '0');
INSERT INTO `mall_region` VALUES ('2052', '195', '清丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2053', '195', '南乐县', '3', '0');
INSERT INTO `mall_region` VALUES ('2054', '195', '范县', '3', '0');
INSERT INTO `mall_region` VALUES ('2055', '195', '台前县', '3', '0');
INSERT INTO `mall_region` VALUES ('2056', '195', '濮阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2057', '195', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2058', '196', '魏都区', '3', '0');
INSERT INTO `mall_region` VALUES ('2059', '196', '许昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('2060', '196', '鄢陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('2061', '196', '襄城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2062', '196', '禹州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2063', '196', '长葛市', '3', '0');
INSERT INTO `mall_region` VALUES ('2064', '196', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2065', '197', '源汇区', '3', '0');
INSERT INTO `mall_region` VALUES ('2066', '197', '郾城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2067', '197', '召陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2068', '197', '舞阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2069', '197', '临颍县', '3', '0');
INSERT INTO `mall_region` VALUES ('2070', '197', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2071', '198', '湖滨区', '3', '0');
INSERT INTO `mall_region` VALUES ('2072', '198', '渑池县', '3', '0');
INSERT INTO `mall_region` VALUES ('2073', '198', '陕州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2074', '198', '卢氏县', '3', '0');
INSERT INTO `mall_region` VALUES ('2075', '198', '义马市', '3', '0');
INSERT INTO `mall_region` VALUES ('2076', '198', '灵宝市', '3', '0');
INSERT INTO `mall_region` VALUES ('2077', '198', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2078', '199', '宛城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2079', '199', '卧龙区', '3', '0');
INSERT INTO `mall_region` VALUES ('2080', '199', '南召县', '3', '0');
INSERT INTO `mall_region` VALUES ('2081', '199', '方城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2082', '199', '西峡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2083', '199', '镇平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2084', '199', '内乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2085', '199', '淅川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2086', '199', '社旗县', '3', '0');
INSERT INTO `mall_region` VALUES ('2087', '199', '唐河县', '3', '0');
INSERT INTO `mall_region` VALUES ('2088', '199', '新野县', '3', '0');
INSERT INTO `mall_region` VALUES ('2089', '199', '桐柏县', '3', '0');
INSERT INTO `mall_region` VALUES ('2090', '199', '邓州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2091', '199', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2092', '200', '梁园区', '3', '0');
INSERT INTO `mall_region` VALUES ('2093', '200', '睢阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2094', '200', '民权县', '3', '0');
INSERT INTO `mall_region` VALUES ('2095', '200', '睢县', '3', '0');
INSERT INTO `mall_region` VALUES ('2096', '200', '宁陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('2097', '200', '柘城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2098', '200', '虞城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2099', '200', '夏邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('2100', '200', '永城市', '3', '0');
INSERT INTO `mall_region` VALUES ('2101', '200', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2102', '201', '浉河区', '3', '0');
INSERT INTO `mall_region` VALUES ('2103', '201', '平桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('2104', '201', '罗山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2105', '201', '光山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2106', '201', '新县', '3', '0');
INSERT INTO `mall_region` VALUES ('2107', '201', '商城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2108', '201', '固始县', '3', '0');
INSERT INTO `mall_region` VALUES ('2109', '201', '潢川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2110', '201', '淮滨县', '3', '0');
INSERT INTO `mall_region` VALUES ('2111', '201', '息县', '3', '0');
INSERT INTO `mall_region` VALUES ('2112', '201', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2113', '202', '川汇区', '3', '0');
INSERT INTO `mall_region` VALUES ('2114', '202', '扶沟县', '3', '0');
INSERT INTO `mall_region` VALUES ('2115', '202', '西华县', '3', '0');
INSERT INTO `mall_region` VALUES ('2116', '202', '商水县', '3', '0');
INSERT INTO `mall_region` VALUES ('2117', '202', '沈丘县', '3', '0');
INSERT INTO `mall_region` VALUES ('2118', '202', '郸城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2119', '202', '淮阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2120', '202', '太康县', '3', '0');
INSERT INTO `mall_region` VALUES ('2121', '202', '鹿邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('2122', '202', '项城市', '3', '0');
INSERT INTO `mall_region` VALUES ('2123', '202', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2124', '203', '驿城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2125', '203', '西平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2126', '203', '上蔡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2127', '203', '平舆县', '3', '0');
INSERT INTO `mall_region` VALUES ('2128', '203', '正阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2129', '203', '确山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2130', '203', '泌阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2131', '203', '汝南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2132', '203', '遂平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2133', '203', '新蔡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2134', '203', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2135', '204', '江岸区', '3', '0');
INSERT INTO `mall_region` VALUES ('2136', '204', '江汉区', '3', '0');
INSERT INTO `mall_region` VALUES ('2137', '204', '硚口区', '3', '0');
INSERT INTO `mall_region` VALUES ('2138', '204', '汉阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2139', '204', '武昌区', '3', '0');
INSERT INTO `mall_region` VALUES ('2140', '204', '青山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2141', '204', '洪山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2142', '204', '东西湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2143', '204', '汉南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2144', '204', '蔡甸区', '3', '0');
INSERT INTO `mall_region` VALUES ('2145', '204', '江夏区', '3', '0');
INSERT INTO `mall_region` VALUES ('2146', '204', '黄陂区', '3', '0');
INSERT INTO `mall_region` VALUES ('2147', '204', '新洲区', '3', '0');
INSERT INTO `mall_region` VALUES ('2148', '204', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2149', '205', '黄石港区', '3', '0');
INSERT INTO `mall_region` VALUES ('2150', '205', '西塞山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2151', '205', '下陆区', '3', '0');
INSERT INTO `mall_region` VALUES ('2152', '205', '铁山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2153', '205', '阳新县', '3', '0');
INSERT INTO `mall_region` VALUES ('2154', '205', '大冶市', '3', '0');
INSERT INTO `mall_region` VALUES ('2155', '205', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2156', '206', '茅箭区', '3', '0');
INSERT INTO `mall_region` VALUES ('2157', '206', '张湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('2158', '206', '郧阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2159', '206', '郧西县', '3', '0');
INSERT INTO `mall_region` VALUES ('2160', '206', '竹山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2161', '206', '竹溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2162', '206', '房县', '3', '0');
INSERT INTO `mall_region` VALUES ('2163', '206', '丹江口市', '3', '0');
INSERT INTO `mall_region` VALUES ('2164', '206', '城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2165', '206', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2166', '207', '西陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2167', '207', '伍家岗区', '3', '0');
INSERT INTO `mall_region` VALUES ('2168', '207', '点军区', '3', '0');
INSERT INTO `mall_region` VALUES ('2169', '207', '猇亭区', '3', '0');
INSERT INTO `mall_region` VALUES ('2170', '207', '夷陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2171', '207', '远安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2172', '207', '兴山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2173', '207', '秭归县', '3', '0');
INSERT INTO `mall_region` VALUES ('2174', '207', '长阳土家族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2175', '207', '五峰土家族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2176', '207', '葛洲坝区', '3', '0');
INSERT INTO `mall_region` VALUES ('2177', '207', '开发区', '3', '0');
INSERT INTO `mall_region` VALUES ('2178', '207', '宜都市', '3', '0');
INSERT INTO `mall_region` VALUES ('2179', '207', '当阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('2180', '207', '枝江市', '3', '0');
INSERT INTO `mall_region` VALUES ('2181', '207', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2182', '208', '襄城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2183', '208', '樊城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2184', '208', '襄州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2185', '208', '南漳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2186', '208', '谷城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2187', '208', '保康县', '3', '0');
INSERT INTO `mall_region` VALUES ('2188', '208', '老河口市', '3', '0');
INSERT INTO `mall_region` VALUES ('2189', '208', '枣阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('2190', '208', '宜城市', '3', '0');
INSERT INTO `mall_region` VALUES ('2191', '208', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2192', '209', '梁子湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2193', '209', '华容区', '3', '0');
INSERT INTO `mall_region` VALUES ('2194', '209', '鄂城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2195', '209', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2196', '210', '东宝区', '3', '0');
INSERT INTO `mall_region` VALUES ('2197', '210', '掇刀区', '3', '0');
INSERT INTO `mall_region` VALUES ('2198', '210', '京山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2199', '210', '沙洋县', '3', '0');
INSERT INTO `mall_region` VALUES ('2200', '210', '钟祥市', '3', '0');
INSERT INTO `mall_region` VALUES ('2201', '210', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2202', '211', '孝南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2203', '211', '孝昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('2204', '211', '大悟县', '3', '0');
INSERT INTO `mall_region` VALUES ('2205', '211', '云梦县', '3', '0');
INSERT INTO `mall_region` VALUES ('2206', '211', '应城市', '3', '0');
INSERT INTO `mall_region` VALUES ('2207', '211', '安陆市', '3', '0');
INSERT INTO `mall_region` VALUES ('2208', '211', '汉川市', '3', '0');
INSERT INTO `mall_region` VALUES ('2209', '211', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2210', '212', '沙市区', '3', '0');
INSERT INTO `mall_region` VALUES ('2211', '212', '荆州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2212', '212', '公安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2213', '212', '监利县', '3', '0');
INSERT INTO `mall_region` VALUES ('2214', '212', '江陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('2215', '212', '石首市', '3', '0');
INSERT INTO `mall_region` VALUES ('2216', '212', '洪湖市', '3', '0');
INSERT INTO `mall_region` VALUES ('2217', '212', '松滋市', '3', '0');
INSERT INTO `mall_region` VALUES ('2218', '212', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2219', '213', '黄州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2220', '213', '团风县', '3', '0');
INSERT INTO `mall_region` VALUES ('2221', '213', '红安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2222', '213', '罗田县', '3', '0');
INSERT INTO `mall_region` VALUES ('2223', '213', '英山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2224', '213', '浠水县', '3', '0');
INSERT INTO `mall_region` VALUES ('2225', '213', '蕲春县', '3', '0');
INSERT INTO `mall_region` VALUES ('2226', '213', '黄梅县', '3', '0');
INSERT INTO `mall_region` VALUES ('2227', '213', '麻城市', '3', '0');
INSERT INTO `mall_region` VALUES ('2228', '213', '武穴市', '3', '0');
INSERT INTO `mall_region` VALUES ('2229', '213', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2230', '214', '咸安区', '3', '0');
INSERT INTO `mall_region` VALUES ('2231', '214', '嘉鱼县', '3', '0');
INSERT INTO `mall_region` VALUES ('2232', '214', '通城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2233', '214', '崇阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2234', '214', '通山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2235', '214', '赤壁市', '3', '0');
INSERT INTO `mall_region` VALUES ('2236', '214', '温泉城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2237', '214', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2238', '215', '曾都区', '3', '0');
INSERT INTO `mall_region` VALUES ('2239', '215', '随县', '3', '0');
INSERT INTO `mall_region` VALUES ('2240', '215', '广水市', '3', '0');
INSERT INTO `mall_region` VALUES ('2241', '215', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2242', '216', '恩施市', '3', '0');
INSERT INTO `mall_region` VALUES ('2243', '216', '利川市', '3', '0');
INSERT INTO `mall_region` VALUES ('2244', '216', '建始县', '3', '0');
INSERT INTO `mall_region` VALUES ('2245', '216', '巴东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2246', '216', '宣恩县', '3', '0');
INSERT INTO `mall_region` VALUES ('2247', '216', '咸丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2248', '216', '来凤县', '3', '0');
INSERT INTO `mall_region` VALUES ('2249', '216', '鹤峰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2250', '216', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2251', '217', '芙蓉区', '3', '0');
INSERT INTO `mall_region` VALUES ('2252', '217', '天心区', '3', '0');
INSERT INTO `mall_region` VALUES ('2253', '217', '岳麓区', '3', '0');
INSERT INTO `mall_region` VALUES ('2254', '217', '开福区', '3', '0');
INSERT INTO `mall_region` VALUES ('2255', '217', '雨花区', '3', '0');
INSERT INTO `mall_region` VALUES ('2256', '217', '长沙县', '3', '0');
INSERT INTO `mall_region` VALUES ('2257', '217', '望城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2258', '217', '宁乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2259', '217', '浏阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('2260', '217', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2261', '218', '荷塘区', '3', '0');
INSERT INTO `mall_region` VALUES ('2262', '218', '芦淞区', '3', '0');
INSERT INTO `mall_region` VALUES ('2263', '218', '石峰区', '3', '0');
INSERT INTO `mall_region` VALUES ('2264', '218', '天元区', '3', '0');
INSERT INTO `mall_region` VALUES ('2265', '218', '株洲县', '3', '0');
INSERT INTO `mall_region` VALUES ('2266', '218', '攸县', '3', '0');
INSERT INTO `mall_region` VALUES ('2267', '218', '茶陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('2268', '218', '炎陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('2269', '218', '醴陵市', '3', '0');
INSERT INTO `mall_region` VALUES ('2270', '218', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2271', '219', '雨湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2272', '219', '岳塘区', '3', '0');
INSERT INTO `mall_region` VALUES ('2273', '219', '湘潭县', '3', '0');
INSERT INTO `mall_region` VALUES ('2274', '219', '湘乡市', '3', '0');
INSERT INTO `mall_region` VALUES ('2275', '219', '韶山市', '3', '0');
INSERT INTO `mall_region` VALUES ('2276', '219', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2277', '220', '珠晖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2278', '220', '雁峰区', '3', '0');
INSERT INTO `mall_region` VALUES ('2279', '220', '石鼓区', '3', '0');
INSERT INTO `mall_region` VALUES ('2280', '220', '蒸湘区', '3', '0');
INSERT INTO `mall_region` VALUES ('2281', '220', '南岳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2282', '220', '衡阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2283', '220', '衡南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2284', '220', '衡山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2285', '220', '衡东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2286', '220', '祁东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2287', '220', '耒阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('2288', '220', '常宁市', '3', '0');
INSERT INTO `mall_region` VALUES ('2289', '220', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2290', '221', '双清区', '3', '0');
INSERT INTO `mall_region` VALUES ('2291', '221', '大祥区', '3', '0');
INSERT INTO `mall_region` VALUES ('2292', '221', '北塔区', '3', '0');
INSERT INTO `mall_region` VALUES ('2293', '221', '邵东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2294', '221', '新邵县', '3', '0');
INSERT INTO `mall_region` VALUES ('2295', '221', '邵阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2296', '221', '隆回县', '3', '0');
INSERT INTO `mall_region` VALUES ('2297', '221', '洞口县', '3', '0');
INSERT INTO `mall_region` VALUES ('2298', '221', '绥宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2299', '221', '新宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2300', '221', '城步苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2301', '221', '武冈市', '3', '0');
INSERT INTO `mall_region` VALUES ('2302', '221', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2303', '222', '岳阳楼区', '3', '0');
INSERT INTO `mall_region` VALUES ('2304', '222', '云溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('2305', '222', '君山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2306', '222', '岳阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2307', '222', '华容县', '3', '0');
INSERT INTO `mall_region` VALUES ('2308', '222', '湘阴县', '3', '0');
INSERT INTO `mall_region` VALUES ('2309', '222', '平江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2310', '222', '汨罗市', '3', '0');
INSERT INTO `mall_region` VALUES ('2311', '222', '临湘市', '3', '0');
INSERT INTO `mall_region` VALUES ('2312', '222', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2313', '223', '武陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2314', '223', '鼎城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2315', '223', '安乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2316', '223', '汉寿县', '3', '0');
INSERT INTO `mall_region` VALUES ('2317', '223', '澧县', '3', '0');
INSERT INTO `mall_region` VALUES ('2318', '223', '临澧县', '3', '0');
INSERT INTO `mall_region` VALUES ('2319', '223', '桃源县', '3', '0');
INSERT INTO `mall_region` VALUES ('2320', '223', '石门县', '3', '0');
INSERT INTO `mall_region` VALUES ('2321', '223', '津市市', '3', '0');
INSERT INTO `mall_region` VALUES ('2322', '223', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2323', '224', '永定区', '3', '0');
INSERT INTO `mall_region` VALUES ('2324', '224', '武陵源区', '3', '0');
INSERT INTO `mall_region` VALUES ('2325', '224', '慈利县', '3', '0');
INSERT INTO `mall_region` VALUES ('2326', '224', '桑植县', '3', '0');
INSERT INTO `mall_region` VALUES ('2327', '224', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2328', '225', '资阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2329', '225', '赫山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2330', '225', '南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2331', '225', '桃江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2332', '225', '安化县', '3', '0');
INSERT INTO `mall_region` VALUES ('2333', '225', '沅江市', '3', '0');
INSERT INTO `mall_region` VALUES ('2334', '225', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2335', '226', '北湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2336', '226', '苏仙区', '3', '0');
INSERT INTO `mall_region` VALUES ('2337', '226', '桂阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2338', '226', '宜章县', '3', '0');
INSERT INTO `mall_region` VALUES ('2339', '226', '永兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('2340', '226', '嘉禾县', '3', '0');
INSERT INTO `mall_region` VALUES ('2341', '226', '临武县', '3', '0');
INSERT INTO `mall_region` VALUES ('2342', '226', '汝城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2343', '226', '桂东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2344', '226', '安仁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2345', '226', '资兴市', '3', '0');
INSERT INTO `mall_region` VALUES ('2346', '226', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2347', '227', '零陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2348', '227', '冷水滩区', '3', '0');
INSERT INTO `mall_region` VALUES ('2349', '227', '祁阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2350', '227', '东安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2351', '227', '双牌县', '3', '0');
INSERT INTO `mall_region` VALUES ('2352', '227', '道县', '3', '0');
INSERT INTO `mall_region` VALUES ('2353', '227', '江永县', '3', '0');
INSERT INTO `mall_region` VALUES ('2354', '227', '宁远县', '3', '0');
INSERT INTO `mall_region` VALUES ('2355', '227', '蓝山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2356', '227', '新田县', '3', '0');
INSERT INTO `mall_region` VALUES ('2357', '227', '江华瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2358', '227', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2359', '228', '鹤城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2360', '228', '中方县', '3', '0');
INSERT INTO `mall_region` VALUES ('2361', '228', '沅陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('2362', '228', '辰溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2363', '228', '溆浦县', '3', '0');
INSERT INTO `mall_region` VALUES ('2364', '228', '会同县', '3', '0');
INSERT INTO `mall_region` VALUES ('2365', '228', '麻阳苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2366', '228', '新晃侗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2367', '228', '芷江侗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2368', '228', '靖州苗族侗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2369', '228', '通道侗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2370', '228', '洪江市', '3', '0');
INSERT INTO `mall_region` VALUES ('2371', '228', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2372', '229', '娄星区', '3', '0');
INSERT INTO `mall_region` VALUES ('2373', '229', '双峰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2374', '229', '新化县', '3', '0');
INSERT INTO `mall_region` VALUES ('2375', '229', '冷水江市', '3', '0');
INSERT INTO `mall_region` VALUES ('2376', '229', '涟源市', '3', '0');
INSERT INTO `mall_region` VALUES ('2377', '229', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2378', '230', '吉首市', '3', '0');
INSERT INTO `mall_region` VALUES ('2379', '230', '泸溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2380', '230', '凤凰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2381', '230', '花垣县', '3', '0');
INSERT INTO `mall_region` VALUES ('2382', '230', '保靖县', '3', '0');
INSERT INTO `mall_region` VALUES ('2383', '230', '古丈县', '3', '0');
INSERT INTO `mall_region` VALUES ('2384', '230', '永顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('2385', '230', '龙山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2386', '230', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2387', '231', '荔湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('2388', '231', '越秀区', '3', '0');
INSERT INTO `mall_region` VALUES ('2389', '231', '海珠区', '3', '0');
INSERT INTO `mall_region` VALUES ('2390', '231', '天河区', '3', '0');
INSERT INTO `mall_region` VALUES ('2391', '231', '白云区', '3', '0');
INSERT INTO `mall_region` VALUES ('2392', '231', '黄埔区', '3', '0');
INSERT INTO `mall_region` VALUES ('2393', '231', '番禺区', '3', '0');
INSERT INTO `mall_region` VALUES ('2394', '231', '花都区', '3', '0');
INSERT INTO `mall_region` VALUES ('2395', '231', '南沙区', '3', '0');
INSERT INTO `mall_region` VALUES ('2396', '231', '萝岗区', '3', '0');
INSERT INTO `mall_region` VALUES ('2397', '231', '增城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2398', '231', '从化区', '3', '0');
INSERT INTO `mall_region` VALUES ('2399', '231', '东山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2400', '231', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2401', '232', '武江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2402', '232', '浈江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2403', '232', '曲江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2404', '232', '始兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('2405', '232', '仁化县', '3', '0');
INSERT INTO `mall_region` VALUES ('2406', '232', '翁源县', '3', '0');
INSERT INTO `mall_region` VALUES ('2407', '232', '乳源瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2408', '232', '新丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2409', '232', '乐昌市', '3', '0');
INSERT INTO `mall_region` VALUES ('2410', '232', '南雄市', '3', '0');
INSERT INTO `mall_region` VALUES ('2411', '232', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2412', '233', '罗湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2413', '233', '福田区', '3', '0');
INSERT INTO `mall_region` VALUES ('2414', '233', '南山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2415', '233', '宝安区', '3', '0');
INSERT INTO `mall_region` VALUES ('2416', '233', '龙岗区', '3', '0');
INSERT INTO `mall_region` VALUES ('2417', '233', '盐田区', '3', '0');
INSERT INTO `mall_region` VALUES ('2418', '233', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2419', '233', '光明新区', '3', '0');
INSERT INTO `mall_region` VALUES ('2420', '233', '坪山新区', '3', '0');
INSERT INTO `mall_region` VALUES ('2421', '233', '大鹏新区', '3', '0');
INSERT INTO `mall_region` VALUES ('2422', '233', '龙华新区', '3', '0');
INSERT INTO `mall_region` VALUES ('2423', '234', '香洲区', '3', '0');
INSERT INTO `mall_region` VALUES ('2424', '234', '斗门区', '3', '0');
INSERT INTO `mall_region` VALUES ('2425', '234', '金湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('2426', '234', '金唐区', '3', '0');
INSERT INTO `mall_region` VALUES ('2427', '234', '南湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('2428', '234', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2429', '235', '龙湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2430', '235', '金平区', '3', '0');
INSERT INTO `mall_region` VALUES ('2431', '235', '濠江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2432', '235', '潮阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2433', '235', '潮南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2434', '235', '澄海区', '3', '0');
INSERT INTO `mall_region` VALUES ('2435', '235', '南澳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2436', '235', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2437', '236', '禅城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2438', '236', '南海区', '3', '0');
INSERT INTO `mall_region` VALUES ('2439', '236', '顺德区', '3', '0');
INSERT INTO `mall_region` VALUES ('2440', '236', '三水区', '3', '0');
INSERT INTO `mall_region` VALUES ('2441', '236', '高明区', '3', '0');
INSERT INTO `mall_region` VALUES ('2442', '236', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2443', '237', '蓬江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2444', '237', '江海区', '3', '0');
INSERT INTO `mall_region` VALUES ('2445', '237', '新会区', '3', '0');
INSERT INTO `mall_region` VALUES ('2446', '237', '台山市', '3', '0');
INSERT INTO `mall_region` VALUES ('2447', '237', '开平市', '3', '0');
INSERT INTO `mall_region` VALUES ('2448', '237', '鹤山市', '3', '0');
INSERT INTO `mall_region` VALUES ('2449', '237', '恩平市', '3', '0');
INSERT INTO `mall_region` VALUES ('2450', '237', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2451', '238', '赤坎区', '3', '0');
INSERT INTO `mall_region` VALUES ('2452', '238', '霞山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2453', '238', '坡头区', '3', '0');
INSERT INTO `mall_region` VALUES ('2454', '238', '麻章区', '3', '0');
INSERT INTO `mall_region` VALUES ('2455', '238', '遂溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2456', '238', '徐闻县', '3', '0');
INSERT INTO `mall_region` VALUES ('2457', '238', '廉江市', '3', '0');
INSERT INTO `mall_region` VALUES ('2458', '238', '雷州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2459', '238', '吴川市', '3', '0');
INSERT INTO `mall_region` VALUES ('2460', '238', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2461', '239', '茂南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2462', '239', '电白区', '3', '0');
INSERT INTO `mall_region` VALUES ('2463', '239', '电白县', '3', '0');
INSERT INTO `mall_region` VALUES ('2464', '239', '高州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2465', '239', '化州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2466', '239', '信宜市', '3', '0');
INSERT INTO `mall_region` VALUES ('2467', '239', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2468', '240', '端州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2469', '240', '鼎湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2470', '240', '广宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2471', '240', '怀集县', '3', '0');
INSERT INTO `mall_region` VALUES ('2472', '240', '封开县', '3', '0');
INSERT INTO `mall_region` VALUES ('2473', '240', '德庆县', '3', '0');
INSERT INTO `mall_region` VALUES ('2474', '240', '高要市', '3', '0');
INSERT INTO `mall_region` VALUES ('2475', '240', '四会市', '3', '0');
INSERT INTO `mall_region` VALUES ('2476', '240', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2477', '241', '惠城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2478', '241', '惠阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2479', '241', '博罗县', '3', '0');
INSERT INTO `mall_region` VALUES ('2480', '241', '惠东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2481', '241', '龙门县', '3', '0');
INSERT INTO `mall_region` VALUES ('2482', '241', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2483', '242', '梅江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2484', '242', '梅县区', '3', '0');
INSERT INTO `mall_region` VALUES ('2485', '242', '大埔县', '3', '0');
INSERT INTO `mall_region` VALUES ('2486', '242', '丰顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('2487', '242', '五华县', '3', '0');
INSERT INTO `mall_region` VALUES ('2488', '242', '平远县', '3', '0');
INSERT INTO `mall_region` VALUES ('2489', '242', '蕉岭县', '3', '0');
INSERT INTO `mall_region` VALUES ('2490', '242', '兴宁市', '3', '0');
INSERT INTO `mall_region` VALUES ('2491', '242', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2492', '243', '城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2493', '243', '海丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2494', '243', '陆河县', '3', '0');
INSERT INTO `mall_region` VALUES ('2495', '243', '陆丰市', '3', '0');
INSERT INTO `mall_region` VALUES ('2496', '243', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2497', '244', '源城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2498', '244', '紫金县', '3', '0');
INSERT INTO `mall_region` VALUES ('2499', '244', '龙川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2500', '244', '连平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2501', '244', '和平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2502', '244', '东源县', '3', '0');
INSERT INTO `mall_region` VALUES ('2503', '244', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2504', '245', '江城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2505', '245', '阳西县', '3', '0');
INSERT INTO `mall_region` VALUES ('2506', '245', '阳东区', '3', '0');
INSERT INTO `mall_region` VALUES ('2507', '245', '阳春市', '3', '0');
INSERT INTO `mall_region` VALUES ('2508', '245', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2509', '246', '清城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2510', '246', '佛冈县', '3', '0');
INSERT INTO `mall_region` VALUES ('2511', '246', '阳山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2512', '246', '连山壮族瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2513', '246', '连南瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2514', '246', '清新区', '3', '0');
INSERT INTO `mall_region` VALUES ('2515', '246', '英德市', '3', '0');
INSERT INTO `mall_region` VALUES ('2516', '246', '连州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2517', '246', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2518', '250', '湘桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('2519', '250', '潮安区', '3', '0');
INSERT INTO `mall_region` VALUES ('2520', '250', '饶平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2521', '250', '枫溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('2522', '250', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2523', '251', '榕城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2524', '251', '揭东区', '3', '0');
INSERT INTO `mall_region` VALUES ('2525', '251', '揭西县', '3', '0');
INSERT INTO `mall_region` VALUES ('2526', '251', '惠来县', '3', '0');
INSERT INTO `mall_region` VALUES ('2527', '251', '普宁市', '3', '0');
INSERT INTO `mall_region` VALUES ('2528', '251', '东山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2529', '251', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2530', '252', '云城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2531', '252', '新兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('2532', '252', '郁南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2533', '252', '云安区', '3', '0');
INSERT INTO `mall_region` VALUES ('2534', '252', '罗定市', '3', '0');
INSERT INTO `mall_region` VALUES ('2535', '252', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2536', '253', '兴宁区', '3', '0');
INSERT INTO `mall_region` VALUES ('2537', '253', '青秀区', '3', '0');
INSERT INTO `mall_region` VALUES ('2538', '253', '江南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2539', '253', '西乡塘区', '3', '0');
INSERT INTO `mall_region` VALUES ('2540', '253', '良庆区', '3', '0');
INSERT INTO `mall_region` VALUES ('2541', '253', '邕宁区', '3', '0');
INSERT INTO `mall_region` VALUES ('2542', '253', '武鸣区', '3', '0');
INSERT INTO `mall_region` VALUES ('2543', '253', '隆安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2544', '253', '马山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2545', '253', '上林县', '3', '0');
INSERT INTO `mall_region` VALUES ('2546', '253', '宾阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2547', '253', '横县', '3', '0');
INSERT INTO `mall_region` VALUES ('2548', '253', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2549', '254', '城中区', '3', '0');
INSERT INTO `mall_region` VALUES ('2550', '254', '鱼峰区', '3', '0');
INSERT INTO `mall_region` VALUES ('2551', '254', '柳南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2552', '254', '柳北区', '3', '0');
INSERT INTO `mall_region` VALUES ('2553', '254', '柳江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2554', '254', '柳城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2555', '254', '鹿寨县', '3', '0');
INSERT INTO `mall_region` VALUES ('2556', '254', '融安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2557', '254', '融水苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2558', '254', '三江侗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2559', '254', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2560', '255', '秀峰区', '3', '0');
INSERT INTO `mall_region` VALUES ('2561', '255', '叠彩区', '3', '0');
INSERT INTO `mall_region` VALUES ('2562', '255', '象山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2563', '255', '七星区', '3', '0');
INSERT INTO `mall_region` VALUES ('2564', '255', '雁山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2565', '255', '阳朔县', '3', '0');
INSERT INTO `mall_region` VALUES ('2566', '255', '临桂区', '3', '0');
INSERT INTO `mall_region` VALUES ('2567', '255', '灵川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2568', '255', '全州县', '3', '0');
INSERT INTO `mall_region` VALUES ('2569', '255', '兴安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2570', '255', '永福县', '3', '0');
INSERT INTO `mall_region` VALUES ('2571', '255', '灌阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2572', '255', '龙胜各族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2573', '255', '资源县', '3', '0');
INSERT INTO `mall_region` VALUES ('2574', '255', '平乐县', '3', '0');
INSERT INTO `mall_region` VALUES ('2575', '255', '荔浦县', '3', '0');
INSERT INTO `mall_region` VALUES ('2576', '255', '恭城瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2577', '255', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2578', '256', '万秀区', '3', '0');
INSERT INTO `mall_region` VALUES ('2579', '256', '蝶山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2580', '256', '长洲区', '3', '0');
INSERT INTO `mall_region` VALUES ('2581', '256', '龙圩区', '3', '0');
INSERT INTO `mall_region` VALUES ('2582', '256', '苍梧县', '3', '0');
INSERT INTO `mall_region` VALUES ('2583', '256', '藤县', '3', '0');
INSERT INTO `mall_region` VALUES ('2584', '256', '蒙山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2585', '256', '岑溪市', '3', '0');
INSERT INTO `mall_region` VALUES ('2586', '256', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2587', '257', '海城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2588', '257', '银海区', '3', '0');
INSERT INTO `mall_region` VALUES ('2589', '257', '铁山港区', '3', '0');
INSERT INTO `mall_region` VALUES ('2590', '257', '合浦县', '3', '0');
INSERT INTO `mall_region` VALUES ('2591', '257', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2592', '258', '港口区', '3', '0');
INSERT INTO `mall_region` VALUES ('2593', '258', '防城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2594', '258', '上思县', '3', '0');
INSERT INTO `mall_region` VALUES ('2595', '258', '东兴市', '3', '0');
INSERT INTO `mall_region` VALUES ('2596', '258', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2597', '259', '钦南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2598', '259', '钦北区', '3', '0');
INSERT INTO `mall_region` VALUES ('2599', '259', '灵山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2600', '259', '浦北县', '3', '0');
INSERT INTO `mall_region` VALUES ('2601', '259', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2602', '260', '港北区', '3', '0');
INSERT INTO `mall_region` VALUES ('2603', '260', '港南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2604', '260', '覃塘区', '3', '0');
INSERT INTO `mall_region` VALUES ('2605', '260', '平南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2606', '260', '桂平市', '3', '0');
INSERT INTO `mall_region` VALUES ('2607', '260', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2608', '261', '玉州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2609', '261', '福绵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2610', '261', '容县', '3', '0');
INSERT INTO `mall_region` VALUES ('2611', '261', '陆川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2612', '261', '博白县', '3', '0');
INSERT INTO `mall_region` VALUES ('2613', '261', '兴业县', '3', '0');
INSERT INTO `mall_region` VALUES ('2614', '261', '北流市', '3', '0');
INSERT INTO `mall_region` VALUES ('2615', '261', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2616', '262', '右江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2617', '262', '田阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2618', '262', '田东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2619', '262', '平果县', '3', '0');
INSERT INTO `mall_region` VALUES ('2620', '262', '德保县', '3', '0');
INSERT INTO `mall_region` VALUES ('2621', '262', '靖西县', '3', '0');
INSERT INTO `mall_region` VALUES ('2622', '262', '那坡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2623', '262', '凌云县', '3', '0');
INSERT INTO `mall_region` VALUES ('2624', '262', '乐业县', '3', '0');
INSERT INTO `mall_region` VALUES ('2625', '262', '田林县', '3', '0');
INSERT INTO `mall_region` VALUES ('2626', '262', '西林县', '3', '0');
INSERT INTO `mall_region` VALUES ('2627', '262', '隆林各族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2628', '262', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2629', '263', '八步区', '3', '0');
INSERT INTO `mall_region` VALUES ('2630', '263', '平桂管理区', '3', '0');
INSERT INTO `mall_region` VALUES ('2631', '263', '昭平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2632', '263', '钟山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2633', '263', '富川瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2634', '263', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2635', '264', '金城江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2636', '264', '南丹县', '3', '0');
INSERT INTO `mall_region` VALUES ('2637', '264', '天峨县', '3', '0');
INSERT INTO `mall_region` VALUES ('2638', '264', '凤山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2639', '264', '东兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2640', '264', '罗城仫佬族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2641', '264', '环江毛南族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2642', '264', '巴马瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2643', '264', '都安瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2644', '264', '大化瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2645', '264', '宜州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2646', '264', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2647', '265', '兴宾区', '3', '0');
INSERT INTO `mall_region` VALUES ('2648', '265', '忻城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2649', '265', '象州县', '3', '0');
INSERT INTO `mall_region` VALUES ('2650', '265', '武宣县', '3', '0');
INSERT INTO `mall_region` VALUES ('2651', '265', '金秀瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2652', '265', '合山市', '3', '0');
INSERT INTO `mall_region` VALUES ('2653', '265', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2654', '266', '江州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2655', '266', '扶绥县', '3', '0');
INSERT INTO `mall_region` VALUES ('2656', '266', '宁明县', '3', '0');
INSERT INTO `mall_region` VALUES ('2657', '266', '龙州县', '3', '0');
INSERT INTO `mall_region` VALUES ('2658', '266', '大新县', '3', '0');
INSERT INTO `mall_region` VALUES ('2659', '266', '天等县', '3', '0');
INSERT INTO `mall_region` VALUES ('2660', '266', '凭祥市', '3', '0');
INSERT INTO `mall_region` VALUES ('2661', '266', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2662', '267', '秀英区', '3', '0');
INSERT INTO `mall_region` VALUES ('2663', '267', '龙华区', '3', '0');
INSERT INTO `mall_region` VALUES ('2664', '267', '琼山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2665', '267', '美兰区', '3', '0');
INSERT INTO `mall_region` VALUES ('2666', '267', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2667', '269', '西沙群岛', '3', '0');
INSERT INTO `mall_region` VALUES ('2668', '269', '南沙群岛', '3', '0');
INSERT INTO `mall_region` VALUES ('2669', '269', '中沙群岛的岛礁及其海域', '3', '0');
INSERT INTO `mall_region` VALUES ('2670', '189', '高新区', '3', '0');
INSERT INTO `mall_region` VALUES ('2671', '189', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2672', '270', '万州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2673', '270', '涪陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2674', '270', '渝中区', '3', '0');
INSERT INTO `mall_region` VALUES ('2675', '270', '大渡口区', '3', '0');
INSERT INTO `mall_region` VALUES ('2676', '270', '江北区', '3', '0');
INSERT INTO `mall_region` VALUES ('2677', '270', '沙坪坝区', '3', '0');
INSERT INTO `mall_region` VALUES ('2678', '270', '九龙坡区', '3', '0');
INSERT INTO `mall_region` VALUES ('2679', '270', '南岸区', '3', '0');
INSERT INTO `mall_region` VALUES ('2680', '270', '北碚区', '3', '0');
INSERT INTO `mall_region` VALUES ('2681', '270', '万盛区', '3', '0');
INSERT INTO `mall_region` VALUES ('2682', '270', '双桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('2683', '270', '渝北区', '3', '0');
INSERT INTO `mall_region` VALUES ('2684', '270', '巴南区', '3', '0');
INSERT INTO `mall_region` VALUES ('2685', '270', '黔江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2686', '270', '长寿区', '3', '0');
INSERT INTO `mall_region` VALUES ('2687', '270', '綦江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2688', '270', '潼南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2689', '270', '铜梁区', '3', '0');
INSERT INTO `mall_region` VALUES ('2690', '270', '大足区', '3', '0');
INSERT INTO `mall_region` VALUES ('2691', '270', '荣昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('2692', '270', '璧山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2693', '270', '梁平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2694', '270', '城口县', '3', '0');
INSERT INTO `mall_region` VALUES ('2695', '270', '丰都县', '3', '0');
INSERT INTO `mall_region` VALUES ('2696', '270', '垫江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2697', '270', '武隆县', '3', '0');
INSERT INTO `mall_region` VALUES ('2698', '270', '忠县', '3', '0');
INSERT INTO `mall_region` VALUES ('2699', '270', '开县', '3', '0');
INSERT INTO `mall_region` VALUES ('2700', '270', '云阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2701', '270', '奉节县', '3', '0');
INSERT INTO `mall_region` VALUES ('2702', '270', '巫山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2703', '270', '巫溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2704', '270', '石柱土家族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2705', '270', '秀山土家族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2706', '270', '酉阳土家族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2707', '270', '彭水苗族土家族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2708', '270', '江津区', '3', '0');
INSERT INTO `mall_region` VALUES ('2709', '270', '合川区', '3', '0');
INSERT INTO `mall_region` VALUES ('2710', '270', '永川区', '3', '0');
INSERT INTO `mall_region` VALUES ('2711', '270', '南川区', '3', '0');
INSERT INTO `mall_region` VALUES ('2712', '270', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2713', '271', '锦江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2714', '271', '青羊区', '3', '0');
INSERT INTO `mall_region` VALUES ('2715', '271', '金牛区', '3', '0');
INSERT INTO `mall_region` VALUES ('2716', '271', '武侯区', '3', '0');
INSERT INTO `mall_region` VALUES ('2717', '271', '成华区', '3', '0');
INSERT INTO `mall_region` VALUES ('2718', '271', '龙泉驿区', '3', '0');
INSERT INTO `mall_region` VALUES ('2719', '271', '青白江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2720', '271', '新都区', '3', '0');
INSERT INTO `mall_region` VALUES ('2721', '271', '温江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2722', '271', '金堂县', '3', '0');
INSERT INTO `mall_region` VALUES ('2723', '271', '双流县', '3', '0');
INSERT INTO `mall_region` VALUES ('2724', '271', '郫县', '3', '0');
INSERT INTO `mall_region` VALUES ('2725', '271', '大邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('2726', '271', '蒲江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2727', '271', '新津县', '3', '0');
INSERT INTO `mall_region` VALUES ('2728', '271', '都江堰市', '3', '0');
INSERT INTO `mall_region` VALUES ('2729', '271', '彭州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2730', '271', '邛崃市', '3', '0');
INSERT INTO `mall_region` VALUES ('2731', '271', '崇州市', '3', '0');
INSERT INTO `mall_region` VALUES ('2732', '271', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2733', '272', '自流井区', '3', '0');
INSERT INTO `mall_region` VALUES ('2734', '272', '贡井区', '3', '0');
INSERT INTO `mall_region` VALUES ('2735', '272', '大安区', '3', '0');
INSERT INTO `mall_region` VALUES ('2736', '272', '沿滩区', '3', '0');
INSERT INTO `mall_region` VALUES ('2737', '272', '荣县', '3', '0');
INSERT INTO `mall_region` VALUES ('2738', '272', '富顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('2739', '272', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2740', '273', '东区', '3', '0');
INSERT INTO `mall_region` VALUES ('2741', '273', '西区', '3', '0');
INSERT INTO `mall_region` VALUES ('2742', '273', '仁和区', '3', '0');
INSERT INTO `mall_region` VALUES ('2743', '273', '米易县', '3', '0');
INSERT INTO `mall_region` VALUES ('2744', '273', '盐边县', '3', '0');
INSERT INTO `mall_region` VALUES ('2745', '273', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2746', '274', '江阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2747', '274', '纳溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('2748', '274', '龙马潭区', '3', '0');
INSERT INTO `mall_region` VALUES ('2749', '274', '泸县', '3', '0');
INSERT INTO `mall_region` VALUES ('2750', '274', '合江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2751', '274', '叙永县', '3', '0');
INSERT INTO `mall_region` VALUES ('2752', '274', '古蔺县', '3', '0');
INSERT INTO `mall_region` VALUES ('2753', '274', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2754', '275', '旌阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2755', '275', '中江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2756', '275', '罗江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2757', '275', '广汉市', '3', '0');
INSERT INTO `mall_region` VALUES ('2758', '275', '什邡市', '3', '0');
INSERT INTO `mall_region` VALUES ('2759', '275', '绵竹市', '3', '0');
INSERT INTO `mall_region` VALUES ('2760', '275', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2761', '276', '涪城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2762', '276', '游仙区', '3', '0');
INSERT INTO `mall_region` VALUES ('2763', '276', '三台县', '3', '0');
INSERT INTO `mall_region` VALUES ('2764', '276', '盐亭县', '3', '0');
INSERT INTO `mall_region` VALUES ('2765', '276', '安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2766', '276', '梓潼县', '3', '0');
INSERT INTO `mall_region` VALUES ('2767', '276', '北川羌族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2768', '276', '平武县', '3', '0');
INSERT INTO `mall_region` VALUES ('2769', '276', '高新区', '3', '0');
INSERT INTO `mall_region` VALUES ('2770', '276', '江油市', '3', '0');
INSERT INTO `mall_region` VALUES ('2771', '276', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2772', '277', '利州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2773', '277', '昭化区', '3', '0');
INSERT INTO `mall_region` VALUES ('2774', '277', '朝天区', '3', '0');
INSERT INTO `mall_region` VALUES ('2775', '277', '旺苍县', '3', '0');
INSERT INTO `mall_region` VALUES ('2776', '277', '青川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2777', '277', '剑阁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2778', '277', '苍溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2779', '277', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2780', '278', '船山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2781', '278', '安居区', '3', '0');
INSERT INTO `mall_region` VALUES ('2782', '278', '蓬溪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2783', '278', '射洪县', '3', '0');
INSERT INTO `mall_region` VALUES ('2784', '278', '大英县', '3', '0');
INSERT INTO `mall_region` VALUES ('2785', '278', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2786', '279', '市中区', '3', '0');
INSERT INTO `mall_region` VALUES ('2787', '279', '东兴区', '3', '0');
INSERT INTO `mall_region` VALUES ('2788', '279', '威远县', '3', '0');
INSERT INTO `mall_region` VALUES ('2789', '279', '资中县', '3', '0');
INSERT INTO `mall_region` VALUES ('2790', '279', '隆昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('2791', '279', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2792', '280', '市中区', '3', '0');
INSERT INTO `mall_region` VALUES ('2793', '280', '沙湾区', '3', '0');
INSERT INTO `mall_region` VALUES ('2794', '280', '五通桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('2795', '280', '金口河区', '3', '0');
INSERT INTO `mall_region` VALUES ('2796', '280', '犍为县', '3', '0');
INSERT INTO `mall_region` VALUES ('2797', '280', '井研县', '3', '0');
INSERT INTO `mall_region` VALUES ('2798', '280', '夹江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2799', '280', '沐川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2800', '280', '峨边彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2801', '280', '马边彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2802', '280', '峨眉山市', '3', '0');
INSERT INTO `mall_region` VALUES ('2803', '280', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2804', '281', '顺庆区', '3', '0');
INSERT INTO `mall_region` VALUES ('2805', '281', '高坪区', '3', '0');
INSERT INTO `mall_region` VALUES ('2806', '281', '嘉陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('2807', '281', '南部县', '3', '0');
INSERT INTO `mall_region` VALUES ('2808', '281', '营山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2809', '281', '蓬安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2810', '281', '仪陇县', '3', '0');
INSERT INTO `mall_region` VALUES ('2811', '281', '西充县', '3', '0');
INSERT INTO `mall_region` VALUES ('2812', '281', '阆中市', '3', '0');
INSERT INTO `mall_region` VALUES ('2813', '281', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2814', '282', '东坡区', '3', '0');
INSERT INTO `mall_region` VALUES ('2815', '282', '仁寿县', '3', '0');
INSERT INTO `mall_region` VALUES ('2816', '282', '彭山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2817', '282', '洪雅县', '3', '0');
INSERT INTO `mall_region` VALUES ('2818', '282', '丹棱县', '3', '0');
INSERT INTO `mall_region` VALUES ('2819', '282', '青神县', '3', '0');
INSERT INTO `mall_region` VALUES ('2820', '282', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2821', '283', '翠屏区', '3', '0');
INSERT INTO `mall_region` VALUES ('2822', '283', '宜宾县', '3', '0');
INSERT INTO `mall_region` VALUES ('2823', '283', '南溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('2824', '283', '江安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2825', '283', '长宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2826', '283', '高县', '3', '0');
INSERT INTO `mall_region` VALUES ('2827', '283', '珙县', '3', '0');
INSERT INTO `mall_region` VALUES ('2828', '283', '筠连县', '3', '0');
INSERT INTO `mall_region` VALUES ('2829', '283', '兴文县', '3', '0');
INSERT INTO `mall_region` VALUES ('2830', '283', '屏山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2831', '283', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2832', '284', '广安区', '3', '0');
INSERT INTO `mall_region` VALUES ('2833', '284', '前锋区', '3', '0');
INSERT INTO `mall_region` VALUES ('2834', '284', '岳池县', '3', '0');
INSERT INTO `mall_region` VALUES ('2835', '284', '武胜县', '3', '0');
INSERT INTO `mall_region` VALUES ('2836', '284', '邻水县', '3', '0');
INSERT INTO `mall_region` VALUES ('2837', '284', '华蓥市', '3', '0');
INSERT INTO `mall_region` VALUES ('2838', '284', '市辖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2839', '284', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2840', '285', '通川区', '3', '0');
INSERT INTO `mall_region` VALUES ('2841', '285', '达川区', '3', '0');
INSERT INTO `mall_region` VALUES ('2842', '285', '宣汉县', '3', '0');
INSERT INTO `mall_region` VALUES ('2843', '285', '开江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2844', '285', '大竹县', '3', '0');
INSERT INTO `mall_region` VALUES ('2845', '285', '渠县', '3', '0');
INSERT INTO `mall_region` VALUES ('2846', '285', '万源市', '3', '0');
INSERT INTO `mall_region` VALUES ('2847', '285', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2848', '286', '雨城区', '3', '0');
INSERT INTO `mall_region` VALUES ('2849', '286', '名山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2850', '286', '荥经县', '3', '0');
INSERT INTO `mall_region` VALUES ('2851', '286', '汉源县', '3', '0');
INSERT INTO `mall_region` VALUES ('2852', '286', '石棉县', '3', '0');
INSERT INTO `mall_region` VALUES ('2853', '286', '天全县', '3', '0');
INSERT INTO `mall_region` VALUES ('2854', '286', '芦山县', '3', '0');
INSERT INTO `mall_region` VALUES ('2855', '286', '宝兴县', '3', '0');
INSERT INTO `mall_region` VALUES ('2856', '286', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2857', '287', '巴州区', '3', '0');
INSERT INTO `mall_region` VALUES ('2858', '287', '恩阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('2859', '287', '通江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2860', '287', '南江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2861', '287', '平昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('2862', '287', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2863', '288', '雁江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2864', '288', '安岳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2865', '288', '乐至县', '3', '0');
INSERT INTO `mall_region` VALUES ('2866', '288', '简阳市', '3', '0');
INSERT INTO `mall_region` VALUES ('2867', '288', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2868', '289', '汶川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2869', '289', '理县', '3', '0');
INSERT INTO `mall_region` VALUES ('2870', '289', '茂县', '3', '0');
INSERT INTO `mall_region` VALUES ('2871', '289', '松潘县', '3', '0');
INSERT INTO `mall_region` VALUES ('2872', '289', '九寨沟县', '3', '0');
INSERT INTO `mall_region` VALUES ('2873', '289', '金川县', '3', '0');
INSERT INTO `mall_region` VALUES ('2874', '289', '小金县', '3', '0');
INSERT INTO `mall_region` VALUES ('2875', '289', '黑水县', '3', '0');
INSERT INTO `mall_region` VALUES ('2876', '289', '马尔康县', '3', '0');
INSERT INTO `mall_region` VALUES ('2877', '289', '壤塘县', '3', '0');
INSERT INTO `mall_region` VALUES ('2878', '289', '阿坝县', '3', '0');
INSERT INTO `mall_region` VALUES ('2879', '289', '若尔盖县', '3', '0');
INSERT INTO `mall_region` VALUES ('2880', '289', '红原县', '3', '0');
INSERT INTO `mall_region` VALUES ('2881', '289', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2882', '290', '康定市', '3', '0');
INSERT INTO `mall_region` VALUES ('2883', '290', '泸定县', '3', '0');
INSERT INTO `mall_region` VALUES ('2884', '290', '丹巴县', '3', '0');
INSERT INTO `mall_region` VALUES ('2885', '290', '九龙县', '3', '0');
INSERT INTO `mall_region` VALUES ('2886', '290', '雅江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2887', '290', '道孚县', '3', '0');
INSERT INTO `mall_region` VALUES ('2888', '290', '炉霍县', '3', '0');
INSERT INTO `mall_region` VALUES ('2889', '290', '甘孜县', '3', '0');
INSERT INTO `mall_region` VALUES ('2890', '290', '新龙县', '3', '0');
INSERT INTO `mall_region` VALUES ('2891', '290', '德格县', '3', '0');
INSERT INTO `mall_region` VALUES ('2892', '290', '白玉县', '3', '0');
INSERT INTO `mall_region` VALUES ('2893', '290', '石渠县', '3', '0');
INSERT INTO `mall_region` VALUES ('2894', '290', '色达县', '3', '0');
INSERT INTO `mall_region` VALUES ('2895', '290', '理塘县', '3', '0');
INSERT INTO `mall_region` VALUES ('2896', '290', '巴塘县', '3', '0');
INSERT INTO `mall_region` VALUES ('2897', '290', '乡城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2898', '290', '稻城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2899', '290', '得荣县', '3', '0');
INSERT INTO `mall_region` VALUES ('2900', '290', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2901', '291', '西昌市', '3', '0');
INSERT INTO `mall_region` VALUES ('2902', '291', '木里藏族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2903', '291', '盐源县', '3', '0');
INSERT INTO `mall_region` VALUES ('2904', '291', '德昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('2905', '291', '会理县', '3', '0');
INSERT INTO `mall_region` VALUES ('2906', '291', '会东县', '3', '0');
INSERT INTO `mall_region` VALUES ('2907', '291', '宁南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2908', '291', '普格县', '3', '0');
INSERT INTO `mall_region` VALUES ('2909', '291', '布拖县', '3', '0');
INSERT INTO `mall_region` VALUES ('2910', '291', '金阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2911', '291', '昭觉县', '3', '0');
INSERT INTO `mall_region` VALUES ('2912', '291', '喜德县', '3', '0');
INSERT INTO `mall_region` VALUES ('2913', '291', '冕宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2914', '291', '越西县', '3', '0');
INSERT INTO `mall_region` VALUES ('2915', '291', '甘洛县', '3', '0');
INSERT INTO `mall_region` VALUES ('2916', '291', '美姑县', '3', '0');
INSERT INTO `mall_region` VALUES ('2917', '291', '雷波县', '3', '0');
INSERT INTO `mall_region` VALUES ('2918', '291', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2919', '292', '南明区', '3', '0');
INSERT INTO `mall_region` VALUES ('2920', '292', '云岩区', '3', '0');
INSERT INTO `mall_region` VALUES ('2921', '292', '花溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('2922', '292', '乌当区', '3', '0');
INSERT INTO `mall_region` VALUES ('2923', '292', '白云区', '3', '0');
INSERT INTO `mall_region` VALUES ('2924', '292', '小河区', '3', '0');
INSERT INTO `mall_region` VALUES ('2925', '292', '开阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2926', '292', '息烽县', '3', '0');
INSERT INTO `mall_region` VALUES ('2927', '292', '修文县', '3', '0');
INSERT INTO `mall_region` VALUES ('2928', '292', '观山湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('2929', '292', '清镇市', '3', '0');
INSERT INTO `mall_region` VALUES ('2930', '292', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2931', '293', '钟山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2932', '293', '六枝特区', '3', '0');
INSERT INTO `mall_region` VALUES ('2933', '293', '水城县', '3', '0');
INSERT INTO `mall_region` VALUES ('2934', '293', '盘县', '3', '0');
INSERT INTO `mall_region` VALUES ('2935', '293', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2936', '294', '红花岗区', '3', '0');
INSERT INTO `mall_region` VALUES ('2937', '294', '汇川区', '3', '0');
INSERT INTO `mall_region` VALUES ('2938', '294', '遵义县', '3', '0');
INSERT INTO `mall_region` VALUES ('2939', '294', '桐梓县', '3', '0');
INSERT INTO `mall_region` VALUES ('2940', '294', '绥阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('2941', '294', '正安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2942', '294', '道真仡佬族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2943', '294', '务川仡佬族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2944', '294', '凤冈县', '3', '0');
INSERT INTO `mall_region` VALUES ('2945', '294', '湄潭县', '3', '0');
INSERT INTO `mall_region` VALUES ('2946', '294', '余庆县', '3', '0');
INSERT INTO `mall_region` VALUES ('2947', '294', '习水县', '3', '0');
INSERT INTO `mall_region` VALUES ('2948', '294', '赤水市', '3', '0');
INSERT INTO `mall_region` VALUES ('2949', '294', '仁怀市', '3', '0');
INSERT INTO `mall_region` VALUES ('2950', '294', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2951', '295', '西秀区', '3', '0');
INSERT INTO `mall_region` VALUES ('2952', '295', '平坝区', '3', '0');
INSERT INTO `mall_region` VALUES ('2953', '295', '普定县', '3', '0');
INSERT INTO `mall_region` VALUES ('2954', '295', '镇宁布依族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2955', '295', '关岭布依族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2956', '295', '紫云苗族布依族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2957', '295', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2958', '296', '碧江区', '3', '0');
INSERT INTO `mall_region` VALUES ('2959', '296', '江口县', '3', '0');
INSERT INTO `mall_region` VALUES ('2960', '296', '玉屏侗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2961', '296', '石阡县', '3', '0');
INSERT INTO `mall_region` VALUES ('2962', '296', '思南县', '3', '0');
INSERT INTO `mall_region` VALUES ('2963', '296', '印江土家族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2964', '296', '德江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2965', '296', '沿河土家族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2966', '296', '松桃苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2967', '296', '万山区', '3', '0');
INSERT INTO `mall_region` VALUES ('2968', '296', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2969', '297', '兴义市', '3', '0');
INSERT INTO `mall_region` VALUES ('2970', '297', '兴仁县', '3', '0');
INSERT INTO `mall_region` VALUES ('2971', '297', '普安县', '3', '0');
INSERT INTO `mall_region` VALUES ('2972', '297', '晴隆县', '3', '0');
INSERT INTO `mall_region` VALUES ('2973', '297', '贞丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('2974', '297', '望谟县', '3', '0');
INSERT INTO `mall_region` VALUES ('2975', '297', '册亨县', '3', '0');
INSERT INTO `mall_region` VALUES ('2976', '297', '安龙县', '3', '0');
INSERT INTO `mall_region` VALUES ('2977', '297', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2978', '298', '七星关区', '3', '0');
INSERT INTO `mall_region` VALUES ('2979', '298', '大方县', '3', '0');
INSERT INTO `mall_region` VALUES ('2980', '298', '黔西县', '3', '0');
INSERT INTO `mall_region` VALUES ('2981', '298', '金沙县', '3', '0');
INSERT INTO `mall_region` VALUES ('2982', '298', '织金县', '3', '0');
INSERT INTO `mall_region` VALUES ('2983', '298', '纳雍县', '3', '0');
INSERT INTO `mall_region` VALUES ('2984', '298', '威宁彝族回族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('2985', '298', '赫章县', '3', '0');
INSERT INTO `mall_region` VALUES ('2986', '298', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('2987', '299', '凯里市', '3', '0');
INSERT INTO `mall_region` VALUES ('2988', '299', '黄平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2989', '299', '施秉县', '3', '0');
INSERT INTO `mall_region` VALUES ('2990', '299', '三穗县', '3', '0');
INSERT INTO `mall_region` VALUES ('2991', '299', '镇远县', '3', '0');
INSERT INTO `mall_region` VALUES ('2992', '299', '岑巩县', '3', '0');
INSERT INTO `mall_region` VALUES ('2993', '299', '天柱县', '3', '0');
INSERT INTO `mall_region` VALUES ('2994', '299', '锦屏县', '3', '0');
INSERT INTO `mall_region` VALUES ('2995', '299', '剑河县', '3', '0');
INSERT INTO `mall_region` VALUES ('2996', '299', '台江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2997', '299', '黎平县', '3', '0');
INSERT INTO `mall_region` VALUES ('2998', '299', '榕江县', '3', '0');
INSERT INTO `mall_region` VALUES ('2999', '299', '从江县', '3', '0');
INSERT INTO `mall_region` VALUES ('3000', '299', '雷山县', '3', '0');
INSERT INTO `mall_region` VALUES ('3001', '299', '麻江县', '3', '0');
INSERT INTO `mall_region` VALUES ('3002', '299', '丹寨县', '3', '0');
INSERT INTO `mall_region` VALUES ('3003', '299', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3004', '300', '都匀市', '3', '0');
INSERT INTO `mall_region` VALUES ('3005', '300', '福泉市', '3', '0');
INSERT INTO `mall_region` VALUES ('3006', '300', '荔波县', '3', '0');
INSERT INTO `mall_region` VALUES ('3007', '300', '贵定县', '3', '0');
INSERT INTO `mall_region` VALUES ('3008', '300', '瓮安县', '3', '0');
INSERT INTO `mall_region` VALUES ('3009', '300', '独山县', '3', '0');
INSERT INTO `mall_region` VALUES ('3010', '300', '平塘县', '3', '0');
INSERT INTO `mall_region` VALUES ('3011', '300', '罗甸县', '3', '0');
INSERT INTO `mall_region` VALUES ('3012', '300', '长顺县', '3', '0');
INSERT INTO `mall_region` VALUES ('3013', '300', '龙里县', '3', '0');
INSERT INTO `mall_region` VALUES ('3014', '300', '惠水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3015', '300', '三都水族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3016', '300', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3017', '301', '五华区', '3', '0');
INSERT INTO `mall_region` VALUES ('3018', '301', '盘龙区', '3', '0');
INSERT INTO `mall_region` VALUES ('3019', '301', '官渡区', '3', '0');
INSERT INTO `mall_region` VALUES ('3020', '301', '西山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3021', '301', '东川区', '3', '0');
INSERT INTO `mall_region` VALUES ('3022', '301', '呈贡区', '3', '0');
INSERT INTO `mall_region` VALUES ('3023', '301', '晋宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3024', '301', '富民县', '3', '0');
INSERT INTO `mall_region` VALUES ('3025', '301', '宜良县', '3', '0');
INSERT INTO `mall_region` VALUES ('3026', '301', '石林彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3027', '301', '嵩明县', '3', '0');
INSERT INTO `mall_region` VALUES ('3028', '301', '禄劝彝族苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3029', '301', '寻甸回族彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3030', '301', '安宁市', '3', '0');
INSERT INTO `mall_region` VALUES ('3031', '301', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3032', '302', '麒麟区', '3', '0');
INSERT INTO `mall_region` VALUES ('3033', '302', '马龙县', '3', '0');
INSERT INTO `mall_region` VALUES ('3034', '302', '陆良县', '3', '0');
INSERT INTO `mall_region` VALUES ('3035', '302', '师宗县', '3', '0');
INSERT INTO `mall_region` VALUES ('3036', '302', '罗平县', '3', '0');
INSERT INTO `mall_region` VALUES ('3037', '302', '富源县', '3', '0');
INSERT INTO `mall_region` VALUES ('3038', '302', '会泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('3039', '302', '沾益县', '3', '0');
INSERT INTO `mall_region` VALUES ('3040', '302', '宣威市', '3', '0');
INSERT INTO `mall_region` VALUES ('3041', '302', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3042', '303', '红塔区', '3', '0');
INSERT INTO `mall_region` VALUES ('3043', '303', '江川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3044', '303', '澄江县', '3', '0');
INSERT INTO `mall_region` VALUES ('3045', '303', '通海县', '3', '0');
INSERT INTO `mall_region` VALUES ('3046', '303', '华宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3047', '303', '易门县', '3', '0');
INSERT INTO `mall_region` VALUES ('3048', '303', '峨山彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3049', '303', '新平彝族傣族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3050', '303', '元江哈尼族彝族傣族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3051', '303', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3052', '304', '隆阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('3053', '304', '施甸县', '3', '0');
INSERT INTO `mall_region` VALUES ('3054', '304', '腾冲县', '3', '0');
INSERT INTO `mall_region` VALUES ('3055', '304', '龙陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('3056', '304', '昌宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3057', '304', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3058', '305', '昭阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('3059', '305', '鲁甸县', '3', '0');
INSERT INTO `mall_region` VALUES ('3060', '305', '巧家县', '3', '0');
INSERT INTO `mall_region` VALUES ('3061', '305', '盐津县', '3', '0');
INSERT INTO `mall_region` VALUES ('3062', '305', '大关县', '3', '0');
INSERT INTO `mall_region` VALUES ('3063', '305', '永善县', '3', '0');
INSERT INTO `mall_region` VALUES ('3064', '305', '绥江县', '3', '0');
INSERT INTO `mall_region` VALUES ('3065', '305', '镇雄县', '3', '0');
INSERT INTO `mall_region` VALUES ('3066', '305', '彝良县', '3', '0');
INSERT INTO `mall_region` VALUES ('3067', '305', '威信县', '3', '0');
INSERT INTO `mall_region` VALUES ('3068', '305', '水富县', '3', '0');
INSERT INTO `mall_region` VALUES ('3069', '305', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3070', '306', '古城区', '3', '0');
INSERT INTO `mall_region` VALUES ('3071', '306', '玉龙纳西族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3072', '306', '永胜县', '3', '0');
INSERT INTO `mall_region` VALUES ('3073', '306', '华坪县', '3', '0');
INSERT INTO `mall_region` VALUES ('3074', '306', '宁蒗彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3075', '306', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3076', '307', '思茅区', '3', '0');
INSERT INTO `mall_region` VALUES ('3077', '307', '宁洱哈尼族彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3078', '307', '墨江哈尼族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3079', '307', '景东彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3080', '307', '景谷傣族彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3081', '307', '镇沅彝族哈尼族拉祜族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3082', '307', '江城哈尼族彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3083', '307', '孟连傣族拉祜族佤族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3084', '307', '澜沧拉祜族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3085', '307', '西盟佤族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3086', '307', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3087', '308', '临翔区', '3', '0');
INSERT INTO `mall_region` VALUES ('3088', '308', '凤庆县', '3', '0');
INSERT INTO `mall_region` VALUES ('3089', '308', '云县', '3', '0');
INSERT INTO `mall_region` VALUES ('3090', '308', '永德县', '3', '0');
INSERT INTO `mall_region` VALUES ('3091', '308', '镇康县', '3', '0');
INSERT INTO `mall_region` VALUES ('3092', '308', '双江拉祜族佤族布朗族傣族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3093', '308', '耿马傣族佤族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3094', '308', '沧源佤族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3095', '308', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3096', '309', '楚雄市', '3', '0');
INSERT INTO `mall_region` VALUES ('3097', '309', '双柏县', '3', '0');
INSERT INTO `mall_region` VALUES ('3098', '309', '牟定县', '3', '0');
INSERT INTO `mall_region` VALUES ('3099', '309', '南华县', '3', '0');
INSERT INTO `mall_region` VALUES ('3100', '309', '姚安县', '3', '0');
INSERT INTO `mall_region` VALUES ('3101', '309', '大姚县', '3', '0');
INSERT INTO `mall_region` VALUES ('3102', '309', '永仁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3103', '309', '元谋县', '3', '0');
INSERT INTO `mall_region` VALUES ('3104', '309', '武定县', '3', '0');
INSERT INTO `mall_region` VALUES ('3105', '309', '禄丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3106', '309', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3107', '310', '个旧市', '3', '0');
INSERT INTO `mall_region` VALUES ('3108', '310', '开远市', '3', '0');
INSERT INTO `mall_region` VALUES ('3109', '310', '蒙自市', '3', '0');
INSERT INTO `mall_region` VALUES ('3110', '310', '屏边苗族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3111', '310', '建水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3112', '310', '石屏县', '3', '0');
INSERT INTO `mall_region` VALUES ('3113', '310', '弥勒市', '3', '0');
INSERT INTO `mall_region` VALUES ('3114', '310', '泸西县', '3', '0');
INSERT INTO `mall_region` VALUES ('3115', '310', '元阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3116', '310', '红河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3117', '310', '金平苗族瑶族傣族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3118', '310', '绿春县', '3', '0');
INSERT INTO `mall_region` VALUES ('3119', '310', '河口瑶族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3120', '310', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3121', '311', '文山市', '3', '0');
INSERT INTO `mall_region` VALUES ('3122', '311', '砚山县', '3', '0');
INSERT INTO `mall_region` VALUES ('3123', '311', '西畴县', '3', '0');
INSERT INTO `mall_region` VALUES ('3124', '311', '麻栗坡县', '3', '0');
INSERT INTO `mall_region` VALUES ('3125', '311', '马关县', '3', '0');
INSERT INTO `mall_region` VALUES ('3126', '311', '丘北县', '3', '0');
INSERT INTO `mall_region` VALUES ('3127', '311', '广南县', '3', '0');
INSERT INTO `mall_region` VALUES ('3128', '311', '富宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3129', '311', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3130', '312', '景洪市', '3', '0');
INSERT INTO `mall_region` VALUES ('3131', '312', '勐海县', '3', '0');
INSERT INTO `mall_region` VALUES ('3132', '312', '勐腊县', '3', '0');
INSERT INTO `mall_region` VALUES ('3133', '312', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3134', '313', '大理市', '3', '0');
INSERT INTO `mall_region` VALUES ('3135', '313', '漾濞彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3136', '313', '祥云县', '3', '0');
INSERT INTO `mall_region` VALUES ('3137', '313', '宾川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3138', '313', '弥渡县', '3', '0');
INSERT INTO `mall_region` VALUES ('3139', '313', '南涧彝族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3140', '313', '巍山彝族回族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3141', '313', '永平县', '3', '0');
INSERT INTO `mall_region` VALUES ('3142', '313', '云龙县', '3', '0');
INSERT INTO `mall_region` VALUES ('3143', '313', '洱源县', '3', '0');
INSERT INTO `mall_region` VALUES ('3144', '313', '剑川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3145', '313', '鹤庆县', '3', '0');
INSERT INTO `mall_region` VALUES ('3146', '313', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3147', '314', '瑞丽市', '3', '0');
INSERT INTO `mall_region` VALUES ('3148', '314', '芒市', '3', '0');
INSERT INTO `mall_region` VALUES ('3149', '314', '梁河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3150', '314', '盈江县', '3', '0');
INSERT INTO `mall_region` VALUES ('3151', '314', '陇川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3152', '314', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3153', '315', '泸水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3154', '315', '福贡县', '3', '0');
INSERT INTO `mall_region` VALUES ('3155', '315', '贡山独龙族怒族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3156', '315', '兰坪白族普米族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3157', '315', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3158', '316', '香格里拉市', '3', '0');
INSERT INTO `mall_region` VALUES ('3159', '316', '德钦县', '3', '0');
INSERT INTO `mall_region` VALUES ('3160', '316', '维西傈僳族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3161', '316', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3162', '317', '城关区', '3', '0');
INSERT INTO `mall_region` VALUES ('3163', '317', '林周县', '3', '0');
INSERT INTO `mall_region` VALUES ('3164', '317', '当雄县', '3', '0');
INSERT INTO `mall_region` VALUES ('3165', '317', '尼木县', '3', '0');
INSERT INTO `mall_region` VALUES ('3166', '317', '曲水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3167', '317', '堆龙德庆县', '3', '0');
INSERT INTO `mall_region` VALUES ('3168', '317', '达孜县', '3', '0');
INSERT INTO `mall_region` VALUES ('3169', '317', '墨竹工卡县', '3', '0');
INSERT INTO `mall_region` VALUES ('3170', '317', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3171', '318', '卡若区', '3', '0');
INSERT INTO `mall_region` VALUES ('3172', '318', '江达县', '3', '0');
INSERT INTO `mall_region` VALUES ('3173', '318', '贡觉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3174', '318', '类乌齐县', '3', '0');
INSERT INTO `mall_region` VALUES ('3175', '318', '丁青县', '3', '0');
INSERT INTO `mall_region` VALUES ('3176', '318', '察雅县', '3', '0');
INSERT INTO `mall_region` VALUES ('3177', '318', '八宿县', '3', '0');
INSERT INTO `mall_region` VALUES ('3178', '318', '左贡县', '3', '0');
INSERT INTO `mall_region` VALUES ('3179', '318', '芒康县', '3', '0');
INSERT INTO `mall_region` VALUES ('3180', '318', '洛隆县', '3', '0');
INSERT INTO `mall_region` VALUES ('3181', '318', '边坝县', '3', '0');
INSERT INTO `mall_region` VALUES ('3182', '318', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3183', '319', '乃东县', '3', '0');
INSERT INTO `mall_region` VALUES ('3184', '319', '扎囊县', '3', '0');
INSERT INTO `mall_region` VALUES ('3185', '319', '贡嘎县', '3', '0');
INSERT INTO `mall_region` VALUES ('3186', '319', '桑日县', '3', '0');
INSERT INTO `mall_region` VALUES ('3187', '319', '琼结县', '3', '0');
INSERT INTO `mall_region` VALUES ('3188', '319', '曲松县', '3', '0');
INSERT INTO `mall_region` VALUES ('3189', '319', '措美县', '3', '0');
INSERT INTO `mall_region` VALUES ('3190', '319', '洛扎县', '3', '0');
INSERT INTO `mall_region` VALUES ('3191', '319', '加查县', '3', '0');
INSERT INTO `mall_region` VALUES ('3192', '319', '隆子县', '3', '0');
INSERT INTO `mall_region` VALUES ('3193', '319', '错那县', '3', '0');
INSERT INTO `mall_region` VALUES ('3194', '319', '浪卡子县', '3', '0');
INSERT INTO `mall_region` VALUES ('3195', '319', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3196', '320', '桑珠孜区', '3', '0');
INSERT INTO `mall_region` VALUES ('3197', '320', '南木林县', '3', '0');
INSERT INTO `mall_region` VALUES ('3198', '320', '江孜县', '3', '0');
INSERT INTO `mall_region` VALUES ('3199', '320', '定日县', '3', '0');
INSERT INTO `mall_region` VALUES ('3200', '320', '萨迦县', '3', '0');
INSERT INTO `mall_region` VALUES ('3201', '320', '拉孜县', '3', '0');
INSERT INTO `mall_region` VALUES ('3202', '320', '昂仁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3203', '320', '谢通门县', '3', '0');
INSERT INTO `mall_region` VALUES ('3204', '320', '白朗县', '3', '0');
INSERT INTO `mall_region` VALUES ('3205', '320', '仁布县', '3', '0');
INSERT INTO `mall_region` VALUES ('3206', '320', '康马县', '3', '0');
INSERT INTO `mall_region` VALUES ('3207', '320', '定结县', '3', '0');
INSERT INTO `mall_region` VALUES ('3208', '320', '仲巴县', '3', '0');
INSERT INTO `mall_region` VALUES ('3209', '320', '亚东县', '3', '0');
INSERT INTO `mall_region` VALUES ('3210', '320', '吉隆县', '3', '0');
INSERT INTO `mall_region` VALUES ('3211', '320', '聂拉木县', '3', '0');
INSERT INTO `mall_region` VALUES ('3212', '320', '萨嘎县', '3', '0');
INSERT INTO `mall_region` VALUES ('3213', '320', '岗巴县', '3', '0');
INSERT INTO `mall_region` VALUES ('3214', '320', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3215', '321', '那曲县', '3', '0');
INSERT INTO `mall_region` VALUES ('3216', '321', '嘉黎县', '3', '0');
INSERT INTO `mall_region` VALUES ('3217', '321', '比如县', '3', '0');
INSERT INTO `mall_region` VALUES ('3218', '321', '聂荣县', '3', '0');
INSERT INTO `mall_region` VALUES ('3219', '321', '安多县', '3', '0');
INSERT INTO `mall_region` VALUES ('3220', '321', '申扎县', '3', '0');
INSERT INTO `mall_region` VALUES ('3221', '321', '索县', '3', '0');
INSERT INTO `mall_region` VALUES ('3222', '321', '班戈县', '3', '0');
INSERT INTO `mall_region` VALUES ('3223', '321', '巴青县', '3', '0');
INSERT INTO `mall_region` VALUES ('3224', '321', '尼玛县', '3', '0');
INSERT INTO `mall_region` VALUES ('3225', '321', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3226', '321', '双湖县', '3', '0');
INSERT INTO `mall_region` VALUES ('3227', '322', '普兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3228', '322', '札达县', '3', '0');
INSERT INTO `mall_region` VALUES ('3229', '322', '噶尔县', '3', '0');
INSERT INTO `mall_region` VALUES ('3230', '322', '日土县', '3', '0');
INSERT INTO `mall_region` VALUES ('3231', '322', '革吉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3232', '322', '改则县', '3', '0');
INSERT INTO `mall_region` VALUES ('3233', '322', '措勤县', '3', '0');
INSERT INTO `mall_region` VALUES ('3234', '322', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3235', '323', '巴宜区', '3', '0');
INSERT INTO `mall_region` VALUES ('3236', '323', '工布江达县', '3', '0');
INSERT INTO `mall_region` VALUES ('3237', '323', '米林县', '3', '0');
INSERT INTO `mall_region` VALUES ('3238', '323', '墨脱县', '3', '0');
INSERT INTO `mall_region` VALUES ('3239', '323', '波密县', '3', '0');
INSERT INTO `mall_region` VALUES ('3240', '323', '察隅县', '3', '0');
INSERT INTO `mall_region` VALUES ('3241', '323', '朗县', '3', '0');
INSERT INTO `mall_region` VALUES ('3242', '323', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3243', '324', '新城区', '3', '0');
INSERT INTO `mall_region` VALUES ('3244', '324', '碑林区', '3', '0');
INSERT INTO `mall_region` VALUES ('3245', '324', '莲湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('3246', '324', '灞桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('3247', '324', '未央区', '3', '0');
INSERT INTO `mall_region` VALUES ('3248', '324', '雁塔区', '3', '0');
INSERT INTO `mall_region` VALUES ('3249', '324', '阎良区', '3', '0');
INSERT INTO `mall_region` VALUES ('3250', '324', '临潼区', '3', '0');
INSERT INTO `mall_region` VALUES ('3251', '324', '长安区', '3', '0');
INSERT INTO `mall_region` VALUES ('3252', '324', '蓝田县', '3', '0');
INSERT INTO `mall_region` VALUES ('3253', '324', '周至县', '3', '0');
INSERT INTO `mall_region` VALUES ('3254', '324', '户县', '3', '0');
INSERT INTO `mall_region` VALUES ('3255', '324', '高陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('3256', '324', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3257', '325', '王益区', '3', '0');
INSERT INTO `mall_region` VALUES ('3258', '325', '印台区', '3', '0');
INSERT INTO `mall_region` VALUES ('3259', '325', '耀州区', '3', '0');
INSERT INTO `mall_region` VALUES ('3260', '325', '宜君县', '3', '0');
INSERT INTO `mall_region` VALUES ('3261', '325', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3262', '326', '渭滨区', '3', '0');
INSERT INTO `mall_region` VALUES ('3263', '326', '金台区', '3', '0');
INSERT INTO `mall_region` VALUES ('3264', '326', '陈仓区', '3', '0');
INSERT INTO `mall_region` VALUES ('3265', '326', '凤翔县', '3', '0');
INSERT INTO `mall_region` VALUES ('3266', '326', '岐山县', '3', '0');
INSERT INTO `mall_region` VALUES ('3267', '326', '扶风县', '3', '0');
INSERT INTO `mall_region` VALUES ('3268', '326', '眉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3269', '326', '陇县', '3', '0');
INSERT INTO `mall_region` VALUES ('3270', '326', '千阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3271', '326', '麟游县', '3', '0');
INSERT INTO `mall_region` VALUES ('3272', '326', '凤县', '3', '0');
INSERT INTO `mall_region` VALUES ('3273', '326', '太白县', '3', '0');
INSERT INTO `mall_region` VALUES ('3274', '326', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3275', '327', '秦都区', '3', '0');
INSERT INTO `mall_region` VALUES ('3276', '327', '杨陵区', '3', '0');
INSERT INTO `mall_region` VALUES ('3277', '327', '渭城区', '3', '0');
INSERT INTO `mall_region` VALUES ('3278', '327', '三原县', '3', '0');
INSERT INTO `mall_region` VALUES ('3279', '327', '泾阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3280', '327', '乾县', '3', '0');
INSERT INTO `mall_region` VALUES ('3281', '327', '礼泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3282', '327', '永寿县', '3', '0');
INSERT INTO `mall_region` VALUES ('3283', '327', '彬县', '3', '0');
INSERT INTO `mall_region` VALUES ('3284', '327', '长武县', '3', '0');
INSERT INTO `mall_region` VALUES ('3285', '327', '旬邑县', '3', '0');
INSERT INTO `mall_region` VALUES ('3286', '327', '淳化县', '3', '0');
INSERT INTO `mall_region` VALUES ('3287', '327', '武功县', '3', '0');
INSERT INTO `mall_region` VALUES ('3288', '327', '兴平市', '3', '0');
INSERT INTO `mall_region` VALUES ('3289', '327', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3290', '328', '临渭区', '3', '0');
INSERT INTO `mall_region` VALUES ('3291', '328', '华县', '3', '0');
INSERT INTO `mall_region` VALUES ('3292', '328', '潼关县', '3', '0');
INSERT INTO `mall_region` VALUES ('3293', '328', '大荔县', '3', '0');
INSERT INTO `mall_region` VALUES ('3294', '328', '合阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3295', '328', '澄城县', '3', '0');
INSERT INTO `mall_region` VALUES ('3296', '328', '蒲城县', '3', '0');
INSERT INTO `mall_region` VALUES ('3297', '328', '白水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3298', '328', '富平县', '3', '0');
INSERT INTO `mall_region` VALUES ('3299', '328', '韩城市', '3', '0');
INSERT INTO `mall_region` VALUES ('3300', '328', '华阴市', '3', '0');
INSERT INTO `mall_region` VALUES ('3301', '328', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3302', '329', '宝塔区', '3', '0');
INSERT INTO `mall_region` VALUES ('3303', '329', '延长县', '3', '0');
INSERT INTO `mall_region` VALUES ('3304', '329', '延川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3305', '329', '子长县', '3', '0');
INSERT INTO `mall_region` VALUES ('3306', '329', '安塞县', '3', '0');
INSERT INTO `mall_region` VALUES ('3307', '329', '志丹县', '3', '0');
INSERT INTO `mall_region` VALUES ('3308', '329', '吴起县', '3', '0');
INSERT INTO `mall_region` VALUES ('3309', '329', '甘泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3310', '329', '富县', '3', '0');
INSERT INTO `mall_region` VALUES ('3311', '329', '洛川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3312', '329', '宜川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3313', '329', '黄龙县', '3', '0');
INSERT INTO `mall_region` VALUES ('3314', '329', '黄陵县', '3', '0');
INSERT INTO `mall_region` VALUES ('3315', '329', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3316', '330', '汉台区', '3', '0');
INSERT INTO `mall_region` VALUES ('3317', '330', '南郑县', '3', '0');
INSERT INTO `mall_region` VALUES ('3318', '330', '城固县', '3', '0');
INSERT INTO `mall_region` VALUES ('3319', '330', '洋县', '3', '0');
INSERT INTO `mall_region` VALUES ('3320', '330', '西乡县', '3', '0');
INSERT INTO `mall_region` VALUES ('3321', '330', '勉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3322', '330', '宁强县', '3', '0');
INSERT INTO `mall_region` VALUES ('3323', '330', '略阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3324', '330', '镇巴县', '3', '0');
INSERT INTO `mall_region` VALUES ('3325', '330', '留坝县', '3', '0');
INSERT INTO `mall_region` VALUES ('3326', '330', '佛坪县', '3', '0');
INSERT INTO `mall_region` VALUES ('3327', '330', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3328', '331', '榆阳区', '3', '0');
INSERT INTO `mall_region` VALUES ('3329', '331', '神木县', '3', '0');
INSERT INTO `mall_region` VALUES ('3330', '331', '府谷县', '3', '0');
INSERT INTO `mall_region` VALUES ('3331', '331', '横山县', '3', '0');
INSERT INTO `mall_region` VALUES ('3332', '331', '靖边县', '3', '0');
INSERT INTO `mall_region` VALUES ('3333', '331', '定边县', '3', '0');
INSERT INTO `mall_region` VALUES ('3334', '331', '绥德县', '3', '0');
INSERT INTO `mall_region` VALUES ('3335', '331', '米脂县', '3', '0');
INSERT INTO `mall_region` VALUES ('3336', '331', '佳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3337', '331', '吴堡县', '3', '0');
INSERT INTO `mall_region` VALUES ('3338', '331', '清涧县', '3', '0');
INSERT INTO `mall_region` VALUES ('3339', '331', '子洲县', '3', '0');
INSERT INTO `mall_region` VALUES ('3340', '331', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3341', '332', '汉滨区', '3', '0');
INSERT INTO `mall_region` VALUES ('3342', '332', '汉阴县', '3', '0');
INSERT INTO `mall_region` VALUES ('3343', '332', '石泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3344', '332', '宁陕县', '3', '0');
INSERT INTO `mall_region` VALUES ('3345', '332', '紫阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3346', '332', '岚皋县', '3', '0');
INSERT INTO `mall_region` VALUES ('3347', '332', '平利县', '3', '0');
INSERT INTO `mall_region` VALUES ('3348', '332', '镇坪县', '3', '0');
INSERT INTO `mall_region` VALUES ('3349', '332', '旬阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3350', '332', '白河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3351', '332', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3352', '333', '商州区', '3', '0');
INSERT INTO `mall_region` VALUES ('3353', '333', '洛南县', '3', '0');
INSERT INTO `mall_region` VALUES ('3354', '333', '丹凤县', '3', '0');
INSERT INTO `mall_region` VALUES ('3355', '333', '商南县', '3', '0');
INSERT INTO `mall_region` VALUES ('3356', '333', '山阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3357', '333', '镇安县', '3', '0');
INSERT INTO `mall_region` VALUES ('3358', '333', '柞水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3359', '333', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3360', '334', '城关区', '3', '0');
INSERT INTO `mall_region` VALUES ('3361', '334', '七里河区', '3', '0');
INSERT INTO `mall_region` VALUES ('3362', '334', '西固区', '3', '0');
INSERT INTO `mall_region` VALUES ('3363', '334', '安宁区', '3', '0');
INSERT INTO `mall_region` VALUES ('3364', '334', '红古区', '3', '0');
INSERT INTO `mall_region` VALUES ('3365', '334', '永登县', '3', '0');
INSERT INTO `mall_region` VALUES ('3366', '334', '皋兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3367', '334', '榆中县', '3', '0');
INSERT INTO `mall_region` VALUES ('3368', '334', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3369', '336', '金川区', '3', '0');
INSERT INTO `mall_region` VALUES ('3370', '336', '永昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('3371', '336', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3372', '337', '白银区', '3', '0');
INSERT INTO `mall_region` VALUES ('3373', '337', '平川区', '3', '0');
INSERT INTO `mall_region` VALUES ('3374', '337', '靖远县', '3', '0');
INSERT INTO `mall_region` VALUES ('3375', '337', '会宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3376', '337', '景泰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3377', '337', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3378', '338', '秦州区', '3', '0');
INSERT INTO `mall_region` VALUES ('3379', '338', '麦积区', '3', '0');
INSERT INTO `mall_region` VALUES ('3380', '338', '清水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3381', '338', '秦安县', '3', '0');
INSERT INTO `mall_region` VALUES ('3382', '338', '甘谷县', '3', '0');
INSERT INTO `mall_region` VALUES ('3383', '338', '武山县', '3', '0');
INSERT INTO `mall_region` VALUES ('3384', '338', '张家川回族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3385', '338', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3386', '339', '凉州区', '3', '0');
INSERT INTO `mall_region` VALUES ('3387', '339', '民勤县', '3', '0');
INSERT INTO `mall_region` VALUES ('3388', '339', '古浪县', '3', '0');
INSERT INTO `mall_region` VALUES ('3389', '339', '天祝藏族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3390', '339', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3391', '340', '甘州区', '3', '0');
INSERT INTO `mall_region` VALUES ('3392', '340', '肃南裕固族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3393', '340', '民乐县', '3', '0');
INSERT INTO `mall_region` VALUES ('3394', '340', '临泽县', '3', '0');
INSERT INTO `mall_region` VALUES ('3395', '340', '高台县', '3', '0');
INSERT INTO `mall_region` VALUES ('3396', '340', '山丹县', '3', '0');
INSERT INTO `mall_region` VALUES ('3397', '340', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3398', '341', '崆峒区', '3', '0');
INSERT INTO `mall_region` VALUES ('3399', '341', '泾川县', '3', '0');
INSERT INTO `mall_region` VALUES ('3400', '341', '灵台县', '3', '0');
INSERT INTO `mall_region` VALUES ('3401', '341', '崇信县', '3', '0');
INSERT INTO `mall_region` VALUES ('3402', '341', '华亭县', '3', '0');
INSERT INTO `mall_region` VALUES ('3403', '341', '庄浪县', '3', '0');
INSERT INTO `mall_region` VALUES ('3404', '341', '静宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3405', '341', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3406', '342', '肃州区', '3', '0');
INSERT INTO `mall_region` VALUES ('3407', '342', '金塔县', '3', '0');
INSERT INTO `mall_region` VALUES ('3408', '342', '瓜州县', '3', '0');
INSERT INTO `mall_region` VALUES ('3409', '342', '肃北蒙古族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3410', '342', '阿克塞哈萨克族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3411', '342', '玉门市', '3', '0');
INSERT INTO `mall_region` VALUES ('3412', '342', '敦煌市', '3', '0');
INSERT INTO `mall_region` VALUES ('3413', '342', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3414', '343', '西峰区', '3', '0');
INSERT INTO `mall_region` VALUES ('3415', '343', '庆城县', '3', '0');
INSERT INTO `mall_region` VALUES ('3416', '343', '环县', '3', '0');
INSERT INTO `mall_region` VALUES ('3417', '343', '华池县', '3', '0');
INSERT INTO `mall_region` VALUES ('3418', '343', '合水县', '3', '0');
INSERT INTO `mall_region` VALUES ('3419', '343', '正宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3420', '343', '宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3421', '343', '镇原县', '3', '0');
INSERT INTO `mall_region` VALUES ('3422', '343', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3423', '344', '安定区', '3', '0');
INSERT INTO `mall_region` VALUES ('3424', '344', '通渭县', '3', '0');
INSERT INTO `mall_region` VALUES ('3425', '344', '陇西县', '3', '0');
INSERT INTO `mall_region` VALUES ('3426', '344', '渭源县', '3', '0');
INSERT INTO `mall_region` VALUES ('3427', '344', '临洮县', '3', '0');
INSERT INTO `mall_region` VALUES ('3428', '344', '漳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3429', '344', '岷县', '3', '0');
INSERT INTO `mall_region` VALUES ('3430', '344', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3431', '345', '武都区', '3', '0');
INSERT INTO `mall_region` VALUES ('3432', '345', '成县', '3', '0');
INSERT INTO `mall_region` VALUES ('3433', '345', '文县', '3', '0');
INSERT INTO `mall_region` VALUES ('3434', '345', '宕昌县', '3', '0');
INSERT INTO `mall_region` VALUES ('3435', '345', '康县', '3', '0');
INSERT INTO `mall_region` VALUES ('3436', '345', '西和县', '3', '0');
INSERT INTO `mall_region` VALUES ('3437', '345', '礼县', '3', '0');
INSERT INTO `mall_region` VALUES ('3438', '345', '徽县', '3', '0');
INSERT INTO `mall_region` VALUES ('3439', '345', '两当县', '3', '0');
INSERT INTO `mall_region` VALUES ('3440', '345', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3441', '346', '临夏市', '3', '0');
INSERT INTO `mall_region` VALUES ('3442', '346', '临夏县', '3', '0');
INSERT INTO `mall_region` VALUES ('3443', '346', '康乐县', '3', '0');
INSERT INTO `mall_region` VALUES ('3444', '346', '永靖县', '3', '0');
INSERT INTO `mall_region` VALUES ('3445', '346', '广河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3446', '346', '和政县', '3', '0');
INSERT INTO `mall_region` VALUES ('3447', '346', '东乡族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3448', '346', '积石山保安族东乡族撒拉族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3449', '346', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3450', '347', '合作市', '3', '0');
INSERT INTO `mall_region` VALUES ('3451', '347', '临潭县', '3', '0');
INSERT INTO `mall_region` VALUES ('3452', '347', '卓尼县', '3', '0');
INSERT INTO `mall_region` VALUES ('3453', '347', '舟曲县', '3', '0');
INSERT INTO `mall_region` VALUES ('3454', '347', '迭部县', '3', '0');
INSERT INTO `mall_region` VALUES ('3455', '347', '玛曲县', '3', '0');
INSERT INTO `mall_region` VALUES ('3456', '347', '碌曲县', '3', '0');
INSERT INTO `mall_region` VALUES ('3457', '347', '夏河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3458', '347', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3459', '348', '城东区', '3', '0');
INSERT INTO `mall_region` VALUES ('3460', '348', '城中区', '3', '0');
INSERT INTO `mall_region` VALUES ('3461', '348', '城西区', '3', '0');
INSERT INTO `mall_region` VALUES ('3462', '348', '城北区', '3', '0');
INSERT INTO `mall_region` VALUES ('3463', '348', '大通回族土族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3464', '348', '湟中县', '3', '0');
INSERT INTO `mall_region` VALUES ('3465', '348', '湟源县', '3', '0');
INSERT INTO `mall_region` VALUES ('3466', '348', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3467', '349', '平安区', '3', '0');
INSERT INTO `mall_region` VALUES ('3468', '349', '民和回族土族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3469', '349', '乐都区', '3', '0');
INSERT INTO `mall_region` VALUES ('3470', '349', '互助土族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3471', '349', '化隆回族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3472', '349', '循化撒拉族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3473', '349', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3474', '350', '门源回族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3475', '350', '祁连县', '3', '0');
INSERT INTO `mall_region` VALUES ('3476', '350', '海晏县', '3', '0');
INSERT INTO `mall_region` VALUES ('3477', '350', '刚察县', '3', '0');
INSERT INTO `mall_region` VALUES ('3478', '350', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3479', '351', '同仁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3480', '351', '尖扎县', '3', '0');
INSERT INTO `mall_region` VALUES ('3481', '351', '泽库县', '3', '0');
INSERT INTO `mall_region` VALUES ('3482', '351', '河南蒙古族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3483', '351', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3484', '352', '共和县', '3', '0');
INSERT INTO `mall_region` VALUES ('3485', '352', '同德县', '3', '0');
INSERT INTO `mall_region` VALUES ('3486', '352', '贵德县', '3', '0');
INSERT INTO `mall_region` VALUES ('3487', '352', '兴海县', '3', '0');
INSERT INTO `mall_region` VALUES ('3488', '352', '贵南县', '3', '0');
INSERT INTO `mall_region` VALUES ('3489', '352', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3490', '353', '玛沁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3491', '353', '班玛县', '3', '0');
INSERT INTO `mall_region` VALUES ('3492', '353', '甘德县', '3', '0');
INSERT INTO `mall_region` VALUES ('3493', '353', '达日县', '3', '0');
INSERT INTO `mall_region` VALUES ('3494', '353', '久治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3495', '353', '玛多县', '3', '0');
INSERT INTO `mall_region` VALUES ('3496', '353', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3497', '354', '玉树市', '3', '0');
INSERT INTO `mall_region` VALUES ('3498', '354', '杂多县', '3', '0');
INSERT INTO `mall_region` VALUES ('3499', '354', '称多县', '3', '0');
INSERT INTO `mall_region` VALUES ('3500', '354', '治多县', '3', '0');
INSERT INTO `mall_region` VALUES ('3501', '354', '囊谦县', '3', '0');
INSERT INTO `mall_region` VALUES ('3502', '354', '曲麻莱县', '3', '0');
INSERT INTO `mall_region` VALUES ('3503', '354', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3504', '355', '格尔木市', '3', '0');
INSERT INTO `mall_region` VALUES ('3505', '355', '德令哈市', '3', '0');
INSERT INTO `mall_region` VALUES ('3506', '355', '乌兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3507', '355', '都兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3508', '355', '天峻县', '3', '0');
INSERT INTO `mall_region` VALUES ('3509', '355', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3510', '356', '兴庆区', '3', '0');
INSERT INTO `mall_region` VALUES ('3511', '356', '西夏区', '3', '0');
INSERT INTO `mall_region` VALUES ('3512', '356', '金凤区', '3', '0');
INSERT INTO `mall_region` VALUES ('3513', '356', '永宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3514', '356', '贺兰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3515', '356', '灵武市', '3', '0');
INSERT INTO `mall_region` VALUES ('3516', '356', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3517', '357', '大武口区', '3', '0');
INSERT INTO `mall_region` VALUES ('3518', '357', '惠农区', '3', '0');
INSERT INTO `mall_region` VALUES ('3519', '357', '平罗县', '3', '0');
INSERT INTO `mall_region` VALUES ('3520', '357', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3521', '358', '利通区', '3', '0');
INSERT INTO `mall_region` VALUES ('3522', '358', '红寺堡区', '3', '0');
INSERT INTO `mall_region` VALUES ('3523', '358', '盐池县', '3', '0');
INSERT INTO `mall_region` VALUES ('3524', '358', '同心县', '3', '0');
INSERT INTO `mall_region` VALUES ('3525', '358', '青铜峡市', '3', '0');
INSERT INTO `mall_region` VALUES ('3526', '358', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3527', '359', '原州区', '3', '0');
INSERT INTO `mall_region` VALUES ('3528', '359', '西吉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3529', '359', '隆德县', '3', '0');
INSERT INTO `mall_region` VALUES ('3530', '359', '泾源县', '3', '0');
INSERT INTO `mall_region` VALUES ('3531', '359', '彭阳县', '3', '0');
INSERT INTO `mall_region` VALUES ('3532', '359', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3533', '360', '沙坡头区', '3', '0');
INSERT INTO `mall_region` VALUES ('3534', '360', '中宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3535', '360', '海原县', '3', '0');
INSERT INTO `mall_region` VALUES ('3536', '360', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3537', '361', '天山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3538', '361', '沙依巴克区', '3', '0');
INSERT INTO `mall_region` VALUES ('3539', '361', '新市区', '3', '0');
INSERT INTO `mall_region` VALUES ('3540', '361', '水磨沟区', '3', '0');
INSERT INTO `mall_region` VALUES ('3541', '361', '头屯河区', '3', '0');
INSERT INTO `mall_region` VALUES ('3542', '361', '达坂城区', '3', '0');
INSERT INTO `mall_region` VALUES ('3543', '361', '东山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3544', '361', '米东区', '3', '0');
INSERT INTO `mall_region` VALUES ('3545', '361', '乌鲁木齐县', '3', '0');
INSERT INTO `mall_region` VALUES ('3546', '361', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3547', '362', '独山子区', '3', '0');
INSERT INTO `mall_region` VALUES ('3548', '362', '克拉玛依区', '3', '0');
INSERT INTO `mall_region` VALUES ('3549', '362', '白碱滩区', '3', '0');
INSERT INTO `mall_region` VALUES ('3550', '362', '乌尔禾区', '3', '0');
INSERT INTO `mall_region` VALUES ('3551', '362', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3552', '363', '高昌区', '3', '0');
INSERT INTO `mall_region` VALUES ('3553', '363', '鄯善县', '3', '0');
INSERT INTO `mall_region` VALUES ('3554', '363', '托克逊县', '3', '0');
INSERT INTO `mall_region` VALUES ('3555', '363', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3556', '364', '哈密市', '3', '0');
INSERT INTO `mall_region` VALUES ('3557', '364', '巴里坤哈萨克自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3558', '364', '伊吾县', '3', '0');
INSERT INTO `mall_region` VALUES ('3559', '364', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3560', '365', '昌吉市', '3', '0');
INSERT INTO `mall_region` VALUES ('3561', '365', '阜康市', '3', '0');
INSERT INTO `mall_region` VALUES ('3562', '365', '米泉市', '3', '0');
INSERT INTO `mall_region` VALUES ('3563', '365', '呼图壁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3564', '365', '玛纳斯县', '3', '0');
INSERT INTO `mall_region` VALUES ('3565', '365', '奇台县', '3', '0');
INSERT INTO `mall_region` VALUES ('3566', '365', '吉木萨尔县', '3', '0');
INSERT INTO `mall_region` VALUES ('3567', '365', '木垒哈萨克自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3568', '365', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3569', '366', '博乐市', '3', '0');
INSERT INTO `mall_region` VALUES ('3570', '366', '阿拉山口市', '3', '0');
INSERT INTO `mall_region` VALUES ('3571', '366', '精河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3572', '366', '温泉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3573', '366', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3574', '367', '库尔勒市', '3', '0');
INSERT INTO `mall_region` VALUES ('3575', '367', '轮台县', '3', '0');
INSERT INTO `mall_region` VALUES ('3576', '367', '尉犁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3577', '367', '若羌县', '3', '0');
INSERT INTO `mall_region` VALUES ('3578', '367', '且末县', '3', '0');
INSERT INTO `mall_region` VALUES ('3579', '367', '焉耆回族自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3580', '367', '和静县', '3', '0');
INSERT INTO `mall_region` VALUES ('3581', '367', '和硕县', '3', '0');
INSERT INTO `mall_region` VALUES ('3582', '367', '博湖县', '3', '0');
INSERT INTO `mall_region` VALUES ('3583', '367', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3584', '368', '阿克苏市', '3', '0');
INSERT INTO `mall_region` VALUES ('3585', '368', '温宿县', '3', '0');
INSERT INTO `mall_region` VALUES ('3586', '368', '库车县', '3', '0');
INSERT INTO `mall_region` VALUES ('3587', '368', '沙雅县', '3', '0');
INSERT INTO `mall_region` VALUES ('3588', '368', '新和县', '3', '0');
INSERT INTO `mall_region` VALUES ('3589', '368', '拜城县', '3', '0');
INSERT INTO `mall_region` VALUES ('3590', '368', '乌什县', '3', '0');
INSERT INTO `mall_region` VALUES ('3591', '368', '阿瓦提县', '3', '0');
INSERT INTO `mall_region` VALUES ('3592', '368', '柯坪县', '3', '0');
INSERT INTO `mall_region` VALUES ('3593', '368', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3594', '369', '阿图什市', '3', '0');
INSERT INTO `mall_region` VALUES ('3595', '369', '阿克陶县', '3', '0');
INSERT INTO `mall_region` VALUES ('3596', '369', '阿合奇县', '3', '0');
INSERT INTO `mall_region` VALUES ('3597', '369', '乌恰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3598', '369', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3599', '370', '喀什市', '3', '0');
INSERT INTO `mall_region` VALUES ('3600', '370', '疏附县', '3', '0');
INSERT INTO `mall_region` VALUES ('3601', '370', '疏勒县', '3', '0');
INSERT INTO `mall_region` VALUES ('3602', '370', '英吉沙县', '3', '0');
INSERT INTO `mall_region` VALUES ('3603', '370', '泽普县', '3', '0');
INSERT INTO `mall_region` VALUES ('3604', '370', '莎车县', '3', '0');
INSERT INTO `mall_region` VALUES ('3605', '370', '叶城县', '3', '0');
INSERT INTO `mall_region` VALUES ('3606', '370', '麦盖提县', '3', '0');
INSERT INTO `mall_region` VALUES ('3607', '370', '岳普湖县', '3', '0');
INSERT INTO `mall_region` VALUES ('3608', '370', '伽师县', '3', '0');
INSERT INTO `mall_region` VALUES ('3609', '370', '巴楚县', '3', '0');
INSERT INTO `mall_region` VALUES ('3610', '370', '塔什库尔干塔吉克自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3611', '370', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3612', '371', '和田市', '3', '0');
INSERT INTO `mall_region` VALUES ('3613', '371', '和田县', '3', '0');
INSERT INTO `mall_region` VALUES ('3614', '371', '墨玉县', '3', '0');
INSERT INTO `mall_region` VALUES ('3615', '371', '皮山县', '3', '0');
INSERT INTO `mall_region` VALUES ('3616', '371', '洛浦县', '3', '0');
INSERT INTO `mall_region` VALUES ('3617', '371', '策勒县', '3', '0');
INSERT INTO `mall_region` VALUES ('3618', '371', '于田县', '3', '0');
INSERT INTO `mall_region` VALUES ('3619', '371', '民丰县', '3', '0');
INSERT INTO `mall_region` VALUES ('3620', '371', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3621', '372', '伊宁市', '3', '0');
INSERT INTO `mall_region` VALUES ('3622', '372', '奎屯市', '3', '0');
INSERT INTO `mall_region` VALUES ('3623', '372', '伊宁县', '3', '0');
INSERT INTO `mall_region` VALUES ('3624', '372', '察布查尔锡伯自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3625', '372', '霍城县', '3', '0');
INSERT INTO `mall_region` VALUES ('3626', '372', '巩留县', '3', '0');
INSERT INTO `mall_region` VALUES ('3627', '372', '新源县', '3', '0');
INSERT INTO `mall_region` VALUES ('3628', '372', '昭苏县', '3', '0');
INSERT INTO `mall_region` VALUES ('3629', '372', '特克斯县', '3', '0');
INSERT INTO `mall_region` VALUES ('3630', '372', '尼勒克县', '3', '0');
INSERT INTO `mall_region` VALUES ('3631', '372', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3632', '373', '塔城市', '3', '0');
INSERT INTO `mall_region` VALUES ('3633', '373', '乌苏市', '3', '0');
INSERT INTO `mall_region` VALUES ('3634', '373', '额敏县', '3', '0');
INSERT INTO `mall_region` VALUES ('3635', '373', '沙湾县', '3', '0');
INSERT INTO `mall_region` VALUES ('3636', '373', '托里县', '3', '0');
INSERT INTO `mall_region` VALUES ('3637', '373', '裕民县', '3', '0');
INSERT INTO `mall_region` VALUES ('3638', '373', '和布克赛尔蒙古自治县', '3', '0');
INSERT INTO `mall_region` VALUES ('3639', '373', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3640', '374', '阿勒泰市', '3', '0');
INSERT INTO `mall_region` VALUES ('3641', '374', '布尔津县', '3', '0');
INSERT INTO `mall_region` VALUES ('3642', '374', '富蕴县', '3', '0');
INSERT INTO `mall_region` VALUES ('3643', '374', '福海县', '3', '0');
INSERT INTO `mall_region` VALUES ('3644', '374', '哈巴河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3645', '374', '青河县', '3', '0');
INSERT INTO `mall_region` VALUES ('3646', '374', '吉木乃县', '3', '0');
INSERT INTO `mall_region` VALUES ('3647', '374', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3648', '375', '中正区', '3', '0');
INSERT INTO `mall_region` VALUES ('3649', '375', '大同区', '3', '0');
INSERT INTO `mall_region` VALUES ('3650', '375', '中山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3651', '375', '松山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3652', '375', '大安区', '3', '0');
INSERT INTO `mall_region` VALUES ('3653', '375', '万华区', '3', '0');
INSERT INTO `mall_region` VALUES ('3654', '375', '信义区', '3', '0');
INSERT INTO `mall_region` VALUES ('3655', '375', '士林区', '3', '0');
INSERT INTO `mall_region` VALUES ('3656', '375', '北投区', '3', '0');
INSERT INTO `mall_region` VALUES ('3657', '375', '内湖区', '3', '0');
INSERT INTO `mall_region` VALUES ('3658', '375', '南港区', '3', '0');
INSERT INTO `mall_region` VALUES ('3659', '375', '文山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3660', '375', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3661', '376', '新兴区', '3', '0');
INSERT INTO `mall_region` VALUES ('3662', '376', '前金区', '3', '0');
INSERT INTO `mall_region` VALUES ('3663', '376', '芩雅区', '3', '0');
INSERT INTO `mall_region` VALUES ('3664', '376', '盐埕区', '3', '0');
INSERT INTO `mall_region` VALUES ('3665', '376', '鼓山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3666', '376', '旗津区', '3', '0');
INSERT INTO `mall_region` VALUES ('3667', '376', '前镇区', '3', '0');
INSERT INTO `mall_region` VALUES ('3668', '376', '三民区', '3', '0');
INSERT INTO `mall_region` VALUES ('3669', '376', '左营区', '3', '0');
INSERT INTO `mall_region` VALUES ('3670', '376', '楠梓区', '3', '0');
INSERT INTO `mall_region` VALUES ('3671', '376', '小港区', '3', '0');
INSERT INTO `mall_region` VALUES ('3672', '376', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3673', '376', '苓雅区', '3', '0');
INSERT INTO `mall_region` VALUES ('3674', '376', '仁武区', '3', '0');
INSERT INTO `mall_region` VALUES ('3675', '376', '大社区', '3', '0');
INSERT INTO `mall_region` VALUES ('3676', '376', '冈山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3677', '376', '路竹区', '3', '0');
INSERT INTO `mall_region` VALUES ('3678', '376', '阿莲区', '3', '0');
INSERT INTO `mall_region` VALUES ('3679', '376', '田寮区', '3', '0');
INSERT INTO `mall_region` VALUES ('3680', '376', '燕巢区', '3', '0');
INSERT INTO `mall_region` VALUES ('3681', '376', '桥头区', '3', '0');
INSERT INTO `mall_region` VALUES ('3682', '376', '梓官区', '3', '0');
INSERT INTO `mall_region` VALUES ('3683', '376', '弥陀区', '3', '0');
INSERT INTO `mall_region` VALUES ('3684', '376', '永安区', '3', '0');
INSERT INTO `mall_region` VALUES ('3685', '376', '湖内区', '3', '0');
INSERT INTO `mall_region` VALUES ('3686', '376', '凤山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3687', '376', '大寮区', '3', '0');
INSERT INTO `mall_region` VALUES ('3688', '376', '林园区', '3', '0');
INSERT INTO `mall_region` VALUES ('3689', '376', '鸟松区', '3', '0');
INSERT INTO `mall_region` VALUES ('3690', '376', '大树区', '3', '0');
INSERT INTO `mall_region` VALUES ('3691', '376', '旗山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3692', '376', '美浓区', '3', '0');
INSERT INTO `mall_region` VALUES ('3693', '376', '六龟区', '3', '0');
INSERT INTO `mall_region` VALUES ('3694', '376', '内门区', '3', '0');
INSERT INTO `mall_region` VALUES ('3695', '376', '杉林区', '3', '0');
INSERT INTO `mall_region` VALUES ('3696', '376', '甲仙区', '3', '0');
INSERT INTO `mall_region` VALUES ('3697', '376', '桃源区', '3', '0');
INSERT INTO `mall_region` VALUES ('3698', '376', '那玛夏区', '3', '0');
INSERT INTO `mall_region` VALUES ('3699', '376', '茂林区', '3', '0');
INSERT INTO `mall_region` VALUES ('3700', '376', '茄萣区', '3', '0');
INSERT INTO `mall_region` VALUES ('3701', '377', '中西区', '3', '0');
INSERT INTO `mall_region` VALUES ('3702', '377', '东区', '3', '0');
INSERT INTO `mall_region` VALUES ('3703', '377', '南区', '3', '0');
INSERT INTO `mall_region` VALUES ('3704', '377', '北区', '3', '0');
INSERT INTO `mall_region` VALUES ('3705', '377', '安平区', '3', '0');
INSERT INTO `mall_region` VALUES ('3706', '377', '安南区', '3', '0');
INSERT INTO `mall_region` VALUES ('3707', '377', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3708', '377', '永康区', '3', '0');
INSERT INTO `mall_region` VALUES ('3709', '377', '归仁区', '3', '0');
INSERT INTO `mall_region` VALUES ('3710', '377', '新化区', '3', '0');
INSERT INTO `mall_region` VALUES ('3711', '377', '左镇区', '3', '0');
INSERT INTO `mall_region` VALUES ('3712', '377', '玉井区', '3', '0');
INSERT INTO `mall_region` VALUES ('3713', '377', '楠西区', '3', '0');
INSERT INTO `mall_region` VALUES ('3714', '377', '南化区', '3', '0');
INSERT INTO `mall_region` VALUES ('3715', '377', '仁德区', '3', '0');
INSERT INTO `mall_region` VALUES ('3716', '377', '关庙区', '3', '0');
INSERT INTO `mall_region` VALUES ('3717', '377', '龙崎区', '3', '0');
INSERT INTO `mall_region` VALUES ('3718', '377', '官田区', '3', '0');
INSERT INTO `mall_region` VALUES ('3719', '377', '麻豆区', '3', '0');
INSERT INTO `mall_region` VALUES ('3720', '377', '佳里区', '3', '0');
INSERT INTO `mall_region` VALUES ('3721', '377', '西港区', '3', '0');
INSERT INTO `mall_region` VALUES ('3722', '377', '七股区', '3', '0');
INSERT INTO `mall_region` VALUES ('3723', '377', '将军区', '3', '0');
INSERT INTO `mall_region` VALUES ('3724', '377', '学甲区', '3', '0');
INSERT INTO `mall_region` VALUES ('3725', '377', '北门区', '3', '0');
INSERT INTO `mall_region` VALUES ('3726', '377', '新营区', '3', '0');
INSERT INTO `mall_region` VALUES ('3727', '377', '后壁区', '3', '0');
INSERT INTO `mall_region` VALUES ('3728', '377', '白河区', '3', '0');
INSERT INTO `mall_region` VALUES ('3729', '377', '东山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3730', '377', '六甲区', '3', '0');
INSERT INTO `mall_region` VALUES ('3731', '377', '下营区', '3', '0');
INSERT INTO `mall_region` VALUES ('3732', '377', '柳营区', '3', '0');
INSERT INTO `mall_region` VALUES ('3733', '377', '盐水区', '3', '0');
INSERT INTO `mall_region` VALUES ('3734', '377', '善化区', '3', '0');
INSERT INTO `mall_region` VALUES ('3735', '377', '大内区', '3', '0');
INSERT INTO `mall_region` VALUES ('3736', '377', '山上区', '3', '0');
INSERT INTO `mall_region` VALUES ('3737', '377', '新市区', '3', '0');
INSERT INTO `mall_region` VALUES ('3738', '377', '安定区', '3', '0');
INSERT INTO `mall_region` VALUES ('3739', '378', '中区', '3', '0');
INSERT INTO `mall_region` VALUES ('3740', '378', '东区', '3', '0');
INSERT INTO `mall_region` VALUES ('3741', '378', '南区', '3', '0');
INSERT INTO `mall_region` VALUES ('3742', '378', '西区', '3', '0');
INSERT INTO `mall_region` VALUES ('3743', '378', '北区', '3', '0');
INSERT INTO `mall_region` VALUES ('3744', '378', '北屯区', '3', '0');
INSERT INTO `mall_region` VALUES ('3745', '378', '西屯区', '3', '0');
INSERT INTO `mall_region` VALUES ('3746', '378', '南屯区', '3', '0');
INSERT INTO `mall_region` VALUES ('3747', '378', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3748', '378', '太平区', '3', '0');
INSERT INTO `mall_region` VALUES ('3749', '378', '大里区', '3', '0');
INSERT INTO `mall_region` VALUES ('3750', '378', '雾峰区', '3', '0');
INSERT INTO `mall_region` VALUES ('3751', '378', '乌日区', '3', '0');
INSERT INTO `mall_region` VALUES ('3752', '378', '丰原区', '3', '0');
INSERT INTO `mall_region` VALUES ('3753', '378', '后里区', '3', '0');
INSERT INTO `mall_region` VALUES ('3754', '378', '石冈区', '3', '0');
INSERT INTO `mall_region` VALUES ('3755', '378', '东势区', '3', '0');
INSERT INTO `mall_region` VALUES ('3756', '378', '和平区', '3', '0');
INSERT INTO `mall_region` VALUES ('3757', '378', '新社区', '3', '0');
INSERT INTO `mall_region` VALUES ('3758', '378', '潭子区', '3', '0');
INSERT INTO `mall_region` VALUES ('3759', '378', '大雅区', '3', '0');
INSERT INTO `mall_region` VALUES ('3760', '378', '神冈区', '3', '0');
INSERT INTO `mall_region` VALUES ('3761', '378', '大肚区', '3', '0');
INSERT INTO `mall_region` VALUES ('3762', '378', '沙鹿区', '3', '0');
INSERT INTO `mall_region` VALUES ('3763', '378', '龙井区', '3', '0');
INSERT INTO `mall_region` VALUES ('3764', '378', '梧栖区', '3', '0');
INSERT INTO `mall_region` VALUES ('3765', '378', '清水区', '3', '0');
INSERT INTO `mall_region` VALUES ('3766', '378', '大甲区', '3', '0');
INSERT INTO `mall_region` VALUES ('3767', '378', '外埔区', '3', '0');
INSERT INTO `mall_region` VALUES ('3768', '378', '大安区', '3', '0');
INSERT INTO `mall_region` VALUES ('3769', '379', '金沙镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3770', '379', '金湖镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3771', '379', '金宁乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3772', '379', '金城镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3773', '379', '烈屿乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3774', '379', '乌坵乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3775', '380', '南投市', '3', '0');
INSERT INTO `mall_region` VALUES ('3776', '380', '中寮乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3777', '380', '草屯镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3778', '380', '国姓乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3779', '380', '埔里镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3780', '380', '仁爱乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3781', '380', '名间乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3782', '380', '集集镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3783', '380', '水里乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3784', '380', '鱼池乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3785', '380', '信义乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3786', '380', '竹山镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3787', '380', '鹿谷乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3788', '381', '仁爱区', '3', '0');
INSERT INTO `mall_region` VALUES ('3789', '381', '信义区', '3', '0');
INSERT INTO `mall_region` VALUES ('3790', '381', '中正区', '3', '0');
INSERT INTO `mall_region` VALUES ('3791', '381', '中山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3792', '381', '安乐区', '3', '0');
INSERT INTO `mall_region` VALUES ('3793', '381', '暖暖区', '3', '0');
INSERT INTO `mall_region` VALUES ('3794', '381', '七堵区', '3', '0');
INSERT INTO `mall_region` VALUES ('3795', '381', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3796', '382', '东区', '3', '0');
INSERT INTO `mall_region` VALUES ('3797', '382', '北区', '3', '0');
INSERT INTO `mall_region` VALUES ('3798', '382', '香山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3799', '382', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3800', '383', '东区', '3', '0');
INSERT INTO `mall_region` VALUES ('3801', '383', '西区', '3', '0');
INSERT INTO `mall_region` VALUES ('3802', '383', '其它区', '3', '0');
INSERT INTO `mall_region` VALUES ('3803', '384', '万里区', '3', '0');
INSERT INTO `mall_region` VALUES ('3804', '384', '金山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3805', '384', '板桥区', '3', '0');
INSERT INTO `mall_region` VALUES ('3806', '384', '汐止区', '3', '0');
INSERT INTO `mall_region` VALUES ('3807', '384', '深坑区', '3', '0');
INSERT INTO `mall_region` VALUES ('3808', '384', '石碇区', '3', '0');
INSERT INTO `mall_region` VALUES ('3809', '384', '瑞芳区', '3', '0');
INSERT INTO `mall_region` VALUES ('3810', '384', '平溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('3811', '384', '双溪区', '3', '0');
INSERT INTO `mall_region` VALUES ('3812', '384', '贡寮区', '3', '0');
INSERT INTO `mall_region` VALUES ('3813', '384', '新店区', '3', '0');
INSERT INTO `mall_region` VALUES ('3814', '384', '坪林区', '3', '0');
INSERT INTO `mall_region` VALUES ('3815', '384', '乌来区', '3', '0');
INSERT INTO `mall_region` VALUES ('3816', '384', '永和区', '3', '0');
INSERT INTO `mall_region` VALUES ('3817', '384', '中和区', '3', '0');
INSERT INTO `mall_region` VALUES ('3818', '384', '土城区', '3', '0');
INSERT INTO `mall_region` VALUES ('3819', '384', '三峡区', '3', '0');
INSERT INTO `mall_region` VALUES ('3820', '384', '树林区', '3', '0');
INSERT INTO `mall_region` VALUES ('3821', '384', '莺歌区', '3', '0');
INSERT INTO `mall_region` VALUES ('3822', '384', '三重区', '3', '0');
INSERT INTO `mall_region` VALUES ('3823', '384', '新庄区', '3', '0');
INSERT INTO `mall_region` VALUES ('3824', '384', '泰山区', '3', '0');
INSERT INTO `mall_region` VALUES ('3825', '384', '林口区', '3', '0');
INSERT INTO `mall_region` VALUES ('3826', '384', '芦洲区', '3', '0');
INSERT INTO `mall_region` VALUES ('3827', '384', '五股区', '3', '0');
INSERT INTO `mall_region` VALUES ('3828', '384', '八里区', '3', '0');
INSERT INTO `mall_region` VALUES ('3829', '384', '淡水区', '3', '0');
INSERT INTO `mall_region` VALUES ('3830', '384', '三芝区', '3', '0');
INSERT INTO `mall_region` VALUES ('3831', '384', '石门区', '3', '0');
INSERT INTO `mall_region` VALUES ('3832', '385', '宜兰市', '3', '0');
INSERT INTO `mall_region` VALUES ('3833', '385', '头城镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3834', '385', '礁溪乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3835', '385', '壮围乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3836', '385', '员山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3837', '385', '罗东镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3838', '385', '三星乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3839', '385', '大同乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3840', '385', '五结乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3841', '385', '冬山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3842', '385', '苏澳镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3843', '385', '南澳乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3844', '385', '钓鱼台', '3', '0');
INSERT INTO `mall_region` VALUES ('3845', '386', '竹北市', '3', '0');
INSERT INTO `mall_region` VALUES ('3846', '386', '湖口乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3847', '386', '新丰乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3848', '386', '新埔镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3849', '386', '关西镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3850', '386', '芎林乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3851', '386', '宝山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3852', '386', '竹东镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3853', '386', '五峰乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3854', '386', '横山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3855', '386', '尖石乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3856', '386', '北埔乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3857', '386', '峨眉乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3858', '387', '中坜市', '3', '0');
INSERT INTO `mall_region` VALUES ('3859', '387', '平镇市', '3', '0');
INSERT INTO `mall_region` VALUES ('3860', '387', '龙潭乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3861', '387', '杨梅市', '3', '0');
INSERT INTO `mall_region` VALUES ('3862', '387', '新屋乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3863', '387', '观音乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3864', '387', '桃园市', '3', '0');
INSERT INTO `mall_region` VALUES ('3865', '387', '龟山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3866', '387', '八德市', '3', '0');
INSERT INTO `mall_region` VALUES ('3867', '387', '大溪镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3868', '387', '复兴乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3869', '387', '大园乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3870', '387', '芦竹乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3871', '388', '竹南镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3872', '388', '头份镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3873', '388', '三湾乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3874', '388', '南庄乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3875', '388', '狮潭乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3876', '388', '后龙镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3877', '388', '通霄镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3878', '388', '苑里镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3879', '388', '苗栗市', '3', '0');
INSERT INTO `mall_region` VALUES ('3880', '388', '造桥乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3881', '388', '头屋乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3882', '388', '公馆乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3883', '388', '大湖乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3884', '388', '泰安乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3885', '388', '铜锣乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3886', '388', '三义乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3887', '388', '西湖乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3888', '388', '卓兰镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3889', '389', '彰化市', '3', '0');
INSERT INTO `mall_region` VALUES ('3890', '389', '芬园乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3891', '389', '花坛乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3892', '389', '秀水乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3893', '389', '鹿港镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3894', '389', '福兴乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3895', '389', '线西乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3896', '389', '和美镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3897', '389', '伸港乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3898', '389', '员林镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3899', '389', '社头乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3900', '389', '永靖乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3901', '389', '埔心乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3902', '389', '溪湖镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3903', '389', '大村乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3904', '389', '埔盐乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3905', '389', '田中镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3906', '389', '北斗镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3907', '389', '田尾乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3908', '389', '埤头乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3909', '389', '溪州乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3910', '389', '竹塘乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3911', '389', '二林镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3912', '389', '大城乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3913', '389', '芳苑乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3914', '389', '二水乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3915', '390', '番路乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3916', '390', '梅山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3917', '390', '竹崎乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3918', '390', '阿里山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3919', '390', '中埔乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3920', '390', '大埔乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3921', '390', '水上乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3922', '390', '鹿草乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3923', '390', '太保市', '3', '0');
INSERT INTO `mall_region` VALUES ('3924', '390', '朴子市', '3', '0');
INSERT INTO `mall_region` VALUES ('3925', '390', '东石乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3926', '390', '六脚乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3927', '390', '新港乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3928', '390', '民雄乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3929', '390', '大林镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3930', '390', '溪口乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3931', '390', '义竹乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3932', '390', '布袋镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3933', '391', '斗南镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3934', '391', '大埤乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3935', '391', '虎尾镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3936', '391', '土库镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3937', '391', '褒忠乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3938', '391', '东势乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3939', '391', '台西乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3940', '391', '仑背乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3941', '391', '麦寮乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3942', '391', '斗六市', '3', '0');
INSERT INTO `mall_region` VALUES ('3943', '391', '林内乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3944', '391', '古坑乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3945', '391', '莿桐乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3946', '391', '西螺镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3947', '391', '二仑乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3948', '391', '北港镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3949', '391', '水林乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3950', '391', '口湖乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3951', '391', '四湖乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3952', '391', '元长乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3953', '392', '屏东市', '3', '0');
INSERT INTO `mall_region` VALUES ('3954', '392', '三地门乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3955', '392', '雾台乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3956', '392', '玛家乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3957', '392', '九如乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3958', '392', '里港乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3959', '392', '高树乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3960', '392', '盐埔乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3961', '392', '长治乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3962', '392', '麟洛乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3963', '392', '竹田乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3964', '392', '内埔乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3965', '392', '万丹乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3966', '392', '潮州镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3967', '392', '泰武乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3968', '392', '来义乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3969', '392', '万峦乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3970', '392', '崁顶乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3971', '392', '新埤乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3972', '392', '南州乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3973', '392', '林边乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3974', '392', '东港镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3975', '392', '琉球乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3976', '392', '佳冬乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3977', '392', '新园乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3978', '392', '枋寮乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3979', '392', '枋山乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3980', '392', '春日乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3981', '392', '狮子乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3982', '392', '车城乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3983', '392', '牡丹乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3984', '392', '恒春镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3985', '392', '满州乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3986', '393', '台东市', '3', '0');
INSERT INTO `mall_region` VALUES ('3987', '393', '绿岛乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3988', '393', '兰屿乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3989', '393', '延平乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3990', '393', '卑南乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3991', '393', '鹿野乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3992', '393', '关山镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3993', '393', '海端乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3994', '393', '池上乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3995', '393', '东河乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3996', '393', '成功镇', '3', '0');
INSERT INTO `mall_region` VALUES ('3997', '393', '长滨乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3998', '393', '金峰乡', '3', '0');
INSERT INTO `mall_region` VALUES ('3999', '393', '大武乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4000', '393', '达仁乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4001', '393', '太麻里乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4002', '394', '花莲市', '3', '0');
INSERT INTO `mall_region` VALUES ('4003', '394', '新城乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4004', '394', '太鲁阁', '3', '0');
INSERT INTO `mall_region` VALUES ('4005', '394', '秀林乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4006', '394', '吉安乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4007', '394', '寿丰乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4008', '394', '凤林镇', '3', '0');
INSERT INTO `mall_region` VALUES ('4009', '394', '光复乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4010', '394', '丰滨乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4011', '394', '瑞穗乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4012', '394', '万荣乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4013', '394', '玉里镇', '3', '0');
INSERT INTO `mall_region` VALUES ('4014', '394', '卓溪乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4015', '394', '富里乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4016', '395', '马公市', '3', '0');
INSERT INTO `mall_region` VALUES ('4017', '395', '西屿乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4018', '395', '望安乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4019', '395', '七美乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4020', '395', '白沙乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4021', '395', '湖西乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4022', '396', '南竿乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4023', '396', '北竿乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4024', '396', '莒光乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4025', '396', '东引乡', '3', '0');
INSERT INTO `mall_region` VALUES ('4026', '397', '中西区', '3', '0');
INSERT INTO `mall_region` VALUES ('4027', '397', '湾仔', '3', '0');
INSERT INTO `mall_region` VALUES ('4028', '397', '东区', '3', '0');
INSERT INTO `mall_region` VALUES ('4029', '397', '南区', '3', '0');
INSERT INTO `mall_region` VALUES ('4044', '150', '平潭县', '3', '1');

-- ----------------------------
-- Table structure for mall_related_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_related_goods`;
CREATE TABLE `mall_related_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品Id',
  `related_goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-商品互相推荐';

-- ----------------------------
-- Records of mall_related_goods
-- ----------------------------

-- ----------------------------
-- Table structure for mall_rider
-- ----------------------------
DROP TABLE IF EXISTS `mall_rider`;
CREATE TABLE `mall_rider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '登录名',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `idcard_pic_url` varchar(255) DEFAULT NULL COMMENT '图片',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户，nideshop_user的id',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '经度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商城-骑手';

-- ----------------------------
-- Records of mall_rider
-- ----------------------------
INSERT INTO `mall_rider` VALUES ('1', '管配送', '312', 'http://bpic.588ku.com/element_origin_min_pic/00/00/00/0056924e7539482.jpg', '1775421124', '15', null, null, null, '31.851200', '117.260610');
INSERT INTO `mall_rider` VALUES ('2', '111', '350122819455544400', null, '13960892808', '74', null, null, null, null, null);

-- ----------------------------
-- Table structure for mall_rider_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_rider_order`;
CREATE TABLE `mall_rider_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rider_id` int(11) NOT NULL COMMENT '配送员 rider表的id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `state` tinyint(255) DEFAULT NULL COMMENT '状态 1配送订单 2完成订单 3取消订单 ',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `cancel_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商城-骑手接单';

-- ----------------------------
-- Records of mall_rider_order
-- ----------------------------
INSERT INTO `mall_rider_order` VALUES ('1', '1', '2', '2', null, '2017-12-28 10:35:48', null);

-- ----------------------------
-- Table structure for mall_rider_recruit
-- ----------------------------
DROP TABLE IF EXISTS `mall_rider_recruit`;
CREATE TABLE `mall_rider_recruit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '招聘大图',
  `link_man` varchar(50) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `link_mobile` varchar(20) DEFAULT NULL COMMENT '移动电话',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `description` varchar(255) DEFAULT NULL COMMENT '招聘说明',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商城-骑手招聘信息设置';

-- ----------------------------
-- Records of mall_rider_recruit
-- ----------------------------
INSERT INTO `mall_rider_recruit` VALUES ('1', 'http://image.meiping123.com/upload/20171216/210122251bf29c.JPG', '小程序商城', '0514-0124147', '12345678911', '黄埔大撒哈65号3楼', '欢迎你dear', '1', '2017-12-15 14:03:13');

-- ----------------------------
-- Table structure for mall_search_history
-- ----------------------------
DROP TABLE IF EXISTS `mall_search_history`;
CREATE TABLE `mall_search_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` char(50) NOT NULL COMMENT '关键字',
  `from` varchar(45) DEFAULT '' COMMENT '搜索来源，如PC、小程序、APP等',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '搜索时间',
  `user_id` varchar(45) DEFAULT NULL COMMENT '会员Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COMMENT='商城-搜索历史';

-- ----------------------------
-- Records of mall_search_history
-- ----------------------------
INSERT INTO `mall_search_history` VALUES ('23', '母亲节', '', '1500564813', '1');
INSERT INTO `mall_search_history` VALUES ('24', '日式', '', '1500564816', '1');
INSERT INTO `mall_search_history` VALUES ('25', '日式', '', '1500564822', '1');
INSERT INTO `mall_search_history` VALUES ('26', '清新', '', '1500564835', '1');
INSERT INTO `mall_search_history` VALUES ('27', '日式', '', '1500638161', '1');
INSERT INTO `mall_search_history` VALUES ('46', '母亲', '', '1505797824', '');
INSERT INTO `mall_search_history` VALUES ('47', '123', '', '1507041253', '');
INSERT INTO `mall_search_history` VALUES ('48', '衣服', '', '1509416763', '');
INSERT INTO `mall_search_history` VALUES ('49', '魔兽', '', '1509675578', '');
INSERT INTO `mall_search_history` VALUES ('50', '魔兽', '', '1509675638', '');
INSERT INTO `mall_search_history` VALUES ('51', '魔兽', '', '1509675976', '');
INSERT INTO `mall_search_history` VALUES ('52', '魔兽', '', '1509675982', '');
INSERT INTO `mall_search_history` VALUES ('53', '魔兽', '', '1509675984', '');
INSERT INTO `mall_search_history` VALUES ('54', '魔兽', '', '1509675985', '');
INSERT INTO `mall_search_history` VALUES ('55', '魔兽', '', '1509675987', '');
INSERT INTO `mall_search_history` VALUES ('56', '魔兽', '', '1509675989', '');
INSERT INTO `mall_search_history` VALUES ('57', '魔兽', '', '1509675991', '');
INSERT INTO `mall_search_history` VALUES ('58', '魔兽', '', '1509675994', '');
INSERT INTO `mall_search_history` VALUES ('59', '魔兽', '', '1509676037', '');
INSERT INTO `mall_search_history` VALUES ('60', '魔兽', '', '1509676081', '');
INSERT INTO `mall_search_history` VALUES ('61', '魔兽', '', '1509676398', '');
INSERT INTO `mall_search_history` VALUES ('62', '魔兽', '', '1509676567', '');
INSERT INTO `mall_search_history` VALUES ('63', '棉', '', '1509788259', '');
INSERT INTO `mall_search_history` VALUES ('64', '棉', '', '1509788266', '');
INSERT INTO `mall_search_history` VALUES ('65', '棉', '', '1509788267', '');
INSERT INTO `mall_search_history` VALUES ('66', '棉', '', '1509788268', '');
INSERT INTO `mall_search_history` VALUES ('67', '/pages/goods/goods?id=1152031', '', '1510453776', '');
INSERT INTO `mall_search_history` VALUES ('68', '衣', '', '1510453792', '');
INSERT INTO `mall_search_history` VALUES ('69', '衣', '', '1510453801', '');
INSERT INTO `mall_search_history` VALUES ('70', '魔兽', '', '1510581217', '');
INSERT INTO `mall_search_history` VALUES ('71', '魔兽', '', '1510581220', '');
INSERT INTO `mall_search_history` VALUES ('72', '魔兽', '', '1510581222', '');
INSERT INTO `mall_search_history` VALUES ('73', '婴儿', '', '1510929933', '');
INSERT INTO `mall_search_history` VALUES ('74', '魔兽', '', '1511439465', '');
INSERT INTO `mall_search_history` VALUES ('75', '魔兽', '', '1511439483', '');
INSERT INTO `mall_search_history` VALUES ('76', '魔兽', '', '1511439486', '');
INSERT INTO `mall_search_history` VALUES ('77', '魔兽', '', '1511439488', '');
INSERT INTO `mall_search_history` VALUES ('78', '魔兽', '', '1511439496', '');
INSERT INTO `mall_search_history` VALUES ('79', '魔兽', '', '1511439498', '');
INSERT INTO `mall_search_history` VALUES ('80', '魔兽', '', '1511439508', '');
INSERT INTO `mall_search_history` VALUES ('81', '魔兽', '', '1511439537', '');
INSERT INTO `mall_search_history` VALUES ('82', '魔兽', '', '1511447802', '');
INSERT INTO `mall_search_history` VALUES ('83', '魔兽', '', '1511447998', '');
INSERT INTO `mall_search_history` VALUES ('84', '魔兽', '', '1511448089', '');
INSERT INTO `mall_search_history` VALUES ('85', '魔兽', '', '1511448131', '');
INSERT INTO `mall_search_history` VALUES ('86', '魔兽', '', '1511453853', '');
INSERT INTO `mall_search_history` VALUES ('87', '魔兽', '', '1511453856', '');
INSERT INTO `mall_search_history` VALUES ('88', '魔兽', '', '1511453858', '');
INSERT INTO `mall_search_history` VALUES ('89', '母亲节', '', '1512007740', '');
INSERT INTO `mall_search_history` VALUES ('90', '全棉', '', '1512008591', '');
INSERT INTO `mall_search_history` VALUES ('91', '全棉', '', '1512008941', '');
INSERT INTO `mall_search_history` VALUES ('92', '苹果', '', '1512093009', '');
INSERT INTO `mall_search_history` VALUES ('93', '苹果', '', '1512093015', '');
INSERT INTO `mall_search_history` VALUES ('94', '山东', '', '1512093023', '');
INSERT INTO `mall_search_history` VALUES ('95', '母亲节', '', '1512116678', '');
INSERT INTO `mall_search_history` VALUES ('96', '母亲节', '', '1512116684', '');
INSERT INTO `mall_search_history` VALUES ('97', '母亲节', '', '1512116685', '');
INSERT INTO `mall_search_history` VALUES ('98', '母亲节', '', '1512116687', '');
INSERT INTO `mall_search_history` VALUES ('99', '红富士', '', '1512362635', '');
INSERT INTO `mall_search_history` VALUES ('100', '山东', '', '1512362656', '');
INSERT INTO `mall_search_history` VALUES ('101', '苹果', '', '1512362727', '');
INSERT INTO `mall_search_history` VALUES ('102', '苹果', '', '1512362807', '');
INSERT INTO `mall_search_history` VALUES ('103', '红富士', '', '1512700391', '');
INSERT INTO `mall_search_history` VALUES ('104', '水果', '', '1512720038', '');
INSERT INTO `mall_search_history` VALUES ('105', '衣服', '', '1512720047', '');
INSERT INTO `mall_search_history` VALUES ('106', '被子', '', '1512720057', '');
INSERT INTO `mall_search_history` VALUES ('107', '水洗', '', '1512732262', '');
INSERT INTO `mall_search_history` VALUES ('108', '水洗四件套', '', '1512732269', '');
INSERT INTO `mall_search_history` VALUES ('109', '红富士', '', '1512848123', '');
INSERT INTO `mall_search_history` VALUES ('110', '苹果', '', '1512907915', '');
INSERT INTO `mall_search_history` VALUES ('111', '红富士', '', '1512907937', '');
INSERT INTO `mall_search_history` VALUES ('112', '德芙', '', '1514367361', '');
INSERT INTO `mall_search_history` VALUES ('113', '德芙', '', '1514367417', '');
INSERT INTO `mall_search_history` VALUES ('114', '德芙', '', '1514367637', '');
INSERT INTO `mall_search_history` VALUES ('115', '蓝月', '', '1514367868', '');
INSERT INTO `mall_search_history` VALUES ('116', '蓝月', '', '1514368005', '');
INSERT INTO `mall_search_history` VALUES ('117', '德芙', '', '1514374287', '');
INSERT INTO `mall_search_history` VALUES ('118', '蓝月亮', '', '1514434882', '');
INSERT INTO `mall_search_history` VALUES ('119', 'ddd', '', '1515033122', '');
INSERT INTO `mall_search_history` VALUES ('120', '水果', '', '1515738918', '');
INSERT INTO `mall_search_history` VALUES ('121', '魔兽', '', '1515738990', '');
INSERT INTO `mall_search_history` VALUES ('122', '油', '', '1516264962', '');
INSERT INTO `mall_search_history` VALUES ('123', '水果', '', '1516326955', '');
INSERT INTO `mall_search_history` VALUES ('124', '鱼', '', '1516327102', '');
INSERT INTO `mall_search_history` VALUES ('125', '锅', '', '1516330769', '');
INSERT INTO `mall_search_history` VALUES ('126', '德芙', '', '1516778210', '');
INSERT INTO `mall_search_history` VALUES ('127', '油', '', '1517566890', '');
INSERT INTO `mall_search_history` VALUES ('128', '苹果', '', '1518072038', '');
INSERT INTO `mall_search_history` VALUES ('129', '苹果', '', '1518072043', '');
INSERT INTO `mall_search_history` VALUES ('130', '母亲', '', '1520411742', '');
INSERT INTO `mall_search_history` VALUES ('131', '奶', '', '1523848563', '');
INSERT INTO `mall_search_history` VALUES ('132', 'ééè', '', '1524028251', '');
INSERT INTO `mall_search_history` VALUES ('133', 'ééè', '', '1524028254', '');
INSERT INTO `mall_search_history` VALUES ('134', 'ç½ééè', '', '1524028263', '');
INSERT INTO `mall_search_history` VALUES ('135', 'ç½', '', '1524028266', '');
INSERT INTO `mall_search_history` VALUES ('136', 'ç½ééè çº¦250gÂ±10g/ä»½', '', '1524028275', '');
INSERT INTO `mall_search_history` VALUES ('137', 'ç½', '', '1524028608', '');
INSERT INTO `mall_search_history` VALUES ('138', 'ç½ééè', '', '1524028630', '');
INSERT INTO `mall_search_history` VALUES ('139', 'ç½ééè çº¦250gÂ±10g/ä»½', '', '1524028670', '');
INSERT INTO `mall_search_history` VALUES ('140', 'ç½ééè çº¦250gÂ±10g/ä»½', '', '1524028684', '');
INSERT INTO `mall_search_history` VALUES ('141', 'ç½éé', '', '1524028689', '');
INSERT INTO `mall_search_history` VALUES ('142', 'ç½', '', '1524028691', '');
INSERT INTO `mall_search_history` VALUES ('143', 'ç½ééè', '', '1524028722', '');
INSERT INTO `mall_search_history` VALUES ('144', 'ç½ééè çº¦250gÂ±10g/ä»½', '', '1524028793', '');
INSERT INTO `mall_search_history` VALUES ('145', 'ç½ééè', '', '1524028797', '');
INSERT INTO `mall_search_history` VALUES ('146', 'ç½ééè çº¦250gÂ±10g/ä»½', '', '1524028800', '');
INSERT INTO `mall_search_history` VALUES ('147', 'ç½ééè', '', '1524034959', '');
INSERT INTO `mall_search_history` VALUES ('148', 'ç½éé', '', '1524035017', '');
INSERT INTO `mall_search_history` VALUES ('149', '白金针菇', '', '1524043951', '');
INSERT INTO `mall_search_history` VALUES ('150', '白', '', '1524044625', '');
INSERT INTO `mall_search_history` VALUES ('151', '白', '', '1524046639', '');
INSERT INTO `mall_search_history` VALUES ('152', '德芙', '', '1524462329', '');

-- ----------------------------
-- Table structure for mall_shipping
-- ----------------------------
DROP TABLE IF EXISTS `mall_shipping`;
CREATE TABLE `mall_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='商城-快递公司';

-- ----------------------------
-- Records of mall_shipping
-- ----------------------------
INSERT INTO `mall_shipping` VALUES ('1', 'AJ', '安捷快递', '1');
INSERT INTO `mall_shipping` VALUES ('2', 'ANE', '安能物流', '1');
INSERT INTO `mall_shipping` VALUES ('3', 'AXD', '安信达快递', '1');
INSERT INTO `mall_shipping` VALUES ('4', 'BQXHM', '北青小红帽', '1');
INSERT INTO `mall_shipping` VALUES ('5', 'BFDF', '百福东方', '1');
INSERT INTO `mall_shipping` VALUES ('6', 'BTWL', '百世快运', '1');
INSERT INTO `mall_shipping` VALUES ('7', 'CCES', 'CCES快递', '1');
INSERT INTO `mall_shipping` VALUES ('8', 'CITY100', '城市100', '1');
INSERT INTO `mall_shipping` VALUES ('9', 'COE', 'COE东方快递', '1');
INSERT INTO `mall_shipping` VALUES ('10', 'CSCY', '长沙创一', '1');
INSERT INTO `mall_shipping` VALUES ('11', 'CDSTKY', '成都善途速运', '1');
INSERT INTO `mall_shipping` VALUES ('12', 'DBL', '德邦', '0');
INSERT INTO `mall_shipping` VALUES ('13', 'DSWL', 'D速物流', '1');
INSERT INTO `mall_shipping` VALUES ('14', 'DTWL', '大田物流', '1');
INSERT INTO `mall_shipping` VALUES ('15', 'EMS', 'EMS', '0');
INSERT INTO `mall_shipping` VALUES ('16', 'FAST', '快捷速递', '1');
INSERT INTO `mall_shipping` VALUES ('17', 'FEDEX', 'FEDEX联邦(国内件）', '1');
INSERT INTO `mall_shipping` VALUES ('18', 'FEDEX_GJ', 'FEDEX联邦(国际件）', '1');
INSERT INTO `mall_shipping` VALUES ('19', 'FKD', '飞康达', '1');
INSERT INTO `mall_shipping` VALUES ('20', 'GDEMS', '广东邮政', '1');
INSERT INTO `mall_shipping` VALUES ('21', 'GSD', '共速达', '1');
INSERT INTO `mall_shipping` VALUES ('22', 'GTO', '国通快递', '0');
INSERT INTO `mall_shipping` VALUES ('23', 'GTSD', '高铁速递', '1');
INSERT INTO `mall_shipping` VALUES ('24', 'HFWL', '汇丰物流', '0');
INSERT INTO `mall_shipping` VALUES ('25', 'HHTT', '天天快递', '0');
INSERT INTO `mall_shipping` VALUES ('26', 'HLWL', '恒路物流', '1');
INSERT INTO `mall_shipping` VALUES ('27', 'HOAU', '天地华宇', '1');
INSERT INTO `mall_shipping` VALUES ('28', 'hq568', '华强物流', '1');
INSERT INTO `mall_shipping` VALUES ('29', 'HTKY', '百世快递', '0');
INSERT INTO `mall_shipping` VALUES ('30', 'HXLWL', '华夏龙物流', '1');
INSERT INTO `mall_shipping` VALUES ('31', 'HYLSD', '好来运快递', '1');
INSERT INTO `mall_shipping` VALUES ('32', 'JGSD', '京广速递', '1');
INSERT INTO `mall_shipping` VALUES ('33', 'JIUYE', '九曳供应链', '1');
INSERT INTO `mall_shipping` VALUES ('34', 'JJKY', '佳吉快运', '1');
INSERT INTO `mall_shipping` VALUES ('35', 'JLDT', '嘉里物流', '1');
INSERT INTO `mall_shipping` VALUES ('36', 'JTKD', '捷特快递', '1');
INSERT INTO `mall_shipping` VALUES ('37', 'JXD', '急先达', '1');
INSERT INTO `mall_shipping` VALUES ('38', 'JYKD', '晋越快递', '1');
INSERT INTO `mall_shipping` VALUES ('39', 'JYM', '加运美', '1');
INSERT INTO `mall_shipping` VALUES ('40', 'JYWL', '佳怡物流', '1');
INSERT INTO `mall_shipping` VALUES ('41', 'KYWL', '跨越物流', '1');
INSERT INTO `mall_shipping` VALUES ('42', 'LB', '龙邦快递', '1');
INSERT INTO `mall_shipping` VALUES ('43', 'LHT', '联昊通速递', '1');
INSERT INTO `mall_shipping` VALUES ('44', 'MHKD', '民航快递', '1');
INSERT INTO `mall_shipping` VALUES ('45', 'MLWL', '明亮物流', '1');
INSERT INTO `mall_shipping` VALUES ('46', 'NEDA', '能达速递', '1');
INSERT INTO `mall_shipping` VALUES ('47', 'PADTF', '平安达腾飞快递', '1');
INSERT INTO `mall_shipping` VALUES ('48', 'QCKD', '全晨快递', '1');
INSERT INTO `mall_shipping` VALUES ('49', 'QFKD', '全峰快递', '1');
INSERT INTO `mall_shipping` VALUES ('50', 'QRT', '全日通快递', '1');
INSERT INTO `mall_shipping` VALUES ('51', 'RFD', '如风达', '0');
INSERT INTO `mall_shipping` VALUES ('52', 'SAD', '赛澳递', '1');
INSERT INTO `mall_shipping` VALUES ('53', 'SAWL', '圣安物流', '1');
INSERT INTO `mall_shipping` VALUES ('54', 'SBWL', '盛邦物流', '1');
INSERT INTO `mall_shipping` VALUES ('55', 'SDWL', '上大物流', '1');
INSERT INTO `mall_shipping` VALUES ('56', 'SF', '顺丰快递', '0');
INSERT INTO `mall_shipping` VALUES ('57', 'SFWL', '盛丰物流', '1');
INSERT INTO `mall_shipping` VALUES ('58', 'SHWL', '盛辉物流', '1');
INSERT INTO `mall_shipping` VALUES ('59', 'ST', '速通物流', '1');
INSERT INTO `mall_shipping` VALUES ('60', 'STO', '申通快递', '0');
INSERT INTO `mall_shipping` VALUES ('61', 'STWL', '速腾快递', '1');
INSERT INTO `mall_shipping` VALUES ('62', 'SURE', '速尔快递', '1');
INSERT INTO `mall_shipping` VALUES ('63', 'TSSTO', '唐山申通', '1');
INSERT INTO `mall_shipping` VALUES ('64', 'UAPEX', '全一快递', '1');
INSERT INTO `mall_shipping` VALUES ('65', 'UC', '优速快递', '1');
INSERT INTO `mall_shipping` VALUES ('66', 'WJWL', '万家物流', '1');
INSERT INTO `mall_shipping` VALUES ('67', 'WXWL', '万象物流', '1');
INSERT INTO `mall_shipping` VALUES ('68', 'XBWL', '新邦物流', '1');
INSERT INTO `mall_shipping` VALUES ('69', 'XFEX', '信丰快递', '1');
INSERT INTO `mall_shipping` VALUES ('70', 'XYT', '希优特', '1');
INSERT INTO `mall_shipping` VALUES ('71', 'XJ', '新杰物流', '1');
INSERT INTO `mall_shipping` VALUES ('72', 'YADEX', '源安达快递', '1');
INSERT INTO `mall_shipping` VALUES ('73', 'YCWL', '远成物流', '1');
INSERT INTO `mall_shipping` VALUES ('74', 'YD', '韵达快递', '0');
INSERT INTO `mall_shipping` VALUES ('75', 'YDH', '义达国际物流', '1');
INSERT INTO `mall_shipping` VALUES ('76', 'YFEX', '越丰物流', '1');
INSERT INTO `mall_shipping` VALUES ('77', 'YFHEX', '原飞航物流', '1');
INSERT INTO `mall_shipping` VALUES ('78', 'YFSD', '亚风快递', '1');
INSERT INTO `mall_shipping` VALUES ('79', 'YTKD', '运通快递', '1');
INSERT INTO `mall_shipping` VALUES ('80', 'YTO', '圆通速递', '0');
INSERT INTO `mall_shipping` VALUES ('81', 'YXKD', '亿翔快递', '1');
INSERT INTO `mall_shipping` VALUES ('82', 'YZPY', '邮政平邮/小包', '1');
INSERT INTO `mall_shipping` VALUES ('83', 'ZENY', '增益快递', '1');
INSERT INTO `mall_shipping` VALUES ('84', 'ZHQKD', '汇强快递', '1');
INSERT INTO `mall_shipping` VALUES ('85', 'ZJS', '宅急送', '1');
INSERT INTO `mall_shipping` VALUES ('86', 'ZTE', '众通快递', '1');
INSERT INTO `mall_shipping` VALUES ('87', 'ZTKY', '中铁快运', '1');
INSERT INTO `mall_shipping` VALUES ('88', 'ZTO', '中通速递', '0');
INSERT INTO `mall_shipping` VALUES ('89', 'ZTWL', '中铁物流', '0');
INSERT INTO `mall_shipping` VALUES ('90', 'ZYWL', '中邮物流', '0');
INSERT INTO `mall_shipping` VALUES ('91', 'AMAZON', '亚马逊物流', '0');
INSERT INTO `mall_shipping` VALUES ('92', 'SUBIDA', '速必达物流', '1');
INSERT INTO `mall_shipping` VALUES ('93', 'RFEX', '瑞丰速递', '1');
INSERT INTO `mall_shipping` VALUES ('94', 'QUICK', '快客快递', '1');
INSERT INTO `mall_shipping` VALUES ('95', 'CJKD', '城际快递', '1');
INSERT INTO `mall_shipping` VALUES ('96', 'CNPEX', 'CNPEX中邮快递', '1');
INSERT INTO `mall_shipping` VALUES ('97', 'HOTSCM', '鸿桥供应链', '1');
INSERT INTO `mall_shipping` VALUES ('98', 'HPTEX', '海派通物流公司', '1');
INSERT INTO `mall_shipping` VALUES ('99', 'AYCA', '澳邮专线', '1');
INSERT INTO `mall_shipping` VALUES ('100', 'PANEX', '泛捷快递', '1');
INSERT INTO `mall_shipping` VALUES ('101', 'PCA', 'PCA Express', '1');
INSERT INTO `mall_shipping` VALUES ('102', 'UEQ', 'UEQ Express', '1');

-- ----------------------------
-- Table structure for mall_specification
-- ----------------------------
DROP TABLE IF EXISTS `mall_specification`;
CREATE TABLE `mall_specification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '规范名称',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-规格表';

-- ----------------------------
-- Records of mall_specification
-- ----------------------------
INSERT INTO `mall_specification` VALUES ('1', '规格', '1');

-- ----------------------------
-- Table structure for mall_store
-- ----------------------------
DROP TABLE IF EXISTS `mall_store`;
CREATE TABLE `mall_store` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_name` varchar(50) DEFAULT '0' COMMENT '门店名称',
  `store_number` varchar(30) DEFAULT '' COMMENT '门店编号',
  `store_address` varchar(100) DEFAULT '' COMMENT '门店地址',
  `province_name` varchar(50) NOT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `county_name` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,6) unsigned DEFAULT '0.000000' COMMENT '纬度',
  `longitude` decimal(10,6) unsigned DEFAULT '0.000000' COMMENT '经度',
  `cover_radius` decimal(6,2) DEFAULT NULL COMMENT '配送半径（km）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商城-门店';

-- ----------------------------
-- Records of mall_store
-- ----------------------------
INSERT INTO `mall_store` VALUES ('8', '福建总店', '0000001', '福建省厦门258号', '福建省', '厦门', '思明区', '25.492209', '119.795898', '1000.00', null);

-- ----------------------------
-- Table structure for mall_template_conf
-- ----------------------------
DROP TABLE IF EXISTS `mall_template_conf`;
CREATE TABLE `mall_template_conf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_type` tinyint(4) DEFAULT NULL COMMENT '模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒 9拼团参与通知',
  `template_id` varchar(100) NOT NULL DEFAULT '' COMMENT '推送模板Id',
  `desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商城-微信模板消息日志';

-- ----------------------------
-- Records of mall_template_conf
-- ----------------------------
INSERT INTO `mall_template_conf` VALUES ('1', '1', 'wZ3amgrpmU6i4t9xob0tmOaMixej2uZaK8E5cmSx0oA', '你的商品很快就飞奔到您手上啦！');
INSERT INTO `mall_template_conf` VALUES ('2', '2', 'w1441E3DfylQ0iguqJVHGqAlT5P5t5BXkL', '商家将于两天内发货');
INSERT INTO `mall_template_conf` VALUES ('3', '3', 'OHUWz7LpjalnFTsLJQ7SFgT6qiUnSHNa_tX48HzAg-o', '你符合参团标准');
INSERT INTO `mall_template_conf` VALUES ('4', '4', 'D-moIWZckG9ExG26-pPPGOqEHWy-nlVBCJns9rHeHFI', '留给你的时间不多了，赶快拉人来拼团吧');
INSERT INTO `mall_template_conf` VALUES ('5', '5', 'IvedNi4z0MDuzcUAVmMRdYH9xhBC3SqCdZRQDLa8HVM', '你可以告知你的朋友砍价成功哟！');
INSERT INTO `mall_template_conf` VALUES ('6', '6', 'Dz5u-2p2r6_csFW_6YVT_TuY9BGkGNvkmV7zHnRTDnk', '留给你的时间不多了，快召集好友吧！');
INSERT INTO `mall_template_conf` VALUES ('8', '8', 'yvpjyBpTqBCGfNQdhmCUsIcGU_j1hkdzqZnShduimdQ', '点击反馈您的下单体验，将帮助我们更好提升服务');

-- ----------------------------
-- Table structure for mall_template_log
-- ----------------------------
DROP TABLE IF EXISTS `mall_template_log`;
CREATE TABLE `mall_template_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `template_id` varchar(32) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城-微信模板消息日志';

-- ----------------------------
-- Records of mall_template_log
-- ----------------------------

-- ----------------------------
-- Table structure for mall_topic
-- ----------------------------
DROP TABLE IF EXISTS `mall_topic`;
CREATE TABLE `mall_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '''''' COMMENT '活动主题',
  `content` text COMMENT '活动内容',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '化名',
  `item_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动条例图片',
  `subtitle` varchar(255) NOT NULL DEFAULT '''' COMMENT '子标题',
  `topic_category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动类别',
  `price_info` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '活动价格',
  `read_count` varchar(255) NOT NULL DEFAULT '0',
  `scene_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '场景图片链接',
  `topic_template_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动模板Id',
  `topic_tag_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动标签Id',
  KEY `topic_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-活动明细';

-- ----------------------------
-- Records of mall_topic
-- ----------------------------
INSERT INTO `mall_topic` VALUES ('314', '关爱他成长的每一个足迹', '<p><img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\" class=\"fr-fin\"></p>', 'https://yanxuan.nosdn.127.net/14943186689221563.png', 'https://yanxuan.nosdn.127.net/14943267735961674.jpg', '专业运动品牌同厂，毛毛虫鞋买二送一', '2', '0.00', '6.4k', 'https://yanxuan.nosdn.127.net/14943267735961674.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('313', '一次解决5个节日送礼难题', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14942967243991290.png', 'https://yanxuan.nosdn.127.net/14942996754171334.jpg', '这些就是他们想要的礼物清单', '0', '59.90', '7.8k', 'https://yanxuan.nosdn.127.net/14942996754171334.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('300', '秒杀化学洗涤剂的纯天然皂', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14939843011001088.png', 'https://yanxuan.nosdn.127.net/14939843143621089.jpg', '前段时间有朋友跟我抱怨，和婆婆住到一起才发现生活理念有太多不和。别的不提，光是洗...', '1', '0.00', '15.3k', 'https://yanxuan.nosdn.127.net/14939843143621089.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('299', '买过的人都说它是差旅神器', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14938873720850678.png', 'https://yanxuan.nosdn.127.net/14938873919030679.jpg', '许多人经历过旅途中内裤洗晾不便的烦恼，尤其与旅伴同居一室时，晾在卫生间里的内裤更...', '1', '0.00', '28.7k', 'https://yanxuan.nosdn.127.net/14938873919030679.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('295', '他们在严选遇见的新生活', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14937987677390284.png', 'https://yanxuan.nosdn.127.net/14938092956370380.jpg', '多款商品直减中，最高直减400元', '0', '35.80', '36.6k', 'https://yanxuan.nosdn.127.net/14938092956370380.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('294', '这只锅，可以从祖母用到孙辈', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14937214529340142.png', 'https://yanxuan.nosdn.127.net/14937214454750141.jpg', '买100年传世珐琅锅送迷你马卡龙色小锅', '4', '149.00', '108.1k', 'https://yanxuan.nosdn.127.net/14937214454750141.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('291', '舒适新主张', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14933596154560938.png', 'https://yanxuan.nosdn.127.net/14939496197300723.jpg', '如何挑选适合自己的好物？', '0', '29.00', '67.8k', 'https://yanxuan.nosdn.127.net/14939496197300723.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('289', '专业运动袜也可以高性价比', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14932840884890614.png', 'https://yanxuan.nosdn.127.net/14932840600970609.jpg', '越来越多运动人士意识到，运动鞋要购置好的，鞋里的运动袜也不可忽视。专业运动袜帮助...', '1', '0.00', '11.9k', 'https://yanxuan.nosdn.127.net/14932840600970609.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('287', '严选新式样板间', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14931133750100134.png', 'https://yanxuan.nosdn.127.net/14931970965550315.jpg', '一种软装一个家', '3', '29.90', '55.6k', 'https://yanxuan.nosdn.127.net/14931970965550315.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('286', '无“油”无虑的甜蜜酥脆', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14931121505610125.png', 'https://yanxuan.nosdn.127.net/14931121822100127.jpg', '大家都知道，饮食组是严选体重最重的一组，基本上每个新人都能在一个月之内迅速长胖。...', '1', '0.00', '15.6k', 'https://yanxuan.nosdn.127.net/14931121822100127.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('281', '条纹新风尚', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14926859949660827.png', 'https://yanxuan.nosdn.127.net/14926859849200826.jpg', '经典百搭，时尚线条', '3', '29.00', '76.5k', 'https://yanxuan.nosdn.127.net/14926859849200826.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('282', '成就一室笋香', '<p><img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\" class=\"fr-fin\" alt=\"title\" title=\"title\"><img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\" class=\"fr-fin\"><img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\" class=\"fr-fin\"></p>', 'https://yanxuan.nosdn.127.net/14927695155801070.png', 'https://yanxuan.nosdn.127.net/14927695046601069.jpg', '三石哥办公室常备小食推荐', '2', '12.00', '40.9k', 'https://yanxuan.nosdn.127.net/14927695046601069.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('283', '孩子成长中少不了的一双鞋', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14927748094971079.png', 'https://yanxuan.nosdn.127.net/14927748974441080.jpg', '说起毛毛虫鞋，好处实在太多了，作为一个2岁孩子的宝妈选品员，按捺不住想告诉大家，...', '1', '0.00', '42.5k', 'https://yanxuan.nosdn.127.net/14927748974441080.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('277', '治愈生活的满怀柔软', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14926748590030593.png', 'https://yanxuan.nosdn.127.net/14926737925770587.jpg', '太鼓抱枕的上架历程，是从失踪开始的。由于表面的绒感，最初它被安排在秋冬季上架。某...', '1', '0.00', '19.6k', 'https://yanxuan.nosdn.127.net/14926737925770587.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('274', '没有软木拖，怎么过夏天', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14925821004620235.png', 'https://yanxuan.nosdn.127.net/14925822213780237.jpg', '刚入四月，杭州的气温就已升高至30度。店庆时买了软木拖的用户，陆续发回评价说，很...', '1', '0.00', '46.4k', 'https://yanxuan.nosdn.127.net/14925822213780237.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('272', '料理也要精细简单', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14925201467400187.png', 'https://yanxuan.nosdn.127.net/14925200530030186.jpg', '享受天然的味道，日子每天都好新鲜', '2', '69.00', '125.6k', 'https://yanxuan.nosdn.127.net/14925200530030186.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('271', '选式新懒人', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14924199159971698.png', 'https://yanxuan.nosdn.127.net/14924199099661697.jpg', '懒出格调，懒出好生活。', '3', '15.00', '57.7k', 'https://yanxuan.nosdn.127.net/14924199099661697.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('268', '米饭好吃的秘诀：会呼吸的锅', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14920712417610604.png', 'https://yanxuan.nosdn.127.net/14920623353130483.jpg', '今年1月份，我们联系到了日本伊贺地区的长谷园，那里有着180年伊贺烧历史的窑厂。...', '1', '0.00', '33.3k', 'https://yanxuan.nosdn.127.net/14920623353130483.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('266', '一条丝巾就能提升时髦度', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14919005600900208.png', 'https://yanxuan.nosdn.127.net/14919007135160213.jpg', '不知道大家对去年G20时，严选与国礼制造商一起推出的《凤凰于飞》等几款丝巾是否还...', '1', '0.00', '35.0k', 'https://yanxuan.nosdn.127.net/14919007135160213.jpg', '0', '0');
INSERT INTO `mall_topic` VALUES ('264', '设计师们推荐的应季好物', '<img src=\"//yanxuan.nosdn.127.net/75c55a13fde5eb2bc2dd6813b4c565cc.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/e27e1de2b271a28a21c10213b9df7e95.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/9d413d1d28f753cb19096b533d53418d.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/64b0f2f350969e9818a3b6c43c217325.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/a668e6ae7f1fa45565c1eac221787570.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/0d4004e19728f2707f08f4be79bbc774.jpg\">\n    <img src=\"//yanxuan.nosdn.127.net/79ee021bbe97de7ecda691de6787241f.jpg\">', 'https://yanxuan.nosdn.127.net/14920662001560500.png', 'https://yanxuan.nosdn.127.net/14918201901050274.jpg', '原创设计春款系列上新', '0', '29.90', '77.7k', 'https://yanxuan.nosdn.127.net/14918201901050274.jpg', '0', '0');

-- ----------------------------
-- Table structure for mall_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_topic_category`;
CREATE TABLE `mall_topic_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动类别主题',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动类别图片链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商城-活动类型';

-- ----------------------------
-- Records of mall_topic_category
-- ----------------------------
INSERT INTO `mall_topic_category` VALUES ('1', '严选幕后', 'https://yanxuan.nosdn.127.net/dc1b671ad54e16339f1b26cfeec6a1ea.jpg');
INSERT INTO `mall_topic_category` VALUES ('2', '丁磊私物推荐', 'https://yanxuan.nosdn.127.net/1de4da49367dd7c01af1f7a2b23b0237.jpg');
INSERT INTO `mall_topic_category` VALUES ('3', '特色系列', 'https://yanxuan.nosdn.127.net/14939888170021096.png');
INSERT INTO `mall_topic_category` VALUES ('4', '明星商品', 'https://yanxuan.nosdn.127.net/14939888168151095.png');
INSERT INTO `mall_topic_category` VALUES ('5', '严选推荐', 'http://mp123.oss-cn-shenzhen.aliyuncs.com//upload/20170820/1553241265c59c.jpg');

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT '',
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(15) DEFAULT '',
  `user_level_id` tinyint(3) DEFAULT NULL,
  `nickname` varchar(60) DEFAULT '',
  `mobile` varchar(20) DEFAULT '',
  `register_ip` varchar(45) DEFAULT '',
  `avatar` varchar(255) DEFAULT '',
  `weixin_openid` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-会员';


-- ----------------------------
-- Table structure for mall_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `mall_user_coupon`;
CREATE TABLE `mall_user_coupon` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` tinyint(3) unsigned DEFAULT '0',
  `coupon_number` varchar(20) DEFAULT '',
  `user_id` int(11) unsigned DEFAULT '0',
  `used_time` datetime DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `order_id` mediumint(8) unsigned DEFAULT '0',
  `source_key` varchar(64) DEFAULT NULL COMMENT '来源key',
  `referrer` int(32) DEFAULT NULL COMMENT '发券人',
  `show_state` tinyint(4) DEFAULT NULL COMMENT '是否需要显示 0：未显示 1：已显示',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-会员优惠券';

-- ----------------------------
-- Records of mall_user_coupon
-- ----------------------------
INSERT INTO `mall_user_coupon` VALUES ('1', '4', 'i9kwzek15d43', '15', null, '2018-01-06 14:51:26', null, null, '0', '1');
INSERT INTO `mall_user_coupon` VALUES ('173', '1', 'mxnsjh2yc8il', '88', null, '2018-04-18 10:46:45', null, '', '0', '1');
INSERT INTO `mall_user_coupon` VALUES ('174', '8', 'etlwht1alxv5', '88', null, '2018-04-18 10:53:19', null, '', '0', '1');
INSERT INTO `mall_user_coupon` VALUES ('175', '1', '169tlyr8pr4f', '16', null, '2018-04-18 14:04:48', null, '', '0', '1');
INSERT INTO `mall_user_coupon` VALUES ('176', '8', 'od6to1x6jmyu', '16', null, '2018-04-18 14:05:28', null, '', '0', '1');
INSERT INTO `mall_user_coupon` VALUES ('177', '1', 'fp5c9211lrl3', '90', null, '2018-04-18 14:05:59', null, '', '0', '1');
INSERT INTO `mall_user_coupon` VALUES ('178', '8', 'ku58oaj6gqjh', '90', null, '2018-04-18 14:06:05', null, '', '0', '1');

-- ----------------------------
-- Table structure for mall_user_level
-- ----------------------------
DROP TABLE IF EXISTS `mall_user_level`;
CREATE TABLE `mall_user_level` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城-会员等级';

-- ----------------------------
-- Records of mall_user_level
-- ----------------------------
INSERT INTO `mall_user_level` VALUES ('1', '普通用户', '0');
INSERT INTO `mall_user_level` VALUES ('2', 'vip', '10000');
INSERT INTO `mall_user_level` VALUES ('4', '高级VIP', '100000');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('3', 'CLOUD_STORAGE_CONFIG_KEY', '{\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '超市总部', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '合肥分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '上海分公司', '2', '0');
-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1585 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Table structure for sys_macro
-- ----------------------------
DROP TABLE IF EXISTS `sys_macro`;
CREATE TABLE `sys_macro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(255) DEFAULT NULL COMMENT '父级id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(2000) DEFAULT NULL COMMENT '值',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，0：隐藏   1：显示',
  `type` tinyint(20) DEFAULT NULL COMMENT '类型,0:目录，1:参数配置',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `gmt_create` date DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC COMMENT='通用字典表';

-- ----------------------------
-- Records of sys_macro
-- ----------------------------
INSERT INTO `sys_macro` VALUES ('5', null, '单位', 'goodsUnit', '1', '0', null, null, '2017-08-30', null);
INSERT INTO `sys_macro` VALUES ('6', '5', '个', '个', '1', '1', null, null, '2017-08-30', null);
INSERT INTO `sys_macro` VALUES ('7', '5', '只', '只', '1', '1', '2', null, '2017-10-06', '2017-10-06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '11', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user.html', null, '1', 'fa fa-user', '1', '0');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '2', '0');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-folder-open', '4', '0');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-linux', '9', '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '系统参数', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '7', '0');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '10', '0');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '8', '0');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6', '0');
INSERT INTO `sys_menu` VALUES ('200', '0', '会员管理', null, null, '0', 'fa fa-user-circle-o', '1', '0');
INSERT INTO `sys_menu` VALUES ('201', '200', '会员管理', 'shop/shopuser.html', null, '1', 'fa fa-user-md', '1', '0');
INSERT INTO `sys_menu` VALUES ('202', '201', '查看', null, 'user:list,user:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('203', '201', '新增', null, 'user:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('204', '201', '修改', null, 'user:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('205', '201', '删除', null, 'user:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('207', '200', '会员等级', 'shop/userlevel.html', null, '1', 'fa fa-star-o', '0', '0');
INSERT INTO `sys_menu` VALUES ('208', '207', '查看', null, 'userlevel:list,userlevel:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('209', '207', '新增', null, 'userlevel:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('210', '207', '修改', null, 'userlevel:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('211', '207', '删除', null, 'userlevel:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('222', '0', '商城配置', null, null, '0', 'fa fa-shopping-cart', '2', '0');
INSERT INTO `sys_menu` VALUES ('233', '243', '广告列表', 'shop/ad.html', null, '1', 'fa fa-pencil', '1', '0');
INSERT INTO `sys_menu` VALUES ('234', '233', '查看', null, 'ad:list,ad:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('235', '233', '新增', null, 'ad:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('236', '233', '修改', null, 'ad:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('237', '233', '删除', null, 'ad:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('238', '243', '广告位置', 'shop/adposition.html', null, '1', 'fa fa-map-pin', '0', '0');
INSERT INTO `sys_menu` VALUES ('239', '238', '查看', null, 'adposition:list,adposition:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('240', '238', '新增', null, 'adposition:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('241', '238', '修改', null, 'adposition:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('242', '238', '删除', null, 'adposition:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('243', '0', '推广管理', null, null, '0', 'fa fa-hand-paper-o', '5', '0');
INSERT INTO `sys_menu` VALUES ('244', '243', '优惠劵管理', 'shop/coupon.html', null, '1', 'fa fa-cc-visa', '2', '0');
INSERT INTO `sys_menu` VALUES ('245', '244', '查看', null, 'coupon:list,coupon:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('246', '244', '新增', null, 'coupon:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('247', '244', '修改', null, 'coupon:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('248', '244', '删除', null, 'coupon:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('264', '200', '会员收藏', 'shop/collect.html', null, '1', 'fa fa-star', '3', '0');
INSERT INTO `sys_menu` VALUES ('265', '264', '查看', null, 'collect:list,collect:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('266', '264', '删除', null, 'collect:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('280', '200', '会员足迹', 'shop/footprint.html', null, '1', 'fa fa-history', '4', '0');
INSERT INTO `sys_menu` VALUES ('281', '280', '查看', null, 'footprint:list,footprint:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('282', '280', '删除', null, 'footprint:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('283', '200', '搜索历史', 'shop/searchhistory.html', null, '1', 'fa fa-search', '6', '0');
INSERT INTO `sys_menu` VALUES ('284', '283', '查看', null, 'searchhistory:list,searchhistory:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('285', '283', '删除', null, 'searchhistory:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('286', '200', '购物车', 'shop/cart.html', null, '1', 'fa fa-shopping-cart', '5', '0');
INSERT INTO `sys_menu` VALUES ('287', '286', '查看', null, 'cart:list,cart:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('288', '286', '删除', null, 'cart:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('289', '357', '所有商品', 'shop/goods.html', null, '1', 'fa fa-shopping-bag', '1', '0');
INSERT INTO `sys_menu` VALUES ('290', '289', '查看', null, 'goods:list,goods:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('291', '289', '新增', null, 'goods:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('292', '289', '修改', null, 'goods:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('293', '289', '删除', null, 'goods:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('294', '374', '所有订单', 'shop/order.html', null, '1', '', '3', '0');
INSERT INTO `sys_menu` VALUES ('295', '294', '查看', null, 'order:list,order:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('296', '294', '发货', null, 'order:sendGoods', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('297', '222', '商品类型', 'shop/category.html', null, '1', 'fa fa-ship', '3', '0');
INSERT INTO `sys_menu` VALUES ('298', '297', '查看', null, 'category:list,category:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('299', '297', '新增', null, 'category:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('300', '297', '修改', null, 'category:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('301', '297', '删除', null, 'category:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('302', '1', '通用字典表', 'sys/macro.html', null, '1', 'fa fa-book', '6', '0');
INSERT INTO `sys_menu` VALUES ('303', '302', '查看', null, 'sys:macro:list,sys:macro:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('304', '302', '新增', null, 'sys:macro:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('305', '302', '修改', null, 'sys:macro:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('306', '302', '删除', null, 'sys:macro:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('307', '222', '渠道管理', 'shop/channel.html', null, '1', 'fa fa-road', '2', '0');
INSERT INTO `sys_menu` VALUES ('308', '307', '查看', null, 'channel:list,channel:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('309', '307', '新增', null, 'channel:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('310', '307', '修改', null, 'channel:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('311', '307', '删除', null, 'channel:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('312', '0', '通知管理', null, null, '0', 'fa fa-envelope', '7', '0');
INSERT INTO `sys_menu` VALUES ('315', '222', '商品问答', 'shop/goodsissue.html', null, '1', 'fa fa-question-circle-o', '6', '0');
INSERT INTO `sys_menu` VALUES ('316', '315', '查看', null, 'goodsissue:list,goodsissue:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('317', '315', '新增', null, 'goodsissue:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('318', '315', '修改', null, 'goodsissue:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('319', '315', '删除', null, 'goodsissue:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('325', '222', '反馈', 'shop/feedback.html', null, '1', 'fa fa-mail-reply-all', '6', '0');
INSERT INTO `sys_menu` VALUES ('326', '325', '查看', null, 'feedback:list,feedback:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('327', '325', '新增', null, 'feedback:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('328', '325', '修改', null, 'feedback:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('329', '325', '删除', null, 'feedback:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('330', '244', '发放', null, 'coupon:publish', '2', null, '4', '0');
INSERT INTO `sys_menu` VALUES ('336', '357', '用户评论', 'shop/comment.html', null, '1', 'fa fa-commenting', '11', '0');
INSERT INTO `sys_menu` VALUES ('337', '336', '查看', null, 'comment:list,comment:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('338', '336', '新增', null, 'comment:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('339', '336', '修改', null, 'comment:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('340', '336', '删除', null, 'comment:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('341', '336', '修改状态', null, 'comment:toggleStatus', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('357', '0', '编辑商品', null, null, '0', 'fa fa-edit', '3', '0');
INSERT INTO `sys_menu` VALUES ('358', '357', '商品回收站', 'shop/goodshistory.html', '', '1', 'fa fa-history', '12', '0');
INSERT INTO `sys_menu` VALUES ('359', '358', '恢复', null, 'goods:back', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('360', '294', '确认收获', null, 'order:confirm', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('361', '357', '团购设置', 'shop/goodsgroup.html', null, '1', 'fa fa-group', '5', '0');
INSERT INTO `sys_menu` VALUES ('362', '361', '查看', null, 'goodsgroup:list,goodsgroup:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('363', '361', '新增', null, 'goodsgroup:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('364', '361', '修改', null, 'goodsgroup:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('365', '361', '删除', null, 'goodsgroup:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('366', '0', '门店管理', null, null, '0', 'fa fa-leanpub', '6', '0');
INSERT INTO `sys_menu` VALUES ('368', '1', '部门管理', 'sys/dept.html', null, '1', 'fa fa-sitemap', '3', '0');
INSERT INTO `sys_menu` VALUES ('369', '368', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('370', '368', '新增', null, 'sys:dept:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('371', '368', '修改', null, 'sys:dept:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('372', '368', '删除', null, 'sys:dept:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('373', '368', '选择部门', null, 'sys:dept:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('374', '0', '订单管理', null, null, '0', 'fa fa-first-order', '4', '0');
INSERT INTO `sys_menu` VALUES ('375', '357', '开团管理', 'shop/goodsgroupopen.html', null, '1', 'fa fa-file-code-o', '6', '0');
INSERT INTO `sys_menu` VALUES ('376', '375', '查看', null, 'goodsgroupopen:list,goodsgroupopen:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('377', '375', '新增', null, 'goodsgroupopen:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('378', '375', '修改', null, 'goodsgroupopen:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('379', '375', '删除', null, 'goodsgroupopen:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('380', '374', '团购订单', 'shop/order.html?orderType=2', null, '1', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('381', '374', '砍价订单', 'shop/order.html?orderType=3', null, '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('382', '374', '普通订单', 'shop/order.html?orderType=1', null, '1', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('383', '357', '砍价设置', 'shop/goodsbargain.html', null, '1', 'fa fa-file-code-o', '7', '0');
INSERT INTO `sys_menu` VALUES ('384', '383', '查看', null, 'goodsbargain:list,goodsbargain:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('385', '383', '新增', null, 'goodsbargain:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('386', '383', '修改', null, 'goodsbargain:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('387', '383', '删除', null, 'goodsbargain:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('388', '357', '砍价管理', 'shop/bargainopen.html', null, '1', 'fa fa-file-code-o', '8', '0');
INSERT INTO `sys_menu` VALUES ('389', '388', '查看', null, 'bargainopen:list,bargainopen:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('390', '388', '新增', null, 'bargainopen:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('391', '388', '修改', null, 'bargainopen:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('392', '388', '删除', null, 'bargainopen:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('393', '201', '导出', null, 'user:export', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('394', '200', '收货地址管理', '../shop/address.html', null, '1', 'fa fa-map', '7', '0');
INSERT INTO `sys_menu` VALUES ('395', '394', '查看', null, 'address:list,address:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('396', '394', '删除', null, 'address:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('397', '312', '用户通知', 'sys/noticeuser.html', null, '1', 'fa fa-commenting', '2', '0');
INSERT INTO `sys_menu` VALUES ('398', '397', '查看', null, 'sys:noticeuser:list,sys:noticeuser:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('399', '397', '新增', null, 'sys:noticeuser:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('400', '397', '修改', null, 'sys:noticeuser:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('401', '397', '删除', null, 'sys:noticeuser:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('402', '312', '通知', 'sys/notice.html', null, '1', 'fa fa-commenting-o', '1', '0');
INSERT INTO `sys_menu` VALUES ('403', '402', '查看', null, 'sys:notice:list,sys:notice:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('404', '402', '新增', null, 'sys:notice:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('405', '402', '修改', null, 'sys:notice:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('406', '402', '删除', null, 'sys:notice:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('407', '222', '商品参数', 'shop/attribute.html', null, '1', 'fa fa-list-ol', '4', '0');
INSERT INTO `sys_menu` VALUES ('408', '407', '查看', null, 'attribute:list,attribute:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('409', '407', '保存', null, 'attribute:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('410', '407', '修改', null, 'attribute:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('411', '407', '删除', null, 'attribute:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('412', '222', '问答列表', 'shop/helpissue.html', null, '1', 'fa fa-question-circle-o', '10', '0');
INSERT INTO `sys_menu` VALUES ('413', '412', '查看', null, 'helpissue:list,helpissue:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('414', '412', '新增', null, 'helpissue:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('415', '412', '修改', null, 'helpissue:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('416', '412', '删除', null, 'helpissue:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('417', '222', '问答分类', 'shop/helptype.html', null, '1', 'fa fa-clone', '9', '0');
INSERT INTO `sys_menu` VALUES ('418', '417', '查看', null, 'helptype:list,helptype:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('419', '417', '新增', null, 'helptype:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('420', '417', '修改', null, 'helptype:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('421', '417', '删除', null, 'helptype:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('422', '366', '飞鸽打印机', 'sys/printer.html', null, '1', 'fa fa-print', '2', '0');
INSERT INTO `sys_menu` VALUES ('423', '422', '查看', null, 'sys:printer:list,sys:printer:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('424', '422', '新增', null, 'sys:printer:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('425', '422', '修改', null, 'sys:printer:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('426', '422', '删除', null, 'sys:printer:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('427', '366', '超市门店管理', 'shop/store.html', null, '1', 'fa fa-university', '1', '0');
INSERT INTO `sys_menu` VALUES ('428', '427', '查看', null, 'store:list,store:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('429', '427', '新增', null, 'store:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('430', '427', '修改', null, 'store:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('431', '427', '删除', null, 'store:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('437', '375', '砍价记录', null, 'bargainopenrecord:list', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('438', '366', '骑手招聘信息', 'shop/riderrecruit.html', null, '1', 'fa fa-bicycle', '3', '0');
INSERT INTO `sys_menu` VALUES ('439', '438', '查看', null, 'riderrecruit:list,riderrecruit:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('440', '438', '修改', null, 'riderrecruit:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('441', '0', '短信平台', null, null, '0', 'fa fa-television', '9', '0');
INSERT INTO `sys_menu` VALUES ('442', '441', '短信配置', 'sys/smslog.html', '', '1', 'fa fa-envelope-open', '1', '0');
INSERT INTO `sys_menu` VALUES ('443', '442', '查看', null, 'sys:smslog:list,sys:smslog:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('444', '357', '门店商品', 'shop/storeProductStock.html', null, '1', 'fa fa-print', '2', '0');
INSERT INTO `sys_menu` VALUES ('445', '444', '导入', null, 'productstorerela:upload', '2', null, '3', '0');
INSERT INTO `sys_menu` VALUES ('447', '444', '修改', null, 'productstorerela:update', '2', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('448', '444', '新增', null, 'productstorerela:save', '2', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('449', '200', '骑手管理', 'shop/rider.html', null, '1', 'fa fa-bicycle', '6', '0');
INSERT INTO `sys_menu` VALUES ('450', '449', '查看', null, 'rider:list,rider:info', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('451', '449', '新增', null, 'rider:save', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('452', '449', '修改', null, 'rider:update', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('453', '449', '删除', null, 'rider:delete', '2', null, '6', '0');
INSERT INTO `sys_menu` VALUES ('454', '444', '删除', null, 'productstorerela:delete', '2', null, '4', '0');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` varchar(32) NOT NULL,
  `context` varchar(512) DEFAULT NULL COMMENT '通知内容',
  `title` varchar(255) DEFAULT NULL COMMENT '通知标题',
  `soucre` varchar(3) DEFAULT NULL COMMENT '通知来源 1=普通通知（人工发起） 2=下单通知（系统发起）',
  `status` varchar(3) DEFAULT NULL COMMENT '通知状态 0=已发布 1=草稿 ',
  `is_urgent` varchar(3) DEFAULT NULL COMMENT '是否紧急 0是1否',
  `release_timee` datetime DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_id` bigint(20) DEFAULT NULL,
  `update_id` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('71c9f07ae7934eb881b051cb139ed764', '亲，您有新的订单，请及时处理！', '系统通知【新订单】', '2', '0', '1', '2017-09-04 13:13:52', '2017-09-04 13:13:52', null, '1', '1', null);

-- ----------------------------
-- Table structure for sys_notice_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_user`;
CREATE TABLE `sys_notice_user` (
  `id` varchar(32) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `notice_id` varchar(32) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL COMMENT '0已读 1未读',
  `remark` varchar(255) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知和用户关系表';

-- ----------------------------
-- Records of sys_notice_user
-- ----------------------------
INSERT INTO `sys_notice_user` VALUES ('e9fed829a40645feb2bddbf3532bd527', '1', '71c9f07ae7934eb881b051cb139ed764', '0', null);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1982 DEFAULT CHARSET=utf8 COMMENT='文件上传';


-- ----------------------------
-- Table structure for sys_printer
-- ----------------------------
DROP TABLE IF EXISTS `sys_printer`;
CREATE TABLE `sys_printer` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印机名称',
  `sn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印机编号',
  `store_id` mediumint(8) DEFAULT NULL COMMENT '所属门店',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='飞鸽打印机';

-- ----------------------------
-- Records of sys_printer
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('5', '超级管理员', '超级管理员', '1', '2017-09-18 00:40:15', '1');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1990 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Table structure for sys_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_log`;
CREATE TABLE `sys_sms_log` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `content` text COMMENT '必填参数。发送内容（1-500 个汉字）UTF-8编码',
  `mobile` text COMMENT '必填参数。手机号码。多个以英文逗号隔开',
  `stime` datetime DEFAULT NULL COMMENT '可选参数。发送时间，填写时已填写的时间发送，不填时为当前时间发送',
  `sign` varchar(32) DEFAULT NULL COMMENT '必填参数。用户签名',
  `type` varchar(32) DEFAULT NULL COMMENT '必填参数。固定值 pt',
  `extno` varchar(255) DEFAULT NULL COMMENT '可选参数。扩展码，用户定义扩展码，只能为数字',
  `send_status` int(11) DEFAULT NULL COMMENT '1成功 0失败',
  `send_id` varchar(32) DEFAULT NULL COMMENT '发送编号',
  `invalid_num` int(11) DEFAULT NULL COMMENT '无效号码数',
  `success_num` int(11) DEFAULT NULL COMMENT '成功提交数',
  `black_num` int(11) DEFAULT NULL COMMENT '黑名单数',
  `return_msg` varchar(50) DEFAULT NULL COMMENT '返回消息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='短信发送日志';

-- ----------------------------
-- Records of sys_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '939961241@qq.com', '15209831990', '1', '1', '2016-11-11 11:11:11', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
--  Function structure for `getCategoryChildLst`
-- ----------------------------
DROP FUNCTION IF EXISTS `getCategoryChildLst`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCategoryChildLst`(rootId INT) RETURNS varchar(1000) CHARSET utf8 COLLATE utf8_unicode_ci
    DETERMINISTIC
BEGIN
	DECLARE
		sTemp VARCHAR (1000);

DECLARE
	sTempChd VARCHAR (1000);


SET sTemp = '$';


SET sTempChd = cast(rootId AS CHAR);


WHILE sTempChd IS NOT NULL DO

SET sTemp = concat(sTemp, ',', sTempChd);

SELECT
	group_concat(id) INTO sTempChd
FROM
	mall_category
WHERE
	FIND_IN_SET(parent_id, sTempChd) > 0;


END
WHILE;

RETURN sTemp;


END
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

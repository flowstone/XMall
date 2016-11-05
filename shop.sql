-- 创建数据库
CREATE DATABASE xmall CHARSET=UTF8;

use xmall;
--创建会员表


CREATE TABLE yao_member
(
    member_id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(255),
    telephone VARCHAR(16),
    password VARCHAR(64) NOT NULL DEFAULT '',
    name VARCHAR(64) NOT NULL DEFAULT '',
    is_newsletter TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY(member_id),
    UNIQUE KEY (email),
    UNIQUE KEY (telephone),
    UNIQUE KEY (name)
) CHARSET=UTF8;

-- 促销活动表
CREATE TABLE yao_event(
    event_id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(64) NOT NULL DEFAULT '',
    PRIMARY KEY (event_id)
) CHARSET=UTF8;

-- 活动会员关联表
CREATE TABLE yao_event_member(
    event_member_id INT UNSIGNED AUTO_INCREMENT,
    event_id INT UNSIGNED NOT NULL DEFAULT 0,
    member_id INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY(event_member_id)
) CHARSET=UTF8;


INSERT INTO yao_event VALUES (101, '2016双11');
INSERT INTO yao_event VALUES (100, '2016国庆大促');
INSERT INTO yao_event_member VALUES (null, 101, 14);
INSERT INTO yao_event_member VALUES (null, 100, 14);
INSERT INTO yao_event_member VALUES (null, 101, 17);

-- 会员登陆行为日志
CREATE TABLE yao_member_login_log(
    member_login_log_id INT UNSIGNED AUTO_INCREMENT,
    member_id INT UNSIGNED NOT NULL DEFAULT 0,
    login_time INT NOT NULL DEFAULT 0,
    login_ip INT UNSIGNED NOT NULL DEFAULT 0,
    error_numer INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY(member_login_log_id),
    INDEX(member_id)
) CHARSET=UTF8;


INSERT INTO yao_member_login_log VALUES (NULL, 11, unix_timestamp()-50000, inet_aton('22.45.163.11'), 0);
INSERT INTO yao_member_login_log VALUES (NULL, 11, unix_timestamp()-10000, inet_aton('22.45.165.11'), 0);
INSERT INTO yao_member_login_log VALUES (NULL, 11, unix_timestamp(), inet_aton('22.45.163.12'), 0);



CREATE TABLE yao_session
(
	session_id varchar(255) NOT NULL,
	session_expire int(11) NOT NULL,
	session_data blob,
	UNIQUE KEY `session_id` (`session_id`)
) charset=utf8;



-- 商品分类表
drop table if exists yao_category;
create table yao_category (
	category_id int unsigned auto_increment,
	title varchar(32) not null default '',
	parent_id int unsigned not null default 0,
	sort_number int not null default 0,


	image varchar(255) not null default '', -- 分类图片
	image_thumb varchar(255) not null default '', -- 分类图片缩略图
	-- 前台展示
	is_used boolean not null default 1, -- tinyint(1)
	is_nav tinyint not null default 1, -- 针对顶级分类

	-- SEO优化
	meta_title varchar(255) not null default '',
	meta_keywords varchar(255) not null default '',
	meta_description varchar(1024) not null default '',
	primary key (category_id),
	index (parent_id),
	index (sort_number)
) charset=utf8;

-- 注册行为日志
CREATE TABLE member_register_log();



-- 创建分类表
CREATE TABLE yao_category(
    category_id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(32) NOT NULL DEFAULT '',
    parent_id INT UNSIGNED NOT NULL DEFAULT 0,
    sort_number INT NOT NULL DEFAULT 0,

    image VARCHAR(255) NOT NULL DEFAULT '',  -- 分类图片
    image_thumb VARCHAR(255) NOT NULL DEFAULT '', -- 分类图片缩略图
    -- 前台展示
    is_used BOOLEAN NOT NULL DEFAULT 1,
    is_nav TINYINT NOT NULL DEFAULT 1,  -- 针对顶级分类

    -- SEO优化
    meta_title varchar(255) NOT NULL DEFAULT '',
    meta_keywords VARCHAR(255) NOT NULL DEFAULT '',
    meta_description VARCHAR(1024) NOT NULL DEFAULT '',
    PRIMARY KEY (category_id),
    index (parent_id),
    index (sort_number)
)CHARSET=UTF8;


insert into yao_category values (1, '未分类', 0, -1, '', '', 0, 0, '', '', '');
insert into yao_category values (5, '眼镜', 0, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (6, '男士眼镜', 5, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (7, '女士眼镜', 5, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (8, '飞行员眼镜', 5, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (9, '驾驶镜', 5, 0,'', '',  1, 1, '', '', '');
insert into yao_category values (10, '太阳镜', 5, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (11, '图书', 0, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (12, '历史', 11, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (14, '科技', 11, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (15, '计算机', 11, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (16, '电子书', 11, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (17, '科普', 14, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (18, '建筑', 14, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (19, '工业技术', 14, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (20, '电子通信', 14, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (21, '自然科学', 14, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (22, '互联网', 15, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (23, '计算机编程', 15, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (24, '硬件，攒机', 15, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (25, '大数据', 15, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (26, '移动开发', 15, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (27, 'PHP', 15, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (28, '近代史', 12, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (29, '当代史', 12, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (30, '古代史', 12, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (31, '先秦百家', 12, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (32, '三皇五帝', 12, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (33, '励志', 16, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (34, '小说', 16, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (35, '成功学', 16, 0, '', '', 0, 0, '', '', '');
insert into yao_category values (36, '经济金融', 16, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (37, '免费', 16, 0, '', '', 1, 1, '', '', '');



create table yao_brand(
    brand_id int unsigned auto_increment,
    title varchar(32) not null default '', -- 品牌名
    logo varchar(255) not null default '', -- 品牌logo
    logo_ori varchar(255) not null default '', -- 品牌logo原始图像文件
    sort_number int not null default 0, -- 排序

    created_at int not null default 0, -- 创建时间
    updated_at int not null default 0, -- 修改时间
    primary key (brand_id),
    index (sort_number),
    index (title)
)charset=utf8;

-- 配置项类型（不提供管理接口）
create table yao_setting_type (
	setting_type_id int unsigned auto_increment,
	type_title varchar(32) not null default '', -- 类型说明
	primary key (setting_type_id)
) charset=utf8;
-- 加入测试数据
insert into yao_setting_type values (1, 'text');-- 文本
insert into yao_setting_type values (2, 'textarea');-- 大文本
insert into yao_setting_type values (3, 'select');-- 单选
insert into yao_setting_type values (4, 'select-multi');-- 多选

-- 配置项分组（不提供管理接口）
create table yao_setting_group (
	setting_group_id int unsigned auto_increment,
	group_title varchar(32) not null default '',-- 分组的标题
	primary key (setting_group_id)
) charset=utf8;
-- 加入测试数据
insert into yao_setting_group values (1, '商店设置');-- ['goods_count']
insert into yao_setting_group values (2, '安全配置');-- [goods_count']

-- 配置项
create table yao_setting (
	setting_id int unsigned not null auto_increment,
	`key` varchar(32) not null default '', -- 程序使用的key
	value varchar(255) not null default '', -- 配置项的值
	title varchar(32) not null default '', -- 配置项的标题描述
	setting_type_id int unsigned not null default 0, -- 配置项输入类型ID
	setting_group_id int unsigned not null default 0, -- 配置项分组的ID
	sort_number int not null default 0, -- 排序标识
	primary key (setting_id),
	index (setting_type_id),
	index (setting_group_id),
	index (sort_number)
) charset=utf8;
-- 测试数据
insert into yao_setting values (1, 'shop_title', 'BuyPlus(败家Shopping)', '商店名称', 1, 1,  0);
insert into yao_setting values (2, 'allow_comment', '5', '是否允许商品评论', 3, 1, 0);
insert into yao_setting values (3, 'use_captcha', '1,3', '哪些页面使用验证码', 4, 2, 0);
insert into yao_setting values (4, 'mate_description', 'BuyPlus(败家Shopping), 用BuyPlus，不败家！', 'mate描述description', 2, 1, 0);
insert into yao_setting values (5, 'brand_thumb_width', '66', '品牌缩略图宽', 1, 1, 0);
insert into yao_setting values (6, 'brand_thumb_height', '66', '品牌缩略图高', 1, 1, 0);
-- 配置系统选项预设值
create table yao_setting_option (
	setting_option_id int unsigned auto_increment,-- 选项预设值的option value="option_id"
	option_title varchar(32) not null default '', -- 选项预设值显示内容<option>option_title</option>
	setting_id int unsigned not null default 0,-- 对应的选项ID, 如果选项为单向或多选类型, 则存在对于的选项预设值列表
	primary key (setting_option_id),
	index (setting_id)
) charset=utf8;
insert into yao_setting_option values (1, '注册', 3);
insert into yao_setting_option values (2, '登录', 3);
insert into yao_setting_option values (3, '评论', 3);
insert into yao_setting_option values (4, '生成订单', 3);
insert into yao_setting_option values (5, '是', 2);
insert into yao_setting_option values (6, '否', 2);

-- 商品相关数据存储表
-- 仅仅提供数据存储, 和基本编辑, 没有额外的业务逻辑
-- 长度单位
create table yao_length_unit (
	length_unit_id int unsigned auto_increment,
	title varchar(32) not null default '',
	primary key (length_unit_id)
) charset=utf8;
insert into yao_length_unit values (1, '厘米');
insert into yao_length_unit values (2, '毫米');
insert into yao_length_unit values (3, '英寸');
insert into yao_length_unit values (4, '米');

-- 重量单位
create table yao_weight_unit (
	weight_unit_id int unsigned auto_increment,
	title varchar(32) not null default '',
	primary key (weight_unit_id)
) charset=utf8;
insert into yao_weight_unit values (1, '克');
insert into yao_weight_unit values (2, '千克');
insert into yao_weight_unit values (3, '500克(斤)');

-- 税类型
create table yao_tax (
	tax_id int unsigned auto_increment,
	title varchar(32) not null default '',
	primary key (tax_id)
) charset=utf8;
insert into yao_tax values (1, '免税产品');
insert into yao_tax values (2, '缴税产品');


create table yao_stock_status (
	stock_status_id int unsigned auto_increment,
	title varchar(32) not null default '',
	primary key (stock_status_id)
) charset=utf8;
insert into yao_stock_status values (1, '库存充足');
insert into yao_stock_status values (2, '1-3周');
insert into yao_stock_status values (3, '1-3天');
insert into yao_stock_status values (4, '脱销');
insert into yao_stock_status values (5, '预定');


-- 商品表
drop table if exists yao_goods;
create table yao_goods (
	-- 基本信息
	goods_id int unsigned auto_increment,
	name varchar(64) not null default '',
	image varchar(255) not null default '',
	image_thumb varchar(255) not null default '',
	SKU varchar(16) not null default '', -- 库存单位
	UPC varchar(255) not null default '', -- 通用商品代码
	price decimal(10, 2) not null default 0.0,
	quantity int unsigned not null default 0, -- 库存
	minimum int unsigned not null default 1, -- 最小起订数量
	subtract tinyint not null default 1, -- 是否减少库存
	is_shipping tinyint not null default 1, -- 是否允许配送
	date_available date not null default '0000-00-00', -- 供货日期
	length int unsigned not null default 0,
	width int unsigned not null default 0,
	height int unsigned not null default 0,
	weight int unsigned not null default 0,
	status tinyint not null default 1, -- 是否可用
	sort_number int not null default 0, -- 排序
	description text, -- 商品描述
	is_deleted tinyint not null default 0, -- 是否被删除

	-- SEO优化
	meta_title varchar(255) not null default '',
	meta_keywords varchar(255) not null default '',
	meta_description varchar(1024) not null default '',

	-- 关联数据
	length_unit_id int unsigned not null default 0, -- 长度单位
	weight_unit_id int unsigned not null default 0, -- 重量的单位
	tax_id int unsigned not null default 0, -- 税类型ID
	stock_status_id int unsigned not null default 0, -- 库存状态ID
	brand_id int unsigned not null default 0, -- 所属品牌ID
	category_id int unsigned not null default 0, -- 所属分类ID

	created_at int not null default 0,
	updated_at int not null default 0,

	-- 索引约束们
	primary key (goods_id),
	index (brand_id),
	index (category_id),
	index (tax_id),
	index (stock_status_id),
	index (length_unit_id),
	index (weight_unit_id),
	index (sort_number),
	index (name),
	index (price),
	unique key (UPC)
) charset=utf8;
  insert into yao_goods (name, description, UPC, price, quantity, sort_number, brand_id, category_id, status) values ('Z2', '作为索尼2014年度旗舰手机，索尼Xperia Z2较上一代产品Xperia Z1有了不少升级。屏幕方面，索尼Xperia Z2采用了IPS材质全高清屏幕，尺寸提升至5.2英寸，并采用了“LiveColor LED”显示技术。索尼表示，Xperia Z2的色彩饱和度达到前所未有的程度，屏幕的可视角度比市场上任何设备的可视角度还要很广阔，显示效果甚至 索尼Xperia Z2 索尼Xperia Z2 (7张) 优于iPhone和iPad。外观方面，索尼Xperia Z2与上代产品Xperia Z1相比则没有太大变化，同样采用铝合金框架和双玻璃镜面材质，机身尺寸为146.8x73.3x8.2mm，重163g，有黑色、白色、紫色三种颜色可选。 配置方面，索尼Xperia Z2该机采用5.2英寸1920x1080分辨率IPS屏幕，像素密度为424ppi，搭载最新的高通Snapdragon 801四核处理器，主频达2.3GHz，提供3GB超大内存和16GB存储空间，支持MicroSD卡扩展，配备2070万像素的索尼G镜头和220万像素前置摄像头，内置1/2.3英寸的Exmor RS堆栈式结构传感器，拥有f2.0大光圈和27mm广角，支持4K视频录制，配置3200毫安时（mAh）不可拆卸式电池，运行基于Android 4.4操作系统定制的Xperia界面，支持IP55/58精密防尘防水功能，支持NFC连接，支持TD-LTE/WCDMA/GSM网络等。 此外，索尼Xperia Z2还新增了无线充电、双击唤醒屏幕、手套模式、智能手势等人性化功能，添加了SteadyShot功能，减少用户在拍摄时因手的抖动而引起的成像不清等现象，并加入了S-Front环绕音效和数字降噪技术（配备全新的降噪耳塞，降噪能力达到98%）,在嘈杂的环境下依然可以收听高品质音乐。 作为Xperia Z1的升级版，这款手机搭载了5.2英寸1080p的IPS屏幕，并搭载了索尼顶级电视上才会有的Sony Triluminos Display 特丽魅影原色技术，该技术能在拓展色域的同时，保持颜色的真实自然。2.3GHz主频的骁龙801处理器，3GB的运行内存，装备G镜头2070万像素的堆栈式摄像头以及3200毫安的电池无疑已经达到了当前的顶配。外观上和Xperia Z1还是比较相似。当然同样具备了IP58级别的三防功能', '12345678', 1234, 100, 10, 1, 3, 1);


-- 商品图片
create table yao_goods_image (
	goods_image_id int unsigned auto_increment,
	goods_id int unsigned not null default 0, -- 对应商品ID
	image varchar(255) not null default '', -- 商品原始图像
	image_small varchar(255) not null default '', -- 商品小图像
	image_medium varchar(255) not null default '', -- 商品中图像
	image_big varchar(255) not null default '', -- 商品大图像
	sort_number int not null default 0, -- 排序
	primary key (goods_image_id),
	index (goods_id),
	index (sort_number)
) charset=utf8;


-- 商品属性类型
create table yao_goods_type (
	goods_type_id int unsigned auto_increment,
	title varchar(32) not null default '', -- 标题
	primary key (goods_type_id)
) charset=utf8;
insert into yao_goods_type values (1, '笔记本');
insert into yao_goods_type values (2, '眼镜');
insert into yao_goods_type values (3, '图书');

	-- 商品属性
create table yao_goods_attribute (
	goods_attribute_id int unsigned auto_increment,
	title varchar(32) not null default '', -- 标题
	sort_number int not null default 0, -- 排序
	goods_type_id int not null default 0, -- 所属商品类型ID
	attribute_type_id int not null default 0, -- 所属类型ID
	primary key (goods_attribute_id),
	index (goods_type_id),
	index (attribute_type_id)
) charset=utf8;
insert into yao_goods_attribute values (null, '内存', 0, 1, 2);
insert into yao_goods_attribute values (null, '镜片材质', 0, 2, 1);
insert into yao_goods_attribute values (null, '镜框材质', 0, 2, 1);
insert into yao_goods_attribute values (null, '作者', 0, 3, 1);
insert into yao_goods_attribute values (null, '出版社', 0, 3, 1);
insert into yao_goods_attribute values (null, '页数', 0, 3, 1);


-- 商品与属性关联
create table yao_goods_attribute_value (
	goods_attribute_value_id int unsigned auto_increment,
	goods_id int unsigned not null default 0, -- 商品ID
	goods_attribute_id int unsigned not null default 0, -- 属性ID
	value varchar(255) not null default '', -- 商品属性的值
	is_option tinyint not null default 0, -- 是否是可选项
	primary key (goods_attribute_value_id),
	index (goods_id),
	index (goods_attribute_id)
) charset=utf8;


-- 商品属性类型
create table yao_attribute_type (
	attribute_type_id int unsigned auto_increment,
	title varchar(32) not null default '', -- 类型名
	primary key (attribute_type_id)
) charset=utf8;
insert into yao_attribute_type values (1, 'text'); -- 文本
insert into yao_attribute_type values (2, 'select'); -- 选择(多选)

-- 商品选项类属性的预设值
create table yao_attribute_option (
	attribute_option_id int unsigned auto_increment,
	goods_attribute_id int unsigned not null default 0, -- 所属的商品属性
	title varchar(255) not null default '', -- 预设值值部分
	primary key (attribute_option_id),
	index (goods_attribute_id)
) charset=utf8;
-- // 内存预设值测试数据
insert into yao_attribute_option values (null, 1, '4G');
insert into yao_attribute_option values (null, 1, '8G');
insert into yao_attribute_option values (null, 1, '16G');
insert into yao_attribute_option values (null, 1, '2G');
insert into yao_attribute_option values (null, 1, '12G');
insert into yao_attribute_option values (null, 1, '32G');

-- 货品表
create table yao_goods_product
(
	goods_product_id int unsigned auto_increment,
	goods_id int unsigned not null default 0,
	product_quantity int not null default 0,
	product_price decimal(10, 2) not null default 0.0,
	price_operate enum('=', '-', '+') not null default '+',
	enabled tinyint not null default 1,
	primary key (goods_product_id),
	index (goods_id)
) charset=utf8;

-- 货品选项表
create table yao_product_option
(
	product_option_id int unsigned auto_increment,
	goods_product_id int unsigned not null default 0,
	attribute_option_id int unsigned not null default 0,
	primary key (product_option_id),
	index (goods_product_id),
	index (attribute_option_id)
)charset=utf8;
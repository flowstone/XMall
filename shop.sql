-- 创建数据库
CREATE DATABASE buyplus CHARSET=UTF8;

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

-- 注册行为日志
CREATE TABLE member_register_log();



--创建分类表
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
insert into yao_category values (6, '男士眼镜', 5, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (7, '女士眼镜', 5, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (8, '飞行员眼镜', 5, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (9, '驾驶镜', 5, 0,'', '',  1, 0, '', '', '');
insert into yao_category values (10, '太阳镜', 5, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (11, '图书', 0, 0, '', '', 1, 1, '', '', '');
insert into yao_category values (12, '历史', 11, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (14, '科技', 11, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (15, '计算机', 11, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (16, '电子书', 11, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (17, '科普', 14, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (18, '建筑', 14, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (19, '工业技术', 14, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (20, '电子通信', 14, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (21, '自然科学', 14, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (22, '互联网', 15, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (23, '计算机编程', 15, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (24, '硬件，攒机', 15, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (25, '大数据', 15, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (26, '移动开发', 15, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (27, 'PHP', 15, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (28, '近代史', 12, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (29, '当代史', 12, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (30, '古代史', 12, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (31, '先秦百家', 12, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (32, '三皇五帝', 12, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (33, '励志', 16, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (34, '小说', 16, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (35, '成功学', 16, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (36, '经济金融', 16, 0, '', '', 1, 0, '', '', '');
insert into yao_category values (37, '免费', 16, 0, '', '', 1, 0, '', '', '');

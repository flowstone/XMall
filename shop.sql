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
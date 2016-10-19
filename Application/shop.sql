create database buyplus3 charset=utf8;

-- 会员表
create table kang_member
(
	member_id int unsigned auto_increment,
	email varchar(255),
	telephone varchar(16),
	password varchar(64) not null default '',
	name varchar(64) not null default '',
	is_newsletter tinyint not null default 0, -- 不订阅
	primary key (member_id),
	unique key (email),
	unique key (telephone),
	unique key (name)
) charset=utf8;
-- 促销活动表
create table kang_event
(
	event_id int unsigned auto_increment,
	title varchar(64) not null default '',
	primary key (event_id)
) charset=utf8;
-- 活动会员关联表
create table kang_event_member
(
	event_member_id int unsigned auto_increment,
	event_id int unsigned not null default 0,
	member_id int unsigned not null default 0,
	primary key (event_member_id)
) charset=utf8;
insert into kang_event values (101, '2016双11');
insert into kang_event values (100, '2016国庆大促');
insert into kang_event_member values (null, 101, 14);
insert into kang_event_member values (null, 100, 14);
insert into kang_event_member values (null, 101, 17);

-- 会员登陆行为日志
drop table if exists kang_member_login_log;
create table kang_member_login_log(
	member_login_log_id int unsigned auto_increment,
	member_id int unsigned not null default 0,
	login_time int not null default 0, -- 登陆时间
	login_ip int unsigned not null default 0, -- 登陆IP
	error_number int unsigned not null default 0, -- 错误次数
	primary key (member_login_log_id),
	index (member_id)
) charset=utf8;
insert into kang_member_login_log values (null, 11, unix_timestamp()-50000, inet_aton('22.45.163.11'), 0);
insert into kang_member_login_log values (null, 11, unix_timestamp()-10000, inet_aton('22.45.165.11'), 0);
insert into kang_member_login_log values (null, 11, unix_timestamp(), inet_aton('22.45.163.12'), 0);


create table member_regisger_log();-- 注册行为日志
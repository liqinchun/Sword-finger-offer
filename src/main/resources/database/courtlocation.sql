create database smartpension;
USE `smartpension`;

/*Table structure for table `organizatioin` */
/*DROP TABLE organization;
DROP TABLE terminal;
DROP TABLE person;
DROP TABLE visitor;
DROP TABLE history_record;
DROP TABLE statistics; */
CREATE TABLE IF NOT EXISTS `iotlocation_card_terminal` (
  `id` varchar(32) NOT NULL,
  `scene_id` varchar(32) DEFAULT NULL,
  `tmn_devsn` varchar(32) DEFAULT NULL,
  `tmn_name` varchar(32) DEFAULT NULL,
  `tmn_type` varchar(32) DEFAULT NULL,
  `tmn_oid_index` varchar(32) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `tmn_available` int(1) DEFAULT '0' COMMENT '0 未绑定， 1 已绑定',
  `help` tinyint(1) DEFAULT '1' COMMENT '一键呼救0 false 不支持，1 true支持',
  `endian` varchar(5) DEFAULT NULL,
  `link_type` varchar(32) DEFAULT NULL,
  `firm_name` varchar(32) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  `card_group` int(2) DEFAULT NULL,
  `electric_num` double(3,0) DEFAULT NULL,
  `electric_date` varchar(20) DEFAULT NULL COMMENT '电量上报时间',
  `create_data` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_data` timestamp NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tmn_oid_index` (`tmn_oid_index`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `iotlocation_gate_terminal` (
  `id` varchar(32) NOT NULL,
  `scene_id` varchar(32) DEFAULT NULL,
  `tmn_devsn` varchar(32) DEFAULT NULL,
  `tmn_name` varchar(32) DEFAULT NULL,
  `tmn_type` varchar(32) DEFAULT NULL,
  `tmn_oid_index` varchar(32) NOT NULL,
  `state` varchar(32) DEFAULT NULL,
  `tmn_available` int(1) DEFAULT NULL COMMENT '0 闸机未启用 1 已启用',
  `help` varchar(32) DEFAULT NULL,
  `endian` varchar(32) DEFAULT NULL,
  `link_type` varchar(32) DEFAULT NULL,
  `firm_name` varchar(32) DEFAULT NULL,
  `ip_addr` varchar(32) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
   `create_data` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_data` timestamp NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for video
-- ----------------------------
CREATE TABLE IF NOT EXISTS `iotlocation_video` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `video_name` varchar(16) NOT NULL COMMENT '摄像头名称',
  `type` varchar(2) DEFAULT '0' COMMENT '0 网络摄像头',
  `bind` int(1) DEFAULT '0' COMMENT '是否绑定 0 未绑定 1 已绑定',
  `source_protocal` varchar(10) DEFAULT NULL,
  `source_host` varchar(20) NOT NULL COMMENT '主机名',
  `source_port` varchar(6) NOT NULL COMMENT '端口',
  `source_path` varchar(64) DEFAULT NULL COMMENT '路径url',
  `source_username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `source_password` varchar(100) DEFAULT NULL COMMENT '密码',
  `create_data` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_data` timestamp NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`video_name`) USING BTREE,
  UNIQUE KEY `unique_host` (`source_host`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for system
-- ----------------------------
CREATE TABLE IF NOT EXISTS `iotlocation_system` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `type` int(1) NOT NULL COMMENT '类型',
  `label` varchar(64) NOT NULL COMMENT '标签',
  `context` varchar(128) NOT NULL COMMENT '内容',
  `value` varchar(20) DEFAULT NULL,
  `update_data` timestamp NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for setting
-- ----------------------------
CREATE TABLE IF NOT EXISTS `iotlocation_setting` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32)  NULL,
  `carousel_change_time` int(3)  NULL COMMENT '大屏轮播切换时间间隔',
  `view_all` int(1)  NULL COMMENT '轮播视图选择是否全部 0 不是全部  1 全部',
  `carousel_view_select` varchar(512)  NULL COMMENT '轮播视图选择 存ID用逗号间隔',
  `title_one` varchar(32)  NULL COMMENT '标题1',
  `title_two` varchar(32)  NULL COMMENT '标题2',
  `title_three` varchar(32)  NULL COMMENT '标题3',
  `title_four` varchar(32)  NULL COMMENT '标题4',
  `title_five` varchar(32)  NULL COMMENT '标题5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for system
-- ----------------------------
CREATE TABLE IF NOT EXISTS `iotlocation_rule` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `rule_id` int(1) NOT NULL COMMENT '很规则Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for video_map
-- ----------------------------
CREATE TABLE IF NOT EXISTS `iotlocation_video_map` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `map_id` varchar(32) NOT NULL COMMENT '地图id',
  `video_name` varchar(16) NOT NULL COMMENT '摄像头名称',
  `video_id` varchar(32) NOT NULL COMMENT '摄像头id',
  `coorinate_x` double NOT NULL COMMENT '坐标轴x',
  `coorinate_y` double NOT NULL COMMENT '坐标轴y',
  `coorinate_z` double NOT NULL COMMENT '坐标轴z',
  `region_id` varchar(32) NOT NULL COMMENT '关联区域id',
  `create_data` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_data` timestamp NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for card_group
-- ----------------------------
CREATE TABLE IF NOT EXISTS `iotlocation_card_group` (
  `id` varchar(32) NOT NULL,
  `group_name` varchar(32) DEFAULT NULL,
  `shop_id` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table IF NOT EXISTS  `iotlocation_organization` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `organization_name` varchar(64) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `sort` int(3) DEFAULT NULL,
  `organization_level` int(1) DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(64) DEFAULT NULL,
  `rule_id` varchar(512) DEFAULT NULL,
  `help` tinyint(1) DEFAULT '0' COMMENT '一键呼救0 false 不支持，1 true支持',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

/*Table structure for table `Person` */
create table IF NOT EXISTS  `iotlocation_person` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `man_name` varchar(16) DEFAULT NULL,
  `certificate` varchar(20) DEFAULT NULL,
  `man_number` varchar(32) DEFAULT NULL,
  `gender` int(1) DEFAULT 1 COMMENT '0 女  1 男',
  `email` varchar(32) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `organization_id` varchar(32) DEFAULT NULL,
  `top_organization_Id` varchar(32) DEFAULT NULL,
  `organization_name` varchar(64) DEFAULT NULL,
  `photo_address` varchar(512) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `modify_date` varchar(20) DEFAULT NULL,
  `man_type` int(1) DEFAULT 1 COMMENT '1 员工',
  `man_available` int(1) DEFAULT 0 COMMENT '0 未绑定  1 已绑定',
  `terminal_id` varchar(32) DEFAULT NULL,
  `tmn_devsn` varchar(32) DEFAULT NULL,
  `tmn_type` varchar(32) DEFAULT NULL,
  `tmn_oid` varchar(32) DEFAULT NULL,
  `rule_id` varchar(512) DEFAULT NULL,
  `help` tinyint(1) DEFAULT '0' COMMENT '一键呼救0 false 不支持，1 true支持',
  `certificate_type` int(1) DEFAULT NULL COMMENT '证件类型 1 身份证，1 律师证',
  `status` int(1) DEFAULT 1 COMMENT '同步redis状态，0.同步失败，1.已同步',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `person` */

/*Table structure for table `visitor` */
create table IF NOT EXISTS `iotlocation_visitor` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `man_name` varchar(16) DEFAULT NULL,
  `certificate` varchar(20) DEFAULT NULL,
  `gender` int(1) DEFAULT 1 COMMENT '0 女  1 男',
  `email` varchar(32) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `modify_date` varchar(20) DEFAULT NULL,
  `man_type` int(1) DEFAULT 2 COMMENT '2 访客 3 预警人员',
  `add_time` DATETIME COMMENT '加入黑名单时间',
  `exit_status` int(1) DEFAULT 1 COMMENT '0 未退卡 1 已退卡',
  `certificate_type` int(1) DEFAULT NULL COMMENT '证件号:1.身份证，2.律师证',
  `status` int(1) DEFAULT 1 COMMENT '同步redis状态，0.同步失败，1.已同步',
   `photo_address` varchar(512) DEFAULT NULL,
  `tmn_oid_index` varchar(32)  DEFAULT NULL ,
   `tmn_devsn` varchar(32) DEFAULT NULL,
  `tmn_type` varchar(32) DEFAULT NULL,
  `tmn_oid` varchar(32) DEFAULT NULL,
  `rule_id` varchar(512) DEFAULT NULL,
   `help` tinyint(1) DEFAULT '0' COMMENT '一键呼救0 false 不支持，1 true支持',
   `organization_id` varchar(32) DEFAULT NULL,
   `terminal_id` varchar(32) DEFAULT NULL,
  `top_organization_Id` varchar(32) DEFAULT NULL,
  `organization_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for iotlocation_nvr_video
-- ----------------------------
CREATE table IF NOT EXISTS `iotlocation_nvr_video` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `nvr_id` varchar(32) DEFAULT NULL,
  `video_id` varchar(32) DEFAULT NULL,
  `channel_num` int(3) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for iotlocation_nvr
-- ----------------------------
CREATE table IF NOT EXISTS `iotlocation_nvr` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `nvr_name` varchar(16) DEFAULT NULL,
  `source_host` varchar(20) DEFAULT NULL,
  `source_port` varchar(6) DEFAULT NULL,
  `source_username` varchar(20) DEFAULT NULL,
  `source_password` varchar(50) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Data for the table `visitor` */

/*Table structure for table `history_record` */
create table IF NOT EXISTS `iotlocation_history_record` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `visitor_id` varchar(32) NOT NULL,
  `man_type` int(1) DEFAULT 2 COMMENT '2 访客 3 预警人员',
  `enter_time` DATETIME COMMENT '登记时间',
  `exit_time` DATETIME COMMENT '退卡时间',
  `terminal_id` varchar(32) DEFAULT NULL,
  `tmn_devsn` varchar(32) DEFAULT NULL,
  `tmn_type` varchar(32) DEFAULT NULL,
  `tmn_oid` varchar(32) DEFAULT NULL,
  `help` tinyint(1) DEFAULT '0' COMMENT '一键呼救0 false 不支持，1 true支持',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `history_record` */

/*Table structure for table `statistics` */
create table IF NOT EXISTS `iotlocation_statistics` (
  `id` varchar(32) NOT NULL,
  `shop_id` varchar(32) NOT NULL,
  `year` varchar(6)  NOT NULL,
  `month` varchar(4) NOT NULL,
  `day` varchar(4) NOT NULL,
  `visitor_sum` int(2) DEFAULT 0,
  `visitor_exit` int(2) DEFAULT 0,
  `is_verify` int(1) DEFAULT 0 COMMENT '0 未更新 1 已更新',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*Data for the table `statistics` */

/*Table structure for table `terminal` */
create table IF NOT EXISTS `iotlocation_terminal` (
  `id` varchar(32) NOT NULL,
  `scene_id` varchar(32) DEFAULT NULL,
  `tmn_devsn` varchar(32) DEFAULT NULL,
  `tmn_name` varchar(32) DEFAULT NULL,
  `tmn_type` varchar(32) DEFAULT NULL,
  `tmn_oid_index` varchar(32) NOT NULL UNIQUE,
  `state` varchar(10) DEFAULT NULL,
  `tmn_available` int(1) DEFAULT 0 COMMENT '0 未绑定，闸机未启用 1 已绑定，闸机已启用',
  `help` tinyint(1) DEFAULT '1' COMMENT '一键呼救0 false 不支持，1 true支持',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `terminal` */

/*Table structure for table `fence_bind_relation` */
create table IF NOT EXISTS `iotlocation_fence_bind_relation` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `shop_id` varchar(32) NOT NULL,
  `protected_man_id` varchar(32) NOT NULL COMMENT '受保护人员id',
  `fence_id` int(10) DEFAULT 0 COMMENT '动态围栏id',
  `fence_type` int(2) DEFAULT 0 COMMENT '动态围栏类型',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `modify_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `sync_status` int(2) DEFAULT '0' COMMENT '同步通用定位状态，0.同步失败,1.成功，2.数据待删除，3数据待添加, 4人员关系待删除，应用记录不删除, 10未同步',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `fence_bind_relation` */

/*Table structure for table `fence_bind_relation` */
create table IF NOT EXISTS `iotlocation_danger_person` (
  `id` varchar(32) NOT NULL,
  `danger_man_id` varchar(32) NOT NULL COMMENT '危险人员id',
  `danger_man_name` varchar(16) DEFAULT NULL COMMENT '危险人员名称',
  `danger_man_type` int(1) DEFAULT NULL COMMENT '危险人员类型 1 员工 2 访客 3 预警人员',
  `certificate` varchar(20) DEFAULT NULL COMMENT '证件号',
  `certificate_type` int(1) DEFAULT NULL COMMENT '证件号类型:1.身份证，2.律师证',
  `tmn_oid` varchar(32) DEFAULT NULL COMMENT '终端oid',
  `fence_bind_id` varchar(32) DEFAULT NULL COMMENT '动态围栏规则id,对应dynamic_fencerule表中id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `fence_bind_relation` */
/*Table structure for quartz table */
-- DROP TABLE IF EXISTS LOCATION_FIRED_TRIGGERS;
-- DROP TABLE IF EXISTS LOCATION_PAUSED_TRIGGER_GRPS;
-- DROP TABLE IF EXISTS LOCATION_SCHEDULER_STATE;
-- DROP TABLE IF EXISTS LOCATION_LOCKS;
-- DROP TABLE IF EXISTS LOCATION_SIMPLE_TRIGGERS;
-- DROP TABLE IF EXISTS LOCATION_SIMPROP_TRIGGERS;
-- DROP TABLE IF EXISTS LOCATION_CRON_TRIGGERS;
-- DROP TABLE IF EXISTS LOCATION_BLOB_TRIGGERS;
-- DROP TABLE IF EXISTS LOCATION_TRIGGERS;
-- DROP TABLE IF EXISTS LOCATION_JOB_DETAILS;
-- DROP TABLE IF EXISTS LOCATION_CALENDARS;

CREATE TABLE IF NOT EXISTS LOCATION_JOB_DETAILS(
SCHED_NAME VARCHAR(120) NOT NULL,
JOB_NAME VARCHAR(190) NOT NULL,
JOB_GROUP VARCHAR(190) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
JOB_CLASS_NAME VARCHAR(250) NOT NULL,
IS_DURABLE VARCHAR(1) NOT NULL,
IS_NONCONCURRENT VARCHAR(1) NOT NULL,
IS_UPDATE_DATA VARCHAR(1) NOT NULL,
REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(190) NOT NULL,
TRIGGER_GROUP VARCHAR(190) NOT NULL,
JOB_NAME VARCHAR(190) NOT NULL,
JOB_GROUP VARCHAR(190) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
NEXT_FIRE_TIME BIGINT(13) NULL,
PREV_FIRE_TIME BIGINT(13) NULL,
PRIORITY INTEGER NULL,
TRIGGER_STATE VARCHAR(16) NOT NULL,
TRIGGER_TYPE VARCHAR(8) NOT NULL,
START_TIME BIGINT(13) NOT NULL,
END_TIME BIGINT(13) NULL,
CALENDAR_NAME VARCHAR(190) NULL,
MISFIRE_INSTR SMALLINT(2) NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
REFERENCES LOCATION_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_SIMPLE_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(190) NOT NULL,
TRIGGER_GROUP VARCHAR(190) NOT NULL,
REPEAT_COUNT BIGINT(7) NOT NULL,
REPEAT_INTERVAL BIGINT(12) NOT NULL,
TIMES_TRIGGERED BIGINT(10) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_CRON_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(190) NOT NULL,
TRIGGER_GROUP VARCHAR(190) NOT NULL,
CRON_EXPRESSION VARCHAR(120) NOT NULL,
TIME_ZONE_ID VARCHAR(80),
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_SIMPROP_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(190) NOT NULL,
    TRIGGER_GROUP VARCHAR(190) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
    REFERENCES LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_BLOB_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(190) NOT NULL,
TRIGGER_GROUP VARCHAR(190) NOT NULL,
BLOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_CALENDARS (
SCHED_NAME VARCHAR(120) NOT NULL,
CALENDAR_NAME VARCHAR(190) NOT NULL,
CALENDAR BLOB NOT NULL,
PRIMARY KEY (SCHED_NAME,CALENDAR_NAME))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_PAUSED_TRIGGER_GRPS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_GROUP VARCHAR(190) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_FIRED_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
ENTRY_ID VARCHAR(95) NOT NULL,
TRIGGER_NAME VARCHAR(190) NOT NULL,
TRIGGER_GROUP VARCHAR(190) NOT NULL,
INSTANCE_NAME VARCHAR(190) NOT NULL,
FIRED_TIME BIGINT(13) NOT NULL,
SCHED_TIME BIGINT(13) NOT NULL,
PRIORITY INTEGER NOT NULL,
STATE VARCHAR(16) NOT NULL,
JOB_NAME VARCHAR(190) NULL,
JOB_GROUP VARCHAR(190) NULL,
IS_NONCONCURRENT VARCHAR(1) NULL,
REQUESTS_RECOVERY VARCHAR(1) NULL,
PRIMARY KEY (SCHED_NAME,ENTRY_ID))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_SCHEDULER_STATE (
SCHED_NAME VARCHAR(120) NOT NULL,
INSTANCE_NAME VARCHAR(190) NOT NULL,
LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
CHECKIN_INTERVAL BIGINT(13) NOT NULL,
PRIMARY KEY (SCHED_NAME,INSTANCE_NAME))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS LOCATION_LOCKS (
SCHED_NAME VARCHAR(120) NOT NULL,
LOCK_NAME VARCHAR(40) NOT NULL,
PRIMARY KEY (SCHED_NAME,LOCK_NAME))
ENGINE=InnoDB;

CREATE INDEX IDX_LOCATION_J_REQ_RECOVERY ON LOCATION_JOB_DETAILS(SCHED_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_LOCATION_J_GRP ON LOCATION_JOB_DETAILS(SCHED_NAME,JOB_GROUP);

CREATE INDEX IDX_LOCATION_T_J ON LOCATION_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_LOCATION_T_JG ON LOCATION_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_LOCATION_T_C ON LOCATION_TRIGGERS(SCHED_NAME,CALENDAR_NAME);
CREATE INDEX IDX_LOCATION_T_G ON LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_LOCATION_T_STATE ON LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_STATE);
CREATE INDEX IDX_LOCATION_T_N_STATE ON LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_LOCATION_T_N_G_STATE ON LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_LOCATION_T_NEXT_FIRE_TIME ON LOCATION_TRIGGERS(SCHED_NAME,NEXT_FIRE_TIME);
CREATE INDEX IDX_LOCATION_T_NFT_ST ON LOCATION_TRIGGERS(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
CREATE INDEX IDX_LOCATION_T_NFT_MISFIRE ON LOCATION_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
CREATE INDEX IDX_LOCATION_T_NFT_ST_MISFIRE ON LOCATION_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
CREATE INDEX IDX_LOCATION_T_NFT_ST_MISFIRE_GRP ON LOCATION_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

CREATE INDEX IDX_LOCATION_FT_TRIG_INST_NAME ON LOCATION_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME);
CREATE INDEX IDX_LOCATION_FT_INST_JOB_REQ_RCVRY ON LOCATION_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_LOCATION_FT_J_G ON LOCATION_FIRED_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_LOCATION_FT_JG ON LOCATION_FIRED_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_LOCATION_FT_T_G ON LOCATION_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_LOCATION_FT_TG ON LOCATION_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);

commit;

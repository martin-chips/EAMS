/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.26 : Database - eams
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eams` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `eams`;

/*Table structure for table `eams_config` */

DROP TABLE IF EXISTS `eams_config`;

CREATE TABLE `eams_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(512) DEFAULT NULL COMMENT '配置的key',
  `config_value` varchar(512) DEFAULT NULL COMMENT '配置的value',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='评优评奖配置';

/*Data for the table `eams_config` */

insert  into `eams_config`(`config_id`,`config_key`,`config_value`,`remark`,`create_by`,`create_time`,`update_by`,`update_date`) values
(1,'eams_student_start_time',NULL,'学生填报日期',NULL,NULL,NULL,NULL),
(2,'eams_student_end_time',NULL,'学生填报结束时间',NULL,NULL,NULL,NULL),
(3,'eams_review_start_time',NULL,'学生填报审核开始时间',NULL,NULL,NULL,NULL),
(4,'eams_review_end_time',NULL,'学生填报审核结束时间',NULL,NULL,NULL,NULL),
(5,'eams_urgent',NULL,'紧急暂停系统',NULL,NULL,NULL,NULL);

/*Table structure for table `eams_policy` */

DROP TABLE IF EXISTS `eams_policy`;

CREATE TABLE `eams_policy` (
  `pol_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pol_name` varchar(128) DEFAULT '' COMMENT '策略的名称',
  `ancestors` varchar(128) DEFAULT '' COMMENT '祖级路径\n',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级',
  `order_num` int(11) DEFAULT '0' COMMENT '排序标识',
  `score` decimal(10,0) DEFAULT '0' COMMENT '分数，可以为小数',
  `input` char(1) DEFAULT '0' COMMENT '可以输入项目',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `dept_id` mediumtext COMMENT '指定该策略由哪个部门审核',
  `remark` varchar(512) DEFAULT '' COMMENT '备注',
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='策略表';

/*Data for the table `eams_policy` */

insert  into `eams_policy`(`pol_id`,`pol_name`,`ancestors`,`parent_id`,`order_num`,`score`,`input`,`status`,`dept_id`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`) values
(151,'2019年评优评奖','0',0,1,0,'1','0',NULL,'','admin','2019-04-25 20:12:38','admin','2019-04-25 20:39:57'),
(152,'思想品德素质','0,151',151,2,0,'1','0',NULL,'','admin','2019-04-25 20:12:51','admin','2019-05-10 13:21:35'),
(156,'思想政治表现','0,151,152',152,2,0,'1','0',NULL,'','admin','2019-04-25 20:24:53','admin','2019-04-25 20:40:34'),
(157,'参加入党积极分子培训班并结业','0,151,152,156',156,1,1,'0','0',NULL,'由学生支部提供证明材料。','admin','2019-04-25 20:40:49',NULL,NULL),
(158,'参加党员发展对象培训班并结业','0,151,152,156',156,2,2,'0','0',NULL,'由学生支部提供证明材料。','admin','2019-04-25 20:41:05',NULL,NULL),
(159,'担任学院分团委学生会、艺术团、社联主席团和秘书团成员','0,151,152,156',156,3,4,'0','0',NULL,'校级和院级学生干部需提供学校或学院出具的证明材料， 学生干部累计加分不超过5分。','admin','2019-04-25 20:41:26',NULL,NULL),
(160,'担任学院分团委学生会部长','0,151,152,156',156,5,3,'0','0',NULL,'校级和院级学生干部需提供学校或学院出具的证明材料， 学生干部累计加分不超过5分。','admin','2019-04-25 20:41:44',NULL,NULL),
(161,'个人品德修养','0,151,152',152,3,0,'1','0',NULL,'','admin','2019-04-25 20:42:11',NULL,NULL),
(162,'参加志愿服务活动','0,151,152,161',161,3,1,'0','0',NULL,'由学院青年志愿者协会提供证明材料，每8个小时加1分。（此项最多累加4分）。','admin','2019-04-25 20:42:26',NULL,NULL),
(163,'参加无偿献血活动','0,151,152,161',161,5,1,'0','0',NULL,'需提供献血证。','admin','2019-04-25 20:42:42',NULL,NULL),
(164,'获得院级或校级文明寝室','0,151,152,161',161,6,1,'0','0',NULL,'需提供获奖证书。相同项目不累计加分，只记最高分。','admin','2019-04-25 20:42:59',NULL,NULL),
(165,'遵纪守法情况','0,151,152',152,3,0,'1','0',NULL,'以学院或学校公示文件为准。','admin','2019-04-25 20:43:16','admin','2019-04-25 20:43:41'),
(166,'考试作弊受到学校处分','0,151,152,165',165,3,-10,'0','0',NULL,'','admin','2019-04-25 20:43:34',NULL,NULL),
(167,'旷课严重受到学校处分','0,151,152,165',165,3,-6,'0','0',NULL,'','admin','2019-04-25 20:43:53',NULL,NULL),
(168,'专业素质','0,151',151,3,0,'1','0',NULL,'是否参赛以组织单位或学工办出具的参赛名单为准。\r\n获奖情况需提供获奖证书或相关证明材料。同一竞赛不得累计加分，只记最高得分。参加竞赛未获奖的，根据参赛次数最高可累加1分。\r\n','admin','2019-04-25 20:44:13',NULL,NULL),
(169,'参加院级以上学科竞赛','0,151,168',168,1,0,'0','0',NULL,'','admin','2019-04-25 20:44:27',NULL,NULL),
(170,'获得国家级特等奖、金奖或一等奖','0,151,168',168,2,8,'0','0',NULL,'','admin','2019-04-25 20:44:38',NULL,NULL),
(171,'创新创业素质','0,151',151,3,0,'1','0',NULL,'','admin','2019-04-25 20:45:00',NULL,NULL),
(172,'创新能力','0,151,171',171,1,1,'1','0',NULL,'','admin','2019-04-25 20:45:13','admin','2019-04-25 20:46:02'),
(173,'申报学校创新训练计划项目','0,151,171,172',172,3,1,'0','0',NULL,'以学院提供的申报名单为准。','admin','2019-04-25 20:46:20','admin','2019-05-11 08:16:12');

/*Table structure for table `eams_profession` */

DROP TABLE IF EXISTS `eams_profession`;

CREATE TABLE `eams_profession` (
  `prof_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prof_name` varchar(128) DEFAULT NULL COMMENT '当前级的名称',
  `order_num` int(11) DEFAULT NULL COMMENT '当前级的排序',
  `leader` varchar(128) DEFAULT NULL COMMENT '当前级的管理员',
  `phone_num` varchar(128) DEFAULT NULL COMMENT '当前级的管理员的联系方式',
  `status` char(1) DEFAULT NULL COMMENT '当前级的状态',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级id',
  `ancestors` varchar(128) DEFAULT NULL COMMENT '该级路径',
  `email` varchar(128) DEFAULT NULL COMMENT '当前级的管理员的电子邮箱地址',
  `type` varchar(128) DEFAULT NULL COMMENT '当前级的类型：1表示学院，2表示年级，3表示专业，4表示班级',
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`prof_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='学院，年级，专业，班级的联动表';

/*Data for the table `eams_profession` */

insert  into `eams_profession`(`prof_id`,`prof_name`,`order_num`,`leader`,`phone_num`,`status`,`parent_id`,`ancestors`,`email`,`type`,`create_by`,`create_time`,`update_by`,`update_time`) values
(2,'15级',1,NULL,NULL,'0',100,'0,100',NULL,NULL,NULL,'2019-04-16 09:56:25','admin','2019-04-17 11:03:27'),
(3,'计算机科学与技术',1,NULL,NULL,'0',2,'0,100,2',NULL,NULL,NULL,'2019-04-16 09:56:28','admin','2019-04-17 11:25:13'),
(4,'1班',11,NULL,NULL,'0',3,'0,100,2,3',NULL,NULL,NULL,'2019-04-16 09:56:31','admin','2019-04-17 11:24:24'),
(5,'2班',1,'测试','18582872818','0',3,'0,100,2,3','111@qq.com',NULL,NULL,'2019-04-16 09:56:32','admin','2019-04-17 10:59:39'),
(16,'软件工程',2,NULL,NULL,'0',2,'0,100,2',NULL,NULL,'admin','2019-04-17 10:20:37','admin','2019-04-17 11:22:14'),
(100,'成都大学信息科学与工程学院',1,'无','1111','0',0,'0',NULL,NULL,NULL,'2019-04-16 09:56:32','admin','2019-04-17 10:15:29');

/*Table structure for table `eams_record` */

DROP TABLE IF EXISTS `eams_record`;

CREATE TABLE `eams_record` (
  `stu_id` bigint(20) NOT NULL COMMENT '学生的id',
  `rule_id` bigint(20) NOT NULL COMMENT '规则的id',
  `pol_id` bigint(20) NOT NULL COMMENT '策略的id',
  `pol_stu_score` decimal(10,0) DEFAULT NULL COMMENT '该项策略的学生的自主评分',
  `pol_stu_credence` varchar(256) DEFAULT NULL COMMENT '策略凭证的证明,图像地址',
  `pol_student_credence_remark` varchar(512) DEFAULT '' COMMENT '凭证的说明',
  `pol_review_score` decimal(10,0) DEFAULT '0' COMMENT '该项目管理员审核后的得分',
  `pol_review_remark` varchar(512) DEFAULT '' COMMENT '该项目管理员审核后的备注',
  `reviewer_name` varchar(128) DEFAULT NULL COMMENT '该项目审核者的名称',
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`stu_id`,`rule_id`,`pol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评优评奖填写记录';

/*Data for the table `eams_record` */

insert  into `eams_record`(`stu_id`,`rule_id`,`pol_id`,`pol_stu_score`,`pol_stu_credence`,`pol_student_credence_remark`,`pol_review_score`,`pol_review_remark`,`reviewer_name`,`create_by`,`create_time`,`update_by`,`update_time`) values
(4,6,157,10,'http://bianxiaofeng.com/front/images/logo.png','如图',10,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,158,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,159,0,'http://bianxiaofeng.com/front/images/leaveComment-bg.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,160,15,'http://bianxiaofeng.com/front/images/leaveComment-bg.png','如图',15,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,162,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,163,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,164,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,166,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,167,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,169,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(4,6,170,0,'http://bianxiaofeng.com/front/images/logo.png','如图',0,'无误','admin','4',NULL,'admin','2019-05-11 08:26:00'),
(6,6,157,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,158,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,159,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,160,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,162,10,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,163,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,164,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,166,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,167,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,169,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,170,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL),
(6,6,173,NULL,NULL,'',0,'',NULL,'6','2019-05-11 08:17:04',NULL,NULL);

/*Table structure for table `eams_rule` */

DROP TABLE IF EXISTS `eams_rule`;

CREATE TABLE `eams_rule` (
  `rule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_time` datetime DEFAULT NULL COMMENT '开启时间',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  `pol_id` int(11) DEFAULT NULL COMMENT '具体的策略的id',
  `rule_name` varchar(128) DEFAULT NULL COMMENT '规则名字',
  `status` char(1) DEFAULT NULL COMMENT '规则状态',
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='评优评奖规则';

/*Data for the table `eams_rule` */

insert  into `eams_rule`(`rule_id`,`open_time`,`close_time`,`pol_id`,`rule_name`,`status`,`create_by`,`create_time`,`update_by`,`update_time`) values
(5,'2019-04-02 12:00:00','2019-05-24 12:00:00',129,'2018年的评优评奖','0',NULL,'2019-04-18 10:43:31',NULL,'2019-04-25 19:46:40'),
(6,'2019-04-01 12:00:00','2019-05-09 12:00:00',151,'2019年评优评奖','0',NULL,'2019-04-20 13:46:00',NULL,'2019-04-25 20:46:30');

/*Table structure for table `eams_student` */

DROP TABLE IF EXISTS `eams_student`;

CREATE TABLE `eams_student` (
  `stu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(128) DEFAULT NULL COMMENT '学生的名称',
  `stu_num` varchar(128) DEFAULT NULL COMMENT '学号',
  `prof_id` bigint(20) DEFAULT NULL COMMENT '所属班级的id',
  `sex` char(1) DEFAULT NULL COMMENT '学生性别',
  `email` varchar(255) DEFAULT NULL COMMENT '学生邮箱',
  `phone_num` varchar(128) DEFAULT NULL COMMENT '学生的电话',
  `password` varchar(255) DEFAULT NULL COMMENT '学生登录的密码',
  `id_card` varchar(255) DEFAULT NULL COMMENT '学生的身份证号码',
  `status` char(1) DEFAULT NULL COMMENT '学生的状态：1表示正常，0表示锁定',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码的盐',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(128) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `eams_student_eams_profession_prof_id_fk` (`prof_id`),
  CONSTRAINT `eams_student_eams_profession_prof_id_fk` FOREIGN KEY (`prof_id`) REFERENCES `eams_profession` (`prof_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='学生表';

/*Data for the table `eams_student` */

insert  into `eams_student`(`stu_id`,`stu_name`,`stu_num`,`prof_id`,`sex`,`email`,`phone_num`,`password`,`id_card`,`status`,`salt`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`) values
(2,'bianxiaofeng','1212131',5,'0','12312@sss121.com','21212131','123456','2312','0',NULL,NULL,NULL,NULL,NULL,NULL),
(4,'边小丰','123',5,'0','5111@a115.com','1515151','123456','123','0',NULL,NULL,NULL,'2019-04-17 10:22:20',NULL,'2019-04-27 19:43:08'),
(5,'边小丰答辩测试账号','201510411201',5,'0','bianixaofeng@sohu.com','18582872818','123456','510821199608050011','0',NULL,NULL,NULL,'2019-05-11 01:36:42',NULL,NULL),
(6,'边小丰测试账号','123456',16,'0','test@test.com','15985552323','admin123','123456','0',NULL,NULL,NULL,'2019-05-11 08:14:48',NULL,NULL);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','初始化密码 123456');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values
(100,0,'0','成都大学信息科学与工程学院',0,'测试','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-17 11:17:26'),
(101,100,'0,100','学生会',1,'雍容','15888888888','yongrong@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:33:12'),
(102,100,'0,100','教师',2,'肖晓琼','15888888888','xiaoxiaoqiong@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-17 11:17:26'),
(103,101,'0,100,101','科文部',1,'边小丰','15888888888','bianxiaofeng@sohhu.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:30:02'),
(104,101,'0,100,101','办公室',2,'测试','15888888888','bangonsghi@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:30:31'),
(105,101,'0,100,101','创业中心',3,'测试','15888888888','chuangyezhongxin@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:32:32'),
(106,101,'0,100,101','生活部',4,'生活部','15888888888','shenghuobu@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:32:52'),
(107,101,'0,100,101','组织部',5,'组织部','15888888888','zhuzhibu@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:33:12'),
(108,102,'0,100,102','普通教师',1,'测试教师','15888888888','putongjiaoshi@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:34:56'),
(109,102,'0,100,102','学工办',2,'学工办','15888888888','xuegongban@eams.com','0','0','admin','2018-03-16 11:33:00','admin','2019-04-15 20:35:22'),
(200,102,'0,100,102','超级管理员',3,'边小丰','18582872818','bianxiaofeng@sohu.com','0','0','admin','2019-04-16 23:04:26','admin','2019-04-17 11:17:26');

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别男'),
(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别女'),
(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别未知'),
(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','显示菜单'),
(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','隐藏菜单'),
(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),
(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),
(10,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认是'),
(11,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认否'),
(12,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知'),
(13,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','公告'),
(14,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(15,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','关闭状态'),
(16,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','新增操作'),
(17,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','修改操作'),
(18,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','删除操作'),
(19,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','授权操作'),
(20,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导出操作'),
(21,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导入操作'),
(22,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','强退操作'),
(23,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','生成操作'),
(24,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','清空操作'),
(25,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),
(26,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户性别列表'),
(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单状态列表'),
(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统开关列表'),
(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务状态列表'),
(5,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统是否列表'),
(6,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知类型列表'),
(7,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知状态列表'),
(8,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作类型列表'),
(9,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录状态列表');

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`login_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values
(1,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-20 16:09:02'),
(2,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-20 16:09:16'),
(3,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-20 16:14:00'),
(4,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-20 17:32:16'),
(5,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-20 17:32:18'),
(6,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-20 21:26:30'),
(7,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-20 21:28:01'),
(8,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-20 21:28:03'),
(9,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-22 17:28:32'),
(10,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-22 19:12:25'),
(11,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-23 16:58:55'),
(12,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-23 17:04:29'),
(13,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-24 15:21:19'),
(14,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-24 17:29:45'),
(15,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-25 18:00:03'),
(16,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-25 19:08:33'),
(17,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-25 20:12:17'),
(18,'notExistUser','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-26 11:42:54'),
(19,'notExistUser','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-26 11:42:59'),
(20,'notExistUser','127.0.0.1','内网IP','Chrome','Windows 10','1','用户不存在/密码错误','2019-04-26 11:43:31'),
(21,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 11:44:06'),
(22,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 11:45:49'),
(23,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:44:29'),
(24,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 14:44:45'),
(25,'test','127.0.0.1','内网IP','Chrome','Windows 10','1','用户已封禁，请联系管理员','2019-04-26 14:44:53'),
(26,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:46:34'),
(27,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 14:48:01'),
(28,'test','127.0.0.1','内网IP','Chrome','Windows 10','1','密码输入错误1次','2019-04-26 14:48:07'),
(29,'test','127.0.0.1','内网IP','Chrome','Windows 10','1','密码输入错误2次','2019-04-26 14:48:12'),
(30,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:48:27'),
(31,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 14:48:42'),
(32,'test','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:48:48'),
(33,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:50:38'),
(34,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 14:51:14'),
(35,'test','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:51:20'),
(36,'test','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 14:58:51'),
(37,'test','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-26 14:58:57'),
(38,'test','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:59:01'),
(39,'test','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 14:59:05'),
(40,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 14:59:08'),
(41,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-26 14:59:21'),
(42,'test','127.0.0.1','内网IP','Chrome','Windows 10','1','用户已封禁，请联系管理员','2019-04-26 14:59:27'),
(43,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 16:23:59'),
(44,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-26 16:46:19'),
(45,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-27 11:37:55'),
(46,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-27 12:35:40'),
(47,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-27 15:47:51'),
(48,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-27 15:59:18'),
(49,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-27 16:31:33'),
(50,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 10:42:29'),
(51,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 11:22:55'),
(52,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-28 11:42:57'),
(53,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 11:42:59'),
(54,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-28 12:23:06'),
(55,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 12:23:13'),
(56,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-28 12:29:51'),
(57,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 12:29:57'),
(58,'admin','66.42.100.95','加利福尼亚 XX','Chrome','Windows 10','0','登录成功','2019-04-28 12:48:38'),
(59,'admin','101.206.169.229','四川 成都','Apple WebKit','Mac OS X (iPhone)','0','登录成功','2019-04-28 13:07:24'),
(60,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 15:44:29'),
(61,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-04-28 15:47:35'),
(62,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-04-28 16:01:47'),
(63,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 16:01:48'),
(64,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 16:10:17'),
(65,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-04-28 17:10:37'),
(66,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-03 11:40:42'),
(67,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-03 13:40:01'),
(68,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-03 14:33:01'),
(69,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 12:10:34'),
(70,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-08 12:24:25'),
(71,'kewenbu','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 12:24:31'),
(72,'kewenbu','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-08 12:24:36'),
(73,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 12:24:39'),
(74,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-08 12:25:01'),
(75,'kewenbu','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 12:25:08'),
(76,'kewenbu','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-08 12:25:17'),
(77,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 12:25:21'),
(78,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-08 12:25:55'),
(79,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-05-08 13:23:51'),
(80,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 13:23:56'),
(81,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 13:37:36'),
(82,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 13:44:35'),
(83,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 13:58:25'),
(84,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 14:01:43'),
(85,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-08 22:53:58'),
(86,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-08 22:54:15'),
(87,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-09 01:20:25'),
(88,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-09 22:16:20'),
(89,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-09 22:52:04'),
(90,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-10 13:21:03'),
(91,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-10 19:13:50'),
(92,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 01:08:12'),
(93,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 01:32:22'),
(94,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 01:41:07'),
(95,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 08:13:08'),
(96,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-11 08:13:20'),
(97,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-05-11 08:13:37'),
(98,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-05-11 08:13:40'),
(99,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-05-11 08:13:43'),
(100,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 08:13:47'),
(101,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-11 08:14:55'),
(102,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 08:15:07'),
(103,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-11 08:15:18'),
(104,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 08:15:48'),
(105,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 08:19:30'),
(106,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码错误','2019-05-11 08:45:55'),
(107,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 08:45:58'),
(108,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2019-05-11 08:56:44'),
(109,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 08:58:39'),
(110,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-05-11 23:53:30');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2076 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`menu_type`,`visible`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'系统管理',0,10,'#','M','0',NULL,'fa fa-gear','admin','2018-03-16 11:33:00','admin','2019-03-16 17:00:22','系统管理目录'),
(2,'系统监控',0,9,'#','M','0',NULL,'fa fa-video-camera','admin','2018-03-16 11:33:00','admin','2019-03-16 17:00:31','系统监控目录'),
(100,'用户管理',1,1,'/system/user','C','0','system:user:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户管理菜单'),
(101,'角色管理',1,2,'/system/role','C','0','system:role:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','角色管理菜单'),
(102,'菜单管理',1,3,'/system/menu','C','0','system:menu:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单管理菜单'),
(105,'字典管理',1,6,'/system/dict','C','0','system:dict:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','字典管理菜单'),
(106,'参数设置',1,7,'/system/config','C','0','system:config:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','参数设置菜单'),
(107,'通知公告',1,8,'/system/notice','C','0','system:notice:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知公告菜单'),
(108,'日志管理',0,9,'#','M','0',NULL,'fa fa-at','admin','2018-03-16 11:33:00','admin','2019-03-16 17:41:31','日志管理菜单'),
(109,'在线用户',2,1,'/monitor/online','C','0','monitor:online:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','在线用户菜单'),
(111,'数据监控',2,3,'/monitor/data','C','0','monitor:data:view','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','数据监控菜单'),
(115,'系统接口',2,3,'/monitor/swagger','C','0','monitor:swagger:view','#','admin','2018-03-16 11:33:00','admin','2019-03-15 18:06:14','系统接口菜单'),
(500,'操作日志',108,1,'/log/operlog','C','0','log:operlog:view','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:12:30','操作日志菜单'),
(501,'登录日志',108,2,'/log/logininfor','C','0','log:logininfor:view','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:12:43','登录日志菜单'),
(1000,'用户查询',100,1,'#','F','0','system:user:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1001,'用户新增',100,2,'#','F','0','system:user:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1002,'用户修改',100,3,'#','F','0','system:user:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1003,'用户删除',100,4,'#','F','0','system:user:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1004,'用户导出',100,5,'#','F','0','system:user:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1005,'用户导入',100,6,'#','F','0','system:user:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1006,'重置密码',100,7,'#','F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1007,'角色查询',101,1,'#','F','0','system:role:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1008,'角色新增',101,2,'#','F','0','system:role:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1009,'角色修改',101,3,'#','F','0','system:role:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1010,'角色删除',101,4,'#','F','0','system:role:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1011,'角色导出',101,5,'#','F','0','system:role:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1012,'菜单查询',102,1,'#','F','0','system:menu:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1013,'菜单新增',102,2,'#','F','0','system:menu:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1014,'菜单修改',102,3,'#','F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1015,'菜单删除',102,4,'#','F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1025,'字典查询',105,1,'#','F','0','system:dict:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1026,'字典新增',105,2,'#','F','0','system:dict:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1027,'字典修改',105,3,'#','F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1028,'字典删除',105,4,'#','F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1029,'字典导出',105,5,'#','F','0','system:dict:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1030,'参数查询',106,1,'#','F','0','system:config:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1031,'参数新增',106,2,'#','F','0','system:config:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1032,'参数修改',106,3,'#','F','0','system:config:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1033,'参数删除',106,4,'#','F','0','system:config:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1034,'参数导出',106,5,'#','F','0','system:config:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1035,'公告查询',107,1,'#','F','0','system:notice:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1036,'公告新增',107,2,'#','F','0','system:notice:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1037,'公告修改',107,3,'#','F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1038,'公告删除',107,4,'#','F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1039,'操作查询',500,1,'#','F','0','log:operlog:list','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:12:54',NULL),
(1040,'操作删除',500,2,'#','F','0','log:operlog:remove','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:13:03',NULL),
(1041,'详细信息',500,3,'#','F','0','log:operlog:detail','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:13:12',NULL),
(1042,'日志导出',500,4,'#','F','0','log:operlog:export','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:13:22',NULL),
(1043,'登录查询',501,1,'#','F','0','log:logininfor:list','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:13:32',NULL),
(1044,'登录删除',501,2,'#','F','0','log:logininfor:remove','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:13:43',NULL),
(1045,'日志导出',501,3,'#','F','0','log:logininfor:export','#','admin','2018-03-16 11:33:00','admin','2019-03-16 19:13:55',NULL),
(1046,'在线查询',109,1,'#','F','0','monitor:online:list','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1047,'批量强退',109,2,'#','F','0','monitor:online:batchForceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(1048,'单条强退',109,3,'#','F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',NULL),
(2052,'部门管理',1,4,'/system/dept','C','0','system:dept:view','#','admin','2019-04-15 16:23:03','',NULL,''),
(2053,'部门查询',2052,1,'#','F','0','system:dept:list','#','admin','2019-04-15 16:23:21','',NULL,''),
(2054,'部门添加',2052,2,'#','F','0','system:dept:add','#','admin','2019-04-15 16:23:46','',NULL,''),
(2055,'部门修改',2052,3,'#','F','0','system:dept:edit','#','admin','2019-04-15 16:24:01','',NULL,''),
(2056,'部门删除',2052,4,'#','F','0','system:dept:remove','#','admin','2019-04-15 16:24:31','',NULL,''),
(2063,'数据维护',0,8,'#','M','0','','fa fa-bar-chart-o','admin','2019-04-16 11:03:59','admin','2019-04-16 11:04:27',''),
(2064,'班级管理',2063,1,'/maintenance/profession','C','0','maintenance:profession:view','#','admin','2019-04-16 11:06:11','',NULL,''),
(2065,'学生管理',2063,2,'/maintenance/student','C','0','maintenance:student:view','#','admin','2019-04-16 11:06:36','',NULL,''),
(2066,'策略管理',2063,3,'maintenance/policy','C','0','maintenance:policy:view','#','admin','2019-04-17 14:53:05','',NULL,''),
(2067,'规则管理',2063,4,'/maintenance/rule','C','0','maintenance:rule:view','#','admin','2019-04-17 20:35:16','',NULL,''),
(2068,'评优评奖',0,2,'#','M','0',NULL,'fa fa-bath','admin','2019-04-18 16:35:20','',NULL,''),
(2070,'参评记录',2068,2,'/evaluation/record','C','0','evaluation:record:view','#','admin','2019-04-18 17:00:45','admin','2019-04-27 16:37:47',''),
(2071,'统计图表',0,8,'#','M','0','','fa fa-bar-chart-o','admin','2019-04-28 12:06:09','admin','2019-04-28 12:06:41',''),
(2072,'系统信息',2071,1,'/charts/server','C','0','charts:server:view','#','admin','2019-04-28 12:08:36','',NULL,''),
(2073,'记录查询',2070,1,'#','F','0','evaluation:record:list','#','admin','2019-05-08 15:39:39','',NULL,''),
(2074,'记录详细',2070,2,'#','F','0','evaluation:record:detail','#','admin','2019-05-08 15:40:07','',NULL,''),
(2075,'导出数据',2070,3,'#','F','0','evaluation:record:export','#','admin','2019-05-08 15:40:31','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'温馨提醒','2','新一轮的评优评奖开启了，请同学们和各部门做好准备。','0','admin','2018-03-16 11:33:00','admin','2019-04-28 16:10:54','管理员'),
(2,'维护通知','1','本周天会对系统进行维护，届时评<b><u style=\"color: rgb(255, 0, 0);\">优评奖模块会受到影响</u></b>，<span style=\"background-color: rgb(255, 255, 0);\">其他模块正常运行</span>。','0','admin','2018-03-16 11:33:00','admin','2019-05-03 11:41:08','管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`status`,`error_msg`,`oper_time`) values
(1,'操作日志',9,'com.dimple.web.controller.log.SysOperlogController.clean()',1,'admin','超级管理员','/log/operlog/clean','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-19 17:35:44'),
(2,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2019年的评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-02 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-24 12:00:00\" ],\r\n  \"polId\" : [ \"103\" ],\r\n  \"ruleId\" : [ \"5\" ]\r\n}',0,NULL,'2019-04-19 17:45:11'),
(3,'用户管理',2,'com.dimple.web.controller.maintenance.EamsStudentController.editSave()',1,'admin','超级管理员','/maintenance/student/edit','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"16\", \"\" ],\r\n  \"stuName\" : [ \"\", \"bianxiaofeng\" ],\r\n  \"profName\" : [ \"软件工程\" ],\r\n  \"stuNum\" : [ \"123\" ],\r\n  \"idCard\" : [ \"123\" ],\r\n  \"phoneNum\" : [ \"1515151\" ],\r\n  \"email\" : [ \"5111@a115.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-20 13:19:28'),
(4,'用户管理',2,'com.dimple.web.controller.maintenance.EamsStudentController.editSave()',1,'admin','超级管理员','/maintenance/student/edit','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"16\", \"\" ],\r\n  \"stuName\" : [ \"\", \"bianxiaofeng\" ],\r\n  \"profName\" : [ \"软件工程\" ],\r\n  \"stuNum\" : [ \"123\" ],\r\n  \"idCard\" : [ \"123\" ],\r\n  \"phoneNum\" : [ \"1515151\" ],\r\n  \"email\" : [ \"5111@a115.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-20 13:19:37'),
(5,'用户管理',2,'com.dimple.web.controller.maintenance.EamsStudentController.editSave()',1,'admin','超级管理员','/maintenance/student/edit','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"16\", \"\" ],\r\n  \"stuId\" : [ \"\" ],\r\n  \"stuName\" : [ \"bianxiaofeng\" ],\r\n  \"profName\" : [ \"软件工程\" ],\r\n  \"stuNum\" : [ \"123\" ],\r\n  \"idCard\" : [ \"123\" ],\r\n  \"phoneNum\" : [ \"1515151\" ],\r\n  \"email\" : [ \"5111@a115.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-20 13:20:44'),
(6,'用户管理',2,'com.dimple.web.controller.maintenance.EamsStudentController.editSave()',1,'admin','超级管理员','/maintenance/student/edit','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"16\", \"\" ],\r\n  \"stuId\" : [ \"4\" ],\r\n  \"stuName\" : [ \"bianxiaofeng\" ],\r\n  \"profName\" : [ \"软件工程\" ],\r\n  \"stuNum\" : [ \"123\" ],\r\n  \"idCard\" : [ \"123\" ],\r\n  \"phoneNum\" : [ \"1515151\" ],\r\n  \"email\" : [ \"5111@a115.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-20 13:21:19'),
(7,'规则管理',1,'com.dimple.web.controller.maintenance.EamsRuleController.addSave()',1,'admin','超级管理员','/maintenance/rule/add','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2019年评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-01 00:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-09 00:00:00\" ],\r\n  \"polId\" : [ \"103\" ]\r\n}',0,NULL,'2019-04-20 13:46:01'),
(8,'用户管理',2,'com.dimple.web.controller.system.SysUserController.changeStatus()',1,'admin','超级管理员','/system/user/changeStatus','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}',1,'不允许修改超级管理员用户','2019-04-20 13:51:38'),
(9,'用户管理',2,'com.dimple.web.controller.system.SysUserController.changeStatus()',1,'admin','超级管理员','/system/user/changeStatus','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"status\" : [ \"1\" ]\r\n}',0,NULL,'2019-04-20 13:51:41'),
(10,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2019年的评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-02 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-24 12:00:00\" ],\r\n  \"polId\" : [ \"100\" ],\r\n  \"ruleId\" : [ \"5\" ]\r\n}',0,NULL,'2019-04-20 21:42:11'),
(11,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2018年的评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-02 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-24 12:00:00\" ],\r\n  \"polId\" : [ \"100\" ],\r\n  \"ruleId\" : [ \"5\" ]\r\n}',0,NULL,'2019-04-20 21:42:34'),
(12,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2018年的评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-02 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-24 12:00:00\" ],\r\n  \"polId\" : [ \"103\" ],\r\n  \"ruleId\" : [ \"5\" ]\r\n}',0,NULL,'2019-04-20 21:42:40'),
(13,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2018年的评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-02 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-24 12:00:00\" ],\r\n  \"polId\" : [ \"100\" ],\r\n  \"ruleId\" : [ \"5\" ]\r\n}',0,NULL,'2019-04-20 21:43:12'),
(14,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2062','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-22 19:16:29'),
(15,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2061','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-22 19:16:37'),
(16,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2060','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-22 19:16:48'),
(17,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2059','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-22 19:16:57'),
(18,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2058','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-22 19:17:15'),
(19,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2057','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-22 19:17:20'),
(20,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2009','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:04:49'),
(21,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2010','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:04:56'),
(22,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2011','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:02'),
(23,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2012','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:08'),
(24,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2008','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:14'),
(25,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/1049','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:23'),
(26,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/1050','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:28'),
(27,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/1051','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:34'),
(28,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/1052','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:39'),
(29,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/1053','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:48'),
(30,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/1054','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:05:53'),
(31,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/1055','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:06:27'),
(32,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/110','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-23 17:06:35'),
(33,'重置密码',2,'com.dimple.web.controller.system.SysUserController.resetPwd()',1,'admin','超级管理员','/system/user/resetPwd/1','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-24 15:30:33'),
(34,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"polId\" : [ \"103\" ],\r\n  \"polName\" : [ \"2019年评优评奖\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-24 17:30:19'),
(35,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2018年的评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-02 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-24 12:00:00\" ],\r\n  \"polId\" : [ \"103\" ],\r\n  \"ruleId\" : [ \"5\" ]\r\n}',0,NULL,'2019-04-25 19:09:37'),
(36,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2019年评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-01 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-09 12:00:00\" ],\r\n  \"polId\" : [ \"103\" ],\r\n  \"ruleId\" : [ \"6\" ]\r\n}',0,NULL,'2019-04-25 19:10:06'),
(37,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"polId\" : [ \"103\" ],\r\n  \"polName\" : [ \"2019年评优评奖\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:12:06'),
(38,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"103\" ],\r\n  \"polId\" : [ \"104\" ],\r\n  \"polName\" : [ \"思想品德素质\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:12:10'),
(39,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"polId\" : [ \"103\" ],\r\n  \"polName\" : [ \"2019年评优评奖\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:12:34'),
(40,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"测试\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"11\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',1,'','2019-04-25 19:19:44'),
(41,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"测试\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"11\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',1,'','2019-04-25 19:19:55'),
(42,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"测试\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"11\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:20:48'),
(43,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"125\" ],\r\n  \"polName\" : [ \"121\" ],\r\n  \"orderNum\" : [ \"132\" ],\r\n  \"score\" : [ \"01\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:21:05'),
(44,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"126\" ],\r\n  \"polName\" : [ \"测试\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:30:05'),
(45,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/127','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 19:30:14'),
(46,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/126','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 19:30:18'),
(47,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"2019年学生综合素质测评\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:36:22'),
(48,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/125','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 19:37:19'),
(49,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"128\" ],\r\n  \"polName\" : [ \"思想品德素质\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:37:36'),
(50,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"129\" ],\r\n  \"polName\" : [ \"思想政治表现\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:37:47'),
(51,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"130\" ],\r\n  \"polName\" : [ \"参加入党积极分子培训班并结业\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:37:59'),
(52,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"130\" ],\r\n  \"polId\" : [ \"131\" ],\r\n  \"polName\" : [ \"参加入党积极分子培训班并结业\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"1.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"由学生支部提供证明材料。\" ]\r\n}',0,NULL,'2019-04-25 19:38:17'),
(53,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"130\" ],\r\n  \"polName\" : [ \"参加党员发展对象培训班并结业\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"由学生支部提供证明材料。\" ]\r\n}',0,NULL,'2019-04-25 19:38:33'),
(54,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"130\" ],\r\n  \"polName\" : [ \"担任学院分团委学生会、艺术团、社联主席团和秘书团成员\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"校级和院级学生干部需提供学校或学院出具的证明材料， 学生干部累计加分不超过5分。\" ]\r\n}',0,NULL,'2019-04-25 19:38:58'),
(55,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"130\" ],\r\n  \"polName\" : [ \"担任学院分团委学生会部长\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"校级和院级学生干部需提供学校或学院出具的证明材料， 学生干部累计加分不超过5分。\" ]\r\n}',0,NULL,'2019-04-25 19:39:17'),
(56,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"129\" ],\r\n  \"polName\" : [ \"个人品德修养\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:39:36'),
(57,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"135\" ],\r\n  \"polName\" : [ \"参加志愿服务活动\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"0.5\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"由学院青年志愿者协会提供证明材料，每8个小时加1分。（此项最多累加4分）。\" ]\r\n}',0,NULL,'2019-04-25 19:39:53'),
(58,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"135\" ],\r\n  \"polName\" : [ \"参加无偿献血活动\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"需提供献血证。\" ]\r\n}',0,NULL,'2019-04-25 19:40:15'),
(59,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"135\" ],\r\n  \"polName\" : [ \"获得院级或校级文明寝室\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"需提供获奖证书。相同项目不累计加分，只记最高分。\" ]\r\n}',0,NULL,'2019-04-25 19:40:33'),
(60,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"135\" ],\r\n  \"polName\" : [ \"获得学校十佳寝室\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"score\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"需提供获奖证书\" ]\r\n}',0,NULL,'2019-04-25 19:40:49'),
(61,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"129\" ],\r\n  \"polName\" : [ \"遵纪守法情况\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:41:13'),
(62,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"140\" ],\r\n  \"polName\" : [ \"考试作弊受到学校处分\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"-10\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"以学院或学校公示文件为准。\" ]\r\n}',0,NULL,'2019-04-25 19:41:40'),
(63,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"140\" ],\r\n  \"polName\" : [ \"旷课严重受到学校处分\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"-8\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:41:55'),
(64,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"140\" ],\r\n  \"polName\" : [ \"旷课严重受到学院处分\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"-6\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:42:12'),
(65,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"128\" ],\r\n  \"polName\" : [ \"专业素质\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"是否参赛以组织单位或学工办出具的参赛名单为准。\\r\\n获奖情况需提供获奖证书或相关证明材料。同一竞赛不得累计加分，只记最高得分。参加竞赛未获奖的，根据参赛次数最高可累加1分。\\r\\n\" ]\r\n}',0,NULL,'2019-04-25 19:42:48'),
(66,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"144\" ],\r\n  \"polName\" : [ \"学科竞赛\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:43:06'),
(67,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"144\" ],\r\n  \"polId\" : [ \"145\" ],\r\n  \"polName\" : [ \"学科竞赛\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"是否参赛以组织单位或学工办出具的参赛名单为准。\\r\\n获奖情况需提供获奖证书或相关证明材料。同一竞赛不得累计加分，只记最高得分。参加竞赛未获奖的，根据参赛次数最高可累加1分。\\r\\n\" ]\r\n}',0,NULL,'2019-04-25 19:43:16'),
(68,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"145\" ],\r\n  \"polName\" : [ \"参加院级以上学科竞赛\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:43:27'),
(69,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"145\" ],\r\n  \"polId\" : [ \"146\" ],\r\n  \"polName\" : [ \"参加院级以上学科竞赛\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"0.25\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:43:39'),
(70,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"145\" ],\r\n  \"polName\" : [ \"获得国家级特等奖、金奖或一等奖\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"8\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:43:49'),
(71,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"145\" ],\r\n  \"polName\" : [ \"获得国家级铜奖、三等奖\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"7\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:44:10'),
(72,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2019年评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-01 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-09 12:00:00\" ],\r\n  \"polId\" : [ \"128\" ],\r\n  \"ruleId\" : [ \"6\" ]\r\n}',0,NULL,'2019-04-25 19:44:35'),
(73,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"1\" ],\r\n  \"ruleName\" : [ \"2018年的评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-02 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-24 12:00:00\" ],\r\n  \"polId\" : [ \"129\" ],\r\n  \"ruleId\" : [ \"5\" ]\r\n}',0,NULL,'2019-04-25 19:46:37'),
(74,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"测试\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',1,'','2019-04-25 19:59:02'),
(75,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"测试\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',1,'','2019-04-25 19:59:15'),
(76,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"测试\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 19:59:57'),
(77,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"149\" ],\r\n  \"polName\" : [ \"二级测试\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:00:23'),
(78,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/150','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 20:12:25'),
(79,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/149','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 20:12:28'),
(80,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"一级\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:12:39'),
(81,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polName\" : [ \"二级\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:12:51'),
(82,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"一级测速\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:13:19'),
(83,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"153\" ],\r\n  \"polName\" : [ \"耳机测试\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:13:31'),
(84,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"152\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"耳机测试\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:13:46'),
(85,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"153\" ],\r\n  \"polName\" : [ \"二级测试122\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:15:53'),
(86,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"153\" ],\r\n  \"polId\" : [ \"155\" ],\r\n  \"polName\" : [ \"二级测试\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:16:39'),
(87,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"153\" ],\r\n  \"polName\" : [ \"子菜单2\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:24:53'),
(88,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"154\" ],\r\n  \"polId\" : [ \"156\" ],\r\n  \"polName\" : [ \"子菜单2\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:25:37'),
(89,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"152\" ],\r\n  \"polId\" : [ \"156\" ],\r\n  \"polName\" : [ \"子菜单2\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:30:24'),
(90,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"二级菜单1\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:32:54'),
(91,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"二级菜单1\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:35:41'),
(92,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"二级菜单1\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:36:13'),
(93,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"二级菜单1\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:36:52'),
(94,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"二级菜单1\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:38:28'),
(95,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"二级菜单1\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:39:01'),
(96,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"153\" ],\r\n  \"polId\" : [ \"154\" ],\r\n  \"polName\" : [ \"二级菜单1\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:39:16'),
(97,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polId\" : [ \"151\" ],\r\n  \"polName\" : [ \"2019年评优评奖\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:39:57'),
(98,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/153','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 20:40:05'),
(99,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/154','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 20:40:08'),
(100,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/153','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 20:40:11'),
(101,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polId\" : [ \"152\" ],\r\n  \"polName\" : [ \"思想品德素质\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:40:24'),
(102,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"152\" ],\r\n  \"polId\" : [ \"156\" ],\r\n  \"polName\" : [ \"思想政治表现\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:40:34'),
(103,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polName\" : [ \"参加入党积极分子培训班并结业\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"由学生支部提供证明材料。\" ]\r\n}',0,NULL,'2019-04-25 20:40:49'),
(104,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polName\" : [ \"参加党员发展对象培训班并结业\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"由学生支部提供证明材料。\" ]\r\n}',0,NULL,'2019-04-25 20:41:05'),
(105,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polName\" : [ \"担任学院分团委学生会、艺术团、社联主席团和秘书团成员\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"校级和院级学生干部需提供学校或学院出具的证明材料， 学生干部累计加分不超过5分。\" ]\r\n}',0,NULL,'2019-04-25 20:41:26'),
(106,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"156\" ],\r\n  \"polName\" : [ \"担任学院分团委学生会部长\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"score\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"校级和院级学生干部需提供学校或学院出具的证明材料， 学生干部累计加分不超过5分。\" ]\r\n}',0,NULL,'2019-04-25 20:41:44'),
(107,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"152\" ],\r\n  \"polName\" : [ \"个人品德修养\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:42:11'),
(108,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"161\" ],\r\n  \"polName\" : [ \"参加志愿服务活动\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"0.5\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"由学院青年志愿者协会提供证明材料，每8个小时加1分。（此项最多累加4分）。\" ]\r\n}',0,NULL,'2019-04-25 20:42:27'),
(109,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"161\" ],\r\n  \"polName\" : [ \"参加无偿献血活动\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"score\" : [ \"0.5\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"需提供献血证。\" ]\r\n}',0,NULL,'2019-04-25 20:42:43'),
(110,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"161\" ],\r\n  \"polName\" : [ \"获得院级或校级文明寝室\" ],\r\n  \"orderNum\" : [ \"6\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"需提供获奖证书。相同项目不累计加分，只记最高分。\" ]\r\n}',0,NULL,'2019-04-25 20:42:59'),
(111,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"152\" ],\r\n  \"polName\" : [ \"遵纪守法情况\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:43:16'),
(112,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"165\" ],\r\n  \"polName\" : [ \"考试作弊受到学校处分\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"-10\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:43:34'),
(113,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"152\" ],\r\n  \"polId\" : [ \"165\" ],\r\n  \"polName\" : [ \"遵纪守法情况\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"以学院或学校公示文件为准。\" ]\r\n}',0,NULL,'2019-04-25 20:43:41'),
(114,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"165\" ],\r\n  \"polName\" : [ \"旷课严重受到学校处分\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"-6\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:43:53'),
(115,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polName\" : [ \"专业素质\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"是否参赛以组织单位或学工办出具的参赛名单为准。\\r\\n获奖情况需提供获奖证书或相关证明材料。同一竞赛不得累计加分，只记最高得分。参加竞赛未获奖的，根据参赛次数最高可累加1分。\\r\\n\" ]\r\n}',0,NULL,'2019-04-25 20:44:13'),
(116,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"168\" ],\r\n  \"polName\" : [ \"参加院级以上学科竞赛\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"0.25\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:44:27'),
(117,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"168\" ],\r\n  \"polName\" : [ \"获得国家级特等奖、金奖或一等奖\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"8\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:44:38'),
(118,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polName\" : [ \"创新创业素质\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:45:00'),
(119,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"171\" ],\r\n  \"polName\" : [ \"创新能力\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:45:13'),
(120,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"171\" ],\r\n  \"polId\" : [ \"172\" ],\r\n  \"polName\" : [ \"创新能力\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"1.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 20:46:02'),
(121,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"172\" ],\r\n  \"polName\" : [ \"申报学校创新训练计划项目\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"以学院提供的申报名单为准。\" ]\r\n}',0,NULL,'2019-04-25 20:46:20'),
(122,'规则管理',2,'com.dimple.web.controller.maintenance.EamsRuleController.editSave()',1,'admin','超级管理员','/maintenance/rule/edit','127.0.0.1','内网IP','{\r\n  \"status\" : [ \"0\" ],\r\n  \"ruleName\" : [ \"2019年评优评奖\" ],\r\n  \"openTime\" : [ \"2019-04-01 12:00:00\" ],\r\n  \"closeTime\" : [ \"2019-05-09 12:00:00\" ],\r\n  \"polId\" : [ \"151\" ],\r\n  \"ruleId\" : [ \"6\" ]\r\n}',0,NULL,'2019-04-25 20:46:30'),
(123,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polId\" : [ \"152\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"思想品德素质\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 21:07:58'),
(124,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"很多时候\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"undefined\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 21:29:20'),
(125,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"存储\" ],\r\n  \"orderNum\" : [ \"111\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"大沙地\" ],\r\n  \"undefined\" : [ \"\" ]\r\n}',0,NULL,'2019-04-25 21:32:35'),
(126,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/174','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 21:33:13'),
(127,'策略管理',3,'com.dimple.web.controller.maintenance.EamsPolicyController.remove()',1,'admin','超级管理员','/maintenance/policy/remove/175','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-25 21:33:18'),
(128,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"1212\" ],\r\n  \"orderNum\" : [ \"12\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"deptIds\" : [ \"101,108\" ]\r\n}',0,NULL,'2019-04-25 21:33:36'),
(129,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"21313\" ],\r\n  \"orderNum\" : [ \"13213\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"deptIds\" : [ \"103,102\" ]\r\n}',0,NULL,'2019-04-25 21:34:25'),
(130,'用户管理',2,'com.dimple.web.controller.system.SysUserController.changeStatus()',1,'admin','超级管理员','/system/user/changeStatus','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-26 14:46:42'),
(131,'角色管理',3,'com.dimple.web.controller.system.SysRoleController.remove()',1,'admin','超级管理员','/system/role/remove','127.0.0.1','内网IP','{\r\n  \"ids\" : [ \"100\" ]\r\n}',0,NULL,'2019-04-26 14:47:11'),
(132,'角色管理',2,'com.dimple.web.controller.system.SysRoleController.editSave()',1,'admin','超级管理员','/system/role/edit','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2068,2069,2070,2063,2064,2065,2066,2067\" ]\r\n}',0,NULL,'2019-04-26 14:47:58'),
(133,'重置密码',2,'com.dimple.web.controller.system.SysUserController.resetPwd()',1,'admin','超级管理员','/system/user/resetPwd/2','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-26 14:48:36'),
(134,'重置密码',2,'com.dimple.web.controller.system.SysUserController.resetPwdSave()',1,'admin','超级管理员','/system/user/resetPwd','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"loginName\" : [ \"test\" ],\r\n  \"password\" : [ \"123456\" ]\r\n}',0,NULL,'2019-04-26 14:48:40'),
(135,'角色管理',2,'com.dimple.web.controller.system.SysRoleController.editSave()',1,'admin','超级管理员','/system/role/edit','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2068,2069,2070,2063,2064,2065,2066,2067,108,501,1043\" ]\r\n}',0,NULL,'2019-04-26 14:51:05'),
(136,'用户管理',2,'com.dimple.web.controller.system.SysUserController.changeStatus()',1,'admin','超级管理员','/system/user/changeStatus','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"status\" : [ \"1\" ]\r\n}',0,NULL,'2019-04-26 14:59:18'),
(137,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polId\" : [ \"152\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"思想品德素质\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-26 16:24:18'),
(138,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polId\" : [ \"152\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"思想品德素质\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-26 16:24:30'),
(139,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\", \"104\" ],\r\n  \"polName\" : [ \"123\" ],\r\n  \"orderNum\" : [ \"1233\" ],\r\n  \"score\" : [ \"12\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-26 16:38:36'),
(140,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\", \"108\" ],\r\n  \"polName\" : [ \"1112\" ],\r\n  \"orderNum\" : [ \"32121\" ],\r\n  \"score\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-26 16:40:17'),
(141,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\", \"102\" ],\r\n  \"polName\" : [ \"12\" ],\r\n  \"orderNum\" : [ \"123\" ],\r\n  \"score\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-26 16:41:38'),
(142,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"deptId\" : [ \"\", \"102\" ],\r\n  \"polName\" : [ \"12\" ],\r\n  \"orderNum\" : [ \"32\" ],\r\n  \"score\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-04-26 16:43:23'),
(143,'策略管理',1,'com.dimple.web.controller.maintenance.EamsPolicyController.addSave()',1,'admin','超级管理员','/maintenance/policy/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"polName\" : [ \"121\" ],\r\n  \"orderNum\" : [ \"321\" ],\r\n  \"score\" : [ \"313\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"deptId\" : [ \"102\" ]\r\n}',0,NULL,'2019-04-26 16:46:42'),
(144,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2069','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-27 16:36:42'),
(145,'角色管理',4,'com.dimple.web.controller.system.SysRoleController.cancelAuthUser()',1,'admin','超级管理员','/system/role/authUser/cancel','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"userId\" : [ \"2\" ]\r\n}',0,NULL,'2019-04-27 16:36:58'),
(146,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2069','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-27 16:37:10'),
(147,'角色管理',2,'com.dimple.web.controller.system.SysRoleController.editSave()',1,'admin','超级管理员','/system/role/edit','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"\" ]\r\n}',0,NULL,'2019-04-27 16:37:21'),
(148,'角色管理',2,'com.dimple.web.controller.system.SysRoleController.editSave()',1,'admin','超级管理员','/system/role/edit','127.0.0.1','内网IP','{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2063,2064,2065,2066,2067,108,501,1043\" ]\r\n}',0,NULL,'2019-04-27 16:37:26'),
(149,'菜单管理',3,'com.dimple.web.controller.system.SysMenuController.remove()',1,'admin','超级管理员','/system/menu/remove/2069','127.0.0.1','内网IP','{ }',0,NULL,'2019-04-27 16:37:31'),
(150,'菜单管理',2,'com.dimple.web.controller.system.SysMenuController.editSave()',1,'admin','超级管理员','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2070\" ],\r\n  \"parentId\" : [ \"2068\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"参评记录\" ],\r\n  \"url\" : [ \"/evaluation/record\" ],\r\n  \"perms\" : [ \"evaluation:record:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-27 16:37:47'),
(151,'用户管理',2,'com.dimple.web.controller.maintenance.EamsStudentController.editSave()',1,'admin','超级管理员','/maintenance/student/edit','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"5\", \"\" ],\r\n  \"stuId\" : [ \"4\" ],\r\n  \"stuName\" : [ \"边小丰\" ],\r\n  \"profName\" : [ \"2班\" ],\r\n  \"stuNum\" : [ \"123\" ],\r\n  \"idCard\" : [ \"123\" ],\r\n  \"phoneNum\" : [ \"1515151\" ],\r\n  \"email\" : [ \"5111@a115.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-27 19:43:08'),
(152,'个人信息',2,'com.dimple.web.controller.system.SysProfileController.update()',1,'admin','超级管理员','/system/user/profile/update','127.0.0.1','内网IP','{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"dimple\" ],\r\n  \"phonenumber\" : [ \"18582872818\" ],\r\n  \"email\" : [ \"bianxiaofeng@sohu.com\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:04:56'),
(153,'菜单管理',1,'com.dimple.web.controller.system.SysMenuController.addSave()',1,'admin','超级管理员','/system/menu/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"统计图表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:06:09'),
(154,'菜单管理',2,'com.dimple.web.controller.system.SysMenuController.editSave()',1,'admin','超级管理员','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2071\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"统计图表\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:06:18'),
(155,'菜单管理',2,'com.dimple.web.controller.system.SysMenuController.editSave()',1,'admin','超级管理员','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2071\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"统计图表\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"30\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:06:27'),
(156,'菜单管理',2,'com.dimple.web.controller.system.SysMenuController.editSave()',1,'admin','超级管理员','/system/menu/edit','127.0.0.1','内网IP','{\r\n  \"menuId\" : [ \"2071\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"统计图表\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"8\" ],\r\n  \"icon\" : [ \"fa fa-bar-chart-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:06:41'),
(157,'菜单管理',1,'com.dimple.web.controller.system.SysMenuController.addSave()',1,'admin','超级管理员','/system/menu/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"2071\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"系统信息\" ],\r\n  \"url\" : [ \"/charts/server\" ],\r\n  \"perms\" : [ \"charts:server:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:08:36'),
(158,'通知公告',2,'com.dimple.web.controller.system.SysNoticeController.editSave()',1,'admin','超级管理员','/system/notice/edit','127.0.0.1','内网IP','{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"本周天会对系统进行维护，届时评优评奖模块会受到影响，其他模块正常运行。<img src=\\\"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&amp;quality=100&amp;size=b4000_4000&amp;sec=1556424732&amp;di=41e4b9b2a398935ae9cfd71424e5f0aa&amp;src=http://d.hiphotos.baidu.com/image/pic/item/9f510fb30f2442a74a96836fdb43ad4bd013025b.jpg\\\">\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:12:35'),
(159,'通知公告',2,'com.dimple.web.controller.system.SysNoticeController.editSave()',1,'admin','超级管理员','/system/notice/edit','127.0.0.1','内网IP','{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"本周天会对系统进行维护，届时评<span style=\\\"background-color: rgb(255, 0, 0);\\\">优评奖模块会受到影响</span>，<span style=\\\"background-color: rgb(255, 255, 0);\\\">其他模块正常运行</span>。<img src=\\\"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&amp;quality=100&amp;size=b4000_4000&amp;sec=1556424732&amp;di=41e4b9b2a398935ae9cfd71424e5f0aa&amp;src=http://d.hiphotos.baidu.com/image/pic/item/9f510fb30f2442a74a96836fdb43ad4bd013025b.jpg\\\">\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:14:02'),
(160,'通知公告',2,'com.dimple.web.controller.system.SysNoticeController.editSave()',1,'admin','超级管理员','/system/notice/edit','127.0.0.1','内网IP','{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"本周天会对系统进行维护，届时评<b><u style=\\\"color: rgb(255, 0, 0);\\\">优评奖模块会受到影响</u></b>，<span style=\\\"background-color: rgb(255, 255, 0);\\\">其他模块正常运行</span>。<img src=\\\"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&amp;quality=100&amp;size=b4000_4000&amp;sec=1556424732&amp;di=41e4b9b2a398935ae9cfd71424e5f0aa&amp;src=http://d.hiphotos.baidu.com/image/pic/item/9f510fb30f2442a74a96836fdb43ad4bd013025b.jpg\\\">\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:14:37'),
(161,'用户管理',2,'com.dimple.web.controller.system.SysUserController.changeStatus()',1,'admin','超级管理员','/system/user/changeStatus','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:15:05'),
(162,'通知公告',2,'com.dimple.web.controller.system.SysNoticeController.editSave()',1,'admin','超级管理员','/system/notice/edit','127.0.0.1','内网IP','{\r\n  \"noticeId\" : [ \"1\" ],\r\n  \"noticeTitle\" : [ \"温馨提醒\" ],\r\n  \"noticeType\" : [ \"2\" ],\r\n  \"noticeContent\" : [ \"爸比心情不好，发图泄愤<img src=\\\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1556435120610&amp;di=b05e5786a1fb6978dba29ae100b181ff&amp;imgtype=0&amp;src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_gif%2FQAxick9E2TicgxNUImKw8t6nXMWRHTyick7l5SscNKXKWecq9MRLia4Pu3ICh5gicPibYMlrgakN2xPeSAZbjcuia6qcQ%2F640%3Fwx_fmt%3Dgif\\\">\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 12:17:36'),
(163,'在线用户',7,'com.dimple.web.controller.monitor.SysUserOnlineController.forceLogout()',1,'admin','超级管理员','/monitor/online/forceLogout','66.42.100.95','加利福尼亚 XX','{\n  \"sessionId\" : [ \"7016a436-ff24-4f6f-b2b0-a2e55724f704\" ]\n}',0,NULL,'2019-04-28 12:53:32'),
(164,'通知公告',2,'com.dimple.web.controller.system.SysNoticeController.editSave()',1,'admin','超级管理员','/system/notice/edit','127.0.0.1','内网IP','{\r\n  \"noticeId\" : [ \"1\" ],\r\n  \"noticeTitle\" : [ \"温馨提醒\" ],\r\n  \"noticeType\" : [ \"2\" ],\r\n  \"noticeContent\" : [ \"爸比心情不好，发图泄愤\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 16:10:31'),
(165,'通知公告',2,'com.dimple.web.controller.system.SysNoticeController.editSave()',1,'admin','超级管理员','/system/notice/edit','127.0.0.1','内网IP','{\r\n  \"noticeId\" : [ \"1\" ],\r\n  \"noticeTitle\" : [ \"温馨提醒\" ],\r\n  \"noticeType\" : [ \"2\" ],\r\n  \"noticeContent\" : [ \"新一轮的评优评奖开启了，请同学们和各部门做好准备。\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-04-28 16:10:54'),
(166,'通知公告',2,'com.dimple.web.controller.system.SysNoticeController.editSave()',1,'admin','超级管理员','/system/notice/edit','127.0.0.1','内网IP','{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"本周天会对系统进行维护，届时评<b><u style=\\\"color: rgb(255, 0, 0);\\\">优评奖模块会受到影响</u></b>，<span style=\\\"background-color: rgb(255, 255, 0);\\\">其他模块正常运行</span>。\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-05-03 11:41:08'),
(167,'用户管理',1,'com.dimple.web.controller.system.SysUserController.addSave()',1,'admin','超级管理员','/system/user/add','127.0.0.1','内网IP','{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"科文部部长\" ],\r\n  \"deptName\" : [ \"科文部\" ],\r\n  \"phonenumber\" : [ \"18582822818\" ],\r\n  \"email\" : [ \"bianxiaofeng1@sohu.com\" ],\r\n  \"loginName\" : [ \"kewenbu\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}',0,NULL,'2019-05-08 12:23:40'),
(168,'角色管理',3,'com.dimple.web.controller.system.SysRoleController.remove()',1,'admin','超级管理员','/system/role/remove','127.0.0.1','内网IP','{\r\n  \"ids\" : [ \"2\" ]\r\n}',0,NULL,'2019-05-08 12:23:54'),
(169,'角色管理',1,'com.dimple.web.controller.system.SysRoleController.addSave()',1,'admin','超级管理员','/system/role/add','127.0.0.1','内网IP','{\r\n  \"roleName\" : [ \"学生会部长\" ],\r\n  \"roleKey\" : [ \"studentManager\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2068,2070\" ]\r\n}',0,NULL,'2019-05-08 12:24:21'),
(170,'用户管理',2,'com.dimple.web.controller.system.SysUserController.editSave()',1,'admin','超级管理员','/system/user/edit','127.0.0.1','内网IP','{\r\n  \"userId\" : [ \"3\" ],\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"科文部部长\" ],\r\n  \"dept.deptName\" : [ \"科文部\" ],\r\n  \"phonenumber\" : [ \"18582822818\" ],\r\n  \"email\" : [ \"bianxiaofeng1@sohu.com\" ],\r\n  \"loginName\" : [ \"kewenbu\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"101\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"101\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}',0,NULL,'2019-05-08 12:24:59'),
(171,'评优评奖记录',5,'com.dimple.web.controller.evaluation.EamsRecordController.export()',1,'admin','超级管理员','/evaluation/record/export','127.0.0.1','内网IP','{\r\n  \"dictName\" : [ \"\" ],\r\n  \"dictType\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-08 13:44:49'),
(172,'评优评奖记录',5,'com.dimple.web.controller.evaluation.EamsRecordController.export()',1,'admin','超级管理员','/evaluation/record/export','127.0.0.1','内网IP','{\r\n  \"dictName\" : [ \"\" ],\r\n  \"dictType\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-08 13:45:10'),
(173,'评优评奖记录',5,'com.dimple.web.controller.evaluation.EamsRecordController.export()',1,'admin','超级管理员','/evaluation/record/export','127.0.0.1','内网IP','{\r\n  \"dictName\" : [ \"\" ],\r\n  \"dictType\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-08 13:59:49'),
(174,'评优评奖记录',5,'com.dimple.web.controller.evaluation.EamsRecordController.export()',1,'admin','超级管理员','/evaluation/record/export','127.0.0.1','内网IP','{\r\n  \"dictName\" : [ \"\" ],\r\n  \"dictType\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-08 14:02:45'),
(175,'菜单管理',1,'com.dimple.web.controller.system.SysMenuController.addSave()',1,'admin','超级管理员','/system/menu/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"2070\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"记录查询\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"evaluation:record:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-05-08 15:39:39'),
(176,'菜单管理',1,'com.dimple.web.controller.system.SysMenuController.addSave()',1,'admin','超级管理员','/system/menu/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"2070\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"记录详细\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"evaluation:record:detail\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-05-08 15:40:07'),
(177,'菜单管理',1,'com.dimple.web.controller.system.SysMenuController.addSave()',1,'admin','超级管理员','/system/menu/add','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"2070\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"导出数据\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"evaluation:record:export\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}',0,NULL,'2019-05-08 15:40:31'),
(178,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"151\" ],\r\n  \"polId\" : [ \"152\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"思想品德素质\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"score\" : [ \"0.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ]\r\n}',0,NULL,'2019-05-10 13:21:35'),
(179,'学生管理',5,'com.dimple.web.controller.maintenance.EamsStudentController.export()',1,'admin','超级管理员','/maintenance/student/export','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"5\" ],\r\n  \"parentId\" : [ \"3\" ],\r\n  \"stuNum\" : [ \"\" ],\r\n  \"stuName\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-11 01:14:47'),
(180,'学生管理',1,'com.dimple.web.controller.maintenance.EamsStudentController.addSave()',1,'admin','超级管理员','/maintenance/student/add','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"5\", \"\" ],\r\n  \"stuName\" : [ \"边小丰答辩测试账号\" ],\r\n  \"profName\" : [ \"2班\" ],\r\n  \"stuNum\" : [ \"20151041120\" ],\r\n  \"idCard\" : [ \"510821199608050011\" ],\r\n  \"phoneNum\" : [ \"18582872818\" ],\r\n  \"email\" : [ \"bianixaofeng@sohu.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-05-11 01:36:42'),
(181,'学生管理',5,'com.dimple.web.controller.maintenance.EamsStudentController.export()',1,'admin','超级管理员','/maintenance/student/export','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"stuNum\" : [ \"\" ],\r\n  \"stuName\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-11 01:41:29'),
(182,'学生管理',5,'com.dimple.web.controller.maintenance.EamsStudentController.export()',1,'admin','超级管理员','/maintenance/student/export','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"stuNum\" : [ \"\" ],\r\n  \"stuName\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-11 01:41:38'),
(183,'学生管理',1,'com.dimple.web.controller.maintenance.EamsStudentController.addSave()',1,'admin','超级管理员','/maintenance/student/add','127.0.0.1','内网IP','{\r\n  \"profId\" : [ \"16\", \"\" ],\r\n  \"stuName\" : [ \"边小丰测试账号\" ],\r\n  \"profName\" : [ \"软件工程\" ],\r\n  \"stuNum\" : [ \"123456\" ],\r\n  \"idCard\" : [ \"123456\" ],\r\n  \"phoneNum\" : [ \"15985552323\" ],\r\n  \"email\" : [ \"test@test.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}',0,NULL,'2019-05-11 08:14:50'),
(184,'策略管理',2,'com.dimple.web.controller.maintenance.EamsPolicyController.editSave()',1,'admin','超级管理员','/maintenance/policy/edit','127.0.0.1','内网IP','{\r\n  \"parentId\" : [ \"172\" ],\r\n  \"polId\" : [ \"173\" ],\r\n  \"deptId\" : [ \"\" ],\r\n  \"polName\" : [ \"申报学校创新训练计划项目\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"score\" : [ \"1.0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"input\" : [ \"0\" ],\r\n  \"remark\" : [ \"以学院提供的申报名单为准。\" ]\r\n}',0,NULL,'2019-05-11 08:16:12'),
(185,'评优评奖记录',5,'com.dimple.web.controller.evaluation.EamsRecordController.export()',1,'admin','超级管理员','/evaluation/record/export','127.0.0.1','内网IP','{\r\n  \"dictName\" : [ \"\" ],\r\n  \"dictType\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}',0,NULL,'2019-05-11 23:55:51');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','admin','2019-04-27 16:37:21','管理员'),
(2,'普通角色','common',2,'2','0','2','admin','2018-03-16 11:33:00','admin','2019-04-27 16:37:26','普通角色'),
(100,'学生','student',3,'1','0','2','admin','2019-04-17 22:54:22','',NULL,'学生'),
(101,'学生会部长','studentManager',1,'1','0','0','admin','2019-05-08 12:24:20','',NULL,NULL);

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values
(2,100),
(2,101),
(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values
(2,108),
(2,501),
(2,1043),
(2,2063),
(2,2064),
(2,2065),
(2,2066),
(2,2067),
(101,2068),
(101,2070);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`salt`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,200,'admin','Dimple','00','bianxiaofeng@sohu.com','18582872818','0','','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2019-05-11 23:53:30','admin','2018-03-16 11:33:00','ry','2019-05-11 23:53:30','管理员'),
(2,105,'test','测试','00','bianxiaofeng@qq.com','15666666666','1','','e26a188507ad52cee824d38a68399ddf','36a124','0','0','127.0.0.1','2019-04-26 14:59:01','admin','2018-03-16 11:33:00','ry','2019-04-28 12:15:05','测试员'),
(3,103,'kewenbu','科文部部长','00','bianxiaofeng1@sohu.com','18582822818','0','','f70359a4b75bbf045d9d575e34534cf0','864c31','0','0','127.0.0.1','2019-05-08 12:25:08','admin','2019-05-08 12:23:40','admin','2019-05-08 12:25:08','');

/*Table structure for table `sys_user_online` */

DROP TABLE IF EXISTS `sys_user_online`;

CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

/*Data for the table `sys_user_online` */

insert  into `sys_user_online`(`sessionId`,`login_name`,`dept_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`start_timestamp`,`last_access_time`,`expire_time`) values
('1b4f9279-08a9-4315-8661-49ff413cfd88','admin','超级管理员','127.0.0.1','内网IP','Chrome','Windows 10','on_line','2019-05-11 23:52:57','2019-05-11 23:55:43',1800000);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values
(3,101);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

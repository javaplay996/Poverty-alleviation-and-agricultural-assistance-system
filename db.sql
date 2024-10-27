/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - fupinzhunong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fupinzhunong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fupinzhunong`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '提问用户',
  `chat_issue` varchar(200) DEFAULT NULL COMMENT '问题',
  `issue_time` timestamp NULL DEFAULT NULL COMMENT '问题时间 Search111',
  `chat_reply` varchar(200) DEFAULT NULL COMMENT '回复',
  `reply_time` timestamp NULL DEFAULT NULL COMMENT '回复时间 Search111',
  `zhuangtai_types` int(255) DEFAULT NULL COMMENT '状态',
  `chat_types` int(11) DEFAULT NULL COMMENT '数据类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客服聊天';

/*Data for the table `chat` */

insert  into `chat`(`id`,`yonghu_id`,`chat_issue`,`issue_time`,`chat_reply`,`reply_time`,`zhuangtai_types`,`chat_types`,`insert_time`) values (1,1,'询问问题','2023-04-14 15:48:19',NULL,NULL,2,1,'2023-04-14 15:48:19'),(2,1,NULL,NULL,'回复问题','2023-04-14 15:48:42',NULL,2,'2023-04-14 15:48:42');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','upload/config1.jpg'),(2,'轮播图2','upload/config2.jpg'),(3,'轮播图3','upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'chat_types','数据类型',1,'问题',NULL,NULL,'2023-04-14 15:15:09'),(2,'chat_types','数据类型',2,'回复',NULL,NULL,'2023-04-14 15:15:09'),(3,'zhuangtai_types','状态',1,'未回复',NULL,NULL,'2023-04-14 15:15:09'),(4,'zhuangtai_types','状态',2,'已回复',NULL,NULL,'2023-04-14 15:15:09'),(5,'xinwen_types','新闻类型',1,'政策新闻',NULL,NULL,'2023-04-14 15:15:09'),(6,'xinwen_types','新闻类型',2,'每日新闻',NULL,NULL,'2023-04-14 15:15:09'),(7,'xinwen_types','新闻类型',3,'表彰内容',NULL,NULL,'2023-04-14 15:15:09'),(8,'xinwen_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-04-14 15:15:09'),(9,'renwu_types','任务类型',1,'任务类型1',NULL,NULL,'2023-04-14 15:15:09'),(10,'renwu_types','任务类型',2,'任务类型2',NULL,NULL,'2023-04-14 15:15:09'),(11,'renwu_types','任务类型',3,'任务类型3',NULL,NULL,'2023-04-14 15:15:09'),(12,'zhugtai_types','任务状态',1,'未接取',NULL,NULL,'2023-04-14 15:15:09'),(13,'zhugtai_types','任务状态',2,'已接取',NULL,NULL,'2023-04-14 15:15:09'),(14,'renwu_yuyue_yesno_types','审核状态',1,'待审核',NULL,NULL,'2023-04-14 15:15:09'),(15,'renwu_yuyue_yesno_types','审核状态',2,'同意',NULL,NULL,'2023-04-14 15:15:09'),(16,'renwu_yuyue_yesno_types','审核状态',3,'拒绝',NULL,NULL,'2023-04-14 15:15:09'),(17,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2023-04-14 15:15:09'),(18,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2023-04-14 15:15:09'),(19,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2023-04-14 15:15:09'),(20,'sex_types','性别类型',1,'男',NULL,NULL,'2023-04-14 15:15:09'),(21,'sex_types','性别类型',2,'女',NULL,NULL,'2023-04-14 15:15:09'),(22,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2023-04-14 15:15:09'),(23,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2023-04-14 15:15:09');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` longtext COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',2,NULL,'发布内容1',278,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(2,'帖子标题2',2,NULL,'发布内容2',324,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(3,'帖子标题3',1,NULL,'发布内容3',288,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(4,'帖子标题4',2,NULL,'发布内容4',84,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(5,'帖子标题5',1,NULL,'发布内容5',176,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(6,'帖子标题6',2,NULL,'发布内容6',19,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(7,'帖子标题7',3,NULL,'发布内容7',367,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(8,'帖子标题8',3,NULL,'发布内容8',397,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(9,'帖子标题9',1,NULL,'发布内容9',363,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(10,'帖子标题10',1,NULL,'发布内容10',320,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(11,'帖子标题11',3,NULL,'发布内容11',154,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(12,'帖子标题12',1,NULL,'发布内容12',166,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(13,'帖子标题13',2,NULL,'发布内容13',493,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(14,'帖子标题14',1,NULL,'发布内容14',57,1,'2023-04-14 15:15:17','2023-04-14 15:15:17','2023-04-14 15:15:17'),(15,NULL,NULL,1,'11111111111111111',14,2,'2023-04-14 15:49:38',NULL,'2023-04-14 15:49:38'),(16,NULL,1,NULL,'用户登录后能删除自己添加的帖子和帖子评论',14,2,'2023-04-14 15:50:04',NULL,'2023-04-14 15:50:04');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` longtext COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='扶贫公告';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',3,'upload/news1.jpg','2023-04-14 15:15:17','公告详情1','2023-04-14 15:15:17'),(2,'公告标题2',2,'upload/news2.jpg','2023-04-14 15:15:17','公告详情2','2023-04-14 15:15:17'),(3,'公告标题3',1,'upload/news3.jpg','2023-04-14 15:15:17','公告详情3','2023-04-14 15:15:17'),(4,'公告标题4',1,'upload/news4.jpg','2023-04-14 15:15:17','公告详情4','2023-04-14 15:15:17'),(5,'公告标题5',1,'upload/news5.jpg','2023-04-14 15:15:17','公告详情5','2023-04-14 15:15:17'),(6,'公告标题6',2,'upload/news6.jpg','2023-04-14 15:15:17','公告详情6','2023-04-14 15:15:17'),(7,'公告标题7',3,'upload/news7.jpg','2023-04-14 15:15:17','公告详情7','2023-04-14 15:15:17'),(8,'公告标题8',1,'upload/news8.jpg','2023-04-14 15:15:17','公告详情8','2023-04-14 15:15:17'),(9,'公告标题9',1,'upload/news9.jpg','2023-04-14 15:15:17','公告详情9','2023-04-14 15:15:17'),(10,'公告标题10',3,'upload/news10.jpg','2023-04-14 15:15:17','公告详情10','2023-04-14 15:15:17'),(11,'公告标题11',1,'upload/news11.jpg','2023-04-14 15:15:17','公告详情11','2023-04-14 15:15:17'),(12,'公告标题12',1,'upload/news12.jpg','2023-04-14 15:15:17','公告详情12','2023-04-14 15:15:17'),(13,'公告标题13',3,'upload/news13.jpg','2023-04-14 15:15:17','公告详情13','2023-04-14 15:15:17'),(14,'公告标题14',3,'upload/news14.jpg','2023-04-14 15:15:17','公告详情14','2023-04-14 15:15:17');

/*Table structure for table `renwu` */

DROP TABLE IF EXISTS `renwu`;

CREATE TABLE `renwu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `renwu_name` varchar(200) DEFAULT NULL COMMENT '任务标题  Search111 ',
  `renwu_photo` varchar(200) DEFAULT NULL COMMENT '任务介绍图',
  `renwu_zhiwei` varchar(200) DEFAULT NULL COMMENT '职位',
  `renwu_baocou` decimal(10,2) DEFAULT NULL COMMENT '报酬',
  `renwu_shijian` varchar(200) DEFAULT NULL COMMENT '工作时间',
  `renwu_text` longtext COMMENT '任务',
  `renwu_time` timestamp NULL DEFAULT NULL COMMENT '起止时间',
  `renwu_address` varchar(200) DEFAULT NULL COMMENT '工作地点',
  `renwu_fuzhenr` varchar(200) DEFAULT NULL COMMENT '负责人',
  `renwu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `renwu_baoming` varchar(200) DEFAULT NULL COMMENT '报名信息',
  `renwu_types` int(11) DEFAULT NULL COMMENT '任务类型 Search111',
  `jieshu_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `zhugtai_types` int(11) DEFAULT NULL COMMENT '任务状态 Search111',
  `renwu_content` longtext COMMENT '任务介绍',
  `renwu_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发布日期',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow homeMain',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='任务信息';

/*Data for the table `renwu` */

insert  into `renwu`(`id`,`renwu_name`,`renwu_photo`,`renwu_zhiwei`,`renwu_baocou`,`renwu_shijian`,`renwu_text`,`renwu_time`,`renwu_address`,`renwu_fuzhenr`,`renwu_phone`,`renwu_baoming`,`renwu_types`,`jieshu_time`,`zhugtai_types`,`renwu_content`,`renwu_delete`,`insert_time`,`create_time`) values (1,'任务标题1','upload/renwu1.jpg','职位1','328.41','工作时间1','任务1','2023-04-14 15:15:17','工作地点1','负责人1','17703786901','报名信息1',2,'2023-04-14 15:15:17',1,'任务介绍1',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(2,'任务标题2','upload/renwu2.jpg','职位2','502.64','工作时间2','任务2','2023-04-14 15:15:17','工作地点2','负责人2','17703786902','报名信息2',2,'2023-04-14 15:15:17',2,'任务介绍2',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(3,'任务标题3','upload/renwu3.jpg','职位3','118.87','工作时间3','任务3','2023-04-14 15:15:17','工作地点3','负责人3','17703786903','报名信息3',1,'2023-04-14 15:15:17',1,'任务介绍3',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(4,'任务标题4','upload/renwu4.jpg','职位4','458.36','工作时间4','任务4','2023-04-14 15:15:17','工作地点4','负责人4','17703786904','报名信息4',1,'2023-04-14 15:15:17',2,'任务介绍4',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(5,'任务标题5','upload/renwu5.jpg','职位5','670.51','工作时间5','任务5','2023-04-14 15:15:17','工作地点5','负责人5','17703786905','报名信息5',2,'2023-04-14 15:15:17',2,'任务介绍5',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(6,'任务标题6','upload/renwu6.jpg','职位6','337.54','工作时间6','任务6','2023-04-14 15:15:17','工作地点6','负责人6','17703786906','报名信息6',1,'2023-04-14 15:15:17',2,'任务介绍6',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(7,'任务标题7','upload/renwu7.jpg','职位7','357.14','工作时间7','任务7','2023-04-14 15:15:17','工作地点7','负责人7','17703786907','报名信息7',3,'2023-04-14 15:15:17',2,'任务介绍7',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(8,'任务标题8','upload/renwu8.jpg','职位8','41.82','工作时间8','任务8','2023-04-14 15:15:17','工作地点8','负责人8','17703786908','报名信息8',1,'2023-04-14 15:15:17',2,'任务介绍8',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(9,'任务标题9','upload/renwu9.jpg','职位9','988.21','工作时间9','任务9','2023-04-14 15:15:17','工作地点9','负责人9','17703786909','报名信息9',2,'2023-04-14 15:15:17',2,'<p>任务介绍9</p>',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(10,'任务标题10','upload/renwu10.jpg','职位10','329.79','工作时间10','任务10','2023-04-14 15:15:17','工作地点10','负责人10','17703786910','报名信息10',2,'2023-04-14 15:15:17',1,'任务介绍10',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(11,'任务标题11','upload/renwu11.jpg','职位11','322.47','工作时间11','任务11','2023-04-14 15:15:17','工作地点11','负责人11','17703786911','报名信息11',2,'2023-04-14 15:15:17',2,'任务介绍11',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(12,'任务标题12','upload/renwu12.jpg','职位12','331.72','工作时间12','任务12','2023-04-14 15:15:17','工作地点12','负责人12','17703786912','报名信息12',2,'2023-04-14 15:15:17',2,'任务介绍12',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(13,'任务标题13','upload/renwu13.jpg','职位13','592.65','工作时间13','任务13','2023-04-14 15:15:17','工作地点13','负责人13','17703786913','报名信息13',3,'2023-04-14 15:15:17',2,'任务介绍13',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(14,'任务标题14','upload/renwu14.jpg','职位14','140.10','工作时间14','任务14','2023-04-14 15:15:17','工作地点14','负责人14','17703786914','报名信息14',2,'2023-04-14 15:15:17',2,'任务介绍14',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(15,'123','/upload/1681458683032.jfif','123','123.00','2022-2024','任务任务任务任务任务任务任务任务任务任务任务','2023-04-15 00:00:00','作地点','张三','13333113331','报名信息报名信息报名信息',3,'2023-04-15 00:00:00',1,'<p><span style=\"color: rgb(96, 98, 102);\">任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍</span><img src=\"upload/1681458734981.jfif\"><span style=\"color: rgb(96, 98, 102);\">任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍任务介绍</span></p>',2,'2023-04-14 15:52:19','2023-04-14 15:52:19');

/*Table structure for table `renwu_yuyue` */

DROP TABLE IF EXISTS `renwu_yuyue`;

CREATE TABLE `renwu_yuyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `renwu_id` int(11) DEFAULT NULL COMMENT '任务',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `renwu_yuyue_yesno_types` int(11) DEFAULT NULL COMMENT '审核状态 Search111 ',
  `renwu_yuyue_yesno_text` longtext COMMENT '审核回复',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='任务报名';

/*Data for the table `renwu_yuyue` */

insert  into `renwu_yuyue`(`id`,`renwu_id`,`yonghu_id`,`renwu_yuyue_yesno_types`,`renwu_yuyue_yesno_text`,`insert_time`,`create_time`) values (1,1,1,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(2,2,1,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(3,3,1,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(4,4,3,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(5,5,1,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(6,6,2,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(7,7,3,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(8,8,2,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(9,9,2,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(10,10,1,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(11,11,1,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(12,12,2,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(13,13,3,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(14,14,2,1,NULL,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(15,9,1,2,'123','2023-04-14 15:39:06','2023-04-14 15:39:06'),(16,4,1,2,'111111111111','2023-04-14 15:47:43','2023-04-14 15:47:43');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '管理id',
  `username` varchar(100) NOT NULL COMMENT '管理名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','9w6r6d4peanj7g6xfhu2665nubrzv7a9','2023-04-14 15:19:36','2023-04-14 16:46:04'),(2,1,'admin','users','管理员','c0j4oqh3yq2ilg4lu5av85y6vyxw8n0i','2023-04-14 15:48:26','2023-04-14 16:58:36');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '医院名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2023-04-14 15:15:09');

/*Table structure for table `xinwen` */

DROP TABLE IF EXISTS `xinwen`;

CREATE TABLE `xinwen` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `xinwen_name` varchar(200) DEFAULT NULL COMMENT '新闻标题  Search111 ',
  `xinwen_photo` varchar(200) DEFAULT NULL COMMENT '新闻封面',
  `xinwen_video` varchar(200) DEFAULT NULL COMMENT '视频',
  `xinwen_types` int(11) DEFAULT NULL COMMENT '新闻类型 Search111',
  `xinwen_clicknum` int(11) DEFAULT NULL COMMENT '新闻热度',
  `xinwen_content` longtext COMMENT '新闻介绍',
  `xinwen_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='新闻信息';

/*Data for the table `xinwen` */

insert  into `xinwen`(`id`,`xinwen_name`,`xinwen_photo`,`xinwen_video`,`xinwen_types`,`xinwen_clicknum`,`xinwen_content`,`xinwen_delete`,`insert_time`,`create_time`) values (1,'新闻标题1','upload/news1.jpg','upload/video.mp4',2,254,'新闻介绍1',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(2,'新闻标题2','upload/news2.jpg','upload/video.mp4',2,123,'新闻介绍2',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(3,'新闻标题3','upload/news3.jpg','upload/video.mp4',1,425,'新闻介绍3',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(4,'新闻标题4','upload/news4.jpg','upload/video.mp4',1,459,'新闻介绍4',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(5,'新闻标题5','upload/news5.jpg','upload/video.mp4',1,71,'新闻介绍5',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(6,'新闻标题6','upload/news6.jpg','upload/video.mp4',2,58,'新闻介绍6',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(7,'新闻标题7','upload/news7.jpg','upload/video.mp4',3,275,'新闻介绍7',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(8,'新闻标题8','upload/news8.jpg','upload/video.mp4',3,164,'新闻介绍8',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(9,'新闻标题9','upload/news9.jpg','upload/video.mp4',2,277,'新闻介绍9',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(10,'新闻标题10','upload/news10.jpg','upload/video.mp4',3,244,'新闻介绍10',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(11,'新闻标题11','upload/news11.jpg','upload/video.mp4',2,341,'新闻介绍11',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(12,'新闻标题12','upload/news12.jpg','upload/video.mp4',1,354,'新闻介绍12',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(13,'新闻标题13','upload/news13.jpg','upload/video.mp4',3,166,'新闻介绍13',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(14,'新闻标题14','upload/news14.jpg','upload/video.mp4',1,419,'新闻介绍14',1,'2023-04-14 15:15:17','2023-04-14 15:15:17');

/*Table structure for table `xinwen_collection` */

DROP TABLE IF EXISTS `xinwen_collection`;

CREATE TABLE `xinwen_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `xinwen_id` int(11) DEFAULT NULL COMMENT '新闻',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `xinwen_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='新闻收藏';

/*Data for the table `xinwen_collection` */

insert  into `xinwen_collection`(`id`,`xinwen_id`,`yonghu_id`,`xinwen_collection_types`,`insert_time`,`create_time`) values (1,1,3,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(2,2,3,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(3,3,1,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(4,4,3,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(5,5,2,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(6,6,3,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(11,11,1,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(12,12,2,1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(13,13,1,1,'2023-04-14 15:15:17','2023-04-14 15:15:17');

/*Table structure for table `xinwen_liuyan` */

DROP TABLE IF EXISTS `xinwen_liuyan`;

CREATE TABLE `xinwen_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `xinwen_id` int(11) DEFAULT NULL COMMENT '新闻',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `xinwen_liuyan_text` longtext COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` longtext COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='新闻留言';

/*Data for the table `xinwen_liuyan` */

insert  into `xinwen_liuyan`(`id`,`xinwen_id`,`yonghu_id`,`xinwen_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,2,'留言内容1','2023-04-14 15:15:17','回复信息1','2023-04-14 15:15:17','2023-04-14 15:15:17'),(2,2,3,'留言内容2','2023-04-14 15:15:17','回复信息2','2023-04-14 15:15:17','2023-04-14 15:15:17'),(3,3,2,'留言内容3','2023-04-14 15:15:17','回复信息3','2023-04-14 15:15:17','2023-04-14 15:15:17'),(4,4,2,'留言内容4','2023-04-14 15:15:17','回复信息4','2023-04-14 15:15:17','2023-04-14 15:15:17'),(5,5,1,'留言内容5','2023-04-14 15:15:17','回复信息5','2023-04-14 15:15:17','2023-04-14 15:15:17'),(6,6,1,'留言内容6','2023-04-14 15:15:17','回复信息6','2023-04-14 15:15:17','2023-04-14 15:15:17'),(7,7,1,'留言内容7','2023-04-14 15:15:17','回复信息7','2023-04-14 15:15:17','2023-04-14 15:15:17'),(8,8,3,'留言内容8','2023-04-14 15:15:17','回复信息8','2023-04-14 15:15:17','2023-04-14 15:15:17'),(9,9,1,'留言内容9','2023-04-14 15:15:17','回复信息9','2023-04-14 15:15:17','2023-04-14 15:15:17'),(10,10,3,'留言内容10','2023-04-14 15:15:17','回复信息10','2023-04-14 15:15:17','2023-04-14 15:15:17'),(11,11,1,'留言内容11','2023-04-14 15:15:17','回复信息11','2023-04-14 15:15:17','2023-04-14 15:15:17'),(12,12,3,'留言内容12','2023-04-14 15:15:17','回复信息12','2023-04-14 15:15:17','2023-04-14 15:15:17'),(13,13,1,'留言内容13','2023-04-14 15:15:17','回复信息13','2023-04-14 15:15:17','2023-04-14 15:15:17'),(14,14,3,'留言内容14','2023-04-14 15:15:17','回复信息14','2023-04-14 15:15:17','2023-04-14 15:15:17'),(16,1,1,'登陆后才可以进入数据详情页进行评论留言收藏等操作','2023-04-14 15:47:19','11111111111111111111','2023-04-14 15:54:44','2023-04-14 15:47:19');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户名称 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111',
  `yonghu_age` int(11) DEFAULT NULL COMMENT '年龄',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '用户邮箱',
  `yonghu_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`yonghu_age`,`yonghu_email`,`yonghu_delete`,`insert_time`,`create_time`) values (1,'a1','123456','用户名称1','17703786901','410224199010102001','upload/yonghu1.jpg',2,155,'1@qq.com',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(2,'a2','123456','用户名称2','17703786902','410224199010102002','upload/yonghu2.jpg',2,77,'2@qq.com',1,'2023-04-14 15:15:17','2023-04-14 15:15:17'),(3,'a3','123456','用户名称3','17703786903','410224199010102003','upload/yonghu3.jpg',2,190,'3@qq.com',1,'2023-04-14 15:15:17','2023-04-14 15:15:17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

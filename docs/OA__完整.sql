/*
SQLyog Enterprise v8.32 
MySQL - 5.5.24-log : Database - oa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oa`;

/*Table structure for table `adrot` */

DROP TABLE IF EXISTS `adrot`;

CREATE TABLE `adrot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(50) DEFAULT NULL,
  `src` varchar(50) DEFAULT NULL,
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `alt` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `webname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adrot` */

/*Table structure for table `authassignment` */

DROP TABLE IF EXISTS `authassignment`;

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authassignment` */

insert  into `authassignment`(`itemname`,`userid`,`bizrule`,`data`) values ('admin','1','','s:0:\"\";'),('view','316','','s:0:\"\";');

/*Table structure for table `authitem` */

DROP TABLE IF EXISTS `authitem`;

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authitem` */

insert  into `authitem`(`name`,`type`,`description`,`bizrule`,`data`) values ('admin',2,'','','s:0:\"\";'),('mark_delete',0,NULL,NULL,'s:0:\"\";'),('mark_edit',0,'故意覅风',NULL,'s:0:\"\";'),('mark_manage',1,NULL,NULL,NULL),('mark_view',0,'','','s:0:\"\";'),('pro_delete',0,NULL,NULL,NULL),('pro_edit',0,NULL,NULL,NULL),('pro_manage',1,NULL,NULL,NULL),('pro_view',0,NULL,NULL,NULL),('view',2,'','','s:0:\"\";');

/*Table structure for table `authitemchild` */

DROP TABLE IF EXISTS `authitemchild`;

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authitemchild` */

insert  into `authitemchild`(`parent`,`child`) values ('admin','mark_delete'),('view','mark_manage'),('mark_manage','mark_view'),('pro_manage','mark_view'),('admin','pro_delete'),('view','pro_manage'),('admin','view');

/*Table structure for table `calendar` */

DROP TABLE IF EXISTS `calendar`;

CREATE TABLE `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `remindtime` varchar(50) DEFAULT NULL,
  `content` longtext,
  `state` tinyint(1) DEFAULT NULL,
  `userid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `calendar` */

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_code` varchar(16) DEFAULT NULL,
  `car_type` varchar(16) DEFAULT NULL,
  `car_buytime` varchar(24) DEFAULT NULL,
  `car_buyprice` varchar(50) DEFAULT NULL,
  `car_detail` varchar(255) DEFAULT NULL,
  `car_company` varchar(50) DEFAULT NULL,
  `car_user` varchar(50) DEFAULT NULL,
  `car_usermobile` varchar(50) DEFAULT NULL,
  `car_usertel` varchar(50) DEFAULT NULL,
  `car_money` longtext,
  `car_fixlog` longtext COMMENT '维修记录',
  `time` varchar(50) DEFAULT NULL COMMENT '录入时间',
  `ip` varchar(50) DEFAULT NULL COMMENT '操作人员ip',
  `car_state` varchar(50) DEFAULT NULL COMMENT '车辆状态',
  `car_statestart` varchar(50) DEFAULT NULL COMMENT '使用-起始时间',
  `car_stateend` varchar(50) DEFAULT NULL COMMENT '使用-结束时间',
  `car_statesmalluser` varchar(50) DEFAULT NULL COMMENT '使用人员',
  `car_statecompany` varchar(50) DEFAULT NULL COMMENT '使用人员-部门',
  `car_statebiguser` varchar(50) DEFAULT NULL COMMENT '本次操作人员',
  `car_statecause` varchar(255) DEFAULT NULL COMMENT '使用原因',
  `car_statedeparture` varchar(255) DEFAULT NULL COMMENT '起始地',
  `car_statedestination` varchar(255) DEFAULT NULL COMMENT '目的地',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Data for the table `car` */

insert  into `car`(`id`,`car_code`,`car_type`,`car_buytime`,`car_buyprice`,`car_detail`,`car_company`,`car_user`,`car_usermobile`,`car_usertel`,`car_money`,`car_fixlog`,`time`,`ip`,`car_state`,`car_statestart`,`car_stateend`,`car_statesmalluser`,`car_statecompany`,`car_statebiguser`,`car_statecause`,`car_statedeparture`,`car_statedestination`) values (45,'鲁GZ3438','轿车','2004.7','123480元','','山东办','刘建福','13964778838','13964778838','1一年养路费1320元&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2一年保险费5120元&lt;br&gt;&lt;br&gt;<br>\n合计:6440元','','2008-3-22 8:38:32','221.1.107.193','','2008-03-22 00:00:00',NULL,NULL,'山东办','待定','','',''),(49,'鲁V36099','大面包','2003.10','78000元','','山东办','臧传良','13792677012','13792677012','1一年养路费3960元&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2一年保险费6696元&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n合计:10656元','1、5月24日换电磁离合器，空调带378元。换电子点火器320元.&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2、5月31日换电瓶卡子、棚顶灯泡、电锁芯，补一条轮胎198.5元。','2008-6-16 18:18:26','221.1.107.193','公司','2008-03-22 00:00:00',NULL,NULL,'山东办','待定','','',''),(60,'鲁V30014','轿车','2006.5','312615元','','营销济南分公司','庸玉声','13506461350','13506461350','1一年养路费1320元&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2一年保险费8762元&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n合计:10082元','','2008-6-16 18:17:40','221.1.107.193','出差','2013-03-06 00:00:00','2013-03-20 00:00:00','','营销三公司','rock','','诸城','潍坊'),(61,'鲁A17298','面包','2003.3','133000元','','山东办','臧运平','13791893987','13791893987','1一年养路费2640元&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2一年保险费5978元&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n合计:7298元','1、更换机油、三滤202元。&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2、6月14日更换机油、三滤289.5元','2008-6-16 18:17:15','221.1.107.193','公司','2008-03-22 00:00:00',NULL,NULL,'山东办','待定','','',''),(63,'鲁v33899','轿车','2006.4','231159元','','营销青岛分公司','冯启宝','13583659828','13583659828','1一年养路费1320元&lt;br&gt;&lt;br&gt;<br>\n2一年保险费6556元&lt;br&gt;&lt;br&gt;<br>\n合计:7876元','','2008-6-16 18:16:48','221.1.107.193','公司','2008-03-22 00:00:00',NULL,NULL,'营销二公司','待定','','',''),(82,'鲁GZ3010','货车','2004.6','49648元','','公用车','赵玉华','13465668008','13465668008','1一年养路费3960元,营运费963元&lt;br&gt;<br>\n2一年保险费4574元&lt;br&gt;<br>\n合计:9497元','1、6月6日保养四轮、清洗水箱、更换后轮轴承。计720元','2006-6-7 11:07:45','222.132.21.23','出差','2008-03-22 00:00:00',NULL,NULL,'工程部','','送货','公司','胶南'),(85,'鲁G31352','货车','2006.8.21','73600元','','公用车','王焕斗','13964736302','13964736302','1一年养路费5280元,营运费1284元&lt;br&gt;&lt;br&gt;<br>\n2一年保险费3871元&lt;br&gt;&lt;br&gt;<br>\n合计:10435元','','2006-9-8 14:13:34','221.1.104.119','公司','2008-03-22 00:00:00',NULL,NULL,'待定','','','',''),(91,'鲁VZ9477','货车','2003.11','42411元','','公用车','魏志乐','13406688978','13406688978','1一年养路费5280元,营运费1284元&lt;br&gt;&lt;br&gt;<br>\n2一年保险费3330元&lt;br&gt;&lt;br&gt;<br>\n合计:9894元','','2008-3-22 8:36:16','221.1.107.193','出差','2008-03-22 00:00:00',NULL,NULL,'工程部','待定','送货','公司','潍坊'),(92,'鲁VZ5029','货车','2002.6','77473元','','公用车','张继宝','13589192255','13589192255','1一年养路费5280元,营运费1284元&lt;br&gt;<br>\n2一年保险费4775元&lt;br&gt;<br>\n合计:11339元','1、6月8日更换发电机轴承、闪光器、机油，保养发电机170元。','2006-6-13 15:32:15','222.132.5.197','出差','2008-03-22 00:00:00',NULL,NULL,'工程部','','送货','公司','长沙'),(97,'鲁G34597','货车','2004.12','82604元','','公用车','杨明乐','15910116057','15910116057','1、一年的养路费为7920元，营运费为1284元&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2、一年的保险费为7730元&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n合计：16934元&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n','','2008-3-22 8:44:41','221.1.107.193','公司','2008-03-22 00:00:00',NULL,NULL,'待定','待定','','',''),(99,'鲁GZ4313','货车','2004.10','4.9万元','','公用车','胡成交','13615364777','13615364777','1、一年的养路费为5280元，营运费为1284元&lt;br&gt;<br>\n2、一年的保险费为4882元&lt;br&gt;<br>\n合计：11446元','1、5月20日更换电瓶卡子，保险片34.5元。<br>\n2、6月21日更换机油，机滤，空滤后轮内外油封495元。','2006-6-24 11:10:58','221.1.104.119','公司','2008-03-22 00:00:00',NULL,NULL,'待定','','','',''),(107,'鲁GT7963','货车','2003','43350元','','土建公司','张海勇','13465360463','13465360463','1一年费用4102元&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n2保险费4100&lt;br&gt;&lt;br&gt;&lt;br&gt;<br>\n合计:8202元','','2007-3-15 14:36:26','221.1.107.193','送垫木','2008-03-22 00:00:00',NULL,NULL,'山东办','待定','','',''),(109,'鲁A','轿车','2013/02/13','20102',NULL,'','rock','152','','','','2013-02-28 14:27:37',NULL,'出差','2013/02/01','2013/03/04','rock','jishubu ','rock','','济南','北京');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`type`) values (1,'所有人'),(2,'公司领导'),(3,'技术部'),(12,'工程管理部'),(13,'产品部'),(29,'营销公司'),(32,'设备制造部'),(33,'综合管理部');

/*Table structure for table `from_order` */

DROP TABLE IF EXISTS `from_order`;

CREATE TABLE `from_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_where` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `from_order` */

insert  into `from_order`(`id`,`from_where`) values (1,'诸城市建设局'),(2,'诸城市人民政府'),(3,'潍坊建筑工程管理局'),(7,'诸城市建工处'),(8,'精典公司');

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `grade` */

insert  into `grade`(`id`,`content`) values (1,'一般文件'),(2,'重要文件，阅后请签名注明已阅'),(3,'保密文件，请不要泄露内容'),(4,'重要及保密文件，请保密并回复已阅');

/*Table structure for table `help` */

DROP TABLE IF EXISTS `help`;

CREATE TABLE `help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `typeid` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `help` */

insert  into `help`(`id`,`type`,`title`,`content`,`time`) values (10,'1','关于发布通告','发布通告只有超级用户和录入员才能发布<BR>    <BR>    ','2004-4-15'),(11,'10','系统角色描述','1 角色级别从高到低依次为超级用户,管理员,贵宾,普通员工.<BR>2 录入员为了方便超级用户的工作而设置,录入员依据超级用户的安排录入通告,录入上级文件.<BR>3 贵宾是为了安排在单位工作一段时间的外来人员或上面的领导下来视察工作是设置的。<BR>4 超级用户拥有本系统的一切功能,应按照本单位的实际情况设置1~2<BR>名.<BR>5　普通用户不具备公共信息的车辆状态，修改和超级管理，系统管理的功能。　<BR>6 管理人员可以设置车辆状态，增加上级文件（但不能设置文件属性）    <BR>    ','2004-4-16'),(12,'1','重点：关于行政文件！！！','为了描述方便，在这里将行政文件分为上级文件，上报文件。<BR>一　上级文件<BR>1　输入上级文件。<BR>1.1　操作人员有超级用户，录入员，管理员，贵宾。<BR>1.2　操作方法：超级管理－－文件管理－－增加文件<BR>2  上级文件属性设置.<BR>2.1  拥有上级文件属性设置仅为超级用户.<BR>2.2  上级文件属性有阅读对象(个人和部门)设置,文件级别设置(一般文件,重要文件,保密文件,重要和保密文件)<BR>2.3  操作方法:行政管理--文件管理--文件设置.<BR>二　上报文件<BR>1　操作人员为除超级用户的所有人员。<BR>2　操作方法：行政管理－－上报文件－－增加文件。<BR>　　<BR>    <BR>    <BR>    <BR>    <BR>    ','2004-4-16'),(13,'11','为什么进去后不能正常显示完左边所有的工具栏?','这是因为IE应用了禁止显示弹出或浮动广告导致(一般为3721的功能设置),关闭后,刷新就可以了.','2004-4-17'),(14,'11','为什么我修改了信息却还是原来的?','遇到这种情况,你刷新一下就可以了.','2004-4-17'),(15,'1','如何在上报文件中增加附件?','1 在增加附件中通过浏览选定上传的附件,点上传后附件就自动到文章内容中.<BR>2 上传的附件支持WORD文档,EXCEL表格,图片,压缩包等.<BR>3 上传到文章内容的附件一般为\"upfile/20049347573475.zip\"这样的文件,在阅读文章时点击就可以打开或者下载,为方便阅读者浏览,你应该对此进行解释,比如:<BR>  这是最新的财务报表,请下载:<BR>  upfile/200434953841239479.zip <BR>    ','2004-4-17'),(16,'3','如何在软件下载里增加软件?','你可以通过两种方式增加软件:<BR>1 通过\"添加\"方式,利用这种方式,你必须懂得软件所在的URL地址,比如:<BR>   我在新浪网找到了一个对大家都有用的软件,我把它的URL地址(例:http://www.sina.com/download/sk.zip)加到\"软件下载\"--\"添加\"--\"下载地址\"中.&lt;/P&gt;&lt;P&gt;2  通过\"上传\"方式,这种方式就是将自己本机中的软件上传.<BR>    <BR>    ','2004-4-17'),(17,'4','关于考勤记录的说明.','考勤记录必须要及时设置.比如:我明天要出差,那么我在今天下班前将考勤设为\"出差\",出差回来上班后,要及时将考勤设为\"工作\",如果不改过来,在你的考勤记录就一直是\"出差\"状态.','2004-4-17'),(18,'1','行政管理里文件管理和文件查看的区别(超级用户角色)?','1  文件管理指的是对超级用户,管理员,录入员输入的文件进行查看,阅读对象,文件级别的设置.</P><P>2  文件查看指的是对员工上报的文件进行查看.</P><P>    ','2004-5-5'),(19,'11','为什么我不能上传图片?','这一般是因为你上传的图片的大小超出了限制,或是格式不允许!这种情况请联系管理员!','2004-5-16'),(20,'11','上传功能和UBB代码','如果你利用上传功能上传了图片和文件,应在支持HTML中打上勾,这时候不能应用UBB代码.<BR>同样如果你应用了UBB代码,就不能利用上传功能上传图片或文件,这时,你可以选择UBB中的超链接功能!<BR>','2004-5-16'),(21,'11','我是管理员身份,为什么不能设置车辆状态?','一般是因为超级用户未开放管理员可以设置车辆的权限.<BR>超级用户可以对管理员如下权限进行设置:<BR>1 发布通知权限!<BR>2 设置车辆状态的权限!<BR>3 对本部门员工管理的权限!<BR>4 对上级文件管理的权限!','2004-5-16'),(23,'11','聊天时你是否聊聊,就没法发出信息了呢?','这时需要你清空历史记录,就正常了. ','2004-5-23'),(24,'11','如何解决一打开OA,就每隔几秒有D这个种声音?','这是因为OA应用了刷新功能,调用了系统的一种声音,如何解决这个问题?<BR>以win2000profesonal 为例:<BR>1 打开控制面板,打开声音和多媒体选项.<BR>2 找到windows资源管理器的启动导航,将声音改为无,就OK了.<BR>至于,其它的操作系统因本人没试到,但都大同小别,所以请各位自行解决. ','2004-5-23'),(26,'1','关于行政公文的说明!!!','行政公文是公文批转流程:</P><P>1 任何员工都可以建立公文,但必须指定审阅和复核人员,而且复核人员必须是管理员或超级用户</P><P>2 公文建立后,如果进行了审阅,则不能进行修改删除</P><P>3 审阅复核意见不能进行修改,所以请慎重</P><P>4 复核需指定文件类型,阅读人员,或部门!<BR>    <BR>    <BR>    ','2004-5-31'),(27,'11','关于网络调查?','一个调查项目你只能投一次票,<BR>网络调查系统应用了COOKIES.<BR>','2004-6-2');

/*Table structure for table `helptype` */

DROP TABLE IF EXISTS `helptype`;

CREATE TABLE `helptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `helptype` */

insert  into `helptype`(`id`,`type`) values (1,'行政管理'),(2,'公共信息'),(3,'交流中心'),(4,'个人助理'),(5,'个人信箱'),(6,'超级管理'),(7,'系统管理'),(10,'角色描述'),(11,'常见问题');

/*Table structure for table `job_set` */

DROP TABLE IF EXISTS `job_set`;

CREATE TABLE `job_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `job_set` */

insert  into `job_set`(`id`,`job_type`) values (10,'总经理'),(11,'副总经理'),(12,'部门经理'),(13,'部门副经理'),(14,'一般职员'),(15,'董事长'),(16,'科长'),(17,'副科长');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tname` varchar(16) DEFAULT NULL,
  `partid` varchar(16) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ttext` longtext,
  `time` varchar(200) DEFAULT NULL,
  `view_object` smallint(10) DEFAULT NULL COMMENT '阅读对象的部门id',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`id`,`tname`,`partid`,`title`,`ttext`,`time`,`view_object`) values (1,'rock','3','关于中层干部提报2008年创新工作目标的通知','<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>\r\n<div align=\"left\">各副科级（含）以上人员：</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">根据2008年1月11日董事会文件精神（见OA内部通知），请各位把2007年工作创新及2008年创新目标于1月23日晚12点前按以下方式及时提交。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">1、<b>能在公司上网的：</b>在局域网网上邻居中，找&ldquo;精典建筑&rdquo;计算机，打开共享文档，有&ldquo;中层干部2008年创新工作目标&rdquo;文件，各位可找到自己的名字直接填写内容。（请不要编辑、删除他人填写的内容）</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">2、<b>不能在公司上网的：</b>请各单位负责人通知本单位出差在外的，把写好的内容通过OA发送给山东办张海彬，由张海彬负责给予填写。</div>\r\n<p>&nbsp;</p>\r\n<div align=\"left\">&nbsp;&nbsp;&nbsp; 特此通知&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 山东精典建筑工程有限公司</div>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;二○○八年一月二十二日</p>','2008-1-22 14:35:04',1),(2,'赵玉洪','1','关于办理续借手续的通知','<p>公司各部门:2013</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 凡在物管科有借用物资(工具用具、低值易耗）的各相关部门负责人,至今还未办续借手续的，务必在2008年1月4日前到物管科办理完对帐、续借手续。因公出差不能及时办理的，要电话告知物管科。未及时办理的，所造成的损失全部由当事人负责。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 特此通知</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 物管科</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2008年1月30日</p>','2008-1-30 9:45:20',2),(3,'rock','12','关于管理团队职务任免及分工调整等事项的通知','<div align=\"left\"><b>公司各单位：</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>为应对日趋激烈的市场竞争</b><b>,</b><b>提高公司的市场驾驭能力</b><b>,</b><b>对精典管理团队的职务及分工调整如下</b><b>:</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>王金平任精典公司总经理</b><b>,</b><b>分管财务部、审计部（新设立），主抓战略营销。</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>王绪平任精典公司副总经理兼营销公司总经理</b><b>.</b><b>分管营销公司、工程部、设备制造部、预算部、北京办、钢之杰营销</b><b>.</b><b>主抓战术营销、钢结构工程合同履行和企业文化建设</b><b>.</b><b>是营销风险控制和工程合同履行第一责任人</b><b>.</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>徐文海任精典公司副总经理兼质量安全部经理</b><b>.</b><b>分管技术部、质量安全部、采购部、山东办、钢之杰生产</b><b>.</b><b>主抓技术进步及降低成本</b><b>.</b><b>是工程安全</b><b>(</b><b>包括在建和已竣工工程</b><b>)</b><b>、土建水电暖类工程总承包和各种类型的对外分包合同签定及履行第一责任人</b><b>.</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>其它事项</b><b>:</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>日汇报规定是公司强制性制度</b><b>,</b><b>除副总经理可以以月报形式向总经理汇报外</b><b>,</b><b>其他所有员工执行日报制度</b><b>.</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>工程项目采取营销公司分公司经理</b><b>(</b><b>或营销公司指定的工作人员</b><b>)</b><b>总负责制</b><b>.</b><b>工程部经理</b><b>(</b><b>安仲超</b><b>)</b><b>是所有工程合同施工第一责任人</b><b>,</b><b>在工程合同履行期间工程部经理对所有其它生产系统人员具有业务调度权</b><b>.</b></div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div><b>李金光任设备制造部经理兼非标设备课题组组长</b><b>,</b><b>在课题实施过程中有权调度公司任何资源</b><b>.</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>新设立审计部，刘跃亮任审计部经理，不再担任采购部副经理职务。审计部职能包括公司指定的远程大项目直入工地现场物资采购、对各种经济活动审计、工作纪律督查等。</b></div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div><b>特此通知</b></div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<div><b>山东精典建筑工程有限公司</b></div>\r\n<p>&nbsp;</p>\r\n<div><b>董事会</b></div>\r\n<p><b>二○○八年二月一日</b></p>','2008-2-1 13:18:41',1),(5,'张海彬','32','08年工程管理会议纪要','<DIV>会议主持人：安仲超</DIV><BR><DIV>参加人员：（见签到表）</DIV><BR><DIV>记录人：郑斗军</DIV><BR><DIV>会议内容：1、08年工程项目管理思路。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2、参会人员提出08年施工质量可行性建议。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3、王总就08年工程管理提出几点意见。</DIV><BR><DIV>&nbsp;1、08年工程项目管理思路：</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 安经理对制定的08年工程管理实施细则作进一步讲解讨论（具体修正稿内容见公司OA系统通知）。</DIV><BR><DIV>2、参会人员提出08年施工质量可行性建议：</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 邱淑云：在工程管理上要实行奖罚分明的原则。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 刘金林：进一步加强工地临舍建设，大力宣传公司企业形象。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 王兆庆：现在施工的工程我们对于防漏雨的节点做法不成熟，应从根源上对症下药，从技术上、管理上提高。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 郑斗军：08年加强工程施工质量反馈的整改力度，进一步提高售后服务质量。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 刘秀军：工程验收由项目经理、营销人员参与，安装队长配合。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 李玉宝：对于施工质量反馈问题要具体、明细。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 范文彩：质量要求高的工程安装应由好的施工队伍去干并要奖罚到位。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 刘跃亮：公司技术进步小组08年要抓落实，制定一个可行性的施工程序。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 李洪波：土建与水电部分验收最好按照月施工进度进行验收。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 马志国：对于工程施工过程中的挂靠部门职权要细化，08年加强图纸会审的质量，尽量在工程施工前提出问题。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 冯启宝：施工项目部的技术人员公司应想办法留住，提高工程施工质量。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 时培杰：施工人员工作服与安全帽要统一，劳保用品按时更换。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 金&nbsp; 石：公司应加强技术力量的建设，在工程施工过程中各部门要相互配合，搞好服务。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 孟凡刚：项目部要固定人员应从公司福利上解决。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 邱立光：屋面施工工程应加强锁边设备的投资，对于正常损坏的设备公司及时更换。</DIV><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp; 李福胜：项目部人工费在支取上要及时。</DIV><BR><DIV>&nbsp; 3、王总：关于08年工程管理的几点意见：</DIV><BR><DIV>一、细化工程管理：</DIV><BR><DIV>⑴责任到人：派驻工地的项目经理、安装队长、技术员、质量安全监督员既要分别对</DIV><BR><DIV>整体工程负责，又要将工程分段管理责任到人。出现质量、安全、工期责任问题，按</DIV><BR><DIV>不同的权重比例考核到人。技术部、采购部、预算部、北京办、山东办部门负责人也</DIV><BR><DIV>要包靠项目。工程部要具体落实细则好的工程奖励也要按不同的权重比例奖励到人。</DIV><BR><DIV><BR><DIV><BR><DIV><BR><TABLE cellSpacing=0 cellPadding=0 align=left vspace=\"0\" hspace=\"0\"><TBODY><TR><TD vAlign=top align=left><BR><DIV>（2）注重过程控制：在关键节点处，要注重验收签字。质量安全部落实。⑶注重竣工内部验收：组织有关人员，按照评分标准打分。分值高的给予奖励，分值低的两次给予警告，效果改进不明显的取消安装队长资格，由工程部明确细则，并抓落实。</DIV><BR><DIV>二、关于人工费的管理：只要具备入账条件且已经入帐的，该付的公司不拖欠。我们同时也给安装队长提出新的要求，必须在工程质量方面、安全方面、工期方面严格把关。特别是在工期方面有些安装队存在不正确的认识，少雇工、少付人工费，拖延工期必须制定措施解决。<BR clear=all>三、关于质量安全监督员、技术员的管理：</DIV><BR><DIV>⑴在工地的伙食问题要搞点措施解决。⑵质量监督员、技术员若干得合格又有信心当好安装队长，经公司同意可以再组建安装队伍。⑶在工地要记好工作日志。⑷抓紧学习补好实践这一课，整体提高工作水平，综合评价提高不快的可以考虑发实习工资在公司学习，什么时候学习进不了，可以再到工地工作。<BR clear=all>四、对于工程管理公司的指导思想：1、公司的指导思想是让好的安装队长做大、做强并要获得较好的收益；对于表现差的、特别是对损害公司利益和品牌的坚决给予严肃处理。任何人可以与公司搞智慧的交融和工作的交流，但不要跟公司对抗“小聪明”。安装队长要不断进步和学习，积极报考建造师。在实践上要不断的总结、完善，搞一些技术创新，并且要学习一些管理知识，公司给你们提供了一个当小老板的条件，要利用好这个平台。我们公司同时鼓励也会制定措施让有能力的人充实到工程管理一线，去发挥自己的聪明才智。2、08年安装管理、制造管理要搞好制度建设、标准建设。工程部、质量科必须制定出试行的工程管理细则。一旦确定的东西必须不折不扣的执行。除非公司要修改。<BR clear=all>五、关于直属队和营销项目总负责问题的说明：1）公司直属安装队在安装费用上不应超过其它承包安装队伍。2）营销项目总负责是指营销人员在项目攻关、协调上对于工程实施过程中的一些大问题去处理，小的问题仍然要求安装队长去做。另外对项目的运作过程有监督、考核权，并对整个项目的收益负责。</DIV><BR><DIV>六、谈两个问题：1）对于过去工程的漏雨问题，我们一定要加大力度去整改，搞好工程的售后服务质量，对于单独成立的售后服务人员，要有管理办法。2）08年必须遏制新建工程的漏雨问题，具体要求措施明确，落实清楚。</DIV><BR><DIV><BR><DIV>七、关于工作报告的说明：工作报告要讲究一种模式，便于工作管理，以手机短信的形式。工作应早计划，未雨绸缪且早有措施去预防。</DIV></DIV></TD></TR></TBODY></TABLE></DIV></DIV></DIV>','2008-2-25 14:46:16',1),(6,'张海彬','33','08年1月份生产例会会议记要','<DIV>会议主持人：安仲超</DIV><BR><BR><DIV>参加人员：王总、营销公司分经理、各部门科室负责人、生产车间、安装队长、工地技术员、质量管理员。</DIV><BR><BR><DIV>记录人：郑斗军</DIV><BR><BR><DIV>会议议程： </DIV><BR><BR><DIV>一、08年上半年工程管理的主要工作</DIV><BR><BR><DIV>二、各安装队承建项目的计划安排</DIV><BR><BR><DIV>三、本部门管理人员日工作报告提交的说明</DIV><BR><BR><DIV>四、新建项目签定内部承包合同</DIV><BR><BR><DIV>五、2008年工地物资管理规定(财务部)</DIV><BR><BR><DIV>六、2008年物资审计工作思路(审计部)</DIV><BR><BR><DIV>七、问题交流</DIV><BR><BR><DIV>八、公司领导讲话</DIV><BR><BR><DIV>九、形成会议决议项</DIV><BR><BR><DIV>一、 08年上半年工程管理的主要工作</DIV><BR><BR><DIV>1.、参与项目管理的人员职责分工</DIV><BR><BR><DIV>1》营销经理职责：</DIV><BR><BR><DIV>1）负责项目工程建设单位、建设主管部门及监理单位等主要关系的协调；</DIV><BR><BR><DIV>2）对施工现场的工期、质量、安全有监督考核的权力；</DIV><BR><BR><DIV>3）负责工程竣工验收参与各方关系的协调；</DIV><BR><BR><DIV>2》安装队长(项目经理)职责</DIV><BR><BR><DIV>1）根据图纸设计及合同约定的要求，合理组织施工，按时保质保量的完成施工任务；</DIV><BR><BR><DIV>2）全面负责工地的质量和安全管理，包括建立健全各项质量安全施工制度，对工人进行安全教育，及时消除发现各种安全隐患。是现场质量问题、安全隐患的第一责任人；</DIV><BR><BR><DIV>3）组织编制施工组织设计方案、安装计划、人员计划、资金使用计划等，并落实执行。</DIV><BR><BR><DIV>4）负责与施工现场业主、监理、质监站的协调工作，平衡施工现场各方关系。</DIV><BR><BR><DIV>5）负责组织工程的竣工验收，及时归档工程安装资料和其他有关文件。</DIV><BR><BR><DIV>6)配合做好各种签证工作；</DIV><BR><BR><DIV>7)分区域包干部分质量安全问题进行监督管理;</DIV><BR><BR><DIV>&nbsp;3》技术员的职责</DIV><BR><BR><DIV>1)在安装队长领导下，负责现场工程的技术指导及交底工作；</DIV><BR><BR><DIV>2) 负责项目工程的技术资料的报验及竣工资料的汇总工作；</DIV><BR><BR><DIV>3)对现场的安全、质量进行检查，对现场的问题提出整改方案实施，每日检查有记录；</DIV>4)负责现场的零星签证工作；<BR><BR><DIV>5)配合质量员对外协的分部分项工程进行检查及验收，并有检查记录；</DIV><BR><BR><DIV>6)分区域包干部分质量安全问题进行监督管理;</DIV><BR><BR><DIV>4》质量员（兼安全员）的职责</DIV><BR><BR><DIV>1）具体负责对现场的质量、安全进行检查，及时发现现场的质量问题及安全隐患，提出整改方案并监督实施，每日检查要有记录；</DIV><BR><BR><DIV>2）负责报建工程安全资料的搜集及汇总工作，做到及时报验及备案；</DIV><BR><BR><DIV>3)负责分部分项工程的验收，并如实出具验收报告；</DIV><BR><BR><DIV>4)负责对外协的分部分项工程做好检查及验收，并有检查记录；</DIV><BR><BR><DIV>5)分区域包干部分质量安全问题进行监督管理;</DIV><BR><BR><DIV>5》挂靠部门负责人的职责:</DIV><BR><BR><DIV>1)随时掌握工程施工情况,协助及监督安装队长对项目进行质量及安全管理;</DIV><BR><BR><DIV>2)不定期对项目工程的施工情况进行质量及安全检查,并有检查记录及问题整改情况落实的记录;</DIV><BR><BR><DIV>3)针对项目工程的特点,帮助安装队长制定至少3项提高施工质量的可行措施;</DIV><BR><BR><DIV>2 、全面落实质量及安全考核管理办法</DIV><BR><BR><DIV>(1)施工过程的质量控制及安全隐患检查，具体由现场的安装队长、技术员、质量员负责实施，每日检查必须有记录，由技术员负责填写，发现的质量问题及安全隐患，有整改措施及复核记录；并如实填写<U>《工程质量安全检查日志》</U><U>,</U>每月25日前交公司生产计划科；</DIV><BR><BR><DIV>(2)施工过程出现的质量及安全问题，由建设单位及监理公司反馈或由公司查出，给公司造成的损失由安装队长承担<B>60</B><B>％</B>的责任，项目经理承担10％的责任，技术员和质量检查员各承担7％的责任；工程部及质量安全部经理各负5%的责任,总负责的营销经理及挂靠的部门经理各负3%的责任；质量问题出现区域的分段包干管理人员增负5％的责任；</DIV><BR><BR><DIV>(3)工程竣工后，由质量安全部组织相关部门对工程进行内部验收，并对工程实体进行评分，公司将根据评出的分数对相关责任人进行考核，评分及考核标准如下（附评分表）：</DIV><BR><BR><DIV>1）凡参与工程质量检查评分的人员，须如实打分，不得弄虚作假。</DIV><BR><BR><DIV>2）评分完毕后，评分人员交于质量安全部统计，算出平均得分，统计分数公布于公司内部网上，根据得分对项目有关人员进行奖励或考核。</DIV><BR><BR><DIV>3）凡工程平均得分低于70分以下的工程，将受到考核，90分以上的工程将予以表彰。</DIV><BR><BR><DIV>4) 连续二个项目得分最低的安装队,安装队将予以警告,第三个项目再得分最低,予以取消。</DIV><BR><BR><DIV>4)考核标准：</DIV><BR><BR><DIV>&nbsp;5000㎡以下工程，奖励或考核1000-2000元。</DIV><BR><BR><DIV>&nbsp;5000--20000㎡的工程，奖励或考核2000-4000元。</DIV><BR><BR><DIV>&nbsp;20000—40000㎡的工程，奖励或考核4000-6000元。</DIV><BR><BR><DIV>&nbsp;40000㎡以上的工程，奖励或考核6000-10000元。<BR><BR><DIV>(5）比例分配：</DIV><BR><BR><DIV>项目经理（安装队长）占70%；（对有项目经理负责的安装队，项目经理占10%，</DIV><BR><BR><DIV>安装队长占60%。）</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 技术员、质量员各占7%；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 工程部及质量安全部经理各占5% </DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 项目总负责的营销经理及挂靠的部门经理各占3%</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 顺利完成并通过竣工验收并且2年内无漏雨等质量问题反馈的工程，给予项目工程每平方米0.3元的奖励；但出现质量反馈，由安装队进行一次整改后,仍有漏雨等质量问题的,按每次每处500元进行处罚；（奖罚比例：安装队长：项目经理：技术员：质量员：工程部经理:质量安全部经理:项目总负责的营销经理：挂靠的部门经理――6：1：0.7：0.7：0.5: 0.5:0.3:0.3）</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 通过竣工验收，并由建设行政主管部门评定为省级以上优良奖项的，且两年内没有漏雨等质量问题返馈的，给予项目工程每平方1元的奖励（奖罚比例：安装队长：项目经理：技术员：质量员：工程部经理:质量安全部经理:项目总负责的营销经理：挂靠的部门经理――6：1：0.7：0.7：0.5: 0.5:0.3:0.3） </DIV><BR><BR><DIV>3 、已经完工的项目漏雨等质量问题的整改方案</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1)针对前期已经完成的项目,反馈的漏雨等主要质量问题,成立一维修小组,由公司安装队伍抽出人员组成,在雨季来临前进行专业治理;</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2)由质量安全部组织工程部/技术部对前期反应漏雨多的项目进行检查,查明漏雨原因,并出具可行的治理方案后,由工程部组织维修小组进行治理;</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (3)维修结果由质量安全部落实考核;</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (4)此次漏雨等质量问题整改所发生的费用,由原施工的安装队承担;</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (5)维修人员到达维修现场后，应及时与客户进行联系，取得客户配合，维修完毕后，邀请客户验收并在质量信息反馈单上签认维修服务情况</DIV><BR><BR><DIV>4 、重点项目临设标准化,提高公司的形象宣传</DIV><BR><BR><DIV>&nbsp;1）根据现场情况，由项目部绘制符合要求的平面布置图，现场临设/材料/设备等的摆放，必须符合平面布置图的要求；</DIV><BR><BR><DIV>&nbsp; 2)根据工程情况,搭建符合规定的临时设施;加大公司形象宣传的力度(工作报/条幅/标语等); </DIV><BR><BR><DIV>3)办公室和职工宿舍要求地面平整,桌面清洁,责任到人。</DIV><BR><BR><DIV>&nbsp; 4)施工现场生活垃圾定点存放,定期清理;</DIV><BR><BR><DIV>&nbsp; 5)规范施工现场用电，线路布置在平面布置图中体现，并报工程部审核后实施；</DIV><BR><BR><DIV>&nbsp; 6）对现场管理混乱的项目，公司将予以网上曝光，并对相关责任人进行考核；</DIV><BR><BR><DIV>二、各安装队承建项目的计划安排</DIV><BR><BR><DIV>&nbsp;1.文辉公司刘金林队：</DIV><BR><BR><DIV>&nbsp;1）北京康明斯项目：2月29日完成一区屋架梁吊装；2月29日完成二三区屋架梁的安装；</DIV><BR><BR><DIV>2）北京万里扬项目：构件2月21日开始进场；整个项目要求在4月30日完成；</DIV><BR><BR><DIV>安装队提供详细的进度计划及施工方案---2月18日</DIV>考查现场并绘制现场平面布置图---2月18日<BR><BR><DIV>&nbsp;&nbsp; 临设搭建及工人进场---2月20日完成</DIV><BR><BR><DIV>&nbsp; 2.文辉公司李洪波队：</DIV><BR><BR><DIV>&nbsp;1）成都项目收尾:确定好收尾的管理人员,并把现场的剩余工程量做详细统计并根据建设单位设备安装情况排施工计划---2月21日把计划报生产计划科;</DIV><BR><BR><DIV>&nbsp;2)昆明云内项目:</DIV><BR><BR><DIV>&nbsp; 现场平面布置图及临设搭建---2月28日;</DIV><BR><BR><DIV>&nbsp;施工组织设计---2月20日;</DIV><BR><BR><DIV>&nbsp; 现场用电方案---2月20日;</DIV><BR><BR><DIV>&nbsp; 入云南施工的备案---2月28日</DIV><BR><BR><DIV>&nbsp;钢结构安装人员组织/人员名单/投保---2月18日</DIV><BR><BR><DIV>&nbsp;根据安装队现有人员先安排小项目施工;为该项目钢构安装时间节点储备人员;</DIV><BR><BR><DIV>&nbsp;土建/水电/管理与营销经理商定后再确定实施方案;</DIV><BR><BR><DIV>&nbsp; 3.工程部刘秀军队:</DIV><BR><BR><DIV>&nbsp;1)北京欧v客车1#焊装车间收尾:</DIV><BR><BR><DIV>&nbsp; 窗台包件/屋顶风机洞口及找漆等工程量---根据土建进度及风机安装情况配合施工;</DIV><BR><BR><DIV>&nbsp;2)潍柴动力气体机及发电机公司厂房:</DIV><BR><BR><DIV>&nbsp; 考查现场并确定现场平面布置图---2月16日;</DIV><BR><BR><DIV>&nbsp;临设搭建方案/现场形象宣传方案---2月16日;</DIV><BR><BR><DIV>&nbsp; 临设搭建及工人进场 ---2月20日</DIV><BR><BR><DIV>&nbsp;施工组织设计及施工进度计划---2月16日</DIV><BR><BR><DIV>&nbsp;气体机厂房构件进场时间---2月21日</DIV><BR><BR><DIV>&nbsp;气体机厂房完成时间&nbsp; ---4月15日</DIV><BR><BR><DIV>&nbsp;发电机厂房构件分四个区 ---3月1日开始陆续进场;</DIV><BR><BR><DIV>&nbsp;发电机厂房屋面底板及墙面内板完成时间---4月30日</DIV><BR><BR><DIV>&nbsp; 发电机厂房屋面顶板及墙面外板及气楼安装完成---5月30日;</DIV><BR><BR><DIV>&nbsp;&nbsp; 4.工程部金石安装队:</DIV><BR><BR><DIV>&nbsp;&nbsp; 1)潍柴动力再制造公司厂房:</DIV><BR><BR><DIV>&nbsp; 考查现场并确定现场平面布置图---2月16日;</DIV><BR><BR><DIV>&nbsp;&nbsp; 工人进场 ---2月28日</DIV><BR><BR><DIV>&nbsp;&nbsp; 施工组织设计及施工进度计划---2月16日</DIV><BR><BR><DIV>&nbsp;&nbsp; 主钢构件分四个区 ---3月1日开始陆续进场;</DIV><BR><BR><DIV>&nbsp; 屋面底板及墙面内板完成时间---4月30日</DIV><BR><BR><DIV>&nbsp; 屋面顶板及墙面外板及气楼安装完成---5月30日;</DIV><BR><BR><DIV>&nbsp; 5.工程部徐连楼安装队:</DIV><BR><BR><DIV>&nbsp; 1)奥铃汽车厂焊装车间接跨工程:</DIV><BR><BR><DIV>&nbsp;屋面板完成---2月17日</DIV><BR><BR><DIV>&nbsp; 墙面板完成---2月26日</DIV>门及包件等---2月28日<BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2)山东福润塑业有限公司新建车间</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 现基础正在施工,计划吊装时间3月5日;</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 安装队人员提前组织;</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 .工程部孟凡刚安装队</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）万隆机械1/3/4生产车间收尾</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 部分雨蓬及包件---2月28日完成；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 落水管及门—根据土建施工情况配合安装</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2）山西青特项目：</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 临设方案及平面布置图：2月22日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 现场情况考查：与建设单位交流定在2月22日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 人员提前准备，进场时间待现场考查好后再定；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 构件按原计划加工；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7 .工程部邱立光安装队</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）潍坊海默机械工程</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 人员进场---2月15日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 屋面板锁边部位找漆---3月10日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 剩余的部分包件---3月10</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 二层施工及落水管根据与设计院联系情况待定；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2）陕西重汽项目</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 预计安装时间3月上旬；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 施工人员要提前准备；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.工程部王强安装队</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）长沙海德威机械生产车间</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 人员进场---2月16日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 剩余的雨蓬及门安装---2月29日完成；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2）长沙义和车桥生产车间</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 剩余南跨屋面板---2月29日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 雨蓬安装及门安装---3月15日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 气楼安装---3月20日（车间将材料在2月16日前包装完成）</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9.工程部李福胜安装队</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）诸城义和车桥项目</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 临设搭建及人员进场---2月21日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 施工方案及进度计划提报---2月18日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 主体完成时间---3月5日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 围护完成时间---3月31日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2）万隆机械5#生产车间</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 吊装时间根据建设单位原因待定</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 已经安装的部分钢柱用系杆连接----2月29日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10 .工程部董金运安装队</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）徐工轮胎硫化车间屋面底板---2月29日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 屋面顶板---3月30日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11 .工程部时培杰安装队</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）徐工轮胎装配车间一</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 主体完成---2月25日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 屋面板完成---3月30日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2）徐工轮胎装配车间二</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据土建进度安装时间待定</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12 .新成立文辉公司安装队</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 由尹秀臣负责</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）中铝水洗车间</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 工机具及人员准备完成时间---2月20日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 临设搭建及人员进场—2月21日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 构件进场时间---2月21日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 主体完成时间---3月5日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 围护完成时间---3月30日</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据以上时间节点提报施工进度计划---2月18日</DIV><BR><BR><DIV>三、本部门管理人员工作报告提交的说明</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 .工程部管理人员（生产车间/设备科/发车办/生产计划科）每日按时报交工作报告，工作报告的表格见附表；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 此表格由生产计划科放在内部网上，各相关人员从网上下载，自2月15日开始试用此表格；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如实填写自己的工作内容；充实，工作安排事前有计划，事中有控制，事后有落实；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 考核按公司规定的办法执行；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 .项目安装队长日工作报告以短信的形式发到工程部经理手机中；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 提报的内容：1）今天工程的施工情况及明天的施工计划；2）需要公司帮助协调的材料/技术等问题；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 要求施工情况具体到每一个分部分项工程，如实填写；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 日工作报告必须每天提报，每超过1天负激励10元 </DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 .项目部技术员日工作报告</DIV><BR><BR><DIV>项目部技术员每天的工作情况填写《工程质量安全检查日志》，要求每天及时填写，且内容要具体，贴合实际工作；月底报工程部生产计划科，生产计划科对提报的检查日志的质量进行考核，对填写不实，不具体，月底乱编的每发现一次，对相关人员负激励50元，并网上曝光；每月评出最差的一份检查日志，网上通报，连续两次最差，对相关人员负激励50元，连续两次最好，对相关人员正激励50元。</DIV><BR><BR><DIV>四、新建项目签定内部承包合同</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1）潍柴气体机厂房（刘秀军）</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2）潍柴发电机厂房（刘秀军）</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3）潍柴再制造厂房（金石）4）诸城义和车桥生产车间（李福胜）</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5）中铝水洗车间（尹秀臣）</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6)山西青特生产车间(孟凡刚)</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 合同签定以后，工程款严格按合同要求支付；</DIV><BR><BR><DIV>n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 质量/安全/工期目标明确，考核严格按合同执行；</DIV><BR><BR><DIV>五、2008年工地物资管理规定(财务部)</DIV><BR><BR><DIV>六、2008年物资审计工作思路(审计部)</DIV><BR><BR><DIV>主要工作思路：2008年审计部工作思路：“采购第一，审计第二”</DIV><BR><BR><DIV>七、&nbsp; 问题交流</DIV><BR><BR><DIV>1）刘金林：屋面气楼可改为栓接（康明斯），降低生产费用；技术员会操作节点做法吗？要培训去学习，实践性的东西要好好学习。</DIV><BR><BR><DIV>2）阳经理：包装工程具体细化。</DIV><BR><BR><DIV>3）齐经理：加强图纸分析控制，避免错误发生。</DIV><BR><BR><DIV>4）郭华超：技术员与质量员分开，工地施工人员保险应由公司承担且必交。</DIV><BR><BR><DIV>5）张&nbsp; 鹏：公司文件要发往工地，加强公司网站建设。</DIV><BR><BR><DIV>6）马松松：图集要规整（公司节点做法）；每月25日前报电子版到公司；市场部与工程部协调部分，沟通后共同负责。</DIV><BR><BR><DIV>7）周鹏训：作资料的费用应由公司办理。</DIV><BR><BR><DIV>8）周坤训：技术员投保。</DIV><BR><BR><DIV>9）王&nbsp; 剑：中铝工程拼板角度要控制；拉条丝与帽不配套；双拉条与单拉条的区别，尽量采用双拉条，以调平檩条；屋面板漏雨与操作工人有直接关系，应固定人员操作。 </DIV><BR><BR><DIV>10）张立滨：给技术员配备卡尺、焊缝量规等测量仪器，以检查构件质量；地脚螺栓有偏差；会议纪要应按时发放；工机具要加强维修，合格出厂；屋面漏雨应加强过程控制。</DIV><BR><BR><DIV>11）邱家军：HV---760板比HV---475防雨效果好。</DIV><BR><BR><DIV>12）刘鲁滨：公司尽量要少调动，一个工程干到底。</DIV><BR><BR><DIV>13）王永涛：关键部位与关键性节点要好好学习，按强制性条文去实施。</DIV><BR><BR><DIV>14）董宗峰：技术员应加强质量检查，尤其与交底是否相符的过程；售后服务由质量部出方案，实施由工程部组织，制定维修方案。</DIV><BR><BR><DIV>15）金学洪：雨篷栓接比焊接好看，可推广一下。</DIV><BR><BR><DIV>16）徐兆清：土建与钢构结合处、交接处的做法。</DIV><BR><BR><DIV>17）李金光：工地施工严格按图纸施工，改图应有人确定，规范施工。</DIV><BR><BR><DIV>18）初永刚：锁边机的人员要尽量稳定，工地设备损坏的维修费用由谁承担。</DIV><BR><BR><DIV>19）阚永利：HV---475锁边机的搭设平台，建议好的节点做法与经验。</DIV><BR><BR><DIV>20）王志法：零星活要有计划。</DIV><BR><BR><DIV>21）范文彩：后勤应加大对前线的支援。</DIV><BR><BR><DIV>22）李玉宝：屋面压条螺丝要拧紧，春节前应加大对人员招收的力度。</DIV><BR><BR><DIV>23）彭玉祥：外协量大，质量控制不足。八、公司领导讲话</DIV><BR><BR><DIV>王总：1）各安装队长是整个工程的直接责任人，利益与风险共担，把核心人员想办法</DIV><BR><BR><DIV>稳住，首先从工资上按时发放，足额发放；工程部要考核工资发放情况。</DIV><BR><BR><DIV>2）到2008年年底再对安装队长作一综合评比；</DIV><BR><BR><DIV>3）安全问题：制定措施并落于实处；</DIV><BR><BR><DIV>4）工地上的工人必须培训，由安装队长和技术员作示范，过程中要监督，加强过程的整改控制；</DIV><BR><BR><DIV>5）关于竣工工程的验收表格要全面；</DIV><BR><BR><DIV>6）安装队伍的建设问题，可成立新的安装队伍，不合格的安装队可以取消。</DIV><BR><BR><DIV>7）今年我们工程管理团队每一个人一定要很好的操起心来，好好干活，多干活以创造效益。</DIV><BR><BR><DIV>九、形成会议决议项</DIV><BR><BR><DIV>1）各项目部配备一台水准仪、一台经纬仪</DIV><BR><BR><DIV>&nbsp;</DIV><BR><BR><DIV>完成时间：2月29日责任人：秦似云</DIV><BR><BR><DIV>&nbsp;</DIV><BR><BR><DIV>2）工程部管理人员按照新的要求填写OA系统日工作汇报：</DIV><BR><BR><DIV>&nbsp;</DIV><BR><BR><DIV>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完成时间：2月15日责任人：工程部各管理人员</DIV><BR><BR><DIV>&nbsp;</DIV><BR><BR><DIV>3）各项目部在工程施工前必须签订施工合同</DIV><BR><BR><DIV>&nbsp;</DIV><BR><BR><DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 完成时间：从08年2月15日开始，责任人：各施工队长</DIV><BR><BR><DIV>&nbsp;&nbsp; 4）工程部项目经理、安装队长、技术员每天以短信的形式向安经理汇报当日工程安装进度与工作中需要协调的事情。</DIV></DIV>','2008-2-25 14:52:13',12),(7,'董宗峰','32','关于2008年2月15日--29日质量安全的通报','<DIV>一、北京康明斯项目（安装队：刘金林）</DIV><BR><DIV>1、构件吊装时部分构件表面泥土未清理，通知安装队并已经整改。</DIV><BR><DIV>2、进场构件摆放过于混乱，需要重新整理。</DIV><BR><DIV>3、进场构件表面油漆有部分划伤严重，需要找补漆。</DIV><BR><DIV>二、青特实验室（安装队：刘金林）</DIV><BR><DIV>1、部分钢柱柱脚垫块未安装。</DIV><BR><DIV>2、二层平台梁连接螺栓漏穿三处。</DIV><BR><DIV>3、屋面檩条拉到梁上后，未及时用螺栓固定。</DIV><BR><DIV>三、潍坊海默工程（安装队：邱立光）</DIV><BR><DIV>1、因该工程停工时间太长，主构件返锈严重。</DIV><BR><DIV>2、西山外墙板显缝严重。</DIV><BR><DIV>3.屋顶板锁边后掉漆相当严重，项目部正在整改中。</DIV><BR><DIV>四、徐州徐轮硫化车间（安装队：董金运）</DIV><BR><DIV>1、爬坡檩条焊点未刷防锈漆。</DIV><BR><DIV>2、屋面顶板部分污染。</DIV><BR><DIV>3、屋面锁边有两区跳机锁缝翘起每处40cm左右。</DIV><BR><DIV>五、徐州徐轮装配车间（安装队：时培杰）</DIV><BR><DIV>1、东边跨屋面拉条不顺直，因制作错误。</DIV><BR><DIV>六、诸城万隆机械公司1#、3#、4#厂房（安装队：孟凡刚）</DIV><BR><DIV>1、屋面采光板搭接处端头未按照图纸方式固定。</DIV><BR><DIV>七、诸城市紫阳陶瓷（安装队：徐连楼）</DIV><BR><DIV>1、因施工周期长，构件返锈严重。</DIV><BR><DIV>2、车间高，个别工人安全意识不强，需特别注意安全帽，安全带的佩带。</DIV><BR><DIV>八、车间加工制作质量隐患检查情况（车间负责人：孙福友、张崇武、赵成武）</DIV><BR><DIV align=left>1、潍柴气体发动机总装厂房工程：</DIV><BR><DIV align=left>1）钢柱翼缘板表面分层长度60MM.宽度40MM,已组立并焊接成型,经矫正机矫正后分层出掉下,出现疤痕较明显,通知车间用焊条补焊并打磨平整,共1件不合格.</DIV><BR><DIV>2）钢柱小件拼装要求车间墙面檩托与加肋板连接焊缝先焊完矫正合格后再拼在钢柱上,未焊接矫正已拼装,导致气保焊焊后不均匀.焊偏,通知车间将未焊接部分全部打掉重新焊接并矫正合格后再拼装,否则将考核车间管理责任。</DIV><BR><DIV>3）女儿墙柱长度2560M未采用自动焊已拼装小件共28根气保焊后焊缝不均匀焊瘤已焊接4根不合格,通知车间必须采用自动焊将已拼装小件部分全部打掉,自动焊后再拼装.</DIV><BR><DIV align=left>4）钢柱小件拼装,柱顶板弯曲严重未矫正将弯曲面朝外拼装已焊完,用靠尺检查弯曲10MM已转入抛丸工序,编号,C-9,柱间支撑接点板周转时碰弯严重,未矫正已转入涂装工序,编号,C-7,以上2根钢柱不合格已标识通知车间整改,限当天整改完毕,整改后复查合格.</DIV><BR><DIV align=left>5）钢柱数控下料组立：翼缘板边缘咬边严重，深度3-4MM,长度5-10MM未修补,组立工序未互检已组立成型并焊完,编号,C-13,3处,C-11,2处,C-8,2处,A-11,3处,A-4,2处,A-12,2处,共6根钢柱14处不合格,通知车间返修,限当天返修完毕,返修后复查合格,根据质量考核办法第3.1.1条数控下料咬边未修补考核70元,组立工序未互检已组立成型考核40元。</DIV><BR><DIV align=left>6）除锈涂装,牛腿加肋板与腹板连接焊缝,柱顶加肋板焊缝飞溅物处理不彻底,涂装工序未互检已涂装,编号,A-12,A-3,A-6,C-8,C-13,共5根不合格,根据质量考核办法第3.5.1条飞溅物处理不彻底考核60元,涂装工序未互检已涂装考核40元。</DIV><BR><DIV align=left>7）屋面Ｚ型檩Ｚ２００Ｘ６０Ｘ２０Ｘ２．０镀锌带钢宽度与计划宽５-７ＭＭ，压制过程中设备未调试准确导致压制成型后２０部位偏差８-１０ＭＭ，共６０余根，通知车间停止压制先调试设备，根据质量考核办法第３.８.２条考核１２０元。</DIV><BR><DIV align=left>8）钢柱周转过程中将柱间支撑节点板碰弯变形严重，共2件不合格。</DIV><BR><DIV align=left>&nbsp;2、青岛中铝工程：</DIV><BR><DIV align=left>1）屋面Z型檩250X75X20X2.5用带钢,计划要求宽度430MM,利用库存只有420MM宽,压制成型后,20部位只有15MM达不到图纸要求,联系采购部张德吉到车间了解,要求重新采购合格带钢,通知车间停止压制。</DIV><BR><DIV align=left>2）角钢柱间支撑涂装,铁红底漆漆膜未干又涂装面漆,导致流挂严重表面出现红色,编号,ZC-1共2组不合格,通知车间重新找补面漆,返修后复查合格.</DIV><BR><DIV align=left>3、潍柴发电设备动力项目：</DIV><BR><DIV align=left>1）Q235B墙面檩条带钢计划要求进-2.0X363经检查测量-2.0X355,负8MM,与营销公司庸经理及采购部交流,庸经理要求;C200X60X20X2.0, 20部位不小于3-5MM可以使用,通知车间先压制测量符合上述要求后再批量压制,复查时基本符合上述要求.</DIV><BR><DIV align=left>2）钢柱自动焊焊缝烧穿部位用4MM焊条补焊,补焊处焊脚尺寸太大未用磨光机打磨平整及平行过度,导致焊脚尺寸大10-15MM,图纸设计为6-8MM,影响焊缝外观质量,共8根,每根4-6处不合格,通知车间返修,限当天返修完毕,并要求车间更换3.2MM焊条,以减少打磨.</DIV><BR><DIV align=left>3）钢柱翼缘板,-14X340表面出现分层长度300MM宽度20MM,共2件,已组立焊接成型转入小件拼装工序,通知车间用焊条补焊并用摸光机打磨平整.</DIV><BR><DIV align=left>4）钢柱小件拼装柱底抗剪键用５快-２０Ｘ１００钢板组合间隙太小小件拼装后无法焊接，通知车间先焊完后在拼装，防止焊接后焊缝不合格，共１２根钢柱．</DIV><BR><DIV align=left>5）钢梁自动焊：翼缘板与腹板连接焊缝烧穿部位和补焊部位，未用3.2mm焊条补焊，导致补焊处出现疤痕，焊脚尺寸过大，未打磨平整，考核100元。</DIV><BR><DIV align=left>4、北京万里扬工程：拉条涂装：面漆未覆盖红丹底漆，表面出现红色，共1860件不合格。</DIV><BR><DIV>九、检查外协青岛中铝工程构件加工质量：</DIV><BR><DIV>1）检查发现钢柱.钢梁自动焊焊缝不均匀,焊偏.烧穿部位修补不到位,部分未修补,翼缘板边缘咬边严重未修补已开始拼装小件共16件不合格,已开具质量整改通知单,要求返修。</DIV><BR><DIV>2）2月15日所开具质量隐患整改通知单未整改彻底,钢柱气保焊焊缝不均匀,焊瘤.焊偏焊脚尺寸太小,达不到图纸要求,钢柱小件拼装,牛腿加肋板割短间隙太大20MM宽,针对质量隐患对该公司领导说明必须按规范及图纸要求返修,下次再查处整改不彻底将按情况扣除加工费.</DIV>','2008-3-1 10:48:35',13),(9,'rock','3','元宵节放假通知。。、','<p>元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、</p>','2013-02-22 10:19:27',1),(11,'rock',NULL,'加班通知','<p>加班通知加班通知加班通知加班通知加班通知加班通知</p>','2013-02-22 10:59:30',13),(12,'rock',NULL,'x','<p>s</p>','2013-02-23 09:51:49',3);

/*Table structure for table `receive_mail` */

DROP TABLE IF EXISTS `receive_mail`;

CREATE TABLE `receive_mail` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressee` int(20) unsigned DEFAULT NULL COMMENT '收件人',
  `send_mail_id` int(20) unsigned NOT NULL COMMENT '邮件id',
  `iscopy` enum('y','n') DEFAULT 'n' COMMENT '是否抄送',
  `isread` enum('y','n') DEFAULT 'n' COMMENT '是否已阅读',
  `addresser` int(20) NOT NULL COMMENT '发件人',
  `isdelete` enum('y','n') DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `receive_mail` */

insert  into `receive_mail`(`id`,`addressee`,`send_mail_id`,`iscopy`,`isread`,`addresser`,`isdelete`) values (1,2,4,'y','n',5,'n'),(2,5,5,'n','y',5,'y'),(3,4,6,'n','n',3,'n'),(4,4,6,'y','n',3,'n'),(5,2,6,'y','n',3,'n'),(6,1,6,'y','n',3,'n'),(7,1,7,'n','n',5,'n'),(8,3,7,'y','n',5,'n'),(9,2,7,'y','n',5,'n'),(10,2,8,'n','n',5,'n'),(11,2,8,'y','n',5,'n');

/*Table structure for table `send_mail` */

DROP TABLE IF EXISTS `send_mail`;

CREATE TABLE `send_mail` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressee` varchar(200) DEFAULT NULL COMMENT '收件人',
  `copy` varchar(200) DEFAULT NULL COMMENT '抄送',
  `title` varchar(200) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` text,
  `addressor` varchar(200) DEFAULT NULL COMMENT '发件人',
  `filename` varchar(200) DEFAULT '',
  `isdelete` enum('y','n') DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `send_mail` */

insert  into `send_mail`(`id`,`addressee`,`copy`,`title`,`time`,`content`,`addressor`,`filename`,`isdelete`) values (1,'1','5,2','newS','2013-03-01 13:48:40','<p>发送内容</p>','3','','n'),(2,'2','4,1','201323201','2013-03-01 13:43:37','<p>201323201201323201201323201201323201201323201201323201</p>','3','','n'),(4,'2','4,1','201323201','2013-03-01 13:48:40','<p>201323201201323201201323201201323201201323201201323201</p>','5','','n'),(5,'5','4,5,2','加班通知','2013-03-01 14:49:45','<p><strong>加班通知加班通知加班通知加班通知加班通知加班通知加班通知加班通知加班通知加班通知</strong></p>','5','','y'),(6,'4','4,2,1','周六活动通知','2013-03-01 14:51:33','<p>周六活动通知周六活动通知周六活动通知周六活动通知周六活动通知周六活动通知周六活动通知周六活动通知周六活动通知</p>','3','','n'),(7,'1','3,2','文件上传测试--important','2013-03-04 14:25:20','<p>importantimportantimportantimportantimportantimportantimportantimportantimportantimportant</p>','5','新建文本文档.aa','n'),(8,'2','2','2222','2013-03-04 15:21:02','<p>2222222</p>','5','展会网站需求说明.doc','y');

/*Table structure for table `taskmain` */

DROP TABLE IF EXISTS `taskmain`;

CREATE TABLE `taskmain` (
  `ttaskid` int(11) NOT NULL AUTO_INCREMENT,
  `tstarttime` varchar(50) DEFAULT NULL,
  `tconstitutorid` varchar(50) DEFAULT NULL,
  `texcutorid` varchar(50) DEFAULT NULL,
  `ttitle` varchar(50) DEFAULT NULL,
  `tcontent` longtext,
  `tlevel` varchar(1) DEFAULT NULL,
  `tfinished` tinyint(1) NOT NULL DEFAULT '0',
  `tfinishedtime` varchar(50) DEFAULT NULL,
  `tcancel` tinyint(1) DEFAULT '0',
  `tview` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ttaskid`),
  KEY `iDateTime` (`tstarttime`),
  KEY `tconstitutorid` (`tconstitutorid`),
  KEY `texcutorid` (`texcutorid`),
  KEY `ttaskid` (`ttaskid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `taskmain` */

insert  into `taskmain`(`ttaskid`,`tstarttime`,`tconstitutorid`,`texcutorid`,`ttitle`,`tcontent`,`tlevel`,`tfinished`,`tfinishedtime`,`tcancel`,`tview`) values (24,'2005-7-19 21:53:32','bbb','111','1111111111111','1111111111111','1',0,NULL,0,0),(25,'2005-7-19 21:54:04','bbb','222','2222frombbbb','afdffdsfaf','2',0,NULL,0,0),(26,'2005-7-19 21:55:28','111','222','222from1111','adfsfdsfdsfd','3',0,NULL,0,0),(27,'2005-7-20 21:34:21','222','123','test222','ewrqwre','2',0,NULL,0,1),(28,'2005-7-20 21:34:35','222','333','test222222222222222','dsafdfsdf','1',0,NULL,0,0),(29,'2005-7-20 21:55:36','333','444','test3333','fsfdfsd','1',0,NULL,0,0),(30,'2006-2-23 12:45:37','xiaobing','111','task to 111','dsfadfdsfdsfafds','3',0,NULL,0,0),(31,'2006-2-23 12:45:51','xiaobing','123','task to 123','dfsafdsfsd','2',0,NULL,0,1),(32,'2006-2-23 12:46:06','xiaobing','222','task to 222','fdsfasfdsfds','3',0,NULL,1,0),(33,'2006-2-23 22:19:52','xiaobing','lhh','aaa','aaa','1',1,'2006-2-23 22:20:51',0,0),(34,'2006-2-24 9:07:14','xiaobing','123','aaaa','aaa','1',0,NULL,0,1),(35,'2006-2-24 9:10:20','dxd','123','zzz','zzzz','1',0,NULL,0,0),(36,'2006-2-25 9:59:30','xiaobing','123','aaa','aaaa','1',1,'2006-2-25 10:01:52',0,1),(37,'2006-2-25 17:36:36','xiaobing','123','sdf','sdfsf','2',0,NULL,0,0),(38,'2006-4-1 17:46:41','wjp','jdgszhb','sdds','fdfdf','2',0,NULL,1,1),(39,'2006-4-2 9:05:38','wjp','jdgszhb','aa','aa','2',0,NULL,1,1),(40,'2006-4-2 9:06:09','wjp','jdgswsl','a','a','2',0,NULL,1,0),(41,'2006-4-2 22:03:31','xb','还没有录入本单位用户，目前不能发布任务！','dddd','safdf','1',0,NULL,0,0),(42,'2006-4-11 13:45:03','xwh','jdgszhb','OA培训','报告OA培训情况','3',1,'2006-5-15 7:55:49',0,1),(43,'2006-5-10 17:37:00','wjp','jdgszhb','internet 网页内容修改','将\"工程实例\"暂时废止\",待重新筛选后再启用.','3',0,NULL,0,1),(44,'2006-5-10 17:45:15','wjp','jdgszhb','OA 系统','\"工作汇报\" 应按部门及人名划分目录层次,否则所有员工所有人员日汇报都顺序排列,有可读性吗?','3',0,NULL,0,1),(45,'2006-5-14 8:33:28','wjp','jdgszhb','改进\"工作汇报\"','在\"按部门浏览\"后进一步\"按人名浏览\",即将每个人的汇报单独显示.这是最基本的文件树状管理,公司--->部门-->个人-->单人文件列表.','3',0,NULL,0,1),(46,'2006-5-15 14:45:41','wjp','jdgszhb','修正\"工作汇报\"','1.将部门下面按科室分组.\r\n2.帮助未学会副科以上上网.','3',0,NULL,0,1),(47,'2006-6-3 17:35:51','wxp','yys','就餐','晚上一起用餐','3',0,NULL,0,1),(48,'2006-6-3 17:37:35','fqb','lxy','关于今晚会餐','根据公司要求，今晚进行会餐其间进行关于市场的交流，望见此通知后准时参加．','3',0,NULL,1,1);

/*Table structure for table `tel` */

DROP TABLE IF EXISTS `tel`;

CREATE TABLE `tel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telname` varchar(255) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `teltype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

/*Data for the table `tel` */

insert  into `tel`(`id`,`telname`,`telphone`,`teltype`) values (26,'传达室','6435113','单位'),(27,'发车办','6439257','单位'),(28,'轻钢车间','6439583','单位'),(29,'物管科','6433996','单位'),(31,'工程部','6437752','单位'),(32,'质量安全部','6431336','单位'),(33,'采购科','6439925 传真6431096','单位'),(34,'财务部','6431716','单位'),(35,'设计室','6438508 传真6438508','单位'),(36,'工艺科','6432529','单位'),(37,'预算科','6432136','单位'),(38,'总经理办','6015555 传真6015555','单位'),(41,'营销公司','6439988 传真6439919','单位'),(42,'王总办','6439927','单位'),(43,'徐总办','6435328','单位'),(46,'田金鲍','13793669972','个人'),(47,'唐志江','13516363296','个人'),(50,'孟凡刚','13780866887','个人'),(51,'冯智勇','15953645288','个人'),(52,'朱福泉','13793669266','个人'),(53,'李正民','13911633751','个人'),(54,'李洪波','13656366568','个人'),(55,'刘小勇','13910962363','个人'),(57,'刘跃亮','13792681076','个人'),(58,'于忠建','13335061610','个人'),(59,'阳兵兵','13791672388','个人'),(60,'马德明','13792638898','个人'),(61,'庸玉声','13506461350','个人'),(62,'冯启宝','13583659828','个人'),(63,'齐延宝','13583662639','个人'),(64,'潍坊办','8793088','公共'),(65,'黄岛办','0532-86995601','公共'),(66,'北京办','010-81783167','公共'),(67,'广州办','0757-81201032','公共'),(68,'济南办','0531-82660646','公共'),(69,'王树来','15963679286','个人'),(70,'臧家义','13964711666','个人'),(71,'邴立军','13780883236','个人'),(72,'曲红','13589193600','个人'),(73,'张海彬','15963467833','个人'),(74,'刘旭光','13721981147','个人'),(75,'徐烟田','13884700978','个人'),(77,'臧传玲','13791630658','个人'),(79,'李英美','13864639492','个人'),(81,'阚永利','13963616643','个人'),(82,'张韶辉','15053699877','个人'),(83,'赵玉洪','13793669889','个人'),(84,'刘吉玉','13911771653','个人'),(85,'张德吉','13853609566','个人'),(86,'孙向东','13456687039','个人'),(87,'崔志栋','13589167026','个人'),(88,'钟鹏','13793611735','个人'),(89,'刁金波','13792666722','个人'),(90,'范文彩','13863613788','个人'),(92,'徐兆青','13465652610','个人'),(94,'王志法','13964707289','个人'),(95,'王兆庆','13791630888','个人'),(96,'彭玉祥','13793640719','个人'),(97,'尹秀臣','13964721756','个人'),(98,'王桂勇','13964736658','个人'),(99,'孙晓艳','13406651819','个人'),(100,'孙福友','13853621601','个人'),(101,'马志国','13455637700','个人'),(102,'邱淑云','13573638106','个人'),(103,'毛维礼','13791613610','个人'),(104,'安仲超','13864621099','个人'),(105,'刘金林','13964707258','个人'),(106,'李金光','13963681139','个人'),(107,'郑斗军','13589192287','个人'),(108,'沈飞虎','13791609513','个人'),(109,'初拥刚','13953656598','个人'),(110,'张崇武','13792638226','个人'),(111,'赵金平','13791630108','个人'),(112,'刘泳江','13792638009','个人'),(113,'王克宝','13563631658','个人'),(114,'范光顺','13963661863','个人'),(115,'康云超','13053649891','个人'),(116,'张延明','15953639921','个人'),(117,'张开旭','15953639926','个人'),(118,'许晓晨','13911778639','个人'),(120,'王英','13475689117','个人'),(121,'李丽霞','13791630014','个人'),(122,'杜刚','13616369151','个人'),(123,'孟鹏','13465668160','个人'),(124,'魏海珍','15963607801','个人'),(125,'徐洲','13792656337','个人'),(126,'祝英','13791641997','个人'),(127,'王倩','15963607817','个人'),(128,'木工车间','6011955','公共'),(131,'林明杰','13562615422','个人'),(133,'孙长志','13793625663','个人'),(135,'葛济良','13793628394','个人'),(136,'赵同香','15953601760','个人'),(137,'李瑞武','13792673570','个人'),(138,'蒋永正','15953639682','个人'),(139,'刘子萍','13806460944','个人'),(140,'宫研业','13791630364','个人'),(141,'安玉全','13963627347','个人'),(142,'王潇','13780874463','个人'),(143,'吴永婷','13963646623','个人'),(145,'倪鹏程','13884707165','个人'),(146,'任佩婷','13170769005','个人'),(147,'赵成武','13864642115','个人'),(148,'冷荣志','13791694634','个人'),(149,'杨少磊','13573621607','个人'),(150,'郭丽','13455667146','个人'),(151,'孙晓艳','13406651819','个人'),(152,'张海勇','13465360463','个人'),(153,'陈鹏飞','13406664280','个人'),(154,'崔照超','13406630211','个人'),(155,'陈炳文','6826304','个人'),(156,'邱振华','13070789811','个人'),(157,'谭培乐','13515365221','个人'),(158,'王法军','13964608252','个人'),(159,'徐永友','13791639622','个人'),(160,'代明光','15954461234','个人'),(161,'王银河','15963607822','个人'),(162,'王善清','13792692350','个人'),(163,'王鹏','13853612915','个人'),(164,'宫耘','13863662682','个人'),(165,'徐海清','13563661752','个人'),(166,'王华栋','13573650559','个人'),(167,'王刚','13793669885','个人'),(169,'杜兰','6194106','个人'),(171,'马耀光','13793637156','个人'),(172,'徐君','13563615114','个人'),(173,'耿国磊','13562660919','个人'),(174,'刘建福','13964778838','个人'),(179,'惠海华','13465652665','个人'),(180,'徐烟刚','13791646856','个人'),(181,'王艳庆','13793637557','个人'),(183,'迟光磊','13606460110','个人'),(184,'臧传良','13792644071','个人'),(185,'魏志东','13406688978','个人'),(186,'李斌','13792610755','个人'),(188,'王学东','13573691787','个人'),(189,'臧运平','13964752071','个人'),(190,'曲伟','13791676613','个人'),(193,'王焕斗','13964736302','个人'),(195,'赵玉华','13465668008','个人'),(196,'杨明乐','13563661872','个人'),(197,'胡成交','13615364777','个人'),(198,'薛召军','13964720712','个人'),(200,'张继宝','13589192255','个人'),(201,'谭瑞军','13964603865','个人'),(203,'董金运','13963601958','个人'),(205,'李振勇','13792677181','个人'),(206,'王剑','13583632087','个人'),(208,'刘鲁滨','13963638360','个人'),(209,'张立滨','15958834033','个人'),(210,'周鹏训','13070783061','个人'),(211,'周坤训','13506402972','个人'),(212,'商云飞','13963699097','个人'),(214,'马长海','13791876618','个人');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `type` */

insert  into `type`(`id`,`type`) values (1,'生产管理'),(2,'财务管理'),(3,'安全管理'),(8,'行政管理'),(9,'继续教育');

/*Table structure for table `up` */

DROP TABLE IF EXISTS `up`;

CREATE TABLE `up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `file_grade` varchar(50) DEFAULT NULL,
  `file_denid` varchar(50) DEFAULT NULL,
  `from_where` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `note_content` longtext,
  `time` varchar(50) DEFAULT NULL,
  `writer_id` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `name_level` varchar(50) DEFAULT NULL,
  `name_part` varchar(50) DEFAULT NULL,
  `classid` varchar(50) DEFAULT NULL,
  `nclassid` varchar(50) DEFAULT NULL,
  `nclassid_time` varchar(50) DEFAULT NULL,
  `nclassid_content` longtext,
  `nclassid_yn` tinyint(1) DEFAULT NULL,
  `name_reply` varchar(50) DEFAULT NULL,
  `name_time` varchar(50) DEFAULT NULL,
  `name_content` longtext,
  `name_reply_yn` tinyint(1) DEFAULT NULL,
  `file_view_personal` varchar(50) DEFAULT NULL,
  `file_view_bumen` varchar(50) DEFAULT NULL,
  `file_see_personal` varchar(50) DEFAULT NULL,
  `file_see_bumen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classid` (`classid`),
  KEY `file_denid` (`file_denid`),
  KEY `id` (`id`),
  KEY `nclassid` (`nclassid`),
  KEY `typeid` (`type`),
  KEY `writer_id` (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

/*Data for the table `up` */

insert  into `up`(`id`,`type`,`file_grade`,`file_denid`,`from_where`,`title`,`content`,`note_content`,`time`,`writer_id`,`name`,`name_level`,`name_part`,`classid`,`nclassid`,`nclassid_time`,`nclassid_content`,`nclassid_yn`,`name_reply`,`name_time`,`name_content`,`name_reply_yn`,`file_view_personal`,`file_view_bumen`,`file_see_personal`,`file_see_bumen`) values (200,'1','正常','正常','中国铁路','dddddddddd','dddddddddddd','dddddddddddd','2004-9-16',0,'李怀贺','经理','市场部','市场部','李怀贺','2004-9-16','d',1,'李怀贺','2004-9-16','d',1,'李怀贺, ccc','高层领导, 材料科','李怀贺, 李少','市场部, 技术部,'),(202,NULL,'正常','正常','中国铁路','公文上报测试','大幅度fs','','2005-7-18',0,'xb','经理','技术部','总经理','林莉','2005-7-18','ttrete',1,'李怀贺',NULL,NULL,1,'李怀贺, 林莉','高层领导',NULL,NULL),(203,'2','正常','正常','诸城市建委','444 test','dsfdsfsdfa','','2005-8-1',0,'444','一般职员','运输部','运输部','222','2005-8-1','yi yue',1,'222','2005-8-1','ok',1,'222','高层领导, 技术部, 运输部','','高层领导, 技术部, 运输部'),(206,NULL,'正常','正常','精典公司','干部任命','1.任命<BR>2.免聘','','2008-7-8',0,'王金平','董事长','高层领导','山东办','阳兵兵',NULL,NULL,0,'阳兵兵',NULL,NULL,0,'许晓晨, 徐冰, 齐延宝, 刘跃亮','技术部, 财务部',NULL,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) DEFAULT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `partid` int(10) DEFAULT NULL COMMENT '所属部门id',
  `rule` varchar(1) DEFAULT NULL COMMENT '权限',
  `email` varchar(50) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL COMMENT '登陆ip',
  `state` tinyint(1) DEFAULT NULL COMMENT '审核状态，1未审核，0审核',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `uptime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `times` int(11) DEFAULT '0' COMMENT '登陆次数',
  `ilevel` varchar(24) DEFAULT NULL COMMENT '职务等级',
  `lastlogintime` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`pwd`,`partid`,`rule`,`email`,`question`,`answer`,`login_ip`,`state`,`phone`,`name`,`uptime`,`times`,`ilevel`,`lastlogintime`) values (1,'rock','123456',3,NULL,NULL,NULL,NULL,NULL,0,NULL,'rock','2013-02-21 09:39:35',0,NULL,NULL),(2,'skyer','123456',3,NULL,NULL,NULL,NULL,NULL,0,NULL,'skyer','2013-02-21 09:39:53',0,NULL,NULL),(3,'rainy','123456',13,NULL,NULL,NULL,NULL,NULL,0,NULL,'rainy','2013-02-21 09:41:40',0,NULL,NULL),(5,'eric','123456',13,NULL,NULL,NULL,NULL,NULL,0,NULL,'eric','2013-02-21 09:41:38',0,NULL,NULL);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT '0',
  `Uname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `duty` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `polity` varchar(50) DEFAULT NULL,
  `health` varchar(50) DEFAULT NULL,
  `Nplace` varchar(50) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `idcard` int(11) DEFAULT '0',
  `marriage` varchar(50) DEFAULT NULL,
  `Fschool` varchar(50) DEFAULT NULL,
  `member` varchar(50) DEFAULT NULL,
  `speciality` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `study` varchar(50) DEFAULT NULL,
  `foreign` varchar(50) DEFAULT NULL,
  `Elevel` varchar(50) DEFAULT NULL,
  `Clevel` varchar(50) DEFAULT NULL,
  `Hplace` varchar(50) DEFAULT NULL,
  `QQ` int(11) DEFAULT '0',
  `call` varchar(50) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `love` varchar(100) DEFAULT NULL,
  `award` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `nation` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `Ltime` varchar(50) DEFAULT NULL,
  `photo` longblob,
  `havephoto` tinyint(1) DEFAULT NULL,
  `check` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idcard` (`idcard`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

/*Table structure for table `workplan` */

DROP TABLE IF EXISTS `workplan`;

CREATE TABLE `workplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_id` int(11) DEFAULT '0' COMMENT '批注:文章id',
  `tname` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `time` varchar(50) DEFAULT NULL,
  `note_content` longtext COMMENT '批注内容',
  `view_object` varchar(500) DEFAULT NULL,
  `departmentid` smallint(10) DEFAULT NULL COMMENT '作者部门id',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `reply_id` (`reply_id`),
  KEY `typeid` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

/*Data for the table `workplan` */

insert  into `workplan`(`id`,`reply_id`,`tname`,`type`,`title`,`content`,`time`,`note_content`,`view_object`,`departmentid`) values (149,0,'rock',NULL,'工作汇报2006.5.2','<div>会议主持人：安仲超</div>\r\n<p>&nbsp;</p>\r\n<div>参加人员：（见签到表）</div>\r\n<p>&nbsp;</p>\r\n<div>记录人：郑斗军</div>\r\n<p>&nbsp;</p>\r\n<div>会议内容：1、08年工程项目管理思路。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2、参会人员提出08年施工质量可行性建议。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3、王总就08年工程管理提出几点意见。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;1、08年工程项目管理思路：</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 安经理对制定的08年工程管理实施细则作进一步讲解讨论（具体修正稿内容见公司OA系统通知）。</div>\r\n<p>&nbsp;</p>\r\n<div>2、参会人员提出08年施工质量可行性建议：</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 邱淑云：在工程管理上要实行奖罚分明的原则。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 刘金林：进一步加强工地临舍建设，大力宣传公司企业形象。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 王兆庆：现在施工的工程我们对于防漏雨的节点做法不成熟，应从根源上对症下药，从技术上、管理上提高。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 郑斗军：08年加强工程施工质量反馈的整改力度，进一步提高售后服务质量。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 刘秀军：工程验收由项目经理、营销人员参与，安装队长配合。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 李玉宝：对于施工质量反馈问题要具体、明细。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 范文彩：质量要求高的工程安装应由好的施工队伍去干并要奖罚到位。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 刘跃亮：公司技术进步小组08年要抓落实，制定一个可行性的施工程序。</div>\r\n<p>&nbsp;</p>\r\n<div>&nbsp;&nbsp;&nbsp;&nbsp; 李洪波：土建与水电部分验收最好按照月施工进度进行验收。</div>','2006-5-2','','eric',12),(150,0,'rainy',NULL,'OA培训','<DIV align=center><B>OA</B><B>系统学习培训计划安排表</B><B></B></DIV><BR><TABLE cellSpacing=0 cellPadding=0 border=1><BR><TBODY><BR><TR><BR><TD width=87><BR><DIV align=center>时间</DIV><BR><DIV align=center>安排</DIV></TD><BR><TD width=77><BR><DIV align=center>形式</DIV></TD><BR><TD width=288><BR><DIV align=center>学习内容</DIV></TD><BR><TD width=72><BR><DIV align=center>参加</DIV><BR><DIV align=center>人员</DIV></TD><BR><TD width=72><BR><DIV align=center>参加</DIV><BR><DIV align=center>部门</DIV></TD><BR><TD width=84><BR><DIV align=center>学习地点</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月10日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>集中</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288><BR><DIV align=center>介绍OA及公司OA整体模块介绍</DIV></TD><BR><TD width=72><BR><DIV align=center>中层</DIV><BR><DIV align=center>领导</DIV></TD><BR><TD width=72><BR><DIV align=center>各部门</DIV></TD><BR><TD width=84><BR><DIV align=center>小会议室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月11日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>集中</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288><BR><DIV align=center>介绍OA及公司OA整体模块介绍</DIV></TD><BR><TD width=72><BR><DIV align=center>中层</DIV><BR><DIV align=center>领导</DIV></TD><BR><TD width=72><BR><DIV align=center>各部门</DIV></TD><BR><TD width=84><BR><DIV align=center>小会议室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月12日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288 rowSpan=2><BR><DIV align=center>OA系统的日常操作各各模块应用</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>阚永利</DIV><BR><DIV align=center>张韶辉</DIV><BR><DIV align=center>赵玉洪</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>采购部</DIV></TD><BR><TD width=84 rowSpan=2><BR><DIV align=center>本部</DIV><BR><DIV align=center>办公室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月13日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月14日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288 rowSpan=2><BR><DIV align=center>OA系统的日常操作各各模块应用</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>孙福友</DIV><BR><DIV align=center>马志国</DIV><BR><DIV align=center>邱淑云</DIV><BR><DIV align=center>毛维礼</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>技术部</DIV></TD><BR><TD width=84 rowSpan=2><BR><DIV align=center>本部</DIV><BR><DIV align=center>办公室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月17日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月18日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288 rowSpan=2><BR><DIV align=center>OA系统的日常操作各各模块应用</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>徐烟田</DIV><BR><DIV align=center>钟兆龄</DIV><BR><DIV align=center>臧传玲</DIV><BR><DIV align=center>张书利</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>财务部</DIV></TD><BR><TD width=84 rowSpan=2><BR><DIV align=center>本部</DIV><BR><DIV align=center>办公室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月19日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月20日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288 rowSpan=2><BR><DIV align=center>OA系统的日常操作各各模块应用</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>刘金林</DIV><BR><DIV align=center>李金光</DIV><BR><DIV align=center>郑斗军</DIV><BR><DIV align=center>初拥刚</DIV><BR><DIV align=center>张崇武</DIV><BR><DIV align=center>沈飞虎</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>钢结构</DIV><BR><DIV align=center>公司</DIV></TD><BR><TD width=84 rowSpan=2><BR><DIV align=center>本部</DIV><BR><DIV align=center>办公室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月21日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月22日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288 rowSpan=2><BR><DIV align=center>OA系统的日常操作各各模块应用</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>刁金波</DIV><BR><DIV align=center>范文彩</DIV><BR><DIV align=center>王志法</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>土建</DIV><BR><DIV align=center>公司</DIV></TD><BR><TD width=84 rowSpan=2><BR><DIV align=center>本部</DIV><BR><DIV align=center>办公室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月24日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月25日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288 rowSpan=2><BR><DIV align=center>OA系统的日常操作各各模块应用</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>王兆庆</DIV><BR><DIV align=center>彭玉祥</DIV><BR><DIV align=center>安仲超</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>质量</DIV><BR><DIV align=center>安全部</DIV></TD><BR><TD width=84 rowSpan=2><BR><DIV align=center>本部</DIV><BR><DIV align=center>办公室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月26日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月27日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288 rowSpan=2><BR><DIV align=center>OA系统的日常操作各各模块应用</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>王树来</DIV><BR><DIV align=center>臧家义</DIV></TD><BR><TD width=72 rowSpan=2><BR><DIV align=center>总经理</DIV><BR><DIV align=center>办公室</DIV></TD><BR><TD width=84 rowSpan=2><BR><DIV align=center>本部</DIV><BR><DIV align=center>办公室</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月28日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>部门</DIV><BR><DIV align=center>学习</DIV></TD></TR><BR><TR><BR><TD width=87><BR><DIV align=center>4月29日</DIV><BR><DIV align=center>6:30-8:30</DIV></TD><BR><TD width=77><BR><DIV align=center>集中</DIV><BR><DIV align=center>学习</DIV></TD><BR><TD width=288><BR><DIV align=center>对各部门提出的问题集中讲解</DIV></TD><BR><TD width=72><BR><DIV align=center>中层</DIV><BR><DIV align=center>领导</DIV></TD><BR><TD width=72><BR><DIV align=center>各部门</DIV></TD><BR><TD width=84><BR><DIV align=center>小会议室</DIV></TD></TR></TBODY></TABLE>','2006-4-10','','rock',1),(151,149,'rock',NULL,'对关于成立青年突击队的计划文件的批注','dfdsfadfd','2005-8-1','对关于成立青年突击队的计划文件的批注','222',4),(152,149,'eric',NULL,'对关于成立青年突击队的计划文件的批注','dsfadf','2005-8-1','对关于成立青年突击队的计划文件的批注','林莉',1),(161,0,'eric',NULL,'5月6日工作汇报','<P><FONT size=2>1.公司开会人员作了调整,本人负责小件车间的工作安排,与郑主任交接部分工作.</FONT></P><BR><P><FONT size=2>2.安排潍柴剩余系杆、窗懔的除锈喷漆。</FONT></P><BR><P><FONT size=2>3.安排福万里的柱撑加工.</FONT></P><BR><P>&nbsp;</P>','2006-5-9','','张崇武',12),(163,0,'skyer',NULL,'5月4日会议决议项及计划安排','<P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: red; LINE-HEIGHT: 125%; FONT-FAMILY: 黑体; mso-hansi-font-family: 华文细黑\"><FONT size=3>会议决议项：<SPAN lang=EN-US><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /><o:p></o:p></SPAN></FONT></SPAN></B></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><FONT size=3><B style=\"mso-bidi-font-weight: normal\"><SPAN lang=EN-US style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">1</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">、</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\">展室要进一步的完善，要有其他公司的劣质材料、劣质工程图片<FONT color=#000080><FONT face=楷体_GB2312><SPAN lang=EN-US>;</SPAN>制定如何使用展室。<SPAN lang=EN-US><o:p></o:p></SPAN></FONT></FONT></SPAN></B></FONT></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\"><FONT size=3>责任人：齐延宝，完成日期：<FONT color=#000080><FONT face=楷体_GB2312><SPAN lang=EN-US>5</SPAN>月<SPAN lang=EN-US>19</SPAN>日前完成，完不成考核<SPAN lang=EN-US>100</SPAN>元。<SPAN lang=EN-US><o:p></o:p></SPAN></FONT></FONT></FONT></SPAN></B></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><FONT size=3><B style=\"mso-bidi-font-weight: normal\"><SPAN lang=EN-US style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">2</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">、</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\">潍坊设立广告牌，本月要有初步方案；潍坊地区交警路口做太阳伞；诸城交警路口太阳伞的使用。<SPAN lang=EN-US><o:p></o:p></SPAN></SPAN></B></FONT></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\"><FONT size=3>责任人：庸玉声，完成日期：<FONT color=#000080><FONT face=楷体_GB2312><?xml:namespace prefix = st1 ns = \"urn:schemas-microsoft-com:office:smarttags\" /><st1:chsdate w:st=\"on\" Year=\"2006\" Month=\"5\" Day=\"30\" IsLunarDate=\"False\" IsROCDate=\"False\"><SPAN lang=EN-US>5</SPAN>月<SPAN lang=EN-US>30</SPAN>日前</st1:chsdate>完成，完不成考核<SPAN lang=EN-US>100</SPAN>元。<SPAN lang=EN-US><o:p></o:p></SPAN></FONT></FONT></FONT></SPAN></B></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><FONT size=3><B style=\"mso-bidi-font-weight: normal\"><SPAN lang=EN-US style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">3</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">、</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\">每次投标后要写出书面总结，分公司经理签字，报综合管理科。<SPAN lang=EN-US><o:p></o:p></SPAN></SPAN></B></FONT></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\"><FONT size=3>责任人：各分公司经理，完成日期：每次投标后<FONT color=#000080><FONT face=楷体_GB2312><SPAN lang=EN-US>10</SPAN>天内，未按时提报考核分公司经理<SPAN lang=EN-US>200</SPAN>元。<SPAN lang=EN-US><o:p></o:p></SPAN></FONT></FONT></FONT></SPAN></B></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><FONT size=3><B style=\"mso-bidi-font-weight: normal\"><SPAN lang=EN-US style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">4</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">、</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\">工地宣传<SPAN lang=EN-US><o:p></o:p></SPAN></SPAN></B></FONT></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\"><FONT size=3>各工地的宣传牌必须到位，并按规定安放到规定的位置<SPAN lang=EN-US><o:p></o:p></SPAN></FONT></SPAN></B></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\"><FONT size=3>责任人：工程营销负责人，完成日期：<FONT color=#000080><FONT face=楷体_GB2312><SPAN lang=EN-US>5</SPAN>月<SPAN lang=EN-US>30</SPAN>日前，完不成考核<SPAN lang=EN-US>100</SPAN>元。<SPAN lang=EN-US style=\"BACKGROUND: yellow; mso-highlight: yellow\"><o:p></o:p></SPAN></FONT></FONT></FONT></SPAN></B></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><FONT size=3><B style=\"mso-bidi-font-weight: normal\"><SPAN lang=EN-US style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">5</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">、</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\">每分公司每月发展一个战略客户。<SPAN lang=EN-US><o:p></o:p></SPAN></SPAN></B></FONT></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\"><FONT size=3>责任人：分公司经理，完成日期：每月<FONT color=#000080><FONT face=楷体_GB2312><SPAN lang=EN-US>30</SPAN>日前，完不成考核<SPAN lang=EN-US>100</SPAN>元<SPAN lang=EN-US><o:p></o:p></SPAN></FONT></FONT></FONT></SPAN></B></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><FONT size=3><B style=\"mso-bidi-font-weight: normal\"><SPAN lang=EN-US style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">6</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; BACKGROUND: yellow; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体; mso-highlight: yellow\">、</SPAN></B><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\">精典专题片制作，本月要有初步的方案。<SPAN lang=EN-US><o:p></o:p></SPAN></SPAN></B></FONT></P><BR><P class=MsoNormal style=\"MARGIN: 0cm 0cm 0pt; LAYOUT-GRID-MODE: char; TEXT-INDENT: 28.1pt; LINE-HEIGHT: 125%; mso-char-indent-count: 2.0; mso-layout-grid-align: none\"><B style=\"mso-bidi-font-weight: normal\"><SPAN style=\"FONT-SIZE: 14pt; COLOR: navy; LINE-HEIGHT: 125%; FONT-FAMILY: 楷体_GB2312; mso-hansi-font-family: 华文楷体\"><FONT size=3>责任人：朱福泉，完成日期：<FONT color=#000080><FONT face=楷体_GB2312><SPAN lang=EN-US>5</SPAN>月<SPAN lang=EN-US>30</SPAN>日前，完不成考核<SPAN lang=EN-US>100</SPAN>元。<SPAN lang=EN-US><o:p></o:p></SPAN></FONT></FONT></FONT></SPAN></B></P>','2006-5-22','5月底将近，请各决议项负责人抓紧时间落实各自的任务进展情况，争取按时完成，','rock',2),(164,0,'rainy',NULL,'06.05.27','今日休班','2006-5-28','','尹秀臣',11),(165,0,'rainy',NULL,'2008年1月24日','在奥铃工厂组织电器安装工程，与快捷仓库基础工程','2008-1-25','','范文彩',12),(166,0,'eric',NULL,'2008年1月25日','<P>在奥铃工厂调度工程进度与质量检查~</P>','2008-1-25','','范文彩',12),(169,0,'skyer',NULL,'测试发布','<p>方法</p>','2013-02-23 11:09:17',NULL,'公司领导',NULL),(170,0,'skyer',NULL,'元宵节放假通知','<p>的</p>','2013-02-23 11:20:17',NULL,'设备制造部,技术部',3),(171,0,'skyer',NULL,'本月年度计划总结','<p>11111</p>','2013-02-23 11:20:48',NULL,'营销公司,公司领导',3),(174,149,'rock',NULL,'标注：',NULL,'2013-02-23 16:49:15','非常好',NULL,NULL),(175,171,'rock',NULL,'标注：',NULL,'2013-02-25 08:35:21','字数太少、、。',NULL,NULL),(176,0,'rock',NULL,'201313131313','<p>元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、元宵节放假通知。。、</p>\r\n<p>&nbsp;</p>\r\n<p>解决斤斤计较斤斤计较</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>啦啦啦啦啦啦啦啦啦啦啦啦</p>','2013-02-25 10:49:32',NULL,'技术部',3),(177,0,'rock',NULL,'盘','哈哈哈哈哈哈哈哈哈和<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\np<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n55<br />\r\n<br />\r\n<br />','2013-02-25 12:23:15',NULL,'所有人',3);

/*Table structure for table `workreport` */

DROP TABLE IF EXISTS `workreport`;

CREATE TABLE `workreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) DEFAULT NULL,
  `tname` varchar(16) DEFAULT NULL,
  `department` smallint(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ttext` longtext,
  `time` varchar(200) DEFAULT NULL,
  `view_object` varchar(50) DEFAULT NULL,
  `lastmodifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `workreport` */

insert  into `workreport`(`id`,`userid`,`tname`,`department`,`title`,`ttext`,`time`,`view_object`,`lastmodifydate`) values (1,'1','rock',3,'2013春节放假通知','<p>放假一共7天</p>','2013-02-04 11:12:29',NULL,'2013-02-20 13:49:37'),(2,'5','eric',13,'贸易委员会效果图完工','<p>贸易委员会效果图完工贸易委员会效果图完工贸易委员会效果图完工贸易委员会效果图完工贸易委员会效果图完工</p>','2013-02-20 13:47:05',NULL,'2013-02-20 13:52:01'),(3,'4','rainy',13,'网站发帖、、每天坚持50篇','<p>站发帖、、每天坚持50篇<strong>站发帖、、每天坚持50篇站发帖、、每天坚持50篇站发帖、、每天坚持50篇站发帖、、每天坚持50篇站发帖、、每天坚持50篇</strong></p>','2013-02-20 13:48:05',NULL,'2013-02-20 13:52:14'),(4,'2','skyer',3,'Yii整合UCenter','<p>Yii整合UCenterYii整合UCenterYii整合UCenterYii整合UCenter</p>','2013-02-20 13:56:34',NULL,'2013-02-20 13:56:34'),(5,'1','rock',3,'php版本的OA','<p>php版本的OAphp版本的OAphp版本的OA</p>','2013-02-20 14:50:32',NULL,'2013-02-20 14:52:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

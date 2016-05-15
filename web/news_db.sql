CREATE DATABASE  IF NOT EXISTS `news` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `news`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: 119.29.17.244    Database: news
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) COLLATE utf8_bin NOT NULL,
  `adminPassword` varchar(255) COLLATE utf8_bin NOT NULL,
  `adminRole` int(3) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'123','123',1),(4,'222','222',2),(5,'333','333',3),(6,'567','567',2),(8,'1234564564','123456456456456',2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_collection`
--

DROP TABLE IF EXISTS `news_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `newsId` bigint(20) NOT NULL,
  `newsTitle` varchar(255) COLLATE utf8_bin NOT NULL,
  `collectionDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_collection`
--

LOCK TABLES `news_collection` WRITE;
/*!40000 ALTER TABLE `news_collection` DISABLE KEYS */;
INSERT INTO `news_collection` VALUES (11,132,9,'上传功能将不能正常使用','2016-04-20 20:54:54'),(12,132,16,'2354325','2016-04-20 20:57:49'),(13,132,16,'2354325','2016-04-20 20:59:28'),(14,132,14,'123123','2016-04-20 20:59:37'),(15,132,2,'234','2016-04-20 21:06:41'),(16,91,4,'shishisis','2016-04-20 21:10:12'),(17,91,26,'客户端展示新闻信息','2016-04-20 21:15:26'),(18,132,4,'shishisis','2016-04-20 22:24:18'),(19,132,13,'wrtyrety','2016-04-20 22:29:01'),(20,132,27,'最新消息','2016-04-20 22:29:16'),(21,132,24,'','2016-04-20 22:29:24'),(22,132,21,'34565','2016-04-20 22:29:31'),(23,91,18,'看见爱上了对方空间哈市的反','2016-04-20 22:30:28'),(24,132,21,'34565','2016-04-20 22:38:09'),(25,132,17,'2354325','2016-04-20 22:38:22'),(26,132,11,'5555','2016-04-20 22:50:42'),(27,132,2,'234','2016-04-21 09:16:45'),(28,132,9,'上传功能将不能正常使用','2016-04-21 09:22:23'),(29,132,2,'234','2016-04-21 09:48:39'),(30,132,16,'2354325','2016-04-21 10:56:49'),(31,132,9,'上传功能将不能正常使用','2016-04-21 11:01:40'),(32,132,9,'上传功能将不能正常使用','2016-04-21 11:01:42'),(33,132,2,'234','2016-04-21 11:02:07'),(34,132,9,'上传功能将不能正常使用','2016-04-21 11:06:43'),(35,132,2,'234','2016-04-21 13:40:10'),(36,132,19,'23542354','2016-05-15 10:21:29'),(37,132,31,'美国有“超时空”，中国也有“时光机”','2016-05-15 13:51:32');
/*!40000 ALTER TABLE `news_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_kinds_list`
--

DROP TABLE IF EXISTS `news_kinds_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_kinds_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `newsKinds` bigint(20) NOT NULL COMMENT '新闻类别ID',
  `newsId` bigint(20) NOT NULL COMMENT '新闻ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新闻类别和新闻关联的表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_kinds_list`
--

LOCK TABLES `news_kinds_list` WRITE;
/*!40000 ALTER TABLE `news_kinds_list` DISABLE KEYS */;
INSERT INTO `news_kinds_list` VALUES (1,1,11),(2,2,12),(3,1,41);
/*!40000 ALTER TABLE `news_kinds_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_list`
--

DROP TABLE IF EXISTS `news_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_list` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '新闻信息表主键ID',
  `newsTitle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '新闻标题',
  `newsAuthor` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '信息作者亦或是新闻的编辑',
  `newsText` varchar(10000) COLLATE utf8_bin DEFAULT '' COMMENT '新闻正文',
  `newsUrl` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '转载第三方平台信息的新闻链接',
  `originType` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '新闻来源，其他平台转载或者是自己编辑',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `valid` int(11) DEFAULT '1' COMMENT '是否有效，就是是否被删除，这里删除采取逻辑删除',
  `imageUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '新闻信息使用到的图片url地址',
  `newsKind` bigint(20) NOT NULL COMMENT '新闻信息的类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_list`
--

LOCK TABLES `news_list` WRITE;
/*!40000 ALTER TABLE `news_list` DISABLE KEYS */;
INSERT INTO `news_list` VALUES (31,'美国有“超时空”，中国也有“时光机”','张波','<div><p>&nbsp;</p><p><a href=\"http://p1.pstatp.com/large/644000c4a938320510e\" _src=\"http://p1.pstatp.com/large/644000c4a938320510e\">http://p1.pstatp.com/large/644000c4a938320510e</a> </p><p><br/></p><p>管道超级高铁设想图 资料图片\n近日，美国创业公司在拉斯维加斯沙漠地区展示了超回路列车技术，这家公司设想在真空管道中使用磁悬浮列车进行超高速运输，设计时速将达1120公里。更早提出这一设想的是埃隆·马斯克，也就是时下炙手可热的特斯拉汽车公司CEO。由于速度高，又在管道中，为此“真空管道交通”一定程度上被誉为“时光机”。\n在中国其实也有类似技术，西南交通大学就有一个团队已经研制出第二代实验系统，而且常压下的实验车平均时速在几个月时间就从82.5km提升至100km左右。这一团队的项目进展已经超过了美国同行。</p><br/></div>','null','1','2016-05-15 13:21:06','2016-05-15 13:21:06',1,'http://p1.pstatp.com/large/644000c4a938320510e',1),(32,'360手机N4详细评测，详细测试点这里','哈哈','<p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 26px; font-family: Arial, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, sans-serif; vertical-align: baseline; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);\">对于千元附近的市场目前可以选择的产品已经非常丰富，不乏一些高性能的手机代表，千元市场主要针对一些有所追求但手头资金不太充裕的用户，往往这些用户更看重手机产品的性价比。我们在来看一下360手机的布局，360手机早前发布了360手机f4，这款手机定价599元，是一款入门级的产品，再往上就只有老旧的大神note3，要么就是360手机奇酷青春版，再往上旗舰级的就是360手机奇酷旗舰版了。可以看到360手机的布局在千元附近出现了一个断层，大神note3以及360手机奇酷青春版已经不能支持着这个价格段的市场，所以360手机推出了360手机N4，作为是大神note3和360手机奇酷青春版替代产品，并用上了不少的高端配置，让这台手机性价比增加不少。</p><p></p>','null','1','2016-05-15 13:21:06','2016-05-15 13:21:06',1,'http://p3.pstatp.com/large/5f20004d868a381daf2',1),(33,'为何MFi成了苹果为华强北提供的一座金矿？','不知道','<div>深圳是个离钱很近的地方，这些钱主要来自消费者，而不是投资人。所以相比北京，这里的人们不太喜欢讲故事，更看重真金白银。\n以此为前提，很多关于商业手段和商业道德是否合理的讨论，在这里都可以暂时搁置一旁。\n很难想象的华强北\n“这一根线就赚了500多万，不过钱都到了‘华强北’的口袋。”陈茗俊拿着一根USB/lightning二合一的安果数据线苦笑道。其实这种状况在他意料之中，而选择先在海外众筹也确有这方面考虑。不过让他始料未及的是，当产品终于在国内上线时，底下出现了“你知道淘宝吗？”这类辛辣讽刺的留言。\n陈茗俊当然知道淘宝，他还知道安果数据线在美国上了众筹之后，“两个月的时间，国内出现了4~5个厂家在做同样的东西，最便宜的能买到几块钱，最多的一家卖了40多万条。”<br/><br/><br/>作者：头条号 / 雷锋网<br/>链接：http://toutiao.com/a6283784300173443329/<br/>来源：头条号（今日头条旗下创作平台）<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div><p><br/></p>','null','1','2016-05-15 13:21:06','2016-05-15 13:21:06',1,'http://p3.pstatp.com/large/63f0005b5eb996f9268',1),(34,'Yahoo是否会变成又一个专利流氓？','不Hi都爱','<div>题图：去年 7 月，Starboard Value LP CEO Jeffrey Smith 在 CNBC 会议上致辞。原文来源：Backchannel，本文由Tech2ipo / 创见Locin 编译，小标题为虎嗅所加。\n上周，Yahoo CEO Marissa Mayer 还在继续试图用战略性撤退拯救这互联网界昔日的霸主。对冲基金 Starboard Value LP 发起争夺战，想要撤换 Yahoo 所有董事会成员。Mayer 对此并没有激烈反抗，她同意让 Starboard CEO Jeffrey Smith 以及他的三名手下加入董事会。\nStarboard 到底打算怎么做？\n显然 Starboard 同意 Mayer 的做法的原因绝非是因为它想让 Yahoo 重整旗鼓、找回昔日的光辉然后再次成为科技界的领袖。所以说如果你是特别崇拜 Mayer，或者特别喜欢 Yahoo 新出的天气应用的话，夸谁都行但记得千万别夸 Jeffrey Smith。这家对冲基金对于改变世界这种科技人员的梦想没啥兴趣；他们的目标是要保证合伙人能赚到钱，也就是普通对冲基金的终极目标。我的问题就是，Starboard 到底打算怎么做？\n目前我们比较清楚的就是，Starboard 应该会催 Mayer 尽快卖掉 Yahoo 的核心业务，也就是媒体资产和服务。一旦出售完成后，下一步就是想办法把公司在中国阿里巴巴和日本 Yahoo Japan 的股份转换为股东价值，以此来合法降低美国政府可能会收的税。\n但我真正担心的是 Yahoo 的知识产权。<br/><br/><br/>作者：头条号 / 虎嗅网<br/>链接：http://toutiao.com/a6283013010027430146/<br/>来源：头条号（今日头条旗下创作平台）<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div><p><br/></p>','null','1','2016-05-15 13:21:06','2016-05-15 13:21:06',1,'http://p8.pstatp.com/large/5f000066387e65f7f8d',1),(35,'十年后15大颠覆性科技，你猜是什么？','十年','<p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 26px; font-family: Arial, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, sans-serif; vertical-align: baseline; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);\">我们看到谷歌无人驾驶汽车的新闻，但我们可能没有意识到，未来城市中可能禁止人类驾车，因为那太危险。“增强时代”主要有4个关键的颠覆性主题，分别是人工智能、体验设计、智能基础设施以及健康技术。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 26px; font-family: Arial, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, sans-serif; vertical-align: baseline; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);\">历史上，以往“时代”带来了许多重要改变，在净基础性工作被更多创造的同时，财富大大增加，健康与社会保障也得到改善。“增强时代”能带来什么变化？机器人会接管人类工作吗？人工智能会变得比人类更聪明吗？我们将迎来更富足的时代吗？美国赫芬顿邮报为我们盘点了2025年15大颠覆性技术。</p><p><img src=\"http://p1.pstatp.com/large/5f1000b0f5952a742a6\" img_width=\"550\" img_height=\"343\" alt=\"十年后15大颠覆性科技，你最期待哪个？\" style=\"margin: 1em auto; padding: 0px; border: 0px; font-stretch: inherit; line-height: 26px; font-family: Arial, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, sans-serif; vertical-align: baseline; max-width: 100%; display: block; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);\"/></p><br/>','null','1','2016-05-15 13:21:06','2016-05-15 13:21:06',1,'http://p3.pstatp.com/large/5f500087599dd549e56',1),(36,'十年后15大颠覆性科技，你猜是什么？','不知道','<div>深圳是个离钱很近的地方，这些钱主要来自消费者，而不是投资人。所以相比北京，这里的人们不太喜欢讲故事，更看重真金白银。 以此为前提，很多关于商业手段和商业道德是否合理的讨论，在这里都可以暂时搁置一旁。 很难想象的华强北 “这一根线就赚了500多万，不过钱都到了‘华强北’的口袋。”陈茗俊拿着一根USB/lightning二合一的安果数据线苦笑道。其实这种状况在他意料之中，而选择先在海外众筹也确有这方面考虑。不过让他始料未及的是，当产品终于在国内上线时，底下出现了“你知道淘宝吗？”这类辛辣讽刺的留言。 陈茗俊当然知道淘宝，他还知道安果数据线在美国上了众筹之后，“两个月的时间，国内出现了4~5个厂家在做同样的东西，最便宜的能买到几块钱，最多的一家卖了40多万条。”<br/><br/><br/>作者：头条号 / 雷锋网<br/>链接：http://toutiao.com/a6283784300173443329/<br/>来源：头条号（今日头条旗下创作平台）<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div><p><br/></p>','null','1','2016-05-15 13:21:06','2016-05-15 13:21:06',1,'http://p3.pstatp.com/large/5f500087599dd549e56',1),(38,'手机的 6GB 内存除了装B还能干嘛？','拉拉的','<div>1.内存是做什么的？\n这里的内存，就是我们常说的RAM（random access memory/随机存储器），通常作为操作系统或其他正在运行中的程序的临时数据存储媒介。手机中打开的软件是在内存中运行的，安卓的后台机制就是，在没退出软件直接切回桌面时，软件会在内存中保持低耗的运行状态，所以即使我们没看到软件的开启页面，也可以收到它的各种实时通知；也所以，即使当前没在软件界面，软件在内存中低耗运行着，也在消耗着电量。<br/><br/><br/>作者：头条号 / 璞科技<br/>链接：http://toutiao.com/a6278909835480514817/<br/>来源：头条号（今日头条旗下创作平台）<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div><p><br/></p>','null','1','2016-05-15 13:31:37','2016-05-15 13:31:37',1,NULL,1),(39,'Java学习：eclipse使用技巧心得分享','快捷','<div>一、快捷键\n1、提示：Alt+/\n2、格式化：ctrl+shift+f\n3、输入一对的符号，如&quot;&quot;，()，会自动补全，输入后跳出:tab\n4、查找某个方法被谁调用：选中方法名，ctrl+shift+g\n5、查看某个类的继承关系：选中该类，ctrl+t\n6、通过文件名称查找类或文件：ctrl+shift+r\n7、alt+上/下，移动当前行到上或下\n8、ctrl+alt+上/下，复制当前行到上或下\n9、注释：ctrl+/行注释、shift+ctrl+/块注释\n10、方法或者类名上部输入：/**然后回车，会自动生成文档注释\n11、ctrl+d删除当前行\n12、选中方法名，点击F2，提示方法信息\n13、提示错误等\n二、设置\n1、快捷键添加set、get方法，重写或实现接口的某个方法：shift+alt+s<br/><br/><p>&lt;img src = &quot;http://p3.pstatp.com/large/5de0004133245aaa44c&quot; /&gt;</p><p><br/></p>作者：头条号 / IT技术Java交流<br/>链接：http://toutiao.com/a6281173357346767106/<br/>来源：头条号（今日头条旗下创作平台）<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div><p><br/></p>','null','1','2016-05-15 13:54:31','2016-05-15 13:54:31',1,NULL,1),(40,'微信竟然有这么多渣到爆的细节，再不知道你就OUT了','wqwe','<div>来人人都是产品经理【起点学院】，BAT实战派产品总监手把手系统带你学产品、学运营。\n1997年，“码农”张小龙靠一己之力写了Foxmail，但电邮软件是免费的，当时连《人民日报》都在为码农张小龙的生计感到担忧。时隔20年后，张小龙的名字在互联网领域几乎已经无人不知，无人不晓，更多的是因为一款足以彪炳互联网史册的产品——微信。\n\n微信到底有多“光前裕后”呢，根据腾讯2016年3月的内部资料——《微信数据化报告》显示，截止2015年9月，微信的月活跃用户已经达到6.5亿，微信支付累计绑定银行卡超过2亿张，在2016年春节除夕当天微信红包收发总量更是达80.8亿个。真是难以想象。作为这样的一款风靡全球为用户带来无数便利的顶尖社交产品，微信的光芒闪耀之处自然不必赘述，本篇文章剑走偏锋，带着大家一起来扒一扒微信设计中不尽如人意的地方。\n1. 没有搜索记录<br/><p><br/></p><p><br/></p><p>http://p3.pstatp.com/large/5f400077f9393d76e8d</p><br/>作者：头条号 / 人人都是产品经理<br/>链接：http://toutiao.com/a6283030092075778306/<br/>来源：头条号（今日头条旗下创作平台）<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div><p><br/></p>','null','1','2016-05-15 14:03:49','2016-05-15 14:03:49',1,NULL,1),(41,'小米发布会上没说的MIUI 8新功能 千万不要错过哦','位置','<p><a href=\"http://p3.pstatp.com/large/5dd000746a379df5fbf\" _src=\"http://p3.pstatp.com/large/5dd000746a379df5fbf\">http://p3.pstatp.com/large/5dd000746a379df5fbf</a> </p><p><br/></p><div>输入法\n搜狗输入法的实力毋庸置疑，这次小米和搜狗定制了全新的输入法，输入词库更准确，与MIUI 8更配。支持小米账户登录，就算换了手机也不会丢失自己的词库。\n\n\n设置\n随着手机功能越来越多，手机设置界面也越来越繁琐。小米这次从新设计了设置树逻辑，使用户更快更精确地找到自己想要的设置项。在设置上还添加了搜索栏，让隐蔽的设置项更快地找出来。\n\n\n其实小编特别喜欢的分屏功能并没有出现，但是就在MIUI 8发布的那天晚上，洪峰在小米直播中表示分屏功能也会马上登陆MIUI 8了。<br/><br/><br/>作者：头条号 / 小羊笔记<br/>链接：http://toutiao.com/a6284699452080029954/<br/>来源：头条号（今日头条旗下创作平台）<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</div><p><br/></p>','null','1','2016-05-15 14:19:58','2016-05-15 14:19:58',1,'http://p3.pstatp.com/large/5dd000746a379df5fbf',1);
/*!40000 ALTER TABLE `news_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) COLLATE utf8_bin NOT NULL,
  `userPassword` varchar(255) COLLATE utf8_bin NOT NULL,
  `valid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (32,'777123','3452354',0),(88,'让他一人一123123','890',1),(89,'让他一人一','890',1),(90,'345345','345345',1),(91,'456','456',1),(92,'456','456',1),(93,'','',1),(94,'456','456',1),(95,'567','567',1),(96,'547','678',1),(132,'123','123',1),(133,'123123','123456',1),(134,'123','123',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-15 14:25:04

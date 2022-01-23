CREATE DATABASE  IF NOT EXISTS `bin_erp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bin_erp`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 154.23.190.42    Database: bin_erp
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `erp_goods`
--

DROP TABLE IF EXISTS `erp_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `code` varchar(100) NOT NULL COMMENT '产品编号',
  `imgs` varchar(2000) DEFAULT NULL COMMENT '图片',
  `min_buy` varchar(45) DEFAULT NULL COMMENT '起批量',
  `price` varchar(45) DEFAULT NULL COMMENT '进货价',
  `courier_fee` decimal(8,3) DEFAULT NULL COMMENT '快递费',
  `delivery_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  `collection_status` varchar(2) DEFAULT '0' COMMENT '0未采集 1采集未上线 2已上线',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `goods_shopid` (`shopid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_goods`
--

LOCK TABLES `erp_goods` WRITE;
/*!40000 ALTER TABLE `erp_goods` DISABLE KEYS */;
INSERT INTO `erp_goods` VALUES (1,4,'北欧餐桌垫隔热垫锅垫家用厨房简约加厚防烫餐垫盘子垫碗垫茶杯垫','https://detail.1688.com/offer/620183075973.html?spm=a26352.13672862.offerlist.331.354863e1cXjUqz','C-R-0001','https://cbu01.alicdn.com/img/ibank/2020/421/629/16433926124_2128044729.jpg','1','1.100',4.000,2,'1','0','2022-01-21 11:06:12'),(2,4,'家用餐桌卡通隔热垫防烫硅胶餐垫耐高温碗垫锅垫茶杯垫盘垫菜垫','https://detail.1688.com/offer/659193913194.html?spm=a2615.7691456.autotrace-offerGeneral.8.35415c4crfBLG7','C-R-0002','https://cbu01.alicdn.com/img/ibank/O1CN01jnSkY924kzU0eLi0l_!!3199397430-0-cib.jpg','1','1-2.36',4.000,2,'1','0','2022-01-21 11:13:43'),(3,4,'镂空杯垫隔热垫防烫垫家用防滑创意厨房锅垫碗垫餐盘垫餐具杯子垫','https://detail.1688.com/offer/589137212905.html?spm=a2615.7691456.autotrace-offerGeneral.5.35415c4crfBLG7','C-R-0003','https://cbu01.alicdn.com/img/ibank/2019/372/592/10626295273_2128044729.jpg','1','1.2',4.000,2,'1','0','2022-01-21 11:14:57'),(4,4,'2021新款创意家用厨房圆形加厚卡通硅胶防烫垫餐桌碗垫杯垫隔热垫','https://detail.1688.com/offer/645667958217.html?spm=a2615.7691456.autotrace-offerGeneral.13.35415c4crfBLG7','C-R-0004','https://cbu01.alicdn.com/img/ibank/O1CN01SaviAp24kzRtSAVWM_!!3199397430-0-cib.jpg','1','2.35',4.000,2,'1','0','2022-01-21 11:17:05'),(5,4,'保鲜盒食品收纳盒塑料盒子密封盒带盖家用冰箱冷藏水果饭盒便当盒','https://detail.1688.com/offer/629871109407.html?spm=a2615.7691456.autotrace-offerGeneral.7.15773be4Oz4b1S','C-A-0001','https://cbu01.alicdn.com/img/ibank/2020/560/307/22153703065_2128044729.jpg','1','1.69-2.22',4.000,2,'1','0','2022-01-21 11:20:20'),(6,4,'垃圾袋收纳盒塑料袋收集器壁挂厨房方便袋子抽取式整理盒大号盒子','https://detail.1688.com/offer/638745979349.html?spm=a2615.7691456.autotrace-offerGeneral.37.1c433e49qCrvQn','C-A-0002','https://cbu01.alicdn.com/img/ibank/O1CN01cM7ef924kzQbGesRA_!!3199397430-0-cib.jpg','1','7.7',4.000,2,'1','0','2022-01-21 11:21:12'),(9,7,'网红太空舱化妆盒收纳 桌面抽屉式防尘化妆品收纳盒 口红置物架批','https://detail.1688.com/offer/580804586005.html?spm=a26352.13672862.offerlist.105.555f5e46qR25k4','I-A-0001','https://cbu01.alicdn.com/img/ibank/O1CN01Lqdkxr1ZjqNMyKv9m_!!982563231-0-cib.jpg','1','26.8-87.8',4.000,2,'1','0','2022-01-21 14:21:54'),(10,7,'首饰收纳盒耳环手饰耳钉项链大容量居家梳妆台收纳盒子厂家批发','https://detail.1688.com/offer/633548556112.html?spm=a261y.7663282.10811813088311.5.2d697059zvyGOH&amp;sk=consign','I-A-0002','https://cbu01.alicdn.com/img/ibank/2020/013/662/23533266310_491167176.jpg','1','17-67',4.000,2,'1','0','2022-01-21 14:23:13'),(11,9,'双面挂袋收纳整理袋15格30格墙挂式双面内衣袜子收纳挂袋衣柜储物','https://detail.1688.com/offer/606486536522.html?spm=a26352.13672862.offerlist.47.79955971DsaxXK','J-A-0001','https://cbu01.alicdn.com/img/ibank/2019/693/214/12691412396_966726628.jpg','2','2.4-5.7',4.000,2,'1','0','2022-01-21 16:10:11'),(12,9,'小号多彩竹炭棉被收纳袋 彩色衣物储存整理袋被子收纳储物袋','https://detail.1688.com/offer/637731058243.html?spm=a2615.7691456.autotrace-offerGeneral.46.4bac2fd4qSkj3c','J-A-0002','https://cbu01.alicdn.com/img/ibank/2020/084/356/20649653480_966726628.jpg','1','3.47',4.000,2,'1','0','2022-01-21 18:21:32'),(13,10,'厂家二代三档加厚可调节式收纳鞋架 DIY创意简易塑料鞋托双层鞋架','https://detail.1688.com/offer/560474688808.html?spm=a26352.13672862.offerlist.13.56d31e62tN6Yzz','K-A-0001','https://cbu01.alicdn.com/img/ibank/2020/994/530/21348035499_377015928.jpg','1','0.9',4.000,2,'1','0','2022-01-21 18:23:48'),(14,11,'可折叠抽屉式内衣文胸袜子收纳盒网格居家宿舍储物收纳盒收纳神器','https://detail.1688.com/offer/662512562163.html?spm=a2615.7691456.autotrace-offerGeneral.7.60511687EbT7sv','F-A-0001','https://cbu01.alicdn.com/img/ibank/O1CN01JGRUfN1GZKcdDxTmn_!!2380130636-0-cib.jpg','1','7.35-9.41',3.000,2,'1','0','2022-01-21 18:26:11'),(15,11,'厂家可折叠收纳箱 衣物被子玩具车载储物箱 大号钢架牛津布百纳箱','https://detail.1688.com/offer/658265678188.html?spm=a2615.7691456.autotrace-offerGeneral.37.60511687EbT7sv','F-A-0002','https://cbu01.alicdn.com/img/ibank/O1CN01HK5LTi1GZKbnfFgKi_!!2380130636-0-cib.jpg','1','10.8-18.8',5.000,2,'1','0','2022-01-21 18:28:07'),(16,11,'可折叠布艺衣物收纳筐可手提化妆品收纳盒玩具收纳篮易收纳易携带','https://detail.1688.com/offer/653724016766.html?spm=a2615.7691456.autotrace-offerGeneral.34.23161687P8UDY3','F-A-0003','https://cbu01.alicdn.com/img/ibank/O1CN01qxiy881GZKbL99E8y_!!2380130636-0-cib.jpg','1','11.4-15',3.000,2,'1','0','2022-01-21 18:29:19'),(17,11,'简约棉麻棉被收纳袋搬家被子袋卧室收纳衣物换季收纳包双拉链手提','https://detail.1688.com/offer/653475428233.html?spm=a2615.7691456.autotrace-offerGeneral.1.3b6c1687f1cTJa','F-A-0004','https://cbu01.alicdn.com/img/ibank/O1CN01qnAyhQ1GZKb9TPWNQ_!!2380130636-0-cib.jpg','1','16.5-25.5',3.000,2,'1','0','2022-01-21 18:30:14'),(18,11,'简约化妆包便携式旅行手提化妆品收纳包大容量pu防水洗漱收纳包','https://detail.1688.com/offer/648572868487.html?spm=a2615.7691456.autotrace-offerGeneral.16.3b6c1687f1cTJa','F-A-0005','https://cbu01.alicdn.com/img/ibank/O1CN01FAD6ZN1GZKaIDP0xj_!!2380130636-0-cib.jpg','1','16',0.000,2,'1','0','2022-01-21 18:31:47'),(19,8,'家用不锈钢组装鞋架 加固不锈钢鞋架多层鞋柜简易鞋子收纳架批发','https://detail.1688.com/offer/561119872919.html?spm=a261y.7663282.10811813088311.5.2eae1210JGSBDW&amp;sk=consign','A-AE-0001','https://cbu01.alicdn.com/img/ibank/2017/742/742/5892247247_992659750.jpg','1','9.22-10.41',0.000,2,'1','0','2022-01-21 19:17:55'),(20,8,'多功能桌面抽屉式收纳柜 彩色化妆品收纳盒 家居用品化妆盒批发','https://detail.1688.com/offer/550927164851.html?spm=a2615.7691456.autotrace-offerGeneral.31.6944dae7Wwcapx','A-A-0001','https://cbu01.alicdn.com/img/ibank/2017/567/193/4211391765_992659750.jpg','1','2.04',3.000,2,'1','0','2022-01-21 19:34:34'),(21,8,'韩版大号简约收纳挂袋墙上挂式多层整理壁挂棉麻布挂兜门后收纳袋','https://detail.1688.com/offer/529292434013.html?spm=a2615.7691456.autotrace-offerGeneral.43.6944dae7Wwcapx','A-A-0002','https://cbu01.alicdn.com/img/ibank/2016/385/161/3710161583_992659750.jpg','1','4.79',3.000,2,'1','0','2022-01-21 19:36:08'),(22,8,'包包收纳挂袋 宿舍衣柜悬挂式布艺置物袋双面加厚无纺布收纳袋','https://detail.1688.com/offer/596691862843.html?spm=a2615.7691456.autotrace-offerGeneral.22.76b6dae7ONco0s','A-A-0003','https://cbu01.alicdn.com/img/ibank/2019/941/202/11281202149_992659750.jpg','1','5.01',3.000,2,'1','0','2022-01-21 19:37:12'),(23,8,'24格透明口红收纳整理盒塑料桌面口红架展示架化妆品护肤品收纳盒','https://detail.1688.com/offer/607115559948.html?spm=a2615.7691456.autotrace-offerGeneral.31.76b6dae7ONco0s','A-A-0004','https://cbu01.alicdn.com/img/ibank/2019/808/189/12478981808_992659750.jpg','1','2.5',3.000,2,'1','0','2022-01-21 19:38:21'),(24,8,'牛津布保温袋便当包饭盒袋手提包学生带饭包午餐包铝箔长方形饭袋','https://detail.1688.com/offer/662738111758.html?spm=a2615.7691456.autotrace-offerGeneral.37.402cdae7Uvnlti','A-A-0005','https://cbu01.alicdn.com/img/ibank/O1CN012oQTxt2EtMtcZd7Nl_!!2769038802-0-cib.jpg','1','1.14-6.66',3.000,2,'1','0','2022-01-21 19:39:25'),(25,8,'多层抽屉式化妆盒宿舍整理塑料储物盒化妆品护肤梳妆台桌面放置盒','https://detail.1688.com/offer/654331662836.html?spm=a2615.7691456.autotrace-offerGeneral.19.7e78dae7aHLZVA','A-A-0006','https://cbu01.alicdn.com/img/ibank/O1CN01RCTjHo2EtMs9ejNdx_!!2769038802-0-cib.jpg','1','5.54',3.000,2,'1','0','2022-01-21 19:41:10'),(26,8,'塑料收纳盒桌面零食储物盒化妆品学生杂物整理宿舍储物盒子收纳筐','https://detail.1688.com/offer/646341156865.html?spm=a2615.7691456.autotrace-offerGeneral.37.7e78dae7aHLZVA','A-A-0007','https://cbu01.alicdn.com/img/ibank/O1CN01NozE002EtMsDraE90_!!2769038802-0-cib.jpg','1','1-2.37',3.000,2,'1','0','2022-01-21 19:42:02'),(27,8,'桌面棉麻收纳筐 玩具收纳篮可手提桌面储物篮布艺收纳杂物篮批发','https://detail.1688.com/offer/645399098059.html?spm=a2615.7691456.autotrace-offerGeneral.43.7e78dae7aHLZVA','A-A-0008','https://cbu01.alicdn.com/img/ibank/O1CN01azwzO42EtMqe9fkIA_!!2769038802-0-cib.jpg','1','1.87',3.000,2,'1','0','2022-01-21 19:42:48'),(28,8,'卡通可折叠脏衣布艺棉麻收纳桶动物玩具防水家居家用筐衣物脏衣篮','https://detail.1688.com/offer/639069689850.html?spm=a2615.7691456.autotrace-offerGeneral.10.6330dae7T71IEM','A-A-0009','https://cbu01.alicdn.com/img/ibank/O1CN01mkHh6i2EtMqSsoFr1_!!2769038802-0-cib.jpg','1','4.74',3.000,2,'1','0','2022-01-21 19:43:35'),(29,8,'多功能壁挂式贴墙收纳盒 电视空调遥控器杂物文具手机充电储物盒','https://detail.1688.com/offer/634212058062.html?spm=a2615.7691456.autotrace-offerGeneral.13.6330dae7T71IEM','A-A-0010','https://cbu01.alicdn.com/img/ibank/2020/413/484/23528484314_992659750.jpg','1','1.97',3.000,2,'1','0','2022-01-21 19:44:31'),(31,12,'多功能螺旋式晒床单神器蜗牛圆形晾衣架晒衣架旋转晾被架被单阳台','https://detail.1688.com/offer/618479317822.html?spm=a26352.13672862.offerlist.14.e6361e62UtmdPg','L-G-0001','https://cbu01.alicdn.com/img/ibank/2020/984/930/15782039489_2006537779.jpg','1','8.53',3.500,2,'1','0','2022-01-22 13:24:22'),(32,13,'多功能不锈钢晒被子神器床单被单蜗牛晾衣架网红阳台可旋式晾衣架','https://detail.1688.com/offer/640894862407.html?spm=a26352.13672862.offerlist.42.e6361e62UtmdPg','M-G-0001','https://cbu01.alicdn.com/img/ibank/O1CN012xK3zM1fMq9ticta5_!!2211040683993-0-cib.jpg','1','5.6-25.94',3.000,2,'1','0','2022-01-22 13:25:46'),(33,8,'免打孔电吹风机架子壁挂架吸盘式浴室置物架卫生间收纳厕所风筒架','https://detail.1688.com/offer/647080243130.html?spm=a2615.7691456.autotrace-offerGeneral.1.1521164788zWd2','A-C-0001','https://cbu01.alicdn.com/img/ibank/O1CN013y8RsH1yDevwpNisC_!!2519476545-0-cib.jpg','1','0.94',3.500,2,'1','0','2022-01-22 13:27:08'),(34,8,'厂家直销吹风机收纳架卫生间电吹风架浴室摆物免打孔架置物架','https://detail.1688.com/offer/614810740453.html?spm=a2615.7691456.autotrace-offerGeneral.4.1521164788zWd2','A-C-0002','https://cbu01.alicdn.com/img/ibank/2020/982/318/14160813289_992659750.jpg','1','1.31',3.500,2,'1','0','2022-01-22 13:27:43'),(35,8,'创意款吹风机收纳架 卫生间免打孔浴室架置物架带挂钩收纳架','https://detail.1688.com/offer/607464458146.html?spm=a2615.7691456.autotrace-offerGeneral.10.1521164788zWd2','A-C-0003','https://cbu01.alicdn.com/img/ibank/2019/758/640/12601046857_992659750.jpg','1','4.9',3.500,2,'1','0','2022-01-22 13:28:29'),(36,8,'电动剃须刀收纳架刮胡刀架家用牙膏牙刷架壁挂免打孔剃须刀置物架','https://detail.1688.com/offer/664964515530.html?spm=a2615.7691456.autotrace-offerGeneral.1.5e141647aFMNEV','A-C-0004','https://cbu01.alicdn.com/img/ibank/O1CN0193oVBl2EtMtnKOorI_!!2769038802-0-cib.jpg','1','1.32',3.500,2,'1','0','2022-01-22 13:29:05'),(37,14,'吹风机架免打孔卫生间电吹风架壁挂置物架吹风机架子浴室风筒架','https://detail.1688.com/offer/606874133843.html?spm=a2615.7691456.autotrace-offerGeneral.1.5d873b0aqbjuZJ','D-C-0001','https://cbu01.alicdn.com/img/ibank/2019/141/708/12545807141_1051487683.jpg','1','3.2',3.500,2,'1','0','2022-01-22 13:29:54'),(38,14,'2643吹风机架卫生间吹风机收纳架 壁挂吹风机支架置物架免打孔','https://detail.1688.com/offer/607999399794.html?spm=a2615.7691456.autotrace-offerGeneral.4.5d873b0aqbjuZJ','D-C-0002','https://cbu01.alicdn.com/img/ibank/2019/996/441/12665144699_1051487683.jpg','1','5.2',3.500,2,'1','0','2022-01-22 13:30:34'),(39,15,'电动牙刷置物架免打孔壁挂式牙具收纳洗手间沥水不传电挂剃须刀','https://detail.1688.com/offer/655787551137.html?spm=a26352.13672862.qrwlist.30.484d1e62iAZnDT','E-C-0001','https://cbu01.alicdn.com/img/ibank/O1CN01RHHlh91Zm8NgyLXZ4_!!1752583236-0-cib.jpg','1','3.4',3.500,2,'1','0','2022-01-22 13:31:15'),(40,8,'一次性无纺免洗抹布 吸水懒人抹布 不沾油清洁擦桌洗碗布','https://detail.1688.com/offer/594189544229.html?spm=a2615.7691456.autotrace-offerGeneral.1.1e561647Tk4hoR','A-H-0001','https://cbu01.alicdn.com/img/ibank/O1CN01E0fY8l2EtMpxgkP4q_!!2769038802-0-cib.jpg','1','1.38-2.41',3.500,2,'1','0','2022-01-22 13:32:43'),(41,16,'厨房洗碗布双面双色擦锅吸水洗碗巾不沾油懒人抹布加厚百洁布','https://detail.1688.com/offer/558327493369.html?spm=a26352.13672862.offerlist.7.16871e62Tx3MHi','N-H-0001','https://cbu01.alicdn.com/img/ibank/O1CN01GZtf9w2JG2tYvPYCC_!!3396369393-0-cib.jpg','5','0.2-1.2',2.500,2,'1','0','2022-01-22 13:33:41'),(42,4,'家居衣服粘毛器手撕粘尘纸滚筒除毛器除尘刷粘毛滚宠物毛发黏毛器','https://detail.1688.com/offer/603830542444.html?spm=a2615.7691456.autotrace-offerGeneral.1.695f3e492lW3ij','C-L-0001','https://cbu01.alicdn.com/img/ibank/2019/539/072/12139270935_2128044729.jpg','1','1.57-2',4.000,2,'1','0','2022-01-22 13:48:26'),(43,4,'新款粘毛器滚刷可撕式粘尘纸除毛器去毛器沾毛器滚筒粘毛刷粘毛滚','https://detail.1688.com/offer/656211581907.html?spm=a2615.7691456.autotrace-offerGeneral.10.695f3e492lW3ij','C-L-0002','https://cbu01.alicdn.com/img/ibank/O1CN01IzdkZm24kzTgoEcrT_!!3199397430-0-cib.jpg','1','1.89-3.2',4.000,2,'1','0','2022-01-22 13:49:07'),(44,8,'工厂批发 家居电池电动毛衣剃毛器 塑料去毛器剃毛机 毛球修剪器','https://detail.1688.com/offer/656053149014.html?spm=a2615.7691456.autotrace-offerGeneral.7.5ccd1647X59jCY','A-L-0001','https://cbu01.alicdn.com/img/ibank/O1CN01pfQLcH2EtMsMq0u5c_!!2769038802-0-cib.jpg','1','5.19',3.500,2,'1','0','2022-01-22 13:49:58'),(45,17,'跨境多功能切菜器手动拉蒜器迷你绞蒜机切蒜家用 压蒜器 捣蒜器','https://detail.1688.com/offer/660422627839.html?spm=a26352.13672862.offerlist.1.7a5a13b9Hfv9hi','O-U-0001','https://cbu01.alicdn.com/img/ibank/O1CN01r7ri411C32Dz7NGYr_!!2211111090024-0-cib.jpg','1','3.4-5.6',2.500,2,'1','0','2022-01-22 13:50:49'),(46,8,'T折叠便携购物袋牛津布袋子大容量买菜超市便捷购物车','https://detail.1688.com/offer/629615794875.html?spm=a2615.7691456.autotrace-offerGeneral.1.7e8b1647NXMlCi','A-I-0001','https://cbu01.alicdn.com/img/ibank/2020/301/233/21866332103_992659750.jpg','1','6.89',3.500,2,'1','0','2022-01-22 13:51:32'),(47,8,'厨房橱柜门挂式小号垃圾桶 家用桌面塑料收纳盒 免打孔壁挂垃圾篓','https://detail.1688.com/offer/659430398068.html?spm=a2615.7691456.autotrace-offerGeneral.10.741c1647FdhxIq','A-I-0002','https://cbu01.alicdn.com/img/ibank/O1CN01M8tGh42EtMsqMjaEr_!!2769038802-0-cib.jpg','1','4.4',3.500,2,'1','0','2022-01-22 13:52:30'),(48,4,'自动收口抽绳垃圾袋家用厨房手提式加厚一次性黑色大号实惠塑料袋','https://detail.1688.com/offer/620535471926.html?spm=a2615.7691456.autotrace-offerGeneral.43.1c433e49qCrvQn','C-I-0001','https://cbu01.alicdn.com/img/ibank/2020/146/368/16588863641_2128044729.jpg','5','0.98',4.000,2,'1','0','2022-01-22 13:53:12'),(49,4,'XY厨房防堵塞水槽过滤网洗碗洗菜水池垃圾袋排水口过滤水切袋地摊','https://detail.1688.com/offer/552397778749.html?spm=a2615.7691456.autotrace-offerGeneral.25.1c433e49qCrvQn','C-I-0002','https://cbu01.alicdn.com/img/ibank/2019/982/490/11220094289_2128044729.jpg','2','0.5',4.000,2,'1','0','2022-01-22 13:53:53'),(50,4,' XY5卷装背心式垃圾袋地摊加厚垃圾袋家用厨房黑色环保手提垃圾袋','https://detail.1688.com/offer/571422637792.html?spm=a2615.7691456.autotrace-offerGeneral.16.1c433e49qCrvQn','C-I-0003','https://cbu01.alicdn.com/img/ibank/2019/437/149/12527941734_2128044729.jpg','2','2.69-4.85',4.000,2,'1','0','2022-01-22 13:54:38'),(51,4,'纸巾盒抽纸盒家用简约客厅餐厅茶几北欧风桌面抽纸收纳盒餐巾纸盒','https://detail.1688.com/offer/637717476413.html?spm=a2615.7691456.autotrace-offerGeneral.25.2a003e49IJUt5d','C-J-0001','https://cbu01.alicdn.com/img/ibank/O1CN01AptJeI24kzQX6g9vn_!!3199397430-0-cib.jpg','1','4.95-6',4.000,2,'1','0','2022-01-22 13:56:13'),(52,8,'小牛纸巾盒创意客厅家用可爱餐厅茶几抽纸盒牙签盒多功能卡通动物','https://detail.1688.com/offer/620792905396.html?spm=a2615.7691456.autotrace-offerGeneral.4.54f31647SUilqK','A-J-0001','https://cbu01.alicdn.com/img/ibank/2020/944/297/21932792449_992659750.jpg','1','6.26',3.500,2,'1','0','2022-01-22 13:57:12'),(53,8,'简约北欧风纸巾盒木盖抽纸盒实木客厅遥控器收纳盒创意餐厅纸盒','https://detail.1688.com/offer/641986663589.html?spm=a2615.7691456.autotrace-offerGeneral.7.54f31647SUilqK','A-J-0002','https://cbu01.alicdn.com/img/ibank/O1CN01b9Ivao2EtMqELp5pU_!!2769038802-0-cib.jpg','1','3.49',3.500,2,'1','0','2022-01-22 13:58:00'),(54,8,'浴室纸巾收纳盒现代简约壁挂式纸巾盒家用卫生间免打孔防水纸巾盒','https://detail.1688.com/offer/619864387754.html?spm=a2615.7691456.autotrace-offerGeneral.10.54f31647SUilqK','A-J-0003','https://cbu01.alicdn.com/img/ibank/2020/162/270/16256072261_992659750.jpg','1','6.63',3.500,2,'1','0','2022-01-22 13:58:38'),(55,8,'厂家直销家用卫生间免打孔壁挂抽纸盒 多功能酒店浴室防水卷纸盒','https://detail.1688.com/offer/625603635580.html?spm=a2615.7691456.autotrace-offerGeneral.19.54f31647SUilqK','A-J-0004','https://cbu01.alicdn.com/img/ibank/2020/993/615/19753516399_992659750.jpg','1','4.7-5.94',4.500,2,'1','0','2022-01-22 13:59:27'),(56,8,'创意欧式家用客厅简约纸巾盒抽纸盒面纸餐巾纸茶几桌面方形收纳盒','https://detail.1688.com/offer/606470694382.html?spm=a2615.7691456.autotrace-offerGeneral.28.54f31647SUilqK','A-J-0005','https://cbu01.alicdn.com/img/ibank/2019/797/125/12419521797_992659750.jpg','1','2.5',3.500,2,'1','0','2022-01-22 14:00:01'),(57,8,'【双层纸巾盒】 卫生间厕所卫生纸置物架壁挂式免打孔卷抽纸盒','https://detail.1688.com/offer/645379784202.html?spm=a2615.7691456.autotrace-offerGeneral.37.54f31647SUilqK','A-J-0006','https://cbu01.alicdn.com/img/ibank/O1CN01SYIl5Q2EFymz5KseN_!!2207156588716-0-cib.jpg','1','13.8',3.500,2,'1','0','2022-01-22 14:00:36'),(58,18,'创意报纸烘焙纸食物专用空气炸锅烤箱吸油纸厨房烧烤耐高温硅油纸','https://detail.1688.com/offer/655875773089.html?spm=a26352.13672862.offerlist.19.4ebb1e62CklFYa','P-M-0001','https://cbu01.alicdn.com/img/ibank/O1CN015Flg3V1hYPQwbwDuw_!!2396944289-0-cib.jpg','1','4.6',3.200,2,'1','0','2022-01-22 14:02:00'),(59,14,'2934硅油纸烘焙烤箱烧烤盘烤肉吸油纸食物专用锡纸不粘家用耐高温','https://detail.1688.com/offer/639294993544.html?spm=a26352.13672862.offerlist.25.4ebb2775Ql6WXI','D-M-0001','https://cbu01.alicdn.com/img/ibank/O1CN01v7X02828Mx6xT3zuu_!!961837919-0-cib.jpg','1','2.05-3.8',3.500,2,'1','0','2022-01-22 14:02:38'),(60,19,'双童吸管一次性单独包装孕妇产妇纸吸管宝宝儿童独立弯头塑料吸管','https://detail.1688.com/offer/658856237013.html?spm=a26352.13672862.offerlist.25.5cda1e62aKToxr','Q-V-0001','https://cbu01.alicdn.com/img/ibank/O1CN01Se5ZZQ1l4Py53xUSE_!!1010054765-0-cib.jpg','1','1.8',2.500,2,'1','0','2022-01-22 14:03:20'),(61,19,'双童麦秆吸管稻草小麦秸秆果汁饮料吸管独立包装可降解一次性吸管','https://detail.1688.com/offer/643696597856.html?spm=a26352.13672862.offerlist.239.5cda1e62aKToxr','Q-V-0002','https://cbu01.alicdn.com/img/ibank/O1CN01vpqvkp1l4Pvn9rNPY_!!1010054765-0-cib.jpg','1','9.18-10.13',2.500,2,'1','0','2022-01-22 14:03:49'),(62,19,'双童304不锈钢吸管粗非一次性彩色饮管牛奶冷饮弯头金属吸管套装','https://detail.1688.com/offer/654030401027.html?spm=a26352.13672862.offerlist.235.5cda1e62aKToxr','Q-V-0003','https://cbu01.alicdn.com/img/ibank/O1CN01v1e31X1l4PxHFVTfo_!!1010054765-0-cib.jpg','1','4.9-6.8',2.500,2,'1','0','2022-01-22 14:04:25'),(63,8,'卡通可折叠脏衣布艺棉麻收纳桶动物玩具防水家居家用筐衣物脏衣篮','https://detail.1688.com/offer/639069689850.html?spm=a2615.7691456.autotrace-offerGeneral.1.720c1647NIuM9I','A-K-0001','https://cbu01.alicdn.com/img/ibank/O1CN01mkHh6i2EtMqSsoFr1_!!2769038802-0-cib.jpg','1','4.74',3.500,2,'1','0','2022-01-22 14:05:07'),(64,8,'家用布艺大号脏衣篮多功能组装洗衣篮衣物收纳篓可折叠收纳脏衣篮','https://detail.1688.com/offer/658282599376.html?spm=a2615.7691456.autotrace-offerGeneral.7.720c1647NIuM9I','A-K-0002','https://cbu01.alicdn.com/img/ibank/O1CN01qZYMjG2EtMsnMlMMs_!!2769038802-0-cib.jpg','1','10.38',3.500,2,'1','0','2022-01-22 14:05:39'),(65,14,'脏衣篓脏衣服收纳筐可折叠洗衣篓子浴室放衣挂袋家用壁挂式篓框桶','https://detail.1688.com/offer/662065740598.html?spm=a26352.13672862.offerlist.23.34f237faoNnzBD','D-K-0001','https://cbu01.alicdn.com/img/ibank/O1CN01I0VI2A28MxBB70I0j_!!961837919-0-cib.jpg','1','4.4',3.500,2,'1','0','2022-01-22 14:06:30'),(66,11,'三明治卡通刺绣洗衣袋内衣洗衣袋文胸护洗袋收纳袋印花可来样做货','https://detail.1688.com/offer/646910803913.html?spm=a26352.13672862.offerlist.4.50394382d2ns3r','F-K-0001','https://cbu01.alicdn.com/img/ibank/O1CN01PaIeDa1GZKZtCqWPo_!!2380130636-0-cib.jpg','1','5.8-22.8',3.000,2,'1','0','2022-01-22 14:07:58'),(67,11,'厂家直供文胸机洗袋家用内衣护洗袋内衣洗衣袋网袋防缠绕收纳袋','https://detail.1688.com/offer/45400461880.html?spm=a2615.7691456.autotrace-offerGeneral.1.445d4662NLzgTJ','F-K-0002','https://cbu01.alicdn.com/img/ibank/O1CN01tRhahv1GZKaQp8mzT_!!2380130636-0-cib.jpg','1','2-3.9',3.000,2,'1','0','2022-01-22 14:08:33'),(68,11,'洗衣袋洗衣机专用防变形神器文胸过滤网内衣洗衣服加厚护洗衣网袋','https://detail.1688.com/offer/664726622108.html?spm=a2615.7691456.autotrace-offerGeneral.28.445d4662NLzgTJ','F-K-0003','https://cbu01.alicdn.com/img/ibank/O1CN01u5BxRb1GZKctpZXUl_!!2380130636-0-cib.jpg','1','1.8-20.8',3.000,2,'1','0','2022-01-22 14:09:07'),(69,11,'新款200G厚款三明治厚款套装洗衣服的洗衣袋文胸内衣洗衣机网袋','https://detail.1688.com/offer/639338953906.html?spm=a2615.7691456.autotrace-offerGeneral.25.1f7a4662kJPTvu','F-K-0004','https://cbu01.alicdn.com/img/ibank/O1CN01CG90QO1GZKYO0in9F_!!2380130636-0-cib.jpg','1','2.3-14.5',3.000,2,'1','0','2022-01-22 14:09:52'),(70,8,'新款北欧ins风防水防油免洗桌布台布 家用餐桌垫酒店防尘布茶几布','https://detail.1688.com/offer/662235234720.html?spm=a2615.7691456.autotrace-offerGeneral.7.76b81647ykqDoN','A-E-0001','https://cbu01.alicdn.com/img/ibank/O1CN0156q77I2EtMtTK0iFk_!!2769038802-0-cib.jpg','1','2.58-4.79',3.500,2,'1','0','2022-01-22 14:10:39'),(71,20,'北欧风桌布防水防烫pvc茶几垫长方形家用加厚餐桌布台布免洗防油','https://detail.1688.com/offer/638365104507.html?spm=a261y.7663282.trade-type-tab.2.5a824c78C9I4Iw&amp;sk=consign','R-E-0001','https://cbu01.alicdn.com/img/ibank/O1CN013LLuAp1fK5m7pUed3_!!2928533987-0-cib.jpg','1','13.20-34.00',3.500,2,'1','0','2022-01-22 14:11:23'),(72,20,'北欧餐桌布防水防油免洗PVC欧美酒店桌布聚会假期餐布跨境桌套','https://detail.1688.com/offer/608587815186.html?spm=a26352.13672862.offerlist.46.39ab1e62zlTnNe','R-E-0002','https://cbu01.alicdn.com/img/ibank/2019/343/502/12641205343_550330054.jpg','1','14-33',3.500,1,'1','0','2022-01-22 14:12:09'),(73,21,'居家北欧桌布防烫防水防油 日式免洗PVC台布 茶几布ins网红餐桌垫','https://detail.1688.com/offer/617198494608.html?spm=a26352.13672862.offerlist.70.39ab1e62zlTnNe','S-E-0001','https://cbu01.alicdn.com/img/ibank/2020/422/225/14928522224_1952289920.jpg','1','3.3-5.96',4.000,2,'1','0','2022-01-22 14:12:54'),(74,22,'纯色餐桌布防水防油防烫免洗pvc家用茶几台布长方形学生ins书桌垫','https://detail.1688.com/offer/622889225061.html?spm=a26352.13672862.offerlist.74.39ab1e62zlTnNe','G-E-0001','https://cbu01.alicdn.com/img/ibank/2020/913/419/18107914319_1549368395.jpg','1','13.5-28',0.000,2,'1','0','2022-01-22 14:13:40'),(75,8,'款棉麻围裙 挂脖日式格子围裙厨房家居半身工作围裙工厂批发','https://detail.1688.com/offer/639404223068.html?spm=a2615.7691456.autotrace-offerGeneral.1.1bff16476L04Vs','A-Z-0001','https://cbu01.alicdn.com/img/ibank/2017/486/792/3930297684_1737527223.jpg','1','2.75',3.500,2,'1','0','2022-01-22 14:14:30'),(76,8,'家用可擦手围裙女厨房防水防油时尚围腰大人厨师做饭的工作罩衣男','https://detail.1688.com/offer/651907154316.html?spm=a2615.7691456.autotrace-offerGeneral.4.1bff16476L04Vs','A-Z-0002','https://cbu01.alicdn.com/img/ibank/O1CN01o8Y55I2EtMrq3bxRt_!!2769038802-0-cib.jpg','1','4.9',3.500,2,'1','0','2022-01-22 14:15:12'),(77,8,'可擦手围裙家用厨房防水防油做饭罩衣围兜成人男女大码时尚围腰','https://detail.1688.com/offer/647424134671.html?spm=a2615.7691456.autotrace-offerGeneral.7.1bff16476L04Vs','A-Z-0003','https://cbu01.alicdn.com/img/ibank/O1CN01p2Ig222EtMr9AEwVX_!!2769038802-0-cib.jpg','1','4.11',3.500,2,'1','0','2022-01-22 14:15:54'),(78,8,'韩版一体式围裙涤纶防水厨房成人罩衣 反穿衣罩卡通长袖带兜围裙','https://detail.1688.com/offer/526176013370.html?spm=a2615.7691456.autotrace-offerGeneral.10.1bff16476L04Vs','A-Z-0004','https://cbu01.alicdn.com/img/ibank/2016/539/601/2726106935_992659750.jpg','1','5.78',3.500,2,'1','0','2022-01-22 14:16:34'),(79,8,'家用可擦手围裙女厨房防水防油时尚围腰大人厨师做饭的工作罩衣男','https://detail.1688.com/offer/650768095828.html?spm=a2615.7691456.autotrace-offerGeneral.16.1bff16476L04Vs','A-Z-0005','https://cbu01.alicdn.com/img/ibank/O1CN01BTwMcV2EtMrVg7zp7_!!2769038802-0-cib.jpg','1','4.6',3.500,2,'1','0','2022-01-22 14:17:11'),(80,8,'家用厨房防水防油可爱日系韩版女时尚小雏菊夏天薄款做饭围腰批发','https://detail.1688.com/offer/639412679452.html?spm=a2615.7691456.autotrace-offerGeneral.34.1bff16476L04Vs','A-Z-0006','https://cbu01.alicdn.com/img/ibank/2020/866/118/17218811668_1737527223.jpg','1','3.84',3.500,2,'1','0','2022-01-22 14:17:44'),(81,8,'小熊卡通擦手围裙家用厨房防油时尚女韩式成人罩衣工作做饭','https://detail.1688.com/offer/639081506119.html?spm=a2615.7691456.autotrace-offerGeneral.37.1bff16476L04Vs','A-Z-0007','https://cbu01.alicdn.com/img/ibank/2019/813/865/12706568318_1737527223.jpg','1','4.15',3.500,2,'1','0','2022-01-22 14:18:18'),(82,22,'针织猫脚套桌脚桌腿椅子腿保护套防滑静音耐磨椅子脚套批发','https://detail.1688.com/offer/589180931346.html?spm=a26352.13672862.offerlist.13.67081e62q0pKV7','G-D-0001','https://cbu01.alicdn.com/img/ibank/2019/834/727/10578727438_1549368395.jpg','4','1.1',3.000,2,'1','0','2022-01-22 14:20:41'),(83,23,'针织椅子脚套耐磨静音桌腿桌脚椅子腿保护套凳子脚套防滑桌椅脚垫','https://detail.1688.com/offer/632529933395.html?spm=a26352.13672862.offerlist.27.67081e62q0pKV7','T-D-0001','https://cbu01.alicdn.com/img/ibank/2020/805/629/23092926508_123860573.jpg','1','8-23',3.000,2,'1','0','2022-01-22 14:21:22'),(84,23,'针织椅子脚套耐磨静音桌腿桌脚椅子腿保护套凳子脚套防滑桌椅脚垫','https://detail.1688.com/offer/604311401130.html?spm=a26352.13672862.offerlist.31.67081e62q0pKV7','T-D-0002','https://cbu01.alicdn.com/img/ibank/2020/165/716/23016617561_123860573.jpg','1','17-36',0.000,2,'1','0','2022-01-22 14:21:52'),(85,23,'针织桌脚桌腿椅子套保护套椅子脚套凳子腿套防滑桌椅脚垫静音耐磨','https://detail.1688.com/offer/660747381855.html?spm=a26352.13672862.offerlist.35.67081e62q0pKV7','T-D-0003','https://cbu01.alicdn.com/img/ibank/O1CN016A0pCv1fK5pjEcsdC_!!2928533987-0-cib.jpg','1','13.6-19.2',3.500,2,'1','0','2022-01-22 14:22:38'),(86,24,'防滑硅胶桌脚垫 加厚桌椅脚套 桌子脚保护垫 椅子腿保护套','https://detail.1688.com/offer/617577820779.html?spm=a26352.13672862.offerlist.151.67081e62q0pKV7','U-D-0001','https://cbu01.alicdn.com/img/ibank/2020/682/660/15369066286_2105700885.jpg','10','0.09',3.000,2,'1','0','2022-01-22 14:23:59'),(87,14,'2266静音耐磨桌椅脚套椅子凳子桌脚垫 猫爪桌脚套地板保护垫','https://detail.1688.com/offer/1286673987.html?spm=a26352.13672862.offerlist.12.73d71e62nehRB4','D-D-0001','https://cbu01.alicdn.com/img/ibank/O1CN011mRMmi28Mx89decR6_!!961837919-0-cib.jpg','3','2.7',3.500,2,'1','0','2022-01-22 14:24:44'),(88,8,'创意款家用烟灰缸不锈钢免打孔壁挂烟灰缸卫生间香烟收纳架烟灰缸','https://detail.1688.com/offer/627881389926.html?spm=a2615.7691456.autotrace-offerGeneral.1.1f5116475w20h9','A-AA-0001','https://cbu01.alicdn.com/img/ibank/2020/526/763/21321367625_992659750.jpg','1','4.68',3.500,2,'1','0','2022-01-22 14:25:19'),(89,8,'大号厨房防油贴纸家用防水油烟机自粘灶台帖卡通墙贴瓷砖贴','https://detail.1688.com/offer/613503116177.html?spm=a2615.7691456.autotrace-offerGeneral.1.174e1647zTAmlY','A-N-0001','https://cbu01.alicdn.com/img/ibank/2020/392/723/13770327293_992659750.jpg','1','2.23',3.500,2,'1','0','2022-01-22 14:26:09'),(90,8,'自粘油烟纸防油污贴纸家用灶台瓷砖墙贴厨房防水墙纸防油纸油烟贴','https://detail.1688.com/offer/578637235038.html?spm=a2615.7691456.autotrace-offerGeneral.4.174e1647zTAmlY','A-N-0002','https://cbu01.alicdn.com/img/ibank/2018/366/409/9425904663_992659750.jpg','1','1.39',3.500,2,'1','0','2022-01-22 14:26:44'),(91,25,'跨境亮面厨房墙贴纸防油卫生间防水墙面装饰自贴自粘仿瓷砖贴批发','https://detail.1688.com/offer/654166480231.html?spm=a26352.13672862.offerlist.69.38d01e622kNyrR','V-N-0001','https://cbu01.alicdn.com/img/ibank/O1CN01DCKGAn1XzIXzzdOrE_!!2894312994-0-cib.jpg','10','3.5',0.000,2,'1','0','2022-01-22 14:27:48'),(92,8,'彩条地垫 创意进门脚垫厨房卫生间防滑门垫 浴室垫批发','https://detail.1688.com/offer/541596291842.html?spm=a2615.7691456.autotrace-offerGeneral.1.5a2b1647OMKL7Q','A-B-0001','https://cbu01.alicdn.com/img/ibank/2018/810/945/9228549018_992659750.jpg','1','3.21-4.95',3.500,2,'1','0','2022-01-22 14:29:00'),(93,8,'家用四叶草地垫 防滑蹭灰垫拉绒脚垫 卫浴厨房印花防滑垫工厂直销','https://detail.1688.com/offer/627811809231.html?spm=a2615.7691456.autotrace-offerGeneral.4.5a2b1647OMKL7Q','A-B-0002','https://cbu01.alicdn.com/img/ibank/2020/165/714/21216417561_992659750.jpg','1','4.07',3.500,2,'1','0','2022-01-22 14:29:41'),(94,8,'新款地垫门垫进门地毯脚垫厨房防滑家用防水满铺吸水垫子耐用批发','https://detail.1688.com/offer/619678548187.html?spm=a2615.7691456.autotrace-offerGeneral.13.5a2b1647OMKL7Q','A-B-0003','https://cbu01.alicdn.com/img/ibank/2020/476/237/16691732674_992659750.jpg','1','5.65',3.500,2,'1','0','2022-01-22 14:30:20'),(95,8,'素色可裁剪拼接地垫 卫生间30*30浴室垫厕所进门脚垫批发','https://detail.1688.com/offer/580232637455.html?spm=a2615.7691456.autotrace-offerGeneral.16.5a2b1647OMKL7Q','A-B-0004','https://cbu01.alicdn.com/img/ibank/2019/174/241/10748142471_992659750.jpg','1','1.64-2.11',3.500,2,'1','0','2022-01-22 14:30:57'),(96,8,'简约绒毛地垫 绒面地毯家用浴室吸水脚垫批发','https://detail.1688.com/offer/649515276208.html?spm=a2615.7691456.autotrace-offerGeneral.24.5a2b1647OMKL7Q','A-B-0005','https://cbu01.alicdn.com/img/ibank/O1CN01dajUJK2EtMrT7gLRI_!!2769038802-0-cib.jpg','1','8.2',3.500,2,'1','0','2022-01-22 14:31:38'),(97,8,'彩色拼接浴室防滑垫 优质PE卫生间组合地垫可裁剪拼接脚垫批发','https://detail.1688.com/offer/543387029089.html?spm=a2615.7691456.autotrace-offerGeneral.27.5a2b1647OMKL7Q','A-B-0006','https://cbu01.alicdn.com/img/ibank/2016/288/232/3734232882_992659750.jpg','1','1.31',3.500,2,'1','0','2022-01-22 14:32:16'),(98,26,'速干硅藻泥软地垫硅藻土吸水脚垫速干家用卫生间浴室防滑垫进门垫','https://detail.1688.com/offer/664443514175.html?spm=a26352.23326140a26352.offerlist.26.3ae91e6209AWkN','W-B-0001','https://cbu01.alicdn.com/img/ibank/O1CN01INw9aH1pmcfhnv2xT_!!2208139415403-0-cib.jpg','1','13.28-16.95',3.000,2,'1','0','2022-01-22 14:33:09'),(99,27,'加厚条纹厨房套装地垫耐脏防油吸水组合长地毯可裁剪刮泥蹭土脚垫','https://detail.1688.com/offer/644912920904.html?spm=a26352.13672862.offerlist.28.53501e62Nn8nP7&amp;tracelog=p4p&amp;clickid=96cadbd3688e42199ec0ea60f15a9bd9&amp;sessionid=97c786a6c3b08daade0d4544b0a3cead','X-B-0001','https://cbu01.alicdn.com/img/ibank/O1CN01V3DLPL1FGGTZzxYiV_!!2176080459-0-cib.jpg','1','17.55',4.000,2,'1','0','2022-01-22 14:33:52'),(100,28,'爆款鹅卵石压花门口地毯3d门垫卫生间垫子浴室门口吸水防滑垫地垫','https://detail.1688.com/offer/630536301348.html?spm=a26352.13672862.offerlist.18.70f51e62qQyAr0&amp;tracelog=p4p&amp;clickid=2b0e9d8c63aa457bb20aa6f73fc20f11&amp;sessionid=ca463c5acf323eb0d22f51c0d0ca4d6b','Y-B-0001','https://cbu01.alicdn.com/img/ibank/2020/009/798/22260897900_618370720.jpg','1','16.5-29.8',6.000,2,'1','0','2022-01-22 14:34:43'),(101,28,'跨境简约砖纹地毯纯色两件套马桶垫浴室吸水防滑脚垫新款门垫批发','https://detail.1688.com/offer/641085246471.html?spm=a2615.7691456.autotrace-offerGeneral.31.1ddf2baflh74Ah','Y-B-0002','https://cbu01.alicdn.com/img/ibank/O1CN01K5KL2F2IXA6GY0KGM_!!2209198069295-0-cib.jpg','1','40.8',6.000,2,'1','0','2022-01-22 14:35:29'),(102,28,'家用记忆海绵蝴蝶绒浴室吸水防滑地毯卧室进门脚垫卫生间吸水地垫','https://detail.1688.com/offer/640000833207.html?spm=a2615.7691456.autotrace-offerGeneral.37.1ddf2baflh74Ah','Y-B-0003','https://cbu01.alicdn.com/img/ibank/O1CN01VgN3h72IXA66xVsbE_!!2209198069295-0-cib.jpg','1','17.5-24.8',6.000,2,'1','0','2022-01-22 14:36:04'),(103,29,'跨境高毛绒加厚地垫地毯 简约厨房卫生间门垫浴室防滑垫吸水脚垫','https://detail.1688.com/offer/594657669024.html?spm=a261y.7663282.10811813088311.5.5b272fcfk4mKwX&amp;sk=consign','Z-B-0001','https://cbu01.alicdn.com/img/ibank/2019/106/663/11144366601_1222379752.jpg','1','14.88-42.98',6.000,2,'1','0','2022-01-22 14:36:52'),(104,30,'惠多厨房地垫防滑防油防水家用门口脚垫耐脏进门吸水长条垫子地毯','https://detail.1688.com/offer/detail.1688.com/offer/643968144637.html.html?spm=a261y.7663282.trade-type-tab.1.37672ba2xMrM0O&amp;sk=consign','AA-B-0001','https://cbu01.alicdn.com/img/ibank/O1CN01cx0cVC2BXR2Dz50jM_!!2208738438348-0-cib.jpg','1','8.64-27',3.000,2,'1','0','2022-01-22 14:37:33'),(105,30,'进门地垫入户门垫地毯卧室厨房浴室卫生间厕所门口防滑垫吸水脚垫','https://detail.1688.com/offer/643967920641.html?spm=a2615.7691456.autotrace-offerGeneral.10.580d7250db2rjQ','AA-B-0002','https://cbu01.alicdn.com/img/ibank/O1CN018jyk1u2BXR25M8Wp4_!!2208738438348-0-cib.jpg','1','9.36-17.28',4.000,2,'1','0','2022-01-22 14:38:07'),(106,30,'浴室吸水地垫地毯卫生间门口防滑垫子厕所脚垫门垫进门卧室家用大','https://detail.1688.com/offer/644711602450.html?spm=a2615.7691456.autotrace-offerGeneral.1.4f0d772akJMjV9','AA-B-0003','https://cbu01.alicdn.com/img/ibank/O1CN01L3JmmB2BXR2NdVYP2_!!2208738438348-0-cib.jpg','1','23.4',4.000,2,'1','0','2022-01-22 14:38:48'),(107,30,'厨房地垫长条防油脚垫家用吸水防滑入户进门门垫防水耐脏地毯卧室','https://detail.1688.com/offer/643968104747.html?spm=a2615.7691456.autotrace-offerGeneral.25.47193831IdutdY','AA-B-0004','https://cbu01.alicdn.com/img/ibank/O1CN01rFvH0k2BXR2HSU8b0_!!2208738438348-0-cib.jpg','1','8.91-26.73',4.000,2,'1','0','2022-01-22 14:39:22'),(108,30,'圆形地毯卧室客厅儿童吊篮电脑椅地垫吊椅垫子茶几毯床边简约家用','https://detail.1688.com/offer/644715546465.html?spm=a2615.7691456.autotrace-offerGeneral.19.7819387eAINiHP','AA-B-0005','https://cbu01.alicdn.com/img/ibank/O1CN01li707U2BXR2FEthEX_!!2208738438348-0-cib.jpg','1','27.73-62.41',4.000,2,'1','0','2022-01-22 14:39:59'),(109,30,'卡通卫生间浴室吸盘防滑垫无味浴缸洗澡脚垫厕所沐浴房垫子淋浴垫','https://detail.1688.com/offer/643971348010.html?spm=a2615.7691456.autotrace-offerGeneral.7.3c0c41aa20Cqei','AA-B-0006','https://cbu01.alicdn.com/img/ibank/O1CN0138CnBT2BXR2JdtIvJ_!!2208738438348-0-cib.jpg','1','19.8',4.000,2,'1','0','2022-01-22 14:40:31'),(110,8,'厨房食品密封夹茶叶奶粉咖啡零食封口保鲜封口夹塑料袋密封器批发','https://detail.1688.com/offer/658759024936.html?spm=a2615.7691456.autotrace-offerGeneral.1.41c01647MLEXNr','A-O-0001','https://cbu01.alicdn.com/img/ibank/O1CN01UXHYhp2EtMt9NUWfk_!!2769038802-0-cib.jpg','1','0.39',3.500,2,'1','0','2022-01-22 14:41:15'),(111,31,'塑料封口夹茶叶夹食品保鲜零食袋防潮密封夹11cm礼品厂家','https://detail.1688.com/offer/523170485441.html?spm=a26352.13672862.offerlist.7.17f21e62mmI5MQ','AB-O-0001','https://cbu01.alicdn.com/img/ibank/2015/319/289/2535982913_951598459.jpg','3','0.09',3.500,2,'1','0','2022-01-22 14:41:52'),(112,8,'一次性马桶垫无纺布防水单片装坐便套便携旅行酒店马桶垫 一次性','https://detail.1688.com/offer/662968557555.html?spm=a2615.7691456.autotrace-offerGeneral.4.57861647MmnxhF','A-S-0001','https://cbu01.alicdn.com/img/ibank/O1CN01rQcC8Z2EtMtm0WgFl_!!2769038802-0-cib.jpg','1','0.26',3.500,2,'1','0','2022-01-22 14:43:24'),(113,15,'加厚保暖马桶坐垫家用坐便套器垫圈绒面马桶套保暖通用式马桶垫','https://detail.1688.com/offer/653434907932.html?spm=a26352.13672862.offerlist.14.21ad1e62ZmJ8xh','E-S-0001','https://cbu01.alicdn.com/img/ibank/O1CN01qHddkm1Zm8MkpG7bb_!!1752583236-0-cib.jpg','1','6.5',3.500,2,'1','0','2022-01-22 14:46:04'),(114,15,'冬季棉绒家用马桶坐垫四季通用厕所坐便器垫圈保暖马桶垫子不冰凉','https://detail.1688.com/offer/653438047203.html?spm=a2615.7691456.autotrace-offerGeneral.7.7e622384r5FReh','E-S-0002','https://cbu01.alicdn.com/img/ibank/O1CN01IalBBP1Zm8MoujxEW_!!1752583236-0-cib.jpg','1','5.7',3.500,2,'1','0','2022-01-22 14:46:39'),(115,15,'马桶坐垫家用冬季加厚毛绒马桶垫子坐便套四季通用加绒坐便套圈垫','https://detail.1688.com/offer/652252084848.html?spm=a2615.7691456.autotrace-offerGeneral.4.7e622384r5FReh','E-S-0003','https://cbu01.alicdn.com/img/ibank/O1CN01LRhhcb1Zm8MqgzOII_!!1752583236-0-cib.jpg','1','5.2',3.200,2,'1','0','2022-01-22 14:47:12'),(116,15,'100只抽取式一次性TPE手套食品餐饮塑料薄膜家用透明加厚耐用盒装','https://detail.1688.com/offer/663175397589.html?spm=a2615.7691456.autotrace-offerGeneral.1.4e242384iSgpeS','E-T-0001','https://cbu01.alicdn.com/img/ibank/O1CN01lUqhye1Zm8OY1s92u_!!1752583236-0-cib.jpg','1','2.9',3.500,2,'1','0','2022-01-22 14:47:49'),(117,32,'雨鞋套男女鞋套防水防滑雨天脚套防雨加厚耐磨底高筒儿童硅胶雨靴','https://detail.1688.com/offer/635173317093.html?spm=a26352.13672862.offerlist.7.586a1e62ZfJhlz','AC-W-0001','https://cbu01.alicdn.com/img/ibank/O1CN01IZsQw11MoLFmxsZUc_!!2873091481-0-cib.jpg','1','9.5-14.3',2.800,2,'1','0','2022-01-22 14:48:29'),(118,32,'防雨鞋套硅胶防滑加厚耐磨男女鞋套防水鞋pvc雨靴套雨天脚套水鞋','https://detail.1688.com/offer/600239126645.html?spm=a26352.13672862.offerlist.19.586a1e62ZfJhlz','AC-W-0002','https://cbu01.alicdn.com/img/ibank/O1CN01kvJBuJ1MoLEweKxrm_!!2873091481-0-cib.jpg','1','12.53-20.78',2.800,2,'1','0','2022-01-22 14:49:05'),(119,33,'沙发垫轻奢风防滑四季通用万能沙发套罩坐垫冬季冬款全盖布垫子','https://detail.1688.com/offer/664974080643.html?spm=a2615.7691456.autotrace-offerGeneral.1.5a576c31IxuzHd','AD-X-0001','https://cbu01.alicdn.com/img/ibank/O1CN01u5iMpA1E0radGIY6s_!!2207693320290-0-cib.jpg','1','17-73',7.000,2,'1','0','2022-01-22 14:49:44'),(120,33,'羊羔绒沙发垫加厚麋鹿刺绣防滑沙发坐垫圣诞沙发套罩全包卡通批发','https://detail.1688.com/offer/663539478646.html?spm=a2615.7691456.autotrace-offerGeneral.4.5a576c31IxuzHd','AD-X-0002','https://cbu01.alicdn.com/img/ibank/O1CN0130LtDS1E0raNN3ShX_!!2207693320290-0-cib.jpg','1','16-62',7.000,2,'1','0','2022-01-22 14:50:23'),(121,33,'灯芯绒沙发垫冬款防滑沙发套罩2021新款现代简约坐垫子全盖布盖巾','https://detail.1688.com/offer/663223714063.html?spm=a2615.7691456.autotrace-offerGeneral.10.5a576c31IxuzHd','AD-X-0003','https://cbu01.alicdn.com/img/ibank/O1CN01E5ZZy51E0raOsC7Gk_!!2207693320290-0-cib.jpg','1','13.6-78',7.000,2,'1','0','2022-01-22 14:51:00'),(122,33,'沙发垫四季通用布艺防滑高档坐垫子简约现代皮沙发套罩巾田园盖布','https://detail.1688.com/offer/663161740630.html?spm=a2615.7691456.autotrace-offerGeneral.13.5a576c31IxuzHd','AD-X-0004','https://cbu01.alicdn.com/img/ibank/O1CN01Dbh8E01E0raOg4S6b_!!2207693320290-0-cib.jpg','1','12-52',7.000,2,'1','0','2022-01-22 14:51:32'),(123,33,'提花毛绒沙发垫冬款加厚防滑坐垫子盖巾纯色简约现代冬季沙发套罩','https://detail.1688.com/offer/659176047014.html?spm=a2615.7691456.autotrace-offerGeneral.37.5a576c31IxuzHd','AD-X-0005','https://cbu01.alicdn.com/img/ibank/O1CN01aqZqtS1E0rZf0UyBT_!!2207693320290-0-cib.jpg','1','15-67',7.000,2,'1','0','2022-01-22 14:52:05'),(124,33,'玉米绒弹力沙发套全包卍能套防滑沙发巾四季通用皮沙发套罩垫全盖','https://detail.1688.com/offer/656877067210.html?spm=a2615.7691456.autotrace-offerGeneral.10.15a4411aXpxwuO','AD-X-0006','https://cbu01.alicdn.com/img/ibank/O1CN01wq4SLA1E0rZFm5A5B_!!2207693320290-0-cib.jpg','1','35-73.6',5.000,2,'1','0','2022-01-22 14:52:37'),(125,33,'牛奶丝沙发套罩全包卍能套四季通用防滑沙发笠全盖布坐垫弹力垫子','https://detail.1688.com/offer/656238600360.html?spm=a2615.7691456.autotrace-offerGeneral.19.15a4411aXpxwuO','AD-X-0007','https://cbu01.alicdn.com/img/ibank/O1CN01QXVkMA1E0rZHBFmwk_!!2207693320290-0-cib.jpg','1','7-23.5',5.000,2,'1','0','2022-01-22 14:53:08'),(126,33,'羊羔绒沙发盖巾简约现代通用型防猫抓沙发套罩全包万能套防滑盖布','https://detail.1688.com/offer/664889507569.html?spm=a2615.7691456.autotrace-offerGeneral.10.7afc63284XNqpC','AD-X-0008','https://cbu01.alicdn.com/img/ibank/O1CN01ipcE0h1E0raRIs6hd_!!2207693320290-0-cib.jpg','1','35-90',7.000,2,'1','0','2022-01-22 14:53:44'),(127,33,'北欧沙发盖布ins卍能沙发巾四季通用沙发套罩全盖布垫子跨境批发','https://detail.1688.com/offer/656055512560.html?spm=a2615.7691456.autotrace-offerGeneral.19.7afc63284XNqpC','AD-X-0009','https://cbu01.alicdn.com/img/ibank/O1CN01RnRLM41E0rZISY7sV_!!2207693320290-0-cib.jpg','1','10-88',7.000,2,'1','0','2022-01-22 14:54:11'),(128,8,'创意双色洗漱杯 家用刷牙漱口杯 塑料带柄加厚水杯牙刷杯子情侣杯','https://detail.1688.com/offer/645190472035.html?spm=a2615.7691456.autotrace-offerGeneral.1.f7bd1647LWhhnu','A-AB-0001','https://cbu01.alicdn.com/img/ibank/O1CN01HT5CxA1Zc3dVwtOcH_!!2862073214-0-cib.jpg','1','2.5',3.500,2,'1','0','2022-01-22 14:56:37'),(129,8,'情侣漱口杯家用网红口杯洗漱杯创意简约ins风卫生间牙缸筒刷牙杯','https://detail.1688.com/offer/662143412108.html?spm=a2615.7691456.autotrace-offerGeneral.7.f7bd1647LWhhnu','A-AB-0002','https://cbu01.alicdn.com/img/ibank/O1CN01PbODSO2EtMtVvpSJk_!!2769038802-0-cib.jpg','1','2.21',3.500,2,'1','0','2022-01-22 14:57:15'),(130,8,'新款卡通牙刷杯家用幽灵款洗漱杯 可爱儿童牙缸情侣漱口杯 喝水杯','https://detail.1688.com/offer/654085846127.html?spm=a2615.7691456.autotrace-offerGeneral.10.f7bd1647LWhhnu','A-AB-0003','https://cbu01.alicdn.com/img/ibank/O1CN01NKhsP12EtMs8haNUz_!!2769038802-0-cib.jpg','1','1.86',3.500,2,'1','0','2022-01-22 14:57:46'),(131,8,'创意情侣双层印字漱口杯 带手柄家用简约塑料双色口杯 牙刷杯','https://detail.1688.com/offer/620171786542.html?spm=a2615.7691456.autotrace-offerGeneral.25.f7bd1647LWhhnu','A-AB-0004','https://cbu01.alicdn.com/img/ibank/2020/215/210/16667012512_992659750.jpg','1','1.5',3.500,2,'1','0','2022-01-22 14:58:19'),(132,8,'壁挂漱口杯牙刷架套装免打孔牙膏牙刷置物架多功能创意浴室收纳架','https://detail.1688.com/offer/662832151449.html?spm=a2615.7691456.autotrace-offerGeneral.40.f7bd1647LWhhnu','A-AB-0005','https://cbu01.alicdn.com/img/ibank/O1CN01oRirF82EtMtbvbcRc_!!2769038802-0-cib.jpg','1','4.74',3.500,2,'1','0','2022-01-22 14:59:00'),(133,8,'新款条纹拼色柔软亲肤澡巾 去角质搓泥搓澡巾 批发厂家洗澡巾成人','https://detail.1688.com/offer/645547531057.html?spm=a2615.7691456.autotrace-offerGeneral.1.734816471wyFy0','A-F-0001','https://cbu01.alicdn.com/img/ibank/O1CN01cVn6kY2EtMqoe6jQk_!!2769038802-0-cib.jpg','1','1.57',3.500,2,'1','0','2022-01-22 14:59:44'),(134,8,' 日式雪尼尔擦手球擦手巾可挂式加厚吸水手帕超细纤维儿童擦手毛巾','https://detail.1688.com/offer/660111485021.html?spm=a2615.7691456.autotrace-offerGeneral.4.734816471wyFy0','A-F-0002','https://cbu01.alicdn.com/img/ibank/O1CN018FozcG2EtMtE1KQIB_!!2769038802-0-cib.jpg','1','6.5-7',3.500,2,'1','0','2022-01-22 15:00:27'),(135,34,'洁丽雅纯棉毛巾简约大气舒适柔软情侣家用时尚透气吸水洗脸面巾  8条评价 30天内 10+ 条成交','https://detail.1688.com/offer/586655139493.html?spm=a26352.13672862.offerlist.24.396160bcVGTHnE&amp;cosite=-&amp;tracelog=p4p&amp;clickid=8b0e9388a92e4c2fa006e83087a8bd3c&amp;sessionid=b7de6935f677a7a7f7113a18e848bcee','AE-F-0001','https://cbu01.alicdn.com/img/ibank/O1CN01Y50c8Z28GXYp9udHg_!!960417905-0-cib.jpg','1','9.5',3.500,2,'1','0','2022-01-22 15:01:12'),(136,35,'菠萝格浴巾纯色珊瑚绒柔软吸水快干家用成人洗澡加厚可穿毛巾代发','https://detail.1688.com/offer/647640428788.html?spm=a26352.13672862.offerlist.192.62c66a92djlrj3','AF-F-0001','https://cbu01.alicdn.com/img/ibank/O1CN010k4yRq1zdayyg7OJW_!!2204224336737-0-cib.jpg','1','11.49',3.500,2,'1','0','2022-01-22 15:01:50'),(137,35,'成人大浴巾菠萝格柔软吸水可穿可裹毛巾女速干浴袍不易掉毛干发帽','https://detail.1688.com/offer/664513858525.html?spm=a2615.7691456.autotrace-offerGeneral.13.42b2318c89NtR3','AF-F-0002','https://cbu01.alicdn.com/img/ibank/O1CN01vJ991T1zdazflctCk_!!2204224336737-0-cib.jpg','1','4.5-10.8',3.500,2,'1','0','2022-01-22 15:02:30'),(138,36,'婴儿小孩浴巾 成人纤维珊瑚绒75*140cmA类瞬吸菠萝格毛裹巾批发','https://detail.1688.com/offer/603478622795.html?spm=a26352.13672862.offerlist.231.62c66a92djlrj3','AG-F-0001','https://cbu01.alicdn.com/img/ibank/2020/680/732/16537237086_1453793385.jpg','1','5.5-16.9',3.500,2,'1','0','2022-01-22 15:03:13'),(139,36,'批发logo情侣纯棉酒店家用成人儿童加厚吸水浴巾裹巾月份80*160cm  100+条评价 30天内 50+ 条成交','https://detail.1688.com/offer/614062765116.html?spm=a2615.7691456.autotrace-offerGeneral.1.635e7affYEFQDw','AG-F-0002','https://cbu01.alicdn.com/img/ibank/2020/392/033/21017330293_1453793385.jpg','1','40',3.500,2,'1','0','2022-01-22 15:03:48'),(140,8,'筷子篓置物架筷子笼家用多功能放勺子厨房沥水筷子筒收纳盒','https://detail.1688.com/offer/634425115375.html?spm=a2615.7691456.autotrace-offerGeneral.33.52be1647a7f6G9','A-P-0001','https://cbu01.alicdn.com/img/ibank/2020/791/528/23669825197_992659750.jpg','1','4.84',3.500,2,'1','0','2022-01-22 15:04:35'),(141,8,'壁挂式家用筷子笼免打孔筷筒沥水加厚厨房大容量餐具汤勺收纳盒','https://detail.1688.com/offer/631073685325.html?spm=a2615.7691456.autotrace-offerGeneral.4.29601647pym2o7','A-P-0002','https://cbu01.alicdn.com/img/ibank/2020/570/080/22501080075_992659750.jpg','1','6.15',3.500,2,'1','0','2022-01-22 15:05:09'),(142,8,'筷子篓置物架壁挂式筷子笼家用多功能放勺子刀架一体筷子筒收纳盒','https://detail.1688.com/offer/661977211515.html?spm=a2615.7691456.autotrace-offerGeneral.19.29601647pym2o7','A-P-0003','https://cbu01.alicdn.com/img/ibank/O1CN01MIxKMv2EtMtKRIQez_!!2769038802-0-cib.jpg','1','4.53',3.500,2,'1','0','2022-01-22 15:05:41'),(143,37,'多功能壁挂筷笼 家用筷勺叉沥水收纳桶 厨房免打孔分格筷子收纳盒','https://detail.1688.com/offer/658385486038.html?spm=a261y.7663282.10811813088311.5.76ba7092x945vP&amp;sk=consign','AH-P-0001','https://cbu01.alicdn.com/img/ibank/O1CN01QPM2Cz1UpjPfYYQfP_!!3043792567-0-cib.jpg','1','24',4.000,2,'1','0','2022-01-22 15:06:16'),(144,37,'北欧色家用厨房双层沥水防尘筷子笼 刀叉勺塑料收纳盒 碗筷储物盒','https://detail.1688.com/offer/662445695041.html?spm=a261y.7663282.10811813088311.5.465c7627HepTk8&amp;sk=consign','AH-P-0002','https://cbu01.alicdn.com/img/ibank/O1CN0163BnHr1UpjQCE3d8Z_!!3043792567-0-cib.jpg','1','12',4.000,2,'1','0','2022-01-22 15:06:55'),(145,38,'沙发垫固定贴固定器防滑床单无钉安全针防滑魔术贴无痕隐形固定器','https://detail.1688.com/offer/660445158706.html?spm=a26352.13672862.offerlist.322.22391e62SrH4yh','AI-Y-0001','https://cbu01.alicdn.com/img/ibank/O1CN013NiXeM1XaZ9Tzw28p_!!2212749102940-0-cib.jpg','1','4.24-16.03',2.000,2,'1','0','2022-01-22 15:07:32'),(146,39,'网红款ins四件套全棉纯棉少女心公主风春夏床上用品床裙床单被套','https://detail.1688.com/offer/652291003540.html?spm=a261y.7663282.10811813088311.5.7d1b1259qhbZri&amp;sk=consign','AJ-Q-0001','https://cbu01.alicdn.com/img/ibank/O1CN01R5J8kX2AH7KADwm1M_!!2212356558177-0-cib.jpg','1','72.5-97.5',0.000,2,'1','0','2022-01-22 15:08:26'),(147,39,'北欧风床上用品四件套床单被套春夏单人学生宿舍被子三件套水洗棉','https://detail.1688.com/offer/653194931607.html?spm=a2615.7691456.autotrace-offerGeneral.4.4f5e2aaaDfeZ23','AJ-Q-0002','https://cbu01.alicdn.com/img/ibank/O1CN01r9kLGK2AH7KR16BWp_!!2212356558177-0-cib.jpg','1','61.25-97.5',0.000,2,'1','0','2022-01-22 15:09:13'),(148,39,'可水洗真丝夏被冰丝空调被夏凉被床单三四件套夏天薄被子夏季被芯','https://detail.1688.com/offer/652293743190.html?spm=a2615.7691456.autotrace-offerGeneral.13.4f5e2aaaDfeZ23','AJ-Q-0003','https://cbu01.alicdn.com/img/ibank/O1CN01Noqlom2AH7KCujMCe_!!2212356558177-0-cib.jpg','1','78.75-123.75',0.000,2,'1','0','2022-01-22 15:10:10'),(149,39,'床上用品四件套全棉纯棉被套简约被子四季通用夏季宿舍床单三件套','https://detail.1688.com/offer/651546441518.html?spm=a2615.7691456.autotrace-offerGeneral.37.4f5e2aaaDfeZ23','AJ-Q-0004','https://cbu01.alicdn.com/img/ibank/O1CN01tnNQV72AH7KJnO9Py_!!2212356558177-0-cib.jpg','1','72.35-97.35',0.000,2,'1','0','2022-01-22 15:10:43'),(150,40,'纯棉磨毛床笠款小清新加厚床单被套四件套三件套床上用品礼品批发','https://detail.1688.com/offer/664145793837.html?spm=a26352.13672862.offerlist.138.7b371e62EpybaH','AK-Q-0001','https://cbu01.alicdn.com/img/ibank/O1CN015wEnKg23WxkLheXJV_!!2200604347264-0-cib.jpg','1','47-73',0.000,2,'1','0','2022-01-22 15:11:18'),(151,40,'春秋爆款磨毛四件套学生宿舍三件套亲肤芦荟棉床单被套床上四件套','https://detail.1688.com/offer/660364911219.html?spm=a2615.7691456.autotrace-offerGeneral.4.3d2a56edWXQiqQ','AK-Q-0002','https://cbu01.alicdn.com/img/ibank/O1CN01EtLpnr23WxjwuCiKg_!!2200604347264-0-cib.jpg','1','59.69-86.44',0.000,2,'1','0','2022-01-22 15:11:49');
/*!40000 ALTER TABLE `erp_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_goods_type`
--

DROP TABLE IF EXISTS `erp_goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_type_goodsid` (`goodsid`) USING BTREE,
  KEY `goods_type_typeid` (`typeid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_goods_type`
--

LOCK TABLES `erp_goods_type` WRITE;
/*!40000 ALTER TABLE `erp_goods_type` DISABLE KEYS */;
INSERT INTO `erp_goods_type` VALUES (9,9,13),(10,10,13),(11,1,12),(13,2,12),(14,3,12),(15,4,12),(16,5,13),(17,6,13),(18,7,13),(20,8,13),(21,11,13),(22,12,13),(23,13,13),(24,14,13),(25,15,13),(26,16,13),(27,17,13),(28,18,13),(29,19,42),(30,20,13),(31,21,13),(32,22,13),(33,23,13),(34,24,13),(35,25,13),(36,26,13),(37,27,13),(38,28,13),(39,29,13),(43,30,14),(44,31,14),(45,32,14),(46,33,15),(47,34,15),(48,35,15),(49,36,15),(50,37,15),(51,38,15),(52,39,15),(53,40,16),(54,41,16),(55,42,17),(56,43,17),(57,44,17),(58,45,18),(59,46,19),(60,47,19),(61,48,19),(62,49,19),(63,50,19),(64,51,20),(65,52,20),(66,53,20),(67,54,20),(68,55,20),(69,56,20),(70,57,20),(71,58,21),(72,59,21),(73,60,22),(74,61,22),(75,62,22),(76,63,23),(77,64,23),(78,65,23),(79,66,23),(80,67,23),(81,68,23),(82,69,23),(83,70,24),(84,71,24),(85,72,24),(86,73,24),(87,74,24),(88,75,25),(89,76,25),(90,77,25),(91,78,25),(92,79,25),(93,80,25),(94,81,25),(95,82,26),(96,83,26),(98,84,26),(99,85,26),(100,86,26),(101,87,26),(102,88,27),(103,89,28),(104,90,28),(105,91,28),(106,92,29),(107,93,29),(108,94,29),(109,95,29),(110,96,29),(111,97,29),(112,98,29),(113,99,29),(114,100,29),(115,101,29),(116,102,29),(117,103,29),(118,104,29),(119,105,29),(120,106,29),(121,107,29),(122,108,29),(123,109,29),(124,110,30),(125,111,30),(126,112,31),(127,113,31),(128,114,31),(129,115,31),(130,116,32),(131,117,33),(132,118,33),(133,119,34),(134,120,34),(135,121,34),(136,122,34),(137,123,34),(138,124,34),(139,125,34),(140,126,34),(141,127,34),(142,128,35),(143,129,35),(144,130,35),(145,131,35),(146,132,35),(147,133,36),(148,134,36),(149,135,36),(150,136,36),(151,137,36),(152,138,36),(153,139,36),(154,140,37),(155,141,37),(156,142,37),(157,143,37),(158,144,37),(159,145,38),(160,146,39),(161,147,39),(162,148,39),(163,149,39),(164,150,39),(165,151,39);
/*!40000 ALTER TABLE `erp_goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_shop`
--

DROP TABLE IF EXISTS `erp_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_shop`
--

LOCK TABLES `erp_shop` WRITE;
/*!40000 ALTER TABLE `erp_shop` DISABLE KEYS */;
INSERT INTO `erp_shop` VALUES (4,'泽木家居超级工厂','C','https://shop1489424685141.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:20:34'),(6,'鸿尘实力工厂','H','https://ywhc1688.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:22:22'),(7,'仁和宝超级工厂','I','https://renhebao.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:22:49'),(8,'义乌欧图欧日用百货超级工厂','A','https://shop1452186312341.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:23:27'),(9,'义乌俊曼超级工厂','J','https://junmanbaihuo.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:24:01'),(10,'润利电子实力工厂','K','https://51816881688.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:24:24'),(11,'优漾家居用品实力供应商','F','https://yiwuyouyang.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:24:53'),(12,'SAFEBET/萨夫百德实力专营店','L','https://baifa002.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:25:59'),(13,'义乌市言露日用百货有限公司','M','https://shop3562eu1288c63.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:26:27'),(14,'荣灵百货超级工厂','D','https://xiaoxiaoqin1688.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:27:36'),(15,'本策日用品超级工厂','E','https://bence8.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:28:05'),(16,'科耐清洁用品超级工厂','N','https://shop9782o4e445463.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:29:17'),(17,'超级工厂','O','https://zjkdkj.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:30:10'),(18,'光顺日用品超级工厂','P','https://6666gs.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:32:23'),(19,'双童日用品超级工厂','Q','https://shuangtong1.1688.com/?spm=a2615.2177701.autotrace-topNav.1.15c845bfNFgeRO',NULL,'浙江-金华','1','2022-01-19 19:33:24'),(20,'轩圆阁纺织超级工厂','R','https://shop1468083559700.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:35:04'),(21,'杏雨家居超级工厂','S','https://20171012.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:35:32'),(22,'绍兴六航纺织超级工厂','G','https://shop1468083507092.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:36:07'),(23,'柯桥畔雅纺织品超级工厂','T','https://shop888panya.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:37:20'),(24,'雷盛日用品超级工厂','U','https://shop2643802712238.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:37:54'),(25,'上海斡璇装饰材料有限公司','V','https://shop1464800170707.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:39:13'),(26,'义乌市浴宝日用品厂','W','https://shop72h39643z9r48.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:51:59'),(27,'吉吉猴家纺超级工厂','X','https://jijihou.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:52:27'),(28,'优丰禄家纺超级工厂','Y','https://shop5cr9981228r17.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:53:03'),(29,'夏浪家居源头厂家','Z','https://xlhome.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:53:36'),(30,'超级工厂2','AA','https://shop5h11885863943.1688.com/',NULL,'浙江-金华','1','2022-01-19 19:55:05'),(31,'义乌市缕浪日用品实力供应商','AB','https://shop1443630410651.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:04:04'),(32,'金华市春东塑胶实力工厂','AC','https://jhcdsj.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:07:10'),(33,'超级工厂3','AD','https://shop9159q1ko43462.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:08:41'),(34,'舒氏百货实力供应商','AE','https://qzslbh.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:10:01'),(35,'义乌市绘新日用百货实力供应商','AF','https://shop8a610247z7129.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:10:47'),(36,'义乌市西果家居用品有限公司','AG','https://shop7702oi319o501.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:11:23'),(37,'黄岩超庆超级工厂','AH','https://hycqsl.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:12:11'),(38,'广州瑶纯商贸商行','AI','https://shop1633848zh6184.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:13:19'),(39,'新余市定胜商贸有限公司','AJ','https://shop774824943hl43.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:13:51'),(40,'东阳福祉纺织有限公司实力供应商','AK','https://shop30w5346466454.1688.com/',NULL,'浙江-金华','1','2022-01-20 11:14:19');
/*!40000 ALTER TABLE `erp_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_shop_type`
--

DROP TABLE IF EXISTS `erp_shop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_shop_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shoptype_shopid` (`shopid`) USING BTREE,
  KEY `shoptype_typeid` (`typeid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_shop_type`
--

LOCK TABLES `erp_shop_type` WRITE;
/*!40000 ALTER TABLE `erp_shop_type` DISABLE KEYS */;
INSERT INTO `erp_shop_type` VALUES (263,4,12),(264,4,13),(265,4,17),(266,4,19),(267,4,20),(268,14,15),(269,14,21),(270,14,23),(271,14,26),(272,15,15),(273,15,31),(274,15,32),(275,11,13),(276,11,23),(277,22,24),(278,22,26),(279,6,13),(280,7,13),(282,10,13),(283,12,14),(284,13,14),(285,16,16),(286,17,18),(287,18,21),(288,19,22),(289,20,24),(290,21,24),(291,23,26),(292,24,26),(293,25,28),(294,26,29),(295,27,29),(296,28,29),(297,29,29),(298,30,29),(299,31,30),(300,32,33),(301,33,34),(302,34,36),(303,35,36),(304,36,36),(305,37,37),(306,38,38),(307,39,39),(308,40,39),(358,8,13),(359,8,15),(360,8,16),(361,8,17),(362,8,19),(363,8,20),(364,8,23),(365,8,24),(366,8,25),(367,8,27),(368,8,28),(369,8,29),(370,8,30),(371,8,35),(372,8,36),(373,8,37),(374,8,42),(375,8,31),(378,9,13);
/*!40000 ALTER TABLE `erp_shop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_type`
--

DROP TABLE IF EXISTS `erp_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_type`
--

LOCK TABLES `erp_type` WRITE;
/*!40000 ALTER TABLE `erp_type` DISABLE KEYS */;
INSERT INTO `erp_type` VALUES (12,'隔热垫','R','1'),(13,'收纳储物','A','1'),(14,'衣架','G','1'),(15,'挂钩','C','1'),(16,'懒人抹布','H','1'),(17,'粘毛器粘毛纸','L','1'),(18,'捣蒜器','U','1'),(19,'购物袋/垃圾袋','I','1'),(20,'纸巾盒','J','1'),(21,'吸油纸','M','1'),(22,'吸管','V','1'),(23,'脏衣篓','K','1'),(24,'餐桌布','E','1'),(25,'围裙','Z','1'),(26,'桌脚（角）垫','D','1'),(27,'烟灰缸','AA','1'),(28,'厨房墙纸','N','1'),(29,'地毯/地垫','B','1'),(30,'食品密封夹','O','1'),(31,'马桶垫','S','1'),(32,'手套','T','1'),(33,'雨鞋套','W','1'),(34,'沙发布','X','1'),(35,'漱口杯','AB','1'),(36,'毛巾/浴巾','F','1'),(37,'筷子筒','P','1'),(38,'床单固定神器','Y','1'),(39,'床单四件套','Q','1'),(40,'挂布','AC','1'),(41,'家居摆件','AD','1'),(42,'置物架','AE','1'),(43,'浴帘','AF','1');
/*!40000 ALTER TABLE `erp_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler','cloud-qzm4x0-ha2h.novalocal1642840166782',1642905528265,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job`
--

DROP TABLE IF EXISTS `schedule_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job`
--

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job_log`
--

DROP TABLE IF EXISTS `schedule_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job_log`
--

LOCK TABLES `schedule_job_log` WRITE;
/*!40000 ALTER TABLE `schedule_job_log` DISABLE KEYS */;
INSERT INTO `schedule_job_log` VALUES (1,1,'testTask','renren',0,NULL,0,'2022-01-18 11:00:00'),(2,1,'testTask','renren',0,NULL,0,'2022-01-18 11:30:00'),(3,1,'testTask','renren',0,NULL,1,'2022-01-18 14:00:00'),(4,1,'testTask','renren',0,NULL,0,'2022-01-18 14:30:00'),(5,1,'testTask','renren',0,NULL,1,'2022-01-18 15:00:00'),(6,1,'testTask','renren',0,NULL,1,'2022-01-18 15:30:00'),(7,1,'testTask','renren',0,NULL,1,'2022-01-18 16:00:00'),(8,1,'testTask','renren',0,NULL,0,'2022-01-18 16:30:00'),(9,1,'testTask','renren',0,NULL,0,'2022-01-18 18:30:00'),(10,1,'testTask','renren',0,NULL,1,'2022-01-18 19:00:00'),(11,1,'testTask','renren',0,NULL,0,'2022-01-18 19:30:00'),(12,1,'testTask','renren',0,NULL,1,'2022-01-19 10:30:00'),(13,1,'testTask','renren',0,NULL,0,'2022-01-19 11:00:00'),(14,1,'testTask','renren',0,NULL,1,'2022-01-19 11:30:00'),(15,1,'testTask','renren',0,NULL,0,'2022-01-19 13:30:00'),(16,1,'testTask','renren',0,NULL,0,'2022-01-19 14:00:00'),(17,1,'testTask','renren',0,NULL,0,'2022-01-19 14:30:00'),(18,1,'testTask','renren',0,NULL,1,'2022-01-19 15:00:00'),(19,1,'testTask','renren',0,NULL,1,'2022-01-19 15:30:00'),(20,1,'testTask','renren',0,NULL,1,'2022-01-19 16:00:00'),(21,1,'testTask','renren',0,NULL,0,'2022-01-19 18:30:00'),(22,1,'testTask','renren',0,NULL,1,'2022-01-19 19:00:00'),(23,1,'testTask','renren',0,NULL,0,'2022-01-19 19:30:00'),(24,1,'testTask','renren',0,NULL,1,'2022-01-20 13:30:00'),(25,1,'testTask','renren',0,NULL,2,'2022-01-20 14:00:00'),(26,1,'testTask','renren',0,NULL,1,'2022-01-20 16:30:00'),(27,1,'testTask','renren',0,NULL,2,'2022-01-20 17:00:00'),(28,1,'testTask','renren',0,NULL,0,'2022-01-20 17:30:00'),(29,1,'testTask','renren',0,NULL,2,'2022-01-20 18:00:00'),(30,1,'testTask','renren',0,NULL,1,'2022-01-20 18:30:00'),(31,1,'testTask','renren',0,NULL,0,'2022-01-20 19:00:00'),(32,1,'testTask','renren',0,NULL,1,'2022-01-20 19:30:00');
/*!40000 ALTER TABLE `schedule_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'人人开源集团',0,0),(2,1,'长沙分公司',1,0),(3,1,'上海分公司',2,0),(4,3,'技术部',0,0),(5,3,'销售部',1,0);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'性别','sex','0','女',0,NULL,0),(2,'性别','sex','1','男',1,NULL,0),(3,'性别','sex','2','未知',3,NULL,0);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,'admin','保存菜单','io.erp.modules.sys.controller.SysMenuController.save()','{\"menuId\":66,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"ERP管理\",\"type\":0,\"icon\":\"fa-shopping-cart\",\"orderNum\":1}',13,'0:0:0:0:0:0:0:1','2022-01-18 10:43:17'),(2,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":41,\"parentId\":66,\"parentName\":\"ERP管理\",\"name\":\"商品管理\",\"url\":\"modules/erp/erpgoods.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}',13,'0:0:0:0:0:0:0:1','2022-01-18 10:43:33'),(3,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":51,\"parentId\":66,\"parentName\":\"ERP管理\",\"name\":\"店铺管理\",\"url\":\"modules/erp/erpshop.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}',9,'0:0:0:0:0:0:0:1','2022-01-18 10:43:42'),(4,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":61,\"parentId\":66,\"parentName\":\"ERP管理\",\"name\":\"商品类型\",\"url\":\"modules/erp/erptype.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}',10,'0:0:0:0:0:0:0:1','2022-01-18 10:43:57'),(5,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":66,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"ERP管理\",\"type\":0,\"icon\":\"fa shopping-cart\",\"orderNum\":1}',8,'0:0:0:0:0:0:0:1','2022-01-18 10:44:19'),(6,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":66,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"ERP管理\",\"type\":0,\"icon\":\"fa fa-shopping-cart\",\"orderNum\":1}',6,'0:0:0:0:0:0:0:1','2022-01-18 10:44:31'),(7,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":41,\"parentId\":66,\"parentName\":\"ERP管理\",\"name\":\"商品管理\",\"url\":\"modules/erp/erpgoods.html\",\"type\":1,\"icon\":\"fa fa-shopping-cart\",\"orderNum\":6}',10,'0:0:0:0:0:0:0:1','2022-01-18 10:46:54'),(8,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":51,\"parentId\":66,\"parentName\":\"ERP管理\",\"name\":\"店铺管理\",\"url\":\"modules/erp/erpshop.html\",\"type\":1,\"icon\":\"fa fa-shopping-cart\",\"orderNum\":6}',9,'0:0:0:0:0:0:0:1','2022-01-18 10:47:01'),(9,'admin','修改菜单','io.erp.modules.sys.controller.SysMenuController.update()','{\"menuId\":61,\"parentId\":66,\"parentName\":\"ERP管理\",\"name\":\"商品类型\",\"url\":\"modules/erp/erptype.html\",\"type\":1,\"icon\":\"fa fa-shopping-cart\",\"orderNum\":6}',11,'0:0:0:0:0:0:0:1','2022-01-18 10:47:08'),(10,'admin','删除定时任务','io.erp.modules.job.controller.ScheduleJobController.delete()','[1]',53,'192.168.3.168','2022-01-20 19:44:48'),(11,'admin','修改密码','io.erp.modules.sys.controller.SysUserController.password()','\"admin\"',59,'27.110.216.90','2022-01-22 16:30:16');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理',NULL,NULL,0,'fa fa-cog',0),(2,1,'管理员管理','modules/sys/user.html',NULL,1,'fa fa-user',1),(3,1,'角色管理','modules/sys/role.html',NULL,1,'fa fa-user-secret',2),(4,1,'菜单管理','modules/sys/menu.html',NULL,1,'fa fa-th-list',3),(5,1,'SQL监控','druid/sql.html',NULL,1,'fa fa-bug',4),(6,1,'定时任务','modules/job/schedule.html',NULL,1,'fa fa-tasks',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:perms',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:perms',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','modules/sys/config.html','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'fa fa-sun-o',6),(29,1,'系统日志','modules/sys/log.html','sys:log:list',1,'fa fa-file-text-o',7),(30,1,'文件上传','modules/oss/oss.html','sys:oss:all',1,'fa fa-file-image-o',6),(31,1,'部门管理','modules/sys/dept.html',NULL,1,'fa fa-file-code-o',1),(32,31,'查看',NULL,'sys:dept:list,sys:dept:info',2,NULL,0),(33,31,'新增',NULL,'sys:dept:save,sys:dept:select',2,NULL,0),(34,31,'修改',NULL,'sys:dept:update,sys:dept:select',2,NULL,0),(35,31,'删除',NULL,'sys:dept:delete',2,NULL,0),(36,1,'字典管理','modules/sys/dict.html',NULL,1,'fa fa-bookmark-o',6),(37,36,'查看',NULL,'sys:dict:list,sys:dict:info',2,NULL,6),(38,36,'新增',NULL,'sys:dict:save',2,NULL,6),(39,36,'修改',NULL,'sys:dict:update',2,NULL,6),(40,36,'删除',NULL,'sys:dict:delete',2,NULL,6),(41,66,'商品管理','modules/erp/erpgoods.html',NULL,1,'fa fa-shopping-cart',6),(42,41,'查看',NULL,'erp:erpgoods:list,erp:erpgoods:info',2,NULL,6),(43,41,'新增',NULL,'erp:erpgoods:save',2,NULL,6),(44,41,'修改',NULL,'erp:erpgoods:update',2,NULL,6),(45,41,'删除',NULL,'erp:erpgoods:delete',2,NULL,6),(51,66,'店铺管理','modules/erp/erpshop.html',NULL,1,'fa fa-shopping-cart',6),(52,51,'查看',NULL,'erp:erpshop:list,erp:erpshop:info',2,NULL,6),(53,51,'新增',NULL,'erp:erpshop:save',2,NULL,6),(54,51,'修改',NULL,'erp:erpshop:update',2,NULL,6),(55,51,'删除',NULL,'erp:erpshop:delete',2,NULL,6),(61,66,'商品类型','modules/erp/erptype.html',NULL,1,'fa fa-shopping-cart',6),(62,61,'查看',NULL,'erp:erptype:list,erp:erptype:info',2,NULL,6),(63,61,'新增',NULL,'erp:erptype:save',2,NULL,6),(64,61,'修改',NULL,'erp:erptype:update',2,NULL,6),(65,61,'删除',NULL,'erp:erptype:delete',2,NULL,6),(66,0,'ERP管理',NULL,NULL,0,'fa fa-shopping-cart',1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色与部门对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','2f237d9f934ecc2c9200a46ea3c6ba921f09a65128cbebf728793a4d92d31884','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-23 10:39:37

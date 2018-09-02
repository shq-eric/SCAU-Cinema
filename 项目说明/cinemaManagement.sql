drop database cinemaManagement;

create database cinemaManagement;

use cinemaManagement;


#影院信息
CREATE TABLE `cinema` (
  `CinemaId` int(11) NOT NULL AUTO_INCREMENT,
  `CinemaName` varchar(100) NOT NULL,
  `CinemaTel` varchar(20) NOT NULL,
  `CinemaAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`CinemaId`)
);
alter table `cinema` convert to character set utf8;

#电影信息
CREATE TABLE `movie` (
  `MovieId` int(11) NOT NULL AUTO_INCREMENT,
  `MovieName` varchar(100) NOT NULL,
  `MovieMainActor` varchar(100) DEFAULT NULL,
  `MovieDirector` varchar(100) DEFAULT NULL,
  `MovieDuration` varchar(20) DEFAULT NULL COMMENT '电影长度',
  `MovieStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MovieId`)
);
alter table `movie` convert to character set utf8;


#电影时间表
CREATE TABLE `schedule` (
  `ScheduleId` int(11) NOT NULL AUTO_INCREMENT,
  `SchedulePrice` double NOT NULL,
  `ScheduleBegin` date NOT NULL,
  `ScheduleEnd` date NOT NULL,
  `BeginTime`   time NOT NULL,
  `EndTime`   time NOT NULL,
  `MovieId` int(11) NOT NULL,
  `MovieName` varchar(255) NOT NULL,
  `HallId` int(11) NOT NULL,
  PRIMARY KEY (`ScheduleId`)
);
alter table `schedule` convert to character set utf8;


#电影播放厅
CREATE TABLE `hall` (
  `HallId` int(11) NOT NULL AUTO_INCREMENT,
  `HallName` varchar(100) NOT NULL,
  `HallSeats` varchar(3) DEFAULT NULL,
  `HallType` varchar(20) DEFAULT NULL,
  `HallDescription` varchar(100) DEFAULT NULL,
  `CinemaId` int(11) NOT NULL,
  PRIMARY KEY (`HallId`)
);
alter table `hall` convert to character set utf8;


#电影票
CREATE TABLE `ticket` (
  `TicketId` int(11) NOT NULL AUTO_INCREMENT,
  `MovieId` int(11) NOT NULL,
  `CustomId` int(11) NOT NULL,
  `MovieName` varchar(100) NOT NULL,
  `ScheduleId` int(11) NOT NULL,
  `CinemaAddress` varchar(100) NOT NULL,
  `HallId` int(11) NOT NULL,
  `TicketSeat` varchar(20) NOT NULL,
  `ScheduleBegin` date NOT NULL,
  `BeginTime` time NOT NULL,
   `SchedulePrice` double NOT NULL,
  PRIMARY KEY (`TicketId`)
);
alter table `ticket` convert to character set utf8;


#座位
CREATE TABLE `seat` (
  `SeatId` int(11) NOT NULL AUTO_INCREMENT,
  `SeatPosition` varchar(20) NOT NULL,
  `SeatIsActive` int(11) NOT NULL,
  `HallId` int(11) NOT NULL,
  PRIMARY KEY (`SeatId`)
);
alter table `seat` convert to character set utf8;


#客户
CREATE TABLE `customer` (
  `CustomId` int(11) NOT NULL AUTO_INCREMENT,
  `CustomUsername` varchar(20) NOT NULL,
  `CustomPassword` varchar(20) NOT NULL,
  `CustomTel` varchar(20) NOT NULL,
  PRIMARY KEY (`CustomId`)
);
alter table `customer` convert to character set utf8;


#电影订单
CREATE TABLE `movieOrder` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderPlatform` varchar(255) DEFAULT NULL,
  `TicketNum` int(11) NOT NULL,
  `OrderPrice` double NOT NULL,
  `OrderDate` date NOT NULL,
  `Orderstatus` varchar(255) DEFAULT NULL,
  `OrderCustomerId` int(11) NOT NULL,
  `OrderCustomerName` varchar(255) NOT NULL,
  `OrderCustomerTel` varchar(255) NOT NULL,
  PRIMARY KEY (`OrderId`)
);
alter table `movieOrder` convert to character set utf8;



#退订单
CREATE TABLE `refundOrder` (
  `RefundOrderId` int(11) NOT NULL,
  `RefundOrderReason` varchar(255) NOT NULL,
  `TicketNum` int(11) NOT NULL,
  `RefundOrderPrice` double NOT NULL,
  `RefundOrderStatus` varchar(20) DEFAULT NULL,
  `RefundOrderCustomerId` int(11) NOT NULL,
  `RefundOrderCustomerName` varchar(255) NOT NULL,
  `RefundOrderCustomerTel` varchar(255) NOT NULL,
  PRIMARY KEY (`RefundOrderId`)
);
alter table `refundOrder` convert to character set utf8;

#管理员
CREATE TABLE `administrator` (
  `AdministratorId` int(11) NOT NULL AUTO_INCREMENT,
  `AdministratorName` varchar(100) NOT NULL,
  `AdminstratorPassword` varchar(20) NOT NULL,
  `AdministratorPhone` varchar(20) NOT NULL,
  `AdministratorEmail` varchar(100) DEFAULT NULL,
  `AdministratorLevel` varchar(20) NOT NULL,
  `CinemaId` int(11) NOT NULL,
  PRIMARY KEY (`AdministratorId`)
);
alter table `administrator` convert to character set utf8;

#插入语句
#cinema
INSERT INTO cinema VALUES(1,'SCAU_CINEMA','1360280xxxx','SCAU');

#hall
INSERT INTO hall(HallName,HallType,HallSeats,CinemaId) VALUES('huashan','原版3D','200',1);
INSERT INTO hall(HallName,HallType,HallSeats,CinemaId) VALUES('wushan','原版2D','204',1);
INSERT INTO hall(HallName,HallType,HallSeats,CinemaId) VALUES('qilin','盗版9D','204',1);
INSERT INTO hall(HallName,HallSeats,CinemaId) VALUES('yanshan','30',1);

#movie
#alter table `movie` convert to character set utf8;  #--> 修改一张表的所有字段的编码格式

INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("美国队长","克里斯·埃文斯、小罗伯特·唐尼...","安东尼·罗素、乔·罗素","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("蜘蛛侠","托比·马奎尔、克尔斯滕·邓斯特...","山姆·雷米","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("绿巨人","托比·马奎尔、克尔斯滕·邓斯特...","山姆·雷米","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("美国队长3","克里斯·埃文斯、小罗伯特·唐尼...","安东尼·罗素、乔·罗素","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("钢铁侠3","小罗伯特·唐尼、格温妮斯·帕特洛...","沙恩·布莱克","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("金刚狼3","克里斯·埃文斯、小罗伯特·唐尼...","詹姆斯·曼高德","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("蜘蛛侠3","托比·马奎尔、克尔斯滕·邓斯特...","山姆·雷米","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("X战警","詹姆斯·麦卡沃伊、迈克尔·法斯宾德...","布莱恩·辛格","120","上映中");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("狄仁杰之四大天王","赵又廷，冯绍峰，林更新，阮经天，马思纯，刘嘉玲","闫非、彭大魔","120","即将上映");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("西红柿首富","肾疼、宋芸桦...","闫非、彭大魔","120","即将上映");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("邪不压正","彭于晏、廖凡...","姜文","120","即将上映");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("Magical Circus:Animal Crackers","艾米莉·布朗特，约翰·卡拉辛斯基，伊恩·麦克莱恩 ，西尔维斯特·史泰龙，丹尼·德维托","安东尼·罗素、乔·罗素","120","即将上映");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("Jurassic World Fallen Kingdom","克里斯·帕拉特，布莱丝·达拉斯·霍华德","安东尼·罗素","120","即将上映");								
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("Show Dogs","威尔·阿奈特 / 卢达克里斯 / 斯坦利·图齐 / 娜塔莎·雷昂/ 艾伦·卡明 / 加布里埃尔·伊格莱西亚斯","安东尼·罗素","120","即将上映");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("I Love Catman","吴世勋，吴倩，宋威龙，李昕亮","安东尼·罗素","120","即将上映");
INSERT INTO movie(MovieName,MovieMainActor,MovieDirector,MovieDuration,MovieStatus) VALUES("Sicario 2:Soldado","乔什·布洛林，本尼西奥·德尔·托罗","安东尼·罗素","120","即将上映");


#adminstractor
INSERT INTO administrator VALUES(1,'root','root','1360***5844','','1',1);
INSERT INTO administrator VALUES(2,'shq','shq','1360***5844','','0',1);
INSERT INTO administrator VALUES(3,'lyf','lyf','1360***5190','','0',1);


#schedule
#alter table `schedule` convert to character set utf8;
INSERT INTO schedule VALUES(1,20,'2018-08-09','2018-08-09','11:00:00','13:00:00',1,"美国队长",1);
INSERT INTO schedule VALUES(2,30,'2018-08-09','2018-08-09','14:00:00','16:00:00',2,"蜘蛛侠",1);
INSERT INTO schedule VALUES(3,30,'2018-08-09','2018-08-09','17:00:00','19:00:00',5,"钢铁侠3",1);
INSERT INTO schedule VALUES(4,40,'2018-08-09','2018-08-09','20:00:00','22:00:00',8,"X战警",1);
INSERT INTO schedule VALUES(5,20,'2018-08-09','2018-08-09','11:00:00','13:00:00',1,"美国队长",2);
INSERT INTO schedule VALUES(6,30,'2018-08-09','2018-08-09','14:00:00','16:00:00',3,"绿巨人",2);
INSERT INTO schedule VALUES(7,30,'2018-08-09','2018-08-09','17:00:00','19:00:00',6,"金刚狼3",2);
INSERT INTO schedule VALUES(8,40,'2018-08-09','2018-08-09','20:00:00','22:00:00',7,"蜘蛛侠3",2);
INSERT INTO schedule VALUES(9,20,'2018-08-09','2018-08-09','11:00:00','13:00:00',1,"美国队长",3);
INSERT INTO schedule VALUES(10,30,'2018-08-09','2018-08-09','14:00:00','16:00:00',4,"美国队长3",3);
INSERT INTO schedule VALUES(11,30,'2018-08-09','2018-08-09','17:00:00','19:00:00',6,"金刚狼3",3);
INSERT INTO schedule VALUES(12,40,'2018-08-09','2018-08-09','20:00:00','22:00:00',7,"蜘蛛侠3",3);

INSERT INTO schedule VALUES(1,20,'2018-08-10','2018-08-10','11:00:00','13:00:00',1,"美国队长",4);
INSERT INTO schedule VALUES(2,30,'2018-08-10','2018-08-10','14:00:00','16:00:00',2,"蜘蛛侠",1);
INSERT INTO schedule VALUES(3,30,'2018-08-10','2018-08-10','17:00:00','19:00:00',5,"钢铁侠3",1);
INSERT INTO schedule VALUES(4,40,'2018-08-10','2018-08-10','20:00:00','22:00:00',8,"X战警",1);
INSERT INTO schedule VALUES(5,20,'2018-08-10','2018-08-10','11:00:00','13:00:00',1,"美国队长",2);
INSERT INTO schedule VALUES(6,30,'2018-08-10','2018-08-10','14:00:00','16:00:00',3,"绿巨人",2);
INSERT INTO schedule VALUES(7,30,'2018-08-10','2018-08-10','17:00:00','19:00:00',6,"金刚狼3",2);
INSERT INTO schedule VALUES(8,40,'2018-08-10','2018-08-10','20:00:00','22:00:00',7,"蜘蛛侠3",2);
INSERT INTO schedule VALUES(9,20,'2018-08-10','2018-08-10','11:00:00','13:00:00',1,"美国队长",3);
INSERT INTO schedule VALUES(10,30,'2018-08-10','2018-08-10','14:00:00','16:00:00',4,"美国队长3",3);
INSERT INTO schedule VALUES(11,30,'2018-08-10','2018-08-10','17:00:00','19:00:00',6,"金刚狼3",3);
INSERT INTO schedule VALUES(12,40,'2018-08-10','2018-08-10','20:00:00','22:00:00',7,"蜘蛛侠3",3);


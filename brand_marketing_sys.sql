/*
Navicat MySQL Data Transfer

Source Server         : zgl
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : shangbiao18

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-03-28 14:30:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aboutus
-- ----------------------------
DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aboutus
-- ----------------------------

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(300) DEFAULT NULL,
  `qu` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `isMoren` int(11) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `tel` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `thistime` varchar(100) DEFAULT NULL,
  `lasttime` varchar(100) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `qianming` varchar(500) DEFAULT NULL,
  `quanxian` varchar(300) DEFAULT NULL,
  `zhengimg` varchar(500) DEFAULT NULL,
  `fanimg` varchar(500) DEFAULT NULL,
  `allimg` varchar(500) DEFAULT NULL,
  `nickname` varchar(500) DEFAULT NULL,
  `rname` varchar(50) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `appid` varchar(100) DEFAULT NULL,
  `phone1` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '2018-03-28 13:37:48', '2018-03-26 18:06:45', '577', '1', 'upload/2018/03/22/093215404756.png', 'admin', 'supermen', null, null, null, null, 'admin', null, null, null, null, '14708068659', null, '18111245368');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `time` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `teamid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for award
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fenxiao` int(11) DEFAULT NULL,
  `minmoney` int(11) DEFAULT NULL,
  `discount1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES ('1', '0', '300', '300');

-- ----------------------------
-- Table structure for backtalk
-- ----------------------------
DROP TABLE IF EXISTS `backtalk`;
CREATE TABLE `backtalk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forumid` int(11) DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL,
  `talkid` int(11) DEFAULT NULL,
  `content` text,
  `time` varchar(50) DEFAULT NULL,
  `showtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backtalk
-- ----------------------------

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `img` varchar(300) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `hdMoney` double(11,2) DEFAULT NULL,
  `hdcontent` text,
  `hdtitle` varchar(300) DEFAULT NULL,
  `hdtime` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamId` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `allprice` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `allpoint` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `yunfei` int(11) DEFAULT NULL,
  `xuanze` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for classify2
-- ----------------------------
DROP TABLE IF EXISTS `classify2`;
CREATE TABLE `classify2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `img` varchar(300) DEFAULT NULL,
  `img2` varchar(300) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classify2
-- ----------------------------
INSERT INTO `classify2` VALUES ('1', '专业课程', '1', 'upload/2017/11/20/15082529901.png', 'upload/2017/11/13/172653380兑换商城.png', '0');
INSERT INTO `classify2` VALUES ('2', '学习会馆', '2', 'upload/2017/11/20/15083075102.png', 'upload/2017/11/13/172709717新闻资讯.png', '0');
INSERT INTO `classify2` VALUES ('3', '能力训练营', '3', 'upload/2017/11/20/15090804503.png', '1', '0');
INSERT INTO `classify2` VALUES ('4', '促销课程', '4', 'upload/2017/11/20/15092535704.png', '1', '0');

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of code
-- ----------------------------

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `teamid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) DEFAULT NULL,
  `contentid` int(11) DEFAULT NULL,
  `teamid` int(11) DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  `coursename` varchar(100) DEFAULT NULL,
  `contentname` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  `huifu` text,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！111这是一条评论信息！	这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！111这是一条评论信息！这是一条评论信息！1这是一条评论信息！1', '43421341341341342341222222222222222222222222222222222222222222222222222222222222222222222222', '2017-11-18');
INSERT INTO `comment` VALUES ('2', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！2', null, '2017-11-18');
INSERT INTO `comment` VALUES ('3', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！3', null, '2017-11-18');
INSERT INTO `comment` VALUES ('4', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！4', null, '2017-11-18');
INSERT INTO `comment` VALUES ('5', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！5', null, '2017-11-18');
INSERT INTO `comment` VALUES ('6', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！6', null, '2017-11-18');
INSERT INTO `comment` VALUES ('7', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！7', '122121122112', '2017-11-18');
INSERT INTO `comment` VALUES ('8', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！8', null, '2017-11-18');
INSERT INTO `comment` VALUES ('9', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！9', '额大额定期为', '2017-11-18');
INSERT INTO `comment` VALUES ('10', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！111这是一条评论信息！	这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！111这是一条评论信息！这是一条评论信息！1这是一条评论信息！1', '这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！111这是一条评论信息！	这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！1这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！这是一条评论信息！111这是一条评论信息！这是一条评论信息！1这是一条评论信息！1', '2017-11-18');
INSERT INTO `comment` VALUES ('11', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！11', '213231213123', '2017-11-18');
INSERT INTO `comment` VALUES ('12', '105', '12', '1003', '5', '课程标题2', '1', '注册用户', '这是一条评论信息！这是一条评论信息！这是一条评论信息！12', '1221', '2017-11-18');
INSERT INTO `comment` VALUES ('16', '105', '12', '1', '5', '课程标题2', '第一章     巧言令色', '注册用户', '122121', null, '2017-11-23');
INSERT INTO `comment` VALUES ('17', '105', '13', '1', '5', '课程标题2', '第二章     察言观色', '注册用户', '哈哈哈', '122112', '2017-11-27');

-- ----------------------------
-- Table structure for commonbutton
-- ----------------------------
DROP TABLE IF EXISTS `commonbutton`;
CREATE TABLE `commonbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type0` varchar(100) DEFAULT NULL,
  `key0` varchar(100) DEFAULT NULL,
  `url0` varchar(300) DEFAULT NULL,
  `complexButtonId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commonbutton
-- ----------------------------

-- ----------------------------
-- Table structure for complexbutton
-- ----------------------------
DROP TABLE IF EXISTS `complexbutton`;
CREATE TABLE `complexbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type0` varchar(100) DEFAULT NULL,
  `key0` varchar(100) DEFAULT NULL,
  `url0` varchar(300) DEFAULT NULL,
  `classify` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of complexbutton
-- ----------------------------
INSERT INTO `complexbutton` VALUES ('2', 'view', null, '121212', '1', '1221');
INSERT INTO `complexbutton` VALUES ('3', 'view', null, '212121', '1', '1221');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content1` text,
  `istest` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('12', '105', '第一章     巧言令色', 'upload/2017/11/15/173415446ces.mp4', '1', '1');
INSERT INTO `content` VALUES ('13', '105', '第二章     察言观色', 'upload/2017/11/15/173949540ces.mp4', '1', '2');
INSERT INTO `content` VALUES ('14', '105', '第三章     智力积木', 'upload/2017/11/16/094100136ces.mp4', '0', '3');
INSERT INTO `content` VALUES ('15', '5', '课时1', 'upload/2017/11/23/153108489ces.mp4', '0', '1');
INSERT INTO `content` VALUES ('16', '5', '课时2', 'upload/2017/11/23/153126776ces.mp4', '0', '2');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `details` varchar(300) DEFAULT NULL,
  `content` text,
  `content1` text,
  `teacher` varchar(300) DEFAULT NULL,
  `author` varchar(300) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `img` varchar(300) DEFAULT NULL,
  `img1` varchar(300) DEFAULT NULL,
  `img2` varchar(300) DEFAULT NULL,
  `money` double(11,2) DEFAULT NULL,
  `paynum` int(11) DEFAULT NULL,
  `readnum` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `privilege` int(11) DEFAULT NULL,
  `img3` varchar(300) DEFAULT NULL,
  `introduce` text,
  `classify2id` int(11) DEFAULT NULL,
  `twomoney` double(11,2) DEFAULT NULL,
  `collectnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for fenxiao
-- ----------------------------
DROP TABLE IF EXISTS `fenxiao`;
CREATE TABLE `fenxiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL,
  `head` varchar(300) DEFAULT NULL,
  `img` varchar(300) DEFAULT NULL,
  `content` text,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fenxiao
-- ----------------------------

-- ----------------------------
-- Table structure for kefuqq
-- ----------------------------
DROP TABLE IF EXISTS `kefuqq`;
CREATE TABLE `kefuqq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kefuqq
-- ----------------------------

-- ----------------------------
-- Table structure for mylike
-- ----------------------------
DROP TABLE IF EXISTS `mylike`;
CREATE TABLE `mylike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `likeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mylike
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', null, null, null);

-- ----------------------------
-- Table structure for nongli
-- ----------------------------
DROP TABLE IF EXISTS `nongli`;
CREATE TABLE `nongli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lunar` varchar(300) DEFAULT NULL,
  `suit` varchar(300) DEFAULT NULL,
  `avoid` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nongli
-- ----------------------------
INSERT INTO `nongli` VALUES ('1', '丁酉年九月廿七日', '入学 开市 入学 嫁娶 上官 赴任 婚礼 造作 动土 旅行 ', '诉讼 诉讼 ');

-- ----------------------------
-- Table structure for order1
-- ----------------------------
DROP TABLE IF EXISTS `order1`;
CREATE TABLE `order1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `oid` varchar(50) DEFAULT NULL,
  `coursetitle` varchar(300) DEFAULT NULL,
  `courseimg` varchar(300) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` varchar(300) DEFAULT NULL,
  `team` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `contentid` int(11) DEFAULT NULL,
  `pingfei` int(11) DEFAULT NULL,
  `pingfen` int(11) DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order1
-- ----------------------------

-- ----------------------------
-- Table structure for order2
-- ----------------------------
DROP TABLE IF EXISTS `order2`;
CREATE TABLE `order2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `oid` varchar(50) DEFAULT NULL,
  `coursetitle` varchar(300) DEFAULT NULL,
  `courseimg` varchar(300) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` varchar(300) DEFAULT NULL,
  `time1` varchar(300) DEFAULT NULL,
  `team` varchar(100) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `allprice` double DEFAULT NULL,
  `tuikuanstatus` int(11) DEFAULT NULL,
  `isfanyong` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order2
-- ----------------------------

-- ----------------------------
-- Table structure for payrecord
-- ----------------------------
DROP TABLE IF EXISTS `payrecord`;
CREATE TABLE `payrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `style` int(11) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `time` varchar(300) DEFAULT NULL,
  `yjpay` double(11,2) DEFAULT NULL,
  `jfcontent` varchar(300) DEFAULT NULL,
  `yjcontent` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `kahao` varchar(100) DEFAULT NULL,
  `yinghang` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payrecord
-- ----------------------------
INSERT INTO `payrecord` VALUES ('1', '5', null, '2', null, '2017-11-29 16:37:12', '100.10', null, '13655908101', '0', '赖志成', '6217 0018 3000 9641 021', '建设银行');
INSERT INTO `payrecord` VALUES ('2', '5', null, '2', null, '2017-11-30 13:52:47', '100.10', null, '13655908101', '1', '赖纸', '6217 0018 3000 9641 021', '建设银行');
INSERT INTO `payrecord` VALUES ('3', '5', null, '2', null, '2017-11-30 13:53:16', '100.10', null, '13655908101', '2', '来撒阿萨', '6217 0018 3000 9641 021', '建设银行');
INSERT INTO `payrecord` VALUES ('4', '5', null, '2', null, '2017-11-30 13:53:16', '100.10', null, '13655908101', '2', '来撒阿萨', '6217 0018 3000 9641 021', '建设银行');
INSERT INTO `payrecord` VALUES ('5', '5', null, '2', null, '2018-01-22 16:24:33', '666.00', null, null, '2', '守望者', '1111111111111111111111', '厦门前埔分行');
INSERT INTO `payrecord` VALUES ('6', '5', null, '2', null, '2018-01-22 16:25:47', '666.00', null, null, '1', '守望者', '1111111111111111111111', '厦门前埔分行');

-- ----------------------------
-- Table structure for peizhi
-- ----------------------------
DROP TABLE IF EXISTS `peizhi`;
CREATE TABLE `peizhi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) DEFAULT NULL,
  `appsecret` varchar(100) DEFAULT NULL,
  `partner` varchar(100) DEFAULT NULL,
  `partnerkey` varchar(100) DEFAULT NULL,
  `wx_appid` varchar(100) DEFAULT NULL,
  `wx_appsecret` varchar(100) DEFAULT NULL,
  `qq_appid` varchar(100) DEFAULT NULL,
  `qq_appsecret` varchar(100) DEFAULT NULL,
  `zfbpartner` varchar(100) DEFAULT NULL,
  `zfbpartnerkey` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of peizhi
-- ----------------------------
INSERT INTO `peizhi` VALUES ('1', 'wx4762347a01c410da', '121a7932fb06791ee86a017d502a6639', '1230199602', 'liu776392liu776392liu776392liu77', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `writer` varchar(100) DEFAULT NULL,
  `head` varchar(200) DEFAULT NULL,
  `img` varchar(150) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `content` text,
  `readnum` int(11) DEFAULT NULL,
  `collectnum` int(11) DEFAULT NULL,
  `likenum` int(11) DEFAULT NULL,
  `tuijian` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `img` text,
  `point` int(11) DEFAULT NULL,
  `isUp` int(11) DEFAULT NULL,
  `content` text,
  `stockNum` int(11) DEFAULT NULL,
  `pageView` int(11) DEFAULT NULL,
  `buyNum` int(11) DEFAULT NULL,
  `shoucang` int(11) DEFAULT NULL,
  `tuiJian` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `type1` varchar(50) DEFAULT NULL,
  `type1id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for prophoto
-- ----------------------------
DROP TABLE IF EXISTS `prophoto`;
CREATE TABLE `prophoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prophoto
-- ----------------------------

-- ----------------------------
-- Table structure for sb
-- ----------------------------
DROP TABLE IF EXISTS `sb`;
CREATE TABLE `sb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `fenleiid` int(11) DEFAULT NULL,
  `biaohao` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `leixing` varchar(255) DEFAULT NULL,
  `jieshao` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `xiaoxiang` double DEFAULT NULL,
  `qunzu` varchar(255) DEFAULT NULL,
  `fenleiname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sb
-- ----------------------------
INSERT INTO `sb` VALUES ('1', '15000', '桑蔻', 'upload/2018/03/26/174047612图片 1.png', '25', '14549203', '2025-09-13 17:39:01', '汉字及英文', '', '0', '0', '足球鞋; 帽; 手套（服装）; 皮带（服饰用）; 鞋; 袜; 围巾;', '化学原料');
INSERT INTO `sb` VALUES ('5', '15000', '言着', 'upload/2018/03/26/174604360图片 1.png', '25', '21072518', '2026-10-21 17:45:33', '汉字（拼音）', '', '0', '0', '针织服装,童装,婴儿全套衣,鞋(脚上的穿着物),帽,袜,手套(服装),围巾,皮带(服饰用),服装', '服装鞋帽');
INSERT INTO `sb` VALUES ('6', '15000', '哥束', 'upload/2018/03/26/174906702图片 1.png', '25', '21584951', '2027-11-28 17:48:48', '哥束', '', '0', '0', '针织服装; 童装; 婴儿全套衣; 鞋（脚上的穿着物）; 帽; 袜; 手套（服装）; 围巾; 皮带（服饰用）; 服装;', '服装鞋帽');
INSERT INTO `sb` VALUES ('7', '15000', '之题', 'upload/2018/03/26/175146576图片 1.png', '25', '14563131', '2025-07-06 17:50:37', '', '', '0', '0', '围巾; 羽绒服装; 成品衣; 裤子; 外套; 服装; 童装; 皮带（服饰用）; 鞋（脚上的穿着物）; 袜;', '服装鞋帽');

-- ----------------------------
-- Table structure for sbfenlei
-- ----------------------------
DROP TABLE IF EXISTS `sbfenlei`;
CREATE TABLE `sbfenlei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `fenleiid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbfenlei
-- ----------------------------
INSERT INTO `sbfenlei` VALUES ('1', '0', null, '化学原料', 'upload/2018/03/23/19442534401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('2', '0', null, '颜料油漆', 'upload/2018/03/23/19452333701ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('3', '0', null, '日化用品', 'upload/2018/03/23/19454122501ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('4', '0', null, '燃料油脂', 'upload/2018/03/23/19455538701ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('5', '0', null, '医用药品', 'upload/2018/03/23/19460814401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('6', '0', null, '金属材料', 'upload/2018/03/23/19463497101ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('7', '0', null, '机械设备', 'upload/2018/03/23/19465525001ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('8', '0', null, '手工器械', 'upload/2018/03/23/19475655801ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('9', '0', null, '科学仪器 ', 'upload/2018/03/23/19485019601ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('10', '0', null, '医疗器械', 'upload/2018/03/23/19485884801ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('11', '0', null, '家用电器', 'upload/2018/03/23/19490845901ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('12', '0', null, '运输工具', 'upload/2018/03/23/19493852901ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('13', '0', null, '军火烟火', 'upload/2018/03/23/19502326401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('14', '0', null, '珠宝钟表', 'upload/2018/03/23/19503646801ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('15', '0', null, '音乐器材', 'upload/2018/03/23/19504795801ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('16', '0', null, '办公文具', 'upload/2018/03/23/19572491301ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('17', '0', null, '橡胶制品', 'upload/2018/03/23/19573264101ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('18', '0', null, '皮革皮具', 'upload/2018/03/23/19574178801ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('19', '0', null, '建筑材料', 'upload/2018/03/23/20012228301ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('20', '0', null, '家具用品', 'upload/2018/03/23/20013047901ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('21', '0', null, '厨房洁具', 'upload/2018/03/23/20014217201ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('22', '0', null, '绳网袋篷', 'upload/2018/03/23/20015572701ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('23', '0', null, '纺织纱线', 'upload/2018/03/23/20020312201ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('24', '0', null, '布料床单', 'upload/2018/03/23/20021546701ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('25', '0', null, '服装鞋帽', 'upload/2018/03/23/20022614001ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('26', '0', null, '花边配饰', 'upload/2018/03/23/20040342301ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('27', '0', null, '地毯席垫', 'upload/2018/03/23/20041215901ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('28', '0', null, '健身娱乐', 'upload/2018/03/23/20043764601ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('29', '0', null, '肉食蜜饯', 'upload/2018/03/23/20045881701ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('30', '0', null, '小食配料', 'upload/2018/03/23/20050840401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('31', '0', null, '饲料花木', 'upload/2018/03/23/20051629201ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('32', '0', null, '啤酒饮料', 'upload/2018/03/23/20052849401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('33', '0', null, '酒精饮料', 'upload/2018/03/23/20053819201ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('34', '0', null, '烟草烟具', 'upload/2018/03/23/20054623201ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('35', '0', null, '广告销售', 'upload/2018/03/23/20055458501ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('36', '0', null, '金融物管', 'upload/2018/03/23/20082593101ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('37', '0', null, '建筑修理', 'upload/2018/03/23/20091180401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('38', '0', null, '通讯服务', 'upload/2018/03/23/20103093501ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('39', '0', null, '运输贮藏 ', 'upload/2018/03/23/20113192401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('40', '0', null, '材料加工', 'upload/2018/03/23/20114482601ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('41', '0', null, '教育娱乐', 'upload/2018/03/23/20115834501ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('42', '0', null, '技术服务', 'upload/2018/03/23/20122639801ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('43', '0', null, '餐饮住宿 ', 'upload/2018/03/23/20123427101ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('44', '0', null, '医疗园艺', 'upload/2018/03/23/20124945401ddaf57de56e90000018c1b37e773.png');
INSERT INTO `sbfenlei` VALUES ('45', '0', null, '社会服务', 'upload/2018/03/23/20125875801ddaf57de56e90000018c1b37e773.png');

-- ----------------------------
-- Table structure for talk
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forumid` int(11) DEFAULT NULL,
  `teamid` int(11) DEFAULT NULL,
  `content` text,
  `time` varchar(50) DEFAULT NULL,
  `showtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of talk
-- ----------------------------

-- ----------------------------
-- Table structure for talphoto
-- ----------------------------
DROP TABLE IF EXISTS `talphoto`;
CREATE TABLE `talphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of talphoto
-- ----------------------------

-- ----------------------------
-- Table structure for taocan
-- ----------------------------
DROP TABLE IF EXISTS `taocan`;
CREATE TABLE `taocan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `money` double(11,2) DEFAULT NULL,
  `twomoney` double(11,2) DEFAULT NULL,
  `courseids` varchar(300) DEFAULT NULL,
  `payNum` int(11) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taocan
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `img` varchar(300) DEFAULT NULL,
  `intro` text,
  `detail` text,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(500) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `nickname` varchar(500) DEFAULT NULL,
  `rname` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthDay` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `ttype` int(11) DEFAULT NULL,
  `endTime` varchar(50) DEFAULT NULL,
  `regTime` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `isjudge` int(11) DEFAULT NULL,
  `isreject` int(11) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `isforbid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `member` int(11) DEFAULT NULL,
  `companyname` varchar(300) DEFAULT NULL,
  `memberdj` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `yijiId` varchar(255) DEFAULT NULL,
  `allyongjin` double(11,2) DEFAULT NULL,
  `yongjin` double(11,2) DEFAULT NULL,
  `yijiname` varchar(500) DEFAULT NULL,
  `hctime` bigint(20) DEFAULT NULL,
  `ticket` varchar(500) DEFAULT NULL,
  `tuijian` text,
  `istj` int(11) DEFAULT NULL,
  `appid` varchar(100) DEFAULT NULL,
  `erweimapath` varchar(500) DEFAULT NULL,
  `isfanyong` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('35', 'ovxvy0LIEQ89b41OWvFNZ9J4ftGA', null, null, 'https://wx.qlogo.cn/mmopen/vi_32/r7WknjKuyBGym0Yp3QV6pgia1XqcgVcvNjibqIMYTVI4FttBXvTrMXKfJH8dFjqZD4GiaFjgv8LGwW3WiaFNmrKTfg/0', '少了一场雨', null, null, null, null, null, null, null, null, '2018-03-23 17:11:26', '2018-03-23 17:11:26', null, null, '0', '0', null, '0', '0', null, null, '0', '0', '0', '0.00', '0.00', null, null, null, null, '1', 'wx4762347a01c410da', '', '0');
INSERT INTO `team` VALUES ('36', 'ovxvy0EMI4szZ-gRP2B51GiuDRcE', null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLKvWcMXcpV7VibMKNiahFkjZsRodM3z8UVpVAfVZ3kcreWAhNeo7empczXxbVNicQfnswTxdHicQWiaMA/0', '王泽鹏', null, null, null, null, null, null, null, null, '2018-03-23 20:13:43', '2018-03-23 20:13:43', null, null, '0', '0', null, '0', '0', null, null, '0', '0', '0', '0.00', '0.00', null, null, null, null, '1', 'wx4762347a01c410da', '', '0');

-- ----------------------------
-- Table structure for teamaward
-- ----------------------------
DROP TABLE IF EXISTS `teamaward`;
CREATE TABLE `teamaward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `teamId` int(11) DEFAULT NULL,
  `teamid1` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `time` varchar(300) DEFAULT NULL,
  `fanyongname` varchar(300) DEFAULT NULL,
  `yongjinaward` double(11,2) DEFAULT NULL,
  `yjcontent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teamaward
-- ----------------------------

-- ----------------------------
-- Table structure for tongji
-- ----------------------------
DROP TABLE IF EXISTS `tongji`;
CREATE TABLE `tongji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(50) DEFAULT NULL,
  `coursenum` int(11) DEFAULT NULL,
  `courseprice` int(11) DEFAULT NULL,
  `productnum` int(11) DEFAULT NULL,
  `productprice` int(11) DEFAULT NULL,
  `productpoint` int(11) DEFAULT NULL,
  `huiyuannum` int(11) DEFAULT NULL,
  `huiyuanprice` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tongji
-- ----------------------------

-- ----------------------------
-- Table structure for yewu
-- ----------------------------
DROP TABLE IF EXISTS `yewu`;
CREATE TABLE `yewu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xiaoshounum` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `biaoti` varchar(255) DEFAULT NULL,
  `jianjie` varchar(255) DEFAULT NULL,
  `xqimg` varchar(700) DEFAULT NULL,
  `uptime` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `xiaoxiang` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yewu
-- ----------------------------
INSERT INTO `yewu` VALUES ('13', '0', 'upload/2018/03/23/21040365701ddaf57de56e90000018c1b37e773.png', '商标基础注册', '', 'upload/2018/03/26/172059837未命名.jpg', '2018-03-23 21:04:03', '999', '100');

-- ----------------------------
-- Table structure for yewuguanxi
-- ----------------------------
DROP TABLE IF EXISTS `yewuguanxi`;
CREATE TABLE `yewuguanxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) DEFAULT NULL,
  `yewuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yewuguanxi
-- ----------------------------

-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.15-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 db_demo 的数据库结构
DROP DATABASE IF EXISTS `db_demo`;
CREATE DATABASE IF NOT EXISTS `db_demo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_demo`;

-- 导出  表 db_demo.account 结构
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `acct_num` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.account 的数据：~2 rows (大约)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`acct_num`, `amount`) VALUES
	(1, 1.00),
	(2, 2.00);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- 导出  表 db_demo.article 结构
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `aid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.article 的数据：~4 rows (大约)
DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`aid`, `title`, `content`, `uid`) VALUES
	(1, '文章1', '文章1正文内容...', 1),
	(2, '文章2', '文章2正文内容...', 1),
	(3, '文章3', '文章3正文内容...', 2),
	(4, '文章4', '文章4正文内容...', 3),
	(5, '文章5', '文章5正文内容...', 3);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- 导出  过程 db_demo.avgStuAge 结构
DROP PROCEDURE IF EXISTS `avgStuAge`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `avgStuAge`()
begin
select avg(age) from stu ;
end//
DELIMITER ;

-- 导出  表 db_demo.bit_test 结构
DROP TABLE IF EXISTS `bit_test`;
CREATE TABLE IF NOT EXISTS `bit_test` (
  `b` bit(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.bit_test 的数据：~2 rows (大约)
DELETE FROM `bit_test`;
/*!40000 ALTER TABLE `bit_test` DISABLE KEYS */;
INSERT INTO `bit_test` (`b`) VALUES
	(b'1011'),
	(b'0011');
/*!40000 ALTER TABLE `bit_test` ENABLE KEYS */;

-- 导出  表 db_demo.blog 结构
DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `bid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.blog 的数据：~4 rows (大约)
DELETE FROM `blog`;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`bid`, `title`, `content`, `uid`) VALUES
	(1, '日志1', '日志1正文内容...', 1),
	(3, '日志3', '日志3正文内容...', 2),
	(2, '文章2', '文章2正文内容...', 1),
	(4, '文章3', '文章3正文内容...', 2),
	(5, '文章5', '文章5正文内容...', 3);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;

-- 导出  表 db_demo.date_test 结构
DROP TABLE IF EXISTS `date_test`;
CREATE TABLE IF NOT EXISTS `date_test` (
  `d1` datetime DEFAULT NULL,
  `d2` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.date_test 的数据：~0 rows (大约)
DELETE FROM `date_test`;
/*!40000 ALTER TABLE `date_test` DISABLE KEYS */;
INSERT INTO `date_test` (`d1`, `d2`) VALUES
	('2017-10-31 11:23:08', '2017-10-31 11:23:08');
/*!40000 ALTER TABLE `date_test` ENABLE KEYS */;

-- 导出  表 db_demo.decimaltest 结构
DROP TABLE IF EXISTS `decimaltest`;
CREATE TABLE IF NOT EXISTS `decimaltest` (
  `a` decimal(2,1) DEFAULT NULL,
  `b` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.decimaltest 的数据：~0 rows (大约)
DELETE FROM `decimaltest`;
/*!40000 ALTER TABLE `decimaltest` DISABLE KEYS */;
INSERT INTO `decimaltest` (`a`, `b`) VALUES
	(5.0, 3.2);
/*!40000 ALTER TABLE `decimaltest` ENABLE KEYS */;

-- 导出  表 db_demo.doubletest 结构
DROP TABLE IF EXISTS `doubletest`;
CREATE TABLE IF NOT EXISTS `doubletest` (
  `a` double DEFAULT NULL,
  `b` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.doubletest 的数据：~0 rows (大约)
DELETE FROM `doubletest`;
/*!40000 ALTER TABLE `doubletest` DISABLE KEYS */;
INSERT INTO `doubletest` (`a`, `b`) VALUES
	(5, 3.2);
/*!40000 ALTER TABLE `doubletest` ENABLE KEYS */;

-- 导出  表 db_demo.edu 结构
DROP TABLE IF EXISTS `edu`;
CREATE TABLE IF NOT EXISTS `edu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL DEFAULT '0',
  `from_date` date NOT NULL DEFAULT '0000-00-00',
  `to_date` date NOT NULL DEFAULT '0000-00-00',
  `degree` tinyint(1) NOT NULL DEFAULT '0',
  `school_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_edu_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.edu 的数据：~11 rows (大约)
DELETE FROM `edu`;
/*!40000 ALTER TABLE `edu` DISABLE KEYS */;
INSERT INTO `edu` (`id`, `stu_id`, `from_date`, `to_date`, `degree`, `school_id`) VALUES
	(3, 3, '1990-07-01', '1995-09-01', 0, 2),
	(4, 4, '1990-07-01', '1995-09-01', 0, 2),
	(5, 5, '1990-07-01', '1995-09-01', 0, 2),
	(6, 1, '1995-07-01', '1998-09-01', 1, 2),
	(7, 2, '1995-07-01', '1998-09-01', 1, 2),
	(8, 3, '1995-07-01', '1998-09-01', 1, 2),
	(9, 4, '1995-07-01', '1998-09-01', 1, 2),
	(10, 1, '1998-07-01', '2002-09-01', 1, NULL),
	(11, 2, '1998-07-01', '2002-09-01', 1, 2),
	(12, 3, '1998-07-01', '2002-09-01', 1, 2),
	(13, 4, '1998-07-01', '2002-09-01', 1, 2);
/*!40000 ALTER TABLE `edu` ENABLE KEYS */;

-- 导出  表 db_demo.enum_test 结构
DROP TABLE IF EXISTS `enum_test`;
CREATE TABLE IF NOT EXISTS `enum_test` (
  `en` enum('one','tow','three') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.enum_test 的数据：~2 rows (大约)
DELETE FROM `enum_test`;
/*!40000 ALTER TABLE `enum_test` DISABLE KEYS */;
INSERT INTO `enum_test` (`en`) VALUES
	('one'),
	('tow'),
	('three');
/*!40000 ALTER TABLE `enum_test` ENABLE KEYS */;

-- 导出  表 db_demo.floattest 结构
DROP TABLE IF EXISTS `floattest`;
CREATE TABLE IF NOT EXISTS `floattest` (
  `a` float DEFAULT NULL,
  `b` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.floattest 的数据：~0 rows (大约)
DELETE FROM `floattest`;
/*!40000 ALTER TABLE `floattest` DISABLE KEYS */;
INSERT INTO `floattest` (`a`, `b`) VALUES
	(5, 3.2);
/*!40000 ALTER TABLE `floattest` ENABLE KEYS */;

-- 导出  过程 db_demo.handledemo 结构
DROP PROCEDURE IF EXISTS `handledemo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `handledemo`()
begin 
declare continue handler for sqlstate '23000' set @x2=1;
set @x=1;
insert into t values(1);
set @x=2;
insert into t values(1);
set @x=3;
end//
DELIMITER ;

-- 导出  表 db_demo.m 结构
DROP TABLE IF EXISTS `m`;
CREATE TABLE IF NOT EXISTS `m` (
  `count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.m 的数据：~4 rows (大约)
DELETE FROM `m`;
/*!40000 ALTER TABLE `m` DISABLE KEYS */;
INSERT INTO `m` (`count`, `price`) VALUES
	(30, 5),
	(10, 3),
	(15, NULL),
	(15, NULL),
	(43, NULL);
/*!40000 ALTER TABLE `m` ENABLE KEYS */;

-- 导出  函数 db_demo.nameById 结构
DROP FUNCTION IF EXISTS `nameById`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `nameById`() RETURNS char(50) CHARSET utf8
return (select name from stu where id=4)//
DELIMITER ;

-- 导出  表 db_demo.school 结构
DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `addr` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.school 的数据：~2 rows (大约)
DELETE FROM `school`;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`id`, `name`, `addr`) VALUES
	(2, '六安一中', 'lan');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- 导出  表 db_demo.set_test 结构
DROP TABLE IF EXISTS `set_test`;
CREATE TABLE IF NOT EXISTS `set_test` (
  `st` set('one','tow','three') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.set_test 的数据：~6 rows (大约)
DELETE FROM `set_test`;
/*!40000 ALTER TABLE `set_test` DISABLE KEYS */;
INSERT INTO `set_test` (`st`) VALUES
	('one'),
	('tow'),
	('one,tow'),
	('three'),
	('one,three'),
	('tow,three'),
	('one,tow,three');
/*!40000 ALTER TABLE `set_test` ENABLE KEYS */;

-- 导出  表 db_demo.stu 结构
DROP TABLE IF EXISTS `stu`;
CREATE TABLE IF NOT EXISTS `stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `cell` char(11) NOT NULL,
  `addr` varchar(50) NOT NULL DEFAULT 'hefei',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.stu 的数据：~13 rows (大约)
DELETE FROM `stu`;
/*!40000 ALTER TABLE `stu` DISABLE KEYS */;
INSERT INTO `stu` (`id`, `age`, `name`, `cell`, `addr`) VALUES
	(1, 25, 'zhangsan', '13822223333', 'hefei'),
	(2, 35, 'zhang', '13822223334', 'hefei'),
	(3, 25, 'zhaosi', '13600001111', 'hefei'),
	(4, 26, 'lisi', '13655551111', 'hefei'),
	(5, 36, 'zhaogao', '13500001111', 'hefei'),
	(6, 35, 'tom', '14722220000', 'hefei'),
	(7, 35, 'tom', '14722220000', 'hefei'),
	(8, 35, 'tom', '14722220000', 'hefei'),
	(10, 35, 'tom', '14722220000', 'hefei'),
	(11, 35, 'jimmy', '14722225555', 'hefei'),
	(12, 35, 'tim', '14722220000', 'hefei'),
	(13, 35, 'tnm', '14722220000', 'hefei'),
	(14, 40, 'hanfei', '13188888888', 'hefei');
/*!40000 ALTER TABLE `stu` ENABLE KEYS */;

-- 导出  表 db_demo.student 结构
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.student 的数据：~4 rows (大约)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `name`) VALUES
	(1, 'zhangsan'),
	(2, 'lisi'),
	(3, 'wangwu'),
	(4, 'zhaoliu');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 导出  表 db_demo.stu_info 结构
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE IF NOT EXISTS `stu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `glass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.stu_info 的数据：~4 rows (大约)
DELETE FROM `stu_info`;
/*!40000 ALTER TABLE `stu_info` DISABLE KEYS */;
INSERT INTO `stu_info` (`id`, `s_id`, `glass`) VALUES
	(1, 1, '1ban'),
	(2, 2, '2ban'),
	(3, 3, '3ban'),
	(4, 4, '4ban');
/*!40000 ALTER TABLE `stu_info` ENABLE KEYS */;

-- 导出  表 db_demo.t 结构
DROP TABLE IF EXISTS `t`;
CREATE TABLE IF NOT EXISTS `t` (
  `s1` int(10) unsigned NOT NULL,
  PRIMARY KEY (`s1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.t 的数据：~0 rows (大约)
DELETE FROM `t`;
/*!40000 ALTER TABLE `t` DISABLE KEYS */;
INSERT INTO `t` (`s1`) VALUES
	(1);
/*!40000 ALTER TABLE `t` ENABLE KEYS */;

-- 导出  表 db_demo.tch 结构
DROP TABLE IF EXISTS `tch`;
CREATE TABLE IF NOT EXISTS `tch` (
  `age` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.tch 的数据：~0 rows (大约)
DELETE FROM `tch`;
/*!40000 ALTER TABLE `tch` DISABLE KEYS */;
/*!40000 ALTER TABLE `tch` ENABLE KEYS */;

-- 导出  表 db_demo.teacherinfo 结构
DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE IF NOT EXISTS `teacherinfo` (
  `age` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.teacherinfo 的数据：~0 rows (大约)
DELETE FROM `teacherinfo`;
/*!40000 ALTER TABLE `teacherinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacherinfo` ENABLE KEYS */;

-- 导出  表 db_demo.test1 结构
DROP TABLE IF EXISTS `test1`;
CREATE TABLE IF NOT EXISTS `test1` (
  `a1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.test1 的数据：~8 rows (大约)
DELETE FROM `test1`;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
INSERT INTO `test1` (`a1`) VALUES
	(1),
	(3),
	(1),
	(7),
	(1),
	(8),
	(4),
	(4);
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;

-- 导出  表 db_demo.test2 结构
DROP TABLE IF EXISTS `test2`;
CREATE TABLE IF NOT EXISTS `test2` (
  `a2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.test2 的数据：~8 rows (大约)
DELETE FROM `test2`;
/*!40000 ALTER TABLE `test2` DISABLE KEYS */;
INSERT INTO `test2` (`a2`) VALUES
	(1),
	(3),
	(1),
	(7),
	(1),
	(8),
	(4),
	(4);
/*!40000 ALTER TABLE `test2` ENABLE KEYS */;

-- 导出  表 db_demo.test3 结构
DROP TABLE IF EXISTS `test3`;
CREATE TABLE IF NOT EXISTS `test3` (
  `a3` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`a3`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.test3 的数据：~5 rows (大约)
DELETE FROM `test3`;
/*!40000 ALTER TABLE `test3` DISABLE KEYS */;
INSERT INTO `test3` (`a3`) VALUES
	(2),
	(5),
	(6),
	(9),
	(10);
/*!40000 ALTER TABLE `test3` ENABLE KEYS */;

-- 导出  表 db_demo.test4 结构
DROP TABLE IF EXISTS `test4`;
CREATE TABLE IF NOT EXISTS `test4` (
  `a4` int(11) NOT NULL AUTO_INCREMENT,
  `b4` int(11) DEFAULT '0',
  PRIMARY KEY (`a4`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.test4 的数据：~10 rows (大约)
DELETE FROM `test4`;
/*!40000 ALTER TABLE `test4` DISABLE KEYS */;
INSERT INTO `test4` (`a4`, `b4`) VALUES
	(1, 3),
	(2, 0),
	(3, 1),
	(4, 2),
	(5, 0),
	(6, 0),
	(7, 1),
	(8, 1),
	(9, 0),
	(10, 0);
/*!40000 ALTER TABLE `test4` ENABLE KEYS */;

-- 导出  表 db_demo.tinyint_unsigned 结构
DROP TABLE IF EXISTS `tinyint_unsigned`;
CREATE TABLE IF NOT EXISTS `tinyint_unsigned` (
  `a` tinyint(4) DEFAULT NULL,
  `b` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.tinyint_unsigned 的数据：~4 rows (大约)
DELETE FROM `tinyint_unsigned`;
/*!40000 ALTER TABLE `tinyint_unsigned` DISABLE KEYS */;
INSERT INTO `tinyint_unsigned` (`a`, `b`) VALUES
	(100, 200),
	(127, 255),
	(-1, 255),
	(-128, 255),
	(-128, 0);
/*!40000 ALTER TABLE `tinyint_unsigned` ENABLE KEYS */;

-- 导出  表 db_demo.transaction_test 结构
DROP TABLE IF EXISTS `transaction_test`;
CREATE TABLE IF NOT EXISTS `transaction_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 正在导出表  db_demo.transaction_test 的数据：~8 rows (大约)
DELETE FROM `transaction_test`;
/*!40000 ALTER TABLE `transaction_test` DISABLE KEYS */;
INSERT INTO `transaction_test` (`id`, `name`) VALUES
	(1, 'andy'),
	(2, 'tom'),
	(3, 'jack'),
	(5, 'jim'),
	(6, 'tim'),
	(8, 'him'),
	(11, 'john'),
	(12, 'lee');
/*!40000 ALTER TABLE `transaction_test` ENABLE KEYS */;

-- 导出  视图 db_demo.v2 结构
DROP VIEW IF EXISTS `v2`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v2` (
	`count` INT(11) NULL
) ENGINE=MyISAM;

-- 导出  视图 db_demo.v_m 结构
DROP VIEW IF EXISTS `v_m`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_m` (
	`count` INT(11) NULL,
	`price` INT(11) NULL,
	`sum` BIGINT(21) NULL
) ENGINE=MyISAM;

-- 导出  视图 db_demo.v_m2 结构
DROP VIEW IF EXISTS `v_m2`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_m2` (
	`c` INT(11) NULL,
	`s` BIGINT(21) NULL
) ENGINE=MyISAM;

-- 导出  视图 db_demo.v_stu_glass 结构
DROP VIEW IF EXISTS `v_stu_glass`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_stu_glass` (
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`glass` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- 导出  视图 db_demo.v_stu_glass2 结构
DROP VIEW IF EXISTS `v_stu_glass2`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `v_stu_glass2` (
	`id` INT(11) NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`glass` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- 导出  触发器 db_demo.ins_sum 结构
DROP TRIGGER IF EXISTS `ins_sum`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ins_sum` BEFORE INSERT ON `account` FOR EACH ROW set @sum = @sum + new.amount//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 db_demo.testref 结构
DROP TRIGGER IF EXISTS `testref`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `testref` BEFORE INSERT ON `test1` FOR EACH ROW begin
insert into test2 set a2 = new.a1;
delete from test3 where a3=new.a1;
update test4 set b4 = b4 + 1 where a4= new.a1;
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  视图 db_demo.v2 结构
DROP VIEW IF EXISTS `v2`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v2` AS select `m`.`count` AS `count` from `m` WITH LOCAL CHECK OPTION;

-- 导出  视图 db_demo.v_m 结构
DROP VIEW IF EXISTS `v_m`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_m`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_m` AS select `m`.`count` AS `count`,`m`.`price` AS `price`,(`m`.`count` * `m`.`price`) AS `sum` from `m`;

-- 导出  视图 db_demo.v_m2 结构
DROP VIEW IF EXISTS `v_m2`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_m2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_m2` AS select `m`.`count` AS `c`,(`m`.`count` * `m`.`price`) AS `s` from `m`;

-- 导出  视图 db_demo.v_stu_glass 结构
DROP VIEW IF EXISTS `v_stu_glass`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_stu_glass`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stu_glass` AS select `s`.`name` AS `name`,`i`.`glass` AS `glass` from (`student` `s` join `stu_info` `i`) where (`s`.`id` = `i`.`s_id`);

-- 导出  视图 db_demo.v_stu_glass2 结构
DROP VIEW IF EXISTS `v_stu_glass2`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `v_stu_glass2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stu_glass2` AS select `s`.`id` AS `id`,`s`.`name` AS `name`,`i`.`glass` AS `glass` from (`student` `s` join `stu_info` `i`) where (`s`.`id` = `i`.`s_id`);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

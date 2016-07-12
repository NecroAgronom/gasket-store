-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 12 2016 г., 17:08
-- Версия сервера: 5.5.45
-- Версия PHP: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `mcv`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gaskets`
--

CREATE TABLE IF NOT EXISTS `gaskets` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `gasket` varchar(40) DEFAULT NULL,
  `quant` int(4) NOT NULL,
  `price` float(6,2) unsigned NOT NULL DEFAULT '50.00',
  PRIMARY KEY (`id`),
  KEY `gasket` (`gasket`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `gaskets`
--

INSERT INTO `gaskets` (`id`, `gasket`, `quant`, `price`) VALUES
(1, 'TB10194', 10, 100.00),
(3, '00959600', 12, 50.00),
(4, 'TB10137', 12, 45.20),
(5, '00959700', 14, 50.00),
(6, 'TB10003', 6, 50.00),
(7, 'TB10198', 0, 50.00),
(9, '00991300', 7, 50.00),
(10, '01009200', 10, 50.00),
(11, '00888300', 64, 100.00),
(12, 'TB10207', 46, 120.70),
(13, 'str', 200000, 0.00),
(14, 'TB10221', 44, 0.00),
(15, 'TB10237', 11, 0.00),
(17, '00914600', 9, 0.00),
(18, 'TB10208', 1, 67.00),
(28, '00561000', 6, 0.00);

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `manufactor` varchar(25) NOT NULL,
  `turbo` varchar(30) NOT NULL,
  `gasket_kit` varchar(30) NOT NULL,
  `img_src` varchar(30) NOT NULL,
  `price` float(6,2) unsigned NOT NULL,
  `oil_in` varchar(20) NOT NULL,
  `oli_out` varchar(20) NOT NULL,
  `gas_in` varchar(20) NOT NULL,
  `gas_out` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `manufactor`, `turbo`, `gasket_kit`, `img_src`, `price`, `oil_in`, `oli_out`, `gas_in`, `gas_out`) VALUES
(1, 'GARRETT  ', '409200-5013 ', 'JT10066 ', ' /webroot/img/1.jpg  ', 122.45, 'TB10194  ', '00888300  ', '00959600 ', 'TB10137 '),
(2, 'GARRETT   ', '409300-5011 ', 'JT10068 ', ' /webroot/img/1.jpg   ', 70.30, 'TB10194 ', '00888300   ', '00959700   ', 'TB10137 '),
(3, 'GARRETT', '409300-5026', 'JT10068', '/webroot/img/1.jpg', 78.00, 'TB10194', '00888300', '00959700', 'TB10137'),
(4, 'GARRETT', '409840-5005', 'JT10070', '/webroot/img/1.jpg', 101.30, 'TB10194', '00888300', '00959700', 'TB10003'),
(5, 'GARRETT', '434251-5041', 'JT10219', '/webroot/img/1.jpg', 88.40, 'TB10198', 'TB10207', '00991300', '01009200'),
(6, 'GARRETT', '402910-5032', 'JT10144', '', 101.30, 'TB10221', 'TB10221', 'str', '00914600'),
(7, 'GARRETT', '408110-5005', 'JT10120', '', 145.00, 'TB10221', 'TB10237', '00991300', 'str'),
(8, 'GARRETT', '408110-5006', 'JT10120', '', 124.20, 'TB10221', 'TB10237', '00991300', 'str'),
(9, 'GARRETT', '408970-5002', 'JT10065', '', 100.00, 'TB10194', 'TB10208', '00959700', 'str'),
(10, 'GARRETT', '409250-5002', 'JT10067', '', 100.00, '00736000', '00888300', '00959700', 'str'),
(11, 'GARRETT', '409410-5002', 'JT10121', '', 100.00, 'TB10194', 'TB10208', '00866100', 'str'),
(12, 'GARRETT', '409410-5006', 'JT10121', '', 100.00, 'TB10194', 'TB10208', '00866100', 'str'),
(13, 'GARRETT', '409410-5007', 'JT10121', '', 100.00, 'TB10194', 'TB10208', '00866100', 'str'),
(14, 'GARRETT', '409410-5008', 'JT10121', '', 100.00, 'TB10194', 'TB10208', '00866100', 'str'),
(15, 'GARRETT', '409410-5011', 'JT10121', '', 100.00, 'TB10194', 'TB10208', '00866100', 'str'),
(16, 'GARRETT', '409570-5010', 'JT10315', '', 90.00, 'TB10196', '00888300', '00866100', 'str'),
(17, 'GARRETT', '409570-5016', 'JT10315', '', 45.00, 'TB10196', '00888300', '00866100', 'str'),
(18, 'GARRETT', '409710-5001', 'JT10106', '', 90.00, 'TB10196', '00888300', '00959700', 'str'),
(19, 'GARRETT', '409760-5002', 'JT10315', '', 95.00, 'TB10196', '00888300', '00866100', 'str'),
(20, 'GARRETT', '409770-5019', 'JT10315', '', 90.00, 'TB10196', '00888300', '00866100', 'str'),
(21, 'GARRETT', '409930-5003', 'JT10148', '', 100.00, '00736000', '00888300', 'str', 'str'),
(22, 'GARRETT', '422979-5003', 'JT10364', '', 115.00, '21010400', '00736000', 'TB10121', 'str');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=255 ;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`) VALUES
(1, 'test', 'test@test.com', 'test message'),
(2, 'test2', 'test2@test.com', 'test2'),
(3, 'test3', 'test3@test.com', 'test3'),
(4, 'ert', 'ewr@tbrd.com', 'etqrg'),
(5, 'DGM', 'joi@gmail.com', 'TR'),
(6, '1', '1@bn.com', '1111111111111111111111111'),
(7, '12345', '7@yjt.com', 'w4tjyrsyjrayj'),
(21, '1', '1@bn.com', '111111'),
(22, 'srgfbae', '1@bn.com', 'etg'),
(23, 'srgfbae', '1@bn.com', 'etg'),
(24, 'Rtg', 'ryhd@wd.com', 'rwth'),
(25, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(26, '''', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(27, '"', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(28, '''', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(29, '"', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(30, '\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(31, 'X S', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(32, '<>', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(33, '--', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(34, '2-1 and 1=1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(35, ''' and ''1''=''1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(36, '" and "1"="1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(37, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(38, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(39, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(40, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(41, 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(42, 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(43, '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(44, '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(45, 'java:xscript(XSS)', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(46, 'myvalue" myattribute="java:xscript(XSS)" ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(47, 'myvalue myattribute=java:xscript(XSS) ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(48, 'myvalue'' myattribute=''java:xscript(XSS)'' ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(49, 'XSS@+xscript-XSS+/xscript-.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(50, 'XSS@+xscript-XSS+/xscript-.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(51, '\r\nPTHeader: PTValue', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(52, 'www.myhwmanx.net', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(53, '/etc/passwd', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(54, '/etc/passwd\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(55, '../../../../../../../../../etc/passwd', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(56, '../../../../../../../../../etc/passwd\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(57, '/boot.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(58, '/boot.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(59, '../../../../../../../../../boot.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(60, '../../../../../../../../../boot.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(61, '/windows/win.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(62, '/windows/win.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(63, '../../../../../../../../../windows/win.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(64, '../../../../../../../../../windows/win.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(65, '|id|', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(66, '`id`', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(67, ';id;', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(68, '|ping|', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(69, '`ping`', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(70, ';id;', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(71, '/contacts/ ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(72, 'contacts/', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(73, 'contacts/\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(74, 'contacts/.', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(75, 'contacts/ ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(76, '1', '''', '1'),
(77, '1', '"', '1'),
(78, '1', '''', '1'),
(79, '1', '"', '1'),
(80, '1', '\0', '1'),
(81, '1', 'X S', '1'),
(82, '1', '<>', '1'),
(83, '1', '--', '1'),
(84, '1', '2-1 and 1=1', '1'),
(85, '1', ''' and ''1''=''1', '1'),
(86, '1', '" and "1"="1', '1'),
(87, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(88, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(89, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(90, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(91, '1', 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', '1'),
(92, '1', 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', '1'),
(93, '1', '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', '1'),
(94, '1', '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', '1'),
(95, '1', 'java:xscript(XSS)', '1'),
(96, '1', 'myvalue" myattribute="java:xscript(XSS)" ', '1'),
(97, '1', 'myvalue myattribute=java:xscript(XSS) ', '1'),
(98, '1', 'myvalue'' myattribute=''java:xscript(XSS)'' ', '1'),
(99, '1', 'XSS@+xscript-XSS+/xscript-.com', '1'),
(100, '1', 'XSS@+xscript-XSS+/xscript-.com', '1'),
(101, '1', '\r\nPTHeader: PTValue', '1'),
(102, '1', 'www.geqkdfaw.net', '1'),
(103, '1', '/etc/passwd', '1'),
(104, '1', '/etc/passwd\0', '1'),
(105, '1', '../../../../../../../../../etc/passwd', '1'),
(106, '1', '../../../../../../../../../etc/passwd\0', '1'),
(107, '1', '/boot.ini', '1'),
(108, '1', '/boot.ini\0', '1'),
(109, '1', '../../../../../../../../../boot.ini', '1'),
(110, '1', '../../../../../../../../../boot.ini\0', '1'),
(111, '1', '/windows/win.ini', '1'),
(112, '1', '/windows/win.ini\0', '1'),
(113, '1', '../../../../../../../../../windows/win.ini', '1'),
(114, '1', '../../../../../../../../../windows/win.ini\0', '1'),
(115, '1', '|id|', '1'),
(116, '1', '`id`', '1'),
(117, '1', ';id;', '1'),
(118, '1', '|ping|', '1'),
(119, '1', '`ping`', '1'),
(120, '1', ';id;', '1'),
(121, '1', '/contacts/ ', '1'),
(122, '1', 'contacts/', '1'),
(123, '1', 'contacts/\0', '1'),
(124, '1', 'contacts/.', '1'),
(125, '1', 'contacts/ ', '1'),
(126, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', ''''),
(127, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '"'),
(128, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', ''''),
(129, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '"'),
(130, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '\0'),
(131, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'X S'),
(132, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '<>'),
(133, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '--'),
(134, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '2-1 and 1=1'),
(135, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', ''' and ''1''=''1'),
(136, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '" and "1"="1'),
(137, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@<xscript>XSS</xscript>.com'),
(138, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@<xscript>XSS</xscript>.com'),
(139, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@<xscript>XSS</xscript>.com'),
(140, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@<xscript>XSS</xscript>.com'),
(141, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com'),
(142, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com'),
(143, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com'),
(144, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com'),
(145, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'java:xscript(XSS)'),
(146, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'myvalue" myattribute="java:xscript(XSS)" '),
(147, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'myvalue myattribute=java:xscript(XSS) '),
(148, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'myvalue'' myattribute=''java:xscript(XSS)'' '),
(149, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@+xscript-XSS+/xscript-.com'),
(150, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'XSS@+xscript-XSS+/xscript-.com'),
(151, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '\r\nPTHeader: PTValue'),
(152, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'www.sjktqixt.net'),
(153, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '/etc/passwd'),
(154, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '/etc/passwd\0'),
(155, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '../../../../../../../../../etc/passwd'),
(156, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '../../../../../../../../../etc/passwd\0'),
(157, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '/boot.ini'),
(158, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '/boot.ini\0'),
(159, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '../../../../../../../../../boot.ini'),
(160, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '../../../../../../../../../boot.ini\0'),
(161, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '/windows/win.ini'),
(162, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '/windows/win.ini\0'),
(163, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '../../../../../../../../../windows/win.ini'),
(164, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '../../../../../../../../../windows/win.ini\0'),
(165, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '|id|'),
(166, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '`id`'),
(167, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', ';id;'),
(168, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '|ping|'),
(169, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '`ping`'),
(170, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', ';id;'),
(171, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '/contacts/ '),
(172, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'contacts/'),
(173, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'contacts/\0'),
(174, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'contacts/.'),
(175, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', 'contacts/ '),
(176, '1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(177, '''', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(178, '"', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(179, '''', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(180, '"', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(181, '\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(182, 'X S', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(183, '<>', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(184, '--', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(185, '2-1 and 1=1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(186, ''' and ''1''=''1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(187, '" and "1"="1', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(188, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(189, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(190, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(191, 'XSS@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(192, 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(193, 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(194, '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(195, '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(196, 'java:xscript(XSS)', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(197, 'myvalue" myattribute="java:xscript(XSS)" ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(198, 'myvalue myattribute=java:xscript(XSS) ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(199, 'myvalue'' myattribute=''java:xscript(XSS)'' ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(200, 'XSS@+xscript-XSS+/xscript-.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(201, 'XSS@+xscript-XSS+/xscript-.com', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(202, '\r\nPTHeader: PTValue', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(203, 'www.idxrnsvu.net', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(204, '/etc/passwd', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(205, '/etc/passwd\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(206, '../../../../../../../../../etc/passwd', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(207, '../../../../../../../../../etc/passwd\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(208, '/boot.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(209, '/boot.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(210, '../../../../../../../../../boot.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(211, '../../../../../../../../../boot.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(212, '/windows/win.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(213, '/windows/win.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(214, '../../../../../../../../../windows/win.ini', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(215, '../../../../../../../../../windows/win.ini\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(216, '|id|', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(217, '`id`', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(218, ';id;', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(219, '|ping|', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(220, '`ping`', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(221, ';id;', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(222, '/contacts ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(223, 'contacts', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(224, 'contacts\0', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(225, 'contacts.', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(226, 'contacts ', 'ptxscan-demo@MjUuNjUuMTk0LjE3NA.com', '1'),
(227, '1', '''', '1'),
(228, '1', '"', '1'),
(229, '1', '''', '1'),
(230, '1', '"', '1'),
(231, '1', '\0', '1'),
(232, '1', 'X S', '1'),
(233, '1', '<>', '1'),
(234, '1', '--', '1'),
(235, '1', '2-1 and 1=1', '1'),
(236, '1', ''' and ''1''=''1', '1'),
(237, '1', '" and "1"="1', '1'),
(238, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(239, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(240, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(241, '1', 'XSS@<xscript>XSS</xscript>.com', '1'),
(242, '1', 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', '1'),
(243, '1', 'XSS@%3cxscript%3eXSS%3c%2fxscript%3e.com', '1'),
(244, '1', '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', '1'),
(245, '1', '[One&Two]=XSS{}+|-=#!$@<xscript>XSS</xscript>.com', '1'),
(246, '1', 'java:xscript(XSS)', '1'),
(247, '1', 'myvalue" myattribute="java:xscript(XSS)" ', '1'),
(248, '1', 'myvalue myattribute=java:xscript(XSS) ', '1'),
(249, '1', 'myvalue'' myattribute=''java:xscript(XSS)'' ', '1'),
(250, '1', 'XSS@+xscript-XSS+/xscript-.com', '1'),
(251, '1', 'XSS@+xscript-XSS+/xscript-.com', '1'),
(252, '1', '\r\nPTHeader: PTValue', '1'),
(253, '1', 'www.akcpteru.net', '1'),
(255, '1', '/etc/passwd', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8 NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `delivery` varchar(70) CHARACTER SET utf8 NOT NULL,
  `payment` varchar(10) CHARACTER SET utf8 NOT NULL,
  `body` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(5) NOT NULL,
  `sum` float(9,2) unsigned NOT NULL,
  `comm` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `is_done` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`phone`,`email`,`delivery`,`payment`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=52 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `email`, `delivery`, `payment`, `body`, `date`, `time`, `sum`, `comm`, `is_done`) VALUES
(8, 'exam1', '0973237486', '7@yjt.com', 'Самовывоз  ', 'Нал.', '(3)JT10070-1', '', '', 50.70, '', 1),
(9, 'ex2', '7654321', '1@bn.com', 'Нова Пошта Харьков 4', 'Нал.', '(2)JT10068-2; (3)JT10070-5', '', '', 456.30, '', 2),
(10, 'ex3', '0567894356', 'uuuu@umfr.com', 'Самовывоз  ', 'Нал.', '(1)JT10066-1', '', '', 100.40, '', 0),
(11, 'tyn', '0567894356', 'sdg@mn.com', 'Самовывоз  ', 'Безнал.', '(1)JT10066-1', '', '', 100.40, '', 0),
(12, 'tyn', '0567894356', 'sdg@mn.com', 'Самовывоз  ', 'Безнал.', '(1)JT10066-1', '', '', 100.40, '', 1),
(13, 'tyn', '0567894356', 'sdg@mn.com', 'Самовывоз  ', 'Безнал.', '(1)JT10066-1', '', '', 100.40, '', 1),
(14, 'rsyj', '0999999999', 'rwr3gq@tr.com', 'Самовывоз  ', 'Нал.', '(4)JT10219-1', '', '', 46.30, '', 1),
(15, '46ujey', '0999999999', 'ebgwt@bf.com', 'Самовывоз  ', 'Карта', '(1)JT10066-1', '', '', 100.40, '', 1),
(16, '5yj', '0973237486', 'joi@gmail.com', 'Самовывоз  ', 'Нал.', '(1)JT10066-1', '', '', 100.40, '', 1),
(17, '5yj', '0973237486', 'joi@gmail.com', 'Самовывоз  ', 'Нал.', '(1)JT10066-1', '', '', 100.40, '', 0),
(18, 'ryj', '5093456', 'ety@mtg.com', 'Самовывоз  ', 'Нал.', '(1)JT10066-1', '', '', 100.40, '', 0),
(19, 'rg  my,,r6,i', '088888888', 'rwynry@fdh.com', 'Самовывоз  ', 'Нал.', '(1)JT10066 -2', '03.02.2016', '04:19', 244.90, '', 1),
(20, '12345', '0567894356', 'ump@ump.cv', 'Самовывоз  ', 'Нал.', '(1)JT10066 -2; (3)JT10068-1', '03.05.2016', '01:31', 322.90, '', 0),
(21, 'yuiopq', '111111111111', 'uvrtb1@gdcpm.ru', 'Самовывоз  ', 'Нал.', '(1)JT10066 -1', '03.05.2016', '01:40', 122.45, '', 0),
(22, '6i,r6umetunu', '000000000000', '7@yjt.com', 'Самовывоз  ', 'Безнал.', '(4)JT10070-1', '03.05.2016', '01:42', 101.30, '', 0),
(23, 'yki68k', '0973237486', '7@yjt.com', 'Нова Пошта wrn 5yh', 'Нал.', '(1)JT10066 -1; (3)JT10068-1', '05.03.2016', '18:28', 200.45, '', 0),
(24, '5yn5ynw4r', '0567894356', '7@yjt.com', 'Нова Пошта w5yh35 5yj', 'Нал.', '(1)JT10066 -1; (3)JT10068-2', '06.03.2016', '00:13', 278.45, '', 1),
(25, '1', '0973237486', 'joi@gmail.com', 'Нова Пошта 111 111', 'Карта', '(2)JT10068 -2', '14.03.2016', '17:41', 140.60, '', 0),
(26, 'ojgrfrr', '0999999999', 'test4@test.com', 'Самовывоз  ', 'Безнал.', '(1)JT10066 -1', '14.03.2016', '22:30', 122.45, 'uytrewq', 0),
(27, 'tyirkrtr6ht', '0123456789', 'oiu@test.com', 'Самовывоз  ', 'Нал.', '(2)JT10068 -1', '14.03.2016', '22:33', 70.30, '', 1),
(28, '7k486k68ol', '0973237486', '7@yjt.com', 'Самовывоз  ', 'Нал.', '(2)JT10068 -2', '14.03.2016', '22:36', 140.60, '', 1),
(29, '24th5ujy53j', '0442347612', 'vgfn@nefi.com', 'Самовывоз  ', 'Нал.', '(1)JT10066 -2', '15.03.2016', '13:51', 244.90, '', 0),
(30, 'ПСергей Пенкин', '380666666666', 'yaebu@yandex.ru', 'Нова Пошта Санкт-Питербург 126', 'Безнал.', '(1)JT10066 -1; (2)JT10068 -3', '16.03.2016', '15:35', 333.35, 'хуй', 2),
(31, 'кноено', '0973237486', 'ump@ump.cv', 'Самовывоз  ', 'Безнал.', '(4)JT10070-1', '18.03.2016', '18:38', 101.30, '', 1),
(32, '111', '111111111111', 'ump@ump.cv', 'Самовывоз  ', 'Нал.', '(4)JT10070-1; (7)JT10120-1', '21.03.2016', '19:04', 246.30, '', 0),
(33, '4tyhbnt', '0973237486', '56@fep.com', 'Самовывоз  ', 'Безнал.', '(4)JT10070-1', '21.03.2016', '19:07', 101.30, '', 2),
(34, '4tnyyhn', '888888888888', 'uvrtb1@gdcpm.ru', 'Самовывоз  ', 'Нал.', '(1)JT10066 -1', '21.03.2016', '19:08', 122.45, '', 2),
(35, 'yuidmtjn', '777777777777', 'jk@YGF.COM', 'Самовывоз  ', 'Нал.', '(5)JT10219-1', '21.03.2016', '19:09', 88.40, '', 2),
(36, 'RRE', '7654321', 'joi@gmail.com', 'Самовывоз  ', 'Нал.', '(5)JT10219-1', '21.03.2016', '19:10', 88.40, '', 2),
(37, 'jm', '000000000000', '7@yjt.com', 'Самовывоз  ', 'Нал.', '(1)JT10066-1', '23.03.2016', '18:53', 122.45, 'ttt', 2),
(38, 'Дядя Вася', '06666666666', 'reptilija@mail.ru', 'Самовывоз  ', 'Безнал.', '(1)JT10066-1; (4)JT10070-1; (5)JT10219-1; (6)JT10144-1', '24.03.2016', '12:53', 413.45, 'Аллаху Акбар!', 2),
(39, 'gasket', '000000000000', 'gasket@gasket.com', 'Самовывоз  ', 'Нал.', '00959600-', '29.03.2016', '15:50', 50.00, '11111', 2),
(40, '24th5ujy53j', '222222222222', '25@rkgte.com', 'Самовывоз  ', 'Нал.', '00561000-2', '29.03.2016', '22:48', 160.00, '', 2),
(41, 'qqqqqqq', '898888888888', 'test2@test.com', 'Самовывоз  ', 'Нал.', '00991300-2', '29.03.2016', '23:21', 100.00, '', 2),
(42, 'uuuuuuuuuuu', '898888888888', '25@rkgte.com', 'Самовывоз  ', 'Нал.', 'TB10194-1', '29.03.2016', '23:24', 100.00, 'yyyyyyy', 2),
(43, 'uuuuuuuuuuu', '777777777777', '25@rkgte.com', 'Самовывоз  ', 'Нал.', 'TB10194-1', '29.03.2016', '23:26', 100.00, 'ygfcxs', 2),
(44, 'его56неуп', '777777777777', 'yrintuyb@tnd.com', 'Самовывоз  ', 'Нал.', 'TB10003-5', '30.03.2016', '13:49', 250.00, '', 2),
(45, 'евртнгт', '111111111111', 'trynrbh@tgtb.com', 'Самовывоз  ', 'Нал.', '00888300-1; 00959700-1', '31.03.2016', '23:42', 150.00, 'ttteeesssttt', 2),
(46, '5yhe5tyh', '6784512', 'uvrtb1@gdcpm.ru', 'Самовывоз  ', 'Нал.', '00888300-1; TB10207-1', '31.03.2016', '23:45', 220.70, '1111', 2),
(47, 'trbhetb', '333333333333', 'ftve@fvn.com', 'Самовывоз  ', 'Нал.', '00888300-2; TB10207-1', '31.03.2016', '23:48', 320.70, 'ttttear', 2),
(48, 'ymgcfyhctg', '555555555555', 'kkostyrskiy@gmail.com', 'Самовывоз  ', 'Нал.', '00888300-30; TB10198-58', '31.03.2016', '23:52', 5.00, 'eeeeeeeeeeeeeeeeee', 2),
(49, 'gfsagaerwe', '111111111111', 'fearwEA@mfkw.com', 'Самовывоз  ', 'Нал.', '(2)JT10068-2; (3)JT10068-2', '01.04.2016', '00:14', 296.60, 'wgqfea', 2),
(50, 'tthynhftb', '444444444444', 'rbysnyhb@eryh.com', 'Самовывоз  ', 'Нал.', '00959600-2; TB10194-2', '01.04.2016', '00:19', 300.00, 'rgwrg', 2),
(51, 't7i7titdi', '855555777777', 'yitfuj@efg.ua', 'Самовывоз  ', 'Нал.', 'TB10207-2; str-2; TB10221-6', '01.04.2016', '00:20', 241.40, 'loui,ymuh', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `annonce` text,
  `content` text,
  `is_published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `alias`, `title`, `annonce`, `content`, `is_published`) VALUES
(10, 'about', 'About us', 'test annonce', 'Test content', 1),
(12, 'ztdryjnzryk', 'xfyjsryj', 'xfyjsryxj', 'rys7rtisr6', 1),
(13, 'xfyuksruk', 'xtuktdukt', 'xtukidtulxfk', 'tdcukutjfhju', 1),
(14, 'xftulxtuk,xtg', 'j.bnyfjh', 'cghiyrck u', 'cguktkufk', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'admin',
  `password` char(32) NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `role`, `password`, `is_active`) VALUES
(1, 'admin', 'admin@store.com', 'admin', 'a8d1b005bd4271323b7e601d1b3490e9', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

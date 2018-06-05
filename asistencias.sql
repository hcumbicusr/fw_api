/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : asistencias

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-06-05 00:07:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of areas
-- ----------------------------

-- ----------------------------
-- Table structure for area_horario
-- ----------------------------
DROP TABLE IF EXISTS `area_horario`;
CREATE TABLE `area_horario` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `area_id` int(10) unsigned NOT NULL,
  `horarios_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  KEY `area_horario_area_id_index` (`area_id`),
  KEY `area_horario_horarios_id_index` (`horarios_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area_horario
-- ----------------------------

-- ----------------------------
-- Table structure for asistencias
-- ----------------------------
DROP TABLE IF EXISTS `asistencias`;
CREATE TABLE `asistencias` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fecha_hora` datetime NOT NULL,
  `nro_dia` int(11) NOT NULL,
  `nro_documento` varchar(50) NOT NULL,
  `lat_lng` varchar(150) default NULL,
  `is_ok` int(11) NOT NULL default '1',
  `mensaje` varchar(250) NOT NULL,
  `dispositivo_identificador` varchar(150) NOT NULL,
  `dispositivo_uuid` varchar(150) default NULL,
  `in_out` enum('IN','OUT') NOT NULL default 'IN',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  KEY `asistencias_nro_documento_index` (`nro_documento`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asistencias
-- ----------------------------
INSERT INTO `asistencias` VALUES ('1', '1990-09-09 08:46:35', '5', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('2', '1984-10-12 05:45:30', '1', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('3', '1973-07-13 02:42:43', '5', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('4', '2007-12-21 06:58:38', '2', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('5', '1997-08-23 06:01:23', '4', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('6', '2002-10-18 08:01:32', '2', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('7', '2004-08-11 03:54:16', '7', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('8', '1986-05-30 20:49:42', '6', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('9', '2002-01-06 15:24:58', '6', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('10', '1970-05-19 11:13:06', '2', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('11', '1978-03-02 21:18:18', '1', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('12', '2003-06-21 07:28:37', '1', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('13', '2014-07-31 14:41:00', '2', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('14', '2001-07-18 01:56:42', '2', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('15', '1998-09-29 08:46:43', '2', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('16', '1986-09-05 07:17:52', '5', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('17', '1994-10-12 19:19:24', '5', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('18', '1999-05-11 16:08:08', '7', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('19', '1979-11-20 03:37:43', '7', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('20', '2003-03-09 06:30:24', '7', '34534532', null, '1', 'ok', 'f878d', null, 'IN', '2018-03-16 03:51:11', '2018-03-16 03:51:11');
INSERT INTO `asistencias` VALUES ('21', '2018-03-15 13:10:00', '4', '24325234', '-51201512,8522626', '0', '[NO_REGISTRADO] Trabajador no registrado!!', 'sd845sdf15s2dfs8df', 'SADAI', 'OUT', '2018-03-15 22:51:14', '2018-03-15 22:51:14');
INSERT INTO `asistencias` VALUES ('22', '2018-03-15 13:10:00', '4', '72345235', '-51201512,8522626', '1', '[OK]', 'sd845sdf15s2dfs8df', 'SADAI', 'OUT', '2018-03-15 22:52:11', '2018-03-15 22:52:11');
INSERT INTO `asistencias` VALUES ('23', '2018-03-15 13:10:00', '4', '72345235', '-51201512,8522626', '0', '[DUPLICADO] Ya se ha registrado una SALIDA: 15-03-2018 01:10:00 PM', 'sd845sdf15s2dfs8df', 'SADAI', 'OUT', '2018-03-15 22:52:24', '2018-03-15 22:52:24');
INSERT INTO `asistencias` VALUES ('24', '2018-03-15 13:10:00', '4', '72345235', '-51201512,8522626', '1', '[OK]', 'sd845sdf15s2dfs8df', 'SADAI', 'IN', '2018-03-15 22:52:43', '2018-03-15 22:52:43');
INSERT INTO `asistencias` VALUES ('25', '2018-03-15 13:10:00', '4', '72345235', '-51201512,8522626', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 15-03-2018 01:10:00 PM', 'sd845sdf15s2dfs8df', 'SADAI', 'IN', '2018-03-15 22:52:45', '2018-03-15 22:52:45');
INSERT INTO `asistencias` VALUES ('26', '2018-03-15 13:16:00', '4', '72345235', '-51201512,8522626', '1', '[OK]', 'sd845sdf15s2dfs8df', 'SADAI', 'IN', '2018-03-15 22:54:05', '2018-03-15 22:54:05');
INSERT INTO `asistencias` VALUES ('27', '2018-03-15 13:16:00', '4', '72345235', '-51201512,8522626', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 15-03-2018 01:16:00 PM', 'sd845sdf15s2dfs8df', 'SADAI', 'IN', '2018-03-15 22:54:07', '2018-03-15 22:54:07');
INSERT INTO `asistencias` VALUES ('28', '2018-03-15 13:16:00', '4', '72345235', '-51201512,8522626', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 15-03-2018 01:16:00 PM', 'sd845sdf15s2dfs8df', 'SADAI', 'IN', '2018-03-15 22:55:18', '2018-03-15 22:55:18');
INSERT INTO `asistencias` VALUES ('29', '2018-03-15 13:20:00', '4', '72345235', '-51201512,8522626', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 15-03-2018 01:16:00 PM', 'sd845sdf15s2dfs8df', 'SADAI', 'IN', '2018-03-15 23:00:24', '2018-03-15 23:00:24');
INSERT INTO `asistencias` VALUES ('30', '2018-03-15 13:22:00', '4', '72345235', '-51201512,8522626', '1', '[OK]', 'sd845sdf15s2dfs8df', 'SADAI', 'IN', '2018-03-15 23:00:28', '2018-03-15 23:00:28');
INSERT INTO `asistencias` VALUES ('31', '2018-03-24 17:27:33', '6', '', '', '0', '[NO_REGISTRADO] Trabajador no registrado!!', '', '', 'IN', '2018-03-24 17:27:33', '2018-03-24 17:27:33');
INSERT INTO `asistencias` VALUES ('32', '2018-03-24 17:30:26', '6', '', '', '0', '[NO_REGISTRADO] Trabajador no registrado!!', '', '', 'IN', '2018-03-24 17:30:26', '2018-03-24 17:30:26');
INSERT INTO `asistencias` VALUES ('33', '2018-03-24 17:31:21', '6', '', '', '0', '[NO_REGISTRADO] Trabajador no registrado!!', '', '', 'IN', '2018-03-24 17:31:21', '2018-03-24 17:31:21');
INSERT INTO `asistencias` VALUES ('34', '2018-03-24 17:34:42', '6', '', '', '0', '[NO_REGISTRADO] Trabajador no registrado!!', '', '', 'IN', '2018-03-24 17:34:42', '2018-03-24 17:34:42');
INSERT INTO `asistencias` VALUES ('35', '2018-03-23 09:10:00', '5', '51234534', '', '1', '[OK]', '', '', 'IN', '2018-03-24 17:35:07', '2018-03-24 17:35:07');
INSERT INTO `asistencias` VALUES ('36', '2018-03-23 09:10:00', '5', '51234534', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 23-03-2018 09:10:00 AM', '', '', 'IN', '2018-03-24 17:35:19', '2018-03-24 17:35:19');
INSERT INTO `asistencias` VALUES ('37', '2018-03-23 09:15:00', '5', '51234534', '', '1', '[OK]', '', '', 'IN', '2018-03-24 17:36:42', '2018-03-24 17:36:42');
INSERT INTO `asistencias` VALUES ('38', '2018-03-23 09:15:00', '5', '51234534', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 23-03-2018 09:15:00 AM', '', '', 'IN', '2018-03-24 17:37:01', '2018-03-24 17:37:01');
INSERT INTO `asistencias` VALUES ('39', '2018-03-23 09:19:00', '5', '51234534', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 23-03-2018 09:15:00 AM', '', '', 'IN', '2018-03-25 00:31:36', '2018-03-25 00:31:36');
INSERT INTO `asistencias` VALUES ('40', '2018-03-25 00:44:17', '7', '72345235', '', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 00:44:16', '2018-03-25 00:44:16');
INSERT INTO `asistencias` VALUES ('41', '2018-03-25 00:44:45', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 12:44:17 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 00:44:44', '2018-03-25 00:44:44');
INSERT INTO `asistencias` VALUES ('42', '2018-03-25 00:44:45', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 12:44:17 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 00:44:44', '2018-03-25 00:44:44');
INSERT INTO `asistencias` VALUES ('43', '2018-03-25 00:47:59', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 12:44:17 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 00:47:58', '2018-03-25 00:47:58');
INSERT INTO `asistencias` VALUES ('44', '2018-03-25 00:47:59', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 12:44:17 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 00:47:58', '2018-03-25 00:47:58');
INSERT INTO `asistencias` VALUES ('45', '2018-03-25 00:49:44', '7', '72345235', '', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 00:49:43', '2018-03-25 00:49:43');
INSERT INTO `asistencias` VALUES ('46', '2018-03-25 00:50:07', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 12:49:44 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 00:50:05', '2018-03-25 00:50:05');
INSERT INTO `asistencias` VALUES ('47', '2018-03-25 01:16:27', '7', '72345235', '', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:16:27', '2018-03-25 01:16:27');
INSERT INTO `asistencias` VALUES ('48', '2018-03-25 01:16:37', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 01:16:27 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:16:36', '2018-03-25 01:16:36');
INSERT INTO `asistencias` VALUES ('49', '2018-03-25 01:17:23', '7', '72345235', '', '1', '[OK]', 'e6bd6173be31d601', '', 'OUT', '2018-03-25 01:17:22', '2018-03-25 01:17:22');
INSERT INTO `asistencias` VALUES ('50', '2018-03-25 01:17:33', '7', '72345235', '', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:17:32', '2018-03-25 01:17:32');
INSERT INTO `asistencias` VALUES ('51', '2018-03-25 01:40:04', '7', '72345235', '', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:40:03', '2018-03-25 01:40:03');
INSERT INTO `asistencias` VALUES ('52', '2018-03-25 01:47:35', '7', '72345235', '', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:47:38', '2018-03-25 01:47:38');
INSERT INTO `asistencias` VALUES ('53', '2018-03-25 01:51:17', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 01:47:35 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:51:17', '2018-03-25 01:51:17');
INSERT INTO `asistencias` VALUES ('54', '2018-03-25 01:51:22', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'OUT', '2018-03-25 01:51:21', '2018-03-25 01:51:21');
INSERT INTO `asistencias` VALUES ('55', '2018-03-25 01:51:24', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:51:24', '2018-03-25 01:51:24');
INSERT INTO `asistencias` VALUES ('56', '2018-03-25 01:51:27', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'OUT', '2018-03-25 01:51:27', '2018-03-25 01:51:27');
INSERT INTO `asistencias` VALUES ('57', '2018-03-25 01:51:29', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:51:29', '2018-03-25 01:51:29');
INSERT INTO `asistencias` VALUES ('58', '2018-03-25 01:54:25', '7', '72345235', '', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 25-03-2018 01:51:29 AM', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:54:25', '2018-03-25 01:54:25');
INSERT INTO `asistencias` VALUES ('59', '2018-03-25 01:54:29', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'OUT', '2018-03-25 01:54:30', '2018-03-25 01:54:30');
INSERT INTO `asistencias` VALUES ('60', '2018-03-25 01:54:33', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:54:32', '2018-03-25 01:54:32');
INSERT INTO `asistencias` VALUES ('61', '2018-03-25 01:54:36', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'OUT', '2018-03-25 01:54:35', '2018-03-25 01:54:35');
INSERT INTO `asistencias` VALUES ('62', '2018-03-25 01:54:38', '7', '72345235', '-5.1806825,-80.6865235', '1', '[OK]', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:54:37', '2018-03-25 01:54:37');
INSERT INTO `asistencias` VALUES ('63', '2018-03-25 01:55:45', '7', '723452351', '', '0', '[NO_REGISTRADO] Trabajador no registrado!!', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:55:44', '2018-03-25 01:55:44');
INSERT INTO `asistencias` VALUES ('64', '2018-03-25 01:55:50', '7', '723452351', '-5.1806825,-80.6865235', '0', '[NO_REGISTRADO] Trabajador no registrado!!', 'e6bd6173be31d601', '', 'IN', '2018-03-25 01:55:49', '2018-03-25 01:55:49');
INSERT INTO `asistencias` VALUES ('65', '2018-03-25 01:55:54', '7', '723452351', '-5.1806825,-80.6865235', '0', '[NO_REGISTRADO] Trabajador no registrado!!', 'e6bd6173be31d601', '', 'OUT', '2018-03-25 01:55:53', '2018-03-25 01:55:53');
INSERT INTO `asistencias` VALUES ('66', '2018-04-28 11:35:08', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '1', '1', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('67', '2018-04-28 11:36:25', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('68', '2018-04-28 11:37:20', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('69', '2018-04-28 11:39:00', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('70', '2018-04-28 11:39:35', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('71', '2018-04-28 11:40:03', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('72', '2018-04-28 11:40:56', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('73', '2018-04-28 11:41:20', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('74', '2018-04-28 11:47:07', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('75', '2018-04-28 11:48:57', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('76', '2018-04-28 11:52:12', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('77', '2018-04-28 12:06:50', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('78', '2018-04-28 12:23:30', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('79', '2018-04-28 12:24:05', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('80', '2018-04-28 12:25:22', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('81', '2018-04-28 12:25:41', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('82', '2018-04-28 12:27:21', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('83', '2018-04-28 12:29:15', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('84', '2018-04-28 12:31:25', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('85', '2018-04-28 12:31:27', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('86', '2018-04-28 12:32:28', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('87', '2018-04-28 12:33:08', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('88', '2018-04-28 12:33:45', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('89', '2018-04-28 12:34:55', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('90', '2018-04-28 12:35:08', '6', '70353606', null, '0', '[NO_REGISTRADO] Trabajador no registrado!!', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('91', '2018-04-28 12:37:38', '6', '72345235', null, '1', '[OK]', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('92', '2018-04-28 12:41:50', '6', '72345235', null, '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 28-04-2018 12:37:38 PM', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('93', '2018-04-28 12:41:57', '6', '72345235', null, '1', '[OK]', '432', '123', 'OUT', null, null);
INSERT INTO `asistencias` VALUES ('94', '2018-04-28 12:42:01', '6', '72345235', null, '1', '[OK]', '432', '123', 'IN', null, null);
INSERT INTO `asistencias` VALUES ('95', '2018-04-28 14:08:47', '6', '72345235', null, '1', '[OK]', 'e6bd6173be31d601', null, 'IN', null, null);
INSERT INTO `asistencias` VALUES ('96', '2018-04-28 14:08:54', '6', '72345235', null, '1', '[OK]', 'e6bd6173be31d601', null, 'OUT', null, null);
INSERT INTO `asistencias` VALUES ('97', '2018-04-28 14:09:51', '6', '72345235', '-5.1806762,-80.6864849', '0', '[DUPLICADO] Ya se ha registrado una SALIDA: 28-04-2018 02:08:54 PM', 'e6bd6173be31d601', null, 'OUT', null, null);
INSERT INTO `asistencias` VALUES ('98', '2018-04-28 14:09:58', '6', '72345235', '-5.1806762,-80.6864849', '1', '[OK]', 'e6bd6173be31d601', null, 'IN', null, null);
INSERT INTO `asistencias` VALUES ('99', '2018-04-28 14:09:59', '6', '72345235', '-5.1806762,-80.6864849', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 28-04-2018 02:09:58 PM', 'e6bd6173be31d601', null, 'IN', null, null);
INSERT INTO `asistencias` VALUES ('100', '2018-05-27 14:17:59', '7', '72345235', null, '1', '[OK]', 'e6bd6173be31d601', null, 'IN', null, null);
INSERT INTO `asistencias` VALUES ('101', '2018-05-27 14:18:07', '7', '72345235', '-5.1806737,-80.6864829', '0', '[DUPLICADO] Ya se ha registrado un INGRESO: 27-05-2018 02:17:59 PM', 'e6bd6173be31d601', null, 'IN', null, null);
INSERT INTO `asistencias` VALUES ('102', '2018-05-27 14:18:25', '7', '72345235', '-5.1806737,-80.6864829', '1', '[OK]', 'e6bd6173be31d601', null, 'OUT', null, null);

-- ----------------------------
-- Table structure for configuraciones
-- ----------------------------
DROP TABLE IF EXISTS `configuraciones`;
CREATE TABLE `configuraciones` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ruc` varchar(250) default NULL,
  `razon_social` varchar(250) NOT NULL,
  `nombre_comercial` varchar(250) default NULL,
  `path_logo` varchar(250) default NULL,
  `tolerancia_min` int(11) NOT NULL default '15',
  `repetir_scan_min` int(11) NOT NULL default '5',
  `zona_horaria` varchar(50) NOT NULL,
  `pais` varchar(50) default NULL,
  `is_horario_estricto` int(11) NOT NULL default '1',
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configuraciones
-- ----------------------------
INSERT INTO `configuraciones` VALUES ('1', null, 'La empresa XYZ SAC', null, null, '15', '5', 'America/Lima', null, '1', '1', '0', '2018-03-16 03:51:09', '2018-03-16 03:51:09');

-- ----------------------------
-- Table structure for dispositivos
-- ----------------------------
DROP TABLE IF EXISTS `dispositivos`;
CREATE TABLE `dispositivos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(150) NOT NULL,
  `identificador` varchar(150) NOT NULL,
  `uuid` varchar(150) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dispositivos
-- ----------------------------

-- ----------------------------
-- Table structure for horarios
-- ----------------------------
DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(250) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime default NULL,
  `is_default` int(11) NOT NULL default '0',
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of horarios
-- ----------------------------
INSERT INTO `horarios` VALUES ('1', 'Horario 1', '2018-03-12 21:00:00', null, '1', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horarios` VALUES ('2', 'Horario 2', '2018-03-12 21:00:00', null, '0', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');

-- ----------------------------
-- Table structure for horario_detalle
-- ----------------------------
DROP TABLE IF EXISTS `horario_detalle`;
CREATE TABLE `horario_detalle` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nro_dia_inicio` int(11) NOT NULL,
  `hora_inicio` varchar(255) default NULL,
  `nro_dia_fin` int(11) NOT NULL,
  `hora_fin` varchar(255) default NULL,
  `horarios_id` int(10) unsigned NOT NULL,
  `tipo` enum('Asistencia','Descanso') NOT NULL default 'Asistencia',
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  KEY `horario_detalle_horarios_id_index` (`horarios_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of horario_detalle
-- ----------------------------
INSERT INTO `horario_detalle` VALUES ('1', '1', '09:00:00', '1', '18:00:00', '1', 'Asistencia', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('2', '2', '09:00:00', '2', '18:00:00', '1', 'Asistencia', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('3', '3', '09:00:00', '3', '18:00:00', '1', 'Asistencia', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('4', '4', '09:00:00', '4', '18:00:00', '1', 'Asistencia', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('5', '5', '09:00:00', '5', '18:00:00', '1', 'Asistencia', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('6', '6', '09:00:00', '6', '18:00:00', '1', 'Asistencia', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('7', '7', '09:00:00', '7', '18:00:00', '1', 'Asistencia', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('8', '1', '13:00:00', '1', '14:00:00', '1', 'Descanso', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('9', '2', '13:00:00', '2', '14:00:00', '1', 'Descanso', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('10', '3', '13:00:00', '3', '14:00:00', '1', 'Descanso', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('11', '4', '13:00:00', '4', '14:00:00', '1', 'Descanso', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('12', '5', '13:00:00', '5', '14:00:00', '1', 'Descanso', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('13', '6', '13:00:00', '6', '14:00:00', '1', 'Descanso', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `horario_detalle` VALUES ('14', '7', '13:00:00', '7', '14:00:00', '1', 'Descanso', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tabla` varchar(50) NOT NULL,
  `id_registro` int(11) NOT NULL,
  `accion` varchar(150) NOT NULL,
  `texto` text,
  `fecha_hora` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  KEY `logs_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=548 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('529', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('530', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('531', '2016_06_01_000001_create_oauth_auth_codes_table', '1');
INSERT INTO `migrations` VALUES ('532', '2016_06_01_000002_create_oauth_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('533', '2016_06_01_000003_create_oauth_refresh_tokens_table', '1');
INSERT INTO `migrations` VALUES ('534', '2016_06_01_000004_create_oauth_clients_table', '1');
INSERT INTO `migrations` VALUES ('535', '2016_06_01_000005_create_oauth_personal_access_clients_table', '1');
INSERT INTO `migrations` VALUES ('536', '2018_03_10_025101_create_permission_tables', '1');
INSERT INTO `migrations` VALUES ('537', '2018_03_10_063600_create_areas_table', '1');
INSERT INTO `migrations` VALUES ('538', '2018_03_10_063633_create_trabajadors_table', '1');
INSERT INTO `migrations` VALUES ('539', '2018_03_10_063654_create_horarios_table', '1');
INSERT INTO `migrations` VALUES ('540', '2018_03_10_063725_create_configuracions_table', '1');
INSERT INTO `migrations` VALUES ('541', '2018_03_10_063739_create_asistencias_table', '1');
INSERT INTO `migrations` VALUES ('542', '2018_03_10_063813_create_logs_table', '1');
INSERT INTO `migrations` VALUES ('543', '2018_03_10_063843_create_trabajador_areas_table', '1');
INSERT INTO `migrations` VALUES ('544', '2018_03_10_063856_create_trabajador_horarios_table', '1');
INSERT INTO `migrations` VALUES ('545', '2018_03_10_063913_create_horario_detalles_table', '1');
INSERT INTO `migrations` VALUES ('546', '2018_03_10_064812_create_dispositivos_table', '1');
INSERT INTO `migrations` VALUES ('547', '2018_03_12_222401_create_area_horarios_table', '1');

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  PRIMARY KEY  (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  PRIMARY KEY  (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES ('4', '1', 'App\\User');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL default NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'registrar_asistencia', 'web', '2018-03-16 03:51:09', '2018-03-16 03:51:09');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'SU', 'web', '2018-03-16 03:51:09', '2018-03-16 03:51:09');
INSERT INTO `roles` VALUES ('2', 'Administrator', 'web', '2018-03-16 03:51:09', '2018-03-16 03:51:09');
INSERT INTO `roles` VALUES ('3', 'RRHH', 'web', '2018-03-16 03:51:09', '2018-03-16 03:51:09');
INSERT INTO `roles` VALUES ('4', 'Asistencia', 'web', '2018-03-16 03:51:09', '2018-03-16 03:51:09');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES ('1', '4');

-- ----------------------------
-- Table structure for trabajadores
-- ----------------------------
DROP TABLE IF EXISTS `trabajadores`;
CREATE TABLE `trabajadores` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `nro_documento` varchar(50) NOT NULL,
  `tipo_documento` varchar(50) NOT NULL,
  `telefono` varchar(50) default NULL,
  `email` varchar(100) default NULL,
  `horario_libre` int(11) NOT NULL default '0',
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trabajadores
-- ----------------------------
INSERT INTO `trabajadores` VALUES ('1', 'Victor', 'Dicki', '72345235', 'DNI', null, null, '0', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `trabajadores` VALUES ('2', 'Kaycee', 'Denesik', '51234534', 'DNI', null, null, '0', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');
INSERT INTO `trabajadores` VALUES ('3', 'Ubaldo', 'Osinski', '72345235', 'DNI', null, null, '0', '1', '0', '2018-03-16 03:51:12', '2018-03-16 03:51:12');

-- ----------------------------
-- Table structure for trabajador_area
-- ----------------------------
DROP TABLE IF EXISTS `trabajador_area`;
CREATE TABLE `trabajador_area` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `areas_id` int(10) unsigned NOT NULL,
  `trabajadores_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  KEY `trabajador_area_areas_id_index` (`areas_id`),
  KEY `trabajador_area_trabajadores_id_index` (`trabajadores_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trabajador_area
-- ----------------------------

-- ----------------------------
-- Table structure for trabajador_horario
-- ----------------------------
DROP TABLE IF EXISTS `trabajador_horario`;
CREATE TABLE `trabajador_horario` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime default NULL,
  `trabajadores_id` int(10) unsigned NOT NULL,
  `horarios_id` int(10) unsigned NOT NULL,
  `is_active` int(11) NOT NULL default '1',
  `is_deleted` int(11) NOT NULL default '0',
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  KEY `trabajador_horario_trabajadores_id_index` (`trabajadores_id`),
  KEY `trabajador_horario_horarios_id_index` (`horarios_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trabajador_horario
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) default NULL,
  `remember_token` varchar(100) default NULL,
  `created_at` timestamp NULL default NULL,
  `updated_at` timestamp NULL default NULL,
  `active` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'asistencia', 'asistencia@hcr.com', 'e10adc3949ba59abbe56e057f20f883e', 'Control de Asistencia', null, '2018-03-16 03:51:10', '2018-03-16 03:51:10', '1');
INSERT INTO `users` VALUES ('2', '', '', 'd41d8cd98f00b204e9800998ecf8427e', null, null, null, null, '1');

-- ----------------------------
-- Table structure for user_token
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(250) NOT NULL,
  `inicio` datetime default NULL,
  `fin` datetime default NULL,
  `active` int(11) NOT NULL default '1',
  `count_request` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` USING BTREE (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_token
-- ----------------------------
INSERT INTO `user_token` VALUES ('1', '1', 'abc123', null, null, '1', null);
INSERT INTO `user_token` VALUES ('2', '1', 'f23bf9caa2f3afe894d52aa4c97ad118', '2018-04-26 22:12:14', null, '1', null);
INSERT INTO `user_token` VALUES ('3', '1', 'ee80a794aee181a1be8bec88904efeb5', '2018-04-26 22:12:35', null, '1', null);
INSERT INTO `user_token` VALUES ('4', '1', '574c57e03f8fe9a251fba3c47ddb2dff', '2018-04-26 22:14:53', null, '1', null);
INSERT INTO `user_token` VALUES ('5', '1', 'afc226b905de4ff41a62d2f4f5541644', '2018-04-26 22:17:12', null, '1', null);
INSERT INTO `user_token` VALUES ('6', '1', '890bf5a7b406cc10bdd98945b023ee79', '2018-04-26 22:17:52', null, '1', null);
INSERT INTO `user_token` VALUES ('7', '1', 'ae1f3a6aff98587980fa756d48f8c552', '2018-04-26 22:18:02', null, '1', null);
INSERT INTO `user_token` VALUES ('8', '1', '2938046a2c05b5dafe6ff91ba0829d40', '2018-04-26 22:18:21', null, '1', '4');
INSERT INTO `user_token` VALUES ('9', '1', '11d6503a8230f1c2be8969e948662ac6', '2018-04-26 22:56:50', null, '1', '2');
INSERT INTO `user_token` VALUES ('10', '1', '3bc6e4f5fb36365adbdad18642ebe49b', '2018-04-27 19:54:14', null, '1', '43');
INSERT INTO `user_token` VALUES ('11', '1', 'c1c55b096272bf31a4a8fee048c8a842', '2018-04-27 20:56:57', null, '1', '61');
INSERT INTO `user_token` VALUES ('12', '1', '5e103b3b4f864074b00176260c870c51', '2018-04-27 23:38:59', null, '1', '3');
INSERT INTO `user_token` VALUES ('13', '1', '32d28985e6238dce7e8221735997b09f', '2018-04-27 23:40:35', null, '1', '2');
INSERT INTO `user_token` VALUES ('14', '1', '1f05cbfee980de6722e30c0dfe3c65c1', '2018-04-27 23:41:58', null, '1', '1');
INSERT INTO `user_token` VALUES ('15', '1', '29cdd97b8842fd7c16d4b7162bf643dd', '2018-04-27 23:43:17', null, '1', '1');
INSERT INTO `user_token` VALUES ('16', '1', '666175abe988ba40e38d8241f510d8b0', '2018-04-28 09:36:42', null, '1', '16');
INSERT INTO `user_token` VALUES ('17', '1', 'ea3b77a7501683c9d4fa2d3f5d0c750e', '2018-04-28 10:34:45', null, '1', '5');
INSERT INTO `user_token` VALUES ('18', '1', '7ad4ad1bce0c2641023b4994a9183e51', '2018-04-28 12:40:41', null, '1', '2');
INSERT INTO `user_token` VALUES ('19', '1', '397a5bb80a7a1d7053802a3366edf7e2', '2018-05-27 14:25:52', null, '1', '12');
INSERT INTO `user_token` VALUES ('20', '1', 'a94faa7781f7245a105970f89b83a1cf', '2018-06-04 23:55:48', null, '1', '3');
INSERT INTO `user_token` VALUES ('21', '1', '9d001fc887b3df343ab3300d6de8f51a', '2018-06-05 00:05:05', null, '1', '5');
INSERT INTO `user_token` VALUES ('22', '1', 'e1b6cbd6fd6188c32314017d9b8c05f9', '2018-06-05 00:05:43', null, '1', '1');

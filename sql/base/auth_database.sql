/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.31 : Database - legion_auth
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sessionkey` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `v` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `s` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '5',
  `mutetime` bigint NOT NULL DEFAULT '0',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recruiter` int unsigned NOT NULL DEFAULT '0',
  `battlenet_account` int unsigned DEFAULT NULL,
  `battlenet_index` tinyint unsigned DEFAULT NULL,
  `mutereason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `muteby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `AtAuthFlag` smallint unsigned NOT NULL DEFAULT '0',
  `coins` int NOT NULL DEFAULT '0',
  `hwid` bigint unsigned NOT NULL DEFAULT '0',
  `limit` tinyint DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `bnet_acc` (`battlenet_account`,`battlenet_index`) USING BTREE,
  KEY `recruiter` (`recruiter`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `battlenet_account` (`battlenet_account`) USING BTREE,
  KEY `battlenet_index` (`battlenet_index`) USING BTREE,
  KEY `username_idx` (`username`) USING BTREE,
  KEY `hwid` (`hwid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Account System';

/*Data for the table `account` */

LOCK TABLES `account` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_access` */

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int unsigned NOT NULL,
  `gmlevel` tinyint unsigned NOT NULL,
  `RealmID` int NOT NULL DEFAULT '-1',
  `comments` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`RealmID`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `RealmID` (`RealmID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_access` */

LOCK TABLES `account_access` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_banned` */

DROP TABLE IF EXISTS `account_banned`;

CREATE TABLE `account_banned` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE,
  KEY `active` (`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Ban List';

/*Data for the table `account_banned` */

LOCK TABLES `account_banned` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_character_template` */

DROP TABLE IF EXISTS `account_character_template`;

CREATE TABLE `account_character_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` int NOT NULL DEFAULT '0',
  `bnet_account` int NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '100',
  `iLevel` mediumint NOT NULL DEFAULT '810',
  `money` int unsigned NOT NULL DEFAULT '100',
  `artifact` tinyint(1) NOT NULL DEFAULT '0',
  `charGuid` int NOT NULL DEFAULT '0',
  `realm` int NOT NULL DEFAULT '0',
  `templateId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `bnet_account` (`bnet_account`) USING BTREE,
  KEY `charGuid` (`charGuid`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_character_template` */

LOCK TABLES `account_character_template` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_flagged` */

DROP TABLE IF EXISTS `account_flagged`;

CREATE TABLE `account_flagged` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Id',
  `banduration` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_flagged` */

LOCK TABLES `account_flagged` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_ip_access` */

DROP TABLE IF EXISTS `account_ip_access`;

CREATE TABLE `account_ip_access` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned DEFAULT NULL,
  `ip` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `max` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pid_ip` (`pid`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_ip_access` */

LOCK TABLES `account_ip_access` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_last_played_character` */

DROP TABLE IF EXISTS `account_last_played_character`;

CREATE TABLE `account_last_played_character` (
  `accountId` int unsigned NOT NULL,
  `region` tinyint unsigned NOT NULL,
  `battlegroup` tinyint unsigned NOT NULL,
  `realmId` int unsigned DEFAULT NULL,
  `characterName` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `characterGUID` bigint unsigned DEFAULT NULL,
  `lastPlayedTime` int unsigned DEFAULT NULL,
  PRIMARY KEY (`accountId`,`region`,`battlegroup`) USING BTREE,
  KEY `accountId` (`accountId`) USING BTREE,
  KEY `region` (`region`) USING BTREE,
  KEY `battlegroup` (`battlegroup`) USING BTREE,
  KEY `realmId` (`realmId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_last_played_character` */

LOCK TABLES `account_last_played_character` WRITE;

insert  into `account_last_played_character`(`accountId`,`region`,`battlegroup`,`realmId`,`characterName`,`characterGUID`,`lastPlayedTime`) values 
(1,2,1,1,'Test',1,1606541006);

UNLOCK TABLES;

/*Table structure for table `account_log_ip` */

DROP TABLE IF EXISTS `account_log_ip`;

CREATE TABLE `account_log_ip` (
  `accountid` int unsigned NOT NULL,
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`accountid`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_log_ip` */

LOCK TABLES `account_log_ip` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_mute` */

DROP TABLE IF EXISTS `account_mute`;

CREATE TABLE `account_mute` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int unsigned NOT NULL DEFAULT '0',
  `mutetime` int unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutereason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='mute List';

/*Data for the table `account_mute` */

LOCK TABLES `account_mute` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_muted` */

DROP TABLE IF EXISTS `account_muted`;

CREATE TABLE `account_muted` (
  `id` int NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` bigint NOT NULL DEFAULT '0',
  `unbandate` bigint NOT NULL DEFAULT '0',
  `bannedby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE,
  KEY `active` (`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Ban List';

/*Data for the table `account_muted` */

LOCK TABLES `account_muted` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_rates` */

DROP TABLE IF EXISTS `account_rates`;

CREATE TABLE `account_rates` (
  `account` int NOT NULL DEFAULT '0',
  `bnet_account` int unsigned NOT NULL DEFAULT '0',
  `realm` int unsigned NOT NULL DEFAULT '0',
  `rate` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `unique` (`account`,`bnet_account`,`realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_rates` */

LOCK TABLES `account_rates` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_reputation` */

DROP TABLE IF EXISTS `account_reputation`;

CREATE TABLE `account_reputation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reputation` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_reputation` */

LOCK TABLES `account_reputation` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_spec` */

DROP TABLE IF EXISTS `account_spec`;

CREATE TABLE `account_spec` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `oldid` int unsigned NOT NULL COMMENT 'Identifier',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sha_pass_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gmlevel` tinyint unsigned NOT NULL DEFAULT '0',
  `sessionkey` longtext COLLATE utf8mb4_unicode_ci,
  `v` longtext COLLATE utf8mb4_unicode_ci,
  `s` longtext COLLATE utf8mb4_unicode_ci,
  `email` mediumtext COLLATE utf8mb4_unicode_ci,
  `email_new` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_module` char(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module_day` mediumint unsigned NOT NULL DEFAULT '0',
  `active_realm_id` int unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '3',
  `mutetime` bigint unsigned NOT NULL DEFAULT '0',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` int unsigned NOT NULL DEFAULT '0',
  `recruiter` int NOT NULL DEFAULT '0',
  `premium` int NOT NULL DEFAULT '0',
  `premium_time` int NOT NULL DEFAULT '0',
  `access_mask` tinyint(1) NOT NULL DEFAULT '0',
  `realmgm` tinyint unsigned NOT NULL DEFAULT '0',
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `sha_new_pass` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `newpassword` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `protectedkey` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `found` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1152679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_spec` */

LOCK TABLES `account_spec` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_spell` */

DROP TABLE IF EXISTS `account_spell`;

CREATE TABLE `account_spell` (
  `accountId` int NOT NULL,
  `spell` int NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountId`,`spell`) USING BTREE,
  KEY `account` (`accountId`) USING BTREE,
  KEY `account_spell` (`accountId`,`spell`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `account_spell` */

LOCK TABLES `account_spell` WRITE;

UNLOCK TABLES;

/*Table structure for table `autobroadcast` */

DROP TABLE IF EXISTS `autobroadcast`;

CREATE TABLE `autobroadcast` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `realmId` int NOT NULL DEFAULT '-1',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_realm_locale_active` (`realmId`,`locale`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `autobroadcast` */

LOCK TABLES `autobroadcast` WRITE;

insert  into `autobroadcast`(`id`,`realmId`,`locale`,`text`,`active`) values 
(1,-1,0,'Tip: Use /help to see available commands.',1),
(2,-1,0,'Reminder: Be respectful in chat and have fun!',1),
(3,-1,0,'Join our community: use /discord to get the link.',1),
(4,-1,1,'팁: /help 로 사용 가능한 명령어를 확인하세요.',1),
(5,-1,1,'알림: 채팅 매너를 지켜주세요. 즐거운 게임 되세요!',1),
(6,-1,1,'커뮤니티 참여: /discord 로 링크를 확인하세요.',1),
(7,-1,2,'Astuce : utilisez /help pour voir les commandes disponibles.',1),
(8,-1,2,'Rappel : restez respectueux sur le chat et amusez-vous !',1),
(9,-1,2,'Rejoignez la communauté : utilisez /discord pour le lien.',1),
(10,-1,3,'Tipp: Mit /help siehst du alle verfügbaren Befehle.',1),
(11,-1,3,'Hinweis: Bitte bleibt respektvoll im Chat – viel Spaß!',1),
(12,-1,3,'Community: Nutze /discord um den Link zu erhalten.',1),
(13,-1,4,'提示：使用 /help 查看可用命令。',1),
(14,-1,4,'提醒：请文明聊天，祝你游戏愉快！',1),
(15,-1,4,'加入社区：输入 /discord 获取链接。',1),
(16,-1,5,'提示：使用 /help 查看可用指令。',1),
(17,-1,5,'提醒：請保持友善聊天，祝你玩得愉快！',1),
(18,-1,5,'加入社群：輸入 /discord 取得連結。',1),
(19,-1,6,'Consejo: usa /help para ver los comandos disponibles.',1),
(20,-1,6,'Recordatorio: sé respetuoso en el chat y ¡diviértete!',1),
(21,-1,6,'Únete a la comunidad: usa /discord para obtener el enlace.',1),
(22,-1,7,'Consejo: usa /help para ver los comandos disponibles.',1),
(23,-1,7,'Recordatorio: sé respetuoso en el chat y ¡pásala bien!',1),
(24,-1,7,'Únete a la comunidad: usa /discord para obtener el enlace.',1),
(25,-1,8,'Совет: используйте /help, чтобы увидеть доступные команды.',1),
(26,-1,8,'Напоминание: уважайте других в чате и приятной игры!',1),
(27,-1,8,'Присоединяйтесь к сообществу: используйте /discord для ссылки.',1),
(28,-1,10,'Dica: use /help para ver os comandos disponíveis.',1),
(29,-1,10,'Lembrete: seja respeitoso no chat e divirta-se!',1),
(30,-1,10,'Entre na comunidade: use /discord para pegar o link.',1),
(31,-1,11,'Suggerimento: usa /help per vedere i comandi disponibili.',1),
(32,-1,11,'Promemoria: sii rispettoso in chat e buon divertimento!',1),
(33,-1,11,'Unisciti alla community: usa /discord per ottenere il link.',1);

UNLOCK TABLES;

/*Table structure for table `battlenet_account_bans` */

DROP TABLE IF EXISTS `battlenet_account_bans`;

CREATE TABLE `battlenet_account_bans` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE,
  KEY `active` (`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Ban List';

/*Data for the table `battlenet_account_bans` */

LOCK TABLES `battlenet_account_bans` WRITE;

UNLOCK TABLES;

/*Table structure for table `battlenet_account_toys` */

DROP TABLE IF EXISTS `battlenet_account_toys`;

CREATE TABLE `battlenet_account_toys` (
  `accountId` int unsigned NOT NULL,
  `itemId` int NOT NULL DEFAULT '0',
  `isFavourite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `battlenet_account_toys` */

LOCK TABLES `battlenet_account_toys` WRITE;

UNLOCK TABLES;

/*Table structure for table `battlenet_accounts` */

DROP TABLE IF EXISTS `battlenet_accounts`;

CREATE TABLE `battlenet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_blocked` int unsigned NOT NULL DEFAULT '0',
  `sha_pass_hash` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `balans` int unsigned NOT NULL DEFAULT '30',
  `karma` int unsigned NOT NULL DEFAULT '0',
  `activate` tinyint unsigned NOT NULL DEFAULT '1',
  `verify` tinyint unsigned NOT NULL DEFAULT '0',
  `tested` tinyint unsigned NOT NULL DEFAULT '0',
  `donate` int unsigned NOT NULL DEFAULT '0',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone_hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telegram_lock` tinyint unsigned NOT NULL DEFAULT '0',
  `telegram_id` int unsigned NOT NULL DEFAULT '0',
  `v` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `s` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sessionKey` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `access_ip` int unsigned NOT NULL DEFAULT '0',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_email` timestamp NULL DEFAULT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recruiter` int NOT NULL DEFAULT '0',
  `invite` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang` enum('tw','cn','en','ua','ru') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ru',
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unsubscribe` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `dt_vote` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `recruiter` (`recruiter`) USING BTREE,
  KEY `email_idx` (`email`) USING BTREE,
  KEY `sha_pass_hash` (`sha_pass_hash`(255)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Account System';

/*Data for the table `battlenet_accounts` */

LOCK TABLES `battlenet_accounts` WRITE;

UNLOCK TABLES;

/*Table structure for table `battlenet_components` */

DROP TABLE IF EXISTS `battlenet_components`;

CREATE TABLE `battlenet_components` (
  `Program` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Platform` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Build` int unsigned NOT NULL,
  PRIMARY KEY (`Program`,`Platform`,`Build`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `battlenet_components` */

LOCK TABLES `battlenet_components` WRITE;

UNLOCK TABLES;

/*Table structure for table `battlenet_modules` */

DROP TABLE IF EXISTS `battlenet_modules`;

CREATE TABLE `battlenet_modules` (
  `Hash` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `System` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Data` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Name`,`System`) USING BTREE,
  UNIQUE KEY `uk_name_type_system` (`Name`,`Type`,`System`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `battlenet_modules` */

LOCK TABLES `battlenet_modules` WRITE;

UNLOCK TABLES;

/*Table structure for table `build_info` */

DROP TABLE IF EXISTS `build_info`;

CREATE TABLE `build_info` (
  `build` int NOT NULL,
  `majorVersion` int DEFAULT NULL,
  `minorVersion` int DEFAULT NULL,
  `bugfixVersion` int DEFAULT NULL,
  `hotfixVersion` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winAuthSeed` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `win64AuthSeed` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac64AuthSeed` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winChecksumSeed` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `macChecksumSeed` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `build_info` */

LOCK TABLES `build_info` WRITE;

insert  into `build_info`(`build`,`majorVersion`,`minorVersion`,`bugfixVersion`,`hotfixVersion`,`winAuthSeed`,`win64AuthSeed`,`mac64AuthSeed`,`winChecksumSeed`,`macChecksumSeed`) values 
(5875,1,12,1,NULL,NULL,NULL,NULL,'95EDB27C7823B363CBDDAB56A392E7CB73FCCA20','8D173CC381961EEBABF336F5E6675B101BB513E5'),
(6005,1,12,2,NULL,NULL,NULL,NULL,NULL,NULL),
(6141,1,12,3,NULL,NULL,NULL,NULL,NULL,NULL),
(8606,2,4,3,NULL,NULL,NULL,NULL,'319AFAA3F2559682F9FF658BE01456255F456FB1','D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),
(9947,3,1,3,NULL,NULL,NULL,NULL,NULL,NULL),
(10505,3,2,2,'a',NULL,NULL,NULL,NULL,NULL),
(11159,3,3,0,'a',NULL,NULL,NULL,NULL,NULL),
(11403,3,3,2,NULL,NULL,NULL,NULL,NULL,NULL),
(11723,3,3,3,'a',NULL,NULL,NULL,NULL,NULL),
(12340,3,3,5,'a',NULL,NULL,NULL,'CDCBBD5188315E6B4D19449D492DBCFAF156A347','B706D13FF2F4018839729461E3F8A0E2B5FDC034'),
(13623,4,0,6,'a',NULL,NULL,NULL,NULL,NULL),
(13930,3,3,5,'a',NULL,NULL,NULL,NULL,NULL),
(14545,4,2,2,NULL,NULL,NULL,NULL,NULL,NULL),
(15595,4,3,4,NULL,NULL,NULL,NULL,NULL,NULL),
(19116,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(19243,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(19342,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(19702,6,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(19802,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),
(19831,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),
(19865,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),
(20182,6,2,0,'a',NULL,NULL,NULL,NULL,NULL),
(20201,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20216,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20253,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20338,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(20444,6,2,2,NULL,NULL,NULL,NULL,NULL,NULL),
(20490,6,2,2,'a',NULL,NULL,NULL,NULL,NULL),
(20574,6,2,2,'a',NULL,NULL,NULL,NULL,NULL),
(20726,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),
(20779,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),
(20886,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),
(21355,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),
(21463,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),
(21742,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),
(22248,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22293,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22345,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22410,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22423,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22498,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22522,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22566,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22594,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22624,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22747,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22810,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),
(22900,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22908,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22950,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22995,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(22996,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23171,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23222,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23360,7,1,5,NULL,NULL,NULL,NULL,NULL,NULL),
(23420,7,1,5,NULL,NULL,NULL,NULL,NULL,NULL),
(23911,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(23937,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(24015,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),
(24330,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24367,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24415,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24430,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24461,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(24742,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),
(25549,7,3,2,NULL,'FE594FC35E7F9AFF86D99D8A364AB297','1252624ED8CBD6FAC7D33F5D67A535F3','66FC5E09B8706126795F140308C8C1D8',NULL,NULL),
(25996,7,3,5,NULL,'23C59C5963CBEF5B728D13A50878DFCB','C7FF932D6A2174A3D538CA7212136D2B','210B970149D6F56CAC9BADF2AAC91E8E',NULL,NULL),
(26124,7,3,5,NULL,'F8C05AE372DECA1D6C81DA7A8D1C5C39','46DF06D0147BA67BA49AF553435E093F','C9CA997AB8EDE1C65465CB2920869C4E',NULL,NULL),
(26365,7,3,5,NULL,'2AAC82C80E829E2CA902D70CFA1A833A','59A53F307288454B419B13E694DF503C','DBE7F860276D6B400AAA86B35D51A417',NULL,NULL),
(26654,7,3,5,NULL,'FAC2D693E702B9EC9F750F17245696D8','A752640E8B99FE5B57C1320BC492895A','9234C1BD5E9687ADBD19F764F2E0E811',NULL,NULL),
(26822,7,3,5,NULL,'283E8D77ECF7060BE6347BE4EB99C7C7','2B05F6D746C0C6CC7EF79450B309E595','91003668C245D14ECD8DF094E065E06B',NULL,NULL),
(26899,7,3,5,NULL,'F462CD2FE4EA3EADF875308FDBB18C99','3551EF0028B51E92170559BD25644B03','8368EFC2021329110A16339D298200D4',NULL,NULL),
(26972,7,3,5,NULL,'797ECC19662DCBD5090A4481173F1D26','6E212DEF6A0124A3D9AD07F5E322F7AE','341CFEFE3D72ACA9A4407DC535DED66A',NULL,NULL),
(28153,8,0,1,NULL,NULL,'DD626517CC6D31932B479934CCDC0ABF',NULL,NULL,NULL),
(30706,8,1,5,NULL,NULL,'BB6D9866FE4A19A568015198783003FC',NULL,NULL,NULL),
(30993,8,2,0,NULL,NULL,'2BAD61655ABC2FC3D04893B536403A91',NULL,NULL,NULL),
(31229,8,2,0,NULL,NULL,'8A46F23670309F2AAE85C9A47276382B',NULL,NULL,NULL),
(31429,8,2,0,NULL,NULL,'7795A507AF9DC3525EFF724FEE17E70C',NULL,NULL,NULL),
(31478,8,2,0,NULL,NULL,'7973A8D54BDB8B798D9297B096E771EF',NULL,NULL,NULL),
(32305,8,2,5,NULL,NULL,'21F5A6FC7AD89FBF411FDA8B8738186A',NULL,NULL,NULL),
(32494,8,2,5,NULL,NULL,'58984ACE04919401835C61309A848F8A',NULL,NULL,NULL),
(32580,8,2,5,NULL,NULL,'87C2FAA0D7931BF016299025C0DDCA14',NULL,NULL,NULL),
(32638,8,2,5,NULL,NULL,'5D07ECE7D4A867DDDE615DAD22B76D4E',NULL,NULL,NULL),
(32722,8,2,5,NULL,NULL,'1A09BE1D38A122586B4931BECCEAD4AA',NULL,NULL,NULL),
(32750,8,2,5,NULL,NULL,'C5CB669F5A5B237D1355430877173207','EF1F4E4D099EA2A81FD4C0DEBC1E7086',NULL,NULL),
(32978,8,2,5,NULL,NULL,'76AE2EA03E525D97F5688843F5489000','1852C1F847E795D6EB45278CD433F339',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `character_history` */

DROP TABLE IF EXISTS `character_history`;

CREATE TABLE `character_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` int NOT NULL,
  `action` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `characterName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `characterGuid` int NOT NULL,
  `characterLevel` tinyint NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastPlayedTime` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `character_history` */

LOCK TABLES `character_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `hwid_penalties` */

DROP TABLE IF EXISTS `hwid_penalties`;

CREATE TABLE `hwid_penalties` (
  `hwid` bigint unsigned NOT NULL,
  `penalties` int NOT NULL DEFAULT '0',
  `last_reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`hwid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `hwid_penalties` */

LOCK TABLES `hwid_penalties` WRITE;

UNLOCK TABLES;

/*Table structure for table `ip2nation` */

DROP TABLE IF EXISTS `ip2nation`;

CREATE TABLE `ip2nation` (
  `ip` int unsigned NOT NULL DEFAULT '0',
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `ip` (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `ip2nation` */

LOCK TABLES `ip2nation` WRITE;

UNLOCK TABLES;

/*Table structure for table `ip2nationcountries` */

DROP TABLE IF EXISTS `ip2nationcountries`;

CREATE TABLE `ip2nationcountries` (
  `code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `iso_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `ip2nationcountries` */

LOCK TABLES `ip2nationcountries` WRITE;

UNLOCK TABLES;

/*Table structure for table `ip_banned` */

DROP TABLE IF EXISTS `ip_banned`;

CREATE TABLE `ip_banned` (
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `bandate` bigint NOT NULL,
  `unbandate` bigint NOT NULL,
  `bannedby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';

/*Data for the table `ip_banned` */

LOCK TABLES `ip_banned` WRITE;

UNLOCK TABLES;

/*Table structure for table `ip_ddos` */

DROP TABLE IF EXISTS `ip_ddos`;

CREATE TABLE `ip_ddos` (
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `ip_ddos` */

LOCK TABLES `ip_ddos` WRITE;

UNLOCK TABLES;

/*Table structure for table `license` */

DROP TABLE IF EXISTS `license`;

CREATE TABLE `license` (
  `id` int NOT NULL,
  `license_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `license` */

LOCK TABLES `license` WRITE;

insert  into `license`(`id`,`license_key`) values 
(1,'C435351425731323032323846355B4934425F4E414B4D205F445B4355444');

UNLOCK TABLES;

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `time` int NOT NULL,
  `realm` int NOT NULL,
  `type` int NOT NULL,
  `level` int NOT NULL DEFAULT '0',
  `string` mediumtext COLLATE utf8mb4_unicode_ci,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `logs` */

LOCK TABLES `logs` WRITE;

UNLOCK TABLES;

/*Table structure for table `motd` */

DROP TABLE IF EXISTS `motd`;

CREATE TABLE `motd` (
  `realmid` int NOT NULL,
  `locale` tinyint unsigned NOT NULL,
  `text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`realmid`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `motd` */

LOCK TABLES `motd` WRITE;

insert  into `motd`(`realmid`,`locale`,`text`) values 
(-1,0,'Welcome to Minerva'),
(-1,1,'미네르바에 오신 것을 환영합니다'),
(-1,2,'Bienvenue sur Minerva'),
(-1,3,'Willkommen auf Minerva'),
(-1,4,'欢迎来到米涅瓦'),
(-1,5,'歡迎來到米涅瓦'),
(-1,6,'Bienvenido a Minerva'),
(-1,7,'Bienvenido a Minerva'),
(-1,8,'Добро пожаловать на Минерву'),
(-1,9,'Welcome to Minerva'),
(-1,10,'Bem-vindo à Minerva'),
(-1,11,'Benvenuto su Minerva');

UNLOCK TABLES;

/*Table structure for table `online` */

DROP TABLE IF EXISTS `online`;

CREATE TABLE `online` (
  `realmID` int unsigned NOT NULL DEFAULT '0',
  `online` int unsigned NOT NULL DEFAULT '0',
  `diff` int unsigned NOT NULL DEFAULT '0',
  `uptime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `online` */

LOCK TABLES `online` WRITE;

UNLOCK TABLES;

/*Table structure for table `realm_transfer` */

DROP TABLE IF EXISTS `realm_transfer`;

CREATE TABLE `realm_transfer` (
  `from_realm` tinyint unsigned NOT NULL DEFAULT '0',
  `to_realm` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`from_realm`,`to_realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `realm_transfer` */

LOCK TABLES `realm_transfer` WRITE;

UNLOCK TABLES;

/*Table structure for table `realmcharacters` */

DROP TABLE IF EXISTS `realmcharacters`;

CREATE TABLE `realmcharacters` (
  `realmid` int unsigned NOT NULL DEFAULT '0',
  `acctid` int unsigned NOT NULL,
  `numchars` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`) USING BTREE,
  KEY `acctid` (`acctid`) USING BTREE,
  KEY `realmid` (`realmid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';

/*Data for the table `realmcharacters` */

LOCK TABLES `realmcharacters` WRITE;

insert  into `realmcharacters`(`realmid`,`acctid`,`numchars`) values 
(1,1,1);

UNLOCK TABLES;

/*Table structure for table `realmlist` */

DROP TABLE IF EXISTS `realmlist`;

CREATE TABLE `realmlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `port` smallint unsigned NOT NULL DEFAULT '8085',
  `gamePort` int NOT NULL DEFAULT '8086',
  `portCount` mediumint unsigned NOT NULL DEFAULT '1',
  `icon` tinyint unsigned NOT NULL DEFAULT '0',
  `flag` tinyint unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int unsigned NOT NULL DEFAULT '12340',
  `Region` tinyint unsigned NOT NULL DEFAULT '2',
  `Battlegroup` tinyint unsigned NOT NULL DEFAULT '1',
  `localAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '255.255.255.0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_name` (`name`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Realm System';

/*Data for the table `realmlist` */

LOCK TABLES `realmlist` WRITE;

insert  into `realmlist`(`id`,`name`,`address`,`port`,`gamePort`,`portCount`,`icon`,`flag`,`timezone`,`allowedSecurityLevel`,`population`,`gamebuild`,`Region`,`Battlegroup`,`localAddress`,`localSubnetMask`) values 
(1,'Nordrassil Work Server','192.168.178.25',8085,8086,1,0,0,1,0,0,26972,2,1,'127.0.0.1','255.255.255.0');

UNLOCK TABLES;

/*Table structure for table `store_categories` */

DROP TABLE IF EXISTS `store_categories`;

CREATE TABLE `store_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `sort` int unsigned NOT NULL DEFAULT '0',
  `faction` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '6',
  `enable` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_categories` */

LOCK TABLES `store_categories` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_category_locales` */

DROP TABLE IF EXISTS `store_category_locales`;

CREATE TABLE `store_category_locales` (
  `category` int NOT NULL DEFAULT '0',
  `name_us` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_gb` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_kr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_fr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_de` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_cn` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_tw` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_es` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_mx` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_ru` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_pt` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_br` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_it` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_ua` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_us` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_gb` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_kr` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_fr` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_de` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_cn` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_tw` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_es` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_mx` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_ru` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_pt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_br` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_it` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description_ua` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_category_locales` */

LOCK TABLES `store_category_locales` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_category_realms` */

DROP TABLE IF EXISTS `store_category_realms`;

CREATE TABLE `store_category_realms` (
  `category` int NOT NULL DEFAULT '0',
  `realm` int unsigned NOT NULL DEFAULT '0',
  `return` tinyint unsigned NOT NULL DEFAULT '0',
  `enable` tinyint unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `unique` (`category`,`realm`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_category_realms` */

LOCK TABLES `store_category_realms` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_discounts` */

DROP TABLE IF EXISTS `store_discounts`;

CREATE TABLE `store_discounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `realm` int unsigned NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0',
  `product` int NOT NULL DEFAULT '0',
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `rate` float(5,2) unsigned NOT NULL DEFAULT '0.00',
  `enable` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_discounts` */

LOCK TABLES `store_discounts` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_favorites` */

DROP TABLE IF EXISTS `store_favorites`;

CREATE TABLE `store_favorites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `realm` int unsigned NOT NULL DEFAULT '0',
  `product` int NOT NULL DEFAULT '0',
  `acid` int unsigned NOT NULL,
  `bacid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`realm`,`product`,`acid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_favorites` */

LOCK TABLES `store_favorites` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_history` */

DROP TABLE IF EXISTS `store_history`;

CREATE TABLE `store_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `realm` int unsigned NOT NULL,
  `account` int unsigned NOT NULL,
  `bnet_account` int unsigned NOT NULL DEFAULT '0',
  `char_guid` int unsigned NOT NULL DEFAULT '0',
  `char_level` int unsigned NOT NULL DEFAULT '0',
  `art_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `guild_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `item_guid` int unsigned DEFAULT NULL,
  `item` int NOT NULL DEFAULT '0',
  `bonus` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product` int NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '1',
  `token` int unsigned NOT NULL,
  `karma` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `type` enum('cp','game') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'game',
  `trans_project` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `trans_realm` int unsigned NOT NULL DEFAULT '0',
  `dt_buy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_return` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `item_guid` (`item_guid`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `bnet_account` (`bnet_account`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `char_guid` (`char_guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_history` */

LOCK TABLES `store_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_level_prices` */

DROP TABLE IF EXISTS `store_level_prices`;

CREATE TABLE `store_level_prices` (
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `realm` int unsigned NOT NULL DEFAULT '0',
  `level` smallint unsigned NOT NULL DEFAULT '0',
  `token` int unsigned NOT NULL DEFAULT '0',
  `karma` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `unique` (`type`,`realm`,`level`,`token`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_level_prices` */

LOCK TABLES `store_level_prices` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_product_locales` */

DROP TABLE IF EXISTS `store_product_locales`;

CREATE TABLE `store_product_locales` (
  `product` int NOT NULL DEFAULT '0',
  `type` smallint NOT NULL DEFAULT '0',
  `us` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gb` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `kr` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fr` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `de` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cn` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tw` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `es` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mx` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ru` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `br` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `it` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ua` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`product`,`type`) USING BTREE,
  UNIQUE KEY `unique` (`product`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_product_locales` */

LOCK TABLES `store_product_locales` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_product_realms` */

DROP TABLE IF EXISTS `store_product_realms`;

CREATE TABLE `store_product_realms` (
  `product` int NOT NULL DEFAULT '0',
  `realm` int unsigned NOT NULL DEFAULT '0',
  `token` int unsigned NOT NULL DEFAULT '0',
  `karma` int unsigned NOT NULL DEFAULT '0',
  `return` tinyint unsigned NOT NULL DEFAULT '0',
  `enable` tinyint unsigned NOT NULL DEFAULT '1',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique` (`realm`,`product`) USING BTREE,
  KEY `product` (`product`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_product_realms` */

LOCK TABLES `store_product_realms` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_products` */

DROP TABLE IF EXISTS `store_products`;

CREATE TABLE `store_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL DEFAULT '0',
  `item` int NOT NULL DEFAULT '0',
  `bonus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quality` tinyint unsigned NOT NULL DEFAULT '0',
  `display` int unsigned NOT NULL DEFAULT '0',
  `slot` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `token` int unsigned NOT NULL DEFAULT '0',
  `karma` int unsigned NOT NULL DEFAULT '0',
  `enable` tinyint unsigned NOT NULL DEFAULT '1',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `faction` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`category`,`item`,`bonus`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_products` */

LOCK TABLES `store_products` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_purchase_history` */

DROP TABLE IF EXISTS `store_purchase_history`;

CREATE TABLE `store_purchase_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account` int unsigned NOT NULL,
  `bnetaccountId` int unsigned NOT NULL DEFAULT '0',
  `charGuid` int unsigned NOT NULL DEFAULT '0',
  `charLevel` int unsigned NOT NULL DEFAULT '0',
  `productId` int NOT NULL DEFAULT '0',
  `balanceInitial` int unsigned NOT NULL,
  `balanceEnd` int unsigned NOT NULL DEFAULT '0',
  `charRace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charFaction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DatePurchase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `bnet_account` (`bnetaccountId`) USING BTREE,
  KEY `char_guid` (`charGuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_purchase_history` */

LOCK TABLES `store_purchase_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_rating` */

DROP TABLE IF EXISTS `store_rating`;

CREATE TABLE `store_rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `realm` int unsigned NOT NULL DEFAULT '0',
  `product` int NOT NULL DEFAULT '0',
  `rating` tinyint unsigned NOT NULL DEFAULT '0',
  `acid` int unsigned NOT NULL,
  `bacid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`realm`,`product`,`acid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_rating` */

LOCK TABLES `store_rating` WRITE;

UNLOCK TABLES;

/*Table structure for table `store_statistics` */

DROP TABLE IF EXISTS `store_statistics`;

CREATE TABLE `store_statistics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL DEFAULT '0',
  `realm` int unsigned NOT NULL DEFAULT '0',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `rating_value` int unsigned NOT NULL DEFAULT '0',
  `buy` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`realm`,`product`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `store_statistics` */

LOCK TABLES `store_statistics` WRITE;

UNLOCK TABLES;

/*Table structure for table `updates` */

DROP TABLE IF EXISTS `updates`;

CREATE TABLE `updates` (
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='List of all applied updates in this database.';

/*Data for the table `updates` */

LOCK TABLES `updates` WRITE;

insert  into `updates`(`name`,`hash`,`state`,`timestamp`,`speed`) values 
('2026_01_12_00_auth.sql','6A8AB7DC6AE194D37233C63506CAF7D51E4ED519','RELEASED','2026-01-19 07:43:49',284),
('2026_01_18_00_auth.sql','A6D52F899C3E643074D9E1534DCFFABA360FB4A0','RELEASED','2026-01-19 07:43:49',365),
('2026_01_18_01_auth.sql','B6244ED65B0626B19A5DEABA128E7D250157581F','RELEASED','2026-01-19 07:43:50',124);

UNLOCK TABLES;

/*Table structure for table `updates_include` */

DROP TABLE IF EXISTS `updates_include`;

CREATE TABLE `updates_include` (
  `path` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='List of directories where we want to include sql updates.';

/*Data for the table `updates_include` */

LOCK TABLES `updates_include` WRITE;

insert  into `updates_include`(`path`,`state`) values 
('$/sql/updates/auth','RELEASED');

UNLOCK TABLES;

/*Table structure for table `uptime` */

DROP TABLE IF EXISTS `uptime`;

CREATE TABLE `uptime` (
  `realmid` int unsigned NOT NULL,
  `starttime` bigint unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uptime` bigint unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Uptime system';

/*Data for the table `uptime` */

LOCK TABLES `uptime` WRITE;

insert  into `uptime`(`realmid`,`starttime`,`startstring`,`uptime`,`maxplayers`,`revision`) values 
(1,1604238978,NULL,0,0,'TrinityCore rev. v.1.0r-426b53bed7 2020-10-31 23:08:09 -0400 ( branch) (Win64, RelWithDebInfo)'),
(1,1606540384,NULL,0,0,'TrinityCore rev. Archived 0000-00-00 00:00:00 +0000 ( branch) (Win64, RelWithDebInfo)'),
(1,1606540451,NULL,0,0,'TrinityCore rev. Archived 0000-00-00 00:00:00 +0000 ( branch) (Win64, RelWithDebInfo)'),
(1,1606540845,NULL,0,0,'TrinityCore rev. Archived 0000-00-00 00:00:00 +0000 ( branch) (Win64, RelWithDebInfo)'),
(1,1767383315,NULL,0,0,'TrinityCore rev. DestinyCore (Win64, RelWithDebInfo)'),
(1,1768805034,NULL,0,0,'TrinityCore rev. DestinyCore (Win64, RelWithDebInfo)'),
(1,1768805435,NULL,0,0,'TrinityCore rev. DestinyCore (Win64, RelWithDebInfo)');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

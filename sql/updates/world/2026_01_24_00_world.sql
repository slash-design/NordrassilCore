DROP TABLE IF EXISTS `spell_summon_position`;
CREATE TABLE `spell_summon_position` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `EffectIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  `PhaseID` smallint NOT NULL,
  `Auras` text,
  `VerifiedBuild` smallint DEFAULT '0',
  PRIMARY KEY (`ID`,`EffectIndex`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci
  ROW_FORMAT=DYNAMIC
  COMMENT='Spell System';
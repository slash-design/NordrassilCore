DROP TABLE IF EXISTS `area_p_o_i`;
CREATE TABLE `area_p_o_i` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Name` text,
  `Description` text,
  `Flags` int(11) NOT NULL DEFAULT '0',
  `Pos1` float NOT NULL DEFAULT '0',
  `Pos2` float NOT NULL DEFAULT '0',
  `Pos3` float NOT NULL DEFAULT '0',
  `PoiDataType` int(11) NOT NULL DEFAULT '0',
  `PoiData` int(11) NOT NULL DEFAULT '0',
  `ContinentID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AreaID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WorldStateID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PortLocID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Importance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int(11) NOT NULL DEFAULT '0',
  `UiTextureAtlasMemberID` int(11) NOT NULL DEFAULT '0',
  `MapFloor` int(11) NOT NULL DEFAULT '0',
  `WmoGroupID` int(11) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `area_p_o_i_state`;
CREATE TABLE `area_p_o_i_state` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Description` text,
  `WorldStateValue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `IconEnumValue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UiTextureAtlasMemberID` int(11) NOT NULL DEFAULT '0',
  `RelationshipData` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


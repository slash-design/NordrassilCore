-- spell_linked_spell
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 55342;

-- spell_script_names
DELETE FROM `spell_script_names` WHERE `spell_id` = 55342;
INSERT INTO `spell_script_names` (spell_id, ScriptName) VALUES (55342, 'spell_mage_mirror_image_summon');

-- creature_template
UPDATE `creature_template` SET `ScriptName`='npc_mage_mirror_image' WHERE (`entry`='31216');
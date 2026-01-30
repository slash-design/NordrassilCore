-- spell_script_names
DELETE FROM `spell_script_names` WHERE `spell_id` IN (203095, 204463, 203096, 204470);

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
('203095', 'spell_nythendra_rot_SpellScript'),
('204463', 'spell_nythendra_volatile_rot'),
('203096', 'spell_nythendra_rot'),
('204470', 'spell_nythendra_volatile_rot_dmg'),
('204470', 'spell_nythendra_infested');
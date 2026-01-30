-- spell_script_names
DELETE FROM `spell_script_names` WHERE `spell_id`='215307';
DELETE FROM `spell_script_names` WHERE `spell_id`='215300';

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
('215300', 'spell_elerethe_web_of_pain_trigger'),
('215307', 'spell_elerethe_web_of_pain_base');
-- spell_script_names
DELETE FROM `spell_script_names` WHERE (`spell_id`='257213');
DELETE FROM `spell_script_names` WHERE (`spell_id`='257214');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
('257213', 'spell_argus_titanforging_energize_controller'),
('257214', 'spell_argus_titanforging_energy_reducer');
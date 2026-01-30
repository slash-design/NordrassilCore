-- spell_script_names
DELETE FROM `spell_script_names` WHERE (`spell_id`='235113');
DELETE FROM `spell_script_names` WHERE (`spell_id`='235620');
DELETE FROM `spell_script_names` WHERE (`spell_id`='235732');
DELETE FROM `spell_script_names` WHERE (`spell_id`='235734');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
('235113', 'spell_tos_spiritual_barrier_dissonance_visual_aura'),
('235620', 'spell_tos_spiritual_barrier_dissonance_visual_aura'),
('235732', 'spell_tos_spiritual_barrier_dissonance_phase_aura'),
('235734', 'spell_tos_spiritual_barrier_dissonance_phase_aura');
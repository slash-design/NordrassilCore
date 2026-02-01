DELETE FROM `command` WHERE `name`='reload mail_server_template';
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('reload mail_server_template', 3, 'Syntax: .reload mail_server_template\nReload server_mail_template table.');

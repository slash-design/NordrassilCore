-- MOTD
CREATE TABLE IF NOT EXISTS `motd` (
  `realmid` INT NOT NULL,
  `locale` TINYINT UNSIGNED NOT NULL,
  `text` TEXT NOT NULL,
  PRIMARY KEY (`realmid`, `locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

REPLACE INTO motd (realmid, locale, text) VALUES
(-1, 0, 'Welcome to Minerva'),
(-1, 1, '미네르바에 오신 것을 환영합니다'),
(-1, 2, 'Bienvenue sur Minerva'),
(-1, 3, 'Willkommen auf Minerva'),
(-1, 4, '欢迎来到米涅瓦'),
(-1, 5, '歡迎來到米涅瓦'),
(-1, 6, 'Bienvenido a Minerva'),
(-1, 7, 'Bienvenido a Minerva'),
(-1, 8, 'Добро пожаловать на Минерву'),
(-1, 9, 'Welcome to Minerva'),
(-1, 10, 'Bem-vindo à Minerva'),
(-1, 11, 'Benvenuto su Minerva');
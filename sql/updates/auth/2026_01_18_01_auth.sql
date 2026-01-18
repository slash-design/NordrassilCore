DROP TABLE IF EXISTS `autobroadcast`;

CREATE TABLE `autobroadcast` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  realmId INT NOT NULL DEFAULT -1,
  locale TINYINT UNSIGNED NOT NULL DEFAULT 0,
  text TEXT NOT NULL,
  active TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  KEY idx_realm_locale_active (realmId, locale, active)
);

INSERT INTO `autobroadcast` (`realmId`, `locale`, `text`, `active`) VALUES
-- enUS (0)
(-1, 0, 'Tip: Use /help to see available commands.', 1),
(-1, 0, 'Reminder: Be respectful in chat and have fun!', 1),
(-1, 0, 'Join our community: use /discord to get the link.', 1),

-- koKR (1)
(-1, 1, '팁: /help 로 사용 가능한 명령어를 확인하세요.', 1),
(-1, 1, '알림: 채팅 매너를 지켜주세요. 즐거운 게임 되세요!', 1),
(-1, 1, '커뮤니티 참여: /discord 로 링크를 확인하세요.', 1),

-- frFR (2)
(-1, 2, 'Astuce : utilisez /help pour voir les commandes disponibles.', 1),
(-1, 2, 'Rappel : restez respectueux sur le chat et amusez-vous !', 1),
(-1, 2, 'Rejoignez la communauté : utilisez /discord pour le lien.', 1),

-- deDE (3)
(-1, 3, 'Tipp: Mit /help siehst du alle verfügbaren Befehle.', 1),
(-1, 3, 'Hinweis: Bitte bleibt respektvoll im Chat – viel Spaß!', 1),
(-1, 3, 'Community: Nutze /discord um den Link zu erhalten.', 1),

-- zhCN (4)
(-1, 4, '提示：使用 /help 查看可用命令。', 1),
(-1, 4, '提醒：请文明聊天，祝你游戏愉快！', 1),
(-1, 4, '加入社区：输入 /discord 获取链接。', 1),

-- zhTW (5)
(-1, 5, '提示：使用 /help 查看可用指令。', 1),
(-1, 5, '提醒：請保持友善聊天，祝你玩得愉快！', 1),
(-1, 5, '加入社群：輸入 /discord 取得連結。', 1),

-- esES (6)
(-1, 6, 'Consejo: usa /help para ver los comandos disponibles.', 1),
(-1, 6, 'Recordatorio: sé respetuoso en el chat y ¡diviértete!', 1),
(-1, 6, 'Únete a la comunidad: usa /discord para obtener el enlace.', 1),

-- esMX (7)
(-1, 7, 'Consejo: usa /help para ver los comandos disponibles.', 1),
(-1, 7, 'Recordatorio: sé respetuoso en el chat y ¡pásala bien!', 1),
(-1, 7, 'Únete a la comunidad: usa /discord para obtener el enlace.', 1),

-- ruRU (8)
(-1, 8, 'Совет: используйте /help, чтобы увидеть доступные команды.', 1),
(-1, 8, 'Напоминание: уважайте других в чате и приятной игры!', 1),
(-1, 8, 'Присоединяйтесь к сообществу: используйте /discord для ссылки.', 1),

-- ptBR (10)
(-1, 10, 'Dica: use /help para ver os comandos disponíveis.', 1),
(-1, 10, 'Lembrete: seja respeitoso no chat e divirta-se!', 1),
(-1, 10, 'Entre na comunidade: use /discord para pegar o link.', 1),

-- itIT (11)
(-1, 11, 'Suggerimento: usa /help per vedere i comandi disponibili.', 1),
(-1, 11, 'Promemoria: sii rispettoso in chat e buon divertimento!', 1),
(-1, 11, 'Unisciti alla community: usa /discord per ottenere il link.', 1);

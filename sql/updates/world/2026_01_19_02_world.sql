-- command
UPDATE command SET name = 'reload page_text_locale', help = 'Syntax: .reload page_text_locale\nReload page_text_locale table.'  WHERE `name` ='reload locales_page_text';

-- locales_page_text
DROP TABLE IF EXISTS `locales_page_text`;
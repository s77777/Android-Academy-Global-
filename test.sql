-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Мар 12 2021 г., 08:07
-- Версия сервера: 8.0.23-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ads_campaign`
--

CREATE TABLE `ads_campaign` (
  `id` int NOT NULL,
  `ads_room_id` int UNSIGNED NOT NULL,
  `ads_campaign_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `daily_limit` smallint DEFAULT NULL,
  `Ad_limit` decimal(11,2) NOT NULL DEFAULT '0.00',
  `cost_per_show` decimal(11,2) DEFAULT '0.00',
  `status` varchar(50) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_stop` datetime DEFAULT NULL,
  `ads_place` varchar(50) DEFAULT NULL,
  `limit_show` int DEFAULT NULL,
  `theme` text,
  `target_group` int UNSIGNED DEFAULT NULL,
  `cities` text,
  `dmh_gender` tinyint UNSIGNED DEFAULT NULL,
  `dmh_gender_age_start` tinyint UNSIGNED DEFAULT NULL,
  `dmh_gender_age_end` tinyint UNSIGNED DEFAULT NULL,
  `interest_category` text,
  `link` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ads_campaign`
--

INSERT INTO `ads_campaign` (`id`, `ads_room_id`, `ads_campaign_name`, `daily_limit`, `Ad_limit`, `cost_per_show`, `status`, `date_start`, `date_stop`, `ads_place`, `limit_show`, `theme`, `target_group`, `cities`, `dmh_gender`, `dmh_gender_age_start`, `dmh_gender_age_end`, `interest_category`, `link`) VALUES
(1, 1, 'Мои объявления', 0, '300.00', '1.21', '0', NULL, NULL, '0', 100, 'Товары для мам и малышей (Детские товары и услуги)', 4031000, 'Россия', 2, 18, 45, 'Дом и семья, Красота и мода, Развлечения, Товары и услуги', 'https://example.com/tr/tr');

-- --------------------------------------------------------

--
-- Структура таблицы `ads_rooms`
--

CREATE TABLE `ads_rooms` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `ads_room_name` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ads_rooms`
--

INSERT INTO `ads_rooms` (`id`, `userid`, `ads_room_name`) VALUES
(1, 1, 'Покупай на Aliexpress');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(128) NOT NULL,
  `psw` char(128) NOT NULL,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `foto` varchar(50) DEFAULT NULL,
  `access_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `psw`, `first_name`, `last_name`, `foto`, `access_token`) VALUES
(1, '926113\\@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Test', 'Test', 'sw.jpg', '7a6fa4dff77a228eeda56603b8f53806c883f011c40b72630bb50df056f6479e52a');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ads_campaign`
--
ALTER TABLE `ads_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcompany_idx` (`ads_room_id`);
ALTER TABLE `ads_campaign` ADD FULLTEXT KEY `ads_room_name_idx` (`ads_campaign_name`);

--
-- Индексы таблицы `ads_rooms`
--
ALTER TABLE `ads_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_rooms_userid_idx` (`userid`);
ALTER TABLE `ads_rooms` ADD FULLTEXT KEY `ads_room_name_idx` (`ads_room_name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ads_campaign`
--
ALTER TABLE `ads_campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ads_rooms`
--
ALTER TABLE `ads_rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

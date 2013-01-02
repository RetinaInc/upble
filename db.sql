
CREATE TABLE `biz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) DEFAULT '0',
  `catid_1` smallint(6) NOT NULL DEFAULT '0',
  `catid_2` smallint(6) NOT NULL DEFAULT '0',
  `city_id` smallint(6) NOT NULL DEFAULT '0',
  `district_id` smallint(6) NOT NULL DEFAULT '0',
  `addrs1` varchar(225) NOT NULL DEFAULT '',
  `addrs2` varchar(225) NOT NULL DEFAULT '',
  `website` varchar(225) NOT NULL DEFAULT '',
  `tel` varchar(225) NOT NULL DEFAULT '',
  `location_x` varchar(225) NOT NULL DEFAULT '',
  `location_y` varchar(225) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `about` text,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `district_id` (`district_id`),
  KEY `catid_1` (`catid_1`),
  KEY `catid_2` (`catid_2`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
--  `category`
--

CREATE TABLE `category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `slug` varchar(20) NOT NULL DEFAULT '',
  `parent_id` smallint(6) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
--  `city`
--

CREATE TABLE `city` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `slug` varchar(20) NOT NULL DEFAULT '',
  `parent_id` smallint(6) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
--  `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) DEFAULT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;





-- --------------------------------------------------------

--
--  `feeds`
--

CREATE TABLE `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `objectid` varchar(50) NOT NULL DEFAULT '',
  `feed_type` varchar(225) NOT NULL,
  `feed_data` varchar(225) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `feed_type` (`feed_type`),
  KEY `objectid` (`objectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
--  `flower`
--

CREATE TABLE `flower` (
  `objectid` varchar(50) NOT NULL DEFAULT '',
  `sender` int(11) NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT 'review',
  `receiver` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`objectid`,`sender`,`idtype`),
  KEY `receiver` (`receiver`),
  KEY `objectid` (`objectid`,`idtype`),
  KEY `created_at` (`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
--  `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `fid` int(11) NOT NULL,
  `fusername` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
--  `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
--  `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `touid` int(11) NOT NULL DEFAULT '0',
  `tousername` varchar(20) NOT NULL,
  `title` varchar(225) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `inbox` tinyint(1) NOT NULL DEFAULT '1',
  `sentbox` tinyint(1) NOT NULL DEFAULT '1',
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`sentbox`),
  KEY `touid` (`touid`,`inbox`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------



--
--  `news_cats`
--

CREATE TABLE `news_cats` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `slug` varchar(20) NOT NULL DEFAULT '',
  `parent_id` smallint(6) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
--  `photo`
--

CREATE TABLE `photo` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `bizid` int(11) NOT NULL DEFAULT '0',
  `caption` varchar(225) DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `flower` int(11) DEFAULT '0',
  `folder` varchar(10) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  key(`bizid`),
  KEY `created_at` (`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------



--
--  `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(225) NOT NULL DEFAULT '',
  `comment` varchar(225) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
--  `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bizid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `rating` tinyint(4) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `response` text NOT NULL,
  `flower` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `bizid` (`bizid`),
  KEY `created_at` (`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------


-- --------------------------------------------------------

--
--  `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
--  `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(1, 'admin', '$P$BavHX4aZP3ykVh6RbmeFG7V.wGXAXe1', 'admin', 'admin@mail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2012-12-03 22:33:14', '2012-11-12 21:16:56', '2012-12-03 14:33:14');

-- --------------------------------------------------------

--
--  `user_autologin`
--

CREATE TABLE `user_autologin` (
  `key_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
--  `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT '0',
  `newpm` smallint(6) NOT NULL DEFAULT '0',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `about_me` text NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
--  `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `username`, `score`, `newpm`, `city`, `country`, `website`, `about_me`, `created_at`) VALUES
(1, 1, 'admin', 0, 0, '', '0', '', '', 1352726216);

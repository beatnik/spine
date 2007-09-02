--
-- Table structure for table `adminaccess`
--

DROP TABLE IF EXISTS `adminaccess`;
CREATE TABLE `adminaccess` (
  `id` int(11) NOT NULL auto_increment,
  `section` char(64) NOT NULL default '',
  `usergroup` char(255) NOT NULL default '',
  `permissions` char(3) NOT NULL default '',
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL auto_increment,
  `section` char(64) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `attr` varchar(255) NOT NULL default '',
  `value` mediumtext NOT NULL default '',
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `title` varchar(255) default NULL,
  `breaks` int(1) default NULL,
  `style` varchar(255) NOT NULL default '',
  `macros` varchar(255) default NULL,
  `logging` int(1) default NULL,
  `keywords` varchar(255) default NULL,
  `modified` datetime default NULL,
  `owner` varchar(255) default NULL,
  `usergroup` varchar(255) default NULL,
  `permissions` varchar(6) default NULL,
  `body` mediumtext,
  `icomment` mediumtext,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
);

--
-- Table structure for table `macro`
--

DROP TABLE IF EXISTS `macro`;
CREATE TABLE `macro` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(255) default NULL,
  `macrokey` char(255) default NULL,
  `macrovalue` char(255) default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(255) NOT NULL default '',
  `mdate` datetime default NULL,
  `owner` varchar(255) default NULL,
  `parent` int(11) default NULL,
  `mgroup` varchar(255) default NULL,
  `body` mediumtext,
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `messagegroup`
--

DROP TABLE IF EXISTS `messagegroup`;
CREATE TABLE `messagegroup` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `owner` varchar(255) NOT NULL default '',
  `usergroup` varchar(255) default NULL,
  `permissions` varchar(6) default NULL,
  `content` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `navbarbuttons`
--

DROP TABLE IF EXISTS `navbarbuttons`;
CREATE TABLE `navbarbuttons` (
  `id` int(11) NOT NULL auto_increment,
  `navbar` int(11) NOT NULL default '0',
  `position` int(11) NOT NULL default '0',
  `link` char(255) NOT NULL default '',
  `image` char(255) NOT NULL default '',
  `label` char(255) NOT NULL default '',
  `target` char(255) NOT NULL default '',
  `border` int(11) NOT NULL default '0',
  `width` char(8) NOT NULL default '',
  `height` char(8) NOT NULL default '',
  `font` char(128) NOT NULL default '',
  `color` char(128) NOT NULL default '',
  `size` char(8) NOT NULL default '',
  `style` char(64) NOT NULL default '',
  `class` char(128) NOT NULL default '',
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `navbars`
--

DROP TABLE IF EXISTS `navbars`;
CREATE TABLE `navbars` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alignment` varchar(32) NOT NULL default '',
  `positioning` varchar(32) NOT NULL default '',
  `font` varchar(128) NOT NULL default '',
  `color` varchar(128) NOT NULL default '',
  `size` varchar(8) NOT NULL default '',
  `style` varchar(64) NOT NULL default '',
  `sep` varchar(64) NOT NULL default '',
  `modified` datetime default NULL,
  `owner` varchar(255) default NULL,
  `usergroup` varchar(255) default NULL,
  `permissions` varchar(6) default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
CREATE TABLE `revision` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `modified` datetime default NULL,
  `owner` varchar(255) default NULL,
  `body` mediumtext,
  `changetype` varchar(16) default NULL,
  `address` varchar(255) default NULL,
  `super_version` int(11) default '0',
  `sub_version` int(11) default '0',
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` char(255) NOT NULL default '',
  `username` char(255) NOT NULL default '',
  `sessiondate` datetime default NULL,
  `expires` char(255) default NULL,
  `host` char(255) default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics` (
  `name` char(255) NOT NULL default '',
  `sdate` datetime default NULL,
  `useragent` char(255) default NULL,
  `remoteaddr` char(255) default NULL,
  `referer` char(255) default NULL,
  `query` char(255) default NULL
);

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
CREATE TABLE `style` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `title` varchar(255) default NULL,
  `macros` varchar(255) default NULL,
  `modified` datetime default NULL,
  `owner` varchar(255) default NULL,
  `usergroup` varchar(255) default NULL,
  `permissions` varchar(6) default NULL,
  `body` mediumtext,
  `icomment` mediumtext,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
);

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL auto_increment,
  `usergroup` char(255) default NULL,
  `username` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `usergroup` char(255) default '',
  `login` char(255) default '',
  `password` char(255) default '',
  `fullname` char(255) default '',
  `email` char(255) default '',
  PRIMARY KEY  (`id`)
);

--
-- Table structure for table `wiki`
--

DROP TABLE IF EXISTS `wiki`;
CREATE TABLE `wiki` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `modified` datetime default NULL,
  `owner` varchar(255) default NULL,
  `usergroup` varchar(255) default NULL,
  `permissions` varchar(6) default NULL,
  `body` mediumtext,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
);

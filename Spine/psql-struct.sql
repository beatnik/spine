--
-- Table: adminaccess
--

CREATE TABLE "adminaccess" (
  "id" serial NOT NULL,
  "section" character varying(64) DEFAULT '' NOT NULL,
  "usergroup" character varying(255) DEFAULT '' NOT NULL,
  "permissions" character varying(3) DEFAULT '' NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: attribute
--

CREATE TABLE "attribute" (
  "id" serial NOT NULL,
  "section" character varying(64) DEFAULT '' NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "attr" character varying(255) DEFAULT '' NOT NULL,
  "value" text DEFAULT '' NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: calevent
--

CREATE TABLE "calevent" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "description" text NOT NULL,
  "eventstamp" timestamp,
  "owner" character varying(255) DEFAULT NULL,
  "usergroup" character varying(255) DEFAULT NULL,
  "permissions" character varying(6) DEFAULT NULL,
  "public_" smallint DEFAULT '1',
  PRIMARY KEY ("id")
);

--
-- Table: content
--

CREATE TABLE "content" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "title" character varying(255) DEFAULT NULL,
  "breaks" smallint DEFAULT NULL,
  "style" character varying(255) DEFAULT '' NOT NULL,
  "macros" character varying(255) DEFAULT NULL,
  "logging" smallint DEFAULT NULL,
  "keywords" character varying(255) DEFAULT NULL,
  "modified" timestamp,
  "owner" character varying(255) DEFAULT NULL,
  "usergroup" character varying(255) DEFAULT NULL,
  "permissions" character varying(6) DEFAULT NULL,
  "body" text,
  "icomment" text,
  "type" character varying(255) DEFAULT NULL,
  PRIMARY KEY ("id"),
  Constraint "name" UNIQUE ("name")
);

--
-- Table: macro
--

CREATE TABLE "macro" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT NULL,
  "macrokey" character varying(255) DEFAULT NULL,
  "macrovalue" character varying(255) DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: message
--

CREATE TABLE "message" (
  "id" serial NOT NULL,
  "subject" character varying(255) DEFAULT '' NOT NULL,
  "mdate" timestamp,
  "owner" character varying(255) DEFAULT NULL,
  "parent" bigint DEFAULT NULL,
  "mgroup" character varying(255) DEFAULT NULL,
  "body" text,
  PRIMARY KEY ("id")
);

--
-- Table: messagegroup
--

CREATE TABLE "messagegroup" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "owner" character varying(255) DEFAULT '' NOT NULL,
  "usergroup" character varying(255) DEFAULT NULL,
  "permissions" character varying(6) DEFAULT NULL,
  "content" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: navbarbuttons
--

CREATE TABLE "navbarbuttons" (
  "id" serial NOT NULL,
  "navbar" bigint DEFAULT '0' NOT NULL,
  "position" bigint DEFAULT '0' NOT NULL,
  "link" character varying(255) DEFAULT '' NOT NULL,
  "image" character varying(255) DEFAULT '' NOT NULL,
  "label" character varying(255) DEFAULT '' NOT NULL,
  "target" character varying(255) DEFAULT '' NOT NULL,
  "border" bigint DEFAULT '0' NOT NULL,
  "width" character varying(8) DEFAULT '' NOT NULL,
  "height" character varying(8) DEFAULT '' NOT NULL,
  "font" character varying(128) DEFAULT '' NOT NULL,
  "color" character varying(128) DEFAULT '' NOT NULL,
  "size" character varying(8) DEFAULT '' NOT NULL,
  "style" character varying(64) DEFAULT '' NOT NULL,
  "class" character varying(128) DEFAULT '' NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: navbars
--

CREATE TABLE "navbars" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "alignment" character varying(32) DEFAULT '' NOT NULL,
  "positioning" character varying(32) DEFAULT '' NOT NULL,
  "font" character varying(128) DEFAULT '' NOT NULL,
  "color" character varying(128) DEFAULT '' NOT NULL,
  "size" character varying(8) DEFAULT '' NOT NULL,
  "style" character varying(64) DEFAULT '' NOT NULL,
  "sep" character varying(64) DEFAULT '' NOT NULL,
  "modified" timestamp,
  "owner" character varying(255) DEFAULT NULL,
  "usergroup" character varying(255) DEFAULT NULL,
  "permissions" character varying(6) DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: revision
--

CREATE TABLE "revision" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "modified" timestamp,
  "owner" character varying(255) DEFAULT NULL,
  "body" text,
  "changetype" character varying(16) DEFAULT NULL,
  "address" character varying(255) DEFAULT NULL,
  "super_version" bigint DEFAULT '0',
  "sub_version" bigint DEFAULT '0',
  PRIMARY KEY ("id")
);

--
-- Table: session
--

CREATE TABLE "session" (
  "id" character varying(255) DEFAULT '' NOT NULL,
  "username" character varying(255) DEFAULT '' NOT NULL,
  "sessiondate" timestamp,
  "expires" character varying(255) DEFAULT NULL,
  "host" character varying(255) DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: statistics
--

CREATE TABLE "statistics" (
  "name" character(255) DEFAULT '' NOT NULL,
  "sdate" timestamp,
  "useragent" character varying(255) DEFAULT NULL,
  "remoteaddr" character varying(255) DEFAULT NULL,
  "referer" character varying(255) DEFAULT NULL,
  "query" character varying(255) DEFAULT NULL
);

--
-- Table: style
--

CREATE TABLE "style" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "title" character varying(255) DEFAULT NULL,
  "macros" character varying(255) DEFAULT NULL,
  "modified" timestamp,
  "owner" character varying(255) DEFAULT NULL,
  "usergroup" character varying(255) DEFAULT NULL,
  "permissions" character varying(6) DEFAULT NULL,
  "body" text,
  "icomment" text,
  PRIMARY KEY ("id"),
  Constraint "name3" UNIQUE ("name")
);

--
-- Table: usergroup
--

CREATE TABLE "usergroup" (
  "id" serial NOT NULL,
  "usergroup" character varying(255) DEFAULT NULL,
  "username" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Table: users
--

CREATE TABLE "users" (
  "id" serial NOT NULL,
  "usergroup" character varying(255) DEFAULT '',
  "login" character varying(255) DEFAULT '',
  "password" character varying(255) DEFAULT '',
  "fullname" character varying(255) DEFAULT '',
  "email" character varying(255) DEFAULT '',
  PRIMARY KEY ("id")
);

--
-- Table: wiki
--

CREATE TABLE "wiki" (
  "id" serial NOT NULL,
  "name" character varying(255) DEFAULT '' NOT NULL,
  "modified" timestamp,
  "owner" character varying(255) DEFAULT NULL,
  "usergroup" character varying(255) DEFAULT NULL,
  "permissions" character varying(6) DEFAULT NULL,
  "body" text,
  PRIMARY KEY ("id"),
  Constraint "name4" UNIQUE ("name")
);


GRANT ALL ON adminaccess TO beatnik;
GRANT ALL ON attribute TO beatnik;
GRANT ALL ON calevent TO beatnik;
GRANT ALL ON content TO beatnik;
GRANT ALL ON macro TO beatnik;
GRANT ALL ON message TO beatnik;
GRANT ALL ON messagegroup TO beatnik;
GRANT ALL ON navbarbuttons TO beatnik;
GRANT ALL ON navbars TO beatnik;
GRANT ALL ON revision TO beatnik;
GRANT ALL ON session TO beatnik;
GRANT ALL ON statistics TO beatnik;
GRANT ALL ON style TO beatnik;
GRANT ALL ON usergroup TO beatnik;
GRANT ALL ON users TO beatnik;
GRANT ALL ON wiki TO beatnik;

GRANT ALL ON adminaccess_id_seq TO beatnik;
GRANT ALL ON attribute_id_seq TO beatnik;
GRANT ALL ON calevent_id_seq TO beatnik;
GRANT ALL ON content_id_seq TO beatnik;
GRANT ALL ON macro_id_seq TO beatnik;
GRANT ALL ON message_id_seq TO beatnik;
GRANT ALL ON messagegroup_id_seq TO beatnik;
GRANT ALL ON navbarbuttons_id_seq TO beatnik;
GRANT ALL ON navbars_id_seq TO beatnik;
GRANT ALL ON revision_id_seq TO beatnik;
GRANT ALL ON session_id_seq TO beatnik;
GRANT ALL ON statistics_id_seq TO beatnik;
GRANT ALL ON style_id_seq TO beatnik;
GRANT ALL ON usergroup_id_seq TO beatnik;
GRANT ALL ON users_id_seq TO beatnik;
GRANT ALL ON wiki_id_seq TO beatnik;

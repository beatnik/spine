CREATE TABLE adminaccess (
  id int NOT NULL,
  section char(64) NOT NULL,
  usergroup char(255) NOT NULL,
  permissions char(3) NOT NULL,
  PRIMARY KEY  (id)
)

go

CREATE TABLE attribute (
  id int NOT NULL,
  section char(64) NOT NULL,
  name varchar(255) NOT NULL,
  attr varchar(255) NOT NULL,
  value text NOT NULL,
  PRIMARY KEY  (id)
)

go


CREATE TABLE content (
  id int NOT NULL,
  name varchar(255) NOT NULL,
  title varchar(255) ,
  breaks int ,
  style varchar(255) NOT NULL,
  macros varchar(255) ,
  logging int ,
  keywords varchar(255) ,
  modified datetime ,
  owner varchar(255) ,
  usergroup varchar(255) ,
  permissions varchar(6) ,
  body text,
  icomment text,
  type varchar(255) ,
  PRIMARY KEY  (id),
)

go

CREATE TABLE macro (
  id int NOT NULL,
  name char(255) ,
  macrokey char(255) ,
  macrovalue char(255) ,
  PRIMARY KEY  (id)
)

go

CREATE TABLE message (
  id int NOT NULL,
  subject varchar(255) NOT NULL,
  mdate datetime ,
  owner varchar(255) ,
  parent int ,
  mgroup varchar(255) ,
  body text,
  PRIMARY KEY  (id)
)

go

CREATE TABLE messagegroup (
  id int NOT NULL,
  name varchar(255) NOT NULL,
  owner varchar(255) NOT NULL,
  usergroup varchar(255) ,
  permissions varchar(6) ,
  content varchar(255) NOT NULL,
  PRIMARY KEY  (id)
)

go

CREATE TABLE navbarbuttons (
  id int NOT NULL,
  navbar int NOT NULL ,
  position int NOT NULL ,
  link char(255) NOT NULL,
  image char(255) NOT NULL,
  label char(255) NOT NULL,
  target char(255) NOT NULL,
  border int NOT NULL ,
  width char(8) NOT NULL,
  height char(8) NOT NULL,
  font char(128) NOT NULL,
  color char(128) NOT NULL,
  size char(8) NOT NULL,
  style char(64) NOT NULL,
  class char(128) NOT NULL,
  PRIMARY KEY  (id)
)

go

CREATE TABLE navbars (
  id int NOT NULL,
  name varchar(255) NOT NULL,
  alignment varchar(32) NOT NULL,
  positioning varchar(32) NOT NULL,
  font varchar(128) NOT NULL,
  color varchar(128) NOT NULL,
  size varchar(8) NOT NULL,
  style varchar(64) NOT NULL,
  sep varchar(64) NOT NULL,
  modified datetime ,
  owner varchar(255) ,
  usergroup varchar(255) ,
  permissions varchar(6) ,
  PRIMARY KEY  (id)
)

go

CREATE TABLE revision (
  id int NOT NULL,
  name varchar(255) NOT NULL,
  modified datetime ,
  owner varchar(255) ,
  body text,
  changetype varchar(16) ,
  address varchar(255) ,
  super_version int ,
  sub_version int ,
  PRIMARY KEY  (id)
)

go

CREATE TABLE session (
  id char(255) NOT NULL,
  username char(255) NOT NULL,
  sessiondate datetime ,
  expires char(255) ,
  host char(255) ,
  PRIMARY KEY  (id)
)

go

CREATE TABLE statistic (
  name char(255) NOT NULL,
  sdate datetime ,
  useragent char(255) ,
  remoteaddr char(255) ,
  referer char(255) ,
  query char(255) 
)

go

CREATE TABLE style (
  id int NOT NULL,
  name varchar(255) NOT NULL,
  title varchar(255) ,
  macros varchar(255) ,
  modified datetime ,
  owner varchar(255) ,
  usergroup varchar(255) ,
  permissions varchar(6) ,
  body text,
  icomment text,
  PRIMARY KEY  (id)
)

go

CREATE TABLE usergroup (
  id int NOT NULL,
  usergroup char(255) ,
  username char(255) NOT NULL,
  PRIMARY KEY  (id)
)

go

CREATE TABLE users (
  id int NOT NULL,
  usergroup char(255),
  login char(255),
  password char(255),
  fullname char(255),
  email char(255),
  PRIMARY KEY  (id)
)

go

CREATE TABLE wiki (
  id int NOT NULL,
  name varchar(255) NOT NULL,
  modified datetime ,
  owner varchar(255) ,
  usergroup varchar(255) ,
  permissions varchar(6) ,
  body text,
  PRIMARY KEY  (id)
)

go

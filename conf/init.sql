CREATE DATABASE IF NOT EXISTS xsltransform;

USE xsltransform;

CREATE TABLE IF NOT EXISTS fiddle (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS fiddle_revision (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  revision int(11) DEFAULT NULL,
  engine varchar(255) DEFAULT NULL,
  fiddle_id bigint(20) DEFAULT NULL,
  xml text,
  xsl text,
  PRIMARY KEY (id),
  KEY ix_fiddle_revision_fiddle_1 (fiddle_id),
  CONSTRAINT fk_fiddle_revision_fiddle_1 FOREIGN KEY (fiddle_id) REFERENCES fiddle (id)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS play_evolutions (
  id int(11) NOT NULL,
  hash varchar(255) NOT NULL,
  applied_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  apply_script text,
  revert_script text,
  state varchar(255) DEFAULT NULL,
  last_problem text,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

GRANT ALL ON xsltransform.* TO `xsltransform`@`%` IDENTIFIED BY 'password';

-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
-- School schema migration

--
-- Create database tdm_school
--

CREATE DATABASE tdm_school;
USE tdm_school;

CREATE TABLE `person` (
  `uuid` char(36) NOT NULL,
  `first_name` varchar(512) NOT NULL,
  `last_name` varchar(512) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `sys_created` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `sys_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`),
  KEY `dateRowAdded` (`sys_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `person_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_uuid` char(36) NOT NULL,
  `permanent_address` varchar(512) DEFAULT NULL,
  `current_address` varchar(512) NOT NULL,
  `sys_created` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `sys_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_persion_address_person_uuid` (`person_uuid`),
  CONSTRAINT `fk_persion_address_person_uuid` FOREIGN KEY (`person_uuid`) REFERENCES `person` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_uuid` char(36) NOT NULL,
  `first_name` varchar(512) NOT NULL,
  `last_name` varchar(512) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `admission_date` datetime DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `sys_created` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `sys_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_student_person_uuid` (`person_uuid`),
  CONSTRAINT `fk_student_person_uuid` FOREIGN KEY (`person_uuid`) REFERENCES `person` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_uuid` char(36) NOT NULL,
  `first_name` varchar(512) NOT NULL,
  `last_name` varchar(512) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `department` varchar(128) DEFAULT NULL,
  `sys_created` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `sys_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_person_uuid` (`person_uuid`),
  CONSTRAINT `fk_teacher_person_uuid` FOREIGN KEY (`person_uuid`) REFERENCES `person` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

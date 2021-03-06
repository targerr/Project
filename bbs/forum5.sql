-- MySQL Script generated by MySQL Workbench
-- 12/26/16 10:22:18
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema forum_22
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema forum_22
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `forum_22` DEFAULT CHARACTER SET utf8 ;
USE `forum_22` ;

-- -----------------------------------------------------
-- Table `forum_22`.`t_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL COMMENT '系统账号，唯一',
  `password` VARCHAR(40) NOT NULL COMMENT '密码MD5加密',
  `email` VARCHAR(50) NULL COMMENT '电子邮件地址',
  `phone` VARCHAR(11) NULL COMMENT '用户手机号码',
  `state` TINYINT NULL DEFAULT 0 COMMENT '账号状态 0未激活 1 正常(已激活) 2 已禁用',
  `createtime` TIMESTAMP NULL DEFAULT current_timestamp COMMENT '用户注册时间',
  `avatar` VARCHAR(50) NULL COMMENT '用户头像，七牛云存储中的key',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`t_login_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_login_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `logintime` TIMESTAMP NULL DEFAULT current_timestamp COMMENT '登录时间',
  `ip` VARCHAR(20) NULL COMMENT '登录IP',
  `userid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_login_log_t_user_idx` (`userid` ASC),
  CONSTRAINT `fk_t_login_log_t_user`
    FOREIGN KEY (`userid`)
    REFERENCES `forum_22`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`t_node`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_node` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nodename` VARCHAR(45) NOT NULL,
  `topicnum` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`t_topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NULL,
  `createtime` TIMESTAMP NULL DEFAULT current_timestamp,
  `clicknum` INT NULL DEFAULT 0,
  `favnum` INT NULL DEFAULT 0,
  `thankyounum` INT NULL DEFAULT 0,
  `replynum` INT NULL DEFAULT 0,
  `lastreplytime` TIMESTAMP NULL,
  `userid` INT NOT NULL,
  `nodeid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_topic_t_user2_idx` (`userid` ASC),
  INDEX `fk_t_topic_t_node2_idx` (`nodeid` ASC),
  CONSTRAINT `fk_t_topic_t_user2`
    FOREIGN KEY (`userid`)
    REFERENCES `forum_22`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_topic_t_node2`
    FOREIGN KEY (`nodeid`)
    REFERENCES `forum_22`.`t_node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`t_node`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_node` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nodename` VARCHAR(45) NOT NULL,
  `topicnum` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`t_topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NULL,
  `createtime` TIMESTAMP NULL DEFAULT current_timestamp,
  `clicknum` INT NULL DEFAULT 0,
  `favnum` INT NULL DEFAULT 0,
  `thankyounum` INT NULL DEFAULT 0,
  `replynum` INT NULL DEFAULT 0,
  `lastreplytime` TIMESTAMP NULL,
  `userid` INT NOT NULL,
  `nodeid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_topic_t_user2_idx` (`userid` ASC),
  INDEX `fk_t_topic_t_node2_idx` (`nodeid` ASC),
  CONSTRAINT `fk_t_topic_t_user2`
    FOREIGN KEY (`userid`)
    REFERENCES `forum_22`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_topic_t_node2`
    FOREIGN KEY (`nodeid`)
    REFERENCES `forum_22`.`t_node` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`t_reply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_reply` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NULL,
  `createtime` TIMESTAMP NULL DEFAULT current_timestamp,
  `topicid` INT NOT NULL,
  `userid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_reply_t_topic1_idx` (`topicid` ASC),
  INDEX `fk_t_reply_t_user1_idx` (`userid` ASC),
  CONSTRAINT `fk_t_reply_t_topic1`
    FOREIGN KEY (`topicid`)
    REFERENCES `forum_22`.`t_topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_reply_t_user1`
    FOREIGN KEY (`userid`)
    REFERENCES `forum_22`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum_22`.`t_notify`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forum_22`.`t_notify` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `createtime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `state` INT NULL DEFAULT 0,
  `readtime` TIMESTAMP NULL,
  `userid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_notify_t_user1_idx` (`userid` ASC),
  CONSTRAINT `fk_t_notify_t_user1`
    FOREIGN KEY (`userid`)
    REFERENCES `forum_22`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- Thu Feb  6 12:28:51 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema devcamp_mysql_project_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema devcamp_mysql_project_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `devcamp_mysql_project_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `devcamp_mysql_project_schema` ;

-- -----------------------------------------------------
-- Table `devcamp_mysql_project_schema`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devcamp_mysql_project_schema`.`teachers` (
  `teachers_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL DEFAULT NULL,
  `average_grade_given` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`teachers_id`),
  UNIQUE INDEX `teachers_id_UNIQUE` (`teachers_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `devcamp_mysql_project_schema`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devcamp_mysql_project_schema`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  `teachers_id` INT NOT NULL,
  `average_score` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE,
  UNIQUE INDEX `course_name_UNIQUE` (`course_name` ASC) VISIBLE,
  INDEX `course_teacher_id_idx` (`teachers_id` ASC) VISIBLE,
  CONSTRAINT `course_teachers_id`
    FOREIGN KEY (`teachers_id`)
    REFERENCES `devcamp_mysql_project_schema`.`teachers` (`teachers_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `devcamp_mysql_project_schema`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devcamp_mysql_project_schema`.`students` (
  `students_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL DEFAULT NULL,
  `high_score` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`students_id`),
  UNIQUE INDEX `students_id_UNIQUE` (`students_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `devcamp_mysql_project_schema`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devcamp_mysql_project_schema`.`enrollment` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NOT NULL,
  `students_id` INT NOT NULL,
  `teachers_id` INT NOT NULL,
  `score` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE INDEX `enrollment_id_UNIQUE` (`enrollment_id` ASC) VISIBLE,
  INDEX `enrollment_course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `enrollment_students_id_idx` (`students_id` ASC) VISIBLE,
  INDEX `enrollment_teachers_id_idx` (`teachers_id` ASC) VISIBLE,
  CONSTRAINT `enrollment_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `devcamp_mysql_project_schema`.`courses` (`course_id`),
  CONSTRAINT `enrollment_students_id`
    FOREIGN KEY (`students_id`)
    REFERENCES `devcamp_mysql_project_schema`.`students` (`students_id`),
  CONSTRAINT `enrollment_teachers_id`
    FOREIGN KEY (`teachers_id`)
    REFERENCES `devcamp_mysql_project_schema`.`teachers` (`teachers_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 43
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `devcamp_mysql_project_schema`.`grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devcamp_mysql_project_schema`.`grades` (
  `grades_id` INT NOT NULL AUTO_INCREMENT,
  `students_id` INT NOT NULL,
  `teachers_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `score` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`grades_id`),
  UNIQUE INDEX `grades_id_UNIQUE` (`grades_id` ASC) VISIBLE,
  INDEX `grades_students_id_idx` (`students_id` ASC) VISIBLE,
  INDEX `grades_teachers_id_idx` (`teachers_id` ASC) VISIBLE,
  INDEX `grades_course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `grades_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `devcamp_mysql_project_schema`.`courses` (`course_id`),
  CONSTRAINT `grades_students_id`
    FOREIGN KEY (`students_id`)
    REFERENCES `devcamp_mysql_project_schema`.`students` (`students_id`),
  CONSTRAINT `grades_teachers_id`
    FOREIGN KEY (`teachers_id`)
    REFERENCES `devcamp_mysql_project_schema`.`teachers` (`teachers_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema anime
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema anime
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `anime` DEFAULT CHARACTER SET utf8mb3 ;
USE `anime` ;

-- -----------------------------------------------------
-- Table `anime`.`calificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anime`.`calificacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calificacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `anime`.`anime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anime`.`anime` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(130) NOT NULL,
  `fecha_emision` TIMESTAMP NULL DEFAULT NULL,
  `puntuacion_id` INT NOT NULL,
  `descripcion` VARCHAR(450) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `anime-calificacion_idx` (`puntuacion_id` ASC) VISIBLE,
  CONSTRAINT `anime-calificacion`
    FOREIGN KEY (`puntuacion_id`)
    REFERENCES `anime`.`calificacion` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `anime`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anime`.`generos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `anime`.`anime_generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anime`.`anime_generos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `anime_id` INT NOT NULL,
  `generos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ag_generos_idx` (`generos_id` ASC) VISIBLE,
  INDEX `ag_anime_idx` (`anime_id` ASC) VISIBLE,
  CONSTRAINT `ag_anime`
    FOREIGN KEY (`anime_id`)
    REFERENCES `anime`.`anime` (`id`),
  CONSTRAINT `ag_generos`
    FOREIGN KEY (`generos_id`)
    REFERENCES `anime`.`generos` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `anime`.`temporada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anime`.`temporada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_temporada` VARCHAR(45) NULL DEFAULT NULL,
  `anime_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `temporada-anime_idx` (`anime_id` ASC) VISIBLE,
  CONSTRAINT `temporada-anime`
    FOREIGN KEY (`anime_id`)
    REFERENCES `anime`.`anime` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `anime`.`capitulos_por_temporada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anime`.`capitulos_por_temporada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_temporada` INT NULL DEFAULT NULL,
  `capitulo` VARCHAR(45) NULL DEFAULT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `capitulo_por_temportada-temporada_idx` (`id_temporada` ASC) VISIBLE,
  CONSTRAINT `capitulo_por_temportada-temporada`
    FOREIGN KEY (`id_temporada`)
    REFERENCES `anime`.`temporada` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

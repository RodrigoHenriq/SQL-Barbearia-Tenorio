-- MySQL Script generated by MySQL Workbench
-- Fri Nov 12 17:21:40 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projetobarbearia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projetobarbearia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projetobarbearia` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `projetobarbearia` ;

-- -----------------------------------------------------
-- Table `projetobarbearia`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `dataCadastro` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `status` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_usuario_perfil1_idx` (`idPerfil` ASC),
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `projetobarbearia`.`perfil` (`idPerfil`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`barbeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`barbeiro` (
  `idBarbeiro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  `endereco` VARCHAR(256) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idBarbeiro`),
  INDEX `fk_barbeiro_usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_barbeiro_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `projetobarbearia`.`usuario` (`idUsuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `cargaHoraria` INT NOT NULL,
  `preco` DOUBLE NOT NULL,
  `imagem` VARCHAR(256) NULL,
  `descricao` VARCHAR(512) NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`turma` (
  `idTurma` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `qtdAluno` INT(11) NOT NULL,
  `ano` VARCHAR(20) NOT NULL,
  `semestre` VARCHAR(45) NOT NULL,
  `turno` VARCHAR(50) NOT NULL,
  `idBarbeiro` INT NOT NULL,
  `idCurso` INT NOT NULL,
  PRIMARY KEY (`idTurma`),
  INDEX `fk_turma_barbeiro1_idx` (`idBarbeiro` ASC),
  INDEX `fk_turma_curso1_idx` (`idCurso` ASC),
  CONSTRAINT `fk_turma_barbeiro1`
    FOREIGN KEY (`idBarbeiro`)
    REFERENCES `projetobarbearia`.`barbeiro` (`idBarbeiro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_turma_curso1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `projetobarbearia`.`curso` (`idCurso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  `endereco` VARCHAR(256) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `idTurma` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_cliente_turma1_idx` (`idTurma` ASC),
  CONSTRAINT `fk_cliente_turma1`
    FOREIGN KEY (`idTurma`)
    REFERENCES `projetobarbearia`.`turma` (`idTurma`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`aula` (
  `idAula` INT NOT NULL AUTO_INCREMENT,
  `materia` VARCHAR(45) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `horario` TIME NOT NULL,
  `qtdAula` INT NOT NULL,
  `idCurso` INT NOT NULL,
  PRIMARY KEY (`idAula`),
  INDEX `fk_aula_curso1_idx` (`idCurso` ASC),
  CONSTRAINT `fk_aula_curso1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `projetobarbearia`.`curso` (`idCurso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`menu` (
  `idMenu` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `link` VARCHAR(256) NOT NULL,
  `icone` VARCHAR(150) NULL,
  `exibir` INT NOT NULL,
  PRIMARY KEY (`idMenu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`menu_perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`menu_perfil` (
  `idMenu` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  PRIMARY KEY (`idMenu`, `idPerfil`),
  INDEX `fk_menu_has_perfil_perfil1_idx` (`idPerfil` ASC),
  INDEX `fk_menu_has_perfil_menu_idx` (`idMenu` ASC),
  CONSTRAINT `fk_menu_has_perfil_menu`
    FOREIGN KEY (`idMenu`)
    REFERENCES `projetobarbearia`.`menu` (`idMenu`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_has_perfil_perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `projetobarbearia`.`perfil` (`idPerfil`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATE NOT NULL,
  `precoTotal` DOUBLE NOT NULL,
  `idCliente` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `fk_Venda_usuario1_idx` (`idUsuario` ASC),
  INDEX `fk_Venda_cliente1_idx` (`idCliente` ASC),
  CONSTRAINT `fk_Venda_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `projetobarbearia`.`usuario` (`idUsuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Venda_cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `projetobarbearia`.`cliente` (`idCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `projetobarbearia`.`venda_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetobarbearia`.`venda_curso` (
  `idVenda` INT NOT NULL,
  `idCurso` INT NOT NULL,
  `qtd` INT NOT NULL,
  `precoVendido` DOUBLE NOT NULL,
  PRIMARY KEY (`idVenda`, `idCurso`),
  INDEX `fk_curso_has_venda_venda1_idx` (`idVenda` ASC),
  INDEX `fk_curso_has_venda_curso1_idx` (`idCurso` ASC),
  CONSTRAINT `fk_curso_has_venda_curso1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `projetobarbearia`.`curso` (`idCurso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_curso_has_venda_venda1`
    FOREIGN KEY (`idVenda`)
    REFERENCES `projetobarbearia`.`venda` (`idVenda`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

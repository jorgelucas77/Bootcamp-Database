create database IF NOT EXISTS oficina;

use oficina;

CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Pnome` VARCHAR(10) NOT NULL,
  `NmeioInicial` VARCHAR(3) NULL,
  `Sobrenome` VARCHAR(20) NULL,
  `NIF` VARCHAR(9) NOT NULL,
  `Endereço` VARCHAR(45) NULL,
  `DataNascimento` DATE NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) VISIBLE);
  
CREATE TABLE IF NOT EXISTS `Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `Data Emissão` DATE NULL,
  `Status da OS` VARCHAR(45) NULL,
  `Valor` DATETIME(2) NULL,
  `Data Conclusão` DATE NULL,
  PRIMARY KEY (`idOrdem de Serviço`));
  
CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecanico`));
  
CREATE TABLE IF NOT EXISTS `Equipa` (
  `idEquipa` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  PRIMARY KEY (`idEquipa`, `Mecanico_idMecanico`),
  INDEX `fk_Equipa_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  CONSTRAINT `fk_Equipa_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `OServiço` (
  `idServico` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Equipa_idEquipa` INT NOT NULL,
  PRIMARY KEY (`idServico`, `Ordem de Serviço_idOrdem de Serviço`, `Equipa_idEquipa`),
  INDEX `fk_Pedido_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Pedido_Equipa1_idx` (`Equipa_idEquipa` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Equipa1`
    FOREIGN KEY (`Equipa_idEquipa`)
    REFERENCES `Equipa` (`idEquipa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `Viatura` (
  `idViatura` INT NOT NULL,
  `Matricula` VARCHAR(45) NULL,
  `Serviço_idServico` INT NOT NULL,
  `Serviço_Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Serviço_Equipa_idEquipa` INT NOT NULL,
  PRIMARY KEY (`idViatura`, `Serviço_idServico`, `Serviço_Ordem de Serviço_idOrdem de Serviço`, `Serviço_Equipa_idEquipa`),
  INDEX `fk_Viatura_Serviço1_idx` (`Serviço_idServico` ASC, `Serviço_Ordem de Serviço_idOrdem de Serviço` ASC, `Serviço_Equipa_idEquipa` ASC) VISIBLE,
  CONSTRAINT `fk_Viatura_Serviço1`
    FOREIGN KEY (`Serviço_idServico` , `Serviço_Ordem de Serviço_idOrdem de Serviço` , `Serviço_Equipa_idEquipa`)
    REFERENCES `OServiço` (`idServico` , `Ordem de Serviço_idOrdem de Serviço` , `Equipa_idEquipa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `Serviço` (
  `idServiço` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  PRIMARY KEY (`idServiço`)); 
  
CREATE TABLE IF NOT EXISTS `Peça` (
  `idPeça` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeça`));


  
CREATE TABLE IF NOT EXISTS `Peça_has_Serviço` (
  `Peça_idPeça` INT NOT NULL,
  `Serviço_idServiço` INT NOT NULL,
  PRIMARY KEY (`Peça_idPeça`, `Serviço_idServiço`),
  INDEX `fk_Peça_has_Serviço_Serviço1_idx` (`Serviço_idServiço` ASC) VISIBLE,
  INDEX `fk_Peça_has_Serviço_Peça1_idx` (`Peça_idPeça` ASC) VISIBLE,
  CONSTRAINT `fk_Peça_has_Serviço_Peça1`
    FOREIGN KEY (`Peça_idPeça`)
    REFERENCES `Peça` (`idPeça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peça_has_Serviço_Serviço1`
    FOREIGN KEY (`Serviço_idServiço`)
    REFERENCES `Serviço` (`idServiço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
  CREATE TABLE IF NOT EXISTS `Serviço_has_Ordem de Serviço` (
  `Serviço_idServiço` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Serviço_idServiço`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Serviço_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Serviço_has_Ordem de Serviço_Serviço1_idx` (`Serviço_idServiço` ASC) VISIBLE,
  CONSTRAINT `fk_Serviço_has_Ordem de Serviço_Serviço1`
    FOREIGN KEY (`Serviço_idServiço`)
    REFERENCES `Serviço` (`idServiço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviço_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


  
  
  
 
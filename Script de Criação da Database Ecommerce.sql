-- criação do banco de dados para o cenário de E-commerce

create database ecommerce;
use ecommerce;

-- criar tabela cliente

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

-- criar tabela Produto
CREATE TABLE IF NOT EXISTS `Produto` (
  `idProduto` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`));

-- criar tabela pedido
CREATE TABLE IF NOT EXISTS `Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `Status do Pedido` ENUM('Em andamento', 'Processando', 'Concluido') NULL,
  `Descrição` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Frete` FLOAT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
 
 -- criar tabela stock
CREATE TABLE IF NOT EXISTS`Stock` (
  `idStock` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idStock`));
  
-- criar tabela Fornecedor
CREATE TABLE IF NOT EXISTS `Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NULL,
  PRIMARY KEY (`idFornecedor`));

-- criar tabela Vendedor
CREATE TABLE IF NOT EXISTS `Terceiro - Vendedor` (
  `idTerceiro - Vendedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idTerceiro - Vendedor`));
  
-- criar tabela Produto por Vendedor
  CREATE TABLE IF NOT EXISTS `Produtos por Vendedor (terceiro)` (
  `Terceiro - Vendedor_idTerceiro - Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`, `Produto_idProduto`),
  INDEX `fk_Terceiro - Vendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1_idx` (`Terceiro - Vendedor_idTerceiro - Vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1`
    FOREIGN KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`)
    REFERENCES `Terceiro - Vendedor` (`idTerceiro - Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
  -- criar tabela Produto por Relação de produto por Pedido  
    CREATE TABLE IF NOT EXISTS `Relação de produto por Pedido` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- criar tabela Disponibilizado um produto
CREATE TABLE IF NOT EXISTS `Disponibilizado um produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
  INDEX `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Fornecedor_has_Produto_Fornecedor_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- criar tabela Produto_has_Stock
CREATE TABLE IF NOT EXISTS `Produto_has_Stock` (
  `Produto_idProduto` INT NOT NULL,
  `Stock_idStock` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Stock_idStock`),
  INDEX `fk_Produto_has_Stock_Stock1_idx` (`Stock_idStock` ASC) VISIBLE,
  INDEX `fk_Produto_has_Stock_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Stock_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Stock_Stock1`
    FOREIGN KEY (`Stock_idStock`)
    REFERENCES `Stock` (`idStock`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


show tables;

show databases;


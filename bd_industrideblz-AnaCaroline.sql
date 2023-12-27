-- Criação do banco de dados BDIndustriadeBeleza--
CREATE DATABASE BDIndustriadeBeleza;

-- Escolhendo o banco de dados que foi criado anteriormente--
USE BDIndustriadeBeleza;

--  Criação da Tabela Região, responsavel pela organização de uma determinada região --
CREATE TABLE regiao (
    id_regiao INT PRIMARY KEY,
    nome_regiao VARCHAR(255)
);
-- Inserindo dados na tabela regiao
INSERT INTO regiao (id_regiao, nome_regiao)
VALUES (1, 'Norte');
INSERT INTO regiao (id_regiao, nome_regiao) 
VALUES (2, 'Nordeste');
INSERT INTO regiao (id_regiao, nome_regiao)
VALUES (3, 'Sudeste');
INSERT INTO regiao (id_regiao, nome_regiao)
VALUES (4, 'Sul');
INSERT INTO regiao (id_regiao, nome_regiao)
VALUES (5, 'Centro-Oeste');


-- Criação da Tabela Vendedor, responsavel pela vendda dos produtos para o cliente--
CREATE TABLE vendedor (
    id_vendedor INT PRIMARY KEY,
    id_regiao INT,
    nome_vendedor VARCHAR(255),
    cpf_vendedor VARCHAR(14),
    FOREIGN KEY (id_regiao) REFERENCES regiao(id_regiao)
);
-- Inserindo dados na tabela vendedor
INSERT INTO vendedor (id_vendedor, id_regiao, nome_vendedor, cpf_vendedor) 
VALUES (1, 1, 'João Silva', '123.456.789-01');
INSERT INTO vendedor (id_vendedor, id_regiao, nome_vendedor, cpf_vendedor) 
VALUES (2, 2, 'Maria Santos', '987.654.321-02');
INSERT INTO vendedor (id_vendedor, id_regiao, nome_vendedor, cpf_vendedor) 
VALUES (3, 3, 'Carlos Oliveira', '456.789.123-03');
INSERT INTO vendedor (id_vendedor, id_regiao, nome_vendedor, cpf_vendedor) 
VALUES (4, 4, 'Ana Pereira', '789.123.456-04');
INSERT INTO vendedor (id_vendedor, id_regiao, nome_vendedor, cpf_vendedor)
VALUES (5, 5, 'Pedro Mendes', '654.321.987-05');


-- Criação da Tabela Região Veículo que será responsavel pela organização dos veiculos usados pelo vigia--
CREATE TABLE veiculo (
    id_veiculo INT PRIMARY KEY,
    modelo_veiculo VARCHAR(255),
    placa_veiculo VARCHAR(10),
    desc_veiculo VARCHAR(255)
);
-- Inserindo dados na tabela veiculo
INSERT INTO veiculo (id_veiculo, modelo_veiculo, placa_veiculo, desc_veiculo) 
VALUES (1, 'Sedan', 'ABC123', 'Carro de luxo com interior de couro');
INSERT INTO veiculo (id_veiculo, modelo_veiculo, placa_veiculo, desc_veiculo)
VALUES (2, 'SUV', 'XYZ789', 'Veículo utilitário esportivo para a família');
INSERT INTO veiculo (id_veiculo, modelo_veiculo, placa_veiculo, desc_veiculo)
VALUES (3, 'Hatchback', 'DEF456', 'Carro compacto e econômico');
INSERT INTO veiculo (id_veiculo, modelo_veiculo, placa_veiculo, desc_veiculo)
VALUES (4, 'Caminhão', 'GHI789', 'Veículo de carga para transporte pesado');
INSERT INTO veiculo (id_veiculo, modelo_veiculo, placa_veiculo, desc_veiculo)
VALUES (5, 'Crossover', 'JKL012', 'Combinação de SUV e Sedan, versatilidade máxima');


-- Criação da Tabela Vigia Veículos, que será responsavel por comportar o dados do vigia, veiculo e do vendedor responsável--
CREATE TABLE vigia_veiculos (
    id_vigia INT PRIMARY KEY,
    id_veiculo INT,
    id_vendedor INT,
    data_vigia DATE,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
-- Inserindo dados na tabela vigia_veiculos
INSERT INTO vigia_veiculos (id_vigia, id_veiculo, id_vendedor, data_vigia) 
VALUES (1, 1, 1, '2023-10-24');
INSERT INTO vigia_veiculos (id_vigia, id_veiculo, id_vendedor, data_vigia)
VALUES (2, 2, 2, '2023-10-25');
INSERT INTO vigia_veiculos (id_vigia, id_veiculo, id_vendedor, data_vigia)
VALUES (3, 3, 3, '2023-10-26');
INSERT INTO vigia_veiculos (id_vigia, id_veiculo, id_vendedor, data_vigia)
VALUES (4, 4, 4, '2023-10-27');
INSERT INTO vigia_veiculos (id_vigia, id_veiculo, id_vendedor, data_vigia)
VALUES (5, 5, 5, '2023-10-28');

-- Criação da Tabela Nota Fiscal responsavel pela comfirmação feita pelo vendedor--
CREATE TABLE nota_fiscal (
    id_notaf INT PRIMARY KEY,
    data_notaf DATE,
    id_vendedor INT,
    id_cliente INT,
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
-- Inserindo dados na tabela nota_fiscal
INSERT INTO nota_fiscal (id_notaf, data_notaf, id_vendedor, id_cliente)
VALUES (1, '2023-10-24', 1, 1);
INSERT INTO nota_fiscal (id_notaf, data_notaf, id_vendedor, id_cliente)
VALUES (2, '2023-10-25', 2, 2);
INSERT INTO nota_fiscal (id_notaf, data_notaf, id_vendedor, id_cliente) 
VALUES (3, '2023-10-26', 3, 3);
INSERT INTO nota_fiscal (id_notaf, data_notaf, id_vendedor, id_cliente)
VALUES (4, '2023-10-27', 4, 4);
INSERT INTO nota_fiscal (id_notaf, data_notaf, id_vendedor, id_cliente)
VALUES (5, '2023-10-28', 5, 5);

-- Criação da Tabela Cliente, aquele que irá realizar a compra com o vendedor--
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome_cli VARCHAR(255),
    regiao_cli INT
);
-- Inserindo dados na tabela cliente
INSERT INTO cliente (id_cliente, nome_cli, regiao_cli)
VALUES (1, 'Cliente A', 1);
INSERT INTO cliente (id_cliente, nome_cli, regiao_cli) 
VALUES (2, 'Cliente B', 2);
INSERT INTO cliente (id_cliente, nome_cli, regiao_cli) 
VALUES (3, 'Cliente C', 3);
INSERT INTO cliente (id_cliente, nome_cli, regiao_cli)
VALUES (4, 'Cliente D', 4);
INSERT INTO cliente (id_cliente, nome_cli, regiao_cli) 
VALUES (5, 'Cliente E', 5);


-- Criação da Tabela Produto que listara os produtos, sua descrição e sua quantidade em estoque--
CREATE TABLE produto (
    id_produto INT PRIMARY KEY,
    desc_produto VARCHAR(255),
    estoq_produto INT
);
-- Inserindo dados na tabela produto
INSERT INTO produto (id_produto, desc_produto, estoq_produto)
VALUES (1, 'Produto A', 100);
INSERT INTO produto (id_produto, desc_produto, estoq_produto)
VALUES (2, 'Produto B', 150);
INSERT INTO produto (id_produto, desc_produto, estoq_produto)
VALUES (3, 'Produto C', 75);
INSERT INTO produto (id_produto, desc_produto, estoq_produto)
VALUES (4, 'Produto D', 200);
INSERT INTO produto (id_produto, desc_produto, estoq_produto)
VALUES (5, 'Produto E', 50);

-- Criação da Tabela Item Nota Fiscal, extensão da tabela nota fiscal--
CREATE TABLE item_nota_fiscal (
    id_item INT PRIMARY KEY,
    id_produto INT,
    id_nota INT,
    qnt_itemnotaf INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_nota) REFERENCES nota_fiscal(id_notaf)
);
-- Inserindo dados na tabela item_nota_fiscal
INSERT INTO item_nota_fiscal (id_item, id_produto, id_nota, qnt_itemnotaf)
VALUES (1, 1, 1, 10);
INSERT INTO item_nota_fiscal (id_item, id_produto, id_nota, qnt_itemnotaf) 
VALUES (2, 2, 2, 5);
INSERT INTO item_nota_fiscal (id_item, id_produto, id_nota, qnt_itemnotaf) 
VALUES (3, 3, 3, 8);
INSERT INTO item_nota_fiscal (id_item, id_produto, id_nota, qnt_itemnotaf) 
VALUES (4, 4, 4, 15);
INSERT INTO item_nota_fiscal (id_item, id_produto, id_nota, qnt_itemnotaf) 
VALUES (5, 5, 5, 12);


-- Criação da Tabela Ponto Estratégico, onde comportara dados do ponto utilizado--
CREATE TABLE ponto_estrategico (
    id_pontoE INT PRIMARY KEY,
    nome_pontoE VARCHAR(255),
    id_regiao INT,
    FOREIGN KEY (id_regiao) REFERENCES regiao(id_regiao)
);
-- Inserindo dados na tabela ponto_estrategico
INSERT INTO ponto_estrategico (id_pontoE, nome_pontoE, id_regiao)
VALUES (1, 'Ponto 1', 1);
INSERT INTO ponto_estrategico (id_pontoE, nome_pontoE, id_regiao) 
VALUES (2, 'Ponto 2', 2);
INSERT INTO ponto_estrategico (id_pontoE, nome_pontoE, id_regiao) 
VALUES (3, 'Ponto 3', 3);
INSERT INTO ponto_estrategico (id_pontoE, nome_pontoE, id_regiao) 
VALUES (4, 'Ponto 4', 4);
INSERT INTO ponto_estrategico (id_pontoE, nome_pontoE, id_regiao)
VALUES (5, 'Ponto 5', 5);


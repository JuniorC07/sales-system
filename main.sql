
CREATE DATABASE TRABALHOBD;

USE TRABALHOBD;

CREATE TABLE PESSOA(
CODP INT(10),
NOME VARCHAR(60),
ENDER VARCHAR(100),
CIDADE VARCHAR(30),
UF CHAR(2),
TELEFONE VARCHAR(12),
CONSTRAINT PK_PESSOA PRIMARY KEY (CODP));

CREATE TABLE PES_FISICA (
CODPF INT(10),
CPF VARCHAR(20),
RG CHAR(20),
CONSTRAINT PK_FISICA PRIMARY KEY (CPF),
CONSTRAINT FK_FISICA FOREIGN KEY (CODPF)
REFERENCES PESSOA(CODP)
); 

CREATE TABLE PES_JURIDICA(
CODPJ INT(30),
CODPF INT(30),
CNPJ VARCHAR(20),
RAZAO VARCHAR(30),
CONSTRAINT PK_JURIDICA PRIMARY KEY (CNPJ),
CONSTRAINT FK_JURIDICAF FOREIGN KEY (CODPF)
REFERENCES PES_FISICA(CODPF),
CONSTRAINT FK_JURIDICA FOREIGN KEY (CODPJ)
REFERENCES PESSOA(CODP)
); 

CREATE TABLE EMAIL(
CODPF INT(10),
COD_EMAIL VARCHAR(20),
EMAIL VARCHAR(50),
CONSTRAINT PK_EMAIL PRIMARY KEY (COD_EMAIL),
CONSTRAINT FK_EMAIL FOREIGN KEY (CODPF)
REFERENCES PES_FISICA(CODPF)
); 

CREATE TABLE PES_AUTORIZADA(
CODPA INT(30),
RG VARCHAR(20),
NOME VARCHAR(30),
CONSTRAINT PK_AUTORIZADA PRIMARY KEY (RG),
CONSTRAINT FK_AUTORIZADA FOREIGN KEY (CODPA)
REFERENCES PESSOA(CODP)
); 

CREATE TABLE PRODUTO(
CODPROD INT(10),
DESCRICAO VARCHAR(60),
QNTD INT(50),
VALOR DECIMAL(8, 2),
CONSTRAINT PK_PRODUTO PRIMARY KEY (CODPROD));

CREATE TABLE VENDA(
CODV INT(10),
CODCLI INT(10),
CODPROD INT(10),
QNTD INT(100),
DATAV DATE,
DATAP DATE,
CONSTRAINT PK_VENDA PRIMARY KEY (CODV),
CONSTRAINT FK_VENDA FOREIGN KEY (CODPROD)
REFERENCES PRODUTO(CODPROD),
CONSTRAINT FK_VENDAP FOREIGN KEY (CODCLI)
REFERENCES PESSOA(CODP)
); 

CREATE TABLE FORNECEDOR(
CODF INT(10),
NOME VARCHAR(60),
RAZAO VARCHAR(30),
INSC_EST VARCHAR(30),
CNPJ VARCHAR(20),
ENDER VARCHAR(100),
CIDADE VARCHAR(30),
UF CHAR(2),
TELEFONE VARCHAR(12),
NUM_AGENCIA VARCHAR(5),
NUM_CONTA VARCHAR(10),
CONSTRAINT PK_FORNECEDOR PRIMARY KEY (CODF),
CONSTRAINT UK_NUMCONTA UNIQUE KEY (NUM_CONTA)
);

CREATE TABLE FORNECIMENTO(
COD_FORNEC INT(10),
CODF INT(10),
CODPROD INT(10),
QNTDPROD INT(100),
VALORF DECIMAL(10, 2),
DATAF DATE,
CONSTRAINT PK_FORNECIMENTO PRIMARY KEY (COD_FORNEC),
CONSTRAINT FK_FORNECIMENTO FOREIGN KEY (CODF)
REFERENCES FORNECEDOR(CODF),
CONSTRAINT FK_FORNEC_PROD FOREIGN KEY (CODPROD)
REFERENCES PRODUTO(CODPROD)
);
 
INSERT INTO PESSOA VALUES ('0', 'Godofredo da Silva', 'AV.Fernando Machado - 1000D', 'Chapeco', 'SC', '99663322');
INSERT INTO PESSOA VALUES ('1', 'Dolores de Cezaro', 'AV.Fernando Machado - 1000D', 'Chapeco', 'SC', '99895626');
INSERT INTO PESSOA VALUES ('2', 'Godolores de Cezaro da Silva', 'AV.Fernando Machado - 1000D', 'Chapeco', 'SC', '99895876');
INSERT INTO PESSOA VALUES ('3', 'Juca Torres', 'Av.Porto Alegre- 800D', 'Chapeco', 'SC', '99885522');
INSERT INTO PESSOA VALUES ('4', 'Seu zé', 'Av.Dom Pedro- 885D', 'Chapeco', 'SC', '998865422');
INSERT INTO PESSOA VALUES ('5', 'Ana Tomazeli', 'R. Rio de janeiro 987D', 'Chapeco', 'SC', '9969814');
INSERT INTO PESSOA VALUES ('6', 'Seu tiao', 'Av.Dom Pedro- 8865D', 'Chapeco', 'SC', '996851422');
INSERT INTO PESSOA VALUES ('7', 'Alemao', 'Av.Dom Pedro- 651D', 'Chapeco', 'SC', '961865422');

INSERT INTO PES_FISICA VALUES ('0', '88995577446', '7788996633');
INSERT INTO PES_FISICA VALUES ('1', '77998855661', '7788996634');
INSERT INTO PES_FISICA VALUES ('2', '88996633221', '7788996635');

INSERT INTO PES_JURIDICA VALUES ('3', '0','88996584189', 'Viver Informática');
INSERT INTO PES_JURIDICA VALUES ('4', '1','77996894864', 'Ômicron System');
INSERT INTO PES_JURIDICA VALUES ('5', '2','88996981897', 'Big Bang Tecnologias');

INSERT INTO EMAIL VALUES ('0', '0', 'godo_fredo@gmail.com');
INSERT INTO EMAIL VALUES ('1', '1','dolo_res@gmail.com');
INSERT INTO EMAIL VALUES ('2', '2', 'godo_lores@gmail.com');

INSERT INTO PES_AUTORIZADA VALUES ('4', '11224477668', 'Jhenifer calim');
INSERT INTO PES_AUTORIZADA VALUES ('1', '77998855443', 'Irineu da Cunha');

INSERT INTO PRODUTO VALUES ('0', 'Gasolina', '90', '8.5');
INSERT INTO PRODUTO VALUES ('1', 'Etanol', '90', '5.5');
INSERT INTO PRODUTO VALUES ('2', 'Diesel', '80', '4.2');
INSERT INTO PRODUTO VALUES ('3', 'Diesel s10', '50', '4.9');
INSERT INTO PRODUTO VALUES ('4', 'Gasolina aditivada', '50', '15.5');

INSERT INTO VENDA VALUES ('0','0', '0', '30', '2018/11/05', '2018/11/06');
INSERT INTO VENDA VALUES ('1','1', '0', '20', '2018/12/09', '2018/12/29');
INSERT INTO VENDA VALUES ('2','4', '1', '40', '2018/05/07', '2018/11/12');
INSERT INTO VENDA VALUES ('3','2', '2', '51', '2018/03/30', '2018/04/09');
INSERT INTO VENDA VALUES ('4','3', '4', '30', '2018/08/06', '2018/12/08');

INSERT INTO FORNECEDOR VALUES ('0', 'Tio da gasosa', 'MaxAlfa','5485','04098709875', 'Av.Fernando Machado - 8923E', 'Chapeco', 'SC', '961865422', '1264', '9657844');
INSERT INTO FORNECEDOR VALUES ('1', 'Tio do Etanol', 'MaxGali','89755','046811878875', 'Av.Sao Pedro- 88D', 'Chapeco', 'SC', '9619894848', '1274', '9658975');
INSERT INTO FORNECEDOR VALUES ('2', 'Tio do Diesel', 'MaxDelta','8979','098598526988', 'Av.Getulio VArgas- 988D', 'Chapeco', 'SC', '69846854', '1214', '8998849');

INSERT INTO FORNECIMENTO VALUES ('0','1', '1', '150', '4', '2018/05/06');
INSERT INTO FORNECIMENTO VALUES ('1','0', '0', '110', '5.5', '2018/05/09');
INSERT INTO FORNECIMENTO VALUES ('2','2', '3', '90', '3.2', '2018/05/15');
INSERT INTO FORNECIMENTO VALUES ('3','0', '4', '100', '5.3', '2018/05/20');

-- a) índice para buscar os dados de vendas ordenados pela data do pagamento;
CREATE INDEX IND_DADOS_VENDA ON VENDA(DATAP);
-- SELECT * FROM VENDA ORDER BY DATAP;
-- SHOW INDEX FROM VENDA;

-- b) índice para buscar os dados de vendas ordenados pela data da venda;
CREATE INDEX IND_DADOS_VENDAV ON VENDA(DATAV);
-- SELECT * FROM VENDA ORDER BY DATAV;
-- SHOW INDEX FROM VENDA;

-- c) índice para buscar os dados de fornecedor ordenados por estado e cidade;
CREATE INDEX IND_FORNECEDOR ON FORNECEDOR(UF,CIDADE);
-- SELECT * FROM FORNECEDOR ORDER BY UF,CIDADE;
-- SHOW INDEX FROM FORNECEDOR;

-- d) índices para buscar os dados de clientes e fornecedores ordenados por CNPJ ou CPF;
CREATE INDEX IND_FORNECEDORCNPJ ON FORNECEDOR(CNPJ);
-- SELECT * FROM FORNECEDOR ORDER BY CNPJ;
-- SHOW INDEX FROM FORNECEDOR;

-- d) índices para buscar os dados de clientes e fornecedores ordenados por CNPJ ou CPF;
CREATE INDEX IND_CLIENTEF ON PES_FISICA(CPF);
-- SELECT * FROM PES_FISICA ORDER BY CPF;
-- SHOW INDEX FROM PES_FISICA;

-- d) índices para buscar os dados de clientes e fornecedores ordenados por CNPJ ou CPF;
CREATE INDEX IND_CLIENTEJ ON PES_JURIDICA(CNPJ);
-- SELECT * FROM PES_JURIDICA ORDER BY CNPJ;
-- SHOW INDEX FROM PES_JURIDICA;

-- e) um gatilho que, a cada novo fornecimento realizado, adicione a quantidade fornecida na tabela
-- de produto, conforme o código do produto fornecido;
DELIMITER //
CREATE TRIGGER ADDQNTD AFTER INSERT ON FORNECIMENTO FOR EACH ROW
BEGIN
UPDATE PRODUTO 
    SET PRODUTO.QNTD= PRODUTO.QNTD + NEW.QNTDPROD 
    WHERE NEW.CODPROD = PRODUTO.CODPROD;
END 
//
DELIMITER ;

-- f) um procedimento que atualize todos os produtos com um acréscimo a ser informado como
-- parâmetro;
DELIMITER //
CREATE PROCEDURE AUMENTAR(IN QUANT INT)
BEGIN
   UPDATE PRODUTO SET VALOR = VALOR + (VALOR*QUANT/100);
END //
DELIMITER ;

-- CALL AUMENTAR(1);
-- g) uma função que retorne o número de dias entre a data da venda e a data de pagamento,
-- passando como parâmetro o código da venda realizada;
DELIMITER //
CREATE FUNCTION DIF_DIAS(COD_VENDA INT)
RETURNS INT
BEGIN
	DECLARE VENDA DATE;
    DECLARE PAG DATE;
	SELECT DATAV INTO VENDA FROM VENDA 
    WHERE COD_VENDA = CODV;
    SELECT DATAP INTO PAG FROM VENDA 
    WHERE COD_VENDA = CODV;
    RETURN DATEDIFF(PAG,VENDA);
END
//
DELIMITER ;

-- SELECT DIF_DIAS(2);

-- h) uma visão que retorne o CNPJ dos fornecedores, seus nomes fantasia, telefones e todos os
-- fornecimentos realizados por cada fornecedor;
CREATE VIEW VW_FORNECEDOR_FORNECIMENTO
AS
SELECT F.CNPJ, F.NOME, F.TELEFONE, FO.COD_FORNEC,
FO.CODF, FO.CODPROD, FO.QNTDPROD, FO.VALORF, FO.DATAF
FROM FORNECEDOR F JOIN FORNECIMENTO FO ON F.CODF = FO.CODF
ORDER BY CODF; 

-- SELECT * FROM VW_FORNECEDOR_FORNECIMENTO;

-- i) uma visão que retorne o CPF ou CNPJ dos clientes, seus nomes e telefones e as compras
-- realizadas por cada cliente;
CREATE VIEW VW_CLIENTE_VENDA
AS
SELECT F.CPF, J.CNPJ, P.NOME, P.TELEFONE, C.CODCLI, C.CODPROD, C.QNTD, C.DATAV, C.DATAP
FROM PES_FISICA F JOIN PES_JURIDICA J JOIN PESSOA P JOIN VENDA C ON P.CODP = CODCLI
ORDER BY CODP;

#SELECT * FROM VW_CLIENTE_VENDA;

/* j) uma função que retorne o valor total a receber pelas vendas realizadas entre duas datas, como
por exemplo, 01/05/2017 e 31/05/2018.*/
DELIMITER //
CREATE FUNCTION TOTAL_RECEBER(DATA_INI DATE, DATA_FIN DATE)
RETURNS DECIMAL(8,2)
BEGIN
DECLARE TOTAL DECIMAL(8,2); 
SELECT sum(V.QNTD * P.VALOR) INTO TOTAL FROM VENDA V, PRODUTO P
WHERE V.CODPROD = P.CODPROD AND V.DATAV >= DATA_INI AND V.DATAV <= DATA_FIN;
   
   RETURN TOTAL;
END
//
DELIMITER ;

--  SELECT TOTAL_RECEBER('2018/01/01','2018/06/01');
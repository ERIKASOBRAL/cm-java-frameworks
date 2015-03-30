CREATE TABLE LIVRO (ID BIGINT NOT NULL, DESCRICAO VARCHAR(255), EDITORA VARCHAR(255), ILUSTRACOES SMALLINT DEFAULT 0, ISBN VARCHAR(255), NRODEPAGINAS INTEGER, PRECO FLOAT, TITULO VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE PESSOA (ID BIGINT NOT NULL, CPF VARCHAR(255), PRIMEIRONOME VARCHAR(255), ULTIMONOME VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE t_endereco (ID BIGINT NOT NULL, RUA1 VARCHAR(255), RUA2 VARCHAR(255), CEP VARCHAR(255), CIDADE VARCHAR(255), ESTADO VARCHAR(255), PAIS VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE t_cidade (ID BIGINT NOT NULL, CEP VARCHAR(255), CIDADE VARCHAR(255), ESTADO VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE t_pais (ID BIGINT NOT NULL, PAIS VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE noticias (CONTEUDO VARCHAR(255), TITULO VARCHAR(255) NOT NULL, IDIOMA VARCHAR(255) NOT NULL, PRIMARY KEY (TITULO, IDIOMA))
CREATE TABLE T_Trilha_Musica (ID BIGINT NOT NULL, DESCRICAO VARCHAR(255), DURACAO FLOAT, MUSICA BLOB(2147483647), TITULO VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE T_Livros (ID BIGINT NOT NULL, DESCRICAO VARCHAR(2000), ILUSTRACOES SMALLINT DEFAULT 0, ISBN VARCHAR(255), nro_de_paginas INTEGER NOT NULL, PRECO FLOAT, livro_titulo VARCHAR(255) NOT NULL, PRIMARY KEY (ID))
CREATE TABLE t_consumidor (ID BIGINT NOT NULL, DATACRIACAO TIMESTAMP, DATADENASCIMENTO DATE, EMAIL VARCHAR(255), NUMEROTELEFONE VARCHAR(255), PRIMEIRONOME VARCHAR(255), ULTIMONOME VARCHAR(255), ENDERECO_ID BIGINT, ce_endereco BIGINT NOT NULL, PRIMARY KEY (ID))
CREATE TABLE t_cartao_credito (NUMERO VARCHAR(255) NOT NULL, BANDEIRACARTAOCREDITO VARCHAR(255), DATAVALIDADE VARCHAR(255), NUMEROCONTROLE INTEGER, PRIMARY KEY (NUMERO))
CREATE TABLE T_consumidor_metodos (ID BIGINT NOT NULL, EMAIL VARCHAR(255), numero_telefone VARCHAR(555), primeiro_nome VARCHAR(50) NOT NULL, ultimo_nome VARCHAR(50) NOT NULL, PRIMARY KEY (ID))
CREATE TABLE T_Livro_Etiqueta (ID BIGINT NOT NULL, DESCRICAO VARCHAR(255), ILUSTRACOES SMALLINT DEFAULT 0, ISBN VARCHAR(255), NRODEPAGINAS INTEGER, PRECO FLOAT, TITULO VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE t_consumidor_com_endereco (ID BIGINT NOT NULL, EMAIL VARCHAR(255), numero_telefone VARCHAR(15), primeiro_nome VARCHAR(50) NOT NULL, ultimo_nome VARCHAR(50) NOT NULL, zip_code VARCHAR(10), CIDADE VARCHAR(50) NOT NULL, ESTADO VARCHAR(3), PAIS VARCHAR(255), RUA1 VARCHAR(255) NOT NULL, RUA2 VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE t_item_compra (ID BIGINT NOT NULL, ITEM VARCHAR(255), PRECOUNITARIO FLOAT, QUANTIDADE INTEGER, PRIMARY KEY (ID))
CREATE TABLE t_recibo (ID BIGINT NOT NULL, DATACRIACAO TIMESTAMP, PRIMARY KEY (ID))
CREATE TABLE t_etiquetas (LivroEtiqueta_ID BIGINT, ETIQUETAS VARCHAR(255))
CREATE TABLE t_recibo_t_item_compra (Recibo_ID BIGINT NOT NULL, itensCompra_ID BIGINT NOT NULL, PRIMARY KEY (Recibo_ID, itensCompra_ID))
ALTER TABLE t_cidade ADD CONSTRAINT FK_t_cidade_ID FOREIGN KEY (ID) REFERENCES t_endereco (ID)
ALTER TABLE t_pais ADD CONSTRAINT FK_t_pais_ID FOREIGN KEY (ID) REFERENCES t_endereco (ID)
ALTER TABLE t_consumidor ADD CONSTRAINT tcnsumidorcndereco FOREIGN KEY (ce_endereco) REFERENCES t_endereco (ID)
ALTER TABLE t_consumidor ADD CONSTRAINT tcnsumidorNDRECOID FOREIGN KEY (ENDERECO_ID) REFERENCES t_endereco (ID)
ALTER TABLE t_etiquetas ADD CONSTRAINT ttqtasLvrtiquetaID FOREIGN KEY (LivroEtiqueta_ID) REFERENCES T_Livro_Etiqueta (ID)
ALTER TABLE t_recibo_t_item_compra ADD CONSTRAINT trcbttmcmptnsCmprD FOREIGN KEY (itensCompra_ID) REFERENCES t_item_compra (ID)
ALTER TABLE t_recibo_t_item_compra ADD CONSTRAINT trcbttemcompraRcbD FOREIGN KEY (Recibo_ID) REFERENCES t_recibo (ID)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(15), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0)

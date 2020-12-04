DELIMITER //
CREATE PROCEDURE insere_fatura (IN nr INT, IN preco Decimal(6,2), IN nif INT, IN nome_cli VARCHAR(50), 
									IN iva Decimal(3,2), IN nr_funcionario INT, IN tipo_pagamento VARCHAR(45), IN data1 DATE)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
		
        DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
    
		START TRANSACTION;
			INSERT INTO Fatura
				(Numero, Preco_sem_IVA, NIF_cliente, Nome_Cliente, IVA, Funcionario_Numero, Tipo_Pagamento, Data_Emissao)
				VALUES
				(nr,preco,nif,nome_cli,iva,nr_funcionario,tipo_pagamento,data1);
		COMMIT;
	END //

CREATE PROCEDURE insere_funcionario (IN nr INT, IN email VARCHAR(100), IN tel VARCHAR(20), IN nome VARCHAR(50), IN funcao VARCHAR(20),
									 IN nif_restaurante INT, IN genero VARCHAR(45), IN nacionalidade VARCHAR(45), IN data_Nascimento DATE)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
		
        DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
    
		START TRANSACTION;
			INSERT INTO Funcionario
				(Numero,Email,Telefone,Nome,Data_nascimento,Função,Restaurante_NIF,Genero,Nacionalidade)
				VALUES
				(nr,email,tel,nome,data_Nascimento,funcao,nif_restaurante,genero,nacionalidade);
		COMMIT;
	END //


CREATE PROCEDURE insere_restaurante (IN nif INT, IN email VARCHAR(100), IN tel VARCHAR(20), IN gerente VARCHAR(50), IN rua VARCHAR(75),
									 IN cp VARCHAR(20), IN localidade VARCHAR(50), IN nif_sede INT, IN capacidade INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
		
        DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
    
		START TRANSACTION;
			INSERT INTO Restaurante
				(NIF,Email,Telefone,Nome_gerente,Rua,Codigo_postal,Localidade,Sede_NIF,Capacidade)
				VALUES
				(nif,email,tel,gerente,rua,cp,localidade,nif_sede,capacidade);
		COMMIT;
	END //
  
CREATE PROCEDURE insere_Fornecedor (IN nif INT, IN email VARCHAR(45), IN tel INT, IN tipo VARCHAR(20), IN nome VARCHAR(50))
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
		
        DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
    
		START TRANSACTION;
			INSERT INTO Fornecedor
				(NIF,Email,Telefone,Tipo,Nome)
				VALUES
				(nif,email,tel,tipo,nome);
		COMMIT;
	END //
    
  
 CREATE PROCEDURE insere_ItemMenu (IN nr INT, IN nome VARCHAR(50),IN categoria VARCHAR(20), IN descricao VARCHAR(200), 
								   IN preco DECIMAL(6,2),IN tipo VARCHAR(30))
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
		
        DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
    
		START TRANSACTION;
			INSERT INTO ItemMenu
				(Numero,Nome,Categoria,Descricao,Preco,Tipo)
				VALUES
				(nr,nome,categoria,descricao,preco,tipo);
		COMMIT;
	END // 
use restaurante;

-- 1 - Funcionarios que registaram mais faturas por ordem decrescente
DELIMITER //
CREATE PROCEDURE funcionario_mais_faturas ()
	BEGIN
		SELECT f.Nome, COUNT(fat.Funcionario_Numero) AS Faturas 
        FROM Funcionario f, Fatura fat 
        WHERE fat.Funcionario_Numero = f.Numero 
        GROUP BY fat.Funcionario_Numero 
        ORDER BY Faturas DESC;
	END //
DELIMITER //

CALL funcionario_mais_faturas ();
DROP funcionario_mais_faturas;

-- 2 - Quais as faturas do cliente com um certo NIF
DELIMITER //
CREATE PROCEDURE faturas_Cliente_NIF (IN NIF INT) 
	BEGIN
		SELECT * FROM fatura 
        WHERE fatura.NIF_Cliente = NIF;
    END //
DELIMITER //

SET @NIF = 193747463;
CALL faturas_Cliente_NIF (@NIF);
DROP faturas_Cliente_NIF;

-- 3 - Quais os fornecedores que trabalham com um certo restaurante
DELIMITER //
CREATE PROCEDURE fornecedores_restaurante (IN Restaurante_NIF INT)
	BEGIN
		SELECT f.Nome from Fornecedor f, Restaurante_has_Fornecedor rf
        WHERE rf.Fornecedor_NIF = f.NIF 
        AND rf.Restaurante_NIF = Restaurante_NIF;
	END //
DELIMITER //

SET @Restaurante_NIF = 478364835;
CALL fornecedores_restaurante (@Restaurante_NIF);
DROP fornecedores_restaurante;

-- 4 - Qual a localidade e o NIF do restaurante de um certo funcionario
DELIMITER //
CREATE PROCEDURE restaurante_funcionario (IN Funcionario_Numero INT)
	BEGIN
		SELECT r.Localidade, r.NIF from Restaurante r, Funcionario f
        WHERE f.Numero = Funcionario_Numero
        AND f.Restaurante_NIF = r.NIF;
	END //
DELIMITER //

SET @Funcionario_Numero = 5;
CALL restaurante_funcionario (@Funcionario_Numero);
DROP restaurante_funcionario;

-- 5 - Qual o restaurante que faturou mais
DELIMITER //
CREATE PROCEDURE restauranteMaisFaturou ()
	BEGIN
		SELECT r.Localidade, SUM(fat.Preco_sem_IVA) AS receita 
        FROM restaurante r, funcionario f, fatura fat
        WHERE fat.Funcionario_Numero = f.Numero AND f.Restaurante_NIF = r.NIF
        GROUP BY r.Localidade
        ORDER BY receita DESC;
    END //
DELIMITER //

CALL restauranteMaisFaturou();
DROP restauranteMaisFaturou;

-- 6 - Qual os itens do menu mais vendidos por quantidade
DELIMITER //
CREATE PROCEDURE itens_mais_vendidos ()
	BEGIN
		SELECT i.Nome, SUM(fi.quantidade) AS Quantidade 
        FROM ItemMenu i, Fatura_has_ItemMenu fi
        WHERE i.Numero = fi.ItemMenu_Numero
        GROUP BY fi.ItemMenu_Numero
        ORDER BY Quantidade DESC;
	END //
DELIMITER //

CALL itens_mais_vendidos ();
DROP itens_mais_vendidos;

-- 7 - Qual a receita total da cadeia de restaurantes
DELIMITER //
CREATE PROCEDURE receitaTotalCadeia ()
	BEGIN
		SELECT SUM(Preco_sem_Iva * (1 + IVA)) 
        FROM fatura;
    END //
DELIMITER //

CALL receitaTotalCadeia();
DROP receitaTotalCadeia;

-- 8 - Quantas faturas foram emitidas até uma data
DELIMITER //
CREATE PROCEDURE venda_periodo (IN datamax DATE)
	BEGIN
		SELECT * FROM Fatura
        WHERE data_emissao < datamax;
	END //
DELIMITER //

SET @datemax = '2020-10-11';
CALL venda_periodo (@datemax);
DROP venda_periodo;

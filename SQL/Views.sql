DROP VIEW Top5Funcionarios;
DROP VIEW mediaIdadesFuncionarios;

CREATE VIEW Top5Funcionarios AS
	SELECT f.Nome, SUM(fat.preco_sem_IVA) AS Total
    FROM Funcionario f, Fatura fat
    WHERE f.numero = fat.Funcionario_numero
    GROUP BY fat.Funcionario_numero
    ORDER BY Total DESC
	LIMIT 5;

CREATE VIEW mediaIdadesFuncionarios AS
	Select AVG(TIMESTAMPDIFF(YEAR, Data_nascimento, CURDATE())) 
    FROM Funcionario;
    
SELECT * FROM Top5Funcionarios;
SELECT * FROM mediaIdadesFuncionarios;
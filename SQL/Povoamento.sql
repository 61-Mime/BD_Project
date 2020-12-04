use restaurante;

insert into Sede values (245654378, 'sede@quartelgrill.com', '224567653', 'André Martins', 'Praceta do Vilar', '4710-453', 'Braga');

insert into Restaurante values 
	(478364835, 'braga@quartelgrill.com', '225765926', 'António Rodrigues', 'Rua da Liberdade', '2345-156', 'Braga', 245654378, 4),
	(873234798, 'porto@quartelgrill.com', '228567341', 'Matilde Santos', 'Travessa da Liberdade', '7363-789', 'Porto', 245654378, 109),
    (123567432, 'pacos@quartelgrill.com', '255735100', 'Paulo Costela', 'Rotunda da Liberdade', '6738-243', 'Pacos de Ferreiro', 245654378, 29),
    (123456789, 'viseu@quartelgrill.com', '232232232', 'Óscar Dias', 'Praceta da Liberdade', '1234-123', 'Viseu', 245654378, 61),
    (343278934, 'vilaconde@quartelgrill.com', '229876543', 'João Pinto', 'Avenida da Liberdade', '7363-789', 'Vila do Conde', 245654378, 14);
    
insert into ItemMenu values
	(1, 'Costela de Porco', 'Carne', 'Acompanhamento: Arroz e batata frita', 6, 'Prato Principal'),
    (2, 'Robalo ao Sal', 'Peixe', 'Acompanhamento: Arroz e batata cozida', 10, 'Prato Principal'),
    (3, 'Alga na Grelha', 'Vegetariano', 'Acompanhamento: Arroz e batata cozida', 1, 'Prato Principal'),
    (4, 'Picanha Brasileira', 'Carne', 'Acompanhamento: Arroz, batata frita e feijão preto', 13, 'Prato Principal'),
    (5, 'Tubarão Grelhado', 'Peixe', 'Acompanhamento: Arroz e milho estufado', 20, 'Prato Principal'),
    (6, 'Beringela recheada de Soja na Brasa', 'Vegetariano', 'Acompanhamento: Bacon Vegetariano', 1.5, 'Prato Principal'),
    (7, 'Ribs com Molho Barbecue', 'Carne', 'Acompanhamento: Batatas fritas Rústicas', 8.5, 'Prato Principal'),
    (8, 'Bacalhau na Brasa', 'Peixe', 'Acompanhamento: Batata à murro', 5.5, 'Prato Principal'),
    (9, 'Espargo Grelhado', 'Vegetariano', 'Acompanhamento: Milho', 3.5, 'Prato Principal'),
    (10, 'Cheesecake de Limão', 'Bolo', 'Molho de limão, Queijo Mascarpone e Bolacha Torrada', 3, 'Sobremesa'),
    (11, 'Salada de Fruta', 'Fruta', 'Uva, Manga, Morango, Pessego, Laranja, Romã e Amendoim',4, 'Sobremesa'),
    (12, 'Tarte de Nata', 'Bolo', 'Massa Folhada recheada de creme de ovo', 2.5, 'Sobremesa');
    
insert into Funcionario values
    (1, 'toro@quartelgrill.com', '929292929', 'António Rodrigues', '2000-11-21', 'Gerente', 478364835, 'Non-Binary', 'Espanhol'),
    (2, 'masa@quartelgrill.com', '922222229', 'Matilde Santos', '2000-6-2', 'Gerente', 873234798, 'Feminino', 'Português'),
    (3, 'paco@quartelgrill.com', '929999999', 'Paulo Costela', '2000-2-13', 'Gerente', 123567432, 'Masculino', 'Português'),
    (4, 'osdi@quartelgrill.com', '921234567', 'Óscar Dias', '2000-4-2', 'Gerente', 123456789, 'Masculino', 'Português'),
    (5, 'jopi@quartelgrill.com', '929876543', 'João Pinto', '2000-8-9', 'Gerente', 343278934, 'Masculino', 'Português'),
    (6, 'ripe@quartelgrill.com', '922323232', 'Ricardo Pereira', '2000-1-19', 'Cozinheiro', 478364835, 'Masculino', 'Luxemburguês'),
    (7, 'roni@quartelgrill.com', '921111111', 'Ronaldo Nilson', '2000-3-9', 'Cozinheiro', 873234798, 'Masculino', 'Brasileiro'),
    (8, 'pelo@quartelgrill.com', '926666666', 'Pedro Lopes', '2000-12-24', 'Cozinheiro', 123567432, 'Masculino', 'Português'),
    (9, 'jaga@quartelgrill.com', '927777777', 'Jacqueline Gaúcho', '2000-5-31', 'Cozinheiro', 123456789, 'Feminino', 'Brasileiro'),
    (10, 'judi@quartelgrill.com', '928888888', 'Juan Diaz', '2000-7-22', 'Cozinheiro', 343278934, 'Masculino', 'Venezuelano'),
    (11, 'pepi@quartelgrill.com', '929876543', 'Pedro Pinto', '1998-1-9', 'Empregado de Mesa', 478364835, 'Masculino', 'Português'),
    (12, 'anmo@quartelgrill.com', '923333333', 'Anita Moraes', '1999-10-23', 'Empregado de Mesa', 873234798, 'Feminino', 'Brasileira'),
    (13, 'rima@quartelgrill.com', '924444444', 'Rita Marques', '1993-11-3', 'Empregado de Mesa', 123567432, 'Feminino', 'Português'),
    (14, 'medj@quartelgrill.com', '925555555', 'Mésaq Dju', '1994-2-22', 'Empregado de Mesa', 123456789, 'Masculino', 'Angolano'),
    (15, 'beco@quartelgrill.com', '920000000', 'Bernardo Costa', '1997-4-14', 'Empregado de Mesa', 343278934, 'Masculino', 'Português');
    
insert into Fornecedor values 
	(111111111, 'geral@sendvegies.com', '213441234', 'Vegetais', 'SendVegies'),
    (111111112, 'comercial@ludite.com', '217541214', 'Vegetais', 'Ludite'),
    (111111113, 'geral@carnesmeireles.com', '213447934', 'Carne', 'Carnes Meireles'), 
    (111111114, 'geral@talhooliveira.com', '225242567', 'Carne', 'Talho Oliveira'),
    (111111115, 'geral@lotadeangeiras.com', '238464936', 'Peixe', 'Lota de Angeiras'), 
    (111111116, 'geral@peixedateresa.com', '225242567', 'Peixe', 'Peixe da Teresa'),
    (111111117, 'entregas@mariabolacha.com', '225242567', 'Bolos', 'Maria Bolacha'); 
    
insert into Fatura values
	(1, 19, null, null, 0.23, 14, 'Dinheiro', '2020-8-15'),
    (2, 20, 125432357, 'Luís Sousa', 0.23, 12, 'Cartao', '2020-9-3'),
    (3, 45, null, null, 0.23, 10, 'Dinheiro', '2020-9-11'),
    (4, 86, null, null, 0.23, 10, 'Cartao', '2020-9-20'),
    (5, 35, 193747463, 'Rui Vieira', 0.23, 11, 'Cartao', '2020-10-5'),
    (6, 82, null, null, 0.23, 15, 'Dinheiro', '2020-10-14'),
    (7, 180, 594738379, 'Novo Banco', 0.23, 14, 'Dinheiro', '2020-10-17'),
    (8, 83, null, null, 0.23, 14, 'Dinheiro', '2020-10-20'),
    (9, 82, null, null, 0.23, 12, 'Cartao', '2020-10-26'),
    (10, 64, 736464738, 'Pedro Faria', 0.23, 11, 'Cheque', '2020-11-4'),
    (11, 10, null, null, 0.23, 10, 'Dinheiro', '2020-11-9'),
    (12, 13, null, null, 0.23, 13, 'Dinheiro', '2020-11-14'),
    (13, 100, null, null, 0.23, 13, 'Dinheiro', '2020-11-17'),
    (14, 50, null, null, 0.23, 12, 'Cartao', '2020-11-23'),
    (15, 20, null, null, 0.23, 15, 'Cheque', '2020-11-29');
    
insert into Restaurante_has_Fornecedor values
	(478364835, 111111111),
    (478364835, 111111113),
    (478364835, 111111115),
    (478364835, 111111117),
    (873234798, 111111111),
    (873234798, 111111114),
    (873234798, 111111116),
    (873234798, 111111117),
    (123567432, 111111112),
    (123567432, 111111114),
    (123567432, 111111115),
    (123567432, 111111117),
    (123456789, 111111112),
    (123456789, 111111113),
    (123456789, 111111116),
    (123456789, 111111117),
    (343278934, 111111112),
    (343278934, 111111113),
    (343278934, 111111115),
    (343278934, 111111117);
    
insert into Restaurante_has_ItemMenu values
	(478364835, 1),
    (478364835, 2),
    (478364835, 3),
    (478364835, 4),
    (478364835, 5),
    (478364835, 6),
    (478364835, 10),
    (478364835, 11),
    
    (873234798, 4),
    (873234798, 5),
    (873234798, 6),
    (873234798, 7),
    (873234798, 8),
    (873234798, 9),
    (873234798, 10),
    (873234798, 12),
    
    (123567432, 1),
    (123567432, 2),
    (123567432, 3),
    (123567432, 7),
    (123567432, 8),
    (123567432, 9),
    (123567432, 11),
    (123567432, 12),
    
    (123456789, 1),
    (123456789, 2),
    (123456789, 6),
    (123456789, 7),
    (123456789, 5),
    (123456789, 9),
    (123456789, 11),
    (123456789, 12),
    
    (343278934, 4),
    (343278934, 5),
    (343278934, 3),
    (343278934, 7),
    (343278934, 2),
    (343278934, 9),
    (343278934, 10),
    (343278934, 11);
    
insert into Fatura_has_ItemMenu values
	(1, 1, 2),
    (1, 12, 2),
    
    (2, 2, 1),
    (2, 3, 1),
    (2, 11, 2),
    
    (3, 7, 1),
    (3, 8, 2),
    (3, 9, 1),
    (3, 10, 2),
    (3, 11, 1),
    (3, 12, 1),
    
    (4, 5, 1),
    (4, 11, 1),
    
    (5, 4, 4),
    
    (6, 6, 1),
    (6, 7, 3),
    (6, 1, 2),
    (6, 12, 6),
    
    (7, 2, 4),
    (7, 10, 2),
    
    (8, 7, 3),
    (8, 8, 1),
    (8, 10, 2),
    (8, 11, 1),
    (8, 12, 2),
    
    (9, 4, 1),
    
    (10, 9, 2),
    (10, 8, 1),
    (10, 3, 1),
    (10, 12, 3),
    (10, 10, 1),
    
    (11, 1, 1),
    (11, 3, 1),
    (11, 10, 1),
    
    (12, 10, 3),
    
    (13, 4, 2),
    (13, 5, 3),
    (13, 11, 4),
    (13, 12, 1),
    
    (14, 8, 5),
    (14, 10, 5),
    
    (15, 3, 4);
    
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_generation_game_online;

-- Uso do banco de dados criado
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE IF NOT EXISTS tb_classes (
    classe_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    tipo VARCHAR(50)
);

-- Criação da tabela tb_personagens
CREATE TABLE IF NOT EXISTS tb_personagens (
    personagem_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    poder_ataque INT,
    poder_defesa INT,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(classe_id)
);

-- Inserção de registros na tabela tb_classes
INSERT INTO tb_classes (nome, tipo) VALUES 
('Guerreiro', 'Melee'),
('Mago', 'Ranged'),
('Arqueiro', 'Ranged'),
('Cavaleiro', 'Melee'),
('Assassino', 'Melee');

-- Inserção de registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, classe_id) VALUES
('Guerradeira', 2500, 1500, 1),
('Mago Negro', 1800, 1200, 2),
('Arqueira Mestra', 2200, 1100, 3),
('Cavaleiro Sagrado', 2100, 1800, 4),
('Assassina Mortal', 1900, 1000, 5),
('Guerreiro Feroz', 3000, 2000, 1),
('Maga Elemental', 2400, 1300, 2),
('Arqueiro Veloz', 2000, 1000, 3);

-- SELECT que retorna todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT que retorna todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE, buscando todos os personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT p.*, c.nome AS classe_nome 
FROM tb_personagens p 
INNER JOIN tb_classes c ON p.classe_id = c.classe_id;

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica
SELECT p.*, c.nome AS classe_nome 
FROM tb_personagens p 
INNER JOIN tb_classes c ON p.classe_id = c.classe_id 
WHERE c.nome = 'Arqueiro';

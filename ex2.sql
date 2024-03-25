-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;

-- Uso do banco de dados criado
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255)
);

-- Criação da tabela tb_pizzas
CREATE TABLE IF NOT EXISTS tb_pizzas (
    pizza_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    valor DECIMAL(10, 2),
    ingredientes VARCHAR(255),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(categoria_id)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES 
('Salgada', 'Pizzas com ingredientes salgados'),
('Doce', 'Pizzas com ingredientes doces'),
('Vegetariana', 'Pizzas sem carne');

-- Inserção de registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, valor, ingredientes, categoria_id) VALUES
('Mussarela', 35.90, 'Molho de tomate, mussarela', 1),
('Calabresa', 40.50, 'Molho de tomate, calabresa, cebola', 1),
('Chocolate com Morango', 55.00, 'Chocolate, morango', 2),
('Margherita', 42.00, 'Molho de tomate, mussarela, manjericão', 1),
('Quatro Queijos', 48.90, 'Molho de tomate, mussarela, gorgonzola, parmesão, provolone', 1),
('Frango com Catupiry', 45.00, 'Molho de tomate, frango desfiado, catupiry', 1),
('Portuguesa', 38.00, 'Molho de tomate, presunto, mussarela, ovo, cebola, azeitona', 1),
('Banana com Canela', 30.00, 'Banana, canela, leite condensado', 2);

-- SELECT que retorna todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- SELECT que retorna todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT p.*, c.nome AS categoria_nome 
FROM tb_pizzas p 
INNER JOIN tb_categorias c ON p.categoria_id = c.categoria_id;

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica
SELECT p.*, c.nome AS categoria_nome 
FROM tb_pizzas p 
INNER JOIN tb_categorias c ON p.categoria_id = c.categoria_id 
WHERE c.nome = 'Doce';

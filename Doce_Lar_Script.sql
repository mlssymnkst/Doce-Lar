-- Configuração de Data BR
SET DATESTYLE TO POSTGRES, DMY ;
SELECT current_date, current_timestamp ;

-- TABELA: USUARIOS
DROP TABLE IF EXISTS usuarios CASCADE;
CREATE TABLE usuarios (
cod_usuario SERIAL PRIMARY KEY,
nome_usuario VARCHAR(80) NOT NULL,
email VARCHAR(200) NOT NULL,
senha_usu VARCHAR(25) NOT NULL,
data_criacao DATE NOT NULL 
);

-- POPULANDO USUARIOS
SELECT * FROM usuarios;
INSERT INTO usuarios VALUES (default, 'Luiz Fabiano', 'luiz.fabiano@gmail.com', 'Luiz2025', '14/10/2025'); 
INSERT INTO usuarios VALUES (default, 'Mariana Borges', 'mariana.borges@gmail.com', 'Mariana2025', '18/10/2025');
INSERT INTO usuarios VALUES (default, 'Melissa Yumi', 'melissa.nakasato@gmail.com', 'Melissa2025', '01/11/2025');
INSERT INTO usuarios VALUES (default, 'Sheila Rodrigues', 'sheila.rodrigues@gmail.com', 'Sheila2025', '03/11/2025');
INSERT INTO usuarios VALUES (default, 'Victor Ramon', 'victor.ramon@gmail.com', 'Victor2025', '08/10/2025');

-- TABELA: CATEGORIA
DROP TABLE IF EXISTS categoria CASCADE;
CREATE TABLE categoria (
cod_categ SERIAL PRIMARY KEY, 
nome_categ VARCHAR(20) NOT NULL,
obs VARCHAR(200) NOT NULL
);

-- POPULANDO CATEGORIA
SELECT * FROM categoria;
INSERT INTO categoria VALUES 
(default, 'Ingredientes', 'Farinha, açúcar, fermento, chocolate, manteiga, ovos, etc.'),
(default, 'Embalagens', 'Caixas, sacolas, fitas, etiquetas'),
(default, 'Limpeza', 'Detergente, álcool, esponja'),
(default, 'Complementos', 'Coberturas, confeitos, corantes'),
(default, 'Consumíveis', 'Coca-cola, água de garrafa, sucos...'); 


-- TABELA: MEDIDAS
DROP TABLE IF EXISTS medidas CASCADE;
CREATE TABLE medidas (
cod_medida SMALLSERIAL PRIMARY KEY, 
cod_usuario INTEGER NOT NULL REFERENCES usuarios(cod_usuario),
unid_base VARCHAR(10) NOT NULL,
descricao VARCHAR(100) NOT NULL
);

--POPULANDO MEDIDAS
SELECT * FROM medidas;
INSERT INTO medidas VALUES
(default, 1, 'kg', 'Quilograma'),
(default, 4, 'g', 'Grama'),
(default, 2, 'L', 'Litro'),
(default, 3, 'un', 'Unidade'),
(default, 2, 'cx', 'Caixa (embalagem)');

-- TABELA: INSUMOS
DROP TABLE IF EXISTS insumos CASCADE;
CREATE TABLE insumos (
cod_insumo SMALLSERIAL PRIMARY KEY,
nome_insumo VARCHAR(50) NOT NULL,
tipo VARCHAR(30) NOT NULL,
descricao VARCHAR(200),
qtde_min SMALLINT NOT NULL, 
qtde_max SMALLINT NOT NULL,
qtde_atual SMALLINT NOT NULL,
valor_insumo DECIMAL (4,2) NOT NULL,
data_validade DATE NOT NULL,
cod_medida INTEGER NOT NULL REFERENCES medidas(cod_medida),
cod_usuario INTEGER NOT NULL REFERENCES usuarios(cod_usuario),
cod_categ INTEGER NOT NULL REFERENCES categoria(cod_categ)
);

--POPULANDO INSUMOS
SELECT * FROM insumos;
INSERT INTO insumos VALUES
(default, 'Farinha de Trigo', 'Ingrediente', 'Farinha de trigo tipo 1 - uso geral para massas', 10, 200, 26,10.30,'20/12/2025', 1, 1, 1),
(default, 'Açúcar Cristal', 'Ingrediente', 'Açúcar cristal para massas e coberturas', 5, 150, 22,4.29,'26/11/2025', 1, 1, 1),
(default, 'Manteiga', 'Ingrediente', 'Manteiga sem sal para recheios e massas', 10, 50, 8,9.00,'18/11/2025', 1, 2, 1),
(default, 'Chocolate em Gotas', 'Complementos', 'Gotas de chocolate meio amargo para confeitar', 3, 50, 12,40.00,'28/02/2026', 1, 3, 4),
(default, 'Ovos', 'Ingrediente', 'Ovos grandes - caixa com 30 unidades', 5, 300, 92,25.00,'10/11/2025', 4, 2, 1),
(default, 'Chantilly Pronto', 'Ingrediente', 'Creme chantilly para finalização (litros)', 3, 20, 22,32.50,'24/12/2025', 3, 4, 1),
(default, 'Caixa de Embalagem P', 'Embalagens', 'Caixa para doces - pequeno (pacote)', 20, 500, 200,45.00,'05/11/2026', 5, 5, 2),
(default, 'Caixa de Embalagem M', 'Embalagens', 'Caixa média para bolos/potes', 20, 500, 80,65.00,'05/11/2026', 5, 5, 2),
(default, 'Detergente Líquido', 'Limpeza', 'Detergente para limpeza de utensílios', 2, 100, 12,2.35,'12/08/2026', 3, 1, 3),
(default, 'Corante Gel', 'Complementos', 'Corante alimentício em gel', 2, 7, 2,4.49,'30/09/2026', 2, 3, 4),
(default, 'Frutas (Banana)', 'Ingrediente', 'Banana para recheios e coberturas', 2, 100, 6,9.50,'05/12/2025', 1, 2, 1),
(default, 'Coca-cola lata', 'Consumíveis', null, 6, 60, 12, 4.00, '12/08/2027', 4, 3, 5),
(default, 'Leite Condensado', 'Ingrediente', 'Leite Moça', 4, 20, 2, 10.20, '02/05/2026', 3, 2, 1),
(default, 'Frutas (Morango)', 'Ingrediente', 'Morango para recheios, coberturas e doces', 1, 6, 9, 12.00,'30/11/2025', 2, 5, 1),
(default,'Açúcar Mascavo','Ingrediente','Açúcar mascavo para receitas naturais',5,150,40,6.80,'10/12/2025',1,2,1),
(default,'Fermento Biológico Seco','Ingrediente','Fermento seco para massas',3,80,1,5.90,'20/05/2026',4,4,1),
(default,'Fermento Químico','Ingrediente','Fermento químico em pó',3,15,4,4.20,'18/04/2026',4,5,1),
(default,'Cacau em Pó 100%','Ingrediente','Cacau puro para bolos e brownies',5,120,35,18.00,'30/09/2026',1,1,1),
(default,'Creme de Leite','Ingrediente','Caixa 200ml',3,40,64,4.50,'12/12/2025',3,2,1),
(default,'Leite Integral','Ingrediente','Leite integral 1 litro',4,60,3,4.90,'05/12/2025',3,3,1),
(default,'Leite em Pó','Ingrediente','Leite em pó integral',8,80,36,22.00,'12/04/2026',1,4,1),
(default,'Gelatina Incolor','Ingrediente','Pacote de 24g',2,10,15,3.40,'11/06/2026',4,5,1),
(default,'Gelatina Morango','Ingrediente','Gelatina sabor morango',3,40,20,2.50,'18/07/2026',4,1,1),
(default,'Óleo Vegetal','Ingrediente','Óleo de soja 900ml',3,30,10,7.30,'20/02/2026',3,2,1),
(default,'Essência de Baunilha','Complementos','Essência sabor baunilha',2,20,7,9.90,'15/10/2026',3,3,4),
(default,'Essência de Amêndoas','Complementos','Essência aromatizante',2,20,1,10.50,'20/09/2025',3,4,4),
(default,'Granulado de Chocolate','Complementos','Granulado tradicional',5,100,40,16.00,'12/03/2026',1,5,4),
(default,'Granulado Colorido','Complementos','Confeito colorido',5,100,50,15.50,'11/03/2026',1,1,4),
(default,'Lacre Adesivo','Embalagens','Lacres de segurança para caixas',20,300,100,12.00,'10/11/2027',5,2,2),
(default,'Saco Para Pão de Mel','Embalagens','Pacote com 50 unidades',10,400,7,8.00,'20/05/2027',5,3,2),
(default,'Fita Decorativa Vermelha','Embalagens','Fita para presente',5,100,153,9.50,'10/09/2027',5,4,2),
(default,'Desinfetante Floral','Limpeza','1 litro',2,80,15,4.80,'12/05/2027',3,5,3),
(default,'Álcool 70%','Limpeza','Álcool líquido 1L',2,3,7,6.30,'05/10/2027',3,1,3),
(default,'Esponja Dupla Ação','Limpeza','Esponja abrasiva',10,200,60,1.80,'10/12/2027',4,2,3),
(default,'Pano Multiuso','Limpeza','Pano reutilizável',10,200,80,2.90,'10/12/2027',4,3,3),
(default,'Corante Azul','Complementos','Corante alimentício azul',2,10,4,4.20,'10/09/2026',2,4,4),
(default,'Corante Vermelho','Complementos','Corante alimentício vermelho',2,10,5,4.20,'10/09/2026',2,5,4),
(default,'Corante Amarelo','Complementos','Corante alimentício amarelo',2,10,3,4.20,'10/09/2025',2,1,4),
(default,'Copo Descartável 200ml','Consumíveis','Pacote com 100 unidades',20,300,150,7.90,'11/08/2027',5,2,5),
(default,'Água Mineral 500ml','Consumíveis','Garrafa individual',10,200,60,2.50,'12/08/2027',4,3,5),
(default,'Suco de Laranja','Consumíveis','Caixa 1 litro',10,60,5,6.80,'16/02/2026',3,4,5),
(default,'Refrigerante Guaraná Lata','Consumíveis','Lata 350ml',10,100,30,4.00,'18/08/2027',4,5,5),
(default,'Creme Cheese','Ingrediente','Cream cheese 1kg',4,15,16,15.90,'24/03/2026',1,1,1),
(default,'Coco Ralado','Ingrediente','Coco ralado fino',5,100,40,9.80,'22/05/2026',1,3,1),
(default,'Amido de Milho','Ingrediente','Caixa 200g',3,60,30,4.20,'10/08/2026',4,4,1),
(default,'Nozes Trituradas','Ingredientes','Nozes picadas para recheio',3,30,10,28.90,'15/12/2025',1,5,1),
(default,'Amêndoas Laminadas','Ingrediente','Amêndoas fatiadas',3,40,18,32.00,'20/02/2026',1,1,1),
(default,'Geléia de Morango','Complementos','Geleia para recheio',3,40,20,12.50,'10/03/2026',3,2,4),
(default,'Geléia de Damasco','Complementos','Geleia premium',3,40,15,14.90,'10/03/2026',3,3,4),
(default,'Papel Toalha','Limpeza','Rolo de papel toalha',10,200,80,3.80,'10/05/2027',4,4,3),
(default,'Caixa para Bolo G','Embalagens','Caixa grande reforçada',20,200,70,85.00,'15/11/2027',5,5,2),
(default,'Café Solúvel','Consumíveis','Pote 200g',5,50,3,12.70,'12/12/2026',4,1,5),
(default,'Chocolate Branco Barra','Ingrediente','Barra 1kg',3,40,48,32.90,'20/05/2026',1,2,1),
(default,'Chocolate Amargo Barra','Ingrediente','Barra 1kg 70%',3,40,52,35.90,'20/05/2026',1,3,1),
(default,'Pão de Mel Base','Ingrediente','Base pronta para rechear',10,200,80,25.00,'05/04/2026',4,4,1),
(default,'Biscoito Maizena','Ingrediente','Usado para base de tortas',10,50,60,4.90,'22/02/2026',4,5,1),
(default,'Amendoim Torrado','Ingrediente','Amendoim triturado',8,120,40,7.90,'14/08/2026',1,2,1),
(default,'Uva Passa','Ingrediente','Uva passa preta',5,80,2,11.50,'10/11/2025',1,3,1),
(default,'Açúcar de Confeiteiro','Ingrediente','Refinado extra fino',5,150,60,7.80,'10/01/2026',1,4,1),
(default,'Marshmallow Pronto','Complementos','Cobertura marshmallow',4,40,12,18.90,'25/03/2026',3,5,4),
(default,'Confete Prata','Complementos','Bolinhas decorativas',3,40,10,14.00,'20/08/2026',2,1,4),
(default,'Confete Dourado','Complementos','Bolinhas douradas',3,40,10,16.00,'20/08/2026',2,2,4),
(default,'Papel Manteiga','Embalagens','Rolo para assar',10,150,40,9.50,'10/10/2027',5,3,2),
(default,'Forma Cupcake','Embalagens','Forminhas coloridas',20,600,300,12.90,'08/09/2027',5,4,2),
(default,'Caixa para Brigadeiros','Embalagens','Caixa para 12 unidades',20,300,90,18.00,'05/10/2027',5,5,2),
(default,'Molho de Chocolate','Complementos','Cobertura líquida',5,40,20,12.00,'10/03/2026',3,1,4),
(default,'Doce de Leite','Ingrediente','Pote 1kg',5,60,30,18.90,'28/02/2026',1,2,1),
(default,'Creme de Avelã','Ingrediente','Pote 650g',5,50,20,23.90,'29/01/2026',1,3,1),
(default,'Agua Sanitária','Limpeza','Detergente clorado',3,100,40,3.80,'05/08/2027',3,4,3),
(default,'Luva Descartável','Limpeza','Caixa com 100 unidades',20,300,120,16.90,'30/09/2027',5,5,3),
(default,'Embalagem para Fatia','Embalagens','Embalagem triangular',20,300,80,22.00,'11/11/2027',5,1,2),
(default,'Embalagem para Cupcake','Embalagens','Caixa com visor',20,300,100,18.90,'11/11/2027',5,2,2),
(default,'Polvilho Doce','Ingrediente','Polvilho para receitas',5,120,40,7.90,'25/03/2026',1,3,1),
(default,'Refrigerante Sprite Lata','Consumíveis','Lata 350ml',10,100,40,4.00,'18/08/2027',4,5,5),
(default,'Refrigerante Pepsi Lata','Consumíveis','Lata 350ml',10,100,35,4.00,'18/08/2027',4,5,5),
(default,'Água com Gás','Consumíveis','Garrafa 510ml',10,100,30,3.00,'12/08/2027',4,5,5),
(default,'Corante Preto','Complementos','Corante alimentício preto',2,10,3,4.20,'10/09/2026',2,3,4),
(default,'Corante Verde','Complementos','Corante alimentício verde',2,10,4,4.20,'10/09/2026',2,4,4),
(default,'Amora Congelada','Ingrediente','Pacote 1kg',5,20,10,19.90,'01/01/2026',1,1,1),
(default,'Framboesa Congelada','Ingrediente','Pacote 1kg',5,20,10,22.90,'01/01/2026',1,1,1),
(default,'Pêssego em Calda','Ingrediente','Lata 400g',3,50,4,9.90,'10/06/2026',4,2,1),
(default,'Cereja em Calda','Ingrediente','Pote 300g',3,50,15,13.90,'10/06/2026',4,2,1),
(default,'Limão','Ingrediente','Kg',3,50,10,6.50,'29/11/2025',1,2,1),
(default,'Laranja Pera','Ingrediente','Kg',3,50,15,5.90,'29/11/2025',1,3,1),
(default,'Maçã Gala','Ingrediente','Kg',3,50,20,7.90,'29/11/2025',1,4,1),
(default,'Papel Alumínio','Embalagens','Rolo grande',20,200,60,14.90,'10/10/2027',5,5,2),
(default,'Embalagem para Tortas','Embalagens','Tampa + fundo transparente',20,200,80,32.00,'08/10/2027',5,1,2),
(default,'Saco de Lixo 50L','Limpeza','Pacote com 20 unidades',10,100,40,9.00,'20/09/2027',5,2,3),
(default,'Mel','Ingrediente','Pote 500g',3,40,12,14.90,'22/04/2026',4,3,1),
(default,'Aveia em Flocos','Ingrediente','Pacote 500g',5,100,40,6.20,'12/03/2026',4,5,1),
(default,'Chá Gelado Limão','Consumíveis','1 litro',4,50,20,5.80,'05/06/2026',3,2,5),
(default,'Chá Gelado Pêssego','Consumíveis','1 litro',4,50,1,5.80,'05/06/2026',3,2,5),
(default,'Vela Aniversário','Embalagens','Vela simples',10,100,40,3.00,'10/11/2027',4,3,2),
(default,'Porta Doce Acrílico','Embalagens','Suporte descartável',10,100,30,4.90,'10/11/2027',4,4,2),
(default,'Açúcar Caramelizado','Complementos','Calda pronta',5,50,9,7.90,'12/11/2025',3,5,4),
(default,'Calda de Morango','Complementos','Cobertura pronta',5,20,31,8.90,'10/02/2026',3,1,4),
(default,'Calda de Caramelo','Complementos','Cobertura pronta',5,20,2,9.50,'10/02/2026',3,2,4),
(default,'Massa Folhada','Ingrediente','Folhas congeladas',5,40,15,16.90,'01/02/2026',1,3,1),
(default,'Massa de Torta','Ingrediente','Base pronta',5,40,15,14.90,'01/02/2026',1,4,1),
(default,'Farinha de Amêndoas','Ingrediente','Farinha fina',5,40,15,29.90,'15/03/2026',1,5,1),
(default,'Gergelim Branco','Ingrediente','Sementes para finalização',2,8,15,7.40,'15/04/2026',1,1,1),
(default,'Papel Sulfite','Embalagens','Folhas para impressos',10,200,300,14.00,'10/11/2027',5,4,2),
(default,'Vasilha Descartável','Embalagens','Pote para doces',15,100,120,10.50,'18/10/2027',5,5,2),
(default,'Porta Cupcake','Embalagens','Base plástica individual',10,25,28,8.90,'10/11/2027',5,1,2);



-- TABELA: ESTOQUE_MOVIMENTO
DROP TABLE IF EXISTS estoque_movimento CASCADE;
CREATE TABLE estoque_movimento (
cod_mov SMALLSERIAL PRIMARY KEY,
tipo_mov VARCHAR(7) NOT NULL,
cod_usuario INTEGER NOT NULL REFERENCES usuarios(cod_usuario),
cod_insumo INTEGER NOT NULL REFERENCES insumos(cod_insumo),
qtde SMALLINT NOT NULL,
motivo VARCHAR(30),
data_mov DATE NOT NULL
);
ALTER TABLE estoque_movimento ADD CONSTRAINT chk_tipo_mov CHECK (tipo_mov IN ('Entrada','Saida'));
SELECT initcap (tipo_mov) AS PrimeiraMaiusculo
FROM estoque_movimento;

/* ===================== CONSTRAINT DO MOTIVO ======================== */

ALTER TABLE estoque_movimento ADD CONSTRAINT chk_motivo CHECK 
(motivo IN ('ENTRADA', 'PRODUÇÃO', 'VENDA', 'AJUSTE DE INVENTARIO', 'VALIDADE','DEFEITO', 'AVARIA' , 'CONSUMO PROPRIO', 'PERDA', 'BRINDE',  'AMOSTRA')) ;

-- POPULANDO ESTOQUE_MOVIMENTACAO
SELECT * FROM estoque_movimento;
INSERT INTO estoque_movimento VALUES
(default, 'Entrada',5,3,12,'ENTRADA', '05/11/2025'),
(default, 'Saida',1,2,2,'PRODUÇÃO','05/11/2025'),
(default, 'Saida',2,9,4,'PRODUÇÃO','05/11/2025'),
(default, 'Saida',1,8,2,'AVARIA', '05/11/2025'),
(default, 'Saida',3,8,2,'AVARIA', '05/11/2025'),
(default, 'Saida',1,8,1,'PERDA', '05/11/2025'),
(default,'Saida', 2, 41, 5, 'VENDA', '10/12/2025'),
(default,'Entrada', 3, 5, 15, 'ENTRADA', '06/12/2025'),
(default,'Saida', 4, 14, 2, 'AJUSTE DE INVENTARIO', '18/12/2025'),
(default,'Saida', 5, 55, 1, 'BRINDE', '17/12/2025'),
(default,'Saida', 3, 30, 7, 'VENDA', '11/12/2025'),
(default,'Entrada', 1, 1, 20, 'ENTRADA', '05/12/2025'),
(default,'Saida', 3, 20, 2, 'AMOSTRA', '16/12/2025'),
(default,'Saida', 4, 25, 9, 'VENDA', '11/12/2025'),
(default,'Saida', 2, 5, 1, 'AVARIA', '13/12/2025'),
(default,'Entrada', 2, 3, 10, 'ENTRADA', '05/12/2025'),
(default,'Saida', 1, 10, 2, 'AVARIA', '12/12/2025'),
(default,'Saida', 5, 18, 5, 'PRODUÇÃO', '09/12/2025'),
(default,'Saida', 4, 3, 1, 'VALIDADE', '14/12/2025'),
(default,'Saida', 1, 1, 6, 'PRODUÇÃO', '07/12/2025'),
(default,'Entrada', 5, 12, 18, 'ENTRADA', '07/12/2025'),
(default,'Saida', 5, 50, 6, 'VENDA', '12/12/2025'),
(default,'Saida', 2, 18, 2, 'CONSUMO PROPRIO', '15/12/2025'),
(default,'Entrada', 4, 10, 8, 'ENTRADA', '06/12/2025'),
(default,'Saida', 4, 41, 1, 'AMOSTRA', '16/12/2025'),
(default,'Saida', 3, 14, 2, 'AVARIA', '13/12/2025'),
(default,'Saida', 2, 3, 4, 'PRODUÇÃO', '08/12/2025'),
(default,'Entrada', 5, 20, 3, 'AJUSTE DE INVENTARIO', '19/12/2025'),
(default,'Saida', 1, 31, 1, 'AJUSTE DE INVENTARIO', '19/12/2025'),
(default,'Saida', 1, 8, 1, 'CONSUMO PROPRIO', '15/12/2025'),
(default,'Entrada', 2, 2, 5, 'AJUSTE DE INVENTARIO', '18/12/2025'),
(default,'Saida', 3, 5, 10, 'PRODUÇÃO', '08/12/2025'),
(default,'Saida', 4, 12, 3, 'PRODUÇÃO', '09/12/2025'),
(default,'Saida', 5, 11, 2, 'VALIDADE', '14/12/2025'),
(default,'Saida', 3, 60, 2, 'BRINDE', '17/12/2025'),
(default,'Saida', 1, 40, 12, 'VENDA', '10/12/2025');

INSERT INTO estoque_movimento VALUES
(default, 'Entrada',4,5,12,'ENTRADA', '05/01/2026');

/* ========== CONSULTAS BD ==============*/
select * from estoque_movimento;
-- Insumos x Categoria x Medidas x Usuários 
SELECT i.nome_insumo AS Nome, i.tipo AS Tipo, m.unid_base AS Unidade_medida, i.valor_insumo AS Valor, i.qtde_atual AS Atual, 
(i.valor_insumo * i.qtde_atual) AS valor_total_estoque, i.data_validade AS Validade , u.nome_usuario AS Quem_cadastrou

FROM insumos i INNER JOIN categoria c USING (cod_categ)
INNER JOIN medidas m USING (cod_medida)
INNER JOIN usuarios u ON (i.cod_usuario = u.cod_usuario)
ORDER BY 1;

-- Abaixo estoque mínimo
SELECT i.cod_insumo, i.nome_insumo AS Nome, i.qtde_atual, i.qtde_min, (i.qtde_min - i.qtde_atual) AS Deficit, c.nome_categ AS Categoria
FROM insumos i JOIN categoria c USING (cod_categ)
WHERE i.qtde_atual < i.qtde_min
ORDER BY 5 DESC;

-- Acima estoque máximo
SELECT i.cod_insumo, i.nome_insumo AS Nome, i.qtde_atual, i.qtde_max, (i.qtde_atual - i.qtde_max ) AS Excedente, c.nome_categ AS Categoria
FROM insumos i JOIN categoria c USING (cod_categ)
WHERE i.qtde_atual > i.qtde_max
ORDER BY 5 DESC;

-- Estoque por Categoria
SELECT c.nome_categ AS Categoria, SUM(i.qtde_atual) AS Estoque
FROM insumos i JOIN categoria c USING (cod_categ)
GROUP BY c.nome_categ
ORDER BY 2 DESC;SELECT i.cod_insumo, i.nome_insumo AS Insumo, SUM(em.qtde) AS Qtde_Total_Saida,
    em.motivo AS Motivo,
	COUNT(em.motivo) AS Frequencia	
FROM estoque_movimento em JOIN insumos i USING (cod_insumo)
WHERE data_mov >= DATE_TRUNC('month', CURRENT_DATE)
  AND data_mov < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month'
  AND motivo NOT IN ('ENTRADA')
GROUP BY i.cod_insumo, i.nome_insumo, em.cod_insumo, em.motivo
ORDER BY 2, 5 DESC;

--Consumo por período
SELECT DATE_TRUNC('month', em.data_mov)::date AS Mês, em.tipo_mov, SUM(em.qtde) AS Total_qtde
FROM estoque_movimento em
GROUP BY 1, 2
ORDER BY 1 DESC, 2;

-- Motivo mais comum de Saída
SELECT em.motivo, COUNT(em.motivo) AS Frequencia
FROM estoque_movimento em 
WHERE data_mov >= DATE_TRUNC('month', CURRENT_DATE)
  AND data_mov < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month'
  AND motivo NOT IN ('ENTRADA')
GROUP BY motivo
ORDER BY 2 DESC;

-- Produto que mais teve saídas em perdas
SELECT i.cod_insumo, i.nome_insumo AS Insumo, SUM(em.qtde) AS Qtde_Total_Saida,
    em.motivo AS Motivo,
	COUNT(em.motivo) AS Frequencia	
FROM estoque_movimento em JOIN insumos i USING (cod_insumo)
WHERE data_mov >= DATE_TRUNC('month', CURRENT_DATE)
  AND data_mov < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month'
  AND motivo NOT IN ('ENTRADA')
GROUP BY i.cod_insumo, i.nome_insumo, em.cod_insumo, em.motivo
ORDER BY 2, 5 DESC;

-- Produtos fora da validade
WITH CalculosMovimento AS (
    SELECT
        em.cod_insumo,
        SUM(CASE WHEN em.tipo_mov = 'Entrada' THEN em.qtde  
            WHEN em.tipo_mov = 'Saida' THEN -em.qtde 
            ELSE 0 END) AS saldo_movimento
    FROM estoque_movimento em
    GROUP BY em.cod_insumo
),
CalculosEstoque AS (
    SELECT
        i.nome_insumo AS Produto,
        SUM(i.qtde_atual) + COALESCE(cm.saldo_movimento, 0) AS atual_liquido,
        SUM(CASE WHEN i.data_validade < CURRENT_DATE THEN i.qtde_atual ELSE 0 END) AS qtde_vencida_bruta,
        MAX(CASE WHEN i.data_validade < CURRENT_DATE THEN CURRENT_DATE - i.data_validade ELSE 0 END) AS vencimento_max
    FROM insumos i
    LEFT JOIN CalculosMovimento cm ON i.cod_insumo = cm.cod_insumo
    GROUP BY 1, COALESCE(cm.saldo_movimento, 0) 
)
SELECT 
    ce.Produto AS "Produto", 
    ce.atual_liquido AS "Total em Estoque Líquido",
    LEAST(ce.qtde_vencida_bruta, ce.atual_liquido) AS "Quantidade Vencida",
    (ce.atual_liquido - LEAST(ce.qtde_vencida_bruta, ce.atual_liquido)) AS "Estoque Total Sem Vencidos",
    ROUND(LEAST(ce.qtde_vencida_bruta, ce.atual_liquido) * 100.0 / NULLIF(ce.atual_liquido, 0), 2) AS "Percentual Vencido (%)"
FROM CalculosEstoque ce
WHERE ce.qtde_vencida_bruta > 0
ORDER BY CASE WHEN ce.qtde_vencida_bruta > 0 THEN ce.vencimento_max
        ELSE 0
        END DESC, 4 ASC;

-- Produtos proximos ao vencimento
WITH CalculosMovimento AS (
    SELECT em.cod_insumo,
        SUM(CASE WHEN em.tipo_mov = 'Entrada' THEN em.qtde 
            WHEN em.tipo_mov = 'Saida' THEN - em.qtde 
            ELSE 0 END) AS saldo_movimento
    FROM estoque_movimento em
    GROUP BY em.cod_insumo
),
CalculosAlerta AS (
    SELECT i.nome_insumo AS Produto,
        SUM(i.qtde_atual) + COALESCE(cm.saldo_movimento, 0) AS atual_liquido,
        MIN(i.data_validade - CURRENT_DATE) AS dias_para_vencer_min, 
        SUM(CASE 
            WHEN i.data_validade BETWEEN CURRENT_DATE AND (CURRENT_DATE + INTERVAL '7 days') 
            THEN i.qtde_atual 
            ELSE 0 
        END) AS qtde_em_alerta
    FROM insumos i
    LEFT JOIN CalculosMovimento cm ON i.cod_insumo = cm.cod_insumo
    GROUP BY 1, COALESCE(cm.saldo_movimento, 0) 
)
SELECT ca.Produto AS "Produto", 
    ca.atual_liquido AS "Total em Estoque Líquido",
    ca.qtde_em_alerta AS "Quantidade em Alerta (Próximo Vencimento)",
    ca.dias_para_vencer_min AS "Dias para o Vencimento Mais Próximo"
    
FROM CalculosAlerta ca
WHERE ca.dias_para_vencer_min < 30 
      AND ca.dias_para_vencer_min > 0
      AND ca.qtde_em_alerta > 0
ORDER BY 4 ASC, 3 DESC;






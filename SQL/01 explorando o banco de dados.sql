

USE BikeStores

/* CONHECENDO O BANCO DE DADOS - Primeiramente foi necessário entender como o banco de dados funcionava, o relacionamento de cada
tabela, explorar um pouco de forma básica e de fato conhecer as colunas  e as informações contidas nela. Antes de qualquer SELECT 
selecionei todas as tabelas presentes no banco de dados e criei um diagrama relacional de com todas elas. Já na sequência decidi
quis trazer algumas informações básicas, como total de vendas por clientes*/

SELECT  
	S.CustomerID AS Id_cliente,
	C.FirstName + ' ' + C.LastName AS Nome,
	S.OrderDate AS Data_venda,
	S.StoreID AS Loja,
	P.[Name] AS Produto,
	S.OrderTotal AS Total
FROM Sales.[Order] S
INNER JOIN Customer C ON S.CustomerID = C.CustomerID
INNER JOIN Sales.OrderItem O ON O.OrderID = S.OrderID
INNER JOIN Production.Product P ON P.ProductID = O.ProductID

-- INSIGHTS: Foi possível explorar os dados de cada tabela, tendo uma visão mais ampla de como estão se relacionando.


-----------------------------------------------------------------------------------------------------------------------------------
-- Total de lojas
SELECT 
	COUNT(DISTINCT StoreID) AS Total_Lojas
FROM Store

----------------------------------------------------------------------------

-- Quantidade de clientes
SELECT
	COUNT(DISTINCT CustomerID) AS Clientes
FROM Customer
-- Total de 1446 clientes

--------------------------------------------------------------------------

--Quantidade de Categorias de produtos
SELECT 
	COUNT(DISTINCT P.CategoryID) AS 'Qtd_categorias'
FROM Production.Category P

---------------------------------------------------------

-- Total de vendas por cliente

SELECT TOP 10
	S.CustomerID AS Id_cliente,
	FORMAT(SUM(S.OrderTotal), 'C') AS Total
FROM Sales.[Order] S
GROUP BY S.CustomerID
ORDER BY Total

--------------------------------------------------------------------------------------------------
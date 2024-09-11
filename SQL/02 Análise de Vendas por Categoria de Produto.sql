

USE BikeStores

-- Análise de Vendas por Categoria de Produto
SELECT
    C.CategoryID AS Categoria,
    C.[Name] AS 'Nome da Categoria',
    FORMAT(SUM(S.OrderTotal), 'C') AS Total
FROM Production.[Category] C
INNER JOIN Production.[Product] P ON P.CategoryID = C.CategoryID
INNER JOIN Sales.[OrderItem] O ON O.ProductID = P.ProductID
INNER JOIN Sales.[Order] S ON S.OrderID = O.OrderID
GROUP BY C.CategoryID, C.[Name]
ORDER BY Total DESC



USE BikeStores

-- ANÁLISE DE VENDAS POR MARCA
SELECT
    B.BrandID AS ID,
    B.[Name] AS 'Marca',
    SUM(S.Quantity) AS 'Quantidade Vendida'
FROM Brand B
INNER JOIN Production.[Product] P ON P.BrandID = B.BrandID
INNER JOIN Sales.[OrderItem] S ON S.ProductID = P.ProductID
GROUP BY B.BrandID, B.[Name]
ORDER BY 'Quantidade Vendida' DESC;
 
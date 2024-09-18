
USE BikeStores

--Análise de Vendas por Região e Lojas--
SELECT 
    ST.StoreID AS ID,
    ST.[Name] AS 'Loja',
    ST.StateOrRegion AS 'Região',
    FORMAT(SUM(S.OrderTotal), 'C') AS 'Total Vendas'
FROM SALES.[Order] S
INNER JOIN Store ST ON ST.StoreID = S.StoreID
GROUP BY ST.StoreID, ST.[Name], ST.StateOrRegion
ORDER BY SUM(S.OrderTotal) DESC;

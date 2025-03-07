ALTER SESSION SET CURRENT_SCHEMA = CONSINCO;

SELECT Z.SEQGERCOMPRA NRO_LOTE, X.NROPEDIDOSUPRIM NRO_PEDIDO, 
       Z.DTAEMISSAO, X.NROEMPRESA, 
       X.SEQPRODUTO, DESCCOMPLETA, SUM(QTDAPROVADA - (NVL(X.QTDTOTRECEBIDA,0) + NVL(X.QTDTOTCANCELADA,0))) QTDE
  FROM MSU_PEDIDOSUPRIM Z INNER JOIN MSU_PSITEMRECEBER X ON X.NROPEDIDOSUPRIM = Z.NROPEDIDOSUPRIM AND X.NROEMPRESA = Z.NROEMPRESA
                          INNER JOIN MAP_PRODUTO P ON P.SEQPRODUTO = X.SEQPRODUTO
 WHERE Z.SEQFORNECEDOR IN
       (SELECT SEQPESSOA
          FROM GE_PESSOA X
         WHERE NOMERAZAO LIKE '%GOIASMINAS%')

AND QTDAPROVADA > NVL(X.QTDTOTRECEBIDA,0) + NVL(X.QTDTOTCANCELADA,0)
AND DTAEMISSAO > DATE '2024-01-01'
GROUP BY Z.SEQGERCOMPRA, X.NROPEDIDOSUPRIM, Z.DTAEMISSAO, X.SEQPRODUTO, X.NROEMPRESA, DESCCOMPLETA

ORDER BY 4,3

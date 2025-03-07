/*
SELECT  A.SEQFAMILIA FAMILIA, MA.FAMILIA DESCRICAO, A.CODORIGEMTRIB
FROM CONSINCO.MAP_FAMDIVISAO A LEFT JOIN CONSINCO.MAP_TRIBUTACAO B ON A.NROTRIBUTACAO = B.NROTRIBUTACAO
                               LEFT JOIN CONSINCO.MAP_FAMILIA MA ON A.SEQFAMILIA = MA.SEQFAMILIA

WHERE  CODORIGEMTRIB IN (7)

UNION ALL

SELECT  A.SEQFAMILIA FAMILIA, MA.FAMILIA DESCRICAO, A.CODORIGEMTRIB
FROM CONSINCO.MAP_FAMDIVISAO A LEFT JOIN CONSINCO.MAP_TRIBUTACAO B ON A.NROTRIBUTACAO = B.NROTRIBUTACAO
                               LEFT JOIN CONSINCO.MAP_FAMILIA MA ON A.SEQFAMILIA = MA.SEQFAMILIA

WHERE  CODORIGEMTRIB IN (1)

ORDER BY 3 DESC, 1


U-PDATE MAP_FAMDIVISAO 
SET MAP_FAMDIVISAO.CODORIGEMTRIB = 7, MAP_FAMDIVISAO.DTAHORALTERACAO = SYSDATE, MAP_FAMDIVISAO.INDREPLICACAO = 'S', 
    MAP_FAMDIVISAO.USUARIOALTERACAO = 'GLPI106851', MAP_FAMDIVISAO.INDUSABASECALCIPIART195= 'N'                                        
WHERE MAP_FAMDIVISAO.NRODIVISAO = 1 AND MAP_FAMDIVISAO.CODORIGEMTRIB = 6                         


SELECT DISTINCT INDREPLICACAO FROM MAP_PRODUTO A WHERE A.SEQFAMILIA IN (SELECT  A.SEQFAMILIA 
FROM CONSINCO.MAP_FAMDIVISAO A LEFT JOIN CONSINCO.MAP_TRIBUTACAO B ON A.NROTRIBUTACAO = B.NROTRIBUTACAO
                               LEFT JOIN CONSINCO.MAP_FAMILIA MA ON A.SEQFAMILIA = MA.SEQFAMILIA

WHERE  CODORIGEMTRIB IN (6))*/

UPDATE CONSINCO.MAP_FAMDIVISAO 
SET MAP_FAMDIVISAO.CODORIGEMTRIB = 7, MAP_FAMDIVISAO.DTAHORALTERACAO = SYSDATE, MAP_FAMDIVISAO.INDREPLICACAO = 'S', 
    MAP_FAMDIVISAO.USUARIOALTERACAO = 'GLPI106851', MAP_FAMDIVISAO.INDUSABASECALCIPIART195= 'N'                                        
WHERE MAP_FAMDIVISAO.NRODIVISAO = 1 AND MAP_FAMDIVISAO.CODORIGEMTRIB = 6;

COMMIT;

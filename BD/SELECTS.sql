SELECT CD.NOME, P.TIPO, P.DESCRICAO, P.STATUS, S.SIMILARIDADE
FROM DINDINAGORA.SIMILARIDADE S
	INNER JOIN DINDINAGORA.TRANSACAO T ON T.ID_CLIENTE = S.ID_CLIENTE_DESTINO
	INNER JOIN DINDINAGORA.PRODUTO P ON P.ID = T.ID_PRODUTO
    INNER JOIN DINDINAGORA.CLIENTE CD ON CD.ID = S.ID_CLIENTE_DESTINO
WHERE S.ID_CLIENTE_ORIGEM = 1
  AND S.SIMILARIDADE > 0
  AND NOT EXISTS(SELECT * FROM DINDINAGORA.TRANSACAO T2 WHERE T2.ID_CLIENTE = S.ID_CLIENTE_ORIGEM AND T2.ID_PRODUTO = T.ID_PRODUTO)
ORDER BY S.SIMILARIDADE DESC
LIMIT 5;
  
  SELECT P.ID, P.TIPO, P.DESCRICAO, P.VALOR, P.STATUS, S.PONTUACAO
FROM DINDINAGORA.SIMILARIDADE S
	INNER JOIN DINDINAGORA.TRANSACAO T ON T.ID_CLIENTE = S.ID_CLIENTE_DESTINO
	INNER JOIN DINDINAGORA.PRODUTO P ON P.ID = T.ID_PRODUTO
WHERE S.ID_CLIENTE_ORIGEM = 4
  AND S.PONTUACAO > 0
  AND NOT EXISTS(SELECT * FROM DINDINAGORA.TRANSACAO T2 WHERE T2.ID_CLIENTE = S.ID_CLIENTE_ORIGEM AND T2.ID_PRODUTO = T.ID_PRODUTO)
ORDER BY S.PONTUACAO DESC;
WITH movimenti_magazzino AS (
    SELECT prodotto_id, quantita_variazione AS variazione
    FROM rettifiche_magazzino

    UNION ALL

    SELECT prodotto_id, quantita AS variazione
    FROM righe_acquisto

    UNION ALL

    SELECT prodotto_id, -quantita AS variazione
    FROM righe_vendita
    WHERE prodotto_id IS NOT NULL
)
SELECT
    prodotti.id,
    prodotti.nome,
    COALESCE(SUM(movimenti_magazzino.variazione), 0) AS giacenza
FROM prodotti
LEFT JOIN movimenti_magazzino
    ON movimenti_magazzino.prodotto_id = prodotti.id
GROUP BY prodotti.id, prodotti.nome
ORDER BY prodotti.id;
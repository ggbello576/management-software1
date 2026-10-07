CREATE TABLE vendite(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id INTEGER REFERENCES clienti(id),
    data_vendita TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    note TEXT
);

CREATE TABLE righe_vendita (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    vendita_id INTEGER NOT NULL REFERENCES vendite(id),
    prodotto_id INTEGER REFERENCES prodotti(id),
    servizio_id INTEGER REFERENCES servizi(id),
    quantita INTEGER NOT NULL DEFAULT 1 CHECK (quantita > 0),
    prezzo_unitario NUMERIC(10, 2) NOT NULL CHECK (prezzo_unitario >= 0),
    CHECK (
        (prodotto_id IS NOT NULL AND servizio_id IS NULL)
        OR
        (prodotto_id IS NULL AND servizio_id IS NOT NULL)
    )
);
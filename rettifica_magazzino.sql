CREATE TABLE rettifiche_magazzino (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    prodotto_id INTEGER NOT NULL REFERENCES prodotti(id),
    quantita_variazione INTEGER NOT NULL CHECK (quantita_variazione <> 0),
    data_movimento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    motivo TEXT NOT NULL
);
CREATE TABLE acquisti (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fornitore_id INTEGER NOT NULL REFERENCES fornitori(id),
    data_acquisto TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    note TEXT
);

CREATE TABLE righe_acquisto(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    acquisto_id INTEGER NOT NULL REFERENCES acquisti(id),
    prodotto_id INTEGER NOT NULL REFERENCES prodotti(id),
    quantita INTEGER NOT NULL CHECK (quantita>0),
    costo_unitario NUMERIC(10, 2) NOT NULL CHECK (costo_unitario >=0)

);  \
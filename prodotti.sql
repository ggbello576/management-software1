CREATE TABLE prodotti (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome TEXT NOT NULL,
    marca TEXT,
    ultimo_prezzo_acquisto NUMERIC(10, 2)
        CHECK (ultimo_prezzo_acquisto >= 0),
    prezzo_vendita NUMERIC(10, 2) NOT NULL
        CHECK (prezzo_vendita >= 0),
    soglia_riordino INTEGER NOT NULL DEFAULT 0
        CHECK(soglia_riordino >=0)
);

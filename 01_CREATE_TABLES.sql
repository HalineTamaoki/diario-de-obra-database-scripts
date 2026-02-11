-- 1. Tabela Usuario
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- 2. Tabela Obra
CREATE TABLE obra (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    usuario_id INTEGER REFERENCES usuario(id) ON DELETE CASCADE
);

-- 3. Tabela ItemObra
CREATE TABLE item_obra (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ultima_etapa INTEGER default 0,
    obra_id INTEGER NOT NULL REFERENCES obra(id) ON DELETE cascade
);

-- 4. Tabela Ideia
CREATE TABLE ideia (
    id SERIAL PRIMARY KEY,
    link TEXT,
    item_obra_id INTEGER NOT NULL REFERENCES item_obra(id) ON DELETE CASCADE
);

-- 5. Tabela Orcamento
CREATE TABLE orcamento (
    id SERIAL PRIMARY KEY,
    selecionado BOOLEAN DEFAULT FALSE,
    empresa VARCHAR(255),
    valor NUMERIC(12, 2), 
    data TIMESTAMP, 
    comentarios VARCHAR(255),
    item_obra_id INTEGER NOT NULL REFERENCES item_obra(id) ON DELETE CASCADE
);

-- 6. Tabela Execucao
CREATE TABLE execucao (
    id SERIAL PRIMARY KEY,
    comentarios VARCHAR(255),
    inicio TIMESTAMP,
    termino TIMESTAMP,
    item_obra_id INTEGER NOT NULL UNIQUE REFERENCES item_obra(id) ON DELETE CASCADE
);

-- 7. Tabela DataAdicional
CREATE TABLE data_adicional (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    data TIMESTAMP,
    execucao_id INTEGER NOT NULL REFERENCES execucao(id) ON DELETE CASCADE
);

-- 8. Tabela Finalizacao
CREATE TABLE finalizacao (
    id SERIAL PRIMARY KEY,
    data TIMESTAMP,
    comentarios VARCHAR(255),
    item_obra_id INTEGER NOT NULL UNIQUE REFERENCES item_obra(id) ON DELETE CASCADE
);
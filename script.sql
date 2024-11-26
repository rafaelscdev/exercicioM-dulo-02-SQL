-- criando a tabela customer
CREATE TABLE "store".customer(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    cpf VARCHAR(20) UNIQUE,
    phone VARCHAR(20)
);

-- Criando tabela product
CREATE TABLE "store".product(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    description_text TEXT,
    stock_quantity INTEGER NOT NULL
);

-- Criando a tabela de product_stock
CREATE TABLE "store".product_stock (
    stock_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    qantity INTEGER NOT NULL CHECK (quantity >=0)
);
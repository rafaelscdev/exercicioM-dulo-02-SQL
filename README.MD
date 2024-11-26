## Exercício Módulo 02 - SQL
-- Aluno: Rafael Corrêa

-- Curso: Fullstack Python

-- github: rafaelscdev

### Banco de Dados - Estrutura e Definições ###

-Este projeto consiste na criação e estruturação de um banco de dados relacional utilizando PostgreSQL. O banco de dados foi projetado para gerenciar informações de uma loja, incluindo clientes, produtos, fornecedores e estoque.

## Estrutura do Projeto ##


1. Esquema do Banco de Dados

O banco de dados possui o esquema store, contendo as seguintes tabelas:

customer: Gerencia os dados dos clientes.

product: Contém informações sobre os produtos disponíveis.

suppliers: Armazena dados dos fornecedores.

product_stock: Gerencia o estoque dos produtos.


2. Estrutura das Tabelas

## Tabela customer -

Descrição: Armazena informações dos clientes, como nome, e-mail, CPF e telefone.

Campos principais:
customer_id: Identificador único do cliente.
name: Nome do cliente (obrigatório).
email: Endereço de e-mail único (obrigatório).
cpf: CPF único (obrigatório).
phone: Telefone de contato.

## Tabela product -

Descrição: Contém informações detalhadas dos produtos disponíveis na loja.

Campos principais:

product_id: Identificador único do produto.
name: Nome do produto.
price: Preço do produto.
Descrption_text: Armazena informações dos fornecedores da loja.
stock_quantity: Quantidade em estoque.

## Tabela product_stock
Descrição: Gerencia a quantidade de produtos em estoque e os relaciona aos fornecedores.

Campos principais:
stock_id: Identificador único do registro de estoque.
product_id: Referência ao produto.
quantity: Quantidade disponível em estoque (não pode ser negativa).


#### MODO DE EXECUÇÃO NO TERMINAL ####

-- Criando um banco de dados

CREATE DATABSE dbebac;

--Conectar ao banco de dados 

\c dbebac;

-- Criar o schema

CREATE SCHEMA store;

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

-- Listagem de Tabelas: Para verificar as tabelas criadas no esquema store

\dt store.*

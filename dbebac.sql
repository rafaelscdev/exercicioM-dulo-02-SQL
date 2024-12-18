PGDMP      %            
    |            dbebac    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16409    dbebac    DATABASE     }   CREATE DATABASE dbebac WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE dbebac;
                     postgres    false                        2615    16410    store    SCHEMA        CREATE SCHEMA store;
    DROP SCHEMA store;
                     postgres    false            �            1259    16412    customer    TABLE     �   CREATE TABLE store.customer (
    customer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    cpf character varying(20) NOT NULL,
    phone character varying(20)
);
    DROP TABLE store.customer;
       store         heap r       postgres    false    6            �            1259    16411    customer_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE store.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE store.customer_customer_id_seq;
       store               postgres    false    219    6            �           0    0    customer_customer_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE store.customer_customer_id_seq OWNED BY store.customer.customer_id;
          store               postgres    false    218            �            1259    16425    product    TABLE     �   CREATE TABLE store.product (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    description_text text,
    stock_quantity integer NOT NULL
);
    DROP TABLE store.product;
       store         heap r       postgres    false    6            �            1259    16424    product_product_id_seq    SEQUENCE     �   CREATE SEQUENCE store.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE store.product_product_id_seq;
       store               postgres    false    6    221            �           0    0    product_product_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE store.product_product_id_seq OWNED BY store.product.product_id;
          store               postgres    false    220            �            1259    16434    product_stock    TABLE     �   CREATE TABLE store.product_stock (
    stock_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT product_stock_quantity_check CHECK ((quantity >= 0))
);
     DROP TABLE store.product_stock;
       store         heap r       postgres    false    6            �            1259    16433    product_stock_stock_id_seq    SEQUENCE     �   CREATE SEQUENCE store.product_stock_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE store.product_stock_stock_id_seq;
       store               postgres    false    6    223            �           0    0    product_stock_stock_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE store.product_stock_stock_id_seq OWNED BY store.product_stock.stock_id;
          store               postgres    false    222            ,           2604    16415    customer customer_id    DEFAULT     z   ALTER TABLE ONLY store.customer ALTER COLUMN customer_id SET DEFAULT nextval('store.customer_customer_id_seq'::regclass);
 B   ALTER TABLE store.customer ALTER COLUMN customer_id DROP DEFAULT;
       store               postgres    false    219    218    219            -           2604    16428    product product_id    DEFAULT     v   ALTER TABLE ONLY store.product ALTER COLUMN product_id SET DEFAULT nextval('store.product_product_id_seq'::regclass);
 @   ALTER TABLE store.product ALTER COLUMN product_id DROP DEFAULT;
       store               postgres    false    221    220    221            .           2604    16437    product_stock stock_id    DEFAULT     ~   ALTER TABLE ONLY store.product_stock ALTER COLUMN stock_id SET DEFAULT nextval('store.product_stock_stock_id_seq'::regclass);
 D   ALTER TABLE store.product_stock ALTER COLUMN stock_id DROP DEFAULT;
       store               postgres    false    223    222    223            �          0    16412    customer 
   TABLE DATA           G   COPY store.customer (customer_id, name, email, cpf, phone) FROM stdin;
    store               postgres    false    219   >       �          0    16425    product 
   TABLE DATA           [   COPY store.product (product_id, name, price, description_text, stock_quantity) FROM stdin;
    store               postgres    false    221   [       �          0    16434    product_stock 
   TABLE DATA           F   COPY store.product_stock (stock_id, product_id, quantity) FROM stdin;
    store               postgres    false    223   x       �           0    0    customer_customer_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('store.customer_customer_id_seq', 1, false);
          store               postgres    false    218            �           0    0    product_product_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('store.product_product_id_seq', 1, false);
          store               postgres    false    220            �           0    0    product_stock_stock_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('store.product_stock_stock_id_seq', 1, false);
          store               postgres    false    222            1           2606    16423    customer customer_cpf_key 
   CONSTRAINT     R   ALTER TABLE ONLY store.customer
    ADD CONSTRAINT customer_cpf_key UNIQUE (cpf);
 B   ALTER TABLE ONLY store.customer DROP CONSTRAINT customer_cpf_key;
       store                 postgres    false    219            3           2606    16421    customer customer_email_key 
   CONSTRAINT     V   ALTER TABLE ONLY store.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);
 D   ALTER TABLE ONLY store.customer DROP CONSTRAINT customer_email_key;
       store                 postgres    false    219            5           2606    16419    customer customer_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY store.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 ?   ALTER TABLE ONLY store.customer DROP CONSTRAINT customer_pkey;
       store                 postgres    false    219            7           2606    16432    product product_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY store.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 =   ALTER TABLE ONLY store.product DROP CONSTRAINT product_pkey;
       store                 postgres    false    221            9           2606    16440     product_stock product_stock_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY store.product_stock
    ADD CONSTRAINT product_stock_pkey PRIMARY KEY (stock_id);
 I   ALTER TABLE ONLY store.product_stock DROP CONSTRAINT product_stock_pkey;
       store                 postgres    false    223            �      x������ � �      �      x������ � �      �      x������ � �     
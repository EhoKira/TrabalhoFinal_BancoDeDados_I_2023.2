--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cidade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cidade (
    cod_cidade integer NOT NULL,
    nome_cidade character varying(40) NOT NULL,
    sigla_uf character(2) NOT NULL
);


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cliente (
    cod_cliente integer NOT NULL,
    nome_cliente character varying(40) NOT NULL,
    rua_cliente character varying(40) NOT NULL,
    cod_cidade integer NOT NULL,
    telefone_cliente character(15)
);


--
-- Name: demo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demo (
    id integer NOT NULL,
    name character varying(200) DEFAULT ''::character varying NOT NULL,
    hint text DEFAULT ''::text NOT NULL
);


--
-- Name: demo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demo_id_seq OWNED BY public.demo.id;


--
-- Name: filme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.filme (
    cod_filme integer NOT NULL,
    nome_filme character varying(40) NOT NULL,
    cod_genero_filme integer NOT NULL,
    valor_compra numeric(10,2) NOT NULL
);


--
-- Name: genero_filme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genero_filme (
    cod_genero_filme integer NOT NULL,
    nome_genero_filme character varying(45) NOT NULL
);


--
-- Name: locacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locacao (
    cod_cliente integer NOT NULL,
    cod_filme integer NOT NULL,
    data_locacao date NOT NULL,
    valor_locacao numeric(10,2) NOT NULL
);


--
-- Name: solução1; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public."solução1" AS
 SELECT cliente.nome_cliente,
    count(locacao.cod_cliente) AS quantidade_locacoes
   FROM (public.cliente
     JOIN public.locacao ON ((cliente.cod_cliente = locacao.cod_cliente)))
  WHERE (cliente.cod_cidade = 6)
  GROUP BY cliente.nome_cliente
 HAVING (count(locacao.cod_cliente) > 10)
  ORDER BY (count(locacao.cod_cliente)) DESC;


--
-- Name: solução2; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public."solução2" AS
 SELECT gf.nome_genero_filme AS genero,
    max(l.valor_locacao) AS maior_valor_locacao,
    min(l.valor_locacao) AS menor_valor_locacao,
    round(avg(l.valor_locacao), 2) AS media_valor_locacao,
    sum(l.valor_locacao) AS soma_valor_locacao,
    count(l.cod_filme) AS quantidade_locacoes
   FROM ((public.genero_filme gf
     JOIN public.filme f ON ((gf.cod_genero_filme = f.cod_genero_filme)))
     JOIN public.locacao l ON ((f.cod_filme = l.cod_filme)))
  WHERE (f.valor_compra > (100)::numeric)
  GROUP BY gf.nome_genero_filme
 HAVING (count(l.cod_filme) < 1000)
  ORDER BY (count(l.cod_filme)) DESC;


--
-- Name: uf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.uf (
    sigla_uf character(2) NOT NULL,
    nome_uf character varying(45) NOT NULL
);


--
-- Name: solução3; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public."solução3" AS
 SELECT u.sigla_uf AS nome_uf,
    count(l.cod_cliente) AS soma_total_locacoes,
    round(avg(l.valor_locacao), 2) AS valor_medio_locacoes
   FROM (((public.locacao l
     JOIN public.cliente c ON ((l.cod_cliente = c.cod_cliente)))
     JOIN public.cidade ci ON ((c.cod_cidade = ci.cod_cidade)))
     JOIN public.uf u ON ((ci.sigla_uf = u.sigla_uf)))
  WHERE ((l.valor_locacao >= (2)::numeric) AND ((ci.nome_cidade)::text ~~ 'C%'::text) AND (u.sigla_uf = ANY (ARRAY['RJ'::bpchar, 'SP'::bpchar, 'ES'::bpchar, 'MG'::bpchar, 'BA'::bpchar, 'PE'::bpchar])))
  GROUP BY u.sigla_uf
  ORDER BY u.sigla_uf;


--
-- Name: demo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo ALTER COLUMN id SET DEFAULT nextval('public.demo_id_seq'::regclass);


--
-- Name: demo demo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (id);


--
-- Name: cidade pk_cidade; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT pk_cidade PRIMARY KEY (cod_cidade);


--
-- Name: cliente pk_cliente; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (cod_cliente);


--
-- Name: filme pk_filme; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.filme
    ADD CONSTRAINT pk_filme PRIMARY KEY (cod_filme);


--
-- Name: genero_filme pk_genero_filme; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero_filme
    ADD CONSTRAINT pk_genero_filme PRIMARY KEY (cod_genero_filme);


--
-- Name: locacao pk_locacao; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT pk_locacao PRIMARY KEY (cod_cliente, cod_filme, data_locacao);


--
-- Name: uf pk_uf; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uf
    ADD CONSTRAINT pk_uf PRIMARY KEY (sigla_uf);


--
-- Name: cidade fk_cidade_uf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT fk_cidade_uf FOREIGN KEY (sigla_uf) REFERENCES public.uf(sigla_uf);


--
-- Name: cliente fk_cliente_cidades; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_cidades FOREIGN KEY (cod_cidade) REFERENCES public.cidade(cod_cidade);


--
-- Name: filme fk_filme_generos_filme; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.filme
    ADD CONSTRAINT fk_filme_generos_filme FOREIGN KEY (cod_genero_filme) REFERENCES public.genero_filme(cod_genero_filme);


--
-- Name: locacao fk_locacao_filme; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT fk_locacao_filme FOREIGN KEY (cod_filme) REFERENCES public.filme(cod_filme);


--
-- Name: locacao fk_locacaos_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT fk_locacaos_cliente FOREIGN KEY (cod_cliente) REFERENCES public.cliente(cod_cliente);


--
-- PostgreSQL database dump complete
--


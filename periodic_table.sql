--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE IF EXISTS periodic_table;
CREATE DATABASE periodic_table WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE periodic_table OWNER TO postgres;

\connect periodic_table

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

CREATE TABLE public.elements (
    atomic_number integer PRIMARY KEY,
    symbol character varying(2) NOT NULL UNIQUE,
    name character varying(40) NOT NULL UNIQUE
);

CREATE TABLE public.properties (
    atomic_number integer PRIMARY KEY REFERENCES public.elements(atomic_number),
    atomic_mass numeric NOT NULL,
    melting_point_celsius numeric NOT NULL,
    boiling_point_celsius numeric NOT NULL,
    type_id integer NOT NULL
);

CREATE TABLE public.types (
    type_id integer PRIMARY KEY,
    type character varying(20) NOT NULL
);

INSERT INTO public.types VALUES (1, 'metal'), (2, 'metalloid'), (3, 'nonmetal');

INSERT INTO public.elements VALUES (1, 'H', 'Hydrogen');
INSERT INTO public.elements VALUES (2, 'He', 'Helium');
INSERT INTO public.elements VALUES (3, 'Li', 'Lithium');
INSERT INTO public.elements VALUES (4, 'Be', 'Beryllium');
INSERT INTO public.elements VALUES (5, 'B', 'Boron');
INSERT INTO public.elements VALUES (6, 'C', 'Carbon');
INSERT INTO public.elements VALUES (7, 'N', 'Nitrogen');
INSERT INTO public.elements VALUES (8, 'O', 'Oxygen');
INSERT INTO public.elements VALUES (9, 'F', 'Fluorine');
INSERT INTO public.elements VALUES (10, 'Ne', 'Neon');

INSERT INTO public.properties VALUES (1, 1.008, -259.1, -252.9, 3);
INSERT INTO public.properties VALUES (2, 4.0026, -272.2, -269, 3);
INSERT INTO public.properties VALUES (3, 6.94, 180.54, 1342, 1);
INSERT INTO public.properties VALUES (4, 9.0122, 1287, 2470, 1);
INSERT INTO public.properties VALUES (5, 10.81, 2075, 4000, 2);
INSERT INTO public.properties VALUES (6, 12.011, 3550, 4027, 3);
INSERT INTO public.properties VALUES (7, 14.007, -210.1, -195.8, 3);
INSERT INTO public.properties VALUES (8, 15.999, -218, -183, 3);
INSERT INTO public.properties VALUES (9, 18.998, -220, -188.1, 3);
INSERT INTO public.properties VALUES (10, 20.18, -248.6, -246.1, 3);

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year_of_discovery integer,
    description text,
    age_in_million_years integer,
    distance_from_earth numeric,
    spiral_form boolean,
    galaxy_cluster_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    year_of_discovery integer,
    description text,
    age_in_million_years integer,
    distance_from_earth numeric,
    is_rocky boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    year_of_discovery integer,
    description text,
    age_in_million_years integer,
    distance_from_earth numeric,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    year_of_discovery integer,
    description text,
    age_in_million_years integer,
    distance_from_earth numeric,
    is_giant boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 1610, 'Galaxia en espiral barrada', 13000, 0, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Gran Nube de Magallanes', 964, 'Galaxia enana irregular', 1300, 163000, false, 1);
INSERT INTO public.galaxy VALUES (3, 'Pequeña Nube de Magallanes', 1751, 'Galaxia enana irregular', 2000, 200000, false, 1);
INSERT INTO public.galaxy VALUES (4, 'Galaxia de Andrómeda', 964, 'Galaxia en espiral', 5000, 2500000, true, 1);
INSERT INTO public.galaxy VALUES (5, 'Galaxia del Triángulo', 1784, 'Galaxia espiral barrada', 6300, 3000000, true, 1);
INSERT INTO public.galaxy VALUES (6, 'Galaxia del Sombrero (M104)', 1781, 'Galaxia en espiral', 29000, 28000000, true, 1);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Cúmulo Local', 'El Cúmulo Local es un cúmulo de galaxias que incluye a la Vía Láctea y a varias galaxias satélites cercanas, como la Gran Nube de Magallanes y la Pequeña Nube de Magallanes');
INSERT INTO public.galaxy_cluster VALUES (2, 'Virgo', 'Es uno de los cúmulos de galaxias más grandes y más cercanos a la Tierra, situado a unos 53 millones de años luz en la constelación de Virgo');
INSERT INTO public.galaxy_cluster VALUES (3, 'Coma', 'También conocido como Abell 1656, es uno de los cúmulos de galaxias más cercanos a la Tierra, situado a unos 320 millones de años luz en la constelación de Coma Berenices');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, -1000, 'La Luna de la Tierra', 4500, 384400, true);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 1877, 'Una de las dos lunas de Marte', 4000, 9400, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 'Una de las dos lunas de Marte', 4000, 23460, true);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 1610, 'Una de las cuatro grandes lunas de Júpier', 4500, 670900, true);
INSERT INTO public.moon VALUES (5, 'Ganímedes', 5, 1610, 'La luna más grande del Sistema Solar', 4500, 1070400, true);
INSERT INTO public.moon VALUES (6, 'Calisto', 5, 1610, 'La tercera luna más grande de Júpiter', 4500, 1883000, true);
INSERT INTO public.moon VALUES (7, 'Io', 5, 1610, 'La luna más volcánicamente activa del Sistema Solar', 4500, 421700, true);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 1789, 'Una de las lunas más pequeñas de Saturno', 4500, 185500, true);
INSERT INTO public.moon VALUES (9, 'Encélado', 6, 1789, 'Una de las lunas más brillantes de Saturno', 4500, 238000, true);
INSERT INTO public.moon VALUES (10, 'Tetis', 6, 1684, 'Una de las grandes lunas de Saturno', 4500, 295000, true);
INSERT INTO public.moon VALUES (11, 'Titán', 6, 1655, 'La luna más grande de Saturno', 4500, 1221870, true);
INSERT INTO public.moon VALUES (12, 'Hipérion', 6, 1848, 'Una de las lunas extrañas de Saturno', 4500, 129390, true);
INSERT INTO public.moon VALUES (13, 'Jápeto', 6, 1671, 'La tercera luna más grande de Saturno', 4500, 3560820, true);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 1948, 'La luna más pequeña de Urano', 4500, 129390, true);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1851, 'La cuarta luna más grande de Urano', 4500, 190900, true);
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, 1851, 'La tercera luna más grande de Urano', 4500, 266000, true);
INSERT INTO public.moon VALUES (22, 'Oberón', 7, 1787, 'La segunda luna más grande de Urano', 4500, 583520, true);
INSERT INTO public.moon VALUES (23, 'Tritón', 8, 1846, 'La luna más grande de Neptuno', 4500, 354800, true);
INSERT INTO public.moon VALUES (24, 'Nereida', 8, 1949, 'La tercera luna más grande de Neptuno', 4500, 5513800, true);
INSERT INTO public.moon VALUES (25, 'Proteo', 8, 1989, 'La segunda luna más grande de Neptuno', 4500, 117647, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, -2000, 'El planeta más cercano al Sol', 4600, 77.3, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, -1000, 'El planeta más caliente de nuestro sistema solar', 4500, 38.2, false);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, NULL, 'El tercer planeta desde el Sol y el único lugar conocido en el universo que tiene vida', 4500, 0, false);
INSERT INTO public.planet VALUES (4, 'Marte', 1, 1659, 'El cuarto planeta desde el Sol y el segundo más pequeño del sistema solar', 4500, 78.3, false);
INSERT INTO public.planet VALUES (5, 'Júpiter', 1, 1610, 'El planeta más grande del sistema solar y el quinto desde el Sol', 4600, 628.7, true);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, 1610, 'El segundo planeta más grande del sistema solar y el sexto desde el Sol', 4600, 1277.6, true);
INSERT INTO public.planet VALUES (7, 'Urano', 1, 1781, 'El séptimo planeta desde el Sol y el tercero más grande del sistema solar', 4600, 2722.3, true);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, 1846, 'El octavo y el planeta más distante conocido del Sol', 4600, 4355.9, true);
INSERT INTO public.planet VALUES (9, 'Plutón', 1, 1930, 'Un planeta enano y el más grande del cinturón de Kuiper', 4600, 5906.4, true);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 1801, 'El objeto más grande del cinturón de asteroides', 4600, 414.2, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 2004, 'Un planeta enano en el cinturón de Kuiper', 4600, 43.3, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 2005, 'Un planeta enano en el cinturón de Kuiper', 4600, 52.5, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, -4500000, 'Estrella tipo G', 4600, 0, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 1833, 'Estrella binaria', 6000, 4.37, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 1830, 'Estrella binaria', 6000, 4.37, false);
INSERT INTO public.star VALUES (4, 'Sirius A', 1, -2000, 'Estrella binaria', 250, 8.6, false);
INSERT INTO public.star VALUES (5, 'Sirius B', 1, 1862, 'Enana blanca', 12000, 8.6, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 1850, 'Estrella tipo A', 455, 25, false);


--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_id UNIQUE (galaxy_cluster_id);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (galaxy_cluster_id) REFERENCES public.galaxy_cluster(galaxy_cluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


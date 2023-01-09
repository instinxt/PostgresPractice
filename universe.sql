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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km integer,
    weight_in_reference text,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    has_stars_in_billion integer,
    size_in_light_year integer,
    has_exoplanets_in_millions integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    distance_from_planet_in_km numeric(7,1),
    has_atmosphere boolean,
    radius_in_km integer,
    planet_id integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km integer,
    has_moons boolean,
    has_rings boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    age_in_billion_years integer,
    radius_in_km integer,
    end_form character varying(30),
    galaxy_id integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_holes_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'SYRUS-219', 200, 'About 200 Earth Suns', 1);
INSERT INTO public.black_hole VALUES (2, 'MITHL-21', 100, 'About 100 Earth Suns', 2);
INSERT INTO public.black_hole VALUES (3, 'TON-62', 1000, 'About 1000 Earth Suns', 3);
INSERT INTO public.black_hole VALUES (4, 'MUZX', 400, 'About 400 Earth Suns', 4);
INSERT INTO public.black_hole VALUES (5, 'TYREX', 500, 'About 500 Earth Suns', 5);
INSERT INTO public.black_hole VALUES (6, 'CITIUS', 66, 'About 660 Earth Suns', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 3, 2, 10, 'Home to Earth, a hazy band of light seen in the night sky');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 2, 3, 20, 'Also known as Messier31  or NGC224 is a barred neighbouring galaxy to our milky way');
INSERT INTO public.galaxy VALUES ('Messier 63', 3, 400, 20, 30, 'Also known as NGC 5055 or seldom-used Sunflower Galaxy');
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 4, 8, 6, 5, 'Present in constellation borders of Virgo and Corvus');
INSERT INTO public.galaxy VALUES ('Whirpool Galaxy', 5, 4, 4, 20, 'Located in constellation Canes Vanatici');
INSERT INTO public.galaxy VALUES ('Cartwheel Galaxy', 6, 5, 6, 100, 'A lenticular/ring galaxy 500 million light years away from earth ');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Earth Moon', 1, 384400.0, false, 1734, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, 1212.0, false, 11, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, 45199.0, false, 6, 4);
INSERT INTO public.moon VALUES ('Europa', 4, 10000.0, false, 8, 5);
INSERT INTO public.moon VALUES ('Ganymede', 5, 12000.0, false, 9, 5);
INSERT INTO public.moon VALUES ('Callisto', 6, 2410.0, false, 12, 5);
INSERT INTO public.moon VALUES ('Amalthea', 7, 83.0, false, 5, 5);
INSERT INTO public.moon VALUES ('Adrastea', 8, 1200.0, false, 8, 5);
INSERT INTO public.moon VALUES ('Himalia', 9, 20000.0, false, 4, 5);
INSERT INTO public.moon VALUES ('Thebe', 10, 15000.0, false, 5, 5);
INSERT INTO public.moon VALUES ('Valetudo', 11, 18000.0, false, 6, 5);
INSERT INTO public.moon VALUES ('Kallichore', 12, 17000.0, false, 12, 5);
INSERT INTO public.moon VALUES ('Autonoe', 13, 11000.0, false, 2, 5);
INSERT INTO public.moon VALUES ('Titan', 14, 12000.0, true, 140, 6);
INSERT INTO public.moon VALUES ('Enceladus', 15, 15000.0, false, 120, 6);
INSERT INTO public.moon VALUES ('Mimas', 16, 17500.0, false, 110, 6);
INSERT INTO public.moon VALUES ('Dione', 17, 18000.0, true, 120, 6);
INSERT INTO public.moon VALUES ('Lapetus', 18, 15000.0, true, 34, 6);
INSERT INTO public.moon VALUES ('Tethys', 19, 12200.0, true, 31, 6);
INSERT INTO public.moon VALUES ('Hyperion', 20, 10000.0, true, 40, 6);
INSERT INTO public.moon VALUES ('Epimethyeus', 21, 14000.0, true, 41, 6);
INSERT INTO public.moon VALUES ('Telesto', 22, 20000.0, true, 12, 6);
INSERT INTO public.moon VALUES ('Miranda', 23, 24000.0, true, 40, 7);
INSERT INTO public.moon VALUES ('Titania', 24, 21000.0, true, 45, 7);
INSERT INTO public.moon VALUES ('Oberon', 25, 25000.0, true, 46, 7);
INSERT INTO public.moon VALUES ('Ariel', 26, 11000.0, true, 24, 7);
INSERT INTO public.moon VALUES ('Puck', 27, 12000.0, true, 45, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 2440, false, false, 4);
INSERT INTO public.planet VALUES ('Venus', 2, 6051, false, false, 4);
INSERT INTO public.planet VALUES ('Earth', 3, 6371, true, false, 4);
INSERT INTO public.planet VALUES ('Mars', 4, 3389, true, false, 4);
INSERT INTO public.planet VALUES ('Jupiter', 5, 69911, true, false, 4);
INSERT INTO public.planet VALUES ('Saturn', 6, 58232, true, true, 4);
INSERT INTO public.planet VALUES ('Uranus', 7, 25362, true, false, 4);
INSERT INTO public.planet VALUES ('Neptune', 8, 24622, true, false, 4);
INSERT INTO public.planet VALUES ('Pluto', 9, 12565, false, false, 4);
INSERT INTO public.planet VALUES ('Violet', 10, 12612, false, false, 5);
INSERT INTO public.planet VALUES ('CZEX-12', 11, 45112, false, false, 6);
INSERT INTO public.planet VALUES ('TREZ', 12, 32512, false, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Earth Sun', 4, 5, 278952, 'Planetary Nebula', 1);
INSERT INTO public.star VALUES ('Morbius', 5, 4, 128512, 'Planetary Nebula', 2);
INSERT INTO public.star VALUES ('Aestheus', 6, 5, 121278, 'Planetary Nebula', 3);
INSERT INTO public.star VALUES ('Citryzx', 7, 7, 589985, 'Neutronn Star', 4);
INSERT INTO public.star VALUES ('Homyis', 8, 6, 989989, 'Black hole', 5);
INSERT INTO public.star VALUES ('Amortite', 9, 7, 484484, 'Neutron Star', 6);


--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_hole_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 33, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: black_hole black_holes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_name_key UNIQUE (name);


--
-- Name: black_hole black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_holes_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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


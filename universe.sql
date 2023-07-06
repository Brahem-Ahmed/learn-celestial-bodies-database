--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    name character varying(50) NOT NULL,
    text text,
    has_life_potential boolean,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(70) NOT NULL,
    galaxy_type character varying(70),
    galaxy_age integer,
    nb_of_stars integer
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
    moon_id integer NOT NULL,
    name character varying(70) NOT NULL,
    moon_age integer,
    orbital_period integer,
    planet_id integer NOT NULL,
    moon_gravity numeric
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
    name character varying(70) NOT NULL,
    planet_age integer,
    nb_of_moons integer,
    planet_gravity numeric,
    terrestial_planet boolean,
    star_id integer NOT NULL
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
    name character varying(70) NOT NULL,
    star_type character varying(70),
    star_age integer,
    nb_of_planets integer,
    galaxy_id integer NOT NULL
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


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
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'Earth', 'Our home planet Earth is a rocky, terrestrial planet. It has a solid and active surface with mountains, valleys, canyons, plains and so much more. Earth is special because it is an ocean planet. Water covers 70% of Earth''s surface.', true, NULL, NULL, 3, NULL);
INSERT INTO public.description VALUES (2, 'Our Moon', 'Our Moon is like a desert with plains, mountains, and valleys. It also has many craters, holes created when space rocks hit the surface at a high speed. There is no air to breathe on the Moon. The Moon travels around the Earth in an oval-shaped orbit.', true, NULL, NULL, NULL, 1);
INSERT INTO public.description VALUES (3, 'Our Galaxy', 'The Milky Way is a huge collection of stars, dust, and gas. It''s called a spiral galaxy because if you could view it from the top or bottom, it would look like a spinning pinwheel. The Sun is located on one of the spiral arms, about 25,000 light-years away from the center of the galaxy.', true, 1, NULL, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 22000, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 400, 40);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 12000, 150);
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 'Irregular', 45, 5);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 900, 80);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 27, 3, 1.62);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 0, 4, 0.0057);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 1, 4, 0.003);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4500, 7, 5, 1.428);
INSERT INTO public.moon VALUES (5, 'Callisto', 4500, 17, 5, 1.235);
INSERT INTO public.moon VALUES (6, 'Io', 4500, 2, 5, 1.796);
INSERT INTO public.moon VALUES (7, 'Europa', 4500, 4, 5, 1.314);
INSERT INTO public.moon VALUES (8, 'Titan', 4500, 16, 6, 1.352);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4500, 1, 6, 0.113);
INSERT INTO public.moon VALUES (10, 'Triton', 4500, 6, 7, 0.779);
INSERT INTO public.moon VALUES (11, 'Nereid', 4500, 360, 7, 0.037);
INSERT INTO public.moon VALUES (12, 'Miranda', 4500, 1, 7, 0.079);
INSERT INTO public.moon VALUES (13, 'Ariel', 4500, 3, 7, 0.269);
INSERT INTO public.moon VALUES (14, 'Umbriel', 4500, 4, 7, 0.232);
INSERT INTO public.moon VALUES (15, 'Titania', 4500, 9, 7, 0.379);
INSERT INTO public.moon VALUES (16, 'Oberon', 4500, 13, 7, 0.346);
INSERT INTO public.moon VALUES (18, 'Larissa', 4500, 1, 8, 0.022);
INSERT INTO public.moon VALUES (19, 'Hyperion', 4500, 21, 6, 0.047);
INSERT INTO public.moon VALUES (20, 'Phoebe', 4500, 550, 6, 0.024);
INSERT INTO public.moon VALUES (17, 'Thebe', 4500, 1, 5, 0.066);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4600, 0, 3.7, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 0, 8.87, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4543, 1, 9.81, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 2, 3.7, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, 79, 24.79, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 82, 10.44, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 27, 8.69, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, 14, 11.15, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 1500, 0, 14, true, 7);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 4000, 1, 1.38, true, 5);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 800, 0, 2.02, false, 8);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', 1000, 0, 1.9, true, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type Main Sequence', 4600, 8, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M5V', 500, 1, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'M1-2Ia-Iab', 8, 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A1V', 250, 0, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G2V', 6000, 2, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K1V', 5500, 0, 1);
INSERT INTO public.star VALUES (7, 'Kepler-452', 'G2V', 2000, 1, 1);
INSERT INTO public.star VALUES (8, 'HD 189733', 'K1V', 800, 1, 1);
INSERT INTO public.star VALUES (9, 'Gliese 581', 'M-type Red Dwarf', 4000, 6, 1);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: description unique_description_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT unique_description_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: description description_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: description description_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: description description_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: description description_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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


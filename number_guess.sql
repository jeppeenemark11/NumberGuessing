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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL,
    games_played integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 11, 0, 1);
INSERT INTO public.games VALUES (14, 24, 181, 1);
INSERT INTO public.games VALUES (9, 19, 9, 1);
INSERT INTO public.games VALUES (2, 12, 0, 1);
INSERT INTO public.games VALUES (4, 14, 0, 0);
INSERT INTO public.games VALUES (10, 20, 10, 1);
INSERT INTO public.games VALUES (3, 13, 9, 2);
INSERT INTO public.games VALUES (5, 15, 0, 0);
INSERT INTO public.games VALUES (11, 21, 20, 5);
INSERT INTO public.games VALUES (12, 22, 91, 2);
INSERT INTO public.games VALUES (6, 16, 9, 1);
INSERT INTO public.games VALUES (8, 18, 495, 1);
INSERT INTO public.games VALUES (7, 17, 255, 2);
INSERT INTO public.games VALUES (13, 23, 11, 1);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Jeppe');
INSERT INTO public.users VALUES (2, 'Jeep');
INSERT INTO public.users VALUES (3, 'user_1702584519665');
INSERT INTO public.users VALUES (4, 'user_1702584519664');
INSERT INTO public.users VALUES (5, 'j');
INSERT INTO public.users VALUES (6, 'user_1702584661655');
INSERT INTO public.users VALUES (7, 'user_1702584661654');
INSERT INTO public.users VALUES (8, 'Werner');
INSERT INTO public.users VALUES (9, 'user_1702584872716');
INSERT INTO public.users VALUES (10, 'user_1702584872715');
INSERT INTO public.users VALUES (11, 'Test');
INSERT INTO public.users VALUES (12, 'ER');
INSERT INTO public.users VALUES (13, 'test2');
INSERT INTO public.users VALUES (14, 'Test2');
INSERT INTO public.users VALUES (15, 'SER');
INSERT INTO public.users VALUES (16, 'NU');
INSERT INTO public.users VALUES (17, 'user_1702585796513');
INSERT INTO public.users VALUES (18, 'user_1702585796512');
INSERT INTO public.users VALUES (19, 'Shern');
INSERT INTO public.users VALUES (20, 'STERN');
INSERT INTO public.users VALUES (21, 'user_1702586206290');
INSERT INTO public.users VALUES (22, 'user_1702586206289');
INSERT INTO public.users VALUES (23, 'e');
INSERT INTO public.users VALUES (24, 'user_1702586334795');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 14, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    player_id integer NOT NULL,
    tries integer NOT NULL
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 14, 286);
INSERT INTO public.games VALUES (2, 14, 47);
INSERT INTO public.games VALUES (3, 15, 110);
INSERT INTO public.games VALUES (4, 15, 426);
INSERT INTO public.games VALUES (5, 14, 810);
INSERT INTO public.games VALUES (6, 14, 785);
INSERT INTO public.games VALUES (7, 14, 242);
INSERT INTO public.games VALUES (8, 1, 13);
INSERT INTO public.games VALUES (9, 16, 907);
INSERT INTO public.games VALUES (10, 16, 866);
INSERT INTO public.games VALUES (11, 17, 874);
INSERT INTO public.games VALUES (12, 17, 980);
INSERT INTO public.games VALUES (13, 16, 77);
INSERT INTO public.games VALUES (14, 16, 835);
INSERT INTO public.games VALUES (15, 16, 940);
INSERT INTO public.games VALUES (16, 18, 10);
INSERT INTO public.games VALUES (17, 18, 11);
INSERT INTO public.games VALUES (18, 19, 31);
INSERT INTO public.games VALUES (19, 19, 649);
INSERT INTO public.games VALUES (20, 20, 529);
INSERT INTO public.games VALUES (21, 20, 493);
INSERT INTO public.games VALUES (22, 19, 498);
INSERT INTO public.games VALUES (23, 19, 467);
INSERT INTO public.games VALUES (24, 19, 400);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'Alex');
INSERT INTO public.players VALUES (2, 'user_1795031988088');
INSERT INTO public.players VALUES (3, 'user_1795031988087');
INSERT INTO public.players VALUES (4, 'user_1795032281485');
INSERT INTO public.players VALUES (5, 'user_1795032281484');
INSERT INTO public.players VALUES (6, 'user_1795032918339');
INSERT INTO public.players VALUES (7, 'user_1795032918338');
INSERT INTO public.players VALUES (8, 'user_1795033049291');
INSERT INTO public.players VALUES (9, 'user_1795033049290');
INSERT INTO public.players VALUES (10, 'user_1795033190299');
INSERT INTO public.players VALUES (11, 'user_1795033190298');
INSERT INTO public.players VALUES (12, 'user_1795033353103');
INSERT INTO public.players VALUES (13, 'user_1795033353102');
INSERT INTO public.players VALUES (14, 'user_1795033711316');
INSERT INTO public.players VALUES (15, 'user_1795033711315');
INSERT INTO public.players VALUES (16, 'user_1795034002685');
INSERT INTO public.players VALUES (17, 'user_1795034002684');
INSERT INTO public.players VALUES (18, 'Chanchito');
INSERT INTO public.players VALUES (19, 'user_1795034254099');
INSERT INTO public.players VALUES (20, 'user_1795034254098');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 24, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--


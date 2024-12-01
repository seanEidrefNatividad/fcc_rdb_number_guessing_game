--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: plays; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.plays (
    play_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.plays OWNER TO freecodecamp;

--
-- Name: plays_play_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.plays_play_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plays_play_id_seq OWNER TO freecodecamp;

--
-- Name: plays_play_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.plays_play_id_seq OWNED BY public.plays.play_id;


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
-- Name: plays play_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.plays ALTER COLUMN play_id SET DEFAULT nextval('public.plays_play_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: plays; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.plays VALUES (17, 3, 69);
INSERT INTO public.plays VALUES (18, 4, 69);
INSERT INTO public.plays VALUES (19, 730, 70);
INSERT INTO public.plays VALUES (20, 4, 70);
INSERT INTO public.plays VALUES (21, 871, 71);
INSERT INTO public.plays VALUES (22, 473, 71);
INSERT INTO public.plays VALUES (23, 779, 70);
INSERT INTO public.plays VALUES (24, 905, 70);
INSERT INTO public.plays VALUES (25, 351, 70);
INSERT INTO public.plays VALUES (26, 1, 69);
INSERT INTO public.plays VALUES (27, 458, 72);
INSERT INTO public.plays VALUES (28, 332, 72);
INSERT INTO public.plays VALUES (29, 370, 73);
INSERT INTO public.plays VALUES (30, 664, 73);
INSERT INTO public.plays VALUES (31, 591, 72);
INSERT INTO public.plays VALUES (32, 195, 72);
INSERT INTO public.plays VALUES (33, 416, 72);
INSERT INTO public.plays VALUES (34, 124, 74);
INSERT INTO public.plays VALUES (35, 302, 74);
INSERT INTO public.plays VALUES (36, 77, 75);
INSERT INTO public.plays VALUES (37, 340, 75);
INSERT INTO public.plays VALUES (38, 642, 74);
INSERT INTO public.plays VALUES (39, 529, 74);
INSERT INTO public.plays VALUES (40, 876, 74);
INSERT INTO public.plays VALUES (41, 725, 76);
INSERT INTO public.plays VALUES (42, 295, 76);
INSERT INTO public.plays VALUES (43, 898, 77);
INSERT INTO public.plays VALUES (44, 609, 77);
INSERT INTO public.plays VALUES (45, 652, 76);
INSERT INTO public.plays VALUES (46, 624, 76);
INSERT INTO public.plays VALUES (47, 545, 76);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (69, 'a');
INSERT INTO public.users VALUES (70, 'user_1733027516287');
INSERT INTO public.users VALUES (71, 'user_1733027516286');
INSERT INTO public.users VALUES (72, 'user_1733027632299');
INSERT INTO public.users VALUES (73, 'user_1733027632298');
INSERT INTO public.users VALUES (74, 'user_1733027651178');
INSERT INTO public.users VALUES (75, 'user_1733027651177');
INSERT INTO public.users VALUES (76, 'user_1733027708096');
INSERT INTO public.users VALUES (77, 'user_1733027708095');


--
-- Name: plays_play_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.plays_play_id_seq', 47, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 77, true);


--
-- Name: plays plays_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.plays
    ADD CONSTRAINT plays_pkey PRIMARY KEY (play_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: plays plays_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.plays
    ADD CONSTRAINT plays_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


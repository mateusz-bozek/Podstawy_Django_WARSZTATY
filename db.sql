--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: contacts_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_address (
    id integer NOT NULL,
    city character varying(128) NOT NULL,
    street character varying(128) NOT NULL,
    home_no character varying(64) NOT NULL,
    apartment_no character varying(64) NOT NULL,
    zip_code integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.contacts_address OWNER TO postgres;

--
-- Name: contacts_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_address_id_seq OWNER TO postgres;

--
-- Name: contacts_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_address_id_seq OWNED BY public.contacts_address.id;


--
-- Name: contacts_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_email (
    id integer NOT NULL,
    email character varying(64) NOT NULL,
    email_type integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.contacts_email OWNER TO postgres;

--
-- Name: contacts_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_email_id_seq OWNER TO postgres;

--
-- Name: contacts_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_email_id_seq OWNED BY public.contacts_email.id;


--
-- Name: contacts_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_group (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.contacts_group OWNER TO postgres;

--
-- Name: contacts_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_group_id_seq OWNER TO postgres;

--
-- Name: contacts_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_group_id_seq OWNED BY public.contacts_group.id;


--
-- Name: contacts_group_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_group_person (
    id integer NOT NULL,
    group_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.contacts_group_person OWNER TO postgres;

--
-- Name: contacts_group_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_group_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_group_person_id_seq OWNER TO postgres;

--
-- Name: contacts_group_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_group_person_id_seq OWNED BY public.contacts_group_person.id;


--
-- Name: contacts_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_person (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    surname character varying(64) NOT NULL,
    description text NOT NULL,
    photo character varying(100) NOT NULL
);


ALTER TABLE public.contacts_person OWNER TO postgres;

--
-- Name: contacts_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_person_id_seq OWNER TO postgres;

--
-- Name: contacts_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_person_id_seq OWNED BY public.contacts_person.id;


--
-- Name: contacts_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_phone (
    id integer NOT NULL,
    number character varying(32) NOT NULL,
    number_type integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.contacts_phone OWNER TO postgres;

--
-- Name: contacts_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_phone_id_seq OWNER TO postgres;

--
-- Name: contacts_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_phone_id_seq OWNED BY public.contacts_phone.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: exercises_album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises_album (
    id integer NOT NULL,
    title text NOT NULL,
    release_year date NOT NULL,
    rating integer NOT NULL,
    band_id integer
);


ALTER TABLE public.exercises_album OWNER TO postgres;

--
-- Name: exercises_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_album_id_seq OWNER TO postgres;

--
-- Name: exercises_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_album_id_seq OWNED BY public.exercises_album.id;


--
-- Name: exercises_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises_article (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    author character varying(64),
    content text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    status integer NOT NULL,
    release_start_date date,
    release_end_date date
);


ALTER TABLE public.exercises_article OWNER TO postgres;

--
-- Name: exercises_article_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises_article_category (
    id integer NOT NULL,
    article_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.exercises_article_category OWNER TO postgres;

--
-- Name: exercises_article_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_article_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_article_category_id_seq OWNER TO postgres;

--
-- Name: exercises_article_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_article_category_id_seq OWNED BY public.exercises_article_category.id;


--
-- Name: exercises_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_article_id_seq OWNER TO postgres;

--
-- Name: exercises_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_article_id_seq OWNED BY public.exercises_article.id;


--
-- Name: exercises_band; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises_band (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    year integer,
    still_active boolean NOT NULL,
    genre integer NOT NULL
);


ALTER TABLE public.exercises_band OWNER TO postgres;

--
-- Name: exercises_band_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_band_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_band_id_seq OWNER TO postgres;

--
-- Name: exercises_band_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_band_id_seq OWNED BY public.exercises_band.id;


--
-- Name: exercises_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises_category (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text
);


ALTER TABLE public.exercises_category OWNER TO postgres;

--
-- Name: exercises_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_category_id_seq OWNER TO postgres;

--
-- Name: exercises_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_category_id_seq OWNED BY public.exercises_category.id;


--
-- Name: exercises_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises_person (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    surname character varying(64),
    birth_year integer,
    email character varying(254)
);


ALTER TABLE public.exercises_person OWNER TO postgres;

--
-- Name: exercises_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_person_id_seq OWNER TO postgres;

--
-- Name: exercises_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_person_id_seq OWNED BY public.exercises_person.id;


--
-- Name: exercises_song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises_song (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    duration timestamp with time zone,
    album_id integer
);


ALTER TABLE public.exercises_song OWNER TO postgres;

--
-- Name: exercises_song_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_song_id_seq OWNER TO postgres;

--
-- Name: exercises_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_song_id_seq OWNED BY public.exercises_song.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    team_home bigint,
    team_home_goals bigint,
    team_away bigint,
    team_away_goals bigint
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    name text NOT NULL,
    points bigint
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: contacts_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_address ALTER COLUMN id SET DEFAULT nextval('public.contacts_address_id_seq'::regclass);


--
-- Name: contacts_email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_email ALTER COLUMN id SET DEFAULT nextval('public.contacts_email_id_seq'::regclass);


--
-- Name: contacts_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group ALTER COLUMN id SET DEFAULT nextval('public.contacts_group_id_seq'::regclass);


--
-- Name: contacts_group_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group_person ALTER COLUMN id SET DEFAULT nextval('public.contacts_group_person_id_seq'::regclass);


--
-- Name: contacts_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_person ALTER COLUMN id SET DEFAULT nextval('public.contacts_person_id_seq'::regclass);


--
-- Name: contacts_phone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_phone ALTER COLUMN id SET DEFAULT nextval('public.contacts_phone_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: exercises_album id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_album ALTER COLUMN id SET DEFAULT nextval('public.exercises_album_id_seq'::regclass);


--
-- Name: exercises_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_article ALTER COLUMN id SET DEFAULT nextval('public.exercises_article_id_seq'::regclass);


--
-- Name: exercises_article_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_article_category ALTER COLUMN id SET DEFAULT nextval('public.exercises_article_category_id_seq'::regclass);


--
-- Name: exercises_band id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_band ALTER COLUMN id SET DEFAULT nextval('public.exercises_band_id_seq'::regclass);


--
-- Name: exercises_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_category ALTER COLUMN id SET DEFAULT nextval('public.exercises_category_id_seq'::regclass);


--
-- Name: exercises_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_person ALTER COLUMN id SET DEFAULT nextval('public.exercises_person_id_seq'::regclass);


--
-- Name: exercises_song id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_song ALTER COLUMN id SET DEFAULT nextval('public.exercises_song_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add album	7	add_album
26	Can change album	7	change_album
27	Can delete album	7	delete_album
28	Can view album	7	view_album
29	Can add article	8	add_article
30	Can change article	8	change_article
31	Can delete article	8	delete_article
32	Can view article	8	view_article
33	Can add band	9	add_band
34	Can change band	9	change_band
35	Can delete band	9	delete_band
36	Can view band	9	view_band
37	Can add category	10	add_category
38	Can change category	10	change_category
39	Can delete category	10	delete_category
40	Can view category	10	view_category
41	Can add person	11	add_person
42	Can change person	11	change_person
43	Can delete person	11	delete_person
44	Can view person	11	view_person
45	Can add song	12	add_song
46	Can change song	12	change_song
47	Can delete song	12	delete_song
48	Can view song	12	view_song
49	Can add team	13	add_team
50	Can change team	13	change_team
51	Can delete team	13	delete_team
52	Can view team	13	view_team
53	Can add game	14	add_game
54	Can change game	14	change_game
55	Can delete game	14	delete_game
56	Can view game	14	view_game
57	Can add address	15	add_address
58	Can change address	15	change_address
59	Can delete address	15	delete_address
60	Can view address	15	view_address
61	Can add email	16	add_email
62	Can change email	16	change_email
63	Can delete email	16	delete_email
64	Can view email	16	view_email
65	Can add group	17	add_group
66	Can change group	17	change_group
67	Can delete group	17	delete_group
68	Can view group	17	view_group
69	Can add person	18	add_person
70	Can change person	18	change_person
71	Can delete person	18	delete_person
72	Can view person	18	view_person
73	Can add phone	19	add_phone
74	Can change phone	19	change_phone
75	Can delete phone	19	delete_phone
76	Can view phone	19	view_phone
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$LZRbJkxskcJt$wU4lAvTu1d9GLqB94UsdToKw2dHm3/iWXWNTx3BxnBc=	\N	t	admin			admin@example.com	t	t	2019-12-21 10:18:30.46921+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: contacts_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_address (id, city, street, home_no, apartment_no, zip_code, person_id) FROM stdin;
\.


--
-- Data for Name: contacts_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_email (id, email, email_type, person_id) FROM stdin;
\.


--
-- Data for Name: contacts_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_group (id, name) FROM stdin;
\.


--
-- Data for Name: contacts_group_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_group_person (id, group_id, person_id) FROM stdin;
\.


--
-- Data for Name: contacts_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_person (id, name, surname, description, photo) FROM stdin;
1	Mateusz	Bozek		default.png
\.


--
-- Data for Name: contacts_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_phone (id, number, number_type, person_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	exercises	album
8	exercises	article
9	exercises	band
10	exercises	category
11	exercises	person
12	exercises	song
13	football	team
14	football	game
15	contacts	address
16	contacts	email
17	contacts	group
18	contacts	person
19	contacts	phone
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-21 10:18:29.731738+01
2	auth	0001_initial	2019-12-21 10:18:29.77499+01
3	admin	0001_initial	2019-12-21 10:18:29.807942+01
4	admin	0002_logentry_remove_auto_add	2019-12-21 10:18:29.825583+01
5	admin	0003_logentry_add_action_flag_choices	2019-12-21 10:18:29.845339+01
6	contenttypes	0002_remove_content_type_name	2019-12-21 10:18:29.869436+01
7	auth	0002_alter_permission_name_max_length	2019-12-21 10:18:29.87726+01
8	auth	0003_alter_user_email_max_length	2019-12-21 10:18:29.89068+01
9	auth	0004_alter_user_username_opts	2019-12-21 10:18:29.903023+01
10	auth	0005_alter_user_last_login_null	2019-12-21 10:18:29.914408+01
11	auth	0006_require_contenttypes_0002	2019-12-21 10:18:29.916187+01
12	auth	0007_alter_validators_add_error_messages	2019-12-21 10:18:29.929214+01
13	auth	0008_alter_user_username_max_length	2019-12-21 10:18:29.939954+01
14	auth	0009_alter_user_last_name_max_length	2019-12-21 10:18:29.950295+01
15	auth	0010_alter_group_name_max_length	2019-12-21 10:18:29.958076+01
16	auth	0011_update_proxy_permissions	2019-12-21 10:18:29.964912+01
17	contacts	0001_initial	2019-12-21 10:18:29.998436+01
18	exercises	0001_initial	2019-12-21 10:18:30.026121+01
19	exercises	0002_populate	2019-12-21 10:18:30.045265+01
20	exercises	0003_album_band	2019-12-21 10:18:30.049042+01
21	exercises	0004_auto_20191207_1502	2019-12-21 10:18:30.061846+01
22	football	0001_initial	2019-12-21 10:18:30.078361+01
23	sessions	0001_initial	2019-12-21 10:18:30.086527+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: exercises_album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises_album (id, title, release_year, rating, band_id) FROM stdin;
\.


--
-- Data for Name: exercises_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises_article (id, title, author, content, date_added, status, release_start_date, release_end_date) FROM stdin;
\.


--
-- Data for Name: exercises_article_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises_article_category (id, article_id, category_id) FROM stdin;
\.


--
-- Data for Name: exercises_band; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises_band (id, name, year, still_active, genre) FROM stdin;
1	The Beatles	\N	t	-1
2	The Rolling Stones	\N	t	-1
3	Metallica	1982	t	-1
4	Pink Floyd	1965	t	-1
5	Deep Purple	\N	t	-1
6	The Clash	1976	t	-1
7	AC/DC	1973	t	-1
8	Nirvana	1987	t	-1
9	Blur	1988	t	-1
10	Oasis	1991	t	-1
11	Red Hot Chili Peppers	1983	t	-1
12	System Of A Down	1994	t	-1
13	Dire Straits	\N	t	-1
14	Twenty One Pilots	2009	t	-1
\.


--
-- Data for Name: exercises_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises_category (id, name, description) FROM stdin;
\.


--
-- Data for Name: exercises_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises_person (id, name, surname, birth_year, email) FROM stdin;
\.


--
-- Data for Name: exercises_song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises_song (id, title, duration, album_id) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, team_home, team_home_goals, team_away, team_away_goals) FROM stdin;
17	1	0	4	1
18	1	1	5	0
19	1	3	6	0
20	1	5	8	0
21	1	1	9	0
22	1	1	10	0
23	1	3	14	2
24	1	3	16	2
25	2	2	1	1
26	2	2	4	0
27	2	2	5	0
28	2	0	6	1
29	2	2	9	1
30	2	2	14	1
31	2	5	16	2
32	3	1	1	3
33	3	1	2	5
34	3	1	4	1
35	3	3	7	2
36	3	4	12	1
37	3	5	16	2
38	4	0	5	2
39	4	2	6	0
40	4	1	7	1
41	4	4	9	3
42	4	2	11	0
43	4	1	14	1
44	4	4	15	3
48	5	1	3	2
49	5	0	7	0
50	5	2	8	3
51	5	3	9	1
52	5	0	10	3
53	5	1	11	0
54	5	2	15	0
55	6	2	3	3
56	6	1	5	3
57	6	1	8	1
58	6	0	9	1
59	6	2	10	1
60	6	1	11	0
61	6	4	13	0
62	6	4	14	1
63	7	1	1	2
64	7	0	2	4
65	7	1	6	0
66	7	1	11	1
67	7	2	12	0
68	7	1	14	2
69	7	0	16	1
70	8	0	3	2
71	8	0	4	0
72	8	0	7	2
73	8	1	10	2
74	8	0	11	1
75	8	2	12	3
76	8	3	13	0
77	8	5	15	1
78	9	2	3	5
79	9	0	7	0
80	9	1	8	1
81	9	2	10	1
82	9	1	11	2
83	9	4	13	0
84	9	4	15	2
85	10	0	2	0
86	10	1	3	3
87	10	2	4	6
88	10	3	7	1
89	10	2	11	1
90	10	1	12	0
91	10	2	13	2
92	10	0	15	4
93	11	2	1	3
94	11	1	2	0
95	11	0	5	1
96	11	5	12	0
97	11	2	14	2
98	11	3	16	2
99	12	1	1	1
100	12	1	2	5
101	12	2	4	1
102	12	1	5	2
103	12	0	6	0
104	12	0	9	5
105	12	3	14	1
106	12	2	16	1
107	13	1	1	2
108	13	0	2	2
109	13	1	4	5
110	13	0	7	2
111	13	2	11	1
112	13	2	12	1
113	13	1	15	0
114	13	3	16	1
115	14	0	3	5
116	14	2	5	3
117	14	2	8	3
118	14	1	9	1
119	14	2	10	1
120	14	1	13	1
121	14	3	15	2
122	15	0	1	1
123	15	1	2	3
124	15	1	6	0
125	15	0	7	3
126	15	3	11	2
127	15	1	12	4
128	15	2	16	1
129	16	1	3	3
130	16	0	4	2
131	16	0	5	4
132	16	1	6	4
133	16	1	8	3
134	16	3	9	0
135	16	2	10	1
136	16	4	14	0
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name, points) FROM stdin;
1	Piast Piastów	37
2	Perła Złotokłos	34
3	LKS Chlebnia	34
4	Naprzód Brwinów	28
5	KS Teresin	26
6	Józefovia Józefów	20
7	Okęcie Warszawa	19
8	Żyrardowianka Żyrardów	18
9	Przyszłość Włochy	18
10	Ryś Laski	17
11	SEMP Ursynów	17
12	Promyk Nowa Sucha	15
13	Świt Warszawa	13
14	FC Lesznowola	12
15	Pogoń II Grodzisk Mazowiecki	12
16	Milan Milanówek	12
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: contacts_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_address_id_seq', 1, false);


--
-- Name: contacts_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_email_id_seq', 1, false);


--
-- Name: contacts_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_group_id_seq', 1, false);


--
-- Name: contacts_group_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_group_person_id_seq', 1, false);


--
-- Name: contacts_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_person_id_seq', 1, true);


--
-- Name: contacts_phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_phone_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: exercises_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_album_id_seq', 1, false);


--
-- Name: exercises_article_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_article_category_id_seq', 1, false);


--
-- Name: exercises_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_article_id_seq', 1, false);


--
-- Name: exercises_band_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_band_id_seq', 14, true);


--
-- Name: exercises_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_category_id_seq', 1, false);


--
-- Name: exercises_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_person_id_seq', 1, false);


--
-- Name: exercises_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_song_id_seq', 1, false);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 136, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 16, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: contacts_address contacts_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_address
    ADD CONSTRAINT contacts_address_pkey PRIMARY KEY (id);


--
-- Name: contacts_email contacts_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_email
    ADD CONSTRAINT contacts_email_pkey PRIMARY KEY (id);


--
-- Name: contacts_group contacts_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group
    ADD CONSTRAINT contacts_group_name_key UNIQUE (name);


--
-- Name: contacts_group_person contacts_group_person_group_id_person_id_b6e27906_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group_person
    ADD CONSTRAINT contacts_group_person_group_id_person_id_b6e27906_uniq UNIQUE (group_id, person_id);


--
-- Name: contacts_group_person contacts_group_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group_person
    ADD CONSTRAINT contacts_group_person_pkey PRIMARY KEY (id);


--
-- Name: contacts_group contacts_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group
    ADD CONSTRAINT contacts_group_pkey PRIMARY KEY (id);


--
-- Name: contacts_person contacts_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_person
    ADD CONSTRAINT contacts_person_pkey PRIMARY KEY (id);


--
-- Name: contacts_phone contacts_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_phone
    ADD CONSTRAINT contacts_phone_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: exercises_album exercises_album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_album
    ADD CONSTRAINT exercises_album_pkey PRIMARY KEY (id);


--
-- Name: exercises_article_category exercises_article_category_article_id_category_id_8a379934_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_article_category
    ADD CONSTRAINT exercises_article_category_article_id_category_id_8a379934_uniq UNIQUE (article_id, category_id);


--
-- Name: exercises_article_category exercises_article_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_article_category
    ADD CONSTRAINT exercises_article_category_pkey PRIMARY KEY (id);


--
-- Name: exercises_article exercises_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_article
    ADD CONSTRAINT exercises_article_pkey PRIMARY KEY (id);


--
-- Name: exercises_band exercises_band_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_band
    ADD CONSTRAINT exercises_band_pkey PRIMARY KEY (id);


--
-- Name: exercises_category exercises_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_category
    ADD CONSTRAINT exercises_category_pkey PRIMARY KEY (id);


--
-- Name: exercises_person exercises_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_person
    ADD CONSTRAINT exercises_person_pkey PRIMARY KEY (id);


--
-- Name: exercises_song exercises_song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_song
    ADD CONSTRAINT exercises_song_pkey PRIMARY KEY (id);


--
-- Name: games idx_16624_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT idx_16624_primary PRIMARY KEY (id);


--
-- Name: teams idx_16630_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT idx_16630_primary PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: contacts_address_person_id_e7293be4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_address_person_id_e7293be4 ON public.contacts_address USING btree (person_id);


--
-- Name: contacts_email_person_id_353a4f5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_email_person_id_353a4f5d ON public.contacts_email USING btree (person_id);


--
-- Name: contacts_group_name_aa4eb369_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_group_name_aa4eb369_like ON public.contacts_group USING btree (name varchar_pattern_ops);


--
-- Name: contacts_group_person_group_id_363ad011; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_group_person_group_id_363ad011 ON public.contacts_group_person USING btree (group_id);


--
-- Name: contacts_group_person_person_id_e20f956f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_group_person_person_id_e20f956f ON public.contacts_group_person USING btree (person_id);


--
-- Name: contacts_phone_person_id_3a84a2e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_phone_person_id_3a84a2e6 ON public.contacts_phone USING btree (person_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: exercises_album_band_id_8c18826d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercises_album_band_id_8c18826d ON public.exercises_album USING btree (band_id);


--
-- Name: exercises_article_category_article_id_1c2ccd9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercises_article_category_article_id_1c2ccd9f ON public.exercises_article_category USING btree (article_id);


--
-- Name: exercises_article_category_category_id_6a2835ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercises_article_category_category_id_6a2835ac ON public.exercises_article_category USING btree (category_id);


--
-- Name: exercises_song_album_id_0ff35ec4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercises_song_album_id_0ff35ec4 ON public.exercises_song USING btree (album_id);


--
-- Name: idx_16624_fk_games_1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16624_fk_games_1_idx ON public.games USING btree (team_home);


--
-- Name: idx_16624_fk_games_2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16624_fk_games_2_idx ON public.games USING btree (team_away);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_address contacts_address_person_id_e7293be4_fk_contacts_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_address
    ADD CONSTRAINT contacts_address_person_id_e7293be4_fk_contacts_person_id FOREIGN KEY (person_id) REFERENCES public.contacts_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_email contacts_email_person_id_353a4f5d_fk_contacts_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_email
    ADD CONSTRAINT contacts_email_person_id_353a4f5d_fk_contacts_person_id FOREIGN KEY (person_id) REFERENCES public.contacts_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_group_person contacts_group_person_group_id_363ad011_fk_contacts_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group_person
    ADD CONSTRAINT contacts_group_person_group_id_363ad011_fk_contacts_group_id FOREIGN KEY (group_id) REFERENCES public.contacts_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_group_person contacts_group_person_person_id_e20f956f_fk_contacts_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_group_person
    ADD CONSTRAINT contacts_group_person_person_id_e20f956f_fk_contacts_person_id FOREIGN KEY (person_id) REFERENCES public.contacts_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_phone contacts_phone_person_id_3a84a2e6_fk_contacts_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_phone
    ADD CONSTRAINT contacts_phone_person_id_3a84a2e6_fk_contacts_person_id FOREIGN KEY (person_id) REFERENCES public.contacts_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercises_album exercises_album_band_id_8c18826d_fk_exercises_band_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_album
    ADD CONSTRAINT exercises_album_band_id_8c18826d_fk_exercises_band_id FOREIGN KEY (band_id) REFERENCES public.exercises_band(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercises_article_category exercises_article_ca_article_id_1c2ccd9f_fk_exercises; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_article_category
    ADD CONSTRAINT exercises_article_ca_article_id_1c2ccd9f_fk_exercises FOREIGN KEY (article_id) REFERENCES public.exercises_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercises_article_category exercises_article_ca_category_id_6a2835ac_fk_exercises; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_article_category
    ADD CONSTRAINT exercises_article_ca_category_id_6a2835ac_fk_exercises FOREIGN KEY (category_id) REFERENCES public.exercises_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercises_song exercises_song_album_id_0ff35ec4_fk_exercises_album_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises_song
    ADD CONSTRAINT exercises_song_album_id_0ff35ec4_fk_exercises_album_id FOREIGN KEY (album_id) REFERENCES public.exercises_album(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: games fk_games_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_1 FOREIGN KEY (team_home) REFERENCES public.teams(id);


--
-- Name: games fk_games_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_2 FOREIGN KEY (team_away) REFERENCES public.teams(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: mateusz
--

GRANT ALL ON SCHEMA public TO postgres;


--
-- PostgreSQL database dump complete
--


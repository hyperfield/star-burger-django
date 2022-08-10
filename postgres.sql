--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Ubuntu 13.7-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.7 (Ubuntu 13.7-1.pgdg20.04+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO starburger;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO starburger;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO starburger;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO starburger;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO starburger;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO starburger;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO starburger;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO starburger;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO starburger;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO starburger;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO starburger;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO starburger;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: starburger
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


ALTER TABLE public.django_admin_log OWNER TO starburger;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO starburger;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO starburger;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO starburger;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO starburger;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO starburger;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO starburger;

--
-- Name: foodcartapp_restaurant; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.foodcartapp_restaurant (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    contact_phone character varying(50) NOT NULL
);


ALTER TABLE public.foodcartapp_restaurant OWNER TO starburger;

--
-- Name: foodcartapp_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.foodcartapp_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodcartapp_hotel_id_seq OWNER TO starburger;

--
-- Name: foodcartapp_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.foodcartapp_hotel_id_seq OWNED BY public.foodcartapp_restaurant.id;


--
-- Name: foodcartapp_order; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.foodcartapp_order (
    id integer NOT NULL,
    firstname character varying(20) NOT NULL,
    lastname character varying(20) NOT NULL,
    phonenumber character varying(128) NOT NULL,
    address character varying(200) NOT NULL,
    status character varying(10) NOT NULL,
    comment text NOT NULL,
    called_at timestamp with time zone,
    delivered_at timestamp with time zone,
    registered_at timestamp with time zone NOT NULL,
    payment_method character varying(20) NOT NULL,
    restaurant_id integer
);


ALTER TABLE public.foodcartapp_order OWNER TO starburger;

--
-- Name: foodcartapp_order_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.foodcartapp_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodcartapp_order_id_seq OWNER TO starburger;

--
-- Name: foodcartapp_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.foodcartapp_order_id_seq OWNED BY public.foodcartapp_order.id;


--
-- Name: foodcartapp_orderitem; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.foodcartapp_orderitem (
    id integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer NOT NULL,
    order_id integer NOT NULL,
    price numeric(7,2) NOT NULL
);


ALTER TABLE public.foodcartapp_orderitem OWNER TO starburger;

--
-- Name: foodcartapp_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.foodcartapp_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodcartapp_orderitem_id_seq OWNER TO starburger;

--
-- Name: foodcartapp_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.foodcartapp_orderitem_id_seq OWNED BY public.foodcartapp_orderitem.id;


--
-- Name: foodcartapp_product; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.foodcartapp_product (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price numeric(8,2) NOT NULL,
    image character varying(100) NOT NULL,
    special_status boolean NOT NULL,
    description text NOT NULL,
    category_id integer
);


ALTER TABLE public.foodcartapp_product OWNER TO starburger;

--
-- Name: foodcartapp_product_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.foodcartapp_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodcartapp_product_id_seq OWNER TO starburger;

--
-- Name: foodcartapp_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.foodcartapp_product_id_seq OWNED BY public.foodcartapp_product.id;


--
-- Name: foodcartapp_productcategory; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.foodcartapp_productcategory (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.foodcartapp_productcategory OWNER TO starburger;

--
-- Name: foodcartapp_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.foodcartapp_productcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodcartapp_productcategory_id_seq OWNER TO starburger;

--
-- Name: foodcartapp_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.foodcartapp_productcategory_id_seq OWNED BY public.foodcartapp_productcategory.id;


--
-- Name: foodcartapp_restaurantmenuitem; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.foodcartapp_restaurantmenuitem (
    id integer NOT NULL,
    availability boolean NOT NULL,
    product_id integer NOT NULL,
    restaurant_id integer NOT NULL
);


ALTER TABLE public.foodcartapp_restaurantmenuitem OWNER TO starburger;

--
-- Name: foodcartapp_restaurantmenuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.foodcartapp_restaurantmenuitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodcartapp_restaurantmenuitem_id_seq OWNER TO starburger;

--
-- Name: foodcartapp_restaurantmenuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.foodcartapp_restaurantmenuitem_id_seq OWNED BY public.foodcartapp_restaurantmenuitem.id;


--
-- Name: geolocations_location; Type: TABLE; Schema: public; Owner: starburger
--

CREATE TABLE public.geolocations_location (
    id bigint NOT NULL,
    address character varying(100) NOT NULL,
    latitude double precision,
    longitude double precision,
    created_on date NOT NULL
);


ALTER TABLE public.geolocations_location OWNER TO starburger;

--
-- Name: geolocations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: starburger
--

CREATE SEQUENCE public.geolocations_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geolocations_location_id_seq OWNER TO starburger;

--
-- Name: geolocations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: starburger
--

ALTER SEQUENCE public.geolocations_location_id_seq OWNED BY public.geolocations_location.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: foodcartapp_order id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_order ALTER COLUMN id SET DEFAULT nextval('public.foodcartapp_order_id_seq'::regclass);


--
-- Name: foodcartapp_orderitem id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_orderitem ALTER COLUMN id SET DEFAULT nextval('public.foodcartapp_orderitem_id_seq'::regclass);


--
-- Name: foodcartapp_product id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_product ALTER COLUMN id SET DEFAULT nextval('public.foodcartapp_product_id_seq'::regclass);


--
-- Name: foodcartapp_productcategory id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_productcategory ALTER COLUMN id SET DEFAULT nextval('public.foodcartapp_productcategory_id_seq'::regclass);


--
-- Name: foodcartapp_restaurant id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_restaurant ALTER COLUMN id SET DEFAULT nextval('public.foodcartapp_hotel_id_seq'::regclass);


--
-- Name: foodcartapp_restaurantmenuitem id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_restaurantmenuitem ALTER COLUMN id SET DEFAULT nextval('public.foodcartapp_restaurantmenuitem_id_seq'::regclass);


--
-- Name: geolocations_location id; Type: DEFAULT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.geolocations_location ALTER COLUMN id SET DEFAULT nextval('public.geolocations_location_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add Товар	1	add_product
2	Can change Товар	1	change_product
3	Can delete Товар	1	delete_product
4	Can view Товар	1	view_product
5	Can add Ресторан	2	add_restaurant
6	Can change Ресторан	2	change_restaurant
7	Can delete Ресторан	2	delete_restaurant
8	Can view Ресторан	2	view_restaurant
9	Can add Пункт меню ресторана	3	add_restaurantmenuitem
10	Can change Пункт меню ресторана	3	change_restaurantmenuitem
11	Can delete Пункт меню ресторана	3	delete_restaurantmenuitem
12	Can view Пункт меню ресторана	3	view_restaurantmenuitem
13	Can add Категория	4	add_productcategory
14	Can change Категория	4	change_productcategory
15	Can delete Категория	4	delete_productcategory
16	Can view Категория	4	view_productcategory
17	Can add Заказ	5	add_order
18	Can change Заказ	5	change_order
19	Can delete Заказ	5	delete_order
20	Can view Заказ	5	view_order
21	Can add Элемент заказа	6	add_orderitem
22	Can change Элемент заказа	6	change_orderitem
23	Can delete Элемент заказа	6	delete_orderitem
24	Can view Элемент заказа	6	view_orderitem
25	Can add геолокация	7	add_location
26	Can change геолокация	7	change_location
27	Can delete геолокация	7	delete_location
28	Can view геолокация	7	view_location
29	Can add log entry	8	add_logentry
30	Can change log entry	8	change_logentry
31	Can delete log entry	8	delete_logentry
32	Can view log entry	8	view_logentry
33	Can add permission	9	add_permission
34	Can change permission	9	change_permission
35	Can delete permission	9	delete_permission
36	Can view permission	9	view_permission
37	Can add group	10	add_group
38	Can change group	10	change_group
39	Can delete group	10	delete_group
40	Can view group	10	view_group
41	Can add user	11	add_user
42	Can change user	11	change_user
43	Can delete user	11	delete_user
44	Can view user	11	view_user
45	Can add content type	12	add_contenttype
46	Can change content type	12	change_contenttype
47	Can delete content type	12	delete_contenttype
48	Can view content type	12	view_contenttype
49	Can add session	13	add_session
50	Can change session	13	change_session
51	Can delete session	13	delete_session
52	Can view session	13	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$ZY34Pdsd1rH4isUiPCdePq$+2sH3is+RNsjsMNQmNPck8PQqSFVgLd1Fwf4kytC7D8=	2022-07-16 01:12:51.592226+00	t	admin				t	t	2021-09-19 10:05:59.353+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-09-19 10:22:52.468+00	1	Star Burger Арбат	1	[{"added": {}}]	2	1
2	2021-09-19 10:23:28.252+00	2	Star Burger Цветной	1	[{"added": {}}]	2	1
3	2021-09-19 10:23:50.841+00	3	Star Burger Европейский	1	[{"added": {}}]	2	1
4	2021-09-19 10:25:02.56+00	1	Бургер	1	[{"added": {}}]	4	1
5	2021-09-19 10:28:34.739+00	1	Стейкхаус	1	[{"added": {}}]	1	1
6	2021-09-19 10:29:29.761+00	2	Лонг Чизбургер	1	[{"added": {}}]	1	1
7	2021-09-19 10:30:22.968+00	3	Тройной Воппер	1	[{"added": {}}]	1	1
8	2021-09-19 10:31:15.494+00	4	Беконайзер	1	[{"added": {}}]	1	1
9	2021-09-19 10:31:53.158+00	2	Ролл	1	[{"added": {}}]	4	1
10	2021-09-19 10:32:20.67+00	5	Фиш Ролл	1	[{"added": {}}]	1	1
11	2021-09-19 10:33:36.49+00	6	Шримп Ролл	1	[{"added": {}}]	1	1
12	2021-09-19 10:35:36.083+00	3	Star Burger Европейский	2	[{"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0415\\u0432\\u0440\\u043e\\u043f\\u0435\\u0439\\u0441\\u043a\\u0438\\u0439 - \\u0421\\u0442\\u0435\\u0439\\u043a\\u0445\\u0430\\u0443\\u0441"}}]	2	1
13	2021-09-19 10:36:01.453+00	3	Star Burger Европейский	2	[{"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0415\\u0432\\u0440\\u043e\\u043f\\u0435\\u0439\\u0441\\u043a\\u0438\\u0439 - \\u041b\\u043e\\u043d\\u0433 \\u0427\\u0438\\u0437\\u0431\\u0443\\u0440\\u0433\\u0435\\u0440"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0415\\u0432\\u0440\\u043e\\u043f\\u0435\\u0439\\u0441\\u043a\\u0438\\u0439 - \\u0422\\u0440\\u043e\\u0439\\u043d\\u043e\\u0439 \\u0412\\u043e\\u043f\\u043f\\u0435\\u0440"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0415\\u0432\\u0440\\u043e\\u043f\\u0435\\u0439\\u0441\\u043a\\u0438\\u0439 - \\u0411\\u0435\\u043a\\u043e\\u043d\\u0430\\u0439\\u0437\\u0435\\u0440"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0415\\u0432\\u0440\\u043e\\u043f\\u0435\\u0439\\u0441\\u043a\\u0438\\u0439 - \\u0424\\u0438\\u0448 \\u0420\\u043e\\u043b\\u043b"}}]	2	1
14	2021-09-19 10:36:22.353+00	2	Star Burger Цветной	2	[{"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0426\\u0432\\u0435\\u0442\\u043d\\u043e\\u0439 - \\u0421\\u0442\\u0435\\u0439\\u043a\\u0445\\u0430\\u0443\\u0441"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0426\\u0432\\u0435\\u0442\\u043d\\u043e\\u0439 - \\u0411\\u0435\\u043a\\u043e\\u043d\\u0430\\u0439\\u0437\\u0435\\u0440"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0426\\u0432\\u0435\\u0442\\u043d\\u043e\\u0439 - \\u0422\\u0440\\u043e\\u0439\\u043d\\u043e\\u0439 \\u0412\\u043e\\u043f\\u043f\\u0435\\u0440"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0426\\u0432\\u0435\\u0442\\u043d\\u043e\\u0439 - \\u0424\\u0438\\u0448 \\u0420\\u043e\\u043b\\u043b"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0426\\u0432\\u0435\\u0442\\u043d\\u043e\\u0439 - \\u0428\\u0440\\u0438\\u043c\\u043f \\u0420\\u043e\\u043b\\u043b"}}]	2	1
15	2021-09-19 10:36:41.449+00	1	Star Burger Арбат	2	[{"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0410\\u0440\\u0431\\u0430\\u0442 - \\u0421\\u0442\\u0435\\u0439\\u043a\\u0445\\u0430\\u0443\\u0441"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0410\\u0440\\u0431\\u0430\\u0442 - \\u041b\\u043e\\u043d\\u0433 \\u0427\\u0438\\u0437\\u0431\\u0443\\u0440\\u0433\\u0435\\u0440"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0410\\u0440\\u0431\\u0430\\u0442 - \\u0428\\u0440\\u0438\\u043c\\u043f \\u0420\\u043e\\u043b\\u043b"}}, {"added": {"name": "\\u043f\\u0443\\u043d\\u043a\\u0442 \\u043c\\u0435\\u043d\\u044e \\u0440\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u0430", "object": "Star Burger \\u0410\\u0440\\u0431\\u0430\\u0442 - \\u0422\\u0440\\u043e\\u0439\\u043d\\u043e\\u0439 \\u0412\\u043e\\u043f\\u043f\\u0435\\u0440"}}]	2	1
16	2021-09-28 17:26:02.206+00	2	Лонг Чизбургер, qty: 3	1	[{"added": {}}]	12	1
17	2021-09-28 18:02:15.34+00	11	Стейкхаус, qty: 1	3		12	1
18	2021-09-28 18:02:15.39+00	10	Тройной Воппер, qty: 7	3		12	1
19	2021-09-28 18:02:15.396+00	9	Лонг Чизбургер, qty: 7	3		12	1
20	2021-09-28 18:02:15.407+00	8	Лонг Чизбургер, qty: 3	3		12	1
21	2021-09-28 18:02:15.416+00	7	Стейкхаус, qty: 2	3		12	1
22	2021-09-28 18:02:15.423+00	6	Тройной Воппер, qty: 7	3		12	1
23	2021-09-28 18:02:15.429+00	5	Лонг Чизбургер, qty: 6	3		12	1
24	2021-09-28 18:02:15.436+00	4	Тройной Воппер, qty: 6	3		12	1
25	2021-09-28 18:02:15.442+00	3	Лонг Чизбургер, qty: 5	3		12	1
26	2021-09-28 18:02:15.449+00	2	Лонг Чизбургер, qty: 3	3		12	1
27	2021-09-28 18:02:15.454+00	1	Стейкхаус, qty: 2	3		12	1
28	2021-09-28 18:02:35.301+00	3	Items: foodcartapp.OrderItem.None, First name: , Last name: , telephone: , address: 	3		11	1
29	2021-09-28 18:02:35.308+00	2	Items: foodcartapp.OrderItem.None, First name: , Last name: , telephone: , address: 	3		11	1
30	2021-09-28 18:02:35.314+00	1	Items: foodcartapp.OrderItem.None, First name: , Last name: , telephone: , address: 	3		11	1
31	2021-09-28 18:04:03.562+00	4	Items: foodcartapp.OrderItem.None, First name: , Last name: , telephone: , address: 	3		11	1
32	2021-09-28 18:04:09.821+00	14	Стейкхаус, qty: 1	3		12	1
33	2021-09-28 18:04:09.827+00	13	Тройной Воппер, qty: 8	3		12	1
34	2021-09-28 18:04:09.833+00	12	Лонг Чизбургер, qty: 8	3		12	1
35	2021-09-28 18:14:23.57+00	6	 	3		11	1
36	2021-09-28 18:14:23.581+00	5	 	3		11	1
37	2021-09-28 18:14:33.539+00	20	Фиш Ролл, qty: 1	3		12	1
38	2021-09-28 18:14:33.547+00	19	Шримп Ролл, qty: 1	3		12	1
39	2021-09-28 18:14:33.559+00	18	Стейкхаус, qty: 1	3		12	1
40	2021-09-28 18:14:33.567+00	17	Фиш Ролл, qty: 1	3		12	1
41	2021-09-28 18:14:33.574+00	16	Шримп Ролл, qty: 1	3		12	1
42	2021-09-28 18:14:33.581+00	15	Стейкхаус, qty: 1	3		12	1
43	2021-09-28 18:15:43.365+00	23	Тройной Воппер, qty: 1	3		12	1
44	2021-09-28 18:15:43.372+00	22	Стейкхаус, qty: 1	3		12	1
45	2021-09-28 18:15:43.378+00	21	Лонг Чизбургер, qty: 1	3		12	1
46	2021-09-28 18:15:49.776+00	7	 	3		11	1
47	2021-09-28 18:21:03.145+00	8	 	3		11	1
48	2021-09-28 18:21:09.025+00	29	Фиш Ролл, qty: 1	3		12	1
49	2021-09-28 18:21:09.032+00	28	Шримп Ролл, qty: 1	3		12	1
50	2021-09-28 18:21:09.041+00	27	Стейкхаус, qty: 1	3		12	1
51	2021-09-28 18:21:09.047+00	26	Фиш Ролл, qty: 1	3		12	1
52	2021-09-28 18:21:09.056+00	25	Шримп Ролл, qty: 1	3		12	1
53	2021-09-28 18:21:09.063+00	24	Стейкхаус, qty: 1	3		12	1
54	2021-09-28 18:23:50.999+00	9	 	3		11	1
55	2021-09-28 18:23:57.227+00	33	Беконайзер, qty: 1	3		12	1
56	2021-09-28 18:23:57.234+00	32	Фиш Ролл, qty: 1	3		12	1
57	2021-09-28 18:23:57.24+00	31	Шримп Ролл, qty: 1	3		12	1
58	2021-09-28 18:23:57.249+00	30	Стейкхаус, qty: 1	3		12	1
59	2021-10-30 21:34:35.961+00	11	Yepper Ghorges, ул. Пушкина, дом Колотушкина	3		11	1
60	2021-10-30 21:34:35.98+00	10	Павел Test, ул. Пушкина, дом Колотушкина	3		11	1
61	2021-10-30 21:39:12.928+00	35	Лонг Чизбургер, qty: 1	3		12	1
62	2021-10-30 21:39:25.803+00	39	Стейкхаус, qty: 2	3		12	1
63	2021-10-30 21:39:25.838+00	38	Тройной Воппер, qty: 1	3		12	1
64	2021-10-30 21:39:25.869+00	37	Лонг Чизбургер, qty: 1	3		12	1
65	2021-10-30 21:39:25.901+00	36	Тройной Воппер, qty: 1	3		12	1
66	2021-10-30 21:39:25.929+00	34	Стейкхаус, qty: 1	3		12	1
67	2021-10-30 21:58:46.096+00	46	Лонг Чизбургер, qty: 2	1	[{"added": {}}]	12	1
68	2021-10-30 22:58:15.896+00	13	Фёдор Офигевших, ул. Раввина Шмаля, г. Асбест	3		11	1
69	2021-10-30 22:58:15.903+00	12	Frobisher Bay, Frobisher Pushkin 3, Iqaluit	3		11	1
70	2021-10-30 22:58:24.862+00	46	Лонг Чизбургер, qty: 2	3		12	1
71	2021-10-30 22:58:24.868+00	45	Стейкхаус, qty: 4	3		12	1
72	2021-10-30 22:58:24.876+00	44	Лонг Чизбургер, qty: 2	3		12	1
73	2021-10-30 22:58:24.882+00	43	Беконайзер, qty: 1	3		12	1
74	2021-10-30 22:58:24.888+00	42	Тройной Воппер, qty: 1	3		12	1
75	2021-10-30 22:58:24.894+00	41	Стейкхаус, qty: 1	3		12	1
76	2021-10-30 22:58:24.899+00	40	Лонг Чизбургер, qty: 1	3		12	1
77	2021-11-03 16:14:36.771+00	14	Yepper Ghorges, ул. Пушкина, дом Колотушкина	3		11	1
78	2021-11-03 16:14:46.126+00	3	Стейкхаус, qty: 1	3		12	1
79	2021-11-03 16:14:46.132+00	2	Тройной Воппер, qty: 1	3		12	1
80	2021-11-03 16:14:46.14+00	1	Лонг Чизбургер, qty: 1	3		12	1
81	2021-11-03 16:35:50.568+00	3	Yepper Test, ул. Пушкина, дом Колотушкина	1	[{"added": {}}, {"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0421\\u0442\\u0435\\u0439\\u043a\\u0445\\u0430\\u0443\\u0441, qty: 1"}}, {"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0428\\u0440\\u0438\\u043c\\u043f \\u0420\\u043e\\u043b\\u043b, qty: 2"}}, {"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0422\\u0440\\u043e\\u0439\\u043d\\u043e\\u0439 \\u0412\\u043e\\u043f\\u043f\\u0435\\u0440, qty: 1"}}]	11	1
82	2021-11-03 16:36:16.842+00	2	 , 	3		11	1
83	2021-11-03 16:36:16.85+00	1	 , 	3		11	1
84	2021-11-03 16:36:26.503+00	11	Тройной Воппер, qty: 1	3		12	1
85	2021-11-03 16:36:26.509+00	10	Шримп Ролл, qty: 2	3		12	1
86	2021-11-03 16:36:26.516+00	9	Стейкхаус, qty: 1	3		12	1
87	2021-11-03 16:36:26.523+00	8	Тройной Воппер, qty: 1	3		12	1
88	2021-11-03 16:36:26.529+00	7	Лонг Чизбургер, qty: 1	3		12	1
89	2021-11-03 16:36:26.536+00	6	Стейкхаус, qty: 2	3		12	1
90	2021-11-03 16:36:26.543+00	5	Тройной Воппер, qty: 1	3		12	1
91	2021-11-03 16:36:26.549+00	4	Лонг Чизбургер, qty: 1	3		12	1
92	2021-11-03 16:36:26.556+00	3	Тройной Воппер, qty: 1	3		12	1
93	2021-11-03 16:36:26.562+00	2	Лонг Чизбургер, qty: 1	3		12	1
94	2021-11-03 16:36:26.567+00	1	Стейкхаус, qty: 1	3		12	1
95	2021-11-03 16:36:44.333+00	3	Yepper Test, ул. Пушкина, дом Колотушкина	2	[{"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0422\\u0440\\u043e\\u0439\\u043d\\u043e\\u0439 \\u0412\\u043e\\u043f\\u043f\\u0435\\u0440, qty: 1"}}, {"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u041b\\u043e\\u043d\\u0433 \\u0427\\u0438\\u0437\\u0431\\u0443\\u0440\\u0433\\u0435\\u0440, qty: 2"}}, {"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u041b\\u043e\\u043d\\u0433 \\u0427\\u0438\\u0437\\u0431\\u0443\\u0440\\u0433\\u0435\\u0440, qty: 1"}}]	11	1
96	2021-11-03 16:41:03.526+00	3	Yepper Test, ул. Пушкина, дом Колотушкина	3		11	1
97	2021-11-03 16:43:43.017+00	4	 , 	3		11	1
98	2021-11-03 17:08:24.179+00	20	Шримп Ролл, qty: 1	2	[{"changed": {"fields": ["Order"]}}]	12	1
99	2021-11-03 17:08:41.258+00	19	Тройной Воппер, qty: 1	2	[{"changed": {"fields": ["Order"]}}]	12	1
100	2021-11-03 17:08:45.678+00	18	Шримп Ролл, qty: 1	2	[{"changed": {"fields": ["Order"]}}]	12	1
101	2021-11-03 17:08:55.101+00	17	Тройной Воппер, qty: 1	2	[{"changed": {"fields": ["Order"]}}]	12	1
102	2021-11-03 17:09:03.975+00	15	Лонг Чизбургер, qty: 1	2	[{"changed": {"fields": ["Order"]}}]	12	1
103	2021-11-03 17:09:11.838+00	16	Беконайзер, qty: 1	2	[{"changed": {"fields": ["Order"]}}]	12	1
104	2021-11-03 17:15:09.861+00	20	Шримп Ролл, qty: 1	3		12	1
105	2021-11-03 17:16:11.551+00	19	Тройной Воппер, qty: 1	3		12	1
106	2021-11-03 17:16:17.173+00	18	Шримп Ролл, qty: 1	3		12	1
107	2021-11-03 17:16:17.179+00	17	Тройной Воппер, qty: 1	3		12	1
108	2021-11-03 17:16:17.186+00	16	Беконайзер, qty: 1	3		12	1
109	2021-11-03 17:16:17.192+00	15	Лонг Чизбургер, qty: 1	3		12	1
110	2021-11-03 17:19:28.282+00	5	Yepper Test, ул. Пушкина, дом Колотушкина	2	[{"changed": {"fields": ["\\u0410\\u0434\\u0440\\u0435\\u0441"]}}, {"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0421\\u0442\\u0435\\u0439\\u043a\\u0445\\u0430\\u0443\\u0441, qty: 1"}}]	11	1
111	2021-11-03 17:24:49.812+00	5	Yepper Test, ул. Пушкина, дом Колотушкина	3		11	1
112	2021-11-03 17:26:33.413+00	6	 , 	3		11	1
113	2021-11-03 17:26:52.24+00	7	Yepper Test, ул. Пушкина, дом Колотушкина	2	[{"deleted": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0421\\u0442\\u0435\\u0439\\u043a\\u0445\\u0430\\u0443\\u0441, qty: 1"}}]	11	1
114	2021-11-03 18:23:02.429+00	7	Yepper Test, ул. Пушкина, дом Колотушкина	3		11	1
115	2021-11-03 22:41:08.032+00	10	 , 	3		11	1
116	2021-11-03 22:46:27.836+00	12	Иван Петров, Москва	3		11	1
117	2021-11-03 22:48:03.961+00	9	Франко Геконно, ул. Плохого Дяди, 16, г. Мирный	3		11	1
118	2021-11-22 00:20:35.922+00	47	Иван Петров, Москва	3		11	1
119	2021-11-22 00:20:35.931+00	46	Иван Петров, Москва	3		11	1
120	2021-11-22 00:20:35.939+00	45	D Петров, Москва	3		11	1
121	2021-11-22 00:20:35.947+00	44	D Петров, Москва	3		11	1
122	2021-11-22 00:20:35.957+00	43	C Петров, Москва	3		11	1
123	2021-11-22 00:20:35.965+00	42	A Петров, Москва	3		11	1
124	2021-11-22 00:20:35.973+00	41	B Петров, Москва	3		11	1
125	2021-11-22 00:20:35.987+00	40	B Петров, Москва	3		11	1
126	2021-11-22 00:20:35.996+00	39	B Петров, Москва	3		11	1
127	2021-11-22 00:20:36.007+00	38	B Петров, Москва	3		11	1
128	2021-11-22 00:20:36.022+00	37	A Петров, Москва	3		11	1
129	2021-11-22 00:20:36.03+00	36	A Петров, Москва	3		11	1
130	2021-11-22 00:20:36.038+00	35	A Петров, Москва	3		11	1
131	2021-11-22 00:20:36.047+00	34	A Петров, Москва	3		11	1
132	2021-11-22 00:20:36.055+00	33	A Петров, Москва	3		11	1
133	2021-11-22 00:20:36.064+00	32	A Петров, Москва	3		11	1
134	2021-11-22 00:20:36.075+00	31	A Петров, Москва	3		11	1
135	2021-11-22 00:20:36.089+00	30	A Петров, Москва	3		11	1
136	2021-11-22 00:20:36.104+00	29	A Петров, Москва	3		11	1
137	2021-11-22 00:20:36.123+00	28	A Петров, Москва	3		11	1
138	2021-11-22 00:20:36.138+00	27	A Петров, Москва	3		11	1
139	2021-11-22 00:20:36.156+00	26	A Петров, Москва	3		11	1
140	2021-11-22 00:20:36.172+00	25	A Петров, Москва	3		11	1
141	2021-11-22 00:20:36.185+00	24	A Петров, Москва	3		11	1
142	2021-11-22 00:20:36.2+00	23	Иван Петров, Москва	3		11	1
143	2021-11-22 00:20:36.215+00	22	Иван Петров, Москва	3		11	1
144	2021-11-22 00:20:36.231+00	21	Иван Петров, Москва	3		11	1
145	2021-11-22 00:20:36.246+00	20	Yeken Петров, Москва	3		11	1
146	2021-11-22 00:20:36.262+00	19	Тимур Иванов, Москва, Новый Арбат 10	3		11	1
147	2021-11-22 00:20:36.278+00	18	Тимур Иванов, Москва, Новый Арбат 10	3		11	1
148	2021-11-22 00:20:36.296+00	17	Иван Петров, Москва	3		11	1
149	2021-11-22 00:20:36.317+00	16	Иван Петров, Москва	3		11	1
150	2021-11-22 00:20:36.334+00	15	Иван Петров, Москва	3		11	1
151	2021-11-22 00:20:36.349+00	14	Yepper Ghorges, ул. Пушкина, дом Колотушкина	3		11	1
152	2021-11-22 00:20:36.367+00	13	Тимур Иванов, Москва, Новый Арбат 10	3		11	1
153	2021-11-22 00:20:36.383+00	11	Франко Геконно, ул. Плохого Дяди, 16, г. Мирный	3		11	1
154	2021-11-22 00:20:36.404+00	8	Yepper Test, ул. Пушкина, дом Колотушкина	3		11	1
155	2021-11-27 23:43:21.13+00	60	Франко Test, ул. Плохого Дяи, 16, г. Мирный	3		11	1
156	2021-11-28 00:07:46.327+00	1	Стейкхаус	2	[{"changed": {"fields": ["\\u0426\\u0435\\u043d\\u0430"]}}]	1	1
157	2021-12-09 08:40:59.833+00	2	Лонг Чизбургер	2	[{"changed": {"fields": ["\\u0426\\u0435\\u043d\\u0430"]}}]	1	1
158	2021-12-09 08:42:27.879+00	71	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	3		11	1
159	2021-12-09 08:42:27.886+00	70	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	3		11	1
160	2021-12-09 08:42:27.892+00	69	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	3		11	1
161	2021-12-09 08:42:27.898+00	68	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	3		11	1
162	2021-12-09 08:42:27.904+00	67	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	3		11	1
163	2021-12-12 12:54:43.367+00	77	Йоптель Саргассовых, Штурмвильсон	3		11	1
164	2021-12-12 12:54:43.374+00	76	Василий Васильевич, Лондон	3		11	1
165	2021-12-12 12:54:43.381+00	75	Василий Васильевич, Лондон	3		11	1
166	2021-12-12 12:54:43.387+00	74	Василий Васильевич, Лондон	3		11	1
167	2021-12-12 12:54:43.393+00	73	Василий Васильевич, Лондон	3		11	1
168	2021-12-12 16:27:15.862+00	48	Yepper Test, ул. Пушкина, дом Колотушкина	2	[]	11	1
169	2021-12-12 16:48:09.838+00	48	Yepper Test, ул. Пушкина, дом Колотушкина	2	[]	11	1
170	2021-12-14 14:30:12.708+00	53	Василий Васильевич, Лондон	2	[]	11	1
171	2021-12-14 14:30:59.906+00	52	Василий Васильевич, Лондон	2	[]	11	1
172	2021-12-14 14:31:06.206+00	62	Берёза Каприловая, ул. Староваряжского восстания 87	2	[]	11	1
173	2021-12-14 14:31:19.406+00	72	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	2	[{"changed": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0422\\u0440\\u043e\\u0439\\u043d\\u043e\\u0439 \\u0412\\u043e\\u043f\\u043f\\u0435\\u0440, qty: 2", "fields": ["Quantity"]}}]	11	1
174	2021-12-14 14:31:31.147+00	66	Василий Васильевич, Лондон	2	[{"added": {"name": "\\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430", "object": "\\u0421\\u0442\\u0435\\u0439\\u043a\\u0445\\u0430\\u0443\\u0441, qty: 1"}}]	11	1
175	2021-12-14 15:05:02.004+00	53	Василий Васильевич, Лондон	2	[]	11	1
176	2021-12-14 15:11:18.529+00	72	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	2	[{"changed": {"fields": ["Status"]}}]	11	1
177	2021-12-14 15:16:02.827+00	51	Василий Васильевич, Лондон	2	[{"changed": {"fields": ["Status"]}}]	11	1
178	2021-12-14 15:22:52.209+00	51	Василий Васильевич, Лондон	2	[{"changed": {"fields": ["Status"]}}]	11	1
179	2021-12-14 15:23:01.119+00	62	Берёза Каприловая, ул. Староваряжского восстания 87	2	[{"changed": {"fields": ["Status"]}}]	11	1
180	2021-12-16 21:12:26.902+00	48	Yepper Test, ул. Пушкина, дом Колотушкина	2	[{"changed": {"fields": ["\\u041a\\u043e\\u043c\\u043c\\u0435\\u043d\\u0442\\u0430\\u0440\\u0438\\u0439"]}}]	11	1
181	2021-12-16 22:19:49.435+00	72	Эльзар Еврейчиков, ул. Плохого Дяди, 16, г. Мирный	2	[{"changed": {"fields": ["\\u0421\\u043f\\u043e\\u0441\\u043e\\u0431 \\u043e\\u043f\\u043b\\u0430\\u0442\\u044b"]}}]	11	1
182	2021-12-16 22:33:12.113+00	48	Yepper Test, ул. Пушкина, дом Колотушкина	2	[{"changed": {"fields": ["\\u0421\\u043f\\u043e\\u0441\\u043e\\u0431 \\u043e\\u043f\\u043b\\u0430\\u0442\\u044b"]}}]	11	1
183	2021-12-20 18:45:53.341+00	48	Yepper Test, ул. Пушкина, дом Колотушкина	2	[{"changed": {"fields": ["Restaurant"]}}]	11	1
184	2022-01-03 23:49:32.722+00	1	ул. Пушкина, дом Колотушкина	1	[{"added": {}}]	13	1
185	2022-01-04 02:20:42.216+00	48	Yepper Test, ул. Пушкина, дом Колотушкина	2	[]	11	1
186	2022-01-04 02:39:27.911+00	106	ул. Староваряжского восстания 87	3		13	1
187	2022-01-04 02:39:27.921+00	105	Москва, ул. Новый Арбат, 15	3		13	1
188	2022-01-04 02:39:27.928+00	104	ул. Староваряжского восстания 87	3		13	1
189	2022-01-04 02:39:27.934+00	103	Москва, пл. Киевского Вокзала, 2	3		13	1
190	2022-01-04 02:39:27.94+00	102	ул. Пушкина, дом Колотушкина	3		13	1
191	2022-01-04 02:39:27.946+00	101	Москва, ул. Новый Арбат, 15	3		13	1
192	2022-01-04 02:39:27.952+00	100	ул. Пушкина, дом Колотушкина	3		13	1
193	2022-01-04 02:39:27.958+00	99	Москва, Цветной бульвар, 11с2	3		13	1
194	2022-01-04 02:39:27.965+00	98	ул. Пушкина, дом Колотушкина	3		13	1
195	2022-01-04 02:39:27.972+00	97	Москва, пл. Киевского Вокзала, 2	3		13	1
196	2022-01-04 02:39:27.98+00	96	ул. Плохого Дяди, 16, г. Мирный	3		13	1
197	2022-01-04 02:39:27.988+00	95	Москва, ул. Новый Арбат, 15	3		13	1
198	2022-01-04 02:39:27.998+00	94	ул. Плохого Дяди, 16, г. Мирный	3		13	1
199	2022-01-04 02:39:28.008+00	93	Москва, пл. Киевского Вокзала, 2	3		13	1
200	2022-01-04 02:39:28.017+00	92	Москва, пл. Киевского Вокзала, 2	3		13	1
201	2022-01-04 02:39:28.028+00	91	ул. Плохого Дяди, 16, г. Мирный	3		13	1
202	2022-01-04 02:39:28.037+00	90	Москва, ул. Новый Арбат, 15	3		13	1
203	2022-01-04 02:39:28.047+00	89	ул. Плохого Дяди, 16, г. Мирный	3		13	1
204	2022-01-04 02:39:28.057+00	88	Москва, пл. Киевского Вокзала, 2	3		13	1
205	2022-01-04 02:39:28.068+00	87	ул. Пушкина, дом Колотушкина	3		13	1
206	2022-01-04 02:39:28.078+00	86	Москва, ул. Новый Арбат, 15	3		13	1
207	2022-01-04 02:39:28.088+00	85	ул. Пушкина, дом Колотушкина	3		13	1
208	2022-01-04 02:39:28.098+00	84	Москва, пл. Киевского Вокзала, 2	3		13	1
209	2022-01-04 02:39:28.109+00	83	Лондон	3		13	1
210	2022-01-04 02:39:28.119+00	82	Москва, ул. Новый Арбат, 15	3		13	1
211	2022-01-04 02:39:28.128+00	81	Лондон	3		13	1
212	2022-01-04 02:39:28.138+00	80	Москва, Цветной бульвар, 11с2	3		13	1
213	2022-01-04 02:39:28.148+00	79	Лондон	3		13	1
214	2022-01-04 02:39:28.158+00	78	Москва, пл. Киевского Вокзала, 2	3		13	1
215	2022-01-04 02:39:28.168+00	77	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
216	2022-01-04 02:39:28.179+00	76	Москва, Цветной бульвар, 11с2	3		13	1
217	2022-01-04 02:39:28.189+00	75	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
218	2022-01-04 02:39:28.199+00	74	Москва, пл. Киевского Вокзала, 2	3		13	1
219	2022-01-04 02:39:28.209+00	73	Frobisher Pushkin 3, Iqaluit	3		13	1
220	2022-01-04 02:39:28.23+00	72	Москва, ул. Новый Арбат, 15	3		13	1
221	2022-01-04 02:39:28.257+00	71	Frobisher Pushkin 3, Iqaluit	3		13	1
222	2022-01-04 02:39:28.279+00	70	Москва, пл. Киевского Вокзала, 2	3		13	1
223	2022-01-04 02:39:28.293+00	69	Лондон	3		13	1
224	2022-01-04 02:39:28.303+00	68	Москва, ул. Новый Арбат, 15	3		13	1
225	2022-01-04 02:39:28.313+00	67	Лондон	3		13	1
226	2022-01-04 02:39:28.322+00	66	Москва, Цветной бульвар, 11с2	3		13	1
227	2022-01-04 02:39:28.332+00	65	Лондон	3		13	1
228	2022-01-04 02:39:28.342+00	64	Москва, пл. Киевского Вокзала, 2	3		13	1
229	2022-01-04 02:39:28.352+00	63	Лондон	3		13	1
230	2022-01-04 02:39:28.361+00	62	Москва, ул. Новый Арбат, 15	3		13	1
231	2022-01-04 02:39:28.372+00	61	Лондон	3		13	1
232	2022-01-04 02:39:28.384+00	60	Москва, Цветной бульвар, 11с2	3		13	1
233	2022-01-04 02:39:28.402+00	59	Лондон	3		13	1
234	2022-01-04 02:39:28.423+00	58	Москва, пл. Киевского Вокзала, 2	3		13	1
235	2022-01-04 02:39:28.446+00	57	Лондон	3		13	1
236	2022-01-04 02:39:28.468+00	56	Москва, ул. Новый Арбат, 15	3		13	1
237	2022-01-04 02:39:28.492+00	55	Лондон	3		13	1
238	2022-01-04 02:39:28.515+00	54	Москва, Цветной бульвар, 11с2	3		13	1
239	2022-01-04 02:39:28.538+00	53	Лондон	3		13	1
240	2022-01-04 02:39:28.564+00	52	Москва, пл. Киевского Вокзала, 2	3		13	1
241	2022-01-04 02:39:28.593+00	51	ул. Пушкина, дом Колотушкина	3		13	1
242	2022-01-04 02:39:28.618+00	50	Москва, ул. Новый Арбат, 15	3		13	1
243	2022-01-04 02:39:28.64+00	49	ул. Пушкина, дом Колотушкина	3		13	1
244	2022-01-04 02:39:28.662+00	48	Москва, пл. Киевского Вокзала, 2	3		13	1
245	2022-01-04 02:39:28.69+00	47	Лондон	3		13	1
246	2022-01-04 02:39:28.716+00	46	Москва, ул. Новый Арбат, 15	3		13	1
247	2022-01-04 02:39:28.745+00	45	Лондон	3		13	1
248	2022-01-04 02:39:28.77+00	44	Москва, Цветной бульвар, 11с2	3		13	1
249	2022-01-04 02:39:28.798+00	43	Лондон	3		13	1
250	2022-01-04 02:39:28.825+00	42	Москва, пл. Киевского Вокзала, 2	3		13	1
251	2022-01-04 02:39:28.849+00	41	Лондон	3		13	1
252	2022-01-04 02:39:28.873+00	40	Москва, ул. Новый Арбат, 15	3		13	1
253	2022-01-04 02:39:28.899+00	39	Лондон	3		13	1
254	2022-01-04 02:39:28.927+00	38	Москва, Цветной бульвар, 11с2	3		13	1
255	2022-01-04 02:39:28.952+00	37	Лондон	3		13	1
256	2022-01-04 02:39:28.981+00	36	Москва, пл. Киевского Вокзала, 2	3		13	1
257	2022-01-04 02:39:29.005+00	35	Лондон	3		13	1
258	2022-01-04 02:39:29.035+00	34	Москва, ул. Новый Арбат, 15	3		13	1
259	2022-01-04 02:39:29.073+00	33	Лондон	3		13	1
260	2022-01-04 02:39:29.099+00	32	Москва, Цветной бульвар, 11с2	3		13	1
261	2022-01-04 02:39:29.125+00	31	Лондон	3		13	1
262	2022-01-04 02:39:29.153+00	30	Москва, пл. Киевского Вокзала, 2	3		13	1
263	2022-01-04 02:39:29.186+00	29	Лондон	3		13	1
264	2022-01-04 02:39:29.218+00	28	Москва, ул. Новый Арбат, 15	3		13	1
265	2022-01-04 02:39:29.245+00	27	Лондон	3		13	1
266	2022-01-04 02:39:29.275+00	26	Москва, Цветной бульвар, 11с2	3		13	1
267	2022-01-04 02:39:29.369+00	25	Лондон	3		13	1
268	2022-01-04 02:39:29.436+00	24	Москва, пл. Киевского Вокзала, 2	3		13	1
269	2022-01-04 02:39:29.485+00	23	Лондон	3		13	1
270	2022-01-04 02:39:29.53+00	22	Москва, ул. Новый Арбат, 15	3		13	1
271	2022-01-04 02:39:29.559+00	21	Лондон	3		13	1
272	2022-01-04 02:39:29.612+00	20	Москва, Цветной бульвар, 11с2	3		13	1
273	2022-01-04 02:39:29.644+00	19	Лондон	3		13	1
274	2022-01-04 02:39:29.675+00	18	Москва, пл. Киевского Вокзала, 2	3		13	1
275	2022-01-04 02:39:29.705+00	17	Лондон	3		13	1
276	2022-01-04 02:39:29.734+00	16	Москва, ул. Новый Арбат, 15	3		13	1
277	2022-01-04 02:39:29.764+00	15	Лондон	3		13	1
278	2022-01-04 02:39:29.796+00	14	Москва, Цветной бульвар, 11с2	3		13	1
279	2022-01-04 02:39:29.827+00	13	Лондон	3		13	1
280	2022-01-04 02:39:29.854+00	12	Москва, пл. Киевского Вокзала, 2	3		13	1
281	2022-01-04 02:39:29.882+00	11	Москва	3		13	1
282	2022-01-04 02:39:29.914+00	10	Москва, ул. Новый Арбат, 15	3		13	1
283	2022-01-04 02:39:29.945+00	9	Москва	3		13	1
284	2022-01-04 02:39:29.971+00	8	Москва, Цветной бульвар, 11с2	3		13	1
285	2022-01-04 02:39:29.996+00	7	Москва	3		13	1
286	2022-01-04 02:39:44.019+00	6	Москва, пл. Киевского Вокзала, 2	3		13	1
287	2022-01-04 02:39:44.03+00	5	ул. Пушкина, дом Колотушкина	3		13	1
288	2022-01-04 02:39:44.036+00	4	Москва, ул. Новый Арбат, 15	3		13	1
289	2022-01-04 02:39:44.043+00	3	ул. Пушкина, дом Колотушкина	3		13	1
290	2022-01-04 02:39:44.056+00	2	Москва, пл. Киевского Вокзала, 2	3		13	1
291	2022-01-04 02:39:44.068+00	1	ул. Пушкина, дом Колотушкина	3		13	1
292	2022-01-04 02:43:16.926+00	211	ул. Староваряжского восстания 87	3		13	1
293	2022-01-04 02:43:16.937+00	210	Москва, ул. Новый Арбат, 15	3		13	1
294	2022-01-04 02:43:16.943+00	209	ул. Староваряжского восстания 87	3		13	1
295	2022-01-04 02:43:16.949+00	208	Москва, пл. Киевского Вокзала, 2	3		13	1
296	2022-01-04 02:43:16.956+00	207	ул. Пушкина, дом Колотушкина	3		13	1
297	2022-01-04 02:43:16.967+00	206	Москва, ул. Новый Арбат, 15	3		13	1
298	2022-01-04 02:43:16.973+00	205	ул. Пушкина, дом Колотушкина	3		13	1
299	2022-01-04 02:43:16.979+00	204	Москва, Цветной бульвар, 11с2	3		13	1
300	2022-01-04 02:43:16.986+00	203	ул. Пушкина, дом Колотушкина	3		13	1
301	2022-01-04 02:43:16.992+00	202	Москва, пл. Киевского Вокзала, 2	3		13	1
302	2022-01-04 02:43:17.003+00	201	ул. Плохого Дяди, 16, г. Мирный	3		13	1
303	2022-01-04 02:43:17.014+00	200	Москва, ул. Новый Арбат, 15	3		13	1
304	2022-01-04 02:43:17.02+00	199	ул. Плохого Дяди, 16, г. Мирный	3		13	1
305	2022-01-04 02:43:17.026+00	198	Москва, пл. Киевского Вокзала, 2	3		13	1
306	2022-01-04 02:43:17.033+00	197	Москва, пл. Киевского Вокзала, 2	3		13	1
307	2022-01-04 02:43:17.04+00	196	ул. Плохого Дяди, 16, г. Мирный	3		13	1
308	2022-01-04 02:43:17.046+00	195	Москва, ул. Новый Арбат, 15	3		13	1
309	2022-01-04 02:43:17.057+00	194	ул. Плохого Дяди, 16, г. Мирный	3		13	1
310	2022-01-04 02:43:17.064+00	193	Москва, пл. Киевского Вокзала, 2	3		13	1
311	2022-01-04 02:43:17.07+00	192	ул. Пушкина, дом Колотушкина	3		13	1
312	2022-01-04 02:43:17.083+00	191	Москва, ул. Новый Арбат, 15	3		13	1
313	2022-01-04 02:43:17.09+00	190	ул. Пушкина, дом Колотушкина	3		13	1
314	2022-01-04 02:43:17.097+00	189	Москва, пл. Киевского Вокзала, 2	3		13	1
315	2022-01-04 02:43:17.105+00	188	Лондон	3		13	1
316	2022-01-04 02:43:17.113+00	187	Москва, ул. Новый Арбат, 15	3		13	1
317	2022-01-04 02:43:17.119+00	186	Лондон	3		13	1
318	2022-01-04 02:43:17.127+00	185	Москва, Цветной бульвар, 11с2	3		13	1
319	2022-01-04 02:43:17.134+00	184	Лондон	3		13	1
320	2022-01-04 02:43:17.141+00	183	Москва, пл. Киевского Вокзала, 2	3		13	1
321	2022-01-04 02:43:17.147+00	182	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
322	2022-01-04 02:43:17.154+00	181	Москва, Цветной бульвар, 11с2	3		13	1
323	2022-01-04 02:43:17.162+00	180	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
324	2022-01-04 02:43:17.17+00	179	Москва, пл. Киевского Вокзала, 2	3		13	1
325	2022-01-04 02:43:17.176+00	178	Frobisher Pushkin 3, Iqaluit	3		13	1
326	2022-01-04 02:43:17.183+00	177	Москва, ул. Новый Арбат, 15	3		13	1
327	2022-01-04 02:43:17.19+00	176	Frobisher Pushkin 3, Iqaluit	3		13	1
328	2022-01-04 02:43:17.196+00	175	Москва, пл. Киевского Вокзала, 2	3		13	1
329	2022-01-04 02:43:17.207+00	174	Лондон	3		13	1
330	2022-01-04 02:43:17.214+00	173	Москва, ул. Новый Арбат, 15	3		13	1
331	2022-01-04 02:43:17.221+00	172	Лондон	3		13	1
332	2022-01-04 02:43:17.228+00	171	Москва, Цветной бульвар, 11с2	3		13	1
333	2022-01-04 02:43:17.234+00	170	Лондон	3		13	1
334	2022-01-04 02:43:17.241+00	169	Москва, пл. Киевского Вокзала, 2	3		13	1
335	2022-01-04 02:43:17.247+00	168	Лондон	3		13	1
336	2022-01-04 02:43:17.253+00	167	Москва, ул. Новый Арбат, 15	3		13	1
337	2022-01-04 02:43:17.26+00	166	Лондон	3		13	1
338	2022-01-04 02:43:17.266+00	165	Москва, Цветной бульвар, 11с2	3		13	1
339	2022-01-04 02:43:17.272+00	164	Лондон	3		13	1
340	2022-01-04 02:43:17.278+00	163	Москва, пл. Киевского Вокзала, 2	3		13	1
341	2022-01-04 02:43:17.285+00	162	Лондон	3		13	1
342	2022-01-04 02:43:17.291+00	161	Москва, ул. Новый Арбат, 15	3		13	1
343	2022-01-04 02:43:17.297+00	160	Лондон	3		13	1
344	2022-01-04 02:43:17.303+00	159	Москва, Цветной бульвар, 11с2	3		13	1
345	2022-01-04 02:43:17.31+00	158	Лондон	3		13	1
346	2022-01-04 02:43:17.317+00	157	Москва, пл. Киевского Вокзала, 2	3		13	1
347	2022-01-04 02:43:17.324+00	156	ул. Пушкина, дом Колотушкина	3		13	1
348	2022-01-04 02:43:17.333+00	155	Москва, ул. Новый Арбат, 15	3		13	1
349	2022-01-04 02:43:17.341+00	154	ул. Пушкина, дом Колотушкина	3		13	1
350	2022-01-04 02:43:17.352+00	153	Москва, пл. Киевского Вокзала, 2	3		13	1
351	2022-01-04 02:43:17.363+00	152	Лондон	3		13	1
352	2022-01-04 02:43:17.382+00	151	Москва, ул. Новый Арбат, 15	3		13	1
353	2022-01-04 02:43:17.399+00	150	Лондон	3		13	1
354	2022-01-04 02:43:17.427+00	149	Москва, Цветной бульвар, 11с2	3		13	1
355	2022-01-04 02:43:17.456+00	148	Лондон	3		13	1
356	2022-01-04 02:43:17.481+00	147	Москва, пл. Киевского Вокзала, 2	3		13	1
357	2022-01-04 02:43:17.509+00	146	Лондон	3		13	1
358	2022-01-04 02:43:17.539+00	145	Москва, ул. Новый Арбат, 15	3		13	1
359	2022-01-04 02:43:17.58+00	144	Лондон	3		13	1
360	2022-01-04 02:43:17.612+00	143	Москва, Цветной бульвар, 11с2	3		13	1
361	2022-01-04 02:43:17.643+00	142	Лондон	3		13	1
362	2022-01-04 02:43:17.682+00	141	Москва, пл. Киевского Вокзала, 2	3		13	1
363	2022-01-04 02:43:17.723+00	140	Лондон	3		13	1
364	2022-01-04 02:43:17.773+00	139	Москва, ул. Новый Арбат, 15	3		13	1
365	2022-01-04 02:43:17.814+00	138	Лондон	3		13	1
366	2022-01-04 02:43:17.873+00	137	Москва, Цветной бульвар, 11с2	3		13	1
367	2022-01-04 02:43:17.904+00	136	Лондон	3		13	1
368	2022-01-04 02:43:17.922+00	135	Москва, пл. Киевского Вокзала, 2	3		13	1
369	2022-01-04 02:43:17.931+00	134	Лондон	3		13	1
370	2022-01-04 02:43:17.939+00	133	Москва, ул. Новый Арбат, 15	3		13	1
371	2022-01-04 02:43:17.946+00	132	Лондон	3		13	1
372	2022-01-04 02:43:17.953+00	131	Москва, Цветной бульвар, 11с2	3		13	1
373	2022-01-04 02:43:17.959+00	130	Лондон	3		13	1
374	2022-01-04 02:43:17.965+00	129	Москва, пл. Киевского Вокзала, 2	3		13	1
375	2022-01-04 02:43:17.971+00	128	Лондон	3		13	1
376	2022-01-04 02:43:17.977+00	127	Москва, ул. Новый Арбат, 15	3		13	1
377	2022-01-04 02:43:17.984+00	126	Лондон	3		13	1
378	2022-01-04 02:43:17.991+00	125	Москва, Цветной бульвар, 11с2	3		13	1
379	2022-01-04 02:43:17.998+00	124	Лондон	3		13	1
380	2022-01-04 02:43:18.006+00	123	Москва, пл. Киевского Вокзала, 2	3		13	1
381	2022-01-04 02:43:18.016+00	122	Лондон	3		13	1
382	2022-01-04 02:43:18.026+00	121	Москва, ул. Новый Арбат, 15	3		13	1
383	2022-01-04 02:43:18.039+00	120	Лондон	3		13	1
384	2022-01-04 02:43:18.061+00	119	Москва, Цветной бульвар, 11с2	3		13	1
385	2022-01-04 02:43:18.088+00	118	Лондон	3		13	1
386	2022-01-04 02:43:18.118+00	117	Москва, пл. Киевского Вокзала, 2	3		13	1
387	2022-01-04 02:43:18.145+00	116	Москва	3		13	1
388	2022-01-04 02:43:18.174+00	115	Москва, ул. Новый Арбат, 15	3		13	1
389	2022-01-04 02:43:18.204+00	114	Москва	3		13	1
390	2022-01-04 02:43:18.232+00	113	Москва, Цветной бульвар, 11с2	3		13	1
391	2022-01-04 02:43:18.256+00	112	Москва	3		13	1
392	2022-01-04 02:43:27.761+00	111	Москва, пл. Киевского Вокзала, 2	3		13	1
393	2022-01-04 02:43:27.775+00	110	ул. Пушкина, дом Колотушкина	3		13	1
394	2022-01-04 02:43:27.783+00	109	Москва, ул. Новый Арбат, 15	3		13	1
395	2022-01-04 02:43:27.792+00	108	ул. Пушкина, дом Колотушкина	3		13	1
396	2022-01-04 02:43:27.8+00	107	Москва, пл. Киевского Вокзала, 2	3		13	1
397	2022-01-04 02:50:41.011+00	316	ул. Староваряжского восстания 87	3		13	1
398	2022-01-04 02:50:41.019+00	315	Москва, ул. Новый Арбат, 15	3		13	1
399	2022-01-04 02:50:41.026+00	314	ул. Староваряжского восстания 87	3		13	1
400	2022-01-04 02:50:41.034+00	313	Москва, пл. Киевского Вокзала, 2	3		13	1
401	2022-01-04 02:50:41.041+00	312	ул. Пушкина, дом Колотушкина	3		13	1
402	2022-01-04 02:50:41.048+00	311	Москва, ул. Новый Арбат, 15	3		13	1
403	2022-01-04 02:50:41.055+00	310	ул. Пушкина, дом Колотушкина	3		13	1
404	2022-01-04 02:50:41.062+00	309	Москва, Цветной бульвар, 11с2	3		13	1
405	2022-01-04 02:50:41.07+00	308	ул. Пушкина, дом Колотушкина	3		13	1
406	2022-01-04 02:50:41.077+00	307	Москва, пл. Киевского Вокзала, 2	3		13	1
407	2022-01-04 02:50:41.084+00	306	ул. Плохого Дяди, 16, г. Мирный	3		13	1
408	2022-01-04 02:50:41.091+00	305	Москва, ул. Новый Арбат, 15	3		13	1
409	2022-01-04 02:50:41.098+00	304	ул. Плохого Дяди, 16, г. Мирный	3		13	1
410	2022-01-04 02:50:41.105+00	303	Москва, пл. Киевского Вокзала, 2	3		13	1
411	2022-01-04 02:50:41.111+00	302	Москва, пл. Киевского Вокзала, 2	3		13	1
412	2022-01-04 02:50:41.119+00	301	ул. Плохого Дяди, 16, г. Мирный	3		13	1
413	2022-01-04 02:50:41.128+00	300	Москва, ул. Новый Арбат, 15	3		13	1
414	2022-01-04 02:50:41.138+00	299	ул. Плохого Дяди, 16, г. Мирный	3		13	1
415	2022-01-04 02:50:41.148+00	298	Москва, пл. Киевского Вокзала, 2	3		13	1
416	2022-01-04 02:50:41.172+00	297	ул. Пушкина, дом Колотушкина	3		13	1
417	2022-01-04 02:50:41.192+00	296	Москва, ул. Новый Арбат, 15	3		13	1
418	2022-01-04 02:50:41.21+00	295	ул. Пушкина, дом Колотушкина	3		13	1
419	2022-01-04 02:50:41.228+00	294	Москва, пл. Киевского Вокзала, 2	3		13	1
420	2022-01-04 02:50:41.256+00	293	Лондон	3		13	1
421	2022-01-04 02:50:41.274+00	292	Москва, ул. Новый Арбат, 15	3		13	1
422	2022-01-04 02:50:41.293+00	291	Лондон	3		13	1
423	2022-01-04 02:50:41.333+00	290	Москва, Цветной бульвар, 11с2	3		13	1
424	2022-01-04 02:50:41.4+00	289	Лондон	3		13	1
425	2022-01-04 02:50:41.459+00	288	Москва, пл. Киевского Вокзала, 2	3		13	1
426	2022-01-04 02:50:41.496+00	287	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
427	2022-01-04 02:50:41.523+00	286	Москва, Цветной бульвар, 11с2	3		13	1
428	2022-01-04 02:50:41.55+00	285	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
429	2022-01-04 02:50:41.58+00	284	Москва, пл. Киевского Вокзала, 2	3		13	1
430	2022-01-04 02:50:41.612+00	283	Frobisher Pushkin 3, Iqaluit	3		13	1
431	2022-01-04 02:50:41.641+00	282	Москва, ул. Новый Арбат, 15	3		13	1
432	2022-01-04 02:50:41.675+00	281	Frobisher Pushkin 3, Iqaluit	3		13	1
433	2022-01-04 02:50:41.703+00	280	Москва, пл. Киевского Вокзала, 2	3		13	1
434	2022-01-04 02:50:41.728+00	279	Лондон	3		13	1
435	2022-01-04 02:50:41.754+00	278	Москва, ул. Новый Арбат, 15	3		13	1
436	2022-01-04 02:50:41.784+00	277	Лондон	3		13	1
437	2022-01-04 02:50:41.811+00	276	Москва, Цветной бульвар, 11с2	3		13	1
438	2022-01-04 02:50:41.838+00	275	Лондон	3		13	1
439	2022-01-04 02:50:41.864+00	274	Москва, пл. Киевского Вокзала, 2	3		13	1
440	2022-01-04 02:50:41.89+00	273	Лондон	3		13	1
441	2022-01-04 02:50:41.917+00	272	Москва, ул. Новый Арбат, 15	3		13	1
442	2022-01-04 02:50:41.945+00	271	Лондон	3		13	1
443	2022-01-04 02:50:41.97+00	270	Москва, Цветной бульвар, 11с2	3		13	1
444	2022-01-04 02:50:41.996+00	269	Лондон	3		13	1
445	2022-01-04 02:50:42.027+00	268	Москва, пл. Киевского Вокзала, 2	3		13	1
446	2022-01-04 02:50:42.053+00	267	Лондон	3		13	1
447	2022-01-04 02:50:42.081+00	266	Москва, ул. Новый Арбат, 15	3		13	1
448	2022-01-04 02:50:42.107+00	265	Лондон	3		13	1
449	2022-01-04 02:50:42.132+00	264	Москва, Цветной бульвар, 11с2	3		13	1
450	2022-01-04 02:50:42.158+00	263	Лондон	3		13	1
451	2022-01-04 02:50:42.185+00	262	Москва, пл. Киевского Вокзала, 2	3		13	1
452	2022-01-04 02:50:42.21+00	261	ул. Пушкина, дом Колотушкина	3		13	1
453	2022-01-04 02:50:42.235+00	260	Москва, ул. Новый Арбат, 15	3		13	1
454	2022-01-04 02:50:42.261+00	259	ул. Пушкина, дом Колотушкина	3		13	1
455	2022-01-04 02:50:42.289+00	258	Москва, пл. Киевского Вокзала, 2	3		13	1
456	2022-01-04 02:50:42.315+00	257	Лондон	3		13	1
457	2022-01-04 02:50:42.344+00	256	Москва, ул. Новый Арбат, 15	3		13	1
458	2022-01-04 02:50:42.389+00	255	Лондон	3		13	1
459	2022-01-04 02:50:42.416+00	254	Москва, Цветной бульвар, 11с2	3		13	1
460	2022-01-04 02:50:42.443+00	253	Лондон	3		13	1
461	2022-01-04 02:50:42.468+00	252	Москва, пл. Киевского Вокзала, 2	3		13	1
462	2022-01-04 02:50:42.52+00	251	Лондон	3		13	1
463	2022-01-04 02:50:42.582+00	250	Москва, ул. Новый Арбат, 15	3		13	1
464	2022-01-04 02:50:42.632+00	249	Лондон	3		13	1
465	2022-01-04 02:50:42.688+00	248	Москва, Цветной бульвар, 11с2	3		13	1
466	2022-01-04 02:50:42.72+00	247	Лондон	3		13	1
467	2022-01-04 02:50:42.744+00	246	Москва, пл. Киевского Вокзала, 2	3		13	1
468	2022-01-04 02:50:42.771+00	245	Лондон	3		13	1
469	2022-01-04 02:50:42.804+00	244	Москва, ул. Новый Арбат, 15	3		13	1
470	2022-01-04 02:50:42.847+00	243	Лондон	3		13	1
471	2022-01-04 02:50:42.877+00	242	Москва, Цветной бульвар, 11с2	3		13	1
472	2022-01-04 02:50:42.905+00	241	Лондон	3		13	1
473	2022-01-04 02:50:42.929+00	240	Москва, пл. Киевского Вокзала, 2	3		13	1
474	2022-01-04 02:50:42.956+00	239	Лондон	3		13	1
475	2022-01-04 02:50:42.999+00	238	Москва, ул. Новый Арбат, 15	3		13	1
476	2022-01-04 02:50:43.029+00	237	Лондон	3		13	1
477	2022-01-04 02:50:43.056+00	236	Москва, Цветной бульвар, 11с2	3		13	1
478	2022-01-04 02:50:43.086+00	235	Лондон	3		13	1
479	2022-01-04 02:50:43.112+00	234	Москва, пл. Киевского Вокзала, 2	3		13	1
480	2022-01-04 02:50:43.138+00	233	Лондон	3		13	1
481	2022-01-04 02:50:43.165+00	232	Москва, ул. Новый Арбат, 15	3		13	1
482	2022-01-04 02:50:43.196+00	231	Лондон	3		13	1
483	2022-01-04 02:50:43.231+00	230	Москва, Цветной бульвар, 11с2	3		13	1
484	2022-01-04 02:50:43.262+00	229	Лондон	3		13	1
485	2022-01-04 02:50:43.293+00	228	Москва, пл. Киевского Вокзала, 2	3		13	1
486	2022-01-04 02:50:43.323+00	227	Лондон	3		13	1
487	2022-01-04 02:50:43.35+00	226	Москва, ул. Новый Арбат, 15	3		13	1
488	2022-01-04 02:50:43.378+00	225	Лондон	3		13	1
489	2022-01-04 02:50:43.407+00	224	Москва, Цветной бульвар, 11с2	3		13	1
490	2022-01-04 02:50:43.435+00	223	Лондон	3		13	1
491	2022-01-04 02:50:43.462+00	222	Москва, пл. Киевского Вокзала, 2	3		13	1
492	2022-01-04 02:50:43.487+00	221	Москва	3		13	1
493	2022-01-04 02:50:43.513+00	220	Москва, ул. Новый Арбат, 15	3		13	1
494	2022-01-04 02:50:43.549+00	219	Москва	3		13	1
495	2022-01-04 02:50:43.577+00	218	Москва, Цветной бульвар, 11с2	3		13	1
496	2022-01-04 02:50:43.606+00	217	Москва	3		13	1
497	2022-01-04 02:50:54.724+00	631	ул. Староваряжского восстания 87	3		13	1
498	2022-01-04 02:50:54.731+00	630	Москва, ул. Новый Арбат, 15	3		13	1
499	2022-01-04 02:50:54.737+00	629	ул. Староваряжского восстания 87	3		13	1
500	2022-01-04 02:50:54.743+00	628	Москва, пл. Киевского Вокзала, 2	3		13	1
501	2022-01-04 02:50:54.75+00	627	ул. Пушкина, дом Колотушкина	3		13	1
502	2022-01-04 02:50:54.756+00	626	Москва, ул. Новый Арбат, 15	3		13	1
503	2022-01-04 02:50:54.763+00	625	ул. Пушкина, дом Колотушкина	3		13	1
504	2022-01-04 02:50:54.769+00	624	Москва, Цветной бульвар, 11с2	3		13	1
505	2022-01-04 02:50:54.776+00	623	ул. Пушкина, дом Колотушкина	3		13	1
506	2022-01-04 02:50:54.783+00	622	Москва, пл. Киевского Вокзала, 2	3		13	1
507	2022-01-04 02:50:54.79+00	621	ул. Плохого Дяди, 16, г. Мирный	3		13	1
508	2022-01-04 02:50:54.799+00	620	Москва, ул. Новый Арбат, 15	3		13	1
509	2022-01-04 02:50:54.809+00	619	ул. Плохого Дяди, 16, г. Мирный	3		13	1
510	2022-01-04 02:50:54.819+00	618	Москва, пл. Киевского Вокзала, 2	3		13	1
511	2022-01-04 02:50:54.829+00	617	Москва, пл. Киевского Вокзала, 2	3		13	1
512	2022-01-04 02:50:54.841+00	616	ул. Плохого Дяди, 16, г. Мирный	3		13	1
513	2022-01-04 02:50:54.857+00	615	Москва, ул. Новый Арбат, 15	3		13	1
514	2022-01-04 02:50:54.875+00	614	ул. Плохого Дяди, 16, г. Мирный	3		13	1
515	2022-01-04 02:50:54.906+00	613	Москва, пл. Киевского Вокзала, 2	3		13	1
516	2022-01-04 02:50:54.925+00	612	ул. Пушкина, дом Колотушкина	3		13	1
517	2022-01-04 02:50:54.943+00	611	Москва, ул. Новый Арбат, 15	3		13	1
518	2022-01-04 02:50:54.974+00	610	ул. Пушкина, дом Колотушкина	3		13	1
519	2022-01-04 02:50:54.993+00	609	Москва, пл. Киевского Вокзала, 2	3		13	1
520	2022-01-04 02:50:55.011+00	608	Лондон	3		13	1
521	2022-01-04 02:50:55.029+00	607	Москва, ул. Новый Арбат, 15	3		13	1
522	2022-01-04 02:50:55.048+00	606	Лондон	3		13	1
523	2022-01-04 02:50:55.066+00	605	Москва, Цветной бульвар, 11с2	3		13	1
524	2022-01-04 02:50:55.086+00	604	Лондон	3		13	1
525	2022-01-04 02:50:55.104+00	603	Москва, пл. Киевского Вокзала, 2	3		13	1
526	2022-01-04 02:50:55.122+00	602	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
527	2022-01-04 02:50:55.145+00	601	Москва, Цветной бульвар, 11с2	3		13	1
528	2022-01-04 02:50:55.172+00	600	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
529	2022-01-04 02:50:55.197+00	599	Москва, пл. Киевского Вокзала, 2	3		13	1
530	2022-01-04 02:50:55.221+00	598	Frobisher Pushkin 3, Iqaluit	3		13	1
531	2022-01-04 02:50:55.25+00	597	Москва, ул. Новый Арбат, 15	3		13	1
532	2022-01-04 02:50:55.298+00	596	Frobisher Pushkin 3, Iqaluit	3		13	1
533	2022-01-04 02:50:55.345+00	595	Москва, пл. Киевского Вокзала, 2	3		13	1
534	2022-01-04 02:50:55.37+00	594	Лондон	3		13	1
535	2022-01-04 02:50:55.395+00	593	Москва, ул. Новый Арбат, 15	3		13	1
536	2022-01-04 02:50:55.422+00	592	Лондон	3		13	1
537	2022-01-04 02:50:55.447+00	591	Москва, Цветной бульвар, 11с2	3		13	1
538	2022-01-04 02:50:55.474+00	590	Лондон	3		13	1
539	2022-01-04 02:50:55.5+00	589	Москва, пл. Киевского Вокзала, 2	3		13	1
540	2022-01-04 02:50:55.529+00	588	Лондон	3		13	1
541	2022-01-04 02:50:55.554+00	587	Москва, ул. Новый Арбат, 15	3		13	1
542	2022-01-04 02:50:55.584+00	586	Лондон	3		13	1
543	2022-01-04 02:50:55.609+00	585	Москва, Цветной бульвар, 11с2	3		13	1
544	2022-01-04 02:50:55.637+00	584	Лондон	3		13	1
545	2022-01-04 02:50:55.671+00	583	Москва, пл. Киевского Вокзала, 2	3		13	1
546	2022-01-04 02:50:55.746+00	582	Лондон	3		13	1
547	2022-01-04 02:50:55.807+00	581	Москва, ул. Новый Арбат, 15	3		13	1
548	2022-01-04 02:50:55.87+00	580	Лондон	3		13	1
549	2022-01-04 02:50:55.899+00	579	Москва, Цветной бульвар, 11с2	3		13	1
550	2022-01-04 02:50:55.928+00	578	Лондон	3		13	1
551	2022-01-04 02:50:55.958+00	577	Москва, пл. Киевского Вокзала, 2	3		13	1
552	2022-01-04 02:50:55.984+00	576	ул. Пушкина, дом Колотушкина	3		13	1
553	2022-01-04 02:50:56.008+00	575	Москва, ул. Новый Арбат, 15	3		13	1
554	2022-01-04 02:50:56.038+00	574	ул. Пушкина, дом Колотушкина	3		13	1
555	2022-01-04 02:50:56.063+00	573	Москва, пл. Киевского Вокзала, 2	3		13	1
556	2022-01-04 02:50:56.092+00	572	Лондон	3		13	1
557	2022-01-04 02:50:56.117+00	571	Москва, ул. Новый Арбат, 15	3		13	1
558	2022-01-04 02:50:56.141+00	570	Лондон	3		13	1
559	2022-01-04 02:50:56.167+00	569	Москва, Цветной бульвар, 11с2	3		13	1
560	2022-01-04 02:50:56.19+00	568	Лондон	3		13	1
561	2022-01-04 02:50:56.215+00	567	Москва, пл. Киевского Вокзала, 2	3		13	1
562	2022-01-04 02:50:56.242+00	566	Лондон	3		13	1
563	2022-01-04 02:50:56.269+00	565	Москва, ул. Новый Арбат, 15	3		13	1
564	2022-01-04 02:50:56.3+00	564	Лондон	3		13	1
565	2022-01-04 02:50:56.327+00	563	Москва, Цветной бульвар, 11с2	3		13	1
566	2022-01-04 02:50:56.356+00	562	Лондон	3		13	1
567	2022-01-04 02:50:56.382+00	561	Москва, пл. Киевского Вокзала, 2	3		13	1
568	2022-01-04 02:50:56.406+00	560	Лондон	3		13	1
569	2022-01-04 02:50:56.433+00	559	Москва, ул. Новый Арбат, 15	3		13	1
570	2022-01-04 02:50:56.46+00	558	Лондон	3		13	1
571	2022-01-04 02:50:56.484+00	557	Москва, Цветной бульвар, 11с2	3		13	1
572	2022-01-04 02:50:56.519+00	556	Лондон	3		13	1
573	2022-01-04 02:50:56.55+00	555	Москва, пл. Киевского Вокзала, 2	3		13	1
574	2022-01-04 02:50:56.578+00	554	Лондон	3		13	1
575	2022-01-04 02:50:56.602+00	553	Москва, ул. Новый Арбат, 15	3		13	1
576	2022-01-04 02:50:56.628+00	552	Лондон	3		13	1
577	2022-01-04 02:50:56.653+00	551	Москва, Цветной бульвар, 11с2	3		13	1
578	2022-01-04 02:50:56.678+00	550	Лондон	3		13	1
579	2022-01-04 02:50:56.706+00	549	Москва, пл. Киевского Вокзала, 2	3		13	1
580	2022-01-04 02:50:56.735+00	548	Лондон	3		13	1
581	2022-01-04 02:50:56.76+00	547	Москва, ул. Новый Арбат, 15	3		13	1
582	2022-01-04 02:50:56.785+00	546	Лондон	3		13	1
583	2022-01-04 02:50:56.814+00	545	Москва, Цветной бульвар, 11с2	3		13	1
584	2022-01-04 02:50:56.838+00	544	Лондон	3		13	1
585	2022-01-04 02:50:56.867+00	543	Москва, пл. Киевского Вокзала, 2	3		13	1
586	2022-01-04 02:50:56.95+00	542	Лондон	3		13	1
587	2022-01-04 02:50:56.999+00	541	Москва, ул. Новый Арбат, 15	3		13	1
588	2022-01-04 02:50:57.054+00	540	Лондон	3		13	1
589	2022-01-04 02:50:57.108+00	539	Москва, Цветной бульвар, 11с2	3		13	1
590	2022-01-04 02:50:57.136+00	538	Лондон	3		13	1
591	2022-01-04 02:50:57.165+00	537	Москва, пл. Киевского Вокзала, 2	3		13	1
592	2022-01-04 02:50:57.191+00	536	Москва	3		13	1
593	2022-01-04 02:50:57.217+00	535	Москва, ул. Новый Арбат, 15	3		13	1
594	2022-01-04 02:50:57.241+00	534	Москва	3		13	1
595	2022-01-04 02:50:57.268+00	533	Москва, Цветной бульвар, 11с2	3		13	1
596	2022-01-04 02:50:57.292+00	532	Москва	3		13	1
597	2022-01-04 02:51:09.514+00	531	Москва, пл. Киевского Вокзала, 2	3		13	1
598	2022-01-04 02:51:09.541+00	530	ул. Пушкина, дом Колотушкина	3		13	1
599	2022-01-04 02:51:09.566+00	529	Москва, ул. Новый Арбат, 15	3		13	1
600	2022-01-04 02:51:09.59+00	528	ул. Пушкина, дом Колотушкина	3		13	1
601	2022-01-04 02:51:09.662+00	527	Москва, пл. Киевского Вокзала, 2	3		13	1
602	2022-01-04 02:51:09.725+00	526	ул. Староваряжского восстания 87	3		13	1
603	2022-01-04 02:51:09.784+00	525	Москва, ул. Новый Арбат, 15	3		13	1
604	2022-01-04 02:51:09.824+00	524	ул. Староваряжского восстания 87	3		13	1
605	2022-01-04 02:51:09.863+00	523	Москва, пл. Киевского Вокзала, 2	3		13	1
606	2022-01-04 02:51:09.893+00	522	ул. Пушкина, дом Колотушкина	3		13	1
607	2022-01-04 02:51:09.921+00	521	Москва, ул. Новый Арбат, 15	3		13	1
608	2022-01-04 02:51:09.949+00	520	ул. Пушкина, дом Колотушкина	3		13	1
609	2022-01-04 02:51:09.976+00	519	Москва, Цветной бульвар, 11с2	3		13	1
610	2022-01-04 02:51:10+00	518	ул. Пушкина, дом Колотушкина	3		13	1
611	2022-01-04 02:51:10.027+00	517	Москва, пл. Киевского Вокзала, 2	3		13	1
612	2022-01-04 02:51:10.054+00	516	ул. Плохого Дяди, 16, г. Мирный	3		13	1
613	2022-01-04 02:51:10.082+00	515	Москва, ул. Новый Арбат, 15	3		13	1
614	2022-01-04 02:51:10.106+00	514	ул. Плохого Дяди, 16, г. Мирный	3		13	1
615	2022-01-04 02:51:10.131+00	513	Москва, пл. Киевского Вокзала, 2	3		13	1
616	2022-01-04 02:51:10.155+00	512	Москва, пл. Киевского Вокзала, 2	3		13	1
617	2022-01-04 02:51:10.179+00	511	ул. Плохого Дяди, 16, г. Мирный	3		13	1
618	2022-01-04 02:51:10.205+00	510	Москва, ул. Новый Арбат, 15	3		13	1
619	2022-01-04 02:51:10.234+00	509	ул. Плохого Дяди, 16, г. Мирный	3		13	1
620	2022-01-04 02:51:10.258+00	508	Москва, пл. Киевского Вокзала, 2	3		13	1
621	2022-01-04 02:51:10.285+00	507	ул. Пушкина, дом Колотушкина	3		13	1
622	2022-01-04 02:51:10.313+00	506	Москва, ул. Новый Арбат, 15	3		13	1
623	2022-01-04 02:51:10.336+00	505	ул. Пушкина, дом Колотушкина	3		13	1
624	2022-01-04 02:51:10.361+00	504	Москва, пл. Киевского Вокзала, 2	3		13	1
625	2022-01-04 02:51:10.388+00	503	Лондон	3		13	1
626	2022-01-04 02:51:10.416+00	502	Москва, ул. Новый Арбат, 15	3		13	1
627	2022-01-04 02:51:10.441+00	501	Лондон	3		13	1
628	2022-01-04 02:51:10.48+00	500	Москва, Цветной бульвар, 11с2	3		13	1
629	2022-01-04 02:51:10.512+00	499	Лондон	3		13	1
630	2022-01-04 02:51:10.54+00	498	Москва, пл. Киевского Вокзала, 2	3		13	1
631	2022-01-04 02:51:10.579+00	497	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
632	2022-01-04 02:51:10.621+00	496	Москва, Цветной бульвар, 11с2	3		13	1
633	2022-01-04 02:51:10.67+00	495	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
634	2022-01-04 02:51:10.714+00	494	Москва, пл. Киевского Вокзала, 2	3		13	1
635	2022-01-04 02:51:10.755+00	493	Frobisher Pushkin 3, Iqaluit	3		13	1
636	2022-01-04 02:51:10.795+00	492	Москва, ул. Новый Арбат, 15	3		13	1
637	2022-01-04 02:51:10.814+00	491	Frobisher Pushkin 3, Iqaluit	3		13	1
638	2022-01-04 02:51:10.844+00	490	Москва, пл. Киевского Вокзала, 2	3		13	1
639	2022-01-04 02:51:10.856+00	489	Лондон	3		13	1
640	2022-01-04 02:51:10.863+00	488	Москва, ул. Новый Арбат, 15	3		13	1
641	2022-01-04 02:51:10.869+00	487	Лондон	3		13	1
642	2022-01-04 02:51:10.881+00	486	Москва, Цветной бульвар, 11с2	3		13	1
643	2022-01-04 02:51:10.888+00	485	Лондон	3		13	1
644	2022-01-04 02:51:10.894+00	484	Москва, пл. Киевского Вокзала, 2	3		13	1
645	2022-01-04 02:51:10.901+00	483	Лондон	3		13	1
646	2022-01-04 02:51:10.907+00	482	Москва, ул. Новый Арбат, 15	3		13	1
647	2022-01-04 02:51:10.914+00	481	Лондон	3		13	1
648	2022-01-04 02:51:10.92+00	480	Москва, Цветной бульвар, 11с2	3		13	1
649	2022-01-04 02:51:10.926+00	479	Лондон	3		13	1
650	2022-01-04 02:51:10.932+00	478	Москва, пл. Киевского Вокзала, 2	3		13	1
651	2022-01-04 02:51:10.939+00	477	Лондон	3		13	1
652	2022-01-04 02:51:10.945+00	476	Москва, ул. Новый Арбат, 15	3		13	1
653	2022-01-04 02:51:10.952+00	475	Лондон	3		13	1
654	2022-01-04 02:51:10.958+00	474	Москва, Цветной бульвар, 11с2	3		13	1
655	2022-01-04 02:51:10.965+00	473	Лондон	3		13	1
656	2022-01-04 02:51:10.971+00	472	Москва, пл. Киевского Вокзала, 2	3		13	1
657	2022-01-04 02:51:10.977+00	471	ул. Пушкина, дом Колотушкина	3		13	1
658	2022-01-04 02:51:10.983+00	470	Москва, ул. Новый Арбат, 15	3		13	1
659	2022-01-04 02:51:10.99+00	469	ул. Пушкина, дом Колотушкина	3		13	1
660	2022-01-04 02:51:10.997+00	468	Москва, пл. Киевского Вокзала, 2	3		13	1
661	2022-01-04 02:51:11.004+00	467	Лондон	3		13	1
662	2022-01-04 02:51:11.013+00	466	Москва, ул. Новый Арбат, 15	3		13	1
663	2022-01-04 02:51:11.022+00	465	Лондон	3		13	1
664	2022-01-04 02:51:11.034+00	464	Москва, Цветной бульвар, 11с2	3		13	1
665	2022-01-04 02:51:11.049+00	463	Лондон	3		13	1
666	2022-01-04 02:51:11.071+00	462	Москва, пл. Киевского Вокзала, 2	3		13	1
667	2022-01-04 02:51:11.098+00	461	Лондон	3		13	1
668	2022-01-04 02:51:11.126+00	460	Москва, ул. Новый Арбат, 15	3		13	1
669	2022-01-04 02:51:11.152+00	459	Лондон	3		13	1
670	2022-01-04 02:51:11.18+00	458	Москва, Цветной бульвар, 11с2	3		13	1
671	2022-01-04 02:51:11.206+00	457	Лондон	3		13	1
672	2022-01-04 02:51:11.233+00	456	Москва, пл. Киевского Вокзала, 2	3		13	1
673	2022-01-04 02:51:11.257+00	455	Лондон	3		13	1
674	2022-01-04 02:51:11.284+00	454	Москва, ул. Новый Арбат, 15	3		13	1
675	2022-01-04 02:51:11.309+00	453	Лондон	3		13	1
676	2022-01-04 02:51:11.337+00	452	Москва, Цветной бульвар, 11с2	3		13	1
677	2022-01-04 02:51:11.361+00	451	Лондон	3		13	1
678	2022-01-04 02:51:11.39+00	450	Москва, пл. Киевского Вокзала, 2	3		13	1
679	2022-01-04 02:51:11.421+00	449	Лондон	3		13	1
680	2022-01-04 02:51:11.45+00	448	Москва, ул. Новый Арбат, 15	3		13	1
681	2022-01-04 02:51:11.484+00	447	Лондон	3		13	1
682	2022-01-04 02:51:11.51+00	446	Москва, Цветной бульвар, 11с2	3		13	1
683	2022-01-04 02:51:11.539+00	445	Лондон	3		13	1
684	2022-01-04 02:51:11.565+00	444	Москва, пл. Киевского Вокзала, 2	3		13	1
685	2022-01-04 02:51:11.59+00	443	Лондон	3		13	1
686	2022-01-04 02:51:11.619+00	442	Москва, ул. Новый Арбат, 15	3		13	1
687	2022-01-04 02:51:11.649+00	441	Лондон	3		13	1
688	2022-01-04 02:51:11.678+00	440	Москва, Цветной бульвар, 11с2	3		13	1
689	2022-01-04 02:51:11.702+00	439	Лондон	3		13	1
690	2022-01-04 02:51:11.732+00	438	Москва, пл. Киевского Вокзала, 2	3		13	1
691	2022-01-04 02:51:11.758+00	437	Лондон	3		13	1
692	2022-01-04 02:51:11.773+00	436	Москва, ул. Новый Арбат, 15	3		13	1
693	2022-01-04 02:51:11.783+00	435	Лондон	3		13	1
694	2022-01-04 02:51:11.792+00	434	Москва, Цветной бульвар, 11с2	3		13	1
695	2022-01-04 02:51:11.801+00	433	Лондон	3		13	1
696	2022-01-04 02:51:11.811+00	432	Москва, пл. Киевского Вокзала, 2	3		13	1
697	2022-01-04 02:51:26.63+00	431	Москва	3		13	1
698	2022-01-04 02:51:26.637+00	430	Москва, ул. Новый Арбат, 15	3		13	1
699	2022-01-04 02:51:26.644+00	429	Москва	3		13	1
700	2022-01-04 02:51:26.65+00	428	Москва, Цветной бульвар, 11с2	3		13	1
701	2022-01-04 02:51:26.662+00	427	Москва	3		13	1
702	2022-01-04 02:51:26.673+00	426	Москва, пл. Киевского Вокзала, 2	3		13	1
703	2022-01-04 02:51:26.679+00	425	ул. Пушкина, дом Колотушкина	3		13	1
704	2022-01-04 02:51:26.686+00	424	Москва, ул. Новый Арбат, 15	3		13	1
705	2022-01-04 02:51:26.693+00	423	ул. Пушкина, дом Колотушкина	3		13	1
706	2022-01-04 02:51:26.699+00	422	Москва, пл. Киевского Вокзала, 2	3		13	1
707	2022-01-04 02:51:26.705+00	421	ул. Староваряжского восстания 87	3		13	1
708	2022-01-04 02:51:26.712+00	420	Москва, ул. Новый Арбат, 15	3		13	1
709	2022-01-04 02:51:26.718+00	419	ул. Староваряжского восстания 87	3		13	1
710	2022-01-04 02:51:26.724+00	418	Москва, пл. Киевского Вокзала, 2	3		13	1
711	2022-01-04 02:51:26.732+00	417	ул. Пушкина, дом Колотушкина	3		13	1
712	2022-01-04 02:51:26.739+00	416	Москва, ул. Новый Арбат, 15	3		13	1
713	2022-01-04 02:51:26.745+00	415	ул. Пушкина, дом Колотушкина	3		13	1
714	2022-01-04 02:51:26.752+00	414	Москва, Цветной бульвар, 11с2	3		13	1
715	2022-01-04 02:51:26.758+00	413	ул. Пушкина, дом Колотушкина	3		13	1
716	2022-01-04 02:51:26.764+00	412	Москва, пл. Киевского Вокзала, 2	3		13	1
717	2022-01-04 02:51:26.771+00	411	ул. Плохого Дяди, 16, г. Мирный	3		13	1
718	2022-01-04 02:51:26.778+00	410	Москва, ул. Новый Арбат, 15	3		13	1
719	2022-01-04 02:51:26.786+00	409	ул. Плохого Дяди, 16, г. Мирный	3		13	1
720	2022-01-04 02:51:26.794+00	408	Москва, пл. Киевского Вокзала, 2	3		13	1
721	2022-01-04 02:51:26.802+00	407	Москва, пл. Киевского Вокзала, 2	3		13	1
722	2022-01-04 02:51:26.81+00	406	ул. Плохого Дяди, 16, г. Мирный	3		13	1
723	2022-01-04 02:51:26.819+00	405	Москва, ул. Новый Арбат, 15	3		13	1
724	2022-01-04 02:51:26.828+00	404	ул. Плохого Дяди, 16, г. Мирный	3		13	1
725	2022-01-04 02:51:26.836+00	403	Москва, пл. Киевского Вокзала, 2	3		13	1
726	2022-01-04 02:51:26.843+00	402	ул. Пушкина, дом Колотушкина	3		13	1
727	2022-01-04 02:51:26.851+00	401	Москва, ул. Новый Арбат, 15	3		13	1
728	2022-01-04 02:51:26.859+00	400	ул. Пушкина, дом Колотушкина	3		13	1
729	2022-01-04 02:51:26.867+00	399	Москва, пл. Киевского Вокзала, 2	3		13	1
730	2022-01-04 02:51:26.876+00	398	Лондон	3		13	1
731	2022-01-04 02:51:26.885+00	397	Москва, ул. Новый Арбат, 15	3		13	1
732	2022-01-04 02:51:26.895+00	396	Лондон	3		13	1
733	2022-01-04 02:51:26.904+00	395	Москва, Цветной бульвар, 11с2	3		13	1
734	2022-01-04 02:51:26.914+00	394	Лондон	3		13	1
735	2022-01-04 02:51:26.925+00	393	Москва, пл. Киевского Вокзала, 2	3		13	1
736	2022-01-04 02:51:26.94+00	392	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
737	2022-01-04 02:51:26.95+00	391	Москва, Цветной бульвар, 11с2	3		13	1
738	2022-01-04 02:51:26.963+00	390	Пикульское шоссе, д. 40, г. Сентябрьск	3		13	1
739	2022-01-04 02:51:26.973+00	389	Москва, пл. Киевского Вокзала, 2	3		13	1
740	2022-01-04 02:51:26.982+00	388	Frobisher Pushkin 3, Iqaluit	3		13	1
741	2022-01-04 02:51:26.993+00	387	Москва, ул. Новый Арбат, 15	3		13	1
742	2022-01-04 02:51:27.002+00	386	Frobisher Pushkin 3, Iqaluit	3		13	1
743	2022-01-04 02:51:27.013+00	385	Москва, пл. Киевского Вокзала, 2	3		13	1
744	2022-01-04 02:51:27.031+00	384	Лондон	3		13	1
745	2022-01-04 02:51:27.052+00	383	Москва, ул. Новый Арбат, 15	3		13	1
746	2022-01-04 02:51:27.073+00	382	Лондон	3		13	1
747	2022-01-04 02:51:27.092+00	381	Москва, Цветной бульвар, 11с2	3		13	1
748	2022-01-04 02:51:27.103+00	380	Лондон	3		13	1
749	2022-01-04 02:51:27.114+00	379	Москва, пл. Киевского Вокзала, 2	3		13	1
750	2022-01-04 02:51:27.124+00	378	Лондон	3		13	1
751	2022-01-04 02:51:27.135+00	377	Москва, ул. Новый Арбат, 15	3		13	1
752	2022-01-04 02:51:27.147+00	376	Лондон	3		13	1
753	2022-01-04 02:51:27.156+00	375	Москва, Цветной бульвар, 11с2	3		13	1
754	2022-01-04 02:51:27.166+00	374	Лондон	3		13	1
755	2022-01-04 02:51:27.176+00	373	Москва, пл. Киевского Вокзала, 2	3		13	1
756	2022-01-04 02:51:27.187+00	372	Лондон	3		13	1
757	2022-01-04 02:51:27.199+00	371	Москва, ул. Новый Арбат, 15	3		13	1
758	2022-01-04 02:51:27.215+00	370	Лондон	3		13	1
759	2022-01-04 02:51:27.229+00	369	Москва, Цветной бульвар, 11с2	3		13	1
760	2022-01-04 02:51:27.243+00	368	Лондон	3		13	1
761	2022-01-04 02:51:27.256+00	367	Москва, пл. Киевского Вокзала, 2	3		13	1
762	2022-01-04 02:51:27.27+00	366	ул. Пушкина, дом Колотушкина	3		13	1
763	2022-01-04 02:51:27.284+00	365	Москва, ул. Новый Арбат, 15	3		13	1
764	2022-01-04 02:51:27.298+00	364	ул. Пушкина, дом Колотушкина	3		13	1
765	2022-01-04 02:51:27.313+00	363	Москва, пл. Киевского Вокзала, 2	3		13	1
766	2022-01-04 02:51:27.326+00	362	Лондон	3		13	1
767	2022-01-04 02:51:27.341+00	361	Москва, ул. Новый Арбат, 15	3		13	1
768	2022-01-04 02:51:27.354+00	360	Лондон	3		13	1
769	2022-01-04 02:51:27.369+00	359	Москва, Цветной бульвар, 11с2	3		13	1
770	2022-01-04 02:51:27.385+00	358	Лондон	3		13	1
771	2022-01-04 02:51:27.4+00	357	Москва, пл. Киевского Вокзала, 2	3		13	1
772	2022-01-04 02:51:27.414+00	356	Лондон	3		13	1
773	2022-01-04 02:51:27.429+00	355	Москва, ул. Новый Арбат, 15	3		13	1
774	2022-01-04 02:51:27.443+00	354	Лондон	3		13	1
775	2022-01-04 02:51:27.464+00	353	Москва, Цветной бульвар, 11с2	3		13	1
776	2022-01-04 02:51:27.489+00	352	Лондон	3		13	1
777	2022-01-04 02:51:27.514+00	351	Москва, пл. Киевского Вокзала, 2	3		13	1
778	2022-01-04 02:51:27.535+00	350	Лондон	3		13	1
779	2022-01-04 02:51:27.556+00	349	Москва, ул. Новый Арбат, 15	3		13	1
780	2022-01-04 02:51:27.579+00	348	Лондон	3		13	1
781	2022-01-04 02:51:27.604+00	347	Москва, Цветной бульвар, 11с2	3		13	1
782	2022-01-04 02:51:27.628+00	346	Лондон	3		13	1
783	2022-01-04 02:51:27.649+00	345	Москва, пл. Киевского Вокзала, 2	3		13	1
784	2022-01-04 02:51:27.663+00	344	Лондон	3		13	1
785	2022-01-04 02:51:27.677+00	343	Москва, ул. Новый Арбат, 15	3		13	1
786	2022-01-04 02:51:27.692+00	342	Лондон	3		13	1
787	2022-01-04 02:51:27.708+00	341	Москва, Цветной бульвар, 11с2	3		13	1
788	2022-01-04 02:51:27.723+00	340	Лондон	3		13	1
789	2022-01-04 02:51:27.737+00	339	Москва, пл. Киевского Вокзала, 2	3		13	1
790	2022-01-04 02:51:27.753+00	338	Лондон	3		13	1
791	2022-01-04 02:51:27.771+00	337	Москва, ул. Новый Арбат, 15	3		13	1
792	2022-01-04 02:51:27.791+00	336	Лондон	3		13	1
793	2022-01-04 02:51:27.821+00	335	Москва, Цветной бульвар, 11с2	3		13	1
794	2022-01-04 02:51:27.848+00	334	Лондон	3		13	1
795	2022-01-04 02:51:27.877+00	333	Москва, пл. Киевского Вокзала, 2	3		13	1
796	2022-01-04 02:51:27.904+00	332	Лондон	3		13	1
797	2022-01-04 02:51:39.376+00	331	Москва, ул. Новый Арбат, 15	3		13	1
798	2022-01-04 02:51:39.383+00	330	Лондон	3		13	1
799	2022-01-04 02:51:39.391+00	329	Москва, Цветной бульвар, 11с2	3		13	1
800	2022-01-04 02:51:39.398+00	328	Лондон	3		13	1
801	2022-01-04 02:51:39.407+00	327	Москва, пл. Киевского Вокзала, 2	3		13	1
802	2022-01-04 02:51:39.416+00	326	Москва	3		13	1
803	2022-01-04 02:51:39.426+00	325	Москва, ул. Новый Арбат, 15	3		13	1
804	2022-01-04 02:51:39.438+00	324	Москва	3		13	1
805	2022-01-04 02:51:39.454+00	323	Москва, Цветной бульвар, 11с2	3		13	1
806	2022-01-04 02:51:39.468+00	322	Москва	3		13	1
807	2022-01-04 02:51:39.484+00	321	Москва, пл. Киевского Вокзала, 2	3		13	1
808	2022-01-04 02:51:39.504+00	320	ул. Пушкина, дом Колотушкина	3		13	1
809	2022-01-04 02:51:39.522+00	319	Москва, ул. Новый Арбат, 15	3		13	1
810	2022-01-04 02:51:39.544+00	318	ул. Пушкина, дом Колотушкина	3		13	1
811	2022-01-04 02:51:39.563+00	317	Москва, пл. Киевского Вокзала, 2	3		13	1
812	2022-01-04 02:51:39.582+00	216	Москва, пл. Киевского Вокзала, 2	3		13	1
813	2022-01-04 02:51:39.604+00	215	ул. Пушкина, дом Колотушкина	3		13	1
814	2022-01-04 02:51:39.627+00	214	Москва, ул. Новый Арбат, 15	3		13	1
815	2022-01-04 02:51:39.646+00	213	ул. Пушкина, дом Колотушкина	3		13	1
816	2022-01-04 02:51:39.666+00	212	Москва, пл. Киевского Вокзала, 2	3		13	1
817	2022-01-04 02:54:27.014+00	49	B Петров, Москва	2	[{"changed": {"fields": ["\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d", "\\u041a\\u043e\\u043c\\u043c\\u0435\\u043d\\u0442\\u0430\\u0440\\u0438\\u0439"]}}]	11	1
818	2022-01-04 02:56:04.83+00	48	Yepper Test, ул. Базовская, дом 17, Москва	2	[{"changed": {"fields": ["\\u0410\\u0434\\u0440\\u0435\\u0441"]}}]	11	1
819	2022-01-13 20:05:51.745+00	48	Yepper Test, ул. Базовская, дом 17, Москва	2	[{"changed": {"fields": ["\\u0421\\u043f\\u043e\\u0441\\u043e\\u0431 \\u043e\\u043f\\u043b\\u0430\\u0442\\u044b"]}}]	11	1
820	2022-01-13 20:25:28.159+00	49	B Петров, Москва	2	[{"changed": {"fields": ["\\u041a\\u043e\\u043c\\u043c\\u0435\\u043d\\u0442\\u0430\\u0440\\u0438\\u0439"]}}]	11	1
821	2022-01-13 20:27:58.296+00	49	B Петров, Москва	2	[{"changed": {"fields": ["\\u041a\\u043e\\u043c\\u043c\\u0435\\u043d\\u0442\\u0430\\u0440\\u0438\\u0439"]}}]	11	1
822	2022-01-29 10:48:58.404+00	48	Yepper Test, ул. Базовская, дом 17, Москва	3		11	1
823	2022-01-29 10:49:47.673+00	49	B Петров, Москва	3		11	1
824	2022-01-29 10:50:25.197+00	66	Василий Васильевич, Лондон	3		11	1
825	2022-01-29 10:51:10.769+00	58	Василий Васильевич, Лондон	3		11	1
826	2022-01-29 10:51:10.779+00	57	Василий Васильевич, Лондон	3		11	1
827	2022-01-29 10:51:10.785+00	55	Василий Васильевич, Лондон	3		11	1
828	2022-01-29 10:51:10.791+00	54	Василий Васильевич, Лондон	3		11	1
829	2022-01-29 10:51:10.797+00	53	Василий Васильевич, Лондон	3		11	1
830	2022-01-29 10:51:10.803+00	52	Василий Васильевич, Лондон	3		11	1
831	2022-01-29 10:51:10.809+00	51	Василий Васильевич, Лондон	3		11	1
832	2022-01-29 10:51:10.815+00	50	Василий Васильевич, Лондон	3		11	1
833	2022-05-28 03:04:19.281934+00	634	Москва, ул. Новый Арбат, 15	3		7	1
834	2022-05-28 03:05:04.734946+00	641	ул. Староваряжского восстания 87	3		7	1
835	2022-05-28 03:05:26.186006+00	632	Москва, пл. Киевского Вокзала, 2	3		7	1
836	2022-05-28 03:05:42.828272+00	633	ул. Пушкина, дом Колотушкина	3		7	1
837	2022-05-28 03:05:59.142996+00	636	Москва, Цветной бульвар, 11с2	3		7	1
838	2022-05-28 03:05:59.158349+00	635	Москва	3		7	1
839	2022-05-28 03:06:11.765444+00	639	Пикульское шоссе, д. 40, г. Сентябрьск	3		7	1
840	2022-05-28 03:06:24.447848+00	637	Лондон	3		7	1
841	2022-05-28 03:06:37.633308+00	638	Frobisher Pushkin 3, Iqaluit	3		7	1
842	2022-05-28 03:06:50.070878+00	642	ул. Базовская, дом 17, Москва	3		7	1
843	2022-05-28 03:06:50.076302+00	640	ул. Плохого Дяди, 16, г. Мирный	3		7	1
844	2022-07-16 01:13:36.472427+00	2	Roll	2	[{"changed": {"fields": ["Name"]}}]	4	1
845	2022-07-16 01:13:43.340945+00	1	Burger	2	[{"changed": {"fields": ["Name"]}}]	4	1
846	2022-07-16 01:18:46.560775+00	6	Shrimp Roll	2	[{"changed": {"fields": ["Name", "Price", "Description"]}}]	1	1
847	2022-07-16 01:21:35.692119+00	6	Shrimp Roll	2	[{"changed": {"fields": ["Picture"]}}]	1	1
848	2022-07-16 01:26:09.407778+00	6	Shrimp Roll	2	[{"changed": {"fields": ["Description"]}}]	1	1
849	2022-07-16 01:27:58.894509+00	5	Fish Roll	2	[{"changed": {"fields": ["Name", "Picture", "Price"]}}]	1	1
850	2022-07-16 01:32:24.792611+00	6	Shrimp Roll	2	[{"changed": {"fields": ["Picture"]}}]	1	1
851	2022-07-16 01:34:06.743784+00	5	Fish Roll	2	[{"changed": {"fields": ["Picture"]}}]	1	1
852	2022-07-16 01:37:09.681602+00	6	Shrimp Roll	2	[{"changed": {"fields": ["Picture"]}}]	1	1
853	2022-07-16 01:39:05.22036+00	5	Fish Roll	2	[{"changed": {"fields": ["Price", "Description"]}}]	1	1
854	2022-07-16 10:53:13.256745+00	4	Beconizer	2	[{"changed": {"fields": ["Name", "Price"]}}]	1	1
855	2022-07-16 17:33:28.887867+00	4	Beconizer	2	[{"changed": {"fields": ["Picture", "Price"]}}]	1	1
856	2022-07-16 17:34:12.754919+00	4	Beconizer	2	[{"changed": {"fields": ["Description"]}}]	1	1
857	2022-07-16 17:52:00.839924+00	3	Tripple Whopper	2	[{"changed": {"fields": ["Name", "Picture", "Price"]}}]	1	1
858	2022-07-16 17:53:36.687871+00	2	Long Cheeseburger	2	[{"changed": {"fields": ["Name", "Price"]}}]	1	1
859	2022-07-16 17:54:56.417325+00	3	Tripple Whopper	2	[{"changed": {"fields": ["Description"]}}]	1	1
860	2022-07-16 17:59:50.311089+00	2	Long Cheeseburger	2	[{"changed": {"fields": ["Picture", "Description"]}}]	1	1
861	2022-07-16 18:21:48.541942+00	2	Long Cheeseburger	2	[{"changed": {"fields": ["Picture", "Description"]}}]	1	1
862	2022-07-16 18:35:45.384589+00	1	Steakhouse	2	[{"changed": {"fields": ["Name", "Picture", "Price", "Description"]}}]	1	1
863	2022-07-16 18:55:30.609403+00	3	Star Burger European	2	[{"changed": {"fields": ["Name", "Address", "Telephone"]}}]	2	1
864	2022-07-16 18:55:57.863059+00	2	Star Burger La Mer	2	[{"changed": {"fields": ["Name", "Address", "Telephone"]}}]	2	1
865	2022-07-16 18:57:06.282983+00	1	Star Burger Atlantique	2	[{"changed": {"fields": ["Name", "Address", "Telephone"]}}]	2	1
866	2022-07-16 18:58:12.077093+00	78	Gerhkart Freinenberg, Feinzeine Str. 43	2	[{"changed": {"fields": ["First name", "Last name", "Address"]}}]	5	1
867	2022-07-16 19:00:08.104325+00	78	Gerhkart Freinenberg, 27 RUE PASTEUR, 14390 CABOURG	2	[{"changed": {"fields": ["Address"]}}]	5	1
868	2022-07-16 19:02:26.97386+00	77	Karl Freblitz, IMPASSE VIVALDI, VAUCE, 53300 COUESNES VAUCE	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
869	2022-07-16 19:03:35.255967+00	76	Gargbin Soynphres, 43 place Maurice-Charretier, Charleville-mÉziÈres, Champagne-Ardenne, 08000, France	2	[{"changed": {"fields": ["Telephone", "Address"]}}]	5	1
870	2022-07-16 19:03:45.041484+00	78	Gerhkart Freinenberg, 27 RUE PASTEUR, 14390 CABOURG, France	2	[{"changed": {"fields": ["Address"]}}]	5	1
871	2022-07-16 19:03:57.122855+00	77	Karl Freblitz, IMPASSE VIVALDI, VAUCE, 53300 COUESNES VAUCE, France	2	[{"changed": {"fields": ["Address"]}}]	5	1
872	2022-07-16 19:05:46.260615+00	75	Pierre Gorges, 2 rue Banaudon, Lyon, Rhône-Alpes, 69008, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
873	2022-07-16 19:08:19.238252+00	74	Elsar Fièrron, 13 rue Gontier-Patin, Aix-en-provence, Provence-Alpes-Côte d'Azur, 13100, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
874	2022-07-16 19:09:55.10406+00	73	Paul Guseppe, 69 avenue Jean Portalis, Tulle, Limousin, 19000, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
875	2022-07-16 19:10:59.814376+00	72	Gill Dupont, 16 rue Clement Marot, PÉrigueux, Aquitaine, 24000	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
876	2022-07-16 19:13:19.386541+00	65	Cassinia Oubleppouais, 80 Chemin des Bateliers, Albi, Midi-Pyrénées, 81000, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
877	2022-07-16 19:15:00.309467+00	64	Manuel Boutroux, 78 rue des Soeurs, La Celle-saint-cloud, Île-de-France, 78170, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
878	2022-07-16 19:16:27.355122+00	63	Isaac Gachet, 65 rue de la Hulotais,Saint-pierre-et-miquelon, Île-de-France, 97500, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
879	2022-07-16 19:18:41.829993+00	62	Mickaël Arsenault, 50 avenue de l'Amandier, Bobigny, Île-de-France, 93000, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
880	2022-07-16 19:20:42.036059+00	61	Éric Simon, 96 route de Lyon, Illkirch-graffenstaden, Alsace, 67400, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
881	2022-07-16 19:22:01.249925+00	59	Léo Carré, 92 cours Franklin Roosevelt, Marseille, Provence-Alpes-Côte d'Azur, 13006, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
882	2022-07-16 19:33:47.948591+00	56	Pierre-Louis Loupe, 12 Rue Hubert de Lisle, Loos, Nord-Pas-de-Calais, 59120, France	2	[{"changed": {"fields": ["First name", "Last name", "Telephone", "Address"]}}]	5	1
883	2022-07-16 19:34:06.632296+00	72	Gill Dupont, 16 rue Clement Marot, PÉrigueux, Aquitaine, 24000, France	2	[{"changed": {"fields": ["Address"]}}]	5	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	foodcartapp	product
2	foodcartapp	restaurant
3	foodcartapp	restaurantmenuitem
4	foodcartapp	productcategory
5	foodcartapp	order
6	foodcartapp	orderitem
7	geolocations	location
8	admin	logentry
9	auth	permission
10	auth	group
11	auth	user
12	contenttypes	contenttype
13	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-14 11:25:54.914766+00
2	auth	0001_initial	2022-03-14 11:25:54.956797+00
3	admin	0001_initial	2022-03-14 11:25:54.970137+00
4	admin	0002_logentry_remove_auto_add	2022-03-14 11:25:54.97659+00
5	admin	0003_logentry_add_action_flag_choices	2022-03-14 11:25:54.982788+00
6	contenttypes	0002_remove_content_type_name	2022-03-14 11:25:54.995988+00
7	auth	0002_alter_permission_name_max_length	2022-03-14 11:25:55.003038+00
8	auth	0003_alter_user_email_max_length	2022-03-14 11:25:55.009346+00
9	auth	0004_alter_user_username_opts	2022-03-14 11:25:55.014947+00
10	auth	0005_alter_user_last_login_null	2022-03-14 11:25:55.020704+00
11	auth	0006_require_contenttypes_0002	2022-03-14 11:25:55.022517+00
12	auth	0007_alter_validators_add_error_messages	2022-03-14 11:25:55.030409+00
13	auth	0008_alter_user_username_max_length	2022-03-14 11:25:55.038962+00
14	auth	0009_alter_user_last_name_max_length	2022-03-14 11:25:55.04591+00
15	auth	0010_alter_group_name_max_length	2022-03-14 11:25:55.054596+00
16	auth	0011_update_proxy_permissions	2022-03-14 11:25:55.061486+00
17	auth	0012_alter_user_first_name_max_length	2022-03-14 11:25:55.068572+00
18	foodcartapp	0001_initial	2022-03-14 11:25:55.137461+00
19	foodcartapp	0002_auto_20200619_0836	2022-03-14 11:25:55.330446+00
20	foodcartapp	0003_auto_20200619_0838	2022-03-14 11:25:55.358535+00
21	foodcartapp	0004_auto_20200619_0843	2022-03-14 11:25:55.363766+00
22	foodcartapp	0005_auto_20200619_0845	2022-03-14 11:25:55.376482+00
23	foodcartapp	0006_auto_20200619_0849	2022-03-14 11:25:55.390081+00
24	foodcartapp	0007_auto_20200619_0849	2022-03-14 11:25:55.409722+00
25	foodcartapp	0008_hotel_city	2022-03-14 11:25:55.422431+00
26	foodcartapp	0009_auto_20200619_0919	2022-03-14 11:25:55.431645+00
27	foodcartapp	0010_auto_20200619_0921	2022-03-14 11:25:55.443966+00
28	foodcartapp	0011_auto_20200619_0922	2022-03-14 11:25:55.457292+00
29	foodcartapp	0012_auto_20200619_0924	2022-03-14 11:25:55.462323+00
30	foodcartapp	0013_auto_20200619_0932	2022-03-14 11:25:55.482824+00
31	foodcartapp	0014_auto_20200619_0934	2022-03-14 11:25:55.508654+00
32	foodcartapp	0015_auto_20200619_0935	2022-03-14 11:25:55.518599+00
33	foodcartapp	0016_restaurant_new_admin	2022-03-14 11:25:55.52954+00
34	foodcartapp	0017_auto_20200619_0945	2022-03-14 11:25:55.538122+00
35	foodcartapp	0018_remove_restaurant_admin	2022-03-14 11:25:55.549228+00
36	foodcartapp	0019_auto_20200619_0948	2022-03-14 11:25:55.562746+00
37	foodcartapp	0020_auto_20200619_0959	2022-03-14 11:25:55.569307+00
38	foodcartapp	0021_auto_20200619_1002	2022-03-14 11:25:55.5746+00
39	foodcartapp	0022_auto_20200619_1003	2022-03-14 11:25:55.579561+00
40	foodcartapp	0023_auto_20200620_0942	2022-03-14 11:25:55.610131+00
41	foodcartapp	0024_product_ingridients	2022-03-14 11:25:55.616925+00
42	foodcartapp	0025_auto_20200629_1004	2022-03-14 11:25:55.629238+00
43	foodcartapp	0026_restaurantmenuitem	2022-03-14 11:25:55.64418+00
44	foodcartapp	0027_auto_20200629_1022	2022-03-14 11:25:55.650644+00
45	foodcartapp	0028_auto_20200629_1024	2022-03-14 11:25:55.6638+00
46	foodcartapp	0029_remove_product_category	2022-03-14 11:25:55.667535+00
47	foodcartapp	0030_auto_20200629_1341	2022-03-14 11:25:55.679842+00
48	foodcartapp	0031_auto_20200703_0612	2022-03-14 11:25:55.693062+00
49	foodcartapp	0032_remove_restaurant_admin	2022-03-14 11:25:55.702366+00
50	foodcartapp	0033_auto_20200928_1930	2022-03-14 11:25:55.706246+00
51	foodcartapp	0034_auto_20200928_1930	2022-03-14 11:25:55.709712+00
52	foodcartapp	0035_auto_20200928_1941	2022-03-14 11:25:55.714829+00
53	foodcartapp	0036_auto_20210125_1532	2022-03-14 11:25:55.720728+00
54	foodcartapp	0037_auto_20210125_1833	2022-03-14 11:25:55.724107+00
55	foodcartapp	0038_order	2022-03-14 11:25:55.733572+00
56	foodcartapp	0039_auto_20210928_1656	2022-03-14 11:25:55.75816+00
57	foodcartapp	0040_auto_20211030_2255	2022-03-14 11:25:55.777127+00
58	foodcartapp	0041_remove_orderitem_order	2022-03-14 11:25:55.78432+00
59	foodcartapp	0042_auto_20211103_1618	2022-03-14 11:25:55.800844+00
60	foodcartapp	0043_alter_orderitem_order	2022-03-14 11:25:55.808947+00
61	foodcartapp	0044_alter_order_order_items	2022-03-14 11:25:55.81652+00
62	foodcartapp	0045_alter_order_order_items	2022-03-14 11:25:55.821373+00
63	foodcartapp	0046_auto_20211103_1714	2022-03-14 11:25:55.831345+00
64	foodcartapp	0047_rename_telephone_order_phonenumber	2022-03-14 11:25:55.834997+00
65	foodcartapp	0048_auto_20211123_2010	2022-03-14 11:25:55.841821+00
66	foodcartapp	0049_auto_20211209_0718	2022-03-14 11:25:55.850513+00
67	foodcartapp	0050_auto_20211209_0737	2022-03-14 11:25:55.85227+00
68	foodcartapp	0051_auto_20211209_0739	2022-03-14 11:25:55.86114+00
69	foodcartapp	0053_auto_20211214_1532	2022-03-14 11:25:55.871306+00
70	foodcartapp	0054_order_comment	2022-03-14 11:25:55.876835+00
71	foodcartapp	0055_auto_20211216_2142	2022-03-14 11:25:55.885141+00
72	foodcartapp	0056_auto_20211216_2152	2022-03-14 11:25:55.895494+00
73	foodcartapp	0057_auto_20211216_2239	2022-03-14 11:25:55.904818+00
74	foodcartapp	0058_order_restaurant	2022-03-14 11:25:55.912252+00
75	foodcartapp	0059_auto_20220113_1907	2022-03-14 11:25:55.924842+00
76	foodcartapp	0060_auto_20220113_1933	2022-03-14 11:25:55.960272+00
77	foodcartapp	0061_alter_order_payment_method	2022-03-14 11:25:55.965035+00
78	foodcartapp	0062_alter_order_restaurant	2022-03-14 11:25:55.970302+00
79	foodcartapp	0063_alter_order_comment	2022-03-14 11:25:55.974355+00
80	foodcartapp	0064_auto_20220120_0425	2022-03-14 11:25:55.983179+00
81	foodcartapp	0065_auto_20220120_0429	2022-03-14 11:25:56.047212+00
82	foodcartapp	0066_alter_orderitem_order	2022-03-14 11:25:56.052317+00
83	foodcartapp	0067_alter_orderitem_product	2022-03-14 11:25:56.057157+00
84	foodcartapp	0068_alter_orderitem_order	2022-03-14 11:25:56.065433+00
85	foodcartapp	0069_alter_orderitem_product	2022-03-14 11:25:56.070481+00
86	geolocations	0001_initial	2022-03-14 11:25:56.074597+00
87	geolocations	0002_auto_20220104_0237	2022-03-14 11:25:56.080341+00
88	geolocations	0003_alter_location_address	2022-03-14 11:25:56.085776+00
89	geolocations	0004_auto_20220113_2233	2022-03-14 11:25:56.089336+00
90	geolocations	0005_auto_20220201_1908	2022-03-14 11:25:56.094092+00
91	sessions	0001_initial	2022-03-14 11:25:56.102134+00
92	foodcartapp	0070_auto_20220716_1759	2022-07-16 17:59:41.877271+00
93	geolocations	0006_alter_location_options	2022-07-16 17:59:41.884024+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ruun0kxsdt09revpdj0q4ulgpvhq6zu3	.eJxVjMsOwiAQRf-FtSEt0GHGpXu_gTA8pGogKe3K-O_apAvd3nPOfQnnt7W4rafFzVGcxShOvxv78Eh1B_Hu663J0Oq6zCx3RR60y2uL6Xk53L-D4nv51qgjkTEDau0J2epswmRtCqRAEZOdlAYIWSlmGkYf0UTCHIwFILAo3h-3Tja9:1nnRqB:a6YFejF-HHvhlDRvF6PRE4M3YndR2Tnn8jCr0HAx7L0	2022-05-21 21:19:51.286651+00
slm90tg1j7p6cex6fqv5pmp4fc3rrvy5	.eJxVjMsOwiAQRf-FtSEt0GHGpXu_gTA8pGogKe3K-O_apAvd3nPOfQnnt7W4rafFzVGcxShOvxv78Eh1B_Hu663J0Oq6zCx3RR60y2uL6Xk53L-D4nv51qgjkTEDau0J2epswmRtCqRAEZOdlAYIWSlmGkYf0UTCHIwFILAo3h-3Tja9:1oCWMV:-XXtJKpVlFwkaEsfqb1NozzR27BAdSTwQ6mqXJoIWDg	2022-07-30 01:12:51.623949+00
\.


--
-- Data for Name: foodcartapp_order; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.foodcartapp_order (id, firstname, lastname, phonenumber, address, status, comment, called_at, delivered_at, registered_at, payment_method, restaurant_id) FROM stdin;
76	Gargbin	Soynphres	+33445013321	43 place Maurice-Charretier, Charleville-mÉziÈres, Champagne-Ardenne, 08000, France	pending		\N	\N	2021-12-20 20:49:39+00	cash	\N
78	Gerhkart	Freinenberg	+33455015642	27 RUE PASTEUR, 14390 CABOURG, France	pending		\N	\N	2022-03-22 00:03:52+00	not_specified	\N
77	Karl	Freblitz	+33445015887	IMPASSE VIVALDI, VAUCE, 53300 COUESNES VAUCE, France	pending		\N	\N	2021-12-20 20:52:05+00	cash	\N
75	Pierre	Gorges	+33445010988	2 rue Banaudon, Lyon, Rhône-Alpes, 69008, France	pending		\N	\N	2021-12-20 20:46:22+00	cash	\N
74	Elsar	Fièrron	+33445015881	13 rue Gontier-Patin, Aix-en-provence, Provence-Alpes-Côte d'Azur, 13100, France	pending		\N	\N	2021-12-20 20:43:32+00	cash	\N
73	Paul	Guseppe	+33445015001	69 avenue Jean Portalis, Tulle, Limousin, 19000, France	pending		\N	\N	2021-12-20 20:42:24+00	cash	\N
65	Cassinia	Oubleppouais	+33445013320	80 Chemin des Bateliers, Albi, Midi-Pyrénées, 81000, France	pending		\N	\N	2021-12-16 21:42:08+00	cash	\N
64	Manuel	Boutroux	+33445013324	78 rue des Soeurs, La Celle-saint-cloud, Île-de-France, 78170, France	pending		\N	\N	2021-12-16 21:42:08+00	cash	\N
63	Isaac	Gachet	+33599121632	65 rue de la Hulotais,Saint-pierre-et-miquelon, Île-de-France, 97500, France	pending		\N	\N	2021-12-16 21:42:08+00	cash	\N
62	Mickaël	Arsenault	+33136012789	50 avenue de l'Amandier, Bobigny, Île-de-France, 93000, France	processing		\N	\N	2021-12-16 21:42:08+00	cash	\N
61	Éric	Simon	+33341642197	96 route de Lyon, Illkirch-graffenstaden, Alsace, 67400, France	pending		\N	\N	2021-12-16 21:42:08+00	cash	\N
59	Léo	Carré	+33415692779	92 cours Franklin Roosevelt, Marseille, Provence-Alpes-Côte d'Azur, 13006, France	pending		\N	\N	2021-12-16 21:42:08+00	cash	\N
56	Pierre-Louis	Loupe	+33398846215	12 Rue Hubert de Lisle, Loos, Nord-Pas-de-Calais, 59120, France	pending		\N	\N	2021-12-16 21:42:08+00	cash	\N
72	Gill	Dupont	+33445010982	16 rue Clement Marot, PÉrigueux, Aquitaine, 24000, France	completed		\N	\N	2021-12-16 21:42:08+00	cash	\N
\.


--
-- Data for Name: foodcartapp_orderitem; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.foodcartapp_orderitem (id, quantity, product_id, order_id, price) FROM stdin;
55	1	2	56	219.00
56	1	3	56	369.00
59	10	1	59	259.00
60	2	2	61	219.00
61	3	2	62	219.00
62	3	3	62	369.00
63	1	4	63	319.00
64	1	2	72	219.00
65	2	3	72	369.00
66	1	1	72	259.00
71	1	2	73	249.00
72	1	3	73	369.00
73	1	3	74	369.00
74	1	2	74	249.00
75	1	1	74	259.00
76	1	2	75	249.00
77	1	3	75	369.00
78	1	1	75	259.00
79	1	4	75	319.00
80	1	2	76	249.00
81	1	3	76	369.00
82	6	1	76	259.00
83	5	3	77	369.00
84	1	3	78	369.00
85	1	2	78	249.00
\.


--
-- Data for Name: foodcartapp_product; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.foodcartapp_product (id, name, price, image, special_status, description, category_id) FROM stdin;
4	Beconizer	7.90	beconizer_pLiuuLr.jpg	f	Meet the most impressive burger in the Star Burger collection. A lot of meat, a lot of bacon and a lot of cheese - all as you love, and nothing more!	1
3	Tripple Whopper	6.90	triple_whopper_R7Cb6m8.jpg	f	The Tripper Whopper is a delicious 100% beef, cooked on open fire with juicy tomatoes, freshly chopped leaf lettuce, a thick dollop of mayonnaise, crispy pickled cucumbers and fresh onions.	1
6	Shrimp Roll	4.90	shrimp_roll_kdezFvR.jpg	f	Savory roll with delicate royal shrimp in a fresh bun, a fresh iceberg lettuce and a handful of airy potato chips on the side.\r\nAttention! The dish contains seafood	2
5	Fish Roll	2.90	fish_roll_VU4oVkW.jpg	f	Our new spring roll with a delicious cutlet of white fish fillet, with a proprietary sauce, pickled cucumbers and a crispy salad. Light fish pleasure!	2
2	Long Cheeseburger	4.90	long_chiz_Ff8nRoE.jpg	f	The Long Cheeseburger is the standard in our collection of cheeseburgers! Two beefsteak cooked on open fire with two slices of slightly molten cheese, crispy cucumbers, chopped onions, mustard and ketchup on a long fresh bun.	1
1	Steakhouse	6.90	steak_myYDU48.jpg	f	Steakhouse is a combination of our branded, prepared on open fire, 100% beef burgers with bacon slices and our brand barbecue sauce, mayo, fresh lettuce, tomato and crispy onion on an classic grillhouse shiny bun.	1
\.


--
-- Data for Name: foodcartapp_productcategory; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.foodcartapp_productcategory (id, name) FROM stdin;
2	Roll
1	Burger
\.


--
-- Data for Name: foodcartapp_restaurant; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.foodcartapp_restaurant (id, name, address, contact_phone) FROM stdin;
3	Star Burger European	Paris, France	+33 06804758
2	Star Burger La Mer	Marseille, France	+33 06804760
1	Star Burger Atlantique	Bearitz, France	+33 06804770
\.


--
-- Data for Name: foodcartapp_restaurantmenuitem; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.foodcartapp_restaurantmenuitem (id, availability, product_id, restaurant_id) FROM stdin;
1	t	1	3
2	t	2	3
3	t	3	3
4	t	4	3
5	t	5	3
6	t	1	2
7	t	4	2
8	t	3	2
9	t	5	2
10	t	6	2
11	t	1	1
12	t	2	1
13	t	6	1
14	t	3	1
\.


--
-- Data for Name: geolocations_location; Type: TABLE DATA; Schema: public; Owner: starburger
--

COPY public.geolocations_location (id, address, latitude, longitude, created_on) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 883, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 93, true);


--
-- Name: foodcartapp_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.foodcartapp_hotel_id_seq', 3, true);


--
-- Name: foodcartapp_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.foodcartapp_order_id_seq', 78, true);


--
-- Name: foodcartapp_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.foodcartapp_orderitem_id_seq', 85, true);


--
-- Name: foodcartapp_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.foodcartapp_product_id_seq', 6, true);


--
-- Name: foodcartapp_productcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.foodcartapp_productcategory_id_seq', 2, true);


--
-- Name: foodcartapp_restaurantmenuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.foodcartapp_restaurantmenuitem_id_seq', 14, true);


--
-- Name: geolocations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: starburger
--

SELECT pg_catalog.setval('public.geolocations_location_id_seq', 651, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: foodcartapp_restaurant foodcartapp_hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_restaurant
    ADD CONSTRAINT foodcartapp_hotel_pkey PRIMARY KEY (id);


--
-- Name: foodcartapp_order foodcartapp_order_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_order
    ADD CONSTRAINT foodcartapp_order_pkey PRIMARY KEY (id);


--
-- Name: foodcartapp_orderitem foodcartapp_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_orderitem
    ADD CONSTRAINT foodcartapp_orderitem_pkey PRIMARY KEY (id);


--
-- Name: foodcartapp_product foodcartapp_product_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_product
    ADD CONSTRAINT foodcartapp_product_pkey PRIMARY KEY (id);


--
-- Name: foodcartapp_productcategory foodcartapp_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_productcategory
    ADD CONSTRAINT foodcartapp_productcategory_pkey PRIMARY KEY (id);


--
-- Name: foodcartapp_restaurantmenuitem foodcartapp_restaurantme_restaurant_id_product_id_e3271626_uniq; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_restaurantmenuitem
    ADD CONSTRAINT foodcartapp_restaurantme_restaurant_id_product_id_e3271626_uniq UNIQUE (restaurant_id, product_id);


--
-- Name: foodcartapp_restaurantmenuitem foodcartapp_restaurantmenuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_restaurantmenuitem
    ADD CONSTRAINT foodcartapp_restaurantmenuitem_pkey PRIMARY KEY (id);


--
-- Name: geolocations_location geolocations_location_address_b37490f8_uniq; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.geolocations_location
    ADD CONSTRAINT geolocations_location_address_b37490f8_uniq UNIQUE (address);


--
-- Name: geolocations_location geolocations_location_pkey; Type: CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.geolocations_location
    ADD CONSTRAINT geolocations_location_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: foodcartapp_order_called_at_7b5c797d; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_called_at_7b5c797d ON public.foodcartapp_order USING btree (called_at);


--
-- Name: foodcartapp_order_delivered_at_afa25a67; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_delivered_at_afa25a67 ON public.foodcartapp_order USING btree (delivered_at);


--
-- Name: foodcartapp_order_payment_method_4f803fc6; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_payment_method_4f803fc6 ON public.foodcartapp_order USING btree (payment_method);


--
-- Name: foodcartapp_order_payment_method_4f803fc6_like; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_payment_method_4f803fc6_like ON public.foodcartapp_order USING btree (payment_method varchar_pattern_ops);


--
-- Name: foodcartapp_order_phonenumber_d810b5c8; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_phonenumber_d810b5c8 ON public.foodcartapp_order USING btree (phonenumber);


--
-- Name: foodcartapp_order_phonenumber_d810b5c8_like; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_phonenumber_d810b5c8_like ON public.foodcartapp_order USING btree (phonenumber varchar_pattern_ops);


--
-- Name: foodcartapp_order_registered_at_0cb4b295; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_registered_at_0cb4b295 ON public.foodcartapp_order USING btree (registered_at);


--
-- Name: foodcartapp_order_restaurant_id_3a8e4062; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_restaurant_id_3a8e4062 ON public.foodcartapp_order USING btree (restaurant_id);


--
-- Name: foodcartapp_order_status_65884383; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_status_65884383 ON public.foodcartapp_order USING btree (status);


--
-- Name: foodcartapp_order_status_65884383_like; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_order_status_65884383_like ON public.foodcartapp_order USING btree (status varchar_pattern_ops);


--
-- Name: foodcartapp_orderitem_order_id_3b24898f; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_orderitem_order_id_3b24898f ON public.foodcartapp_orderitem USING btree (order_id);


--
-- Name: foodcartapp_orderitem_product_id_14192a46; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_orderitem_product_id_14192a46 ON public.foodcartapp_orderitem USING btree (product_id);


--
-- Name: foodcartapp_product_category_id_e35a423b; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_product_category_id_e35a423b ON public.foodcartapp_product USING btree (category_id);


--
-- Name: foodcartapp_product_special_status_2be2f3e9; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_product_special_status_2be2f3e9 ON public.foodcartapp_product USING btree (special_status);


--
-- Name: foodcartapp_restaurantmenuitem_availability_f4d4d4a7; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_restaurantmenuitem_availability_f4d4d4a7 ON public.foodcartapp_restaurantmenuitem USING btree (availability);


--
-- Name: foodcartapp_restaurantmenuitem_product_id_80c1a5c0; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_restaurantmenuitem_product_id_80c1a5c0 ON public.foodcartapp_restaurantmenuitem USING btree (product_id);


--
-- Name: foodcartapp_restaurantmenuitem_restaurant_id_561b91ba; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX foodcartapp_restaurantmenuitem_restaurant_id_561b91ba ON public.foodcartapp_restaurantmenuitem USING btree (restaurant_id);


--
-- Name: geolocations_location_address_b37490f8_like; Type: INDEX; Schema: public; Owner: starburger
--

CREATE INDEX geolocations_location_address_b37490f8_like ON public.geolocations_location USING btree (address varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: foodcartapp_order foodcartapp_order_restaurant_id_3a8e4062_fk_foodcarta; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_order
    ADD CONSTRAINT foodcartapp_order_restaurant_id_3a8e4062_fk_foodcarta FOREIGN KEY (restaurant_id) REFERENCES public.foodcartapp_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: foodcartapp_orderitem foodcartapp_orderite_product_id_14192a46_fk_foodcarta; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_orderitem
    ADD CONSTRAINT foodcartapp_orderite_product_id_14192a46_fk_foodcarta FOREIGN KEY (product_id) REFERENCES public.foodcartapp_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: foodcartapp_orderitem foodcartapp_orderitem_order_id_3b24898f_fk_foodcartapp_order_id; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_orderitem
    ADD CONSTRAINT foodcartapp_orderitem_order_id_3b24898f_fk_foodcartapp_order_id FOREIGN KEY (order_id) REFERENCES public.foodcartapp_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: foodcartapp_product foodcartapp_product_category_id_e35a423b_fk_foodcarta; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_product
    ADD CONSTRAINT foodcartapp_product_category_id_e35a423b_fk_foodcarta FOREIGN KEY (category_id) REFERENCES public.foodcartapp_productcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: foodcartapp_restaurantmenuitem foodcartapp_restaura_product_id_80c1a5c0_fk_foodcarta; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_restaurantmenuitem
    ADD CONSTRAINT foodcartapp_restaura_product_id_80c1a5c0_fk_foodcarta FOREIGN KEY (product_id) REFERENCES public.foodcartapp_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: foodcartapp_restaurantmenuitem foodcartapp_restaura_restaurant_id_561b91ba_fk_foodcarta; Type: FK CONSTRAINT; Schema: public; Owner: starburger
--

ALTER TABLE ONLY public.foodcartapp_restaurantmenuitem
    ADD CONSTRAINT foodcartapp_restaura_restaurant_id_561b91ba_fk_foodcarta FOREIGN KEY (restaurant_id) REFERENCES public.foodcartapp_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


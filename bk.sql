--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-14 14:46:30

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
-- TOC entry 217 (class 1259 OID 16599)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16598)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 219 (class 1259 OID 16606)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16605)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 218
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 223 (class 1259 OID 16639)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16638)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 215 (class 1259 OID 16590)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16589)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 214
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 221 (class 1259 OID 16613)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16646)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16645)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 220 (class 1259 OID 16612)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3199 (class 2604 OID 16602)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16609)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 16642)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 16593)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 16616)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16649)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3370 (class 0 OID 16599)
-- Dependencies: 217
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Мебель');
INSERT INTO public.category (id, name) VALUES (2, 'Одежда');
INSERT INTO public.category (id, name) VALUES (3, 'Бытовая техника');


--
-- TOC entry 3372 (class 0 OID 16606)
-- Dependencies: 219
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'fe305fbf-93ff-4158-b8b3-4b779ba12871.1.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '9fef4235-cec9-406b-9cab-68b23029087d.2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '299bec2e-fa79-4a3b-99d7-74631ebfbd80.3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, 'a8825e00-062b-4096-8f17-26ec8885d248.4.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, '9dae127a-19bb-4b85-ae20-e4e749ce9a9f.5.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, 'a68b5fc5-b5b6-41d0-8c33-c48989425987.1.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, 'f81254aa-f102-45da-8559-f7b7dd0e5782.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, 'ccf21a20-267d-4280-932a-ccc0e1861c39.3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '44887e51-8447-4536-b94a-4b4b131f3e9c.4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '939dfb2b-4475-45f3-8dcf-f9ad4cdd3e99.5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '07e5e07a-2cc3-4416-a49b-e0aa72f51021.1.jpeg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'fdb85dc5-3cea-43dd-bae3-3eaed16f77d7.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '5fecaa33-5a50-435a-8f5c-f5efe5394980.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '2d6e2d4e-fd7f-4470-a5ae-6a47684a04ec.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, 'd861fc40-d4e6-4ece-b939-6a21f4a4a7a1.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'a10a52b3-32c0-4f40-92bb-1cb4fc031870.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'ab956d6c-1ca2-4559-afcd-507fbe3043d1.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, 'e2c5ee0a-5668-4477-8319-65ae4115a00c.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '86c53f28-f8e8-4bbb-aaa7-d922b31f0b35.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '81e948c0-5fe3-4d36-8b95-b88dcf541f30.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'd4924f20-1e70-4885-a706-2cdeea502e5d.1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '30d2544e-dcc0-4a48-9d98-1c73dca3cc2e.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '3ad56d69-fde6-4eac-bac1-7aa010df61da.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '32b167cf-080c-4be1-b223-00c03f510166.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '975db488-6a00-45e2-ad2b-f71168862b77.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '7ea10c57-fbc7-4833-bf77-c999ca7312f6.1 (1).jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'aa5077b1-7689-470b-91e3-5ec87cea96ba.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'accff2eb-e5b8-41a7-a174-1013a3e69ed6.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'c169d0b8-dc34-40ba-89e6-5c8fa4b028f0.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '875a1bf3-5094-4e86-801d-4b3657894ce6.5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, 'cb55c63e-26a0-4a3f-8bd0-e4fb9853b8e9.1 .jpeg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, 'da04e419-b0dc-4cd5-b177-50e6286fcbc5.2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '5265b5e4-2dfa-408b-889a-f4a05a42648e.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'd3f1619c-a5aa-40c9-b26c-8db21f4fb90d.4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '26b3569c-e1a0-4f83-b87f-028c946eceab.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '1806eb1c-b18b-49c0-9aa8-d77558c7c517.1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '8c7250c5-c9f0-4f69-888a-17421b5269ee.2.jpeg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'd8b935e0-dde0-45c5-bc8e-3b041d2158e6.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '39c61de8-5034-445e-9450-b83a39c4ee81.4.jpeg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '7fac4fe3-e64f-4ef5-96af-84cd6199587f.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '4743bdbf-5715-41f7-8ffe-e8278063cb38.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '26f10914-d68f-49a0-a590-7f8dc1944fc4.2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '569753ee-a710-48ef-bb9b-6d57c033e5d0.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, '0131ee8b-0068-4e19-baff-59fc387c1d42.4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '530dfe96-8543-48f2-96d8-ddd7c3814843.5.jpg', 10);


--
-- TOC entry 3376 (class 0 OID 16639)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-05-11 21:45:18.751663', '24bed229-4d55-4ece-987f-58e3d6ebd57e', 3960, 2, 2, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-05-11 21:45:18.796639', '24bed229-4d55-4ece-987f-58e3d6ebd57e', 33615, 3, 2, 10);


--
-- TOC entry 3368 (class 0 OID 16590)
-- Dependencies: 215
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$MBD5P0bFuxk2wWRtM1zrV.CeecAysTC9IOJ7aWX.jERJ1FtLSyJQe', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$i4U1CMmx0krlgRKW3ELrkuI9GcIGklk8olokJLTqIU/VwWSYqhX26', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'user33', '$2a$10$z6ExM8svRCUaYJfPbryrjuZofYF4Jr.uQTrFa6zdBGSsrcg2eMbpi', 'ROLE_SELLER');


--
-- TOC entry 3374 (class 0 OID 16613)
-- Dependencies: 221
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (2, NULL, 'Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев', 3960, 'Стендмебель - фабрика мебели', 'Стендмебель Комод с ящиками Ксения СТМ для вещей', 'Коледино1', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, '2023-05-09 21:37:43.733693', 'Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129.', 2520, 'Стендмебель Стол письменный Софи СТМ, компьютерный', 'Стендмебель Обувница Джулия СТМ, тумба для обуви', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2023-05-09 21:45:36.20985', 'Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома.', 17995, 'Официальный магазин Polaris', 'Redkey Вертикальный пылесос , моющий пылесос', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (10, '2023-05-09 21:46:34.418901', 'Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель.', 33615, 'ВАЙЛДБЕРРИЗ', 'ATLANT Стиральная машина CMA-80 C 1214-01', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (4, '2023-05-09 21:39:12.131686', 'Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке.', 3000, 'Стендмебель - фабрика мебели', 'Стендмебель Стол письменный Софи СТМ, компьютерный', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2023-05-09 21:40:17.817391', 'Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки', 1450, 'EREMES', 'Eremes Джинсы мужские прямые классические', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2023-05-09 21:41:25.652048', 'Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!', 338, 'UZcotton', 'UZcotton Футболка мужская хлопок спортивная однотонная базовая', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2023-05-09 21:42:22.393442', 'Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой.', 11249, 'ВАЙЛДБЕРРИЗ', 'adidas Куртка', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, '2023-05-09 21:44:33.083328', '5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт.', 10999, 'ВАЙЛДБЕРРИЗ', 'Polaris Планетарный миксер / Кухонная машина PKM 1104', 'Коледино', 3);


--
-- TOC entry 3378 (class 0 OID 16646)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 218
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 50, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 214
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 3, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 3, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 10, true);


--
-- TOC entry 3208 (class 2606 OID 16604)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16611)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16644)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16597)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16651)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16621)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16623)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3221 (class 2606 OID 16652)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3220 (class 2606 OID 16629)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3222 (class 2606 OID 16657)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3219 (class 2606 OID 16624)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3223 (class 2606 OID 16667)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3224 (class 2606 OID 16662)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-05-14 14:46:31

--
-- PostgreSQL database dump complete
--


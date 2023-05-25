--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-25 11:29:40

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

INSERT INTO public.category (id, name) VALUES (3, 'Р‘С‹С‚РѕРІР°СЏ С‚РµС…РЅРёРєР°');
INSERT INTO public.category (id, name) VALUES (1, 'РўРµР»РµС„РѕРЅС‹');
INSERT INTO public.category (id, name) VALUES (2, 'РўРµР»РµРІРёР·РѕСЂС‹');


--
-- TOC entry 3372 (class 0 OID 16606)
-- Dependencies: 219
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (56, '68042dd9-76ba-4f38-bbf5-265471b88ca8.1 .jpeg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (57, 'a8a83bc3-f911-47c5-a0f8-2296d5fe914e.2.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (58, '5a6f9550-7a8a-4d46-9fe0-260a9f15aeb8.3.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (59, '0519d3b8-7adf-41ac-a32a-f1c2c5258631.4.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (60, '500271da-9207-4cfd-a808-69494d6e16af.5.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (61, '80b2963c-26c1-419b-8364-03fe2038ba6d.1.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (62, 'd63355cd-e839-48c8-92ca-06c44bd02d5f.2.jpeg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (63, 'fe7ce7ca-816c-4469-ba7e-edc8372499c9.3.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (64, '99e03799-8a42-4273-8626-91384ae07036.4.jpeg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (65, '109aba30-e475-437d-b3c4-c6fe914cb315.5.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (66, '653b4326-e30e-463e-be05-b75817e09440.1.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (67, 'ef05812c-314d-405b-8923-b63d6e843280.2.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (68, 'cb57634e-6cf5-4510-a178-2a9c5f6b59f3.3.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (69, '51a4af5c-bb9e-402c-821e-ed4ed311d871.4.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (70, 'aafff824-06c6-4694-ab59-b266fe42f223.5.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (71, '18297aed-4c09-4ea3-9e15-789c89a1c81d.1.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (72, '4d468c69-49e9-4ea8-ba1d-26a6458801e6.2.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (73, 'f6df116c-bd3b-4351-9412-86dc675623dd.3.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (74, 'f866b327-ab1a-4059-806a-284406613eaf.4.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (75, '053bf7c3-1456-4642-b28e-233458c17a7e.5.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (76, 'ec0702d1-7e8e-4bf5-a6ba-c3e790ac556c.1.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (77, '89e70f42-0896-420b-8d53-662a2e047f55.2.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (78, '7124e23d-f53d-4183-9a66-0ff23d19b776.3.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (79, 'e418a22a-9875-48a2-a7df-c6d37250526f.4.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (80, 'ff2cb172-bdbc-4633-ac2e-7d8872fb0b0f.5.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (81, '18c14d22-fa7e-4f6f-b410-0fd6c289d3bc.1.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (82, '132cf531-fbfc-4801-9ae2-3ab3d2083523.2.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (83, '1d51cc00-ab18-445a-98e6-70dd0ef7d6e0.3.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (84, 'a995db32-6d55-47d5-a40e-907025834b9c.4.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (85, 'b8628063-fa9d-4c64-9235-04b92c241bad.5.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (86, 'b55d0fa5-2eb1-4df5-8673-3e6346588036.1.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (87, 'ce282203-bfb5-43f8-979c-435d467ae9f5.2.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (88, 'c02383ea-eacf-4d23-8dc6-c78aa2c3d6c1.3.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (89, 'ad06fbcd-36f7-47f2-914b-1ac71ac95b79.4.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (90, 'b5066199-7076-4482-9551-d542cff94158.5.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (91, 'ea75f46a-425d-433e-9cb5-5b9f8d6e7f05.1.jpg', 19);
INSERT INTO public.image (id, file_name, product_id) VALUES (92, '934dd653-2ff0-4915-b2fd-8ec2c88a1f8f.2.jpg', 19);
INSERT INTO public.image (id, file_name, product_id) VALUES (93, '709ad487-de4e-4516-9ee3-85937067045d.3.jpg', 19);
INSERT INTO public.image (id, file_name, product_id) VALUES (94, '5043a4f1-7a7d-4652-a3e8-faa512c141ef.4.jpg', 19);
INSERT INTO public.image (id, file_name, product_id) VALUES (95, '46b17b5a-2710-4cea-87e1-79334255a326.5.jpg', 19);


--
-- TOC entry 3376 (class 0 OID 16639)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2023-05-25 11:06:23.948183', '514141e6-2a66-41cb-9429-1b9901020aa9', 129591, 2, 2, 17);


--
-- TOC entry 3368 (class 0 OID 16590)
-- Dependencies: 215
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$i4U1CMmx0krlgRKW3ELrkuI9GcIGklk8olokJLTqIU/VwWSYqhX26', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$MBD5P0bFuxk2wWRtM1zrV.CeecAysTC9IOJ7aWX.jERJ1FtLSyJQe', 'ROLE_USER');


--
-- TOC entry 3374 (class 0 OID 16613)
-- Dependencies: 221
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (15, NULL, 'Р’С‹ РёС‰РµС‚Рµ СЃС‚РёР»СЊРЅС‹Р№ Рё РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЊРЅС‹Р№ СЃРјР°СЂС‚С„РѕРЅ СЃ РїРѕС‚СЂСЏСЃР°СЋС‰РёРј РІРЅРµС€РЅРёРј РІРёРґРѕРј? РўРѕРіРґР° realme C31 вЂ” СЌС‚Рѕ С‚Рѕ, С‡С‚Рѕ РІР°Рј РЅСѓР¶РЅРѕ. РЎРјР°СЂС‚С„РѕРЅ РѕР±Р»Р°РґР°РµС‚ СЃС‚РёР»СЊРЅС‹Рј РґРёР·Р°Р№РЅРѕРј СЃРѕ СЃРєСЂСѓРіР»РµРЅРЅС‹РјРё РіСЂР°РЅСЏРјРё Рё СѓР»СЊС‚СЂР°С‚РѕРЅРєРёРј РєРѕСЂРїСѓСЃРѕРј С‚РѕР»С‰РёРЅРѕР№ РІСЃРµРіРѕ Р»РёС€СЊ 8,4 РјРј. Р’С‹ С‚Р°РєР¶Рµ РјРѕР¶РµС‚Рµ РЅРµ Р±РµСЃРїРѕРєРѕРёС‚СЊСЃСЏ Рѕ РЅР°РґРµР¶РЅРѕСЃС‚Рё СЃРІРѕРµРіРѕ СЃРјР°СЂС‚С„РѕРЅР°, РІРµРґСЊ РѕРЅ СЃРµСЂС‚РёС„РёС†РёСЂРѕРІР°РЅ РЅРµРјРµС†РєРѕР№ Р»Р°Р±РѕСЂР°С‚РѕСЂРёРµР№ TГњV Rheinland РЅР° СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ СЃС‚СЂРѕРіРёРј СЃС‚Р°РЅРґР°СЂС‚Р°Рј РєР°С‡РµСЃС‚РІР°. РџСЂРѕРґРІРёРЅСѓС‚С‹Р№ 8-СЏРґРµСЂРЅС‹Р№ РїСЂРѕС†РµСЃСЃРѕСЂ UNISOC T612 РѕР±РµСЃРїРµС‡РёРІР°РµС‚ СЃРјР°СЂС‚С„РѕРЅСѓ РѕС‚Р»РёС‡РЅСѓСЋ РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЊРЅРѕСЃС‚СЊ Рё РїР»Р°РІРЅРѕСЃС‚СЊ РІ РёРіСЂР°С…. Рђ Р±Р»Р°РіРѕРґР°СЂСЏ РµРјРєРѕРјСѓ Р°РєРєСѓРјСѓР»СЏС‚РѕСЂСѓ 5000 РјРђС‡ РІС‹ СЃРјРѕР¶РµС‚Рµ РЅР°СЃР»Р°Р¶РґР°С‚СЊСЃСЏ Р»СЋР±РёРјС‹РјРё РёРіСЂР°РјРё РІ С‚РµС‡РµРЅРёРµ РІСЃРµРіРѕ РґРЅСЏ. РЎ Р±РѕР»СЊС€РёРј РґРёСЃРїР»РµРµРј 6,5вЂќ, С†РІРµС‚РѕРїРµСЂРµРґР°С‡Р° РєРѕС‚РѕСЂРѕРіРѕ РёРјРµРµС‚ Р±РѕР»РµРµ 16 РјРёР»Р»РёРѕРЅРѕРІ С†РІРµС‚РѕРІ, Р° РїРѕР»РµР·РЅР°СЏ РїР»РѕС‰Р°РґСЊ СЃРѕСЃС‚Р°РІР»СЏРµС‚ РІРЅСѓС€РёС‚РµР»СЊРЅС‹Рµ 88,7%, РІС‹ РјРѕР¶РµС‚Рµ СЃРјРѕС‚СЂРµС‚СЊ Р»СЋР±РёРјС‹Рµ РІРёРґРµРѕ РІ РІС‹СЃРѕРєРѕРј РєР°С‡РµСЃС‚РІРµ, РЅРµ СѓРїСѓСЃРєР°СЏ РЅРё РѕРґРЅРѕР№ РґРµС‚Р°Р»Рё. Р—Р° С„РѕС‚РѕРІРѕР·РјРѕР¶РЅРѕСЃС‚Рё РІ realme C31 РѕС‚РІРµС‡Р°РµС‚ СЃРѕРІСЂРµРјРµРЅРЅС‹Р№ Р±Р»РѕРє РєР°РјРµСЂ СЃ РёРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅС‹РјРё Р°Р»РіРѕСЂРёС‚РјР°РјРё РѕР±СЂР°Р±РѕС‚РєРё, СЃРѕСЃС‚РѕСЏС‰РёР№ РёР· С‚СЂРµС… РјРѕРґСѓР»РµР№: 13 РњРї, С‡РµСЂРЅРѕ-Р±РµР»РѕРіРѕ Рё РјР°РєСЂРѕРјРѕРґСѓР»РµР№. РЎ С‚Р°РєРѕР№ РїСЂРѕРґРІРёРЅСѓС‚РѕР№ СЃРёСЃС‚РµРјРѕР№ РєР°РјРµСЂ РІР°С€Рё С„РѕС‚РѕРіСЂР°С„РёРё РІСЃРµРіРґР° Р±СѓРґСѓС‚ СЏСЂРєРёРјРё Рё С‡РµС‚РєРёРјРё.', 6855, 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 'РўРµР»РµС„РѕРЅ realme C31', 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (14, NULL, 'РќРѕРІР°СЏ СЃС‚РёСЂР°Р»СЊРЅР°СЏ РјР°С€РёРЅР° ATLANT СЃРµСЂРёРё INTENSE EXPERT РёРјРµРµС‚ СѓРЅРёРєР°Р»СЊРЅС‹Р№ РґРёР·Р°Р№РЅ, РєРѕС‚РѕСЂС‹Р№ РїСЂРµРєСЂР°СЃРЅРѕ РґРѕРїРѕР»РЅРёС‚ Р»СЋР±РѕР№ РёРЅС‚РµСЂСЊРµСЂ СЃРІРѕРёРј РІРЅРµС€РЅРёРј РІРёРґРѕРј. РЎ РїРѕРјРѕС‰СЊСЋ РЅРѕРІС‹С… СЃРµРЅСЃРѕСЂРЅС‹С… С‚РµС…РЅРѕР»РѕРіРёР№ РґРѕСЃС‚Р°С‚РѕС‡РЅРѕ Р»РµРіРєРѕРіРѕ РєР°СЃР°РЅРёСЏ РґР»СЏ РІС‹Р±РѕСЂР° С„СѓРЅРєС†РёР№ Рё РїСЂРѕРіСЂР°РјРј. РЎРІРµС‚РѕРґРёРѕРґРЅС‹Рµ РёРЅРґРёРєР°С‚РѕСЂС‹ Рё СЃРµРіРјРµРЅС‚РЅС‹Р№ РґРёСЃРїР»РµР№ РјР°С€РёРЅС‹ СЂР°Р·РјРµС‰РµРЅС‹ РЅР° РїР°РЅРµР»Рё СѓРїСЂР°РІР»РµРЅРёСЏ РїРѕРґ РЅРµР±РѕР»СЊС€РёРј СѓРіР»РѕРј, С‡С‚Рѕ РѕР±Р»РµРіС‡Р°РµС‚ РІРёР·СѓР°Р»СЊРЅРѕРµ РІРѕСЃРїСЂРёСЏС‚РёРµ РѕС‚РѕР±СЂР°Р¶Р°РµРјРѕР№ РёРЅС„РѕСЂРјР°С†РёРё Рѕ СЂР°Р±РѕС‚Рµ РјР°С€РёРЅС‹. Р‘Р»Р°РіРѕРґР°СЂСЏ РёРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅС‹Рј РїСЂРѕРіСЂР°РјРјР°Рј РѕРЅР° РЅРµ С‚РѕР»СЊРєРѕ РёРЅС‚СѓРёС‚РёРІРЅРѕ РїРѕРЅСЏС‚РЅР° РІ СѓРїСЂР°РІР»РµРЅРёРё, РЅРѕ Рё РѕР±РµСЃРїРµС‡РёРІР°РµС‚ РїСЂРµРІРѕСЃС…РѕРґРЅС‹Рµ СЂРµР·СѓР»СЊС‚Р°С‚С‹ СЃС‚РёСЂРєРё РїСЂРё РЅРёР·РєРѕРј РїРѕС‚СЂРµР±Р»РµРЅРёРё РІРѕРґС‹ Рё СЌР»РµРєС‚СЂРѕСЌРЅРµСЂРіРёРё. РљСЂРѕРјРµ С‚РѕРіРѕ, РґРµР№СЃС‚РІСѓРµС‚ СѓРІРµР»РёС‡РµРЅРЅР°СЏ РіР°СЂР°РЅС‚РёСЏ 5 Р»РµС‚ РЅР° РґРІРёРіР°С‚РµР»СЊ.', 33615, 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 'РЎС‚РёСЂР°Р»СЊРЅР°СЏ РјР°С€РёРЅР° ATLANT CMA-80 C 1214 01', 'РљРѕР»РµРґРёРЅРѕ', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (16, '2023-05-25 10:52:28.58199', 'Xiaomi Redmi Note 10 Pro РїРѕР»СѓС‡РёР» С„Р»Р°РіРјР°РЅСЃРєСѓСЋ РєР°РјРµСЂСѓ РґР»СЏ РєР°С‡РµСЃС‚РІРµРЅРЅС‹С… Рё РґРµС‚Р°Р»РёР·РёСЂРѕРІР°РЅРЅС‹С… СЃРЅРёРјРєРѕРІ. РћСЃРЅРѕРІРЅРѕР№ Р±Р»РѕРє РєР°РјРµСЂС‹ СЃРѕСЃС‚РѕРёС‚ РёР· 4-С… РѕР±СЉРµРєС‚РёРІРѕРІ. Р”Р»СЏ СЃРµР»С„Рё РІ Redmi Note 10 Pro СѓСЃС‚Р°РЅРѕРІР»РµРЅ 16-РјРµРіР°РїРёРєСЃРµР»СЊРЅС‹Р№ РѕР±СЉРµРєС‚РёРІ СЃ РїРѕРґРґРµСЂР¶РєРѕР№ РЅРѕС‡РЅРѕРіРѕ СЂРµР¶РёРјР° Рё РёСЃРєСѓСЃСЃС‚РІРµРЅРЅРѕРіРѕ РёРЅС‚РµР»Р»РµРєС‚Р°. Р”РёСЃРїР»РµР№ Redmi Note 10 Pro РїРѕР»СѓС‡РёР» РґРёР°РіРѕРЅР°Р»СЊ 6,67 РґСЋР№РјРѕРІ Рё СЂР°Р·СЂРµС€РµРЅРёРµ FullHD+. РћРЅ РІС‹РїРѕР»РЅРµРЅ РїРѕ С‚РµС…РЅРѕР»РѕРіРёРё AMOLED СЃ РїРѕРґРґРµСЂР¶РєРѕР№ РґРёРЅР°РјРёС‡РµСЃРєРѕРіРѕ РґРёР°РїР°Р·РѕРЅР° HDR10, РїРѕСЌС‚РѕРјСѓ Р»СЋР±РѕР№ РєРѕРЅС‚РµРЅС‚ РЅР° СЌРєСЂР°РЅРµ Р±СѓРґРµС‚ РІС‹РіР»СЏРґРµС‚СЊ СЃРѕС‡РЅРѕ, СЏСЂРєРѕ Рё РґРµС‚Р°Р»РёР·РёСЂРѕРІР°РЅРѕ. Р”Р»СЏ РїР»Р°РІРЅРѕР№ СЂР°Р±РѕС‚С‹ РґРёСЃРїР»РµСЏ С‡Р°СЃС‚РѕС‚Р° РѕР±РЅРѕРІР»РµРЅРёСЏ РєР°СЂС‚РёРЅРєРё СЃРѕСЃС‚Р°РІР»СЏРµС‚ 120 Р“С†. РРіСЂР°С‚СЊ РІ РёРіСЂС‹, СЃРёРґРµС‚СЊ РІ СЃРѕС†СЃРµС‚СЏС… Рё СЃРјРѕС‚СЂРµС‚СЊ РІРёРґРµРѕ РЅР° С‚Р°РєРѕРј РґРёСЃРїР»РµРµ РѕРґРЅРѕ СѓРґРѕРІРѕР»СЊСЃС‚РІРёРµ. Р’ С‚РµР»РµС„РѕРЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ Р°РєРєСѓРјСѓР»СЏС‚РѕСЂ РµРјРєРѕСЃС‚СЊСЋ 5020 РјРђ С‡, РєРѕС‚РѕСЂРѕРіРѕ С…РІР°С‚Р°РµС‚ РґРѕ РґРІСѓС… РґРЅРµР№ СЂР°Р±РѕС‚С‹ РїСЂРё РЅРѕСЂРјР°Р»СЊРЅРѕРј РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРё. Р‘Р»Р°РіРѕРґР°СЂСЏ РїРѕРґРґРµСЂР¶РєРµ Р±С‹СЃС‚СЂРѕР№ 33 Р’С‚ Р·Р°СЂСЏРґРєРё, СЃРјР°СЂС‚С„РѕРЅ Р·Р°СЂСЏР¶Р°РµС‚СЃСЏ РґРѕ 60% Р·Р° 30 РјРёРЅСѓС‚, С‡С‚РѕР±С‹ Р±С‹СЃС‚СЂРѕ РІРµСЂРЅСѓС‚СЊСЃСЏ Рє СЂР°Р±РѕС‚Рµ РёР»Рё СЂР°Р·РІР»РµС‡РµРЅРёСЋ РЅР° СѓСЃС‚СЂРѕР№СЃС‚РІРµ.', 16000, 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 'РўРµР»РµС„РѕРЅ Xiaomi Redmi Note 10 Pro', 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (17, '2023-05-25 10:53:56.954918', 'Galaxy Z Fold4 РѕС‚Р»РёС‡РЅС‹Р№ РёРЅСЃС‚СЂСѓРјРµРЅС‚ РґР»СЏ РјРЅРѕРіРѕР·Р°РґР°С‡РЅРѕСЃС‚Рё. РџРѕ СЃСѓС‚Рё, СЌС‚Рѕ РґРІР° С‚РµР»РµС„РѕРЅР° РІ РѕРґРЅРѕРј, РІРµСЃ РєРѕС‚РѕСЂРѕРіРѕ РїРѕС‡С‚Рё СЂР°РІРµРЅ РІРµСЃСѓ РјРµРЅРµРµ РіРёР±РєРѕРіРѕ С‚РµР»РµС„РѕРЅР°. РўРѕРЅРєРёР№ РєРѕСЂРїСѓСЃ РІРµР·РґРµ, РєСЂРѕРјРµ СЌРєСЂР°РЅР°, РјРёРЅРёРјРёР·РёСЂРѕРІР°РЅРЅС‹Рµ Р±РµР·РµР»Рё Рё Р»РµРіРєРёРµ РјР°С‚РµСЂРёР°Р»С‹ РґРµР»Р°СЋС‚ СЌС‚РѕС‚ Fold РµС‰Рµ Р±РѕР»РµРµ РєРѕРјРїР°РєС‚РЅС‹Рј.', 129591, 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 'РўРµР»РµС„РѕРЅ Galaxy Z Fold4', 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (18, '2023-05-25 10:55:27.226215', 'РўРѕРІР°СЂ РІРІРµР·РµРЅ РїРѕ РїР°СЂР°Р»Р»РµР»СЊРЅРѕРјСѓ РёРјРїРѕСЂС‚Сѓ (РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РџРѕСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РџСЂР°РІРёС‚РµР»СЊСЃС‚РІР° Р Р¤ в„– 506 РѕС‚ 29.03.2022Рі.), РРќРЎРўР РЈРљР¦РРЇ РќРђ Р РЈРЎРЎРљРћРњ РЇР—Р«РљР• Р’ РљРћРњРџР›Р•РљРўР•. РЎС‚СЂР°РЅР° РїСЂРѕРёР·РІРѕРґСЃС‚РІР°: РџРѕР»СЊС€Р°. Р–Рљ С‚РµР»РµРІРёР·РѕСЂ LG 32LQ63806LC. РќРѕРІС‹Р№ СѓСЂРѕРІРµРЅСЊ С„РѕСЂРјР°С‚Р° HD. Р”РёСЃРїР»РµР№ С‚РµР»РµРІРёР·РѕСЂР° LG Full HD СЃ Р±РѕР»РµРµ Р±РѕРіР°С‚С‹Рј С†РІРµС‚РѕРј РїРѕР·РІРѕР»РёС‚ РІР°Рј РЅР°СЃР»Р°Р¶РґР°С‚СЊСЃСЏ Р»СЋР±РёРјС‹Рј РєРѕРЅС‚РµРЅС‚РѕРј СЃ Р±РѕР»РµРµ СЏСЂРєРѕР№ Рё РµСЃС‚РµСЃС‚РІРµРЅРЅРѕР№ С†РІРµС‚РѕРїРµСЂРµРґР°С‡РµР№. РРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅС‹Р№ РїСЂРѕС†РµСЃСЃРѕСЂ Р°5 Gen 5. РќРµР·Р°Р±С‹РІР°РµРјС‹Рµ РІРїРµС‡Р°С‚Р»РµРЅРёСЏ РѕС‚ РїСЂРѕСЃРјРѕС‚СЂР°. РРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅС‹Р№ РїСЂРѕС†РµСЃСЃРѕСЂ Р°5 Gen5 С‚РµР»РµРІРёР·РѕСЂР° LG Full HD РїРѕР·РІРѕР»СЏРµС‚ РїРѕР»РЅРѕСЃС‚СЊСЋ РїРѕРіСЂСѓР·РёС‚СЊСЃСЏ РІ РёР·РѕР±СЂР°Р¶РµРЅРёРµ. ThinQ AI. РЈРјРЅРµРµ, С‡РµРј РІС‹ РјРѕР¶РµС‚Рµ РїСЂРµРґСЃС‚Р°РІРёС‚СЊ. ThinQ AI РїРѕР·РІРѕР»СЏРµС‚ СѓРґРѕР±РЅРѕ РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ РІРµСЃСЊ С„СѓРЅРєС†РёРѕРЅР°Р» С‚РµР»РµРІРёР·РѕСЂР° LG Full HD: РѕС‚ РіРѕР»РѕСЃРѕРІРѕРіРѕ СѓРїСЂР°РІР»РµРЅРёСЏ РґРѕ РїРµСЂСЃРѕРЅР°Р»РёР·Р°С†РёРё РєРѕРЅС‚РµРЅС‚Р°. РЈРјРЅРµРµ, С‡РµРј РІС‹ РјРѕР¶РµС‚Рµ РїСЂРµРґСЃС‚Р°РІРёС‚СЊ. РџСЂРѕСЃС‚РѕРµ СѓРїСЂР°РІР»РµРЅРёРµ РіРѕР»РѕСЃРѕРј. Р“РѕР»РѕСЃРѕРІРѕРµ СЃРјР°СЂС‚-СѓРїСЂР°РІР»РµРЅРёРµ СЃ РїРѕРјРѕС‰СЊСЋ Google Assistant, Amazon Alexa, Apple AirPlay Рё РґСЂСѓРіРёС… СЂРµС€РµРЅРёР№ РґРµР»Р°РµС‚ СѓРїСЂР°РІР»РµРЅРёРµ С‚РµР»РµРІРёР·РѕСЂРѕРј LG UHD РїСЂРѕС‰Рµ Рё Р±С‹СЃС‚СЂРµРµ.', 28990, 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 'РўРµР»РµРІРёР·РѕСЂ LG 32LQ63806LC', 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (12, NULL, '5 РІ 1: РџР»Р°РЅРµС‚Р°СЂРЅС‹Р№ РјРёРєСЃРµСЂ СЃ 3-РјСЏ РЅР°СЃР°РґРєР°РјРё, Р‘Р»РµРЅРґРµСЂ, РњСЏСЃРѕСЂСѓР±РєР°. РўРµС…РЅРѕР»РѕРіРёСЏ SmartMIX - РїСЂРёР±РѕСЂ Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё РїРѕРґР±РёСЂР°РµС‚ РѕРїС‚РёРјР°Р»СЊРЅСѓСЋ РјРѕС‰РЅРѕСЃС‚СЊ СЂР°Р±РѕС‚С‹ РґР»СЏ РєР°Р¶РґРѕРіРѕ РІРёРґР° Рё РєРѕР»РёС‡РµСЃС‚РІР° РёРЅРіСЂРµРґРёРµРЅС‚РѕРІ. РўРµС…РЅРѕР»РѕРіРёСЏ PROtect+ Р·Р°С‰РёС‚Р° РґРІРёРіР°С‚РµР»СЏ РѕС‚ РїРµСЂРµРіСЂРµРІР°.** РќР°РґС‘Р¶РЅР°СЏ РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ СЃРѕ СЃС‚Р°Р»СЊРЅС‹РјРё С€РµСЃС‚РµСЂРЅСЏРјРё. РџР»Р°РЅРµС‚Р°СЂРЅРѕРµ РІСЂР°С‰РµРЅРёРµ РЅР°СЃР°РґРѕРє. Р§Р°С€Р° РёР· РЅРµСЂР¶Р°РІРµСЋС‰РµР№ СЃС‚Р°Р»Рё. РћР±СЉРµРј С‡Р°С€Рё 5 Р». 6 СЃРєРѕСЂРѕСЃС‚РЅС‹С… СЂРµР¶РёРјРѕРІ. РџР»Р°РІРЅР°СЏ СЂРµРіСѓР»РёСЂРѕРІРєР° СЃРєРѕСЂРѕСЃС‚Рё. РРјРїСѓР»СЊСЃРёРІРЅС‹Р№ СЂРµР¶РёРј. Р’РµРЅС‡РёРє РґР»СЏ РІР·Р±РёРІР°РЅРёСЏ. РќР°СЃР°РґРєР° РґР»СЏ СЃРјРµС€РёРІР°РЅРёСЏ. РљСЂСЋРє РґР»СЏ Р·Р°РјРµС€РёРІР°РЅРёСЏ С‚РµСЃС‚Р°. РљСЂС‹С€РєР° С‡Р°С€Рё РґР»СЏ РґРѕР±Р°РІР»РµРЅРёСЏ РёРЅРіСЂРµРґРёРµРЅС‚РѕРІ. РњСЏСЃРѕСЂСѓР±РєР°: 2 РґРёСЃРєР° РёР· РЅРµСЂР¶Р°РІРµСЋС‰РµР№ СЃС‚Р°Р»Рё (5 Рё 7 РјРј). РљСѓРІС€РёРЅ Р±Р»РµРЅРґРµСЂР° РёР· РІС‹СЃРѕРєРѕРїСЂРѕС‡РЅРѕРіРѕ СЃС‚РµРєР»Р° РѕР±СЉРµРјРѕРј 1,5 Р».РќРёР·РєРёР№ СѓСЂРѕРІРµРЅСЊ С€СѓРјР°. РЎРёСЃС‚РµРјР° Р±РµР·РѕРїР°СЃРЅРѕРіРѕ РІРєР»СЋС‡РµРЅРёСЏ. Р—Р°С‰РёС‚Р° РґРІРёРіР°С‚РµР»СЏ РѕС‚ РїРµСЂРµРіСЂРµРІР°. РћС‚СЃРµРє РґР»СЏ РЅР°РјРѕС‚РєРё СЃРµС‚РµРІРѕРіРѕ С€РЅСѓСЂР°. РџСЂРѕСЂРµР·РёРЅРµРЅРЅС‹Рµ РЅРѕР¶РєРё. РњРѕС‰РЅРѕСЃС‚СЊ: 1100 Р’С‚.', 10999, 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 'РљСѓС…РѕРЅРЅР°СЏ РјР°С€РёРЅР° PKM 1104 (POLARIS)', 'РљРѕР»РµРґРёРЅРѕ', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (13, NULL, 'Р‘РµСЃРїСЂРѕРІРѕРґРЅРѕР№ СЂСѓС‡РЅРѕР№ РїРѕСЂС‚Р°С‚РёРІРЅС‹Р№ РїС‹Р»РµСЃРѕСЃ РѕС‚Р»РёС‡РЅРѕ РїРѕРґРѕР№РґРµС‚ РґР»СЏ СѓР±РѕСЂРєРё СЂР°Р·Р»РёС‡РЅС‹С… РїРѕРјРµС‰РµРЅРёР№. Р’ РєРѕРјРїР»РµРєС‚Рµ РїСЂРёСЃСѓС‚СЃС‚РІСѓСЋС‚ С„РёР»СЊС‚СЂ, РІРµСЂС‚РёРєР°Р»СЊРЅС‹Р№ СЃС‚Р°РєР°РЅ РёР»Рё РєРѕРЅС‚РµР№РЅРµСЂ РґР»СЏ РІРѕРґС‹, РµСЃС‚СЊ РЅР°СЃР°РґРєРё, РЅРѕ РЅР°Р±РѕСЂ РёРґРµС‚ Р±РµР· РјРµС€РєР°. РџСЂРёСЃСѓС‚СЃС‚РІСѓРµС‚ 3 Р±Р°РєР° РґР»СЏ РІРѕРґС‹. Р’ РѕРґРЅРѕРј РІРѕРґР° РѕС‡РёС‰Р°РµС‚СЃСЏ, РІ РґСЂСѓРіРѕРј - С…СЂР°РЅРёС‚СЃСЏ РІ С‡РёСЃС‚РѕРј РІРёРґРµ, Р° РІ С‚СЂРµС‚РёР№ - РїРѕСЃС‚СѓРїР°РµС‚ РіСЂСЏР·РЅР°СЏ. РўР°РєР¶Рµ РµСЃС‚СЊ С„СѓРЅРєС†РёСЏ СЃР°РјРѕРѕС‡РёСЃС‚РєРё РїС‹Р»РµСЃРѕСЃР°. Р СЃСѓС…Р°СЏ, Рё РІР»Р°Р¶РЅР°СЏ СѓР±РѕСЂРєР° СЃ РЅРёРј СЃС‚Р°РЅСѓС‚ РЅР°РјРЅРѕРіРѕ РїСЂРѕС‰Рµ Рё Р±С‹СЃС‚СЂРµРµ. Р©РµС‚РєР° РёРјРµРµС‚ РјРѕС‰РЅС‹Р№ Р°РєРєСѓРјСѓР»СЏС‚РѕСЂ Рё СЂР°Р±РѕС‚Р°РµС‚ РЅР° Р±Р°С‚Р°СЂРµР№РєР°. РљРѕРјРїР°РєС‚РЅС‹Р№ РјРѕР±РёР»СЊРЅС‹Р№ РїС‹Р»РµСЃРѕСЃ РјРѕР¶РµС‚ РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊСЃСЏ РєР°Рє С€РІР°Р±СЂР°. РњРѕСЋС‰РёР№ РїСЂРёР±РѕСЂ С…РѕСЂРѕС€Рѕ РїРѕРґРѕР№РґРµС‚ РґР»СЏ СѓР±РѕСЂРєРё С€РµСЂСЃС‚Рё СЃ РґРёРІР°РЅР°, С‡РёСЃС‚РєРё РєРѕРІСЂРѕРІ, РґР»СЏ РїС‹Р»Рё Рё РіСЂСЏР·Рё, РёР»Рё РїСЂРѕСЃС‚Рѕ РґР»СЏ РјС‹С‚СЊСЏ РїРѕР»РѕРІ. РњРѕР±РёР»СЊРЅС‹Р№ Р°РєРєСѓРјСѓР»СЏС‚РѕСЂРЅС‹Р№ РїС‹Р»РµСЃРѕСЃ РѕС‡РµРЅСЊ С…РѕСЂРѕС€РёР№ РїРѕРјРѕС‰РЅРёРє РґР»СЏ РґРѕРјР°.', 17995, 'РћС„РёС†РёР°Р»СЊРЅС‹Р№ РјР°РіР°Р·РёРЅ Polaris', 'Redkey Р’РµСЂС‚РёРєР°Р»СЊРЅС‹Р№ РјРѕСЋС‰РёР№ РїС‹Р»РµСЃРѕСЃ', 'РљРѕР»РµРґРёРЅРѕ', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (19, '2023-05-25 10:56:43.494274', 'РќР°СЃС‚РѕСЏС‰РёР№ 4K UHD. РќРµСЂРµР°Р»СЊРЅРѕРµ РїРѕРіСЂСѓР¶РµРЅРёРµ. РўРµР»РµРІРёР·РѕСЂС‹ LG UHD РїСЂРµРІРѕСЃС…РѕРґСЏС‚ РІСЃРµ РІР°С€Рё РѕР¶РёРґР°РЅРёСЏ. РќР°СЃР»Р°Р¶РґР°Р№С‚РµСЃСЊ Р¶РёРІС‹Рј РёР·РѕР±СЂР°Р¶РµРЅРёРµРј Рё СЂРµР°Р»РёСЃС‚РёС‡РЅРѕР№ С†РІРµС‚РѕРїРµСЂРµРґР°С‡РµР№ Р±Р»Р°РіРѕРґР°СЂСЏ СѓР»СѓС‡С€РµРЅРЅРѕРјСѓ СЂР°Р·СЂРµС€РµРЅРёСЋ Р·Р° СЃС‡РµС‚ СѓРІРµР»РёС‡РµРЅРЅРѕРіРѕ РєРѕР»РёС‡РµСЃС‚РІР° РїРёРєСЃРµР»РµР№ РІ 4 СЂР°Р·Р° РїРѕ СЃСЂР°РІРЅРµРЅРёСЋ СЃ Full HD. РќРµРїРµСЂРµРґР°РІР°РµРјС‹Рµ РѕС‰СѓС‰РµРЅРёСЏ РѕС‚ РїСЂРѕСЃРјРѕС‚СЂР°. РќР°СЃС‚РѕСЏС‰РёР№ РєРёРЅРѕС‚РµР°С‚СЂ Сѓ РІР°СЃ РґРѕРјР°. FILMMAKER MODE Рё HDR РѕР±РµСЃРїРµС‡РёРІР°СЋС‚ РїРѕС‚СЂСЏСЃР°СЋС‰РёР№ СЌС„С„РµРєС‚ РїРѕРіСЂСѓР¶РµРЅРёСЏ. РџРѕРґРєР»СЋС‡Р°Р№С‚РµСЃСЊ Рє Р»СЋР±РёРјС‹Рј СЃС‚СЂРёРјРёРЅРіРѕРІС‹Рј РїР»Р°С‚С„РѕСЂРјР°Рј : РґРѕСЃС‚СѓРї Рє Apple TV Рё Netflix. РЎРјРѕС‚СЂРёС‚Рµ РЅРѕРІРёРЅРєРё РєРёРЅРѕ, СЃРµСЂРёР°Р»С‹, РґРѕРєСѓРјРµРЅС‚Р°Р»СЊРЅС‹Рµ С„РёР»СЊРјС‹ Рё СЃРїРѕСЂС‚РёРІРЅС‹Рµ СЃРѕСЂРµРІРЅРѕРІР°РЅРёСЏ - РІСЃРµ РІ РѕРґРЅРѕРј РјРµСЃС‚Рµ. РџРѕС‚СЂСЏСЃР°СЋС‰РёР№ СЌС„С„РµРєС‚ РїСЂРёСЃСѓС‚СЃС‚РІРёСЏ: LG UHD СЃС‚Р°РЅРµС‚ СѓРєСЂР°С€РµРЅРёРµРј РґРѕРјР°С€РЅРµРіРѕ РїСЂРѕСЃС‚СЂР°РЅСЃС‚РІР°. Р­СЃС‚РµС‚РёС‡РµСЃРєРёР№ РґРёР·Р°Р№РЅ С‚РѕРЅРєРѕР№ РїР°РЅРµР»Рё Рё СЂР°РјРєРё РїСЂРµРєСЂР°СЃРЅРѕ РґРѕРїРѕР»РЅРёС‚ Р»СЋР±РѕР№ РёРЅС‚РµСЂСЊРµСЂ.', 44992, 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 'РўРµР»РµРІРёР·РѕСЂ LG 50UQ76003LD/50"', 'Р’РђР™Р›Р”Р‘Р•Р Р РР—', 2);


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

SELECT pg_catalog.setval('public.image_id_seq', 95, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 5, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 214
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 5, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 17, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 19, true);


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


-- Completed on 2023-05-25 11:29:40

--
-- PostgreSQL database dump complete
--


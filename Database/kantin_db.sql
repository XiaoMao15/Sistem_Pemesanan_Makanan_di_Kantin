--
-- PostgreSQL database dump
--

\restrict APg9Y06FtocCJkSng2X4nriOSkWhgqk11fSpEza4d3zLw5StOxo8lb4PPBAesKj

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-15 14:29:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 229 (class 1255 OID 16538)
-- Name: copy_to_transaksi(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.copy_to_transaksi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.tbl_transaksi (order_id)
    VALUES (NEW.id); 
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16511)
-- Name: tbl_menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_menu (
    id integer NOT NULL,
    nama_menu character varying(100) NOT NULL,
    harga integer NOT NULL,
    stok integer NOT NULL,
    kategori character varying(50),
    deskripsi text,
    gambar_url text
);


--
-- TOC entry 225 (class 1259 OID 16510)
-- Name: tbl_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbl_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_menu_id_seq OWNED BY public.tbl_menu.id;


--
-- TOC entry 222 (class 1259 OID 16484)
-- Name: tbl_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_order (
    id integer NOT NULL,
    user_id integer,
    total_bayar integer,
    status character varying(50),
    metode_pembayaran character varying(50)
);


--
-- TOC entry 224 (class 1259 OID 16497)
-- Name: tbl_order_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_order_detail (
    id integer NOT NULL,
    order_id integer,
    nama_produk character varying(100),
    harga integer,
    qty integer
);


--
-- TOC entry 223 (class 1259 OID 16496)
-- Name: tbl_order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbl_order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_order_detail_id_seq OWNED BY public.tbl_order_detail.id;


--
-- TOC entry 221 (class 1259 OID 16483)
-- Name: tbl_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_order_id_seq OWNED BY public.tbl_order.id;


--
-- TOC entry 228 (class 1259 OID 16524)
-- Name: tbl_transaksi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_transaksi (
    id integer NOT NULL,
    order_id integer NOT NULL,
    tgl_buat timestamp without time zone DEFAULT now()
);


--
-- TOC entry 227 (class 1259 OID 16523)
-- Name: tbl_transaksi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_transaksi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 227
-- Name: tbl_transaksi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_transaksi_id_seq OWNED BY public.tbl_transaksi.id;


--
-- TOC entry 220 (class 1259 OID 16422)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    nama_lengkap character varying(100),
    role character varying(20) DEFAULT 'customer'::character varying
);


--
-- TOC entry 219 (class 1259 OID 16421)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4881 (class 2604 OID 16514)
-- Name: tbl_menu id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_menu ALTER COLUMN id SET DEFAULT nextval('public.tbl_menu_id_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 16487)
-- Name: tbl_order id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_order ALTER COLUMN id SET DEFAULT nextval('public.tbl_order_id_seq'::regclass);


--
-- TOC entry 4880 (class 2604 OID 16500)
-- Name: tbl_order_detail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_order_detail ALTER COLUMN id SET DEFAULT nextval('public.tbl_order_detail_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 16527)
-- Name: tbl_transaksi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_transaksi ALTER COLUMN id SET DEFAULT nextval('public.tbl_transaksi_id_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 16425)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5054 (class 0 OID 16511)
-- Dependencies: 226
-- Data for Name: tbl_menu; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_menu (id, nama_menu, harga, stok, kategori, deskripsi, gambar_url) FROM stdin;
1	Nasi Goreng Spesial	15000	20	Makanan	Nasi goreng dengan telur dan ayam suwir	https://upload.wikimedia.org/wikipedia/commons/3/3e/Nasi_goreng_indonesia.jpg
3	Mie Ayam Ngawi	12000	20	Makanan	Mie Ayam asli ngawi	https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/9f04c5fa-1afc-4c9b-8c50-a5abdaefe86d_Go-Biz_20220123_163355.jpeg
4	Es Teh Manis mas Amba	5000	30	Minuman	Asli dari sumberny	https://i0.wp.com/travelista.id/wp-content/uploads/2024/12/es-teh.jpg
5	Hot Cappucino	7000	25	Minuman	ini kopi enak	https://d2j6dbq0eux0bg.cloudfront.net/images/75314031/3198072024.jpg
6	Kentang Goreng Ngawi	5000	10	Snack	Kentang Goreng Chef Ipul	https://asset.kompas.com/crops/_uepYTozTTQHWNr3T-Nfb2BKXBY=/0x0:612x408/1200x800/data/photo/2023/08/16/64dc8ef423dcc.jpeg
7	Pudding coklat Pak Hambali	6900	6	Snack	pudding coklat asli ngawi	https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgp9C9aUCynvuowa8sqhhYSfTrIG_5IJiIs7n2dyssE9RrlCYFXsn68RQp-3IAFnMti0aBdG0xLSon2UCsWbWmAbMyZATtdk8qdJCgeifS6xxauSaDd6MT0QUhjV2st0VJKG_ojJE9dFro-mn5MQKzK7KbajdcuigM3TAcBcX5f_t4ErWpHXzj9WhkAriL1/w1200-h630-p-k-no-nu/IMG_20240801_141907.jpg
\.


--
-- TOC entry 5050 (class 0 OID 16484)
-- Dependencies: 222
-- Data for Name: tbl_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_order (id, user_id, total_bayar, status, metode_pembayaran) FROM stdin;
11	2	15000	Selesai	Tunai
10	2	15000	Selesai	QRIS
9	2	15000	Selesai	Tunai
8	1	20000	Selesai	QRIS
7	1	12000	Selesai	Tunai
6	1	20000	Selesai	QRIS
5	1	15000	Selesai	Tunai
4	1	40000	Selesai	\N
3	1	12000	Selesai	\N
2	1	20000	Selesai	\N
1	1	15000	Selesai	\N
12	2	30000	Selesai	Tunai
13	4	5000	Diproses	Tunai
14	2	12000	Diproses	Tunai
15	6	15000	Diproses	Tunai
16	2	15000	Diproses	Tunai
17	2	12000	Diproses	QRIS
18	2	15000	Diproses	Tunai
19	2	24000	Diproses	Tunai
\.


--
-- TOC entry 5052 (class 0 OID 16497)
-- Dependencies: 224
-- Data for Name: tbl_order_detail; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_order_detail (id, order_id, nama_produk, harga, qty) FROM stdin;
1	1	Hot Cappuccino	15000	1
2	2	Nasi Goreng Spesial	20000	1
3	3	Kentang Goreng	12000	1
4	4	Nasi Goreng Spesial	20000	2
5	5	Hot Cappuccino	15000	1
6	6	Nasi Goreng Spesial	20000	1
7	7	Kentang Goreng	12000	1
8	8	Nasi Goreng Spesial	20000	1
9	9	Hot Cappuccino	15000	1
10	10	Hot Cappuccino	15000	1
11	11	Nasi Goreng Spesial	15000	1
12	12	Nasi Goreng Spesial	15000	2
13	13	Kentang Goreng Ngawi	5000	1
14	14	Es Teh Manis mas Amba	5000	1
15	14	Hot Cappucino	7000	1
16	15	Nasi Goreng Spesial	15000	1
17	16	Nasi Goreng Spesial	15000	1
18	17	Mie Ayam Ngawi	12000	1
19	18	Nasi Goreng Spesial	15000	1
20	19	Mie Ayam Ngawi	12000	2
\.


--
-- TOC entry 5056 (class 0 OID 16524)
-- Dependencies: 228
-- Data for Name: tbl_transaksi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_transaksi (id, order_id, tgl_buat) FROM stdin;
1	18	2026-01-14 13:30:59.50626
2	19	2026-01-14 14:52:37.52121
3	20	2026-01-14 20:52:14.942917
\.


--
-- TOC entry 5048 (class 0 OID 16422)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, nama_lengkap, role) FROM stdin;
2	Kayashi	12345	Kagayaku Hoshi	customer
1	Hoshi	12345	Kayashi	admin
4	ipul	12345	IpulX	penjual
6	rusdi ngawi	12345	mas rusdi	customer
\.


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbl_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_menu_id_seq', 7, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbl_order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_order_detail_id_seq', 20, true);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_order_id_seq', 19, true);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 227
-- Name: tbl_transaksi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_transaksi_id_seq', 3, true);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- TOC entry 4893 (class 2606 OID 16522)
-- Name: tbl_menu tbl_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_menu
    ADD CONSTRAINT tbl_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 4891 (class 2606 OID 16503)
-- Name: tbl_order_detail tbl_order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_order_detail
    ADD CONSTRAINT tbl_order_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 16490)
-- Name: tbl_order tbl_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_order
    ADD CONSTRAINT tbl_order_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 16532)
-- Name: tbl_transaksi tbl_transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_transaksi
    ADD CONSTRAINT tbl_transaksi_pkey PRIMARY KEY (id);


--
-- TOC entry 4885 (class 2606 OID 16431)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 16433)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4899 (class 2620 OID 16539)
-- Name: tbl_order_detail trg_auto_insert_transaksi; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_auto_insert_transaksi AFTER INSERT ON public.tbl_order_detail FOR EACH ROW EXECUTE FUNCTION public.copy_to_transaksi();


--
-- TOC entry 4898 (class 2606 OID 16533)
-- Name: tbl_transaksi fk_trx_detail; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_transaksi
    ADD CONSTRAINT fk_trx_detail FOREIGN KEY (order_id) REFERENCES public.tbl_order_detail(id) ON DELETE CASCADE;


--
-- TOC entry 4897 (class 2606 OID 16504)
-- Name: tbl_order_detail tbl_order_detail_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_order_detail
    ADD CONSTRAINT tbl_order_detail_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.tbl_order(id);


--
-- TOC entry 4896 (class 2606 OID 16491)
-- Name: tbl_order tbl_order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_order
    ADD CONSTRAINT tbl_order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2026-01-15 14:29:07

--
-- PostgreSQL database dump complete
--

\unrestrict APg9Y06FtocCJkSng2X4nriOSkWhgqk11fSpEza4d3zLw5StOxo8lb4PPBAesKj


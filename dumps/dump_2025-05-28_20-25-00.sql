--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

-- Started on 2025-05-28 20:25:00 UTC

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16385)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16391)
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    url character varying(500) NOT NULL,
    title character varying(255),
    price_usd integer,
    odometer integer,
    username character varying(100),
    phone_number character varying(30),
    image_url character varying(500),
    images_count integer,
    car_number character varying(50),
    car_vin character varying(100),
    datetime_found timestamp without time zone NOT NULL
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cars_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 218
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- TOC entry 3214 (class 2604 OID 16394)
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- TOC entry 3366 (class 0 OID 16385)
-- Dependencies: 217
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
8a837faba69c
\.


--
-- TOC entry 3368 (class 0 OID 16391)
-- Dependencies: 219
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, url, title, price_usd, odometer, username, phone_number, image_url, images_count, car_number, car_vin, datetime_found) FROM stdin;
1	https://auto.ria.com/uk/auto_bmw_5_series_38359318.html	BMW 5 Series 2013	22000	233000	Андрій	+380753251157	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_5-series__600485066f.jpg	25	Немає номеру	WBAFW11030D271573	2025-05-28 20:15:17.479099
2	https://auto.ria.com/uk/auto_mercedes_benz_gle_class_38223937.html	Mercedes-Benz GLE-Class 2020	64000	48000	Володимир	+380668395560	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_gle-class__596835055f.jpg	63	AI3555IH	4JGFB4KB9LA194337	2025-05-28 20:15:20.03236
3	https://auto.ria.com/uk/auto_porsche_macan_36273607.html	Porsche Macan 2021	59900	35000	Артем	+380933206546	https://cdn2.riastatic.com/photosnew/auto/photo/porsche_macan__598217867f.jpg	28	KI7000EB	WP1ZZZ95ZNLB02460	2025-05-28 20:15:21.170634
4	https://auto.ria.com/uk/auto_zeekr_001_38351371.html	Zeekr 001 2025	50599	1000		+073132817809001900	https://cdn4.riastatic.com/photosnew/auto/photo/zeekr_001__600275849f.jpg	26	Немає номеру		2025-05-28 20:15:21.823983
5	https://auto.ria.com/uk/auto_volkswagen_touareg_38086146.html	Volkswagen Touareg 2021	63500	44000		+380505210007	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_touareg__592973643f.jpg	67	Немає номеру	WVGZZZCRZMD030030	2025-05-28 20:15:33.19383
6	https://auto.ria.com/uk/auto_audi_q8_38361636.html	Audi Q8 2025	116900	1000		+380509519740	https://cdn2.riastatic.com/photosnew/auto/photo/audi_q8__600549257f.jpg	73	Немає номеру		2025-05-28 20:15:39.949653
7	https://auto.ria.com/uk/auto_bmw_x5_38342454.html	BMW X5 2021	67999	33000		+380932220122	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x5__600033894f.jpg	106	Немає номеру	5UXCR6C02N9J18490	2025-05-28 20:15:42.322066
8	https://auto.ria.com/uk/auto_bmw_ix_38317810.html	BMW iX 2022	54900	46000		+380505210007	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_ix__599374699f.jpg	67	Немає номеру	WBY11CF050CK05305	2025-05-28 20:15:43.084656
9	https://auto.ria.com/uk/auto_renault_megane_38185034.html	Renault Megane 2016	11500	216000	Богдан	+380665934017	https://cdn3.riastatic.com/photosnew/auto/photo/renault_megane__595752008f.jpg	9	KA2891EH	VF1RFB00656113715	2025-05-28 20:15:44.185178
10	https://auto.ria.com/uk/auto_jeep_cherokee_38361070.html	Jeep Cherokee 2017	13450	143000	Микола	+380973556361	https://cdn0.riastatic.com/photosnew/auto/photo/jeep_cherokee__600535880f.jpg	56	Немає номеру		2025-05-28 20:15:46.434874
11	https://auto.ria.com/uk/auto_mitsubishi_outlander_38296837.html	Mitsubishi Outlander 2013	12499	198000	Ivan	+380935199905	https://cdn1.riastatic.com/photosnew/auto/photo/mitsubishi_outlander__598805376f.jpg	112	Немає номеру		2025-05-28 20:15:49.748525
12	https://auto.ria.com/uk/auto_porsche_cayenne_37990522.html	Porsche Cayenne 2020	63000	63000	Петя Захарчук	+380633535616	https://cdn3.riastatic.com/photosnew/auto/photo/porsche_cayenne__598609008f.jpg	33	Немає номеру	WP1AA2AY1LDA06399	2025-05-28 20:15:56.477217
13	https://auto.ria.com/uk/auto_tesla_model_s_38363147.html	Tesla Model S 2016	16000	117000	Денис Володимирович Денисенко	+380669598058	https://cdn1.riastatic.com/photosnew/auto/photo/tesla_model-s__600590836f.jpg	16	AA2343ZA	5YJSA1E26GF158778	2025-05-28 20:15:58.655378
14	https://auto.ria.com/uk/auto_renault_megane_38311767.html	Renault Megane 2012	6300	265000	Іван Вікторович	+380982351200	https://cdn4.riastatic.com/photosnew/auto/photo/renault_megane__599220504f.jpg	9	Немає номеру	VF1KZ090347358172	2025-05-28 20:16:04.824974
15	https://auto.ria.com/uk/auto_volkswagen_id_4_38172800.html	Volkswagen ID.4 2022	26650	20000	Юрій	+380977959712	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_id-4__595500729f.jpg	24	AA5770YA	LFVVB9E6xN5xxxx48	2025-05-28 20:16:04.859407
16	https://auto.ria.com/uk/auto_audi_a5_38177615.html	Audi A5 2012	11900	122000	Алексей	+	https://cdn0.riastatic.com/photosnew/auto/photo/audi_a5__595565655f.jpg	30	Немає номеру	WAUZZZ8T4CA045227	2025-05-28 20:16:05.284848
17	https://auto.ria.com/uk/auto_audi_rs_q8_38302321.html	Audi RS Q8 2020	254000	50000		+093688583110001900	https://cdn3.riastatic.com/photosnew/auto/photo/audi_rs-q8__598956038f.jpg	37	Немає номеру	WUAZZZF1xLDxxxx87	2025-05-28 20:16:06.830654
18	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38198412.html	Mercedes-Benz Sprinter 2008	10700	300000	Андрій	+380969512707	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__596117492f.jpg	16	Немає номеру		2025-05-28 20:16:17.593487
19	https://auto.ria.com/uk/auto_audi_a6_38348118.html	Audi A6 2013	17500	163000	Іван	+063170774819002100	https://cdn4.riastatic.com/photosnew/auto/photo/audi_a6__600195239f.jpg	48	AI8890MA	WAUHGAFC3EN087292	2025-05-28 20:16:21.183416
20	https://auto.ria.com/uk/auto_bmw_8_series_37686191.html	BMW 8 Series 2019	74999	44000		+380955050006	https://cdn2.riastatic.com/photosnew/auto/photo/bmw_8-series__581806307f.jpg	234	Немає номеру	WBAGV4C00LCD87557	2025-05-28 20:16:21.742718
21	https://auto.ria.com/uk/auto_volkswagen_golf_38209977.html	Volkswagen Golf 2016	11800	279000	Иван	+067	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_golf__596410006f.jpg	14	AA5884XH	WVWZZZAUZGP583086	2025-05-28 20:16:23.872722
22	https://auto.ria.com/uk/auto_ford_edge_38107377.html	Ford Edge 2018	26000	52000	Іван	+380502356425	https://cdn1.riastatic.com/photosnew/auto/photo/ford_edge__593574276f.jpg	10	Немає номеру		2025-05-28 20:16:28.24016
23	https://auto.ria.com/uk/auto_skoda_kodiaq_38305465.html	Skoda Kodiaq 2021	36000	59000	Ксенія	+380504163208	https://cdn4.riastatic.com/photosnew/auto/photo/skoda_kodiaq__599035374f.jpg	14	AI5968KX	TMBLD6NS5MB401424	2025-05-28 20:16:36.245234
24	https://auto.ria.com/uk/auto_volkswagen_passat_38212333.html	Volkswagen Passat 2010	6900	282000	Руслан Віталійович Матвійчук	+380975469195	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_passat__596514827f.jpg	9	BX7674IA	WVWZZZ3CZAE093062	2025-05-28 20:16:36.364552
25	https://auto.ria.com/uk/auto_mercedes_benz_s_class_38353073.html	Mercedes-Benz S-Class 2012	12200	223000	Сергей	+	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_s-class__600315280f.jpg	41	Немає номеру	WDD2211941A454169	2025-05-28 20:16:37.399758
26	https://auto.ria.com/uk/auto_volvo_xc90_38339008.html	Volvo XC90 2023	59291	24000		+380936270995	https://cdn4.riastatic.com/photosnew/auto/photo/volvo_xc90__600425784f.jpg	23	Немає номеру	YV1LFL1V2R1215002	2025-05-28 20:16:46.80329
27	https://auto.ria.com/uk/auto_toyota_land_cruiser_36337969.html	Toyota Land Cruiser 2021	80000	90000	Vasil	+380961295747	https://cdn2.riastatic.com/photosnew/auto/photo/toyota_land-cruiser__544646572f.jpg	28	Немає номеру	JTMAAABJ304000807	2025-05-28 20:16:49.718676
28	https://auto.ria.com/uk/auto_porsche_cayenne_38301045.html	Porsche Cayenne 2020	77700	127000	Сергій Станіславович	+067314043609002100	https://cdn0.riastatic.com/photosnew/auto/photo/porsche_cayenne__598903225f.jpg	218	Немає номеру	WP1ZZZ9YZLDA30886	2025-05-28 20:16:50.555461
29	https://auto.ria.com/uk/auto_audi_a6_38326748.html	Audi A6 2015	22500	158000	Олександр Сікалюк	+380950409562	https://cdn0.riastatic.com/photosnew/auto/photo/audi_a6__600189675f.jpg	21	AI0240TA	WAUGFAFC9GN011061	2025-05-28 20:16:54.979623
30	https://auto.ria.com/uk/auto_man_tgx_38050777.html	MAN TGX 2013	17400	546000	Сергій Кравчук	+380964300007	https://cdn1.riastatic.com/photosnew/auto/photo/man_tgx__591983751f.jpg	19	Немає номеру	WMA24XZZ2DW179994	2025-05-28 20:17:06.39517
50	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38302896.html	Mercedes-Benz Sprinter 2011	24500	200000	Юлія	+380969513734	https://cdn1.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__598969876f.jpg	21	Немає номеру		2025-05-28 20:18:18.223157
55	https://auto.ria.com/uk/auto_bmw_x5_38359623.html	BMW X5 2017	45000	123000	Sergy	+	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_x5__600494186f.jpg	58	KA4490KX	5UXKR0C31H0X81691	2025-05-28 20:18:34.08044
31	https://auto.ria.com/uk/auto_tesla_model_s_38263705.html	Tesla Model S 2022	32900	86000	Олег	+380964107777	https://cdn3.riastatic.com/photosnew/auto/photo/tesla_model-s__597921988f.jpg	20	BC5007YA	5YJSA1E58NF479194	2025-05-28 20:17:06.962
34	https://auto.ria.com/uk/auto_land_rover_range_rover_velar_38325532.html	Land Rover Range Rover Velar 2018	47500	101000	Юлечка	+	https://cdn0.riastatic.com/photosnew/auto/photo/land-rover_range-rover-velar__599573025f.jpg	55	AA5666XC	SALYA2BKxKAxxxx68	2025-05-28 20:17:16.658411
37	https://auto.ria.com/uk/auto_toyota_corolla_38361497.html	Toyota Corolla 2021	21529	49000		+067934343309001800	https://cdn3.riastatic.com/photosnew/auto/photo/toyota_corolla__600547103f.jpg	20	KA9771EC	NMTBZ4BEX0R093488	2025-05-28 20:17:29.540909
39	https://auto.ria.com/uk/auto_porsche_cayenne_38081685.html	Porsche Cayenne 2016	27000	125000	Роберт	+380635241182	https://cdn3.riastatic.com/photosnew/auto/photo/porsche_cayenne__592852848f.jpg	16	KA8376MP	WP1AA2A26HKA86779	2025-05-28 20:17:38.961075
45	https://auto.ria.com/uk/auto_volvo_xc90_37930373.html	Volvo XC90 2020	56000	111000	Сергій	+380672301109	https://cdn2.riastatic.com/photosnew/auto/photo/volvo_xc90__599986727f.jpg	20	Немає номеру	YV1LFBMUDM1706567	2025-05-28 20:18:01.984528
51	https://auto.ria.com/uk/auto_toyota_land_cruiser_38217444.html	Toyota Land Cruiser 2020	68000	82000		+380955050006	https://cdn2.riastatic.com/photosnew/auto/photo/toyota_land-cruiser__596650997f.jpg	121	OO0009OO	JTMCV05J304322043	2025-05-28 20:18:23.405187
57	https://auto.ria.com/uk/auto_audi_q7_38363108.html	Audi Q7 2011	15350	225000	Ім’я не вказане	+380991167777	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q7__600590108f.jpg	99	AC2011MH	WA1LMAFExCDxxxx33	2025-05-28 20:18:38.824307
32	https://auto.ria.com/uk/auto_bmw_x6_38274911.html	BMW X6 2022	75900	37000	Игорь	+380979116474	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x6__598234295f.jpg	8	AB1686KT	5UXCY6C09N9N27833	2025-05-28 20:17:10.61363
36	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38285633.html	Mercedes-Benz Sprinter 2021	29750	94000	Роман	+380684791827	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__598525352f.jpg	146	Немає номеру		2025-05-28 20:17:26.179417
40	https://auto.ria.com/uk/auto_nissan_qashqai_38302008.html	Nissan Qashqai 2013	11950	183000	Taras	+380933031866	https://cdn2.riastatic.com/photosnew/auto/photo/nissan_qashqai__598945377f.jpg	165	Немає номеру		2025-05-28 20:17:39.419634
42	https://auto.ria.com/uk/auto_skoda_kodiaq_38341009.html	Skoda Kodiaq 2021	26900	241000	Александр	+380505577773	https://cdn0.riastatic.com/photosnew/auto/photo/skoda_kodiaq__600077000f.jpg	28	BX2547ET	TMBLN6NS7MB401373	2025-05-28 20:17:50.584675
48	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38173368.html	Mercedes-Benz Sprinter 2022	34950	239000	Роман	+380684791827	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__595438185f.jpg	136	Немає номеру		2025-05-28 20:18:15.085671
54	https://auto.ria.com/uk/auto_mercedes_benz_gls_class_38228444.html	Mercedes-Benz GLS-Class 2017	42400	161000	Данило	+380987324442	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_gls-class__596947443f.jpg	32	AX6474OT	WDC16682x1Bxxxx16	2025-05-28 20:18:33.796624
33	https://auto.ria.com/uk/auto_bmw_x5_38303051.html	BMW X5 2019	57499	95000	Антон Игоревич Ковтуненко	+380504020040	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x5__598975499f.jpg	21	KX0200AC	5UXCR6C54KLL22296	2025-05-28 20:17:12.368562
35	https://auto.ria.com/uk/auto_volkswagen_passat_38143086.html	Volkswagen Passat 2020	21555	167000	Віталій	+380675803366	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_passat__594566743f.jpg	39	KA1393MM	WVWZZZ3CZME034068	2025-05-28 20:17:25.429231
44	https://auto.ria.com/uk/auto_audi_q5_37424087.html	Audi Q5 2020	34500	73000	Александр	+066	https://cdn1.riastatic.com/photosnew/auto/photo/audi_q5__574573016f.jpg	32	BM1069EK	WA1BAAFYxM2xxxx77	2025-05-28 20:17:59.895372
47	https://auto.ria.com/uk/auto_lexus_gx_38319534.html	Lexus GX 2020	58500	160000	Александр	+380980843824	https://cdn0.riastatic.com/photosnew/auto/photo/lexus_gx__599418365f.jpg	27	AI0074IA	JTJJM7FX005263224	2025-05-28 20:18:14.715583
52	https://auto.ria.com/uk/auto_audi_q5_38357547.html	Audi Q5 2018	28700	87000		\N	https://cdn4.riastatic.com/photosnew/auto/photo/audi_q5__600438519f.jpg	51	Немає номеру		2025-05-28 20:18:23.503394
56	https://auto.ria.com/uk/auto_toyota_corolla_37422611.html	Toyota Corolla 2008	6850	208000	Валера	+380677080657	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_corolla__590461545f.jpg	24	KA4926BI	JTNBV56E40J058547	2025-05-28 20:18:37.910828
38	https://auto.ria.com/uk/auto_bmw_x5_38225059.html	BMW X5 2014	28800	140000	Роман Кравченко	\N	https://cdn2.riastatic.com/photosnew/auto/photo/bmw_x5__596861837f.jpg	15	Немає номеру	5UXKR0C56F0K66121	2025-05-28 20:17:33.908365
41	https://auto.ria.com/uk/auto_toyota_camry_38345082.html	Toyota Camry 2019	23999	147000		\N	https://cdn1.riastatic.com/photosnew/auto/photo/toyota_camry__600113631f.jpg	36	Немає номеру	JTNBF4HK703035732	2025-05-28 20:17:39.832291
43	https://auto.ria.com/uk/auto_zeekr_001_38098155.html	Zeekr 001 2023	53900	13000	Сергей	+380933777333	https://cdn3.riastatic.com/photosnew/auto/photo/zeekr_001__593297163f.jpg	29	Немає номеру	L6T79P2NxPPxxxx52	2025-05-28 20:17:52.70344
46	https://auto.ria.com/uk/auto_toyota_corolla_31080551.html	Toyota Corolla 2008	7100	225000	Андрій	+380633540514	https://cdn1.riastatic.com/photosnew/auto/photo/toyota_corolla__590003231f.jpg	18	KA1836HK	JTNBV56Ex0Jxxxx70	2025-05-28 20:18:04.828177
49	https://auto.ria.com/uk/auto_toyota_camry_37783094.html	Toyota Camry 2020	26500	36000	Андрій	+380679753350	https://cdn3.riastatic.com/photosnew/auto/photo/toyota_camry__584458793f.jpg	23	BO1500EO	JTNBF4HKX03054677	2025-05-28 20:18:16.642767
53	https://auto.ria.com/uk/auto_bmw_x5_38346285.html	BMW X5 2024	99999	35000	Олександр	+	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_x5__600146411f.jpg	96	Немає номеру		2025-05-28 20:18:32.495509
58	https://auto.ria.com/uk/auto_mazda_3_38157392.html	Mazda 3 2008	5500	168000	Сергей Алексеевич	+380996151980	https://cdn1.riastatic.com/photosnew/auto/photo/mazda_3__594973906f.jpg	12	AX6412OP	JMZBK12Z201790751	2025-05-28 20:18:47.843047
59	https://auto.ria.com/uk/auto_renault_megane_38273445.html	Renault Megane 2017	16250	136000	Микола	+380505818576	https://cdn2.riastatic.com/photosnew/auto/photo/renault_megane__598197602f.jpg	99	Немає номеру		2025-05-28 20:18:48.161336
60	https://auto.ria.com/uk/auto_audi_e_tron_38355080.html	Audi e-tron 2024	69000	11000	Олег	+380930181315	https://cdn3.riastatic.com/photosnew/auto/photo/audi_e-tron__600375753f.jpg	39	Немає номеру		2025-05-28 20:18:48.23854
61	https://auto.ria.com/uk/auto_hyundai_santa_fe_37990009.html	Hyundai Santa FE 2013	11400	236000	Slavik	+380679509607	https://cdn1.riastatic.com/photosnew/auto/photo/hyundai_santa-fe__599483056f.jpg	51	CA9403KI	5XYZT3LBXDG075480	2025-05-28 20:18:54.783568
62	https://auto.ria.com/uk/auto_volkswagen_tiguan_38302113.html	Volkswagen Tiguan 2019	22999	32000	Яна	+380938234912	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__598948023f.jpg	52	Немає номеру	3VV3B7AX6KM197379	2025-05-28 20:19:04.718195
63	https://auto.ria.com/uk/auto_subaru_forester_38362896.html	Subaru Forester 2015	10350	236000	Ім’я не вказане	+380991167777	https://cdn0.riastatic.com/photosnew/auto/photo/subaru_forester__600584230f.jpg	59	KA1830AX	JF2SJAFC2GH484537	2025-05-28 20:19:04.727375
64	https://auto.ria.com/uk/auto_hyundai_tucson_38322248.html	Hyundai Tucson 2021	25999	99000	Володимир	+380960700088	https://cdn4.riastatic.com/photosnew/auto/photo/hyundai_tucson__599487494f.jpg	63	AC3341HT	TMAJD81BGMJ140940	2025-05-28 20:19:05.702691
65	https://auto.ria.com/uk/auto_volkswagen_touareg_38344260.html	Volkswagen Touareg 2022	68500	83000	Стас	+380960620733	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_touareg__600090104f.jpg	93	Немає номеру		2025-05-28 20:19:06.221245
66	https://auto.ria.com/uk/auto_bmw_x5_38343398.html	BMW X5 2018	58900	184000	Sasha	+380953284046	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x5__600075525f.jpg	23	AH0405PB	WBACV61010LJ65132	2025-05-28 20:19:12.081964
67	https://auto.ria.com/uk/auto_jaguar_xe_38200918.html	Jaguar XE 2019	22000	58000	Юрій	+380953036403	https://cdn2.riastatic.com/photosnew/auto/photo/jaguar_xe__600065007f.jpg	12	AA2473TA	SAJAJ4FX7LCP56071	2025-05-28 20:19:14.360601
68	https://auto.ria.com/uk/auto_infiniti_qx50_38298787.html	Infiniti QX50 2018	37000	46000	Aleksandr Getmanyuk	+380935107777	https://cdn3.riastatic.com/photosnew/auto/photo/infiniti_qx50__598860333f.jpg	14	AT4059HM	3PCMANJ55Z0551728	2025-05-28 20:19:15.761745
69	https://auto.ria.com/uk/auto_tesla_model_y_38195360.html	Tesla Model Y 2024	35500	14000	Даниїл Вячеславович Христюк	+380631683038	https://cdn2.riastatic.com/photosnew/auto/photo/tesla_model-y__596015597f.jpg	40	Немає номеру		2025-05-28 20:19:16.021318
70	https://auto.ria.com/uk/auto_mitsubishi_lancer_38146915.html	Mitsubishi Lancer 2007	4600	261000	Сергій Сергійович Лукашевич	+	https://cdn4.riastatic.com/photosnew/auto/photo/mitsubishi_lancer__594672359f.jpg	14	KA6378OT	JMBSNCS3A7U017412	2025-05-28 20:19:16.916218
71	https://auto.ria.com/uk/auto_volvo_v50_38334136.html	Volvo V50 2012	8750	195000	Taras	+380933031866	https://cdn2.riastatic.com/photosnew/auto/photo/volvo_v50__599801707f.jpg	163	Немає номеру		2025-05-28 20:19:26.959991
72	https://auto.ria.com/uk/auto_toyota_c_hr_38360169.html	Toyota C-HR 2024	42353	12000	Наталія Громада	+380505343359	https://cdn2.riastatic.com/photosnew/auto/photo/toyota_c-hr__600508377f.jpg	10	BC1744TI	JTPACABA50R008150	2025-05-28 20:19:30.943847
73	https://auto.ria.com/uk/auto_toyota_camry_38301960.html	Toyota Camry 2021	26940	85000	Максим	+380509527301	https://cdn4.riastatic.com/photosnew/auto/photo/toyota_camry__598945509f.jpg	14	AA9494BP	JTNB13HK303133486	2025-05-28 20:19:32.553651
74	https://auto.ria.com/uk/auto_bmw_5_series_38279503.html	BMW 5 Series 2017	25950	115000	Володя	+063	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_5-series__598365879f.jpg	41	AA6810AA	WBAJA510X0G874860	2025-05-28 20:19:32.800709
75	https://auto.ria.com/uk/auto_audi_a4_38314763.html	Audi A4 2021	36500	37000	Дмитрий	+097724999108002200	https://cdn2.riastatic.com/photosnew/auto/photo/audi_a4__599292407f.jpg	84	Немає номеру	WAUZZZF4xMNxxxx96	2025-05-28 20:19:44.674882
76	https://auto.ria.com/uk/auto_buick_encore_38360976.html	Buick Encore 2018	10800	57000	Alex	+380634267173	https://cdn2.riastatic.com/photosnew/auto/photo/buick_encore__600533247f.jpg	31	BI2679II	KL4CJASB9KB751937	2025-05-28 20:19:46.564368
77	https://auto.ria.com/uk/auto_bmw_x6_38261297.html	BMW X6 2024	130999	1000		+380676942858	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x6__597858870f.jpg	70	Немає номеру		2025-05-28 20:19:52.024478
78	https://auto.ria.com/uk/auto_nissan_rogue_38272030.html	Nissan Rogue 2018	14950	218000	Дмитро Діма	+380506114325	https://cdn1.riastatic.com/photosnew/auto/photo/nissan_rogue__598819296f.jpg	32	Немає номеру		2025-05-28 20:19:53.540561
79	https://auto.ria.com/uk/auto_land_rover_range_rover_evoque_38343192.html	Land Rover Range Rover Evoque 2013	19800	73000		+380932220122	https://cdn2.riastatic.com/photosnew/auto/photo/land-rover_range-rover-evoque__600056547f.jpg	74	Немає номеру	SALVA2BG3DH771741	2025-05-28 20:19:55.05834
80	https://auto.ria.com/uk/auto_skoda_kodiaq_38269116.html	Skoda Kodiaq 2022	38100	42000	Іван	+380930160771	https://cdn4.riastatic.com/photosnew/auto/photo/skoda_kodiaq__598074289f.jpg	26	BX9955CT	TMBLD6NS7NB400809	2025-05-28 20:19:56.146646
81	https://auto.ria.com/uk/auto_audi_a4_38347239.html	Audi A4 2016	18950	198000	Максим	+380674745005	https://cdn1.riastatic.com/photosnew/auto/photo/audi_a4__600171086f.jpg	27	BO1502EX	WAUFNAF4xHNxxxx04	2025-05-28 20:20:04.766132
82	https://auto.ria.com/uk/auto_bentley_flying_spur_38252946.html	Bentley Flying Spur 2020	250000	28000	Andrii	+380950955040	https://cdn0.riastatic.com/photosnew/auto/photo/bentley_flying-spur__597642525f.jpg	28	KA0008KB	SCBBS53S5LC082276	2025-05-28 20:20:05.280252
92	https://auto.ria.com/uk/auto_zeekr_001_38304139.html	Zeekr 001 2025	116999	1000		+073132817809001900	https://cdn1.riastatic.com/photosnew/auto/photo/zeekr_001__599005941f.jpg	22	Немає номеру		2025-05-28 20:20:33.803692
99	https://auto.ria.com/uk/auto_bmw_x5_38246377.html	BMW X5 2019	70299	115000	Олексій	+380685989999	https://cdn2.riastatic.com/photosnew/auto/photo/bmw_x5__597470657f.jpg	26	Немає номеру	WBACV610xLLxxxx23	2025-05-28 20:21:02.30029
104	https://auto.ria.com/uk/auto_audi_q5_38257908.html	Audi Q5 2021	47500	65000		+380955050006	https://cdn2.riastatic.com/photosnew/auto/photo/audi_q5__597768292f.jpg	131	BH8855OI	WA1E2AFY1M2000953	2025-05-28 20:21:16.34226
106	https://auto.ria.com/uk/auto_volkswagen_caddy_36734374.html	Volkswagen Caddy 2014	16500	252000	Руслан Юрійович Минюк	+380508623296	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_caddy__555465957f.jpg	36	AC9568HH	WV2ZZZ2KZFX065664	2025-05-28 20:21:24.289941
109	https://auto.ria.com/uk/auto_audi_q7_38300848.html	Audi Q7 2016	34600	251000	Геннадій Павлович	+380668435222	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q7__598913288f.jpg	74	CE4138EX	WAUZZZ4M1GD052087	2025-05-28 20:21:37.412446
113	https://auto.ria.com/uk/auto_volkswagen_tiguan_38211187.html	Volkswagen Tiguan 2013	14500	173000	Кирило Олександрович Бондар	+380634551197	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__596868553f.jpg	22	KA8774BB	WVGZZZ5NZDW089264	2025-05-28 20:21:47.434956
118	https://auto.ria.com/uk/auto_bmw_7_series_37798685.html	BMW 7 Series 2019	59000	84000	Сергей	+380971668331	https://cdn2.riastatic.com/photosnew/auto/photo/bmw_7-series__595636557f.jpg	62	Немає номеру	WBA7U2C0xLGxxxx34	2025-05-28 20:22:01.961468
122	https://auto.ria.com/uk/auto_audi_a4_38358753.html	Audi A4 2022	34000	25000	Вадим	+380634045544	https://cdn0.riastatic.com/photosnew/auto/photo/audi_a4__600471565f.jpg	17	Немає номеру	WAUEAAF4XPA030840	2025-05-28 20:22:15.979085
128	https://auto.ria.com/uk/auto_porsche_cayenne_37505318.html	Porsche Cayenne 2012	17555	121000	Віталій	+380675803366	https://cdn1.riastatic.com/photosnew/auto/photo/porsche_cayenne__576775666f.jpg	50	BO4515EI	WP1AE2A29CLA92762	2025-05-28 20:22:31.583136
133	https://auto.ria.com/uk/auto_volkswagen_golf_gti_38261455.html	Volkswagen Golf GTI 2021	32000	80000	Кирилл	+380674096422	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_golf-gti__598659159f.jpg	19	KA2353EC	WVWZZZCDZMW093473	2025-05-28 20:22:45.847592
83	https://auto.ria.com/uk/auto_bmw_x5_38222863.html	BMW X5 2022	59999	53000	Ім’я не вказане	+380935528241	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x5__596797915f.jpg	28	CA8885CT	5UXCR6C0XP9P43285	2025-05-28 20:20:07.697518
87	https://auto.ria.com/uk/auto_volkswagen_transporter_38353159.html	Volkswagen Transporter 2018	23700	212000	Андрій	+380638618040	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_transporter__600322368f.jpg	30	Немає номеру		2025-05-28 20:20:24.030821
96	https://auto.ria.com/uk/auto_audi_a4_37753730.html	Audi A4 2015	14100	144000	Denis Sokyra	+380937031253	https://cdn0.riastatic.com/photosnew/auto/photo/audi_a4__600547780f.jpg	36	AA9398HH	WAUFFAFL2FN043229	2025-05-28 20:20:45.025769
98	https://auto.ria.com/uk/auto_tesla_model_x_38353063.html	Tesla Model X 2018	24500	90000	Slavik	+380632156773	https://cdn2.riastatic.com/photosnew/auto/photo/tesla_model-x__600321147f.jpg	27	Немає номеру		2025-05-28 20:20:59.608807
103	https://auto.ria.com/uk/auto_mercedes_benz_v_class_37142639.html	Mercedes-Benz V-Class 2022	83555	75000	Віталій	+380675803366	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_v-class__591530534f.jpg	69	KA3703MI	W1V44781314135081	2025-05-28 20:21:16.300098
107	https://auto.ria.com/uk/auto_bmw_x2_37873765.html	BMW X2 2018	28500	92000	Олександр Сергійович Жовтий	+380957197813	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x2__586986754f.jpg	47	KA5838MO	WBXYJ5C37JEF76889	2025-05-28 20:21:25.290494
111	https://auto.ria.com/uk/auto_audi_q5_38239513.html	Audi Q5 2023	61000	4000	Олексій	+	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q5__597275008f.jpg	21	KA5524PA	WA1F2AFY9R2022226	2025-05-28 20:21:37.461249
116	https://auto.ria.com/uk/auto_volkswagen_passat_38352474.html	Volkswagen Passat 2020	22599	171000		+050602660508002200	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_passat__600304304f.jpg	102	AC6317HH	WVWZZZ3CZME029480	2025-05-28 20:21:54.524607
121	https://auto.ria.com/uk/auto_nissan_rogue_38142495.html	Nissan Rogue 2023	27100	34000	Євген	+380976329952	https://cdn4.riastatic.com/photosnew/auto/photo/nissan_rogue__598524774f.jpg	43	KA5862PA	5N1BT3CB5PC826555	2025-05-28 20:22:13.84272
126	https://auto.ria.com/uk/auto_audi_e_tron_38314106.html	Audi e-tron 2020	31000	86000	Олександр Вереша	+380994941265	https://cdn4.riastatic.com/photosnew/auto/photo/audi_e-tron__599329729f.jpg	26	Немає номеру	WAUZZZGE3MB017918	2025-05-28 20:22:23.772662
130	https://auto.ria.com/uk/auto_ford_focus_38124669.html	Ford Focus 2017	6500	160000		+050957428909002000	https://cdn3.riastatic.com/photosnew/auto/photo/ford_focus__594055513f.jpg	27	CA8890KH	WF06XXGCC6HB32794	2025-05-28 20:22:38.742398
84	https://auto.ria.com/uk/auto_mercedes_benz_s_class_38343593.html	Mercedes-Benz S-Class 2014	32999	180000	Ім’я не вказане	+380960001192	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_s-class__600070763f.jpg	16	KA0905MA	WDDUG8FB8FA078121	2025-05-28 20:20:10.412032
88	https://auto.ria.com/uk/auto_bmw_x5_37970174.html	BMW X5 2024	85000	13000	Максим	+380674305155	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__599176733f.jpg	38	AB8501KX	5UX23EU08R9V21420	2025-05-28 20:20:24.284187
91	https://auto.ria.com/uk/auto_mercedes_benz_gle_class_38011374.html	Mercedes-Benz GLE-Class 2016	23700	157000	Едуард	+380964292232	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_gle-class__599264792f.jpg	45	AB4924KX	4JGDA5HB6GA753274	2025-05-28 20:20:32.822524
95	https://auto.ria.com/uk/auto_van_hool_t915_38360783.html	Van Hool T915 2007	55000	1100000		\N	https://cdn1.riastatic.com/photosnew/auto/photo/van-hool_t915__600521976f.jpg	19	BH0917PT	YE2915SS230D51696	2025-05-28 20:20:43.708177
102	https://auto.ria.com/uk/auto_neta_u_pro_400_36871296.html	Neta U Pro 400 2022	14800	50000	Владимир	+380672117887	https://cdn1.riastatic.com/photosnew/auto/photo/neta_u-pro-400__559249256f.jpg	25	AI0516YA	LUZBGAFB4NA019480	2025-05-28 20:21:10.234671
108	https://auto.ria.com/uk/auto_audi_q3_38081852.html	Audi Q3 2019	28500	64000	Катерина Йохансон	+380672864144	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q3__592855648f.jpg	41	KA4848BE	WA1AECF3XL1008169	2025-05-28 20:21:30.419864
115	https://auto.ria.com/uk/auto_avtoprystrij_ekonom_38349181.html	Автопрыстрий Эконом 2020	1600	10000	Зіновій Олесандрович Пітик	+380676562597	https://cdn1.riastatic.com/photosnew/auto/photo/avtoprystrij_ekonom__600220066f.jpg	8	Немає номеру		2025-05-28 20:21:48.788453
120	https://auto.ria.com/uk/auto_mercedes_benz_glc_class_38283453.html	Mercedes-Benz GLC-Class 2015	32400	93000	Александра	+380503443191	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_glc-class__598462280f.jpg	34	KA3099BA	WDC2539051F037387	2025-05-28 20:22:04.878324
125	https://auto.ria.com/uk/auto_lincoln_aviator_38342194.html	Lincoln Aviator 2022	57500	35000	Олег	+380671368621	https://cdn1.riastatic.com/photosnew/auto/photo/lincoln_aviator__600030736f.jpg	35	KA7148PA	5LMYJ8XY3NNL01505	2025-05-28 20:22:20.971874
129	https://auto.ria.com/uk/auto_ford_f_150_37017812.html	Ford F-150 2020	44900	59000	Владислав Кисляк	+380982752678	https://cdn2.riastatic.com/photosnew/auto/photo/ford_f-150__563193312f.jpg	49	KA1675KT	1FTFW1E84MFA37309	2025-05-28 20:22:36.562945
132	https://auto.ria.com/uk/auto_peugeot_3008_38359230.html	Peugeot 3008 2022	25499	121000	Саша	+380977935515	https://cdn3.riastatic.com/photosnew/auto/photo/peugeot_3008__600483133f.jpg	66	Немає номеру		2025-05-28 20:22:45.437689
85	https://auto.ria.com/uk/auto_mercedes_benz_s_class_35855607.html	Mercedes-Benz S-Class 2012	17900	212000	Александр	+380978368474	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_s-class__531616409f.jpg	94	KA3009MC	WDD2211941A459732	2025-05-28 20:20:13.021873
89	https://auto.ria.com/uk/auto_hyundai_tucson_38083947.html	Hyundai Tucson 2018	22500	99000	Максим	+380981210512	https://cdn1.riastatic.com/photosnew/auto/photo/hyundai_tucson__592913116f.jpg	85	AI9241PC	KMHJ381ABKU859202	2025-05-28 20:20:27.338632
94	https://auto.ria.com/uk/auto_mini_countryman_38342442.html	MINI Countryman 2023	34000	18000	Олександр Олександрович	+380950006166	https://cdn4.riastatic.com/photosnew/auto/photo/mini_countryman__600037784f.jpg	31	KA0900TH	WMZ83BR04R3S04921	2025-05-28 20:20:41.23881
97	https://auto.ria.com/uk/auto_volvo_xc90_38363245.html	Volvo XC90 2024	73300	15000	Ihor	+380981524042	https://cdn4.riastatic.com/photosnew/auto/photo/volvo_xc90__600590299f.jpg	47	KA1738MT	YV1LFM1V8S1302849	2025-05-28 20:20:50.346338
100	https://auto.ria.com/uk/auto_volkswagen_touareg_38320088.html	Volkswagen Touareg 2021	65500	17000	Ім’я не вказане	+380508883738	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_touareg__599424109f.jpg	47	AH1788PA	WVGZZZCRZMD026227	2025-05-28 20:21:02.45367
105	https://auto.ria.com/uk/auto_lexus_lx_37719907.html	Lexus LX 1998	13000	359000	Николай Олаф	+380674436474	https://cdn2.riastatic.com/photosnew/auto/photo/lexus_lx__582719627f.jpg	45	KA0727BE	JTB11WWA0W9002163	2025-05-28 20:21:17.899231
110	https://auto.ria.com/uk/auto_audi_a4_38358807.html	Audi A4 2016	17900	175000	Марко	+380680927982	https://cdn0.riastatic.com/photosnew/auto/photo/audi_a4__600472605f.jpg	119	BC3797TH	WAUENAF44HN021436	2025-05-28 20:21:37.429874
112	https://auto.ria.com/uk/auto_volvo_xc90_38314748.html	Volvo XC90 2021	53000	44000	Vlad Kramarchuk	+380958244069	https://cdn1.riastatic.com/photosnew/auto/photo/volvo_xc90__599292926f.jpg	10	KA0445AO	YV1LCL1VCM1772458	2025-05-28 20:21:46.756469
117	https://auto.ria.com/uk/auto_volkswagen_touareg_38155041.html	Volkswagen Touareg 2018	40999	265000		+050602660508002200	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_touareg__594894535f.jpg	109	Немає номеру		2025-05-28 20:22:00.442507
123	https://auto.ria.com/uk/auto_tesla_model_y_38123686.html	Tesla Model Y 2021	29000	29000	Dima	+	https://cdn1.riastatic.com/photosnew/auto/photo/tesla_model-y__594027921f.jpg	14	AA5659ZA	LRWYGCEK6MC130070	2025-05-28 20:22:15.981196
127	https://auto.ria.com/uk/auto_dodge_ram_1500_38197988.html	Dodge RAM 1500 2015	29999	96000	Сергій Манько	+380974761953	https://cdn3.riastatic.com/photosnew/auto/photo/dodge_ram-1500__599429873f.jpg	18	KA2178IA	1C6RR7KT4FS659877	2025-05-28 20:22:31.576365
131	https://auto.ria.com/uk/auto_volkswagen_multivan_38323796.html	Volkswagen Multivan 2020	46000	102000	Олександр	+380504693710	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_multivan__599520679f.jpg	19	KA7062KI	WV2ZZZ7HZMH053444	2025-05-28 20:22:42.479566
86	https://auto.ria.com/uk/auto_jeep_cherokee_38345286.html	Jeep Cherokee 2013	16900	180000	Олег Анатолійович	+380639926009	https://cdn2.riastatic.com/photosnew/auto/photo/jeep_cherokee__600117327f.jpg	13	KA8978PE	1C4PJMDB2EW173523	2025-05-28 20:20:13.601175
90	https://auto.ria.com/uk/auto_audi_a6_allroad_38357858.html	Audi A6 Allroad 2004	9999	275000	Роман Щербюк	+380976211160	https://cdn1.riastatic.com/photosnew/auto/photo/audi_a6-allroad__600447461f.jpg	43	KA0383PE	WAUZZZ4B74N044757	2025-05-28 20:20:27.92656
93	https://auto.ria.com/uk/auto_bmw_x5_38350052.html	BMW X5 2014	25600	287000	Альоша	+380966465236	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_x5__600241476f.jpg	16	AB3324KI	5UXKS4C5xE0xxxx19	2025-05-28 20:20:39.158679
101	https://auto.ria.com/uk/auto_audi_q8_38224853.html	Audi Q8 2021	67900	128000		+	https://cdn2.riastatic.com/photosnew/auto/photo/audi_q8__596861422f.jpg	66	Немає номеру	WAUZZZF11ND009689	2025-05-28 20:21:08.432883
114	https://auto.ria.com/uk/auto_volkswagen_tiguan_38038282.html	Volkswagen Tiguan 2017	12444	138000	Тимур	+380676108685	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__591628513f.jpg	21	AI9548MO	WVGBV7AX3JK002003	2025-05-28 20:21:47.751211
119	https://auto.ria.com/uk/auto_volkswagen_passat_38356744.html	Volkswagen Passat 2012	8650	247000	Денис Володимирович Денисенко	+380669598058	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_passat__600420021f.jpg	18	KA1474CC	1VWBP7A31DC067701	2025-05-28 20:22:03.126886
124	https://auto.ria.com/uk/auto_volkswagen_id_4_38127612.html	Volkswagen ID.4 2021	22999	108000	Костя	+380978357268	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4__598338021f.jpg	57	Немає номеру		2025-05-28 20:22:20.491232
134	https://auto.ria.com/uk/auto_porsche_macan_37021484.html	Porsche Macan 2017	28888	185000	Екатерина Рыбина	+380675696018	https://cdn0.riastatic.com/photosnew/auto/photo/porsche_macan__563295555f.jpg	32	AI3003IB	WP1ZZZ95ZHLB68516	2025-05-28 20:22:55.539605
135	https://auto.ria.com/uk/auto_ford_fiesta_37939339.html	Ford Fiesta 2013	4500	140000	Oleg Владимирович Кокица	+380634640354	https://cdn4.riastatic.com/photosnew/auto/photo/ford_fiesta__588831629f.jpg	17	KA4892EX	WF0DXXGAxDDxxxx90	2025-05-28 20:22:55.578383
136	https://auto.ria.com/uk/auto_toyota_highlander_36931414.html	Toyota Highlander 2014	20500	246000	Альберт Малумян	+380684636804	https://cdn3.riastatic.com/photosnew/auto/photo/toyota_highlander__560895548f.jpg	48	Немає номеру	5TDBKRFH20S033020	2025-05-28 20:23:00.64684
137	https://auto.ria.com/uk/auto_lexus_rx_36406101.html	Lexus RX 2020	48000	65000	Дмитрий	+380730889000	https://cdn3.riastatic.com/photosnew/auto/photo/lexus_rx__546516013f.jpg	48	BH8515TH	JTJHGKFA0L2015582	2025-05-28 20:23:00.953284
138	https://auto.ria.com/uk/auto_bmw_x7_38345180.html	BMW X7 2021	95900	99000		+380937770222	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x7__600116633f.jpg	82	HH4163AC	WBACW010X09F76054	2025-05-28 20:23:10.093668
139	https://auto.ria.com/uk/auto_audi_sq7_38211123.html	Audi SQ7 2017	52500	192000	Андрій Петрович	+380770077047	https://cdn2.riastatic.com/photosnew/auto/photo/audi_sq7__596482687f.jpg	120	Немає номеру	WAUZZZ4MxHDxxxx76	2025-05-28 20:23:14.858488
140	https://auto.ria.com/uk/auto_toyota_rav4_38306332.html	Toyota RAV4 2018	25300	176000	Богдан Горлай	+380993683291	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_rav4__599123705f.jpg	17	Немає номеру		2025-05-28 20:23:18.564386
141	https://auto.ria.com/uk/auto_audi_q5_38217836.html	Audi Q5 2016	14950	215000	Ростик	+380977582677	https://cdn4.riastatic.com/photosnew/auto/photo/audi_q5__596663414f.jpg	102	Немає номеру		2025-05-28 20:23:19.754304
142	https://auto.ria.com/uk/auto_nissan_rogue_38297959.html	Nissan Rogue 2017	14900	131000	Петро	+380684294085	https://cdn4.riastatic.com/photosnew/auto/photo/nissan_rogue__598844569f.jpg	50	Немає номеру		2025-05-28 20:23:20.788442
143	https://auto.ria.com/uk/auto_zeekr_001_38253903.html	Zeekr 001 2024	113900	1000	Сергей	+380933777333	https://cdn4.riastatic.com/photosnew/auto/photo/zeekr_001__597667934f.jpg	54	AA1000YY	L6T79ANExRPxxxx60	2025-05-28 20:23:21.059621
144	https://auto.ria.com/uk/auto_volkswagen_tiguan_38354908.html	Volkswagen Tiguan 2014	13999	142000	Іван	+380677780008	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__600370201f.jpg	81	Немає номеру	WVGZZZ5NxEWxxxx23	2025-05-28 20:23:23.616145
145	https://auto.ria.com/uk/auto_mercedes_benz_gle_class_38172288.html	Mercedes-Benz GLE-Class 2017	35000	119000	Ім’я не вказане	+380993723777	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_gle-class__595404273f.jpg	10	KA3377BE	WDC16600x1Axxxx75	2025-05-28 20:23:32.636578
146	https://auto.ria.com/uk/auto_mercedes_benz_g_class_38343527.html	Mercedes-Benz G-Class 2009	38900	180000	Александр	+380968404829	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_g-class__600066422f.jpg	98	KI2222AB	WDB4632701X177238	2025-05-28 20:23:33.553308
147	https://auto.ria.com/uk/auto_jeep_patriot_38326081.html	Jeep Patriot 2014	10200	212000	Irina	+380502198072	https://cdn2.riastatic.com/photosnew/auto/photo/jeep_patriot__599584697f.jpg	30	BT2080BX	1C4NJRFB3ED852018	2025-05-28 20:23:36.583253
148	https://auto.ria.com/uk/auto_bmw_4_series_38238812.html	BMW 4 Series 2020	35490	54000	Олександр	+380501020162	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_4-series__599257266f.jpg	48	KA8847MH	WBA53AP01MCG09448	2025-05-28 20:23:38.403327
149	https://auto.ria.com/uk/auto_bmw_x5_38269523.html	BMW X5 2014	34300	162000	Саша	+380688550185	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x5__600490720f.jpg	70	HH3262AB	WBAKS410800H57124	2025-05-28 20:23:41.936922
150	https://auto.ria.com/uk/auto_porsche_taycan_38349365.html	Porsche Taycan 2021	79999	23000	Володимир	+380668395560	https://cdn0.riastatic.com/photosnew/auto/photo/porsche_taycan__600223795f.jpg	84	Немає номеру	WP0ZZZY1ZMSA01365	2025-05-28 20:23:43.189093
151	https://auto.ria.com/uk/auto_toyota_highlander_38264585.html	Toyota Highlander 2014	26000	91000	Марина Антипова	+380955658768	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_highlander__597947355f.jpg	10	KA5538KP	5TDBKRFH40S018597	2025-05-28 20:23:43.947083
152	https://auto.ria.com/uk/auto_mazda_cx_5_38316244.html	Mazda CX-5 2013	15000	195000	Владимир	+380502392317	https://cdn1.riastatic.com/photosnew/auto/photo/mazda_cx-5__599330611f.jpg	42	BM9333BT	JMZKEN92800212165	2025-05-28 20:23:51.355741
153	https://auto.ria.com/uk/auto_skoda_octavia_38129012.html	Skoda Octavia 2008	6200	282000	Анжеліка	+380937860646	https://cdn1.riastatic.com/photosnew/auto/photo/skoda_octavia__594167686f.jpg	19	AI8139PX	TMBCS61Z282140221	2025-05-28 20:23:54.266893
154	https://auto.ria.com/uk/auto_mercedes_benz_vito_38360496.html	Mercedes-Benz Vito 2012	14200	210000	Власник	+380956438459	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_vito__600518800f.jpg	14	Немає номеру		2025-05-28 20:23:55.130319
155	https://auto.ria.com/uk/auto_audi_q5_38358481.html	Audi Q5 2016	18500	63000	Владислав Дмитриевич	+380951046244	https://cdn4.riastatic.com/photosnew/auto/photo/audi_q5__600464909f.jpg	47	Немає номеру		2025-05-28 20:24:00.919028
156	https://auto.ria.com/uk/auto_kia_sorento_38341856.html	Kia Sorento 2015	15000	140000	Сергей	+093849692710002100	https://cdn0.riastatic.com/photosnew/auto/photo/kia_sorento__600019905f.jpg	31	HH4463AI	5XYPGDA36GG032109	2025-05-28 20:24:01.925009
157	https://auto.ria.com/uk/auto_land_rover_discovery_sport_37945060.html	Land Rover Discovery Sport 2016	19000	185000	Igor Dombrovsky	+380638421586	https://cdn1.riastatic.com/photosnew/auto/photo/land-rover_discovery-sport__597196096f.jpg	19	AI9945OE	SALCA2BN7HH657382	2025-05-28 20:24:02.306682
158	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38350474.html	Mercedes-Benz Sprinter 2021	32999	246000	Сергій	+380678491030	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__600251875f.jpg	115	Немає номеру		2025-05-28 20:24:04.246158
159	https://auto.ria.com/uk/auto_audi_e_tron_38334102.html	Audi e-tron 2019	31200	102000	Ігор	+380634709252	https://cdn4.riastatic.com/photosnew/auto/photo/audi_e-tron__599803904f.jpg	130	Немає номеру	WAUZZZGE2LB015866	2025-05-28 20:24:12.954391
160	https://auto.ria.com/uk/auto_volkswagen_crafter_38315865.html	Volkswagen Crafter 2007	10300	270000	Андрій	+380685063934	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_crafter__599320872f.jpg	29	Немає номеру		2025-05-28 20:24:14.705609
\.


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 218
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 160, true);


--
-- TOC entry 3216 (class 2606 OID 16389)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3218 (class 2606 OID 16398)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 16400)
-- Name: cars cars_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_url_key UNIQUE (url);


-- Completed on 2025-05-28 20:25:00 UTC

--
-- PostgreSQL database dump complete
--


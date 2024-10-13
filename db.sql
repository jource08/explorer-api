--
-- PostgreSQL database dump
--

-- Dumped from database version 11.19 (Ubuntu 11.19-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-10-13 11:33:10

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
-- TOC entry 27 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 27
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 223 (class 1259 OID 38680558)
-- Name: files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    size integer NOT NULL,
    folder_id uuid,
    is_hidden boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    modified_at timestamp without time zone
);


--
-- TOC entry 222 (class 1259 OID 38680544)
-- Name: folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.folders (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    parent_id uuid,
    is_hidden boolean DEFAULT false,
    icon character varying(100) DEFAULT 'folder'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    modified_at timestamp without time zone
);


--
-- TOC entry 4016 (class 0 OID 38680558)
-- Dependencies: 223
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files (id, name, type, size, folder_id, is_hidden, created_at, modified_at) FROM stdin;
e8d7521c-f26c-4ff0-a98e-722e2438b51d	index.html	text/html	1024	2fdbafcf-7c4e-49c1-92ca-13bf7c7243d2	f	2024-10-13 11:26:31.602407	\N
ee0882c4-b084-4972-a168-74bf81bfdacd	about.html	text/html	1024	2fdbafcf-7c4e-49c1-92ca-13bf7c7243d2	f	2024-10-13 11:26:31.602407	\N
4f073cc2-3868-4050-8b68-7302cf8e192e	contact.html	text/html	1024	2fdbafcf-7c4e-49c1-92ca-13bf7c7243d2	f	2024-10-13 11:26:31.602407	\N
c6d87f0a-80ef-4cd4-81e9-bfe363da8466	styles.css	text/css	512	8e1a3d20-01de-4970-8d88-1ca11ee15ed4	f	2024-10-13 11:26:31.602407	\N
ef613414-5db7-452f-850d-7b77792f0e43	responsive.css	text/css	512	8e1a3d20-01de-4970-8d88-1ca11ee15ed4	f	2024-10-13 11:26:31.602407	\N
9553351a-1723-436b-8b42-0305c5b7e5b4	app.js	application/javascript	2048	a7fed2a3-f534-46a0-a70e-f2eaf581e5d6	f	2024-10-13 11:26:31.602407	\N
a05a5b7e-18ae-4939-9282-96c091f53aa7	utils.js	application/javascript	2048	a7fed2a3-f534-46a0-a70e-f2eaf581e5d6	f	2024-10-13 11:26:31.602407	\N
e45df962-54cc-428f-b70a-d7669c569039	server.js	application/javascript	2048	8c474eb6-862e-4fa9-a4e0-57f95516d618	f	2024-10-13 11:26:31.602407	\N
37680c6d-9512-4101-9188-45f76d413778	routes.js	application/javascript	1024	8c474eb6-862e-4fa9-a4e0-57f95516d618	f	2024-10-13 11:26:31.602407	\N
35e6bfc4-7306-428d-985a-b2c84f7e1349	models.js	application/javascript	1024	715419fb-b494-4041-a3d7-0608c43b616e	f	2024-10-13 11:26:31.602407	\N
d33738a7-0c93-40b0-8aa9-9eed4943efcb	queries.js	application/javascript	1024	715419fb-b494-4041-a3d7-0608c43b616e	f	2024-10-13 11:26:31.602407	\N
ccd05168-2644-4048-99a3-d2f89d9e5826	home_wireframe.png	image/png	2048	884dbbf2-e15a-40f3-8021-9a98b8ed5fe0	f	2024-10-13 11:26:31.602407	\N
ad0ae9a3-765f-41d9-9602-faf82362c423	recipe_detail_wireframe.png	image/png	2048	884dbbf2-e15a-40f3-8021-9a98b8ed5fe0	f	2024-10-13 11:26:31.602407	\N
5475fa00-92d4-44c1-8f59-24fcd4924e40	api_overview.md	text/markdown	512	c491f838-5f72-4298-8203-e7b4d54e0567	f	2024-10-13 11:26:31.602407	\N
a428bfb1-b920-41cc-8192-b672eac5d60e	endpoints.md	text/markdown	512	c491f838-5f72-4298-8203-e7b4d54e0567	f	2024-10-13 11:26:31.602407	\N
9a3aebe6-7bea-4c32-b683-5e643ca832ab	JavaScript Crash Course.pdf	application/pdf	5120	6b829fe0-ec82-487a-abce-6f69ecd5c4a5	f	2024-10-13 11:26:31.602407	\N
ed43c2e2-282a-46f6-b45b-b9d9724b3c7b	React for Beginners.mp4	video/mp4	10240	6b829fe0-ec82-487a-abce-6f69ecd5c4a5	f	2024-10-13 11:26:31.602407	\N
2d22b61b-3b36-4c98-a4f9-52acea3c626d	character_sketch1.png	image/png	2048	84dcf262-ef2e-4049-8c01-b8925e1dd624	f	2024-10-13 11:26:31.602407	\N
732f9a7b-fffb-4c7e-b208-e888c9e5ab47	character_sketch2.png	image/png	2048	84dcf262-ef2e-4049-8c01-b8925e1dd624	f	2024-10-13 11:26:31.602407	\N
344ce62c-9a69-48f2-a12c-9999db64e74a	final_character1.png	image/png	4096	63773f2c-873c-4c9f-8df6-6b08cd4863d7	f	2024-10-13 11:26:31.602407	\N
b592f9ad-66b0-4fb4-b87f-85e113e60100	final_character2.png	image/png	4096	63773f2c-873c-4c9f-8df6-6b08cd4863d7	f	2024-10-13 11:26:31.602407	\N
345932d9-f028-4f84-8662-0e82d297c7c8	favorite_songs.m3u	audio/mpegurl	1024	acfa745e-ca8a-44f4-b0ba-599e5decf5e5	f	2024-10-13 11:26:31.602407	\N
f601eabe-d370-4dda-82dc-948158c0186e	workout_playlist.m3u	audio/mpegurl	1024	acfa745e-ca8a-44f4-b0ba-599e5decf5e5	f	2024-10-13 11:26:31.602407	\N
a6b55fa2-0ac6-4382-a057-6a7945576e92	product.html	text/html	1024	3baad508-f3fb-43e2-8eeb-98d333f95bb0	f	2024-10-13 11:26:31.602407	\N
7b173790-0700-4d48-a6f7-4a81f82900a3	cart.html	text/html	1024	3baad508-f3fb-43e2-8eeb-98d333f95bb0	f	2024-10-13 11:26:31.602407	\N
c5e77191-f369-42fc-9e71-ad06e884eb35	ecommerce.css	text/css	512	3baad508-f3fb-43e2-8eeb-98d333f95bb0	f	2024-10-13 11:26:31.602407	\N
b4c35d1c-f341-44b3-a82b-cae29eefdb0d	checkout.js	application/javascript	2048	3baad508-f3fb-43e2-8eeb-98d333f95bb0	f	2024-10-13 11:26:31.602407	\N
8d7358ce-b472-45c9-80bf-a86e0cbfedc4	product.js	application/javascript	2048	3baad508-f3fb-43e2-8eeb-98d333f95bb0	f	2024-10-13 11:26:31.602407	\N
4dcacf8f-8c3a-49bb-a3d6-eed9ef976b1b	MainActivity.java	application/java	2048	17adca56-9133-4add-a230-2839628e49f4	f	2024-10-13 11:26:31.602407	\N
b4547f43-199d-428b-b29d-c7aa1e2224ab	Utils.java	application/java	1024	17adca56-9133-4add-a230-2839628e49f4	f	2024-10-13 11:26:31.602407	\N
56179f0e-bdee-4df1-92ae-ec86010cd79d	activity_main.xml	text/xml	512	17adca56-9133-4add-a230-2839628e49f4	f	2024-10-13 11:26:31.602407	\N
4db9744c-7057-4411-b36f-8e6fed72baab	styles.xml	text/xml	512	17adca56-9133-4add-a230-2839628e49f4	f	2024-10-13 11:26:31.602407	\N
386d6299-0205-4a15-845b-bb27354b4d62	AppDelegate.swift	text/x-swift	2048	93210f54-3e8c-4755-9d8a-cf9735486f43	f	2024-10-13 11:26:31.602407	\N
653ddb23-51df-4a3a-b9c3-402b15a4dc65	ViewController.swift	text/x-swift	2048	93210f54-3e8c-4755-9d8a-cf9735486f43	f	2024-10-13 11:26:31.602407	\N
f221b6ec-a1ee-429d-a6c1-039ed65ff0f6	async_await.js	application/javascript	512	8fc0e83a-379d-475f-98da-d17f168f1c7d	f	2024-10-13 11:26:31.602407	\N
08e2d051-8711-420a-8cb4-b11658ee4bef	fetch_api.js	application/javascript	512	8fc0e83a-379d-475f-98da-d17f168f1c7d	f	2024-10-13 11:26:31.602407	\N
6c1a0774-1baa-4f84-b4ed-1f9167d07df3	data_analysis.py	application/python	2048	8fc0e83a-379d-475f-98da-d17f168f1c7d	f	2024-10-13 11:26:31.602407	\N
5940bfac-449e-40bb-bc91-4d6a4af0d501	web_scraping.py	application/python	2048	8fc0e83a-379d-475f-98da-d17f168f1c7d	f	2024-10-13 11:26:31.602407	\N
114bc7e5-6979-4225-b0c1-a58ec4f4633e	landscape_painting1.jpg	image/jpeg	4096	f8084277-efaa-4ec0-a15e-109447d348f8	f	2024-10-13 11:26:31.602407	\N
82e0f2b1-7e29-475e-80c1-077042fc3c49	landscape_painting2.jpg	image/jpeg	4096	f8084277-efaa-4ec0-a15e-109447d348f8	f	2024-10-13 11:26:31.602407	\N
4981ea7e-81bb-42ec-8d0e-eb5273e1afbe	portrait_painting1.jpg	image/jpeg	4096	ff2faa65-3105-488e-a2b3-80d328b6b804	f	2024-10-13 11:26:31.602407	\N
89f057d2-bde0-4070-a3a9-cd069a6b7a01	portrait_painting2.jpg	image/jpeg	4096	ff2faa65-3105-488e-a2b3-80d328b6b804	f	2024-10-13 11:26:31.602407	\N
fa6517e3-c350-4126-a194-92adbc8f1e65	guitar_sheet.pdf	application/pdf	512	98210b01-705c-4b16-bdfa-586102154695	f	2024-10-13 11:26:31.602407	\N
6ff9efc2-6d20-476c-ac3a-5bf5ef102f7b	piano_sheet.pdf	application/pdf	512	98210b01-705c-4b16-bdfa-586102154695	f	2024-10-13 11:26:31.602407	\N
6174b54f-b272-4dbf-96cf-bbce7ed25c79	europe_trip1.jpg	image/jpeg	4096	ab1c187c-ecaf-4496-8ef1-69964a595d42	f	2024-10-13 11:26:31.602407	\N
015c8536-066b-4b3b-a00a-5714b92f0b1d	europe_trip2.jpg	image/jpeg	4096	ab1c187c-ecaf-4496-8ef1-69964a595d42	f	2024-10-13 11:26:31.602407	\N
c46bc11d-1318-4d83-a1d9-26d809d15ef9	asia_trip1.jpg	image/jpeg	4096	ab1c187c-ecaf-4496-8ef1-69964a595d42	f	2024-10-13 11:26:31.602407	\N
4a33cb1b-6e75-4ea7-a1bb-21a89e6447ec	asia_trip2.jpg	image/jpeg	4096	ab1c187c-ecaf-4496-8ef1-69964a595d42	f	2024-10-13 11:26:31.602407	\N
\.


--
-- TOC entry 4015 (class 0 OID 38680544)
-- Dependencies: 222
-- Data for Name: folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.folders (id, name, parent_id, is_hidden, icon, created_at, modified_at) FROM stdin;
143d76b7-3987-41d1-87f7-99cb3ad585fb	Programming	\N	f	folder	2024-10-13 11:21:29.764221	\N
38eea796-e7e6-41e2-baa7-df985df0edc2	Art	\N	f	folder	2024-10-13 11:21:29.764221	\N
966e43e9-0cd7-4a4b-a8e7-e24bd4366c6f	Personal	\N	f	folder	2024-10-13 11:21:29.764221	\N
4634e4ab-3b74-4b74-b82f-5ddeb3b52308	Projects	143d76b7-3987-41d1-87f7-99cb3ad585fb	f	folder	2024-10-13 11:21:29.834937	\N
fcde3120-2f53-4e74-8849-2b8cc19a2168	Resources	143d76b7-3987-41d1-87f7-99cb3ad585fb	f	folder	2024-10-13 11:21:29.834937	\N
2aeb281c-c30f-4313-8b2e-459d4ba71426	Web Development	4634e4ab-3b74-4b74-b82f-5ddeb3b52308	f	folder	2024-10-13 11:21:29.903214	\N
34a9fccf-4278-49e3-99f8-b11fc5f74795	Mobile Apps	4634e4ab-3b74-4b74-b82f-5ddeb3b52308	f	folder	2024-10-13 11:21:29.903214	\N
a4d85ff7-7134-4d15-be6c-719e98f38743	Personal Website	2aeb281c-c30f-4313-8b2e-459d4ba71426	f	folder	2024-10-13 11:21:29.969285	\N
3baad508-f3fb-43e2-8eeb-98d333f95bb0	E-commerce Website	2aeb281c-c30f-4313-8b2e-459d4ba71426	f	folder	2024-10-13 11:21:29.969285	\N
2fdbafcf-7c4e-49c1-92ca-13bf7c7243d2	HTML	a4d85ff7-7134-4d15-be6c-719e98f38743	f	folder	2024-10-13 11:21:30.037283	\N
8e1a3d20-01de-4970-8d88-1ca11ee15ed4	CSS	a4d85ff7-7134-4d15-be6c-719e98f38743	f	folder	2024-10-13 11:21:30.037283	\N
a7fed2a3-f534-46a0-a70e-f2eaf581e5d6	JavaScript	a4d85ff7-7134-4d15-be6c-719e98f38743	f	folder	2024-10-13 11:21:30.037283	\N
75b8540f-d259-4d7f-ad73-e07808848e33	Frontend	3baad508-f3fb-43e2-8eeb-98d333f95bb0	f	folder	2024-10-13 11:21:30.106462	\N
63e9cb2c-f15b-4648-8bbc-11ff88e04140	Backend	3baad508-f3fb-43e2-8eeb-98d333f95bb0	f	folder	2024-10-13 11:21:30.106462	\N
8c474eb6-862e-4fa9-a4e0-57f95516d618	Node.js	63e9cb2c-f15b-4648-8bbc-11ff88e04140	f	folder	2024-10-13 11:21:30.173377	\N
715419fb-b494-4041-a3d7-0608c43b616e	Database	63e9cb2c-f15b-4648-8bbc-11ff88e04140	f	folder	2024-10-13 11:21:30.173377	\N
eef69387-7931-45b3-bf56-f900f9e60b01	Fitness Tracker App	34a9fccf-4278-49e3-99f8-b11fc5f74795	f	folder	2024-10-13 11:21:30.240418	\N
bc11d309-125d-4516-9318-a79781ffe0c1	Recipe App	34a9fccf-4278-49e3-99f8-b11fc5f74795	f	folder	2024-10-13 11:21:30.240418	\N
17adca56-9133-4add-a230-2839628e49f4	Android	eef69387-7931-45b3-bf56-f900f9e60b01	f	folder	2024-10-13 11:21:30.30938	\N
93210f54-3e8c-4755-9d8a-cf9735486f43	iOS	eef69387-7931-45b3-bf56-f900f9e60b01	f	folder	2024-10-13 11:21:30.30938	\N
884dbbf2-e15a-40f3-8021-9a98b8ed5fe0	Wireframes	bc11d309-125d-4516-9318-a79781ffe0c1	f	folder	2024-10-13 11:21:30.375401	\N
c491f838-5f72-4298-8203-e7b4d54e0567	API Documentation	bc11d309-125d-4516-9318-a79781ffe0c1	f	folder	2024-10-13 11:21:30.375401	\N
6b829fe0-ec82-487a-abce-6f69ecd5c4a5	Tutorials	fcde3120-2f53-4e74-8849-2b8cc19a2168	f	folder	2024-10-13 11:21:30.450214	\N
8fc0e83a-379d-475f-98da-d17f168f1c7d	Code Snippets	fcde3120-2f53-4e74-8849-2b8cc19a2168	f	folder	2024-10-13 11:21:30.450214	\N
c81655cd-7e97-4a3b-8655-8e8edd2a20cc	Digital Art	38eea796-e7e6-41e2-baa7-df985df0edc2	f	folder	2024-10-13 11:21:30.516466	\N
8ed09da3-c8f9-4b34-ac33-98eb5741a7b5	Traditional Art	38eea796-e7e6-41e2-baa7-df985df0edc2	f	folder	2024-10-13 11:21:30.516466	\N
6b7fac7c-4135-47a4-85d5-2a142b0715a7	Illustrations	c81655cd-7e97-4a3b-8655-8e8edd2a20cc	f	folder	2024-10-13 11:21:30.581212	\N
c7d1ccf0-7238-403f-b668-3ffd6cfb727d	Character Designs	6b7fac7c-4135-47a4-85d5-2a142b0715a7	f	folder	2024-10-13 11:21:30.646394	\N
0064ca43-0a2f-443c-9ac2-e8e19e9e77b2	Concept Art	6b7fac7c-4135-47a4-85d5-2a142b0715a7	f	folder	2024-10-13 11:21:30.646394	\N
84dcf262-ef2e-4049-8c01-b8925e1dd624	Sketches	c7d1ccf0-7238-403f-b668-3ffd6cfb727d	f	folder	2024-10-13 11:21:30.715409	\N
63773f2c-873c-4c9f-8df6-6b08cd4863d7	Final Artwork	c7d1ccf0-7238-403f-b668-3ffd6cfb727d	f	folder	2024-10-13 11:21:30.715409	\N
c6d32871-031f-4b2a-8556-b40a52dc5de7	Paintings	8ed09da3-c8f9-4b34-ac33-98eb5741a7b5	f	folder	2024-10-13 11:21:30.781353	\N
9053e6ee-363d-4305-9b37-8f9e289b4b10	Sketches	8ed09da3-c8f9-4b34-ac33-98eb5741a7b5	f	folder	2024-10-13 11:21:30.781353	\N
ff2faa65-3105-488e-a2b3-80d328b6b804	Watercolor	c6d32871-031f-4b2a-8556-b40a52dc5de7	f	folder	2024-10-13 11:21:30.849208	\N
f8084277-efaa-4ec0-a15e-109447d348f8	Acrylic	c6d32871-031f-4b2a-8556-b40a52dc5de7	f	folder	2024-10-13 11:21:30.849208	\N
78525373-885e-4f6c-8ae2-6f2de8bfc13a	Portfolio	966e43e9-0cd7-4a4b-a8e7-e24bd4366c6f	f	folder	2024-10-13 11:21:30.91929	\N
de2928ef-ea75-4970-925f-d147fa5b24ca	Resume	966e43e9-0cd7-4a4b-a8e7-e24bd4366c6f	f	folder	2024-10-13 11:21:30.91929	\N
5b84adc9-731b-44d4-b1d1-db1160319c55	Hobbies	966e43e9-0cd7-4a4b-a8e7-e24bd4366c6f	f	folder	2024-10-13 11:21:30.91929	\N
56aef23e-f930-4c34-aa85-8ce75e496219	Best Works	78525373-885e-4f6c-8ae2-6f2de8bfc13a	f	folder	2024-10-13 11:21:30.985368	\N
07b075bd-f030-4c45-88cc-66ebc63699da	Designs	78525373-885e-4f6c-8ae2-6f2de8bfc13a	f	folder	2024-10-13 11:21:30.985368	\N
a7f90c7b-a89d-4e1e-901b-d2c8016f25ab	Graphic Designs	07b075bd-f030-4c45-88cc-66ebc63699da	f	folder	2024-10-13 11:21:31.052377	\N
55381a62-fdea-4627-acd3-0f2d7e354319	Illustrations	07b075bd-f030-4c45-88cc-66ebc63699da	f	folder	2024-10-13 11:21:31.052377	\N
98210b01-705c-4b16-bdfa-586102154695	Music	5b84adc9-731b-44d4-b1d1-db1160319c55	f	folder	2024-10-13 11:21:31.118234	\N
ab1c187c-ecaf-4496-8ef1-69964a595d42	Photography	5b84adc9-731b-44d4-b1d1-db1160319c55	f	folder	2024-10-13 11:21:31.118234	\N
acfa745e-ca8a-44f4-b0ba-599e5decf5e5	Playlists	98210b01-705c-4b16-bdfa-586102154695	f	folder	2024-10-13 11:21:31.191675	\N
68fa139e-b407-4fc7-b7b2-5b39d19f4369	Instruments	98210b01-705c-4b16-bdfa-586102154695	f	folder	2024-10-13 11:21:31.191675	\N
\.


--
-- TOC entry 3890 (class 2606 OID 38680565)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 3888 (class 2606 OID 38680552)
-- Name: folders folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_pkey PRIMARY KEY (id);


--
-- TOC entry 3892 (class 2606 OID 38680566)
-- Name: files files_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES public.folders(id) ON DELETE CASCADE;


--
-- TOC entry 3891 (class 2606 OID 38680553)
-- Name: folders folders_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folders
    ADD CONSTRAINT folders_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.folders(id) ON DELETE CASCADE;


-- Completed on 2024-10-13 11:33:24

--
-- PostgreSQL database dump complete
--


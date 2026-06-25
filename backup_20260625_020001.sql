--
-- PostgreSQL database dump
--

\restrict MZ6tSBJMNbIEizLFmYurPlARBX7zqFaFqDBSg8HK5sSSsymjYc3MpfKSXyeDO2a

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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
-- Name: BookingStatus; Type: TYPE; Schema: public; Owner: twp_user
--

CREATE TYPE public."BookingStatus" AS ENUM (
    'PENDING',
    'CONFIRMED',
    'CANCELLED'
);


ALTER TYPE public."BookingStatus" OWNER TO twp_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AdminUser; Type: TABLE; Schema: public; Owner: twp_user
--

CREATE TABLE public."AdminUser" (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."AdminUser" OWNER TO twp_user;

--
-- Name: Booking; Type: TABLE; Schema: public; Owner: twp_user
--

CREATE TABLE public."Booking" (
    id text NOT NULL,
    date date NOT NULL,
    "startHour" integer NOT NULL,
    "endHour" integer NOT NULL,
    hours integer NOT NULL,
    amount integer NOT NULL,
    "customerName" text NOT NULL,
    "customerEmail" text NOT NULL,
    "customerPhone" text NOT NULL,
    status public."BookingStatus" DEFAULT 'PENDING'::public."BookingStatus" NOT NULL,
    "paymentId" text,
    "paymentStatus" text,
    notes text,
    "isManual" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "discountPence" integer DEFAULT 0 NOT NULL,
    "promoCode" text
);


ALTER TABLE public."Booking" OWNER TO twp_user;

--
-- Name: DayOverride; Type: TABLE; Schema: public; Owner: twp_user
--

CREATE TABLE public."DayOverride" (
    date date NOT NULL,
    "isOpen" boolean NOT NULL
);


ALTER TABLE public."DayOverride" OWNER TO twp_user;

--
-- Name: PageView; Type: TABLE; Schema: public; Owner: twp_user
--

CREATE TABLE public."PageView" (
    id text NOT NULL,
    path text NOT NULL,
    referrer text,
    device text NOT NULL,
    "visitorHash" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PageView" OWNER TO twp_user;

--
-- Name: PromoCode; Type: TABLE; Schema: public; Owner: twp_user
--

CREATE TABLE public."PromoCode" (
    code text NOT NULL,
    "discountHours" integer NOT NULL,
    "expiresAt" timestamp(3) without time zone,
    "usageLimit" integer,
    "usedCount" integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PromoCode" OWNER TO twp_user;

--
-- Name: SlotClosure; Type: TABLE; Schema: public; Owner: twp_user
--

CREATE TABLE public."SlotClosure" (
    id text NOT NULL,
    date date NOT NULL,
    "startHour" integer NOT NULL,
    "endHour" integer NOT NULL,
    reason text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."SlotClosure" OWNER TO twp_user;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: twp_user
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO twp_user;

--
-- Data for Name: AdminUser; Type: TABLE DATA; Schema: public; Owner: twp_user
--

COPY public."AdminUser" (id, email, password, name, "createdAt") FROM stdin;
cmp3pd3rc0000rrl0kxv3e94d	info@theworkplaceuk.co.uk	$2b$12$CaTQji7SjnLEvl0ho1lp8u4ulLkv02qW9CnGpj3ySNv77Ze3aEmoW	Noami	2026-05-13 06:52:48.842
cmp633cdd0000chl0s27ha9h1	admin@theworkplaceuk.co.uk	$2b$12$LDuQ4RZEwbazQmAzLWUChO31duZZ4hCH3UQO2bMZwnTaV3lG/n9gG	Admin	2026-05-14 22:52:40.418
\.


--
-- Data for Name: Booking; Type: TABLE DATA; Schema: public; Owner: twp_user
--

COPY public."Booking" (id, date, "startHour", "endHour", hours, amount, "customerName", "customerEmail", "customerPhone", status, "paymentId", "paymentStatus", notes, "isManual", "createdAt", "updatedAt", "discountPence", "promoCode") FROM stdin;
cmp3pg6uq0001s7l0h4tbwmhk	2026-05-15	9	11	2	1100	Test User	test@example.com	07700900000	CONFIRMED	\N	\N	Test booking	t	2026-05-13 06:55:12.818	2026-05-13 06:55:12.818	0	\N
cmp63mi300000wml0nsfjhxi2	2026-05-30	11	13	2	300	Daisy Duck	daisy@gamail.com	07854125414	CANCELLED	4bb478b6-9d1b-480d-9517-ebc52f3c73e1	FAILED	\N	f	2026-05-14 23:07:34.284	2026-05-14 23:10:55.395	800	TESTCODE3
cmp63wurt00006hl00z4b4y24	2026-05-16	9	10	1	800	Minnie Mouse	minnie@gmail.com	07854125414	CANCELLED	\N	\N	clicked on wrong time	f	2026-05-14 23:15:37.289	2026-05-14 23:17:06.469	800	TESTCODE
cmp3q5to60000thl03ibmjmdp	2026-05-21	10	11	1	800	Test User	test@example.com	07700900000	CANCELLED	d5223094-f3ba-4bb7-bab6-8b3403e78224	\N	\N	f	2026-05-13 07:15:08.791	2026-05-13 07:55:28.65	0	\N
cmp3q8iyt0001thl0mtsupxjq	2026-05-13	8	11	3	1400	Minnie Mouse	minnie@genaixa.co.uk	07958546984	CANCELLED	921073d1-25a6-4ac8-983f-949cda96daf4	\N	\N	f	2026-05-13 07:17:14.885	2026-05-13 07:55:28.65	0	\N
cmp3qc66a0002thl08nocft6u	2026-05-13	8	11	3	1400	Minnie Mouse	minnie@genaixa.co.uk	07958546984	CANCELLED	3045a248-e8de-47ca-812e-a19f56f73aaa	\N	\N	f	2026-05-13 07:20:04.93	2026-05-13 07:55:28.65	0	\N
cmp3qvq0p0000vgl0sr3puznq	2026-05-13	8	10	2	1100	Minnie Mouse	minnie@genaixa.co.uk	07958546984	CANCELLED	ea680afe-c271-45c2-bfef-37cd13c818fe	\N	\N	f	2026-05-13 07:35:17.114	2026-05-13 19:35:22.588	0	\N
cmp4gywgp0001vgl0o4syhxg8	2026-05-14	8	10	2	1100	Minnie Mouse	minnie@geneaixa.co.uk	07958541254	CANCELLED	f883a553-5136-4889-941f-1e42b9a4a6ef	FAILED	\N	f	2026-05-13 19:45:35.449	2026-05-13 19:48:22.468	0	\N
cmp64556w00004zl0j24vmg5d	2026-05-16	9	11	2	1100	Daisy Duck	daisy@gmail.com	07854125412	CANCELLED	\N	\N	Hope there is enough availability	t	2026-05-14 23:22:04.04	2026-05-14 23:40:07.035	0	\N
cmp4h48820002vgl0twul6jpd	2026-05-14	9	13	4	1500	Minnie Mouse	minnie@genaixa.co.uk	07865434543	CANCELLED	69b9370f-4392-4185-a5c9-09efd73710b2	FAILED	\N	f	2026-05-13 19:49:43.97	2026-05-13 19:50:09.292	0	\N
cmqilulvb00175cl0vl52gloj	2026-06-18	18	22	4	1500	Sorolle Cohen	sorollec@gmail.com	07753633439	CONFIRMED	e53a438b-9317-46b2-b179-3d6aa35550e2	PAID	\N	f	2026-06-17 21:50:41.975	2026-06-17 21:51:28.168	0	\N
cmp4lw5l10001fzl0x1al141r	2026-05-13	17	18	1	800	Minnie	minnie@genaixa.co.uk	07854785412	CANCELLED	ca774f61-1b70-444f-9c76-596ab185cb53	FAILED	\N	f	2026-05-13 22:03:25.381	2026-05-13 22:17:30.645	0	\N
cmppjvlxx0000rql0spllnli1	2026-05-29	8	9	1	800	Test User	test@example.com	07700000000	CANCELLED	34413f95-52f2-4e25-87ef-92aec44e8d4a	\N	\N	f	2026-05-28 13:50:10.389	2026-05-28 14:22:25.106	0	\N
cmp4llz080000v6l0ogq1i6j4	2026-05-13	8	10	2	1100	Minnie Mouse 	minnie@genaixa.co.uk	07958741254	CANCELLED	2ca10ed9-2e9e-4f70-bade-c2240a1fd24d	\N	\N	f	2026-05-13 21:55:30.296	2026-05-14 11:35:30.7	0	\N
cmp4lqi200000fzl0i7afs7pj	2026-05-19	11	12	1	800	Minnie	minnie@genaixa.co.uk	07878787854	CANCELLED	412becf5-e889-40eb-967c-ba6be4df86b7	\N	\N	f	2026-05-13 21:59:01.608	2026-05-14 11:35:30.7	0	\N
cmp6kefua0000ewl0i6cxpuy9	2026-05-23	12	14	2	1100	D	davidkorn6@gmail.com	07967928023	CANCELLED	9ba93592-79f9-4c30-b1fc-0e0fe1dbe570	\N	\N	f	2026-05-15 06:57:11.602	2026-05-15 07:45:09.337	0	\N
cmp5p9naa00012gl0fqqxf3et	2026-05-15	8	9	1	800	Minnie	minnie@genaixa.co.uk	01478965236	CANCELLED	ea7a7445-01c0-4727-a9dc-a37bf00b5f1f	\N	\N	f	2026-05-14 16:25:39.874	2026-05-14 18:26:52.098	0	\N
cmp4mhpsk00002gl0k0w9c7w6	2026-05-14	8	9	1	800	Minjie	minjie@genaixa.co.uk	07854785412	CANCELLED	6f758cd9-d2ea-4dec-9d87-54262df5d34e	PAID	\N	f	2026-05-13 22:20:11.348	2026-05-14 22:58:04.166	0	\N
cmp6kqrvs0001ewl0v7oglyvx	2026-05-17	9	10	1	800	Noami Kornbluth	noamigrossberger@gmail.com	07419330808	CANCELLED	f51e1dd7-9e81-4eeb-9cc2-8365640cf007	\N	\N	f	2026-05-15 07:06:47.08	2026-05-15 07:45:09.337	0	\N
cmp63ef0o0000lsl098iqgs6p	2026-05-30	8	12	4	700	Daisy Duck	daisy@gmail.com	07854123698	CANCELLED	88c9a6f7-5da3-4179-958e-cc28d36207c3	FAILED	\N	f	2026-05-14 23:01:17.064	2026-05-14 23:02:09.047	800	TESTCODE2
cmpba8xn7002mr5l0kg2hfxr2	2026-05-19	9	10	1	800	jhf	jhgf@hjk.com	jhgf	CONFIRMED	\N	\N		t	2026-05-18 14:11:49.459	2026-05-18 14:11:49.459	0	\N
cmpe9elj30000jel0frbyel0a	2026-05-22	9	10	1	800	Noami Kornbluth	noamigrossberger@gmail.com	07419330808	CONFIRMED	\N	\N		t	2026-05-20 16:11:32.607	2026-05-20 16:11:32.607	0	\N
cmppl8vvl0001nwl0oirwg0mj	2026-05-29	9	10	1	800	Daisy Duck	daisy@genaixa.co.uk	07958546984	CONFIRMED	0499845e-ebc1-44ab-ad25-5325d392b684	PAID	\N	f	2026-05-28 14:28:29.409	2026-05-28 14:35:39.864	0	\N
cmppix42r00000jl01dfe8lnb	2026-05-29	8	9	1	800	Minnie Mouse	minnie@genaixa.co.uk	07958546984	CONFIRMED	d2608c99-4294-4f03-85bc-bea97d6c8332	PAID	\N	f	2026-05-28 13:23:20.931	2026-05-28 13:26:53.351	0	\N
cmppkxwln0000nwl0bsrbdo64	2026-05-29	8	9	1	800	Test User	test@example.com	07700000000	CANCELLED	8b81eec0-73e7-440e-b349-06c7f8613295	\N	\N	f	2026-05-28 14:19:57.131	2026-05-28 21:04:59.598	0	\N
cmppimpw800006cl0a8c70x67	2026-05-29	8	9	1	800	Minnie Mouse	minnie@genaixa.co.uk	07958546984	CANCELLED	186b1692-71b1-42b9-b848-95be4dbe09a6	\N	\N	f	2026-05-28 13:15:15.992	2026-05-28 13:45:36.734	0	\N
cmppjemvq0000y0l0zbewxe69	2026-05-29	8	9	1	800	Daisy Duck	daisy@genaixa.co.uk	07958546984	CONFIRMED	7b638228-5dc5-494b-8551-72afefdfb9b4	PAID	\N	f	2026-05-28 13:36:58.454	2026-05-28 13:57:14.624	0	\N
cmqgdfilu000t5cl0xfmkaajk	2026-07-14	12	13	1	800	Chayalle Trepp	chayatrepp@gmail.com	0583209544	CANCELLED	8e3932ac-6c19-4ba9-804d-f6b2c4b354c3	\N	\N	f	2026-06-16 08:19:28.626	2026-06-16 09:42:46.264	0	\N
cmqidh0ed00125cl0ok2oe1wc	2026-06-18	18	21	3	1400	soroh cohen	cohensyg@gmail.com	07753633439	CANCELLED	34f05fa3-34ec-4017-ba25-9e0a933928ca	\N	\N	f	2026-06-17 17:56:10.693	2026-06-17 21:49:37.006	0	\N
\.


--
-- Data for Name: DayOverride; Type: TABLE DATA; Schema: public; Owner: twp_user
--

COPY public."DayOverride" (date, "isOpen") FROM stdin;
2026-05-23	t
\.


--
-- Data for Name: PageView; Type: TABLE DATA; Schema: public; Owner: twp_user
--

COPY public."PageView" (id, path, referrer, device, "visitorHash", "createdAt") FROM stdin;
cmpvpsds900001ql06mjzf9y9	/	\N	desktop	bd7a128f8fdc8958	2026-06-01 21:22:14.601
cmpvpvzab00011ql0s9o4n00c	/	\N	desktop	89423677f02997e2	2026-06-01 21:25:02.435
cmpvpwyjn00021ql0xqy8lwn2	/	\N	mobile	6aa3d60113a62a4e	2026-06-01 21:25:48.131
cmpvqv8kf00031ql0i2u61838	/	\N	mobile	e577daa04cbee581	2026-06-01 21:52:27.423
cmpvqw7bj00041ql0q0fr7jzq	/	\N	mobile	e577daa04cbee581	2026-06-01 21:53:12.463
cmpvrb83200006wl01b1kl47k	/	\N	mobile	89423677f02997e2	2026-06-01 22:04:53.294
cmpvrlhsy00016wl0erskdhm1	/	\N	desktop	62105179974cd2ef	2026-06-01 22:12:52.45
cmpvry4jh00026wl0vur7jl86	/	com.google.android.googlequicksearchbox	mobile	89423677f02997e2	2026-06-01 22:22:41.789
cmpvsczwn00036wl0dekuobpm	/	\N	mobile	d00c248eada6e980	2026-06-01 22:34:15.623
cmpvt5g4300046wl0ouh656yf	/	\N	mobile	e577daa04cbee581	2026-06-01 22:56:22.995
cmpvux1im00056wl0zxupcbye	/	google.com	mobile	e47616f0170d0525	2026-06-01 23:45:50.062
cmpw9k8s800066wl0ot8nd3rd	/	\N	mobile	ecee9865a07e0d4e	2026-06-02 06:35:47.192
cmpwen4zm00076wl0qcmupbhs	/	\N	mobile	30459fd383968aac	2026-06-02 08:58:00.322
cmpwfdu4s00086wl09gczbgqb	/	\N	desktop	b7e582d8884484a0	2026-06-02 09:18:45.964
cmpwfnetk00096wl0qy9tn5te	/	\N	mobile	a5ec1c269537bda1	2026-06-02 09:26:12.68
cmpwhioo0000a6wl02r8nvqk6	/	\N	mobile	a759a49a4924ca55	2026-06-02 10:18:31.393
cmpwhnfjf000b6wl0ynrq55r2	/	\N	desktop	46d51ad49f730aff	2026-06-02 10:22:12.843
cmpwid3il000c6wl0d94w9163	/	google.com	desktop	f170f6e73770ad51	2026-06-02 10:42:10.317
cmpwzdpvp000d6wl086teyca1	/	\N	mobile	e02a2f73b8758e67	2026-06-02 18:38:32.773
cmpx1yddn000e6wl0591x1bav	/	\N	desktop	37309cc2645ff8ca	2026-06-02 19:50:35.579
cmpx2w1w6000f6wl07s8uxbyc	/	\N	desktop	37309cc2645ff8ca	2026-06-02 20:16:46.998
cmpx7809e000g6wl0yomc0oej	/	google.com	mobile	9092e5458b828f9e	2026-06-02 22:18:03.218
cmpyc1wvb000h6wl0r7ej7czu	/	google.com	desktop	f52efe9780e60a4c	2026-06-03 17:21:03.144
cmq06ba4m000i6wl0n50r3gjt	/	\N	desktop	1f8bf83ac13b5f78	2026-06-05 00:15:54.886
cmq09wtcs000j6wl084k2pakk	/	\N	desktop	9f9ff63a39d37f21	2026-06-05 01:56:38.428
cmq30js7l000k6wl0d7z5f351	/	\N	mobile	64ca982bbb73947d	2026-06-06 23:57:52.401
cmq3ml7fy000l6wl0ln9rli30	/	\N	mobile	cabbd8dffb726c09	2026-06-07 10:14:50.35
cmq3ml948000m6wl09g8w6cq6	/	google.com	mobile	1c04d0b4e7451790	2026-06-07 10:14:52.52
cmq3mm21y000n6wl0kbim6ucz	/	\N	mobile	cabbd8dffb726c09	2026-06-07 10:15:30.022
cmq3mtazj000o6wl0ysani4ft	/	\N	mobile	fdc800a031badd5d	2026-06-07 10:21:08.191
cmq3ns2zi000p6wl06bx8zf1j	/	\N	mobile	90bd7fcec69343d3	2026-06-07 10:48:10.782
cmq3nss1r000q6wl0h53si2ns	/	\N	mobile	90bd7fcec69343d3	2026-06-07 10:48:43.263
cmq3o2fz3000r6wl0m2hxefin	/	\N	mobile	779cd60bea2724ec	2026-06-07 10:56:14.175
cmq3p6iai000s6wl0xdk8c1uv	/	\N	mobile	be656d6f4cb2dbf4	2026-06-07 11:27:23.419
cmq3pro1b000t6wl0xz5vfsl8	/	\N	mobile	af66e28ec5b60d10	2026-06-07 11:43:50.639
cmq3rbh71000u6wl0p1t4xvaz	/	\N	mobile	57b8090a6dfc8e37	2026-06-07 12:27:14.509
cmq3rt09k000v6wl0fiipa2nq	/	\N	mobile	cabbd8dffb726c09	2026-06-07 12:40:52.376
cmq3s0i7o000w6wl0gnp74cyq	/	\N	mobile	b1c12fb72d42a1f4	2026-06-07 12:46:42.228
cmq3sfukq000x6wl0ayrqu3nf	/	\N	mobile	b83e290373b8d276	2026-06-07 12:58:38.09
cmq3wqxzq000y6wl0dlcf6xbw	/	\N	mobile	0016467db5802aa9	2026-06-07 14:59:14.199
cmq3xbvau000z6wl0byp7yr4p	/	\N	mobile	07ad653d0715a995	2026-06-07 15:15:30.486
cmq3xtjg300106wl0si9m236b	/	\N	mobile	9d6fdbf7c56fe0e1	2026-06-07 15:29:14.931
cmq3z8war00116wl0jvvfq2i3	/	\N	mobile	b83e290373b8d276	2026-06-07 16:09:11.043
cmq40uw8l00126wl0qg3bh1o1	/	\N	mobile	0016467db5802aa9	2026-06-07 16:54:17.013
cmq4dfzpa00136wl0vofpcnfs	/	\N	mobile	994c0ed884dbae01	2026-06-07 22:46:36.67
cmq4esddy00146wl0i2880h9l	/	\N	mobile	4c09324d652bbb4f	2026-06-07 23:24:13.894
cmq5d5cav00166wl0k6umyb8p	/	\N	desktop	738a2aebcde0ccbc	2026-06-08 15:26:05.959
cmq5d5m7c00176wl0kfyk5qs3	/	\N	desktop	738a2aebcde0ccbc	2026-06-08 15:26:18.792
cmq5d5nef00186wl0sfws0yaj	/	\N	desktop	738a2aebcde0ccbc	2026-06-08 15:26:20.343
cmq5d5ogy00196wl0pavk2km0	/	\N	desktop	738a2aebcde0ccbc	2026-06-08 15:26:21.73
cmq5d5pjw001a6wl0userpt93	/	\N	desktop	738a2aebcde0ccbc	2026-06-08 15:26:23.132
cmq5d9ayn001b6wl0ar29btxf	/	\N	desktop	738a2aebcde0ccbc	2026-06-08 15:29:10.847
cmq6g2i4h001c6wl0lp318igk	/	\N	desktop	34fcb2cc4ed9ed79	2026-06-09 09:35:38.561
cmq6pld88001d6wl0sngdubx5	/	\N	desktop	34fcb2cc4ed9ed79	2026-06-09 14:02:15.225
cmq6w8xd0001e6wl0tjkjfdss	/	google.com	mobile	34fcb2cc4ed9ed79	2026-06-09 17:08:32.1
cmq74sjx2001f6wl0bludzotj	/	google.com	mobile	614bcd7b466894ee	2026-06-09 21:07:44.726
cmq83yt1f00005cl0fn0xaggc	/	\N	desktop	0223a3db93fe74f9	2026-06-10 13:32:23.043
cmq84la4d00015cl0r6wa6fkr	/	\N	desktop	0223a3db93fe74f9	2026-06-10 13:49:51.613
cmq8depav00025cl0pthz4zdd	/	\N	mobile	8aa285df17c18654	2026-06-10 17:56:41.239
cmq8dfvuz00035cl0d7w79wrd	/	\N	mobile	8aa285df17c18654	2026-06-10 17:57:36.395
cmq8ds69u00045cl004pt4xyk	/	\N	mobile	5afc57be62c4c1ea	2026-06-10 18:07:09.762
cmq8dwjx500055cl0b9rnko9t	/	\N	mobile	8d27fad885287a72	2026-06-10 18:10:34.073
cmq8dwkok00065cl0zyal5n7r	/	\N	mobile	04401dba0b940468	2026-06-10 18:10:35.06
cmq8e1na700075cl011zudlzj	/	\N	mobile	c29ac7a86199952a	2026-06-10 18:14:31.711
cmq8h2xx500085cl005u0c3am	/	\N	desktop	fe7172fa9d9918cf	2026-06-10 19:39:31.001
cmq8hriz000095cl0qvppw5nk	/	\N	mobile	8aa285df17c18654	2026-06-10 19:58:38.028
cmq8htmbg000a5cl0wj55islp	/	\N	desktop	9b6c6e4216ee958f	2026-06-10 20:00:15.676
cmq8mys2k000b5cl03mw2u1nt	/	\N	mobile	00fe03512317645a	2026-06-10 22:24:14.492
cmq8nfk6s000c5cl0gydwadxh	/	\N	mobile	e75b189840ef3018	2026-06-10 22:37:17.428
cmq8ngte1000d5cl0dkn4pp3y	/	\N	mobile	136527794e304fa1	2026-06-10 22:38:16.009
cmq9esqzl000e5cl03cyl5anq	/	\N	desktop	8bf536e9415b2c54	2026-06-11 11:23:22.401
cmq9h98fo000f5cl0l663i4yi	/	\N	desktop	95b8c231db4a60e5	2026-06-11 12:32:10.74
cmq9hdi29000g5cl0lazqkxfv	/	\N	desktop	b63c5bb4f42e3d31	2026-06-11 12:35:29.841
cmq9hppp2000h5cl0ok741962	/	\N	mobile	561a16eecca9d87d	2026-06-11 12:44:59.606
cmq9w9la9000i5cl0d2cu21oo	/	\N	mobile	d69ffc404e792511	2026-06-11 19:32:21.633
cmq9zmrvp000j5cl04anumrzg	/	\N	mobile	23ada1aca1182f3f	2026-06-11 21:06:35.557
cmqfb40on000k5cl0mwnizrv7	/	\N	desktop	ca99d69421dc42c9	2026-06-15 14:26:46.775
cmqfhvb9w000l5cl0gxp7y1b8	/	\N	mobile	3cb54828ff29b53e	2026-06-15 17:35:57.908
cmqfiad78000m5cl0rojwu3qf	/	\N	mobile	b85adbeeddc89384	2026-06-15 17:47:40.244
cmqfil1gq000n5cl078w39mjq	/	\N	mobile	3cb54828ff29b53e	2026-06-15 17:55:58.25
cmqfj2i0a000o5cl0prqotl0h	/	\N	mobile	cc27e2a1f70205f8	2026-06-15 18:09:32.842
cmqfnukis000p5cl0y9hsu4js	/	\N	mobile	b85adbeeddc89384	2026-06-15 20:23:20.932
cmqfsfqv7000q5cl05d355h8w	/	\N	desktop	4e7f34e35be70b18	2026-06-15 22:31:47.395
cmqgaad1r000r5cl0n5cqslre	/	\N	desktop	bed24efa1796a2ca	2026-06-16 06:51:29.296
cmqgd20u3000s5cl0g89c3fqj	/	\N	desktop	d7de222c16637611	2026-06-16 08:08:59.067
cmqgdfj1k000u5cl0waqlc2y8	/book/pay	theworkplaceuk.co.uk	desktop	edc6f5c2ad4837c0	2026-06-16 08:19:29.192
cmqghwde0000v5cl008n33na8	/	\N	mobile	0bfcac89aaa1cb09	2026-06-16 10:24:33.48
cmqgs1ybo000w5cl0w6mgl59o	/	\N	mobile	0bfcac89aaa1cb09	2026-06-16 15:08:50.052
cmqh3y440000y5cl031w90q7w	/	\N	desktop	b092c4e13133a4f4	2026-06-16 20:41:46.32
cmqhufsm5000z5cl0ldk1jtey	/	\N	desktop	575869801ac46b1c	2026-06-17 09:03:21.246
cmqiddm5d00105cl0l6ih756p	/	\N	desktop	ffd7616be5c3812d	2026-06-17 17:53:32.257
cmqidgb0k00115cl0048utf4l	/	theworkplaceuk.co.uk	desktop	ffd7616be5c3812d	2026-06-17 17:55:37.796
cmqidh2mq00135cl02boikg7h	/book/pay	theworkplaceuk.co.uk	desktop	ffd7616be5c3812d	2026-06-17 17:56:13.586
cmqidhdez00145cl0y61c1787	/book/pay	theworkplaceuk.co.uk	desktop	ffd7616be5c3812d	2026-06-17 17:56:27.563
cmqidhrig00155cl020z5j3i4	/book/pay	theworkplaceuk.co.uk	desktop	ffd7616be5c3812d	2026-06-17 17:56:45.832
cmqilt7oc00165cl0wtult50x	/	google.com	desktop	d4c0c2537cbdf7fd	2026-06-17 21:49:36.924
cmqilumdn00185cl0hwisd7hb	/book/pay	theworkplaceuk.co.uk	desktop	d4c0c2537cbdf7fd	2026-06-17 21:50:42.635
cmqilvldy00195cl09f6xjzoh	/book/confirm	oppwa.com	desktop	d4c0c2537cbdf7fd	2026-06-17 21:51:28.006
cmqjhih1j001a5cl08oj7l4q5	/	\N	desktop	33e7b48a4193d9fd	2026-06-18 12:37:03.56
cmqqfpt4r001b5cl0nxwbxjio	/	\N	desktop	8d3d4858aea944f8	2026-06-23 09:21:09.82
cmqs0pnnz001d5cl0m9fy4ky5	/	\N	desktop	16872b6f7f6653ba	2026-06-24 11:56:40.848
cmqs8b41v001e5cl0om1tpmga	/	\N	desktop	16872b6f7f6653ba	2026-06-24 15:29:19.172
cmqslx0tk001f5cl0kshflm6i	/	\N	desktop	16872b6f7f6653ba	2026-06-24 21:50:16.424
\.


--
-- Data for Name: PromoCode; Type: TABLE DATA; Schema: public; Owner: twp_user
--

COPY public."PromoCode" (code, "discountHours", "expiresAt", "usageLimit", "usedCount", active, "createdAt") FROM stdin;
TESTCODE3	1	2030-12-31 00:00:00	1	1	f	2026-05-14 23:07:15.733
TESTCODE2	1	2030-12-31 00:00:00	1	1	f	2026-05-14 22:59:41.888
TESTCODE	1	\N	\N	1	f	2026-05-14 17:15:16.762
\.


--
-- Data for Name: SlotClosure; Type: TABLE DATA; Schema: public; Owner: twp_user
--

COPY public."SlotClosure" (id, date, "startHour", "endHour", reason, "createdAt") FROM stdin;
cmpcl8482000umul0hmunoifb	2026-06-06	8	9	\N	2026-05-19 12:06:53.282
cmpcl849v000wmul069bkb2zi	2026-06-06	10	11	\N	2026-05-19 12:06:53.347
cmpcl849u000vmul0teth1xrk	2026-06-06	9	10	\N	2026-05-19 12:06:53.346
cmpb9lel5000yr5l0kd6ymgzv	2026-05-16	8	9	\N	2026-05-18 13:53:31.673
cmpb9lelc000zr5l0ycf9a2se	2026-05-16	9	10	\N	2026-05-18 13:53:31.68
cmpb9leli0010r5l0szw5wcvy	2026-05-16	10	11	\N	2026-05-18 13:53:31.686
cmpb9lely0011r5l0pmphjjvb	2026-05-16	11	12	\N	2026-05-18 13:53:31.702
cmpb9lem80013r5l0qyw27iwf	2026-05-16	13	14	\N	2026-05-18 13:53:31.712
cmpb9lem00012r5l0mszvveld	2026-05-16	12	13	\N	2026-05-18 13:53:31.705
cmpb9lenv0014r5l06miim5c4	2026-05-16	14	15	\N	2026-05-18 13:53:31.771
cmpb9leo30015r5l0ksk239e4	2026-05-16	15	16	\N	2026-05-18 13:53:31.78
cmpb9leod0016r5l0u5r4x0fx	2026-05-16	16	17	\N	2026-05-18 13:53:31.789
cmpb9leov0017r5l0f765yfaw	2026-05-16	17	18	\N	2026-05-18 13:53:31.807
cmpb9leow0018r5l0my84tk52	2026-05-16	18	19	\N	2026-05-18 13:53:31.809
cmpb9lep40019r5l0c1ro94gd	2026-05-16	19	20	\N	2026-05-18 13:53:31.816
cmpb9lepp001ar5l0pjvl1yrx	2026-05-16	20	21	\N	2026-05-18 13:53:31.837
cmpb9lepq001br5l0v3vkkkcw	2026-05-16	21	22	\N	2026-05-18 13:53:31.839
cmpb9leq2001cr5l0dqimaynv	2026-05-16	22	23	\N	2026-05-18 13:53:31.85
cmpba4jjl001dr5l0od4x2e5l	2026-05-16	9	10	\N	2026-05-18 14:08:24.561
cmpba4jjm001er5l00647zovy	2026-05-16	11	12	\N	2026-05-18 14:08:24.562
cmpba4jjo001fr5l03xas5n3j	2026-05-16	10	11	\N	2026-05-18 14:08:24.564
cmpba4jjq001gr5l04fbf6mnc	2026-05-16	12	13	\N	2026-05-18 14:08:24.566
cmpba4jjt001hr5l0h49ysxx2	2026-05-16	13	14	\N	2026-05-18 14:08:24.569
cmpba4jjw001ir5l048qt9766	2026-05-16	8	9	\N	2026-05-18 14:08:24.572
cmpba4jl9001jr5l04kgi5kdq	2026-05-16	14	15	\N	2026-05-18 14:08:24.621
cmpba4jll001kr5l0nh7ln191	2026-05-16	15	16	\N	2026-05-18 14:08:24.633
cmpba4jlt001lr5l0gjs73lhd	2026-05-16	16	17	\N	2026-05-18 14:08:24.641
cmpba4jm3001mr5l0xryihy7m	2026-05-16	17	18	\N	2026-05-18 14:08:24.651
cmpba4jm8001nr5l0w5p1uniu	2026-05-16	18	19	\N	2026-05-18 14:08:24.656
cmpba4jmh001or5l0nxv57745	2026-05-16	19	20	\N	2026-05-18 14:08:24.665
cmpba4jms001pr5l0hpp9zhd8	2026-05-16	20	21	\N	2026-05-18 14:08:24.676
cmpba4jmx001qr5l0qe7421md	2026-05-16	21	22	\N	2026-05-18 14:08:24.681
cmpba4jnw001rr5l0jqwldje3	2026-05-16	22	23	\N	2026-05-18 14:08:24.716
cmpcl84a0000xmul0lwut0c9q	2026-06-06	11	12	\N	2026-05-19 12:06:53.352
cmpcl84a6000ymul0obphgxjr	2026-06-06	12	13	\N	2026-05-19 12:06:53.358
cmpcl84ab000zmul0k52emmgm	2026-06-06	13	14	\N	2026-05-19 12:06:53.363
cmpcl84ae0010mul0jstfx0vr	2026-06-06	14	15	\N	2026-05-19 12:06:53.366
cmpcl84bs0011mul059w7ab9q	2026-06-06	15	16	\N	2026-05-19 12:06:53.416
cmpcl84bx0012mul05tc9bkn8	2026-06-06	16	17	\N	2026-05-19 12:06:53.421
cmpcl84c10013mul0qi9fi4yr	2026-06-06	17	18	\N	2026-05-19 12:06:53.425
cmpcl84c50014mul0ljhrobj7	2026-06-06	18	19	\N	2026-05-19 12:06:53.429
cmpcl84cb0015mul0qqzf130v	2026-06-06	19	20	\N	2026-05-19 12:06:53.435
cmpcl84cd0016mul0gvkdhvia	2026-06-06	20	21	\N	2026-05-19 12:06:53.437
cmpcl84d60017mul0jw140q1r	2026-06-06	21	22	\N	2026-05-19 12:06:53.466
cmpcl84dh0018mul0d9srlo4l	2026-06-06	22	23	\N	2026-05-19 12:06:53.477
cmpcl857r0019mul0o7rdnhkc	2026-06-13	8	9	\N	2026-05-19 12:06:54.567
cmpcl857v001amul0lt9dv7fb	2026-06-13	9	10	\N	2026-05-19 12:06:54.571
cmpcl857y001bmul0eo2gxaud	2026-06-13	10	11	\N	2026-05-19 12:06:54.574
cmpcl8586001cmul0upz7sinw	2026-06-13	11	12	\N	2026-05-19 12:06:54.582
cmpcl858l001dmul04bqxlrqf	2026-06-13	12	13	\N	2026-05-19 12:06:54.597
cmpcl858q001emul0p99ejt25	2026-06-13	13	14	\N	2026-05-19 12:06:54.602
cmpcl858u001fmul0eopbrc5b	2026-06-13	14	15	\N	2026-05-19 12:06:54.606
cmpcl858y001gmul0t28ddtq1	2026-06-13	15	16	\N	2026-05-19 12:06:54.61
cmpcl8593001hmul0h33h6ty6	2026-06-13	16	17	\N	2026-05-19 12:06:54.615
cmpcl8597001imul0b3uh641v	2026-06-13	17	18	\N	2026-05-19 12:06:54.619
cmpcl859h001jmul0djj0pwlu	2026-06-13	18	19	\N	2026-05-19 12:06:54.629
cmpcl859l001kmul036tf5djo	2026-06-13	19	20	\N	2026-05-19 12:06:54.633
cmpcl859s001lmul0h1ku5yyw	2026-06-13	20	21	\N	2026-05-19 12:06:54.64
cmpcl859w001mmul08e94zltx	2026-06-13	21	22	\N	2026-05-19 12:06:54.644
cmpcl85a0001nmul0bwsztwj6	2026-06-13	22	23	\N	2026-05-19 12:06:54.648
cmpcl869a001omul0j2vt82to	2026-06-20	8	9	\N	2026-05-19 12:06:55.918
cmpcl869i001pmul010y9qnjn	2026-06-20	9	10	\N	2026-05-19 12:06:55.926
cmpcl869m001qmul0wj6rvj80	2026-06-20	10	11	\N	2026-05-19 12:06:55.93
cmpcl869q001rmul0puwhkmw2	2026-06-20	11	12	\N	2026-05-19 12:06:55.934
cmpcl86a6001smul09z7n33on	2026-06-20	12	13	\N	2026-05-19 12:06:55.95
cmpcl86ae001tmul0vp9z0up6	2026-06-20	13	14	\N	2026-05-19 12:06:55.958
cmpcl86an001umul0ime9gy2f	2026-06-20	14	15	\N	2026-05-19 12:06:55.967
cmpcl86b0001xmul05kc0puwk	2026-06-20	17	18	\N	2026-05-19 12:06:55.98
cmpcl86b8001ymul0tfm0ei1y	2026-06-20	18	19	\N	2026-05-19 12:06:55.988
cmpcl86bi001zmul00kxygzzu	2026-06-20	19	20	\N	2026-05-19 12:06:55.998
cmpcl86bt0020mul021kf67t1	2026-06-20	20	21	\N	2026-05-19 12:06:56.009
cmpcl86bx0021mul0yluudbhr	2026-06-20	21	22	\N	2026-05-19 12:06:56.013
cmpcl86c10022mul0yfzhk1wf	2026-06-20	22	23	\N	2026-05-19 12:06:56.017
cmpcl87rl0023mul0462wwgfm	2026-06-27	8	9	\N	2026-05-19 12:06:57.873
cmpcl87rp0024mul0goy7eqyh	2026-06-27	9	10	\N	2026-05-19 12:06:57.877
cmpcl87ru0025mul01dnh88ze	2026-06-27	10	11	\N	2026-05-19 12:06:57.882
cmpcl87sv0029mul0gx1kbten	2026-06-27	14	15	\N	2026-05-19 12:06:57.919
cmpcl87u0002emul0suv3nli4	2026-06-27	19	20	\N	2026-05-19 12:06:57.96
cmpcl87u4002fmul0s004vgfr	2026-06-27	20	21	\N	2026-05-19 12:06:57.964
cmpcl87u8002gmul0fzfs5x2q	2026-06-27	21	22	\N	2026-05-19 12:06:57.968
cmpcl87ue002hmul0o13w6pk8	2026-06-27	22	23	\N	2026-05-19 12:06:57.974
cmpcl8a5s002kmul0bsl42mbx	2026-07-11	10	11	\N	2026-05-19 12:07:00.976
cmpcl8a60002lmul00awf9ssq	2026-07-11	11	12	\N	2026-05-19 12:07:00.984
cmpcl8a6k002nmul0iyt8nrrr	2026-07-11	13	14	\N	2026-05-19 12:07:01.004
cmpcl8a6u002omul0fas9rsl6	2026-07-11	14	15	\N	2026-05-19 12:07:01.014
cmpcl8a6y002pmul0899oh7zf	2026-07-11	15	16	\N	2026-05-19 12:07:01.018
cmpcl8a75002qmul0bed9530v	2026-07-11	16	17	\N	2026-05-19 12:07:01.025
cmpcl8a78002rmul06sckxebr	2026-07-11	17	18	\N	2026-05-19 12:07:01.028
cmpcl8a7l002smul0bzqj2qcw	2026-07-11	18	19	\N	2026-05-19 12:07:01.041
cmpcl8a7t002tmul0227uyqcw	2026-07-11	19	20	\N	2026-05-19 12:07:01.049
cmpcl8a80002vmul0uakgxo7k	2026-07-11	21	22	\N	2026-05-19 12:07:01.056
cmpcl8a87002wmul0ebjwvnak	2026-07-11	22	23	\N	2026-05-19 12:07:01.064
cmpcl8c1w002xmul0ranxkwsb	2026-07-18	8	9	\N	2026-05-19 12:07:03.428
cmpcl8c340031mul0pv3tk7vx	2026-07-18	12	13	\N	2026-05-19 12:07:03.472
cmpcl8c3d0032mul0oymcx7qm	2026-07-18	13	14	\N	2026-05-19 12:07:03.481
cmpcl8c3m0033mul0hjafi9r5	2026-07-18	14	15	\N	2026-05-19 12:07:03.49
cmpcl8c3y0034mul02tunk5zo	2026-07-18	15	16	\N	2026-05-19 12:07:03.502
cmpcl8c470035mul0genfxzz4	2026-07-18	16	17	\N	2026-05-19 12:07:03.511
cmpcl8c4u0038mul0ku7g7dui	2026-07-18	19	20	\N	2026-05-19 12:07:03.534
cmpcl8c520039mul062ukmtsa	2026-07-18	20	21	\N	2026-05-19 12:07:03.542
cmpcl86as001vmul0pwf0uczr	2026-06-20	15	16	\N	2026-05-19 12:06:55.972
cmpcl86az001wmul0busrsnms	2026-06-20	16	17	\N	2026-05-19 12:06:55.979
cmpcl87ss0028mul09thaxsiw	2026-06-27	13	14	\N	2026-05-19 12:06:57.916
cmpcl8a5k002imul0zemns227	2026-07-11	8	9	\N	2026-05-19 12:07:00.968
cmpcl8a5r002jmul0baaqm4nx	2026-07-11	9	10	\N	2026-05-19 12:07:00.975
cmpcl8a61002mmul0vtxsrwoo	2026-07-11	12	13	\N	2026-05-19 12:07:00.985
cmpcl8a7u002umul0emd0h7ab	2026-07-11	20	21	\N	2026-05-19 12:07:01.05
cmpcl8c2q002zmul0lwm3a39g	2026-07-18	10	11	\N	2026-05-19 12:07:03.458
cmpcl8c480036mul0h0z7h8f2	2026-07-18	17	18	\N	2026-05-19 12:07:03.512
cmpcl8c4t0037mul0921sxkrl	2026-07-18	18	19	\N	2026-05-19 12:07:03.533
cmpcl87s80026mul01wuwe6yu	2026-06-27	11	12	\N	2026-05-19 12:06:57.896
cmpcl87ss0027mul0oc29mp9b	2026-06-27	12	13	\N	2026-05-19 12:06:57.916
cmpcl87sy002amul0eaho0435	2026-06-27	15	16	\N	2026-05-19 12:06:57.922
cmpcl87td002bmul0w8suqebf	2026-06-27	16	17	\N	2026-05-19 12:06:57.937
cmpcl87tl002cmul0na10p0pz	2026-06-27	17	18	\N	2026-05-19 12:06:57.945
cmpcl87tz002dmul0f8sf0d98	2026-06-27	18	19	\N	2026-05-19 12:06:57.959
cmpcl8c2s0030mul0auxhejcp	2026-07-18	11	12	\N	2026-05-19 12:07:03.46
cmpcl8c53003amul089s89b8p	2026-07-18	21	22	\N	2026-05-19 12:07:03.543
cmpcl8c5f003bmul0oyky1b1n	2026-07-18	22	23	\N	2026-05-19 12:07:03.555
cmpcl9snb003cmul0x5utwjf2	2026-07-18	9	10	\N	2026-05-19 12:08:11.591
cmqh2361g000x5cl0mjbbwo3u	2026-06-16	14	15	\N	2026-06-16 19:49:42.868
cmqqfpxjc001c5cl0qzroubxj	2026-06-23	14	15	\N	2026-06-23 09:21:15.528
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: twp_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
cb3b1a4a-2fd3-4bad-af7b-5f8508818252	5cd77620cab16a33047e070cdb6a48df6c2bb5de1e2dec935019dd16252e7fd1	2026-05-13 06:00:24.139868+00	20260513060024_init	\N	\N	2026-05-13 06:00:24.113696+00	1
\.


--
-- Name: AdminUser AdminUser_pkey; Type: CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public."AdminUser"
    ADD CONSTRAINT "AdminUser_pkey" PRIMARY KEY (id);


--
-- Name: Booking Booking_pkey; Type: CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_pkey" PRIMARY KEY (id);


--
-- Name: DayOverride DayOverride_pkey; Type: CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public."DayOverride"
    ADD CONSTRAINT "DayOverride_pkey" PRIMARY KEY (date);


--
-- Name: PageView PageView_pkey; Type: CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public."PageView"
    ADD CONSTRAINT "PageView_pkey" PRIMARY KEY (id);


--
-- Name: PromoCode PromoCode_pkey; Type: CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public."PromoCode"
    ADD CONSTRAINT "PromoCode_pkey" PRIMARY KEY (code);


--
-- Name: SlotClosure SlotClosure_pkey; Type: CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public."SlotClosure"
    ADD CONSTRAINT "SlotClosure_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: AdminUser_email_key; Type: INDEX; Schema: public; Owner: twp_user
--

CREATE UNIQUE INDEX "AdminUser_email_key" ON public."AdminUser" USING btree (email);


--
-- Name: Booking_date_idx; Type: INDEX; Schema: public; Owner: twp_user
--

CREATE INDEX "Booking_date_idx" ON public."Booking" USING btree (date);


--
-- Name: Booking_status_idx; Type: INDEX; Schema: public; Owner: twp_user
--

CREATE INDEX "Booking_status_idx" ON public."Booking" USING btree (status);


--
-- Name: DayOverride_date_idx; Type: INDEX; Schema: public; Owner: twp_user
--

CREATE INDEX "DayOverride_date_idx" ON public."DayOverride" USING btree (date);


--
-- Name: PageView_createdAt_idx; Type: INDEX; Schema: public; Owner: twp_user
--

CREATE INDEX "PageView_createdAt_idx" ON public."PageView" USING btree ("createdAt");


--
-- Name: PageView_path_idx; Type: INDEX; Schema: public; Owner: twp_user
--

CREATE INDEX "PageView_path_idx" ON public."PageView" USING btree (path);


--
-- Name: SlotClosure_date_idx; Type: INDEX; Schema: public; Owner: twp_user
--

CREATE INDEX "SlotClosure_date_idx" ON public."SlotClosure" USING btree (date);


--
-- Name: Booking Booking_promoCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: twp_user
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_promoCode_fkey" FOREIGN KEY ("promoCode") REFERENCES public."PromoCode"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict MZ6tSBJMNbIEizLFmYurPlARBX7zqFaFqDBSg8HK5sSSsymjYc3MpfKSXyeDO2a


--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-01 19:12:26

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
-- TOC entry 201 (class 1259 OID 49309)
-- Name: dept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept (
    id integer NOT NULL,
    name_dept character varying(50),
    treatment character varying(200),
    opd_id integer
);


ALTER TABLE public.dept OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 49319)
-- Name: ipd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ipd (
    opd_id integer NOT NULL,
    dept_id integer NOT NULL,
    icd_code character varying(10),
    outcome character varying(10)
);


ALTER TABLE public.ipd OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 49334)
-- Name: lab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lab (
    id integer NOT NULL,
    name_test character varying(50),
    opd_id integer
);


ALTER TABLE public.lab OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 49304)
-- Name: opd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opd (
    id integer NOT NULL,
    name character varying(50),
    age integer,
    sex character(4),
    adress character varying(200),
    complain character varying(200)
);


ALTER TABLE public.opd OWNER TO postgres;

--
-- TOC entry 3003 (class 0 OID 49309)
-- Dependencies: 201
-- Data for Name: dept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept (id, name_dept, treatment, opd_id) FROM stdin;
1	medi	pcm	1
2	medi	pcm	2
3	skin	tube	2
4	skin	tube	3
\.


--
-- TOC entry 3004 (class 0 OID 49319)
-- Dependencies: 202
-- Data for Name: ipd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ipd (opd_id, dept_id, icd_code, outcome) FROM stdin;
1	1	10	di
1	3	21	di
2	1	22	di
3	3	22	di
\.


--
-- TOC entry 3005 (class 0 OID 49334)
-- Dependencies: 203
-- Data for Name: lab; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lab (id, name_test, opd_id) FROM stdin;
1	psmp	1
2	psmp	1
3	psmp	3
4	widal	1
5	tc	1
6	dc	1
7	hb	1
8	xray	1
9	patch	3
10	rbs	2
\.


--
-- TOC entry 3002 (class 0 OID 49304)
-- Dependencies: 200
-- Data for Name: opd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opd (id, name, age, sex, adress, complain) FROM stdin;
1	naresh	39	male	abcd	bbbb
2	paresh	40	male	abc	mmm
3	kavi	23	fema	acg	mmmm
\.


--
-- TOC entry 2863 (class 2606 OID 49313)
-- Name: dept dept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 49323)
-- Name: ipd ipd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipd
    ADD CONSTRAINT ipd_pkey PRIMARY KEY (opd_id, dept_id);


--
-- TOC entry 2867 (class 2606 OID 49338)
-- Name: lab lab_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lab
    ADD CONSTRAINT lab_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 49308)
-- Name: opd opd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opd
    ADD CONSTRAINT opd_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 49314)
-- Name: dept dept_opd_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_opd_id_fkey FOREIGN KEY (opd_id) REFERENCES public.opd(id);


--
-- TOC entry 2870 (class 2606 OID 49329)
-- Name: ipd ipd_dept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipd
    ADD CONSTRAINT ipd_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES public.dept(id);


--
-- TOC entry 2869 (class 2606 OID 49324)
-- Name: ipd ipd_opd_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipd
    ADD CONSTRAINT ipd_opd_id_fkey FOREIGN KEY (opd_id) REFERENCES public.opd(id);


--
-- TOC entry 2871 (class 2606 OID 49339)
-- Name: lab lab_opd_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lab
    ADD CONSTRAINT lab_opd_id_fkey FOREIGN KEY (opd_id) REFERENCES public.opd(id);


-- Completed on 2021-04-01 19:12:30

--
-- PostgreSQL database dump complete
--


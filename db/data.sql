--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: db_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('db_types_id_seq', 4, true);


--
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hosts_id_seq', 4, true);


--
-- Name: schema_defs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('schema_defs_id_seq', 160, true);


--
-- Data for Name: db_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY db_types (id, full_name, simple_name, setup_script_template, jdbc_class_name, drop_script_template, custom_jdbc_attributes, batch_separator, notes, sample_fragment) FROM stdin;
4	Oracle 11g R2	Oracle	create user user_#databaseName# identified by "#databaseName#" quota 5M on system profile fiddleusers\n/\ngrant create session, create synonym, create table, create type, create view to user_#databaseName#	oracle.jdbc.OracleDriver	drop user user_#databaseName# cascade	\N	/	Oracle does not support multiple statements in batch.  Separate each statement with a line consisting of a single /, and do not terminate statements with semicolons.	\N
2	MySQL 5.5.20	MySQL	CREATE database db_#databaseName#;\nGRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX,CREATE TEMPORARY TABLES,CREATE VIEW,SHOW VIEW\n ON db_#databaseName#.* TO user_#databaseName#@localhost IDENTIFIED BY '#databaseName#';	org.gjt.mm.mysql.Driver	DROP DATABASE db_#databaseName#; drop user user_#databaseName#@localhost;	allowMultiQueries=true	\N	Separate multiple statements in MySQL by terminating each one with a semicolon.	\N
1	PostgreSQL 9.1.2	PostgreSQL	CREATE USER user_#databaseName# PASSWORD '#databaseName#';\nCREATE DATABASE db_#databaseName# OWNER user_#databaseName# ENCODING 'UTF8';	org.postgresql.Driver	SELECT pg_terminate_backend(pg_stat_activity.procpid)                                     FROM pg_stat_activity                                                                                                                             WHERE pg_stat_activity.datname = 'db_#databaseName#';                                                                                            DROP DATABASE db_#databaseName#;\n DROP USER user_#databaseName#;\n	\N	\N	Separate multiple statements in PostgreSQL by terminating each one with a semicolon.	\N
3	MS SQL Server 2008 R2	SQL Server	CREATE DATABASE db_#databaseName#;\nGO\n\nUSE db_#databaseName#;\nGO\n\nCREATE LOGIN user_#databaseName#\nWITH PASSWORD = '#databaseName#';\nGO\n\nCREATE USER user_#databaseName#;\nGO\n\nGRANT \nCREATE TABLE,\nCREATE TYPE,\nCREATE VIEW,\nDELETE,\nINSERT,\nREFERENCES,\nSELECT,\nSHOWPLAN,\nUPDATE\nTO user_#databaseName#;\nGO\n\n\nALTER LOGIN user_#databaseName# WITH DEFAULT_DATABASE=db_#databaseName#;\nGO\n\nGRANT ALTER ON SCHEMA::dbo TO user_#databaseName#;\nGO\n\nuse master;\n	net.sourceforge.jtds.jdbc.Driver	exec dbo.clearDBUsers 'db_#databaseName#';\nGO\ndrop database db_#databaseName#;\nGO\ndrop login user_#databaseName#;\nGO\n\n	\N	GO	SQL Server supports multiple statements in a batch separated by semicolons. Separate statement batches with a line consisting of a single GO command, as needed.	\N
\.


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hosts (id, db_type_id, jdbc_url_template, cf_dsn) FROM stdin;
1	1	jdbc:postgresql://127.0.0.1:5432/#databaseName#	sqlfiddle_pg1
2	2	jdbc:mysql://127.0.0.1:3306/#databaseName#?allowMultiQueries=true&useLocalTransactionState=true	sqlfiddle_mysql1
3	3	jdbc:jtds:sqlserver://sqlfiddlewin:1433/#databaseName#	sqlfiddle_mssql1
4	4	jdbc:oracle:thin:@//sqlfiddlewin:1521/xe	sqlfiddle_oracle1
\.


--
-- PostgreSQL database dump complete
--


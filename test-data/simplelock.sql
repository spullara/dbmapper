-- Copyright (c) 2005, Gauntlet Systems Corporation. All Rights Reserved.
--
-- Name: build; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE build (
    id serial NOT NULL,
    change_id integer NOT NULL,
    duration integer,
    success boolean,
    errmsg text,
    reportdir character varying(1024),
    artifactdir character varying(1024),
    module_id integer NOT NULL,
    started timestamp with time zone NOT NULL,
    log text,
    stack_trace text,
    environment_id integer
);


--
-- Name: change; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE change (
    id serial NOT NULL,
    revision integer NOT NULL,
    state integer NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: sandbox; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE sandbox (
    id serial NOT NULL,
    path character varying(1024) NOT NULL,
    state integer,
    repository_id integer
);


--
-- Name: sandbox_change; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE sandbox_change (
    id serial NOT NULL,
    change_id integer NOT NULL,
    sandbox_id integer NOT NULL,
    trunk_revision integer
);


--
-- Name: b_c_r_sc_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW b_c_r_sc_view AS
    SELECT DISTINCT b.id AS build, b.success, b.module_id AS module, c.id AS change, c.revision, s.id AS sandbox FROM build b, ((change c LEFT JOIN sandbox_change sc ON ((sc.change_id = c.id))) LEFT JOIN sandbox s ON ((s.id = sc.sandbox_id))) WHERE (c.id = b.change_id) ORDER BY b.id, b.success, b.module_id, c.id, c.revision, s.id;


--
-- Name: build_fixed_by; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE build_fixed_by (
    build integer,
    fix_build integer
);


--
-- Name: build_fixed_by_revision_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW build_fixed_by_revision_view AS
    SELECT b.build, min(b1.revision) AS fix_revision FROM b_c_r_sc_view b, b_c_r_sc_view b1 WHERE (((((b.success = false) AND (b1.success = true)) AND (b.revision <= b1.revision)) AND (b.module = b1.module)) AND ((b.sandbox = b1.sandbox) OR (b.sandbox IS NULL))) GROUP BY b.build;


--
-- Name: build_fixed_by_build_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW build_fixed_by_build_view AS
    SELECT b.id AS build, max(b1.id) AS fix_build FROM build b, build b1, build_fixed_by_revision_view p, change c1 WHERE ((((b.id = p.build) AND (b1.change_id = c1.id)) AND (c1.revision = p.fix_revision)) AND (b.module_id = b1.module_id)) GROUP BY b.id;


--
-- Name: build_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('build', 'id'), 36, true);


--
-- Name: change_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('change', 'id'), 20, true);


--
-- Name: change_module; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE change_module (
    change_id integer NOT NULL,
    module_id integer NOT NULL
);


--
-- Name: data; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE data (
    id serial NOT NULL,
    parent_id integer NOT NULL,
    data_class_id integer NOT NULL,
    int_field1 integer,
    int_field2 integer,
    int_field3 integer,
    int_field4 integer,
    int_field5 integer,
    int_field6 integer,
    int_field7 integer,
    int_field8 integer,
    int_field9 integer,
    int_field10 integer,
    float_field1 double precision,
    float_field2 double precision,
    float_field3 double precision,
    float_field4 double precision,
    float_field5 double precision,
    float_field6 double precision,
    float_field7 double precision,
    float_field8 double precision,
    float_field9 double precision,
    float_field10 double precision,
    string_field1 text,
    string_field2 text,
    string_field3 text,
    string_field4 text,
    string_field5 text,
    string_field6 text,
    string_field7 text,
    string_field8 text,
    string_field9 text,
    string_field10 text,
    date_field1 timestamp with time zone,
    date_field3 timestamp with time zone,
    date_field2 timestamp with time zone,
    boolean_field1 boolean,
    boolean_field2 boolean,
    bytes_field1 bytea,
    bytes_field2 bytea,
    bytes_field3 bytea
);


--
-- Name: data_class; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE data_class (
    id serial NOT NULL,
    name text NOT NULL,
    parent_entity text NOT NULL,
    int_field1_name text,
    int_field2_name text,
    int_field3_name text,
    int_field4_name text,
    int_field5_name text,
    int_field6_name text,
    int_field7_name text,
    int_field8_name text,
    int_field9_name text,
    int_field10_name text,
    float_field1_name text,
    float_field2_name text,
    float_field3_name text,
    float_field4_name text,
    float_field5_name text,
    float_field6_name text,
    float_field7_name text,
    float_field8_name text,
    float_field9_name text,
    float_field10_name text,
    string_field1_name text,
    string_field2_name text,
    string_field3_name text,
    string_field4_name text,
    string_field5_name text,
    string_field6_name text,
    string_field7_name text,
    string_field8_name text,
    string_field9_name text,
    string_field10_name text,
    boolean_field1_name text,
    boolean_field2_name text,
    bytes_field1_name text,
    bytes_field2_name text,
    bytes_field3_name text,
    int_field1_description text,
    int_field2_description text,
    int_field3_description text,
    int_field4_description text,
    int_field5_description text,
    int_field6_description text,
    int_field7_description text,
    int_field8_description text,
    int_field9_description text,
    int_field10_description text,
    float_field1_description text,
    float_field2_description text,
    float_field3_description text,
    float_field4_description text,
    float_field5_description text,
    float_field6_description text,
    float_field7_description text,
    float_field8_description text,
    float_field9_description text,
    float_field10_description text,
    string_field1_description text,
    string_field2_description text,
    string_field3_description text,
    string_field4_description text,
    string_field5_description text,
    string_field6_description text,
    string_field7_description text,
    string_field8_description text,
    string_field9_description text,
    string_field10_description text,
    boolean_field1_description text,
    boolean_field2_description text,
    bytes_field1_description text,
    bytes_field2_description text,
    bytes_field3_description text,
    date_field1_name text,
    date_field2_name text,
    date_field3_name text,
    date_field1_description text,
    date_field2_description text,
    date_field3_description text,
    int_field1_group text,
    int_field2_group text,
    int_field3_group text,
    int_field4_group text,
    int_field5_group text,
    int_field6_group text,
    int_field7_group text,
    int_field8_group text,
    int_field9_group text,
    int_field10_group text,
    float_field1_group text,
    float_field2_group text,
    float_field3_group text,
    float_field4_group text,
    float_field5_group text,
    float_field6_group text,
    float_field7_group text,
    float_field8_group text,
    float_field9_group text,
    float_field10_group text,
    string_field1_group text,
    string_field2_group text,
    string_field3_group text,
    string_field4_group text,
    string_field5_group text,
    string_field6_group text,
    string_field7_group text,
    string_field8_group text,
    string_field9_group text,
    string_field10_group text,
    bytes_field1_group text,
    bytes_field2_group text,
    bytes_field3_group text,
    date_field1_group text,
    date_field2_group text,
    date_field3_group text,
    boolean_field1_group text,
    boolean_field2_group text
);


--
-- Name: data_class_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('data_class', 'id'), 1, false);


--
-- Name: data_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('data', 'id'), 1, false);


--
-- Name: emma; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma (
    id serial NOT NULL,
    build_id integer NOT NULL,
    total_packages integer,
    total_classes integer,
    covered_classes integer,
    total_methods integer,
    covered_methods integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    class_coverage double precision,
    method_coverage double precision,
    block_coverage double precision,
    line_coverage double precision,
    report_path text
);


--
-- Name: emma_class; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_class (
    id serial NOT NULL,
    emma_package_id integer NOT NULL,
    emma_srcfile_id integer,
    name character varying(1024) NOT NULL
);


--
-- Name: emma_class_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_class', 'id'), 2, true);


--
-- Name: emma_class_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_class_report (
    id serial NOT NULL,
    emma_class_id integer NOT NULL,
    emma_srcfile_report_id integer,
    emma_package_report_id integer NOT NULL,
    total_classes integer,
    covered_classes integer,
    total_methods integer,
    covered_methods integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    class_coverage double precision,
    method_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: emma_class_report_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_class_report', 'id'), 5, true);


--
-- Name: emma_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma', 'id'), 3, true);


--
-- Name: emma_method; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_method (
    id serial NOT NULL,
    emma_class_id integer NOT NULL,
    name character varying(1024) NOT NULL
);


--
-- Name: emma_method_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_method', 'id'), 7, true);


--
-- Name: emma_method_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_method_report (
    id serial NOT NULL,
    emma_method_id integer NOT NULL,
    emma_class_report_id integer NOT NULL,
    total_methods integer,
    covered_methods integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    method_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: emma_method_report_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_method_report', 'id'), 18, true);


--
-- Name: emma_package; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_package (
    id serial NOT NULL,
    module_id integer NOT NULL,
    name character varying(1024) NOT NULL
);


--
-- Name: emma_package_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_package', 'id'), 1, true);


--
-- Name: emma_package_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_package_report (
    id serial NOT NULL,
    emma_id integer NOT NULL,
    emma_package_id integer NOT NULL,
    total_classes integer,
    covered_classes integer,
    total_methods integer,
    covered_methods integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    class_coverage double precision,
    method_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: emma_package_report_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_package_report', 'id'), 3, true);


--
-- Name: emma_srcfile; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_srcfile (
    id serial NOT NULL,
    emma_package_id integer NOT NULL,
    name character varying(1024) NOT NULL
);


--
-- Name: emma_srcfile_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_srcfile', 'id'), 2, true);


--
-- Name: emma_srcfile_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_srcfile_report (
    id serial NOT NULL,
    emma_srcfile_id integer NOT NULL,
    emma_package_report_id integer NOT NULL,
    total_classes integer,
    covered_classes integer,
    total_methods integer,
    covered_methods integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    class_coverage double precision,
    method_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: emma_srcfile_report_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('emma_srcfile_report', 'id'), 5, true);


--
-- Name: environment; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE environment (
    id serial NOT NULL,
    name character varying(128) NOT NULL,
    description text
);


--
-- Name: environment_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('environment', 'id'), 1, false);


--
-- Name: gauntlet_user; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE gauntlet_user (
    id serial NOT NULL,
    login_name character varying(99) NOT NULL,
    password_value character varying(32) NOT NULL,
    password_hex character varying(32) NOT NULL,
    first_name character varying(99),
    last_name character varying(99),
    email character varying(99),
    confirm_value character varying(99),
    modified timestamp without time zone,
    created timestamp without time zone,
    last_login timestamp without time zone,
    objectdata character varying(4000)
);


--
-- Name: gauntlet_user_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('gauntlet_user', 'id'), 5, true);


--
-- Name: gauntlet_version; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE gauntlet_version (
    version integer NOT NULL
);


--
-- Name: meta_property; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE meta_property (
    id serial NOT NULL,
    name character varying(128) NOT NULL,
    "type" character varying(128) NOT NULL,
    scope character varying(32) NOT NULL,
    data_type integer NOT NULL,
    multi_value boolean,
    default_value text,
    default_int integer,
    min_value integer,
    max_value integer,
    description text
);


--
-- Name: meta_property_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('meta_property', 'id'), 14, true);


--
-- Name: module; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE module (
    id serial NOT NULL,
    project_id integer NOT NULL,
    name character varying(100) NOT NULL,
    build_trunk_id integer
);


--
-- Name: module_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('module', 'id'), 3, true);


--
-- Name: module_trunk; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE module_trunk (
    module_id integer NOT NULL,
    trunk_id integer NOT NULL
);


--
-- Name: next_visible_rev_by_build_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW next_visible_rev_by_build_view AS
    SELECT b.build, min(b1.revision) AS next_revision FROM b_c_r_sc_view b, b_c_r_sc_view b1 WHERE (((b.module = b1.module) AND (b1.revision > b.revision)) AND ((b1.success = true) OR ((b.sandbox = b1.sandbox) OR (b1.sandbox IS NULL)))) GROUP BY b.build;


--
-- Name: path_lock; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE path_lock (
    id integer DEFAULT nextval('gauntletrun_tstamp_2005_12_12_13_27_57_356.path_lock_id_seq'::text) NOT NULL,
    sandbox_id integer,
    path character varying(1024) NOT NULL,
    created timestamp without time zone NOT NULL,
    txn character varying(16) NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: path_lock_id_seq; Type: SEQUENCE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE SEQUENCE path_lock_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: path_lock_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval('path_lock_id_seq', 38, true);


--
-- Name: prev_succ_build; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE prev_succ_build (
    build integer,
    prev_build integer
);


--
-- Name: prev_succ_revision_by_build_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW prev_succ_revision_by_build_view AS
    SELECT b.id AS build, max(c1.revision) AS prev_revision FROM build b, build b1, change c, change c1 WHERE ((((((b.module_id = b1.module_id) AND (b1.change_id = c1.id)) AND (b.change_id = c.id)) AND (c.revision > c1.revision)) AND (b.success = true)) AND (b1.success = true)) GROUP BY b.id;


--
-- Name: prev_succ_build_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW prev_succ_build_view AS
    SELECT b.id AS build, max(b1.id) AS prev_build FROM build b, build b1, change c1, prev_succ_revision_by_build_view p WHERE ((((b.id = p.build) AND (b1.change_id = c1.id)) AND (c1.revision = p.prev_revision)) AND (b.module_id = b1.module_id)) GROUP BY b.id;


--
-- Name: project; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE project (
    id serial NOT NULL,
    name character varying(1024) NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('project', 'id'), 1, true);


--
-- Name: property; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE property (
    id serial NOT NULL,
    gauntlet_user_id integer,
    role_id integer,
    repository_id integer,
    project_id integer,
    module_id integer,
    sandbox_id integer,
    environment_id integer,
    ordinal integer,
    text_value text,
    int_value integer,
    meta_property_id integer NOT NULL
);


--
-- Name: property_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('property', 'id'), 4, true);


--
-- Name: repository; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE repository (
    id serial NOT NULL,
    name character varying(1024) NOT NULL,
    url character varying(1024) NOT NULL,
    path character varying(1024),
    dir character varying(1024)
);


--
-- Name: repository_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('repository', 'id'), 1, true);


--
-- Name: role; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE role (
    id serial NOT NULL,
    name character varying(32) NOT NULL,
    description text
);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('role', 'id'), 2, true);


--
-- Name: sandbox_change_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('sandbox_change', 'id'), 20, true);


--
-- Name: sandbox_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('sandbox', 'id'), 4, true);


--
-- Name: suite_result; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE suite_result (
    id serial NOT NULL,
    suite_id integer NOT NULL,
    build_id integer NOT NULL,
    num_tests integer NOT NULL,
    num_errors integer NOT NULL,
    num_failures integer NOT NULL,
    duration double precision
);


--
-- Name: suite_result_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('suite_result', 'id'), 6, true);


--
-- Name: svnlog; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE svnlog (
    id serial NOT NULL,
    change_id integer NOT NULL,
    author text,
    msg text,
    commit_date timestamp with time zone NOT NULL,
    hour_of_day integer NOT NULL,
    day_of_week integer NOT NULL,
    day_of_month integer NOT NULL,
    day_of_year integer NOT NULL,
    week_of_month integer NOT NULL,
    week_of_year integer NOT NULL,
    month_of_year integer NOT NULL,
    the_year integer NOT NULL,
    num_files integer NOT NULL
);


--
-- Name: svnlog_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('svnlog', 'id'), 20, true);


--
-- Name: svnlog_path; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE svnlog_path (
    id serial NOT NULL,
    svnlog_id integer NOT NULL,
    commit_action character varying(4) NOT NULL,
    path text NOT NULL
);


--
-- Name: svnlog_path_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('svnlog_path', 'id'), 37, true);


--
-- Name: table_updates; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW table_updates AS
    SELECT sum(((pg_stat_all_tables.n_tup_ins + pg_stat_all_tables.n_tup_del) + pg_stat_all_tables.n_tup_upd)) AS sum FROM pg_stat_all_tables;


--
-- Name: test_case; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE test_case (
    id serial NOT NULL,
    suite_id integer NOT NULL,
    classname character varying(300),
    method character varying(200)
);


--
-- Name: test_case_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('test_case', 'id'), 25, true);


--
-- Name: test_result; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE test_result (
    id serial NOT NULL,
    test_id integer NOT NULL,
    suite_result_id integer NOT NULL,
    duration double precision NOT NULL,
    fail_type character varying(200),
    body text,
    msg text,
    result integer NOT NULL
);


--
-- Name: testresult_by_build_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW testresult_by_build_view AS
    SELECT t.id AS test, t.test_id AS testcase, t.result, b.id AS build, b.success AS buildsuccess, c.revision FROM test_result t, suite_result sr, build b, change c WHERE (((c.id = b.change_id) AND (t.suite_result_id = sr.id)) AND (sr.build_id = b.id));


--
-- Name: test_fix_revision_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW test_fix_revision_view AS
    SELECT DISTINCT t1.revision, t2.revision AS fixrevision FROM testresult_by_build_view t1, testresult_by_build_view t2, next_visible_rev_by_build_view n WHERE (((((t1.testcase = t2.testcase) AND (t1.result <> 0)) AND (t2.result = 0)) AND (t1.build = n.build)) AND (t2.revision = n.next_revision)) ORDER BY t1.revision, t2.revision;


--
-- Name: test_result_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('test_result', 'id'), 31, true);


--
-- Name: test_suite; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE test_suite (
    id serial NOT NULL,
    pkg character varying(256) NOT NULL,
    name character varying(256) NOT NULL,
    module_id integer NOT NULL
);


--
-- Name: test_suite_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('test_suite', 'id'), 4, true);


--
-- Name: test_summary; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE VIEW test_summary AS
    SELECT suite_result.build_id AS id, suite_result.build_id, sum(suite_result.num_tests) AS num_tests, sum(suite_result.num_errors) AS num_errors, sum(suite_result.num_failures) AS num_failures, sum(suite_result.duration) AS duration FROM suite_result GROUP BY suite_result.build_id;


--
-- Name: trunk; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE trunk (
    id serial NOT NULL,
    path character varying(1024) NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: trunk_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('trunk', 'id'), 4, true);


--
-- Name: user_role; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: work_list; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE work_list (
    id integer DEFAULT nextval('gauntletrun_tstamp_2005_12_12_13_27_57_356.work_list_id_seq'::text) NOT NULL,
    handler_ser bytea NOT NULL,
    description text
);


--
-- Name: work_list_id_seq; Type: SEQUENCE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE SEQUENCE work_list_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: work_list_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

SELECT pg_catalog.setval('work_list_id_seq', 64, true);


--
-- Data for Name: build; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO build VALUES (1, 1, NULL, NULL, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/4/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/4/', 1, '2005-12-12 13:28:50.12-08', NULL, NULL, 1);
INSERT INTO build VALUES (3, 1, NULL, NULL, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m2/sandbox/sam/4/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m2/sandbox/sam/4/', 2, '2005-12-12 13:28:51.113-08', NULL, NULL, 1);
INSERT INTO build VALUES (5, 1, NULL, NULL, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/4/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/4/', 3, '2005-12-12 13:28:53.115-08', NULL, NULL, 1);
INSERT INTO build VALUES (7, 2, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/6/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/6/', 1, '2005-12-12 13:28:59.113-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t1-success
', NULL, 1);
INSERT INTO build VALUES (8, 2, NULL, NULL, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m2/sandbox/sam/6/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m2/sandbox/sam/6/', 2, '2005-12-12 13:29:01.11-08', NULL, NULL, 1);
INSERT INTO build VALUES (10, 2, NULL, NULL, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/6/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/6/', 3, '2005-12-12 13:29:02.11-08', NULL, NULL, 1);
INSERT INTO build VALUES (12, 3, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m2/sandbox/sam/8/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m2/sandbox/sam/8/', 2, '2005-12-12 13:29:08.118-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t3-success
', NULL, 1);
INSERT INTO build VALUES (13, 3, NULL, NULL, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/8/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/8/', 3, '2005-12-12 13:29:10.11-08', NULL, NULL, 1);
INSERT INTO build VALUES (15, 4, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/10/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/10/', 3, '2005-12-12 13:29:16.112-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
', NULL, 1);
INSERT INTO build VALUES (16, 5, 0, false, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build.xml:5: unless=t1-available
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/12/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/12/', 3, '2005-12-12 13:29:24.115-08', '', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build.xml:5: unless=t1-available
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
', 1);
INSERT INTO build VALUES (17, 6, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/13/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/13/', 1, '2005-12-12 13:29:28.112-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t1-success
', NULL, 1);
INSERT INTO build VALUES (18, 6, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m2/sandbox/sam/13/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m2/sandbox/sam/13/', 2, '2005-12-12 13:29:30.108-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t3-success
', NULL, 1);
INSERT INTO build VALUES (19, 6, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/13/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/13/', 3, '2005-12-12 13:29:32.109-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
', NULL, 1);
INSERT INTO build VALUES (20, 7, 0, false, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:6: No message
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/16/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/16/', 1, '2005-12-12 13:29:42.112-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:6: No message
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
', 1);
INSERT INTO build VALUES (21, 8, 0, false, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:6: No message
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/17/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/17/', 1, '2005-12-12 13:29:46.112-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:6: No message
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
', 1);
INSERT INTO build VALUES (22, 9, 0, false, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:6: No message
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/18/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/18/', 1, '2005-12-12 13:29:51.115-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:6: No message
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
', 1);
INSERT INTO build VALUES (23, 10, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/19/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/19/', 1, '2005-12-12 13:29:55.111-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t1-success
', NULL, 1);
INSERT INTO build VALUES (24, 10, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m2/sandbox/sam/19/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m2/sandbox/sam/19/', 2, '2005-12-12 13:29:57.11-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t3-success
', NULL, 1);
INSERT INTO build VALUES (25, 10, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/19/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/19/', 3, '2005-12-12 13:29:59.113-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
', NULL, 1);
INSERT INTO build VALUES (26, 12, 0, false, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:5: The following error occurred while executing this line: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/26/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/26/', 1, '2005-12-12 13:30:20.111-08', '', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:5: The following error occurred while executing this line:
/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
	at org.apache.tools.ant.ProjectHelper.addLocationToBuildException(ProjectHelper.java:539)
	at org.apache.tools.ant.taskdefs.Ant.execute(Ant.java:384)
	at org.apache.tools.ant.taskdefs.CallTarget.execute(CallTarget.java:107)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
Caused by: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.helper.SingleCheckExecutor.executeTargets(SingleCheckExecutor.java:37)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.taskdefs.Ant.execute(Ant.java:382)
	... 13 more
--- Nested Exception ---
/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.helper.SingleCheckExecutor.executeTargets(SingleCheckExecutor.java:37)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.taskdefs.Ant.execute(Ant.java:382)
	at org.apache.tools.ant.taskdefs.CallTarget.execute(CallTarget.java:107)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
', 1);
INSERT INTO build VALUES (27, 14, 0, false, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:5: The following error occurred while executing this line: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/29/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/29/', 1, '2005-12-12 13:30:29.111-08', '', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build.xml:5: The following error occurred while executing this line:
/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
	at org.apache.tools.ant.ProjectHelper.addLocationToBuildException(ProjectHelper.java:539)
	at org.apache.tools.ant.taskdefs.Ant.execute(Ant.java:384)
	at org.apache.tools.ant.taskdefs.CallTarget.execute(CallTarget.java:107)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
Caused by: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.helper.SingleCheckExecutor.executeTargets(SingleCheckExecutor.java:37)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.taskdefs.Ant.execute(Ant.java:382)
	... 13 more
--- Nested Exception ---
/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t2/build.xml:3: No message
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.helper.SingleCheckExecutor.executeTargets(SingleCheckExecutor.java:37)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.taskdefs.Ant.execute(Ant.java:382)
	at org.apache.tools.ant.taskdefs.CallTarget.execute(CallTarget.java:107)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
', 1);
INSERT INTO build VALUES (28, 15, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/sam/30/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/sam/30/', 1, '2005-12-12 13:30:33.112-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/sam/t1/build-t1-success
', NULL, 1);
INSERT INTO build VALUES (29, 15, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m2/sandbox/sam/30/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m2/sandbox/sam/30/', 2, '2005-12-12 13:30:35.108-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t3-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m2/sandbox/sam/t3/build-t3-success
', NULL, 1);
INSERT INTO build VALUES (30, 15, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/sam/30/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/sam/30/', 3, '2005-12-12 13:30:37.108-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/sam/t4/build-t4-success
', NULL, 1);
INSERT INTO build VALUES (31, 16, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/jolly/35/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/jolly/35/', 1, '2005-12-12 13:30:52.112-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/jolly/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/jolly/t1/build-t2-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/jolly/t1/build-t1-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/jolly/t1/build-t1-success-2
', NULL, 1);
INSERT INTO build VALUES (32, 16, 0, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/jolly/35/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/jolly/35/', 3, '2005-12-12 13:30:54.108-08', '[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/jolly/t4/build-t4-success
[touch] Creating /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/jolly/t4/build-t4-success
', NULL, 1);
INSERT INTO build VALUES (33, 17, 0, false, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/jolly/t1/build.xml:5: broken
', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m1/sandbox/jolly/38/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m1/sandbox/jolly/38/', 1, '2005-12-12 13:31:03.111-08', '', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m1/sandbox/jolly/t1/build.xml:5: broken
	at org.apache.tools.ant.taskdefs.Exit.execute(Exit.java:139)
	at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:275)
	at org.apache.tools.ant.Task.perform(Task.java:364)
	at org.apache.tools.ant.Target.execute(Target.java:341)
	at org.apache.tools.ant.Target.performTasks(Target.java:369)
	at org.apache.tools.ant.Project.executeSortedTargets(Project.java:1216)
	at org.apache.tools.ant.Project.executeTarget(Project.java:1185)
	at org.apache.tools.ant.helper.DefaultExecutor.executeTargets(DefaultExecutor.java:40)
	at org.apache.tools.ant.Project.executeTargets(Project.java:1068)
	at org.apache.tools.ant.Main.runBuild(Main.java:668)
	at org.apache.tools.ant.Main.startAnt(Main.java:187)
	at org.apache.tools.ant.launch.Launcher.run(Launcher.java:246)
	at org.apache.tools.ant.launch.Launcher.main(Launcher.java:67)
', 1);
INSERT INTO build VALUES (34, 18, 7, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/adam/40/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/adam/40/', 3, '2005-12-12 13:31:11.112-08', '[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/classes
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/classes
[javac] Compiling 1 source file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/classes
[javac] Overriding previous definition of reference to junit.classpath
[javac] Overriding previous definition of reference to emma.classpath
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/.lib
[get] Getting: http://www.gauntletsystems.com/maven/junit/jars/junit-3.8.1.jar
[get] To: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/.lib/junit-3.8.1.jar
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/coverage
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/tests
[get] Getting: http://www.gauntletsystems.com/maven/emma/jars/emma-2.0.latest.jar
[get] To: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/.lib/emma-2.0.latest.jar
[get] Getting: http://www.gauntletsystems.com/maven/emma/jars/emma_ant-2.0.latest.jar
[get] To: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/.lib/emma_ant-2.0.latest.jar
[copy] Copying 1 file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/coverage/emma.classes
[emma] processing instrumentation path ...
[emma] instrumentation path processed in 119 ms
[emma] [1 class(es) instrumented, 0 resource(s) copied]
[emma] metadata written to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/coverage/gauntlet-metadata.emma] {in 6 ms}
[javac] Compiling 1 source file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/classes
[junit] Running gsc.testproject.TestMeTest
[junit] Tests run: 3, Failures: 1, Errors: 1, Time elapsed: 0.151 sec
[junit] Test gsc.testproject.TestMeTest FAILED
[emma] processing input files ...
[emma] 2 file(s) read and merged in 3 ms
[emma] writing [html] report to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/coverage/gauntlet-coverage.html] ...
[emma] writing [xml] report to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/coverage/gauntlet-coverage.xml] ...
[delete] Deleting directory /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/classes
[move] Moving 1 file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/adam/t4/classes
', NULL, 1);
INSERT INTO build VALUES (35, 19, 7, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/dave/44/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/dave/44/', 3, '2005-12-12 13:31:30.108-08', '[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[javac] Compiling 2 source files to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[javac] Overriding previous definition of reference to junit.classpath
[javac] Overriding previous definition of reference to emma.classpath
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/.lib
[get] Getting: http://www.gauntletsystems.com/maven/junit/jars/junit-3.8.1.jar
[get] To: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/.lib/junit-3.8.1.jar
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/tests
[get] Getting: http://www.gauntletsystems.com/maven/emma/jars/emma-2.0.latest.jar
[get] To: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/.lib/emma-2.0.latest.jar
[get] Getting: http://www.gauntletsystems.com/maven/emma/jars/emma_ant-2.0.latest.jar
[get] To: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/.lib/emma_ant-2.0.latest.jar
[copy] Copying 2 files to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/emma.classes
[emma] processing instrumentation path ...
[emma] instrumentation path processed in 124 ms
[emma] [2 class(es) instrumented, 0 resource(s) copied]
[emma] metadata written to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/gauntlet-metadata.emma] {in 2 ms}
[javac] Compiling 1 source file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[junit] Running gsc.testproject.TestMeTest
[junit] Tests run: 3, Failures: 1, Errors: 1, Time elapsed: 0.137 sec
[junit] Test gsc.testproject.TestMeTest FAILED
[emma] processing input files ...
[emma] 2 file(s) read and merged in 3 ms
[emma] writing [html] report to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/gauntlet-coverage.html] ...
[emma] writing [xml] report to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/gauntlet-coverage.xml] ...
[delete] Deleting directory /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[move] Moving 2 files to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
', NULL, 1);
INSERT INTO build VALUES (36, 20, 2, true, NULL, '/Users/sam/gs/squire/simplelock/repo25542svn/builds/reports/p1/m3/sandbox/dave/47/', '/Users/sam/gs/squire/simplelock/repo25542svn/builds/artifacts/p1/m3/sandbox/dave/47/', 3, '2005-12-12 13:31:46.113-08', '[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[javac] Compiling 2 source files to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[javac] Overriding previous definition of reference to junit.classpath
[javac] Overriding previous definition of reference to emma.classpath
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage
[mkdir] Created dir: /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/tests
[copy] Copying 2 files to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/emma.classes
[emma] processing instrumentation path ...
[emma] instrumentation path processed in 121 ms
[emma] [2 class(es) instrumented, 0 resource(s) copied]
[emma] metadata written to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/gauntlet-metadata.emma] {in 2 ms}
[javac] Compiling 1 source file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[junit] Running gsc.testproject.TestMeTest
[junit] Tests run: 3, Failures: 1, Errors: 1, Time elapsed: 0.139 sec
[junit] Test gsc.testproject.TestMeTest FAILED
[copy] Copying 1 file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4
[copy] Copying 1 file to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4
[emma] processing input files ...
[emma] 2 file(s) read and merged in 4 ms
[emma] writing [html] report to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/gauntlet-coverage.html] ...
[emma] writing [xml] report to [/Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/coverage/gauntlet-coverage.xml] ...
[delete] Deleting directory /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
[move] Moving 2 files to /Users/sam/gs/squire/simplelock/repo25542svn/builds/checkout/p1/m3/sandbox/dave/t4/classes
', NULL, 1);


--
-- Data for Name: build_fixed_by; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO build_fixed_by VALUES (22, 23);
INSERT INTO build_fixed_by VALUES (21, 23);
INSERT INTO build_fixed_by VALUES (16, 19);
INSERT INTO build_fixed_by VALUES (20, 23);
INSERT INTO build_fixed_by VALUES (27, 28);
INSERT INTO build_fixed_by VALUES (26, 28);


--
-- Data for Name: change; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO change VALUES (1, 4, 3, 1);
INSERT INTO change VALUES (2, 6, 3, 1);
INSERT INTO change VALUES (3, 8, 3, 1);
INSERT INTO change VALUES (4, 10, 3, 1);
INSERT INTO change VALUES (5, 12, 3, 1);
INSERT INTO change VALUES (6, 13, 3, 1);
INSERT INTO change VALUES (7, 16, 3, 1);
INSERT INTO change VALUES (8, 17, 3, 1);
INSERT INTO change VALUES (9, 18, 3, 1);
INSERT INTO change VALUES (10, 19, 3, 1);
INSERT INTO change VALUES (11, 24, 3, 1);
INSERT INTO change VALUES (13, 27, 3, 1);
INSERT INTO change VALUES (12, 26, 3, 1);
INSERT INTO change VALUES (14, 29, 3, 1);
INSERT INTO change VALUES (15, 30, 3, 1);
INSERT INTO change VALUES (16, 35, 3, 1);
INSERT INTO change VALUES (17, 38, 1, 1);
INSERT INTO change VALUES (18, 40, 3, 1);
INSERT INTO change VALUES (19, 44, 3, 1);
INSERT INTO change VALUES (20, 47, 3, 1);


--
-- Data for Name: change_module; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO change_module VALUES (1, 2);
INSERT INTO change_module VALUES (1, 1);
INSERT INTO change_module VALUES (1, 3);
INSERT INTO change_module VALUES (2, 2);
INSERT INTO change_module VALUES (2, 1);
INSERT INTO change_module VALUES (2, 3);
INSERT INTO change_module VALUES (3, 2);
INSERT INTO change_module VALUES (3, 3);
INSERT INTO change_module VALUES (4, 3);
INSERT INTO change_module VALUES (5, 3);
INSERT INTO change_module VALUES (6, 2);
INSERT INTO change_module VALUES (6, 1);
INSERT INTO change_module VALUES (6, 3);
INSERT INTO change_module VALUES (7, 1);
INSERT INTO change_module VALUES (7, 3);
INSERT INTO change_module VALUES (8, 2);
INSERT INTO change_module VALUES (8, 3);
INSERT INTO change_module VALUES (9, 2);
INSERT INTO change_module VALUES (9, 3);
INSERT INTO change_module VALUES (10, 1);
INSERT INTO change_module VALUES (10, 3);
INSERT INTO change_module VALUES (12, 2);
INSERT INTO change_module VALUES (12, 1);
INSERT INTO change_module VALUES (14, 2);
INSERT INTO change_module VALUES (14, 3);
INSERT INTO change_module VALUES (15, 2);
INSERT INTO change_module VALUES (15, 1);
INSERT INTO change_module VALUES (16, 1);
INSERT INTO change_module VALUES (16, 3);
INSERT INTO change_module VALUES (17, 1);
INSERT INTO change_module VALUES (17, 3);
INSERT INTO change_module VALUES (18, 3);
INSERT INTO change_module VALUES (19, 3);
INSERT INTO change_module VALUES (20, 3);


--
-- Data for Name: data; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Data for Name: data_class; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Data for Name: emma; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma VALUES (1, 34, 1, 1, 1, 4, 4, 11, 11, 4, 4, 1, 100, 100, 100, 100, 'gauntlet-coverage.html');
INSERT INTO emma VALUES (2, 35, 1, 2, 1, 7, 4, 17, 11, 7, 4, 2, 50, 57, 65, 57, 'gauntlet-coverage.html');
INSERT INTO emma VALUES (3, 36, 1, 2, 1, 7, 4, 17, 11, 7, 4, 2, 50, 57, 65, 57, 'gauntlet-coverage.html');


--
-- Data for Name: emma_class; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_class VALUES (1, 1, 1, 'TestMe');
INSERT INTO emma_class VALUES (2, 1, 2, 'SecondFile');


--
-- Data for Name: emma_class_report; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_class_report VALUES (1, 1, 1, 1, 1, 1, 4, 4, 11, 11, 4, 4, NULL, 100, 100, 100, 100);
INSERT INTO emma_class_report VALUES (2, 2, 2, 2, 1, 0, 3, 0, 6, 0, 3, 0, NULL, 0, 0, 0, 0);
INSERT INTO emma_class_report VALUES (3, 1, 3, 2, 1, 1, 4, 4, 11, 11, 4, 4, NULL, 100, 100, 100, 100);
INSERT INTO emma_class_report VALUES (4, 2, 4, 3, 1, 0, 3, 0, 6, 0, 3, 0, NULL, 0, 0, 0, 0);
INSERT INTO emma_class_report VALUES (5, 1, 5, 3, 1, 1, 4, 4, 11, 11, 4, 4, NULL, 100, 100, 100, 100);


--
-- Data for Name: emma_method; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_method VALUES (1, 1, 'TestMe (): void');
INSERT INTO emma_method VALUES (2, 1, 'failWithException (): String');
INSERT INTO emma_method VALUES (3, 1, 'returnTest (): String');
INSERT INTO emma_method VALUES (4, 1, 'returnTestWrong (): String');
INSERT INTO emma_method VALUES (5, 2, 'SecondFile (): void');
INSERT INTO emma_method VALUES (6, 2, 'doNothing (): void');
INSERT INTO emma_method VALUES (7, 2, 'doSomething (): String');


--
-- Data for Name: emma_method_report; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_method_report VALUES (1, 1, 1, 1, 1, 3, 3, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (2, 2, 1, 1, 1, 4, 4, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (3, 3, 1, 1, 1, 2, 2, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (4, 4, 1, 1, 1, 2, 2, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (5, 5, 2, 1, 0, 3, 0, 1, 0, NULL, 0, 0, 0);
INSERT INTO emma_method_report VALUES (6, 6, 2, 1, 0, 1, 0, 1, 0, NULL, 0, 0, 0);
INSERT INTO emma_method_report VALUES (7, 7, 2, 1, 0, 2, 0, 1, 0, NULL, 0, 0, 0);
INSERT INTO emma_method_report VALUES (8, 1, 3, 1, 1, 3, 3, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (9, 2, 3, 1, 1, 4, 4, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (10, 3, 3, 1, 1, 2, 2, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (11, 4, 3, 1, 1, 2, 2, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (12, 5, 4, 1, 0, 3, 0, 1, 0, NULL, 0, 0, 0);
INSERT INTO emma_method_report VALUES (13, 6, 4, 1, 0, 1, 0, 1, 0, NULL, 0, 0, 0);
INSERT INTO emma_method_report VALUES (14, 7, 4, 1, 0, 2, 0, 1, 0, NULL, 0, 0, 0);
INSERT INTO emma_method_report VALUES (15, 1, 5, 1, 1, 3, 3, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (16, 2, 5, 1, 1, 4, 4, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (17, 3, 5, 1, 1, 2, 2, 1, 1, NULL, 100, 100, 100);
INSERT INTO emma_method_report VALUES (18, 4, 5, 1, 1, 2, 2, 1, 1, NULL, 100, 100, 100);


--
-- Data for Name: emma_package; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_package VALUES (1, 3, 'gsc.testproject');


--
-- Data for Name: emma_package_report; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_package_report VALUES (1, 1, 1, 1, 1, 4, 4, 11, 11, 4, 4, NULL, 100, 100, 100, 100);
INSERT INTO emma_package_report VALUES (2, 2, 1, 2, 1, 7, 4, 17, 11, 7, 4, NULL, 50, 57, 65, 57);
INSERT INTO emma_package_report VALUES (3, 3, 1, 2, 1, 7, 4, 17, 11, 7, 4, NULL, 50, 57, 65, 57);


--
-- Data for Name: emma_srcfile; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_srcfile VALUES (1, 1, 'TestMe.java');
INSERT INTO emma_srcfile VALUES (2, 1, 'SecondFile.java');


--
-- Data for Name: emma_srcfile_report; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO emma_srcfile_report VALUES (1, 1, 1, 1, 1, 4, 4, 11, 11, 4, 4, NULL, 100, 100, 100, 100);
INSERT INTO emma_srcfile_report VALUES (2, 2, 2, 1, 0, 3, 0, 6, 0, 3, 0, NULL, 0, 0, 0, 0);
INSERT INTO emma_srcfile_report VALUES (3, 1, 2, 1, 1, 4, 4, 11, 11, 4, 4, NULL, 100, 100, 100, 100);
INSERT INTO emma_srcfile_report VALUES (4, 2, 3, 1, 0, 3, 0, 6, 0, 3, 0, NULL, 0, 0, 0, 0);
INSERT INTO emma_srcfile_report VALUES (5, 1, 3, 1, 1, 4, 4, 11, 11, 4, 4, NULL, 100, 100, 100, 100);


--
-- Data for Name: environment; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO environment VALUES (1, 'gauntlet', 'This is the default Gauntlet for all modules');


--
-- Data for Name: gauntlet_user; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO gauntlet_user VALUES (1, 'admin', 'Y18uJttpo29CPhBkuc/1WQ==', '635f2e26db69a36f423e1064b9cff559', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO gauntlet_user VALUES (2, 'sam', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO gauntlet_user VALUES (3, 'jolly', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO gauntlet_user VALUES (4, 'adam', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO gauntlet_user VALUES (5, 'dave', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: gauntlet_version; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO gauntlet_version VALUES (24);


--
-- Data for Name: meta_property; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO meta_property VALUES (1, 'gsc.gauntlet.Gauntlet.buildTimeoutSecs', 'config', 'erpm', 1, NULL, NULL, 900, 60, 3600, 'Sets the timeout on builds, in seconds.  If a build takes longer than this it will be considered failed.');
INSERT INTO meta_property VALUES (2, 'gsc.gauntlet.ArtifactReporter', 'config', 'erpm', 4, true, NULL, NULL, NULL, NULL, 'specifies classes that examine build artifacts and generate reports, implementing the ArtifactReporter interface, http://www.gauntletsystems.com/docs/');
INSERT INTO meta_property VALUES (3, 'all', 'acl', 'erpmuos', 3, NULL, NULL, NULL, NULL, NULL, 'the all ACL encompasses all other, finer-grained actions');
INSERT INTO meta_property VALUES (4, 'modify', 'acl', 'erpmuos', 3, NULL, NULL, NULL, NULL, NULL, 'ability to modify properties on an entity, but not add or delete entities');
INSERT INTO meta_property VALUES (5, 'admin', 'acl', 'erpmuos', 3, NULL, NULL, NULL, NULL, NULL, 'ability to add/modify/delete global properties on the specified entity');
INSERT INTO meta_property VALUES (6, 'view', 'acl', 'erpmuos', 3, NULL, NULL, NULL, NULL, NULL, 'read access to the specified entity');
INSERT INTO meta_property VALUES (7, 'checkin', 'acl', 'erpmuos', 3, NULL, NULL, NULL, NULL, NULL, 'ability to add/modify/delete files to the specified entity');
INSERT INTO meta_property VALUES (8, 'checkout', 'acl', 'erpmuos', 3, NULL, NULL, NULL, NULL, NULL, 'provides read-only source control access for the specified entity');
INSERT INTO meta_property VALUES (9, 'gsc.gap.coverageDeltaThreshold', 'config', 'erpm', 1, NULL, NULL, 1, 1, 100, 'Sets the threshold for the minimum percentage of code coverage delta for a change to be reported as significant or interesting regarding code coverage changes in the Gauntlet reporting application.');
INSERT INTO meta_property VALUES (10, 'gsc.gap.linesDeltaThreshold', 'config', 'erpm', 1, NULL, NULL, 100, 1, NULL, 'Sets the threshold for the minimum number of lines added or removed for a change to be reported as a "Large Change" in the Gauntlet reporting application.');
INSERT INTO meta_property VALUES (11, 'gsc.gauntlet.simplelock.handler.MailHandler.smtpHost', 'config', 'erpm', 0, NULL, 'localhost', NULL, NULL, NULL, 'Host name or IP address of SMTP server to use for sending email notification of Gauntlet events.');
INSERT INTO meta_property VALUES (12, 'gsc.gauntlet.simplelock.handler.MailHandler.smtpPort', 'config', 'erpm', 1, NULL, NULL, 25, NULL, NULL, 'TCP port of SMTP server to use for sending email notification of Gauntlet events.');
INSERT INTO meta_property VALUES (13, 'gsc.gauntlet.simplelock.handler.MailHandler.notifyAddress', 'config', 'erpm', 0, NULL, NULL, NULL, NULL, NULL, 'Email address (usually a mailing list alias) to receive email notifications.');
INSERT INTO meta_property VALUES (14, 'gsc.gauntlet.simplelock.handler.MailHandler.fromAddress', 'config', 'erpm', 0, NULL, NULL, NULL, NULL, NULL, 'Default "From:" email address in gauntlet notification messages.');


--
-- Data for Name: module; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO module VALUES (1, 1, 'm1', 1);
INSERT INTO module VALUES (2, 1, 'm2', 3);
INSERT INTO module VALUES (3, 1, 'm3', 4);


--
-- Data for Name: module_trunk; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO module_trunk VALUES (1, 2);
INSERT INTO module_trunk VALUES (2, 2);
INSERT INTO module_trunk VALUES (3, 3);
INSERT INTO module_trunk VALUES (3, 1);


--
-- Data for Name: path_lock; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO path_lock VALUES (23, 2, 't1/build.xml', '2005-12-12 13:31:02.452', '38', 1);


--
-- Data for Name: prev_succ_build; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO prev_succ_build VALUES (31, 28);
INSERT INTO prev_succ_build VALUES (30, 25);
INSERT INTO prev_succ_build VALUES (29, 24);
INSERT INTO prev_succ_build VALUES (28, 23);
INSERT INTO prev_succ_build VALUES (17, 7);
INSERT INTO prev_succ_build VALUES (25, 19);
INSERT INTO prev_succ_build VALUES (24, 18);
INSERT INTO prev_succ_build VALUES (32, 30);
INSERT INTO prev_succ_build VALUES (23, 17);
INSERT INTO prev_succ_build VALUES (19, 15);
INSERT INTO prev_succ_build VALUES (35, 34);
INSERT INTO prev_succ_build VALUES (18, 12);
INSERT INTO prev_succ_build VALUES (34, 32);


--
-- Data for Name: project; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO project VALUES (1, 'p1', 1);


--
-- Data for Name: property; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO property VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 'gsc.gauntlet.parsers.EmmaReporter', NULL, 2);
INSERT INTO property VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'gsc.gauntlet.parsers.JUnitReporter', NULL, 2);
INSERT INTO property VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 'gsc.gauntlet.parsers.JUnitXReporter', NULL, 2);
INSERT INTO property VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 'gsc.gauntlet.parsers.NUnitReporter', NULL, 2);


--
-- Data for Name: repository; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO repository VALUES (1, 'Testing', 'file:///Users/sam/gs/squire/simplelock/repo25542svn/', 'trunk/', '/Users/sam/gs/squire/simplelock/repo25542svn/');


--
-- Data for Name: role; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO role VALUES (1, 'admin', 'Administrative privileges: manage all users and projects, set policy');
INSERT INTO role VALUES (2, 'user', 'Normal user: read/write access to source control');


--
-- Data for Name: sandbox; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO sandbox VALUES (1, 'sandbox/sam/', 0, 1);
INSERT INTO sandbox VALUES (2, 'sandbox/jolly/', 1, 1);
INSERT INTO sandbox VALUES (3, 'sandbox/adam/', 0, 1);
INSERT INTO sandbox VALUES (4, 'sandbox/dave/', 0, 1);


--
-- Data for Name: sandbox_change; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO sandbox_change VALUES (1, 1, 1, 5);
INSERT INTO sandbox_change VALUES (2, 2, 1, 7);
INSERT INTO sandbox_change VALUES (3, 3, 1, 9);
INSERT INTO sandbox_change VALUES (4, 4, 1, 11);
INSERT INTO sandbox_change VALUES (5, 5, 1, 14);
INSERT INTO sandbox_change VALUES (6, 6, 1, 15);
INSERT INTO sandbox_change VALUES (7, 7, 1, 20);
INSERT INTO sandbox_change VALUES (8, 8, 1, 21);
INSERT INTO sandbox_change VALUES (9, 9, 1, 22);
INSERT INTO sandbox_change VALUES (10, 10, 1, 23);
INSERT INTO sandbox_change VALUES (11, 11, 1, 25);
INSERT INTO sandbox_change VALUES (13, 13, 1, 28);
INSERT INTO sandbox_change VALUES (12, 12, 1, 31);
INSERT INTO sandbox_change VALUES (14, 14, 1, 32);
INSERT INTO sandbox_change VALUES (15, 15, 1, 33);
INSERT INTO sandbox_change VALUES (16, 16, 2, 36);
INSERT INTO sandbox_change VALUES (17, 17, 2, NULL);
INSERT INTO sandbox_change VALUES (18, 18, 3, 41);
INSERT INTO sandbox_change VALUES (19, 19, 4, 45);
INSERT INTO sandbox_change VALUES (20, 20, 4, 48);


--
-- Data for Name: suite_result; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO suite_result VALUES (1, 1, 34, 3, 1, 1, 0.15099999308586121);
INSERT INTO suite_result VALUES (2, 1, 35, 3, 1, 1, 0.13699999451637268);
INSERT INTO suite_result VALUES (3, 1, 36, 3, 1, 1, 0.13899999856948853);
INSERT INTO suite_result VALUES (4, 2, 36, 4, 0, 1, 0.49199999999999999);
INSERT INTO suite_result VALUES (5, 3, 36, 4, 0, 0, 0.0059999999357387424);
INSERT INTO suite_result VALUES (6, 4, 36, 14, 0, 0, 0.0090000003110617399);


--
-- Data for Name: svnlog; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO svnlog VALUES (1, 1, 'sam', 'make the trunks', '2005-09-02 15:54:09.795-07', 22, 6, 2, 245, 1, 36, 8, 2005, 3);
INSERT INTO svnlog VALUES (2, 2, 'sam', 'module1 with build trunk t1 and sync trunk t2', '2005-09-02 15:57:55.756-07', 22, 6, 2, 245, 1, 36, 8, 2005, 2);
INSERT INTO svnlog VALUES (3, 3, 'sam', 'module2 with build trunk t3 and sync trunk t2', '2005-09-02 16:00:02.083-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (4, 4, 'sam', 'module3 with build trunk t4 and sync trunks t1 and t3', '2005-09-02 16:03:28.209-07', 23, 6, 2, 245, 1, 36, 8, 2005, 2);
INSERT INTO svnlog VALUES (5, 5, 'sam', 'change the dependency and break the build', '2005-09-02 16:05:07.95-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (6, 6, 'sam', 'fix the build', '2005-09-02 16:05:13.563-07', 23, 6, 2, 245, 1, 36, 8, 2005, 2);
INSERT INTO svnlog VALUES (7, 7, 'sam', 'fail the build', '2005-09-02 16:05:46.749-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (8, 8, 'sam', 'now break the build for module 2', '2005-09-02 16:08:18.505-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (9, 9, 'sam', 'fix the build break for module 2', '2005-09-02 16:09:01.597-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (10, 10, 'sam', 'fix module 1 and promote a lot of changes', '2005-09-02 16:09:29.009-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (11, 11, 'sam', 'out of module path', '2005-09-02 16:10:25.955-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (12, 12, 'sam', 'break module 1 and module 2', '2005-09-02 16:11:27.57-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (13, 13, 'sam', 'should promote', '2005-09-02 16:11:50.516-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (14, 14, 'sam', 'attempt to fix module 2, should not promote', '2005-09-02 16:13:35.708-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (15, 15, 'sam', 'fix t2 and promote changes in module 1 and module 2', '2005-09-02 16:13:59.262-07', 23, 6, 2, 245, 1, 36, 8, 2005, 1);
INSERT INTO svnlog VALUES (16, 16, 'jolly', 'new author', '2005-09-05 01:00:49.503-07', 8, 2, 5, 248, 2, 37, 8, 2005, 1);
INSERT INTO svnlog VALUES (17, 17, 'jolly', 'break the build', '2005-09-05 01:25:51.199-07', 8, 2, 5, 248, 2, 37, 8, 2005, 1);
INSERT INTO svnlog VALUES (18, 18, 'adam', 'add test for build reporting', '2005-09-13 13:31:18.335-07', 20, 3, 13, 256, 3, 38, 8, 2005, 11);
INSERT INTO svnlog VALUES (19, 19, 'dave', 'add a second source file', '2005-10-27 17:13:09.892-07', 0, 6, 28, 301, 5, 44, 9, 2005, 1);
INSERT INTO svnlog VALUES (20, 20, 'dave', ' add JUnitX and NUnit reports', '2005-11-01 16:17:43.949-08', 0, 4, 2, 306, 1, 45, 10, 2005, 3);


--
-- Data for Name: svnlog_path; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO svnlog_path VALUES (1, 1, 'A', 't1');
INSERT INTO svnlog_path VALUES (2, 1, 'A', 't2');
INSERT INTO svnlog_path VALUES (3, 1, 'A', 't3');
INSERT INTO svnlog_path VALUES (4, 2, 'A', 't1/build.xml');
INSERT INTO svnlog_path VALUES (5, 2, 'A', 't2/build.xml');
INSERT INTO svnlog_path VALUES (6, 3, 'A', 't3/build.xml');
INSERT INTO svnlog_path VALUES (7, 4, 'A', 't4');
INSERT INTO svnlog_path VALUES (8, 4, 'A', 't4/build.xml');
INSERT INTO svnlog_path VALUES (9, 5, 'M', 't4/build.xml');
INSERT INTO svnlog_path VALUES (10, 6, 'A', 't1/t4-dependent');
INSERT INTO svnlog_path VALUES (11, 6, 'A', 't3/t4-dependent');
INSERT INTO svnlog_path VALUES (12, 7, 'M', 't1/build.xml');
INSERT INTO svnlog_path VALUES (13, 8, 'M', 't3/build.xml');
INSERT INTO svnlog_path VALUES (14, 9, 'M', 't3/build.xml');
INSERT INTO svnlog_path VALUES (15, 10, 'M', 't1/build.xml');
INSERT INTO svnlog_path VALUES (16, 11, 'A', 't5');
INSERT INTO svnlog_path VALUES (17, 12, 'M', 't2/build.xml');
INSERT INTO svnlog_path VALUES (18, 13, 'A', 't5/foo.txt');
INSERT INTO svnlog_path VALUES (19, 14, 'M', 't3/build.xml');
INSERT INTO svnlog_path VALUES (20, 15, 'M', 't2/build.xml');
INSERT INTO svnlog_path VALUES (21, 16, 'M', 't1/build.xml');
INSERT INTO svnlog_path VALUES (22, 17, 'M', 't1/build.xml');
INSERT INTO svnlog_path VALUES (23, 18, 'M', 't4/build.xml');
INSERT INTO svnlog_path VALUES (24, 18, 'A', 't4/emma-macros.xml');
INSERT INTO svnlog_path VALUES (25, 18, 'A', 't4/repository-macros.xml');
INSERT INTO svnlog_path VALUES (26, 18, 'A', 't4/src');
INSERT INTO svnlog_path VALUES (27, 18, 'A', 't4/src/gsc');
INSERT INTO svnlog_path VALUES (28, 18, 'A', 't4/src/gsc/testproject');
INSERT INTO svnlog_path VALUES (29, 18, 'A', 't4/src/gsc/testproject/TestMe.java');
INSERT INTO svnlog_path VALUES (30, 18, 'A', 't4/test');
INSERT INTO svnlog_path VALUES (31, 18, 'A', 't4/test/gsc');
INSERT INTO svnlog_path VALUES (32, 18, 'A', 't4/test/gsc/testproject');
INSERT INTO svnlog_path VALUES (33, 18, 'A', 't4/test/gsc/testproject/TestMeTest.java');
INSERT INTO svnlog_path VALUES (34, 19, 'A', 't4/src/gsc/testproject/SecondFile.java');
INSERT INTO svnlog_path VALUES (35, 20, 'M', 't4/build.xml');
INSERT INTO svnlog_path VALUES (36, 20, 'A', 't4/test/Boo.Lang.Tests.dll-results.xml');
INSERT INTO svnlog_path VALUES (37, 20, 'A', 't4/test/TestLog.xml');


--
-- Data for Name: test_case; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO test_case VALUES (1, 1, 'gsc.testproject.TestMeTest', 'testReturnTest');
INSERT INTO test_case VALUES (2, 1, 'gsc.testproject.TestMeTest', 'testReturnTestWrong');
INSERT INTO test_case VALUES (3, 1, 'gsc.testproject.TestMeTest', 'testThrowsException');
INSERT INTO test_case VALUES (4, 2, 'ValidatingXSRTests.checkin.ValidatingXMLStreamReaderTests', 'testValidateDoc');
INSERT INTO test_case VALUES (5, 2, 'ValidatingXSRTests.checkin.ValidatingXMLStreamReaderTests', 'testValidateGlobalAtt1');
INSERT INTO test_case VALUES (6, 2, 'ValidatingXSRTests.checkin.ValidatingXMLStreamReaderTests', 'testValidateGlobalAtt2');
INSERT INTO test_case VALUES (7, 2, 'ValidatingXSRTests.checkin.ValidatingXMLStreamReaderTests', 'testValidateContent1');
INSERT INTO test_case VALUES (8, 3, 'Boo.Tests.Lang.RuntimeServicesTestFixture', 'CheckNumericPromotion');
INSERT INTO test_case VALUES (9, 3, 'Boo.Tests.Lang.RuntimeServicesTestFixture', 'CheckNumericPromotionWithNull');
INSERT INTO test_case VALUES (10, 3, 'Boo.Tests.Lang.RuntimeServicesTestFixture', 'CheckNumericPromotionWithString');
INSERT INTO test_case VALUES (11, 3, 'Boo.Tests.Lang.RuntimeServicesTestFixture', 'CheckNumericPromotionWithDate');
INSERT INTO test_case VALUES (12, 4, 'Boo.Tests.Lang.ListTestCase', 'Slicing');
INSERT INTO test_case VALUES (13, 4, 'Boo.Tests.Lang.ListTestCase', 'OutOfRangeSlicing');
INSERT INTO test_case VALUES (14, 4, 'Boo.Tests.Lang.ListTestCase', 'Indexing');
INSERT INTO test_case VALUES (15, 4, 'Boo.Tests.Lang.ListTestCase', 'NegativeIndexOutOfRange');
INSERT INTO test_case VALUES (16, 4, 'Boo.Tests.Lang.ListTestCase', 'PositiveIndexOutOfRange');
INSERT INTO test_case VALUES (17, 4, 'Boo.Tests.Lang.ListTestCase', 'TestEquals');
INSERT INTO test_case VALUES (18, 4, 'Boo.Tests.Lang.ListTestCase', 'Count');
INSERT INTO test_case VALUES (19, 4, 'Boo.Tests.Lang.ListTestCase', 'Remove');
INSERT INTO test_case VALUES (20, 4, 'Boo.Tests.Lang.ListTestCase', 'RemoveAt');
INSERT INTO test_case VALUES (21, 4, 'Boo.Tests.Lang.ListTestCase', 'Insert');
INSERT INTO test_case VALUES (22, 4, 'Boo.Tests.Lang.ListTestCase', 'AddUnique');
INSERT INTO test_case VALUES (23, 4, 'Boo.Tests.Lang.ListTestCase', 'TestToString');
INSERT INTO test_case VALUES (24, 4, 'Boo.Tests.Lang.ListTestCase', 'Pop');
INSERT INTO test_case VALUES (25, 4, 'Boo.Tests.Lang.ListTestCase', 'PopIndex');


--
-- Data for Name: test_result; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO test_result VALUES (1, 1, 1, 0.079000003635883331, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (2, 2, 1, 0.0099999997764825821, 'junit.framework.ComparisonFailure', 'junit.framework.ComparisonFailure: expected:<...e...> but was:<...E...>
	at gsc.testproject.TestMeTest.testReturnTestWrong(Unknown Source)
', 'expected:<...e...> but was:<...E...>', 1);
INSERT INTO test_result VALUES (3, 3, 1, 0, 'java.lang.IllegalArgumentException', 'java.lang.IllegalArgumentException
	at gsc.testproject.TestMe.failWithException(TestMe.java:15)
	at gsc.testproject.TestMeTest.testThrowsException(Unknown Source)
', NULL, 2);
INSERT INTO test_result VALUES (4, 1, 2, 0.082999996840953827, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (5, 2, 2, 0.004999999888241291, 'junit.framework.ComparisonFailure', 'junit.framework.ComparisonFailure: expected:<...e...> but was:<...E...>
	at gsc.testproject.TestMeTest.testReturnTestWrong(Unknown Source)
', 'expected:<...e...> but was:<...E...>', 1);
INSERT INTO test_result VALUES (6, 3, 2, 0.0010000000474974513, 'java.lang.IllegalArgumentException', 'java.lang.IllegalArgumentException
	at gsc.testproject.TestMe.failWithException(TestMe.java:15)
	at gsc.testproject.TestMeTest.testThrowsException(Unknown Source)
', NULL, 2);
INSERT INTO test_result VALUES (7, 1, 3, 0.086000002920627594, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (8, 2, 3, 0.004999999888241291, 'junit.framework.ComparisonFailure', 'junit.framework.ComparisonFailure: expected:<...e...> but was:<...E...>
	at gsc.testproject.TestMeTest.testReturnTestWrong(Unknown Source)
', 'expected:<...e...> but was:<...E...>', 1);
INSERT INTO test_result VALUES (9, 3, 3, 0.0010000000474974513, 'java.lang.IllegalArgumentException', 'java.lang.IllegalArgumentException
	at gsc.testproject.TestMe.failWithException(TestMe.java:15)
	at gsc.testproject.TestMeTest.testThrowsException(Unknown Source)
', NULL, 2);
INSERT INTO test_result VALUES (10, 4, 4, 0.47799999999999998, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (11, 5, 4, 0.010999999999999999, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (12, 6, 4, 0.002, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (13, 7, 4, 0.001, NULL, NULL, NULL, 1);
INSERT INTO test_result VALUES (14, 8, 5, 0.004999999888241291, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (15, 9, 5, 0.0010000000474974513, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (16, 10, 5, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (17, 11, 5, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (18, 12, 6, 0.0030000000260770321, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (19, 13, 6, 0.0010000000474974513, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (20, 14, 6, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (21, 15, 6, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (22, 16, 6, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (23, 17, 6, 0.0010000000474974513, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (24, 18, 6, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (25, 19, 6, 0.0010000000474974513, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (26, 20, 6, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (27, 21, 6, 0.0010000000474974513, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (28, 22, 6, 0.0010000000474974513, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (29, 23, 6, 0.0010000000474974513, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (30, 24, 6, 0, NULL, NULL, NULL, 0);
INSERT INTO test_result VALUES (31, 25, 6, 0, NULL, NULL, NULL, 0);


--
-- Data for Name: test_suite; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO test_suite VALUES (1, 'gsc.testproject', 'TestMeTest', 3);
INSERT INTO test_suite VALUES (2, '', 'ValidatingXSRTests.checkin.ValidatingXMLStreamReaderTests', 3);
INSERT INTO test_suite VALUES (3, '', 'Boo.Tests.Lang.RuntimeServicesTestFixture', 3);
INSERT INTO test_suite VALUES (4, '', 'Boo.Tests.Lang.ListTestCase', 3);


--
-- Data for Name: trunk; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO trunk VALUES (1, 't1/', 1);
INSERT INTO trunk VALUES (2, 't2/', 1);
INSERT INTO trunk VALUES (3, 't3/', 1);
INSERT INTO trunk VALUES (4, 't4/', 1);


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

INSERT INTO user_role VALUES (1, 1);


--
-- Data for Name: work_list; Type: TABLE DATA; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Name: build_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY build
    ADD CONSTRAINT build_pkey PRIMARY KEY (id);


--
-- Name: change_id_unique; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY svnlog
    ADD CONSTRAINT change_id_unique UNIQUE (change_id);


--
-- Name: change_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY change
    ADD CONSTRAINT change_pkey PRIMARY KEY (id);


--
-- Name: data_class_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY data_class
    ADD CONSTRAINT data_class_pkey PRIMARY KEY (id);


--
-- Name: data_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_pkey PRIMARY KEY (id);


--
-- Name: emma_build_unique; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma
    ADD CONSTRAINT emma_build_unique UNIQUE (build_id);


--
-- Name: emma_class_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_class
    ADD CONSTRAINT emma_class_pkey PRIMARY KEY (id);


--
-- Name: emma_class_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_class_report
    ADD CONSTRAINT emma_class_report_pkey PRIMARY KEY (id);


--
-- Name: emma_method_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_method
    ADD CONSTRAINT emma_method_pkey PRIMARY KEY (id);


--
-- Name: emma_method_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_method_report
    ADD CONSTRAINT emma_method_report_pkey PRIMARY KEY (id);


--
-- Name: emma_package_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_package
    ADD CONSTRAINT emma_package_pkey PRIMARY KEY (id);


--
-- Name: emma_package_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_package_report
    ADD CONSTRAINT emma_package_report_pkey PRIMARY KEY (id);


--
-- Name: emma_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma
    ADD CONSTRAINT emma_pkey PRIMARY KEY (id);


--
-- Name: emma_srcfile_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_srcfile
    ADD CONSTRAINT emma_srcfile_pkey PRIMARY KEY (id);


--
-- Name: emma_srcfile_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY emma_srcfile_report
    ADD CONSTRAINT emma_srcfile_report_pkey PRIMARY KEY (id);


--
-- Name: environment_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY environment
    ADD CONSTRAINT environment_pkey PRIMARY KEY (id);


--
-- Name: gauntlet_user_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY gauntlet_user
    ADD CONSTRAINT gauntlet_user_pkey PRIMARY KEY (id);


--
-- Name: lock_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY path_lock
    ADD CONSTRAINT lock_pkey PRIMARY KEY (id);


--
-- Name: meta_property_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY meta_property
    ADD CONSTRAINT meta_property_pkey PRIMARY KEY (id);


--
-- Name: module_build_trunk_id_key; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_build_trunk_id_key UNIQUE (build_trunk_id);


--
-- Name: module_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_pkey PRIMARY KEY (id);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: property_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_pkey PRIMARY KEY (id);


--
-- Name: repository_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: sandbox_change_id_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY sandbox_change
    ADD CONSTRAINT sandbox_change_id_pkey PRIMARY KEY (id);


--
-- Name: sandbox_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY sandbox
    ADD CONSTRAINT sandbox_pkey PRIMARY KEY (id);


--
-- Name: set; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY sandbox_change
    ADD CONSTRAINT "set" UNIQUE (change_id);


--
-- Name: suite_result_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY suite_result
    ADD CONSTRAINT suite_result_pkey PRIMARY KEY (id);


--
-- Name: svnlog_path_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY svnlog_path
    ADD CONSTRAINT svnlog_path_pkey PRIMARY KEY (id);


--
-- Name: svnlog_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY svnlog
    ADD CONSTRAINT svnlog_pkey PRIMARY KEY (id);


--
-- Name: test_case_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY test_case
    ADD CONSTRAINT test_case_pkey PRIMARY KEY (id);


--
-- Name: test_result_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY test_result
    ADD CONSTRAINT test_result_pkey PRIMARY KEY (id);


--
-- Name: test_suite_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY test_suite
    ADD CONSTRAINT test_suite_pkey PRIMARY KEY (id);


--
-- Name: trunk_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY trunk
    ADD CONSTRAINT trunk_pkey PRIMARY KEY (id);


--
-- Name: user_u_1; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY gauntlet_user
    ADD CONSTRAINT user_u_1 UNIQUE (login_name);


--
-- Name: work_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE ONLY work_list
    ADD CONSTRAINT work_pkey PRIMARY KEY (id);


--
-- Name: build_change_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_change_id_index ON build USING btree (change_id);


--
-- Name: build_fixed_by_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_fixed_by_build_index ON build_fixed_by USING btree (build);


--
-- Name: build_fixed_by_fix_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_fixed_by_fix_build_index ON build_fixed_by USING btree (fix_build);


--
-- Name: build_module_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_module_id_index ON build USING btree (module_id);


--
-- Name: change_module_change_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_module_change_id_index ON change_module USING btree (change_id);


--
-- Name: change_module_module_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_module_module_id_index ON change_module USING btree (module_id);


--
-- Name: change_repository_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_repository_id_index ON change USING btree (repository_id);


--
-- Name: change_revision_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_revision_index ON change USING btree (revision);


--
-- Name: change_state_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_state_id_index ON change USING btree (state);


--
-- Name: data_class_name_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_class_name_index ON data_class USING btree (name);


--
-- Name: data_class_parent_entity_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_class_parent_entity_index ON data_class USING btree (parent_entity);


--
-- Name: data_data_class_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_data_class_id_index ON data USING btree (data_class_id);


--
-- Name: data_parent_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_parent_id_index ON data USING btree (parent_id);


--
-- Name: emma_class_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx1 ON emma_class USING btree (emma_srcfile_id);


--
-- Name: emma_class_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx2 ON emma_class_report USING btree (emma_class_id);


--
-- Name: emma_class_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx3 ON emma_class_report USING btree (emma_srcfile_report_id);


--
-- Name: emma_class_idx4; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx4 ON emma_class USING btree (emma_package_id);


--
-- Name: emma_class_idx5; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx5 ON emma_class_report USING btree (emma_package_report_id);


--
-- Name: emma_method_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_method_idx1 ON emma_method USING btree (emma_class_id);


--
-- Name: emma_method_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_method_idx2 ON emma_method_report USING btree (emma_method_id);


--
-- Name: emma_method_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_method_idx3 ON emma_method_report USING btree (emma_class_report_id);


--
-- Name: emma_pkg_module_idx; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_pkg_module_idx ON emma_package USING btree (module_id);


--
-- Name: emma_pkgrpt_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_pkgrpt_idx1 ON emma_package_report USING btree (emma_package_id);


--
-- Name: emma_pkgrpt_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_pkgrpt_idx2 ON emma_package_report USING btree (emma_id);


--
-- Name: emma_srcfile_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_srcfile_idx1 ON emma_srcfile USING btree (emma_package_id);


--
-- Name: emma_srcfile_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_srcfile_idx2 ON emma_srcfile_report USING btree (emma_srcfile_id);


--
-- Name: emma_srcfile_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_srcfile_idx3 ON emma_srcfile_report USING btree (emma_package_report_id);


--
-- Name: environment_name_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX environment_name_index ON environment USING btree (name);


--
-- Name: meta_prop_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx1 ON meta_property USING btree (name);


--
-- Name: meta_prop_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx2 ON meta_property USING btree ("type");


--
-- Name: meta_prop_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx3 ON meta_property USING btree (scope);


--
-- Name: prev_succ_build_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prev_succ_build_build_index ON prev_succ_build USING btree (build);


--
-- Name: prev_succ_build_prev_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prev_succ_build_prev_build_index ON prev_succ_build USING btree (prev_build);


--
-- Name: property_environment_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_environment_id_index ON property USING btree (environment_id);


--
-- Name: property_gauntlet_user_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_gauntlet_user_id_index ON property USING btree (gauntlet_user_id);


--
-- Name: property_int_value_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_int_value_index ON property USING btree (int_value);


--
-- Name: property_meta_property_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_meta_property_id_index ON property USING btree (meta_property_id);


--
-- Name: property_module_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_module_id_index ON property USING btree (module_id);


--
-- Name: property_ordinal_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_ordinal_index ON property USING btree (ordinal);


--
-- Name: property_project_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_project_id_index ON property USING btree (project_id);


--
-- Name: property_repository_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_repository_id_index ON property USING btree (repository_id);


--
-- Name: property_role_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_role_id_index ON property USING btree (role_id);


--
-- Name: property_sandbox_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_sandbox_id_index ON property USING btree (sandbox_id);


--
-- Name: sandbox_path_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX sandbox_path_index ON sandbox USING btree (path);


--
-- Name: suite_result_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX suite_result_idx1 ON suite_result USING btree (suite_id);


--
-- Name: suite_result_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX suite_result_idx2 ON suite_result USING btree (build_id);


--
-- Name: svnlog_author_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX svnlog_author_index ON svnlog USING btree (author);


--
-- Name: svnlog_path_path_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX svnlog_path_path_index ON svnlog_path USING btree (path);


--
-- Name: svnlog_path_svnlog_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX svnlog_path_svnlog_id_index ON svnlog_path USING btree (svnlog_id);


--
-- Name: test_case_classname_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_case_classname_index ON test_case USING btree (classname);


--
-- Name: test_case_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_case_idx1 ON test_case USING btree (suite_id);


--
-- Name: test_case_method_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_case_method_index ON test_case USING btree (method);


--
-- Name: test_result_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_result_idx1 ON test_result USING btree (test_id);


--
-- Name: test_result_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_result_idx2 ON test_result USING btree (suite_result_id);


--
-- Name: test_result_result_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_result_result_index ON test_result USING btree (result);


--
-- Name: test_suite_name_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_suite_name_index ON test_suite USING btree (name);


--
-- Name: test_suite_pkg_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_suite_pkg_index ON test_suite USING btree (pkg);


--
-- Name: user_role_join_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX user_role_join_idx1 ON user_role USING btree (user_id);


--
-- Name: user_role_join_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX user_role_join_idx2 ON user_role USING btree (role_id);


--
-- Name: materialize_prev_views_on_delete; Type: RULE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE RULE materialize_prev_views_on_delete AS ON DELETE TO build DO (/*"*/ DELETE FROM prev_succ_build; INSERT INTO prev_succ_build (build, prev_build) SELECT prev_succ_build_view.build, prev_succ_build_view.prev_build FROM prev_succ_build_view; DELETE FROM build_fixed_by; INSERT INTO build_fixed_by (build, fix_build) SELECT build_fixed_by_build_view.build, build_fixed_by_build_view.fix_build FROM build_fixed_by_build_view; /*"*/);


--
-- Name: materialize_prev_views_on_insert; Type: RULE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE RULE materialize_prev_views_on_insert AS ON INSERT TO build DO (/*"*/ DELETE FROM prev_succ_build; INSERT INTO prev_succ_build (build, prev_build) SELECT prev_succ_build_view.build, prev_succ_build_view.prev_build FROM prev_succ_build_view; DELETE FROM build_fixed_by; INSERT INTO build_fixed_by (build, fix_build) SELECT build_fixed_by_build_view.build, build_fixed_by_build_view.fix_build FROM build_fixed_by_build_view; /*"*/);


--
-- Name: materialize_prev_views_on_update; Type: RULE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

CREATE RULE materialize_prev_views_on_update AS ON UPDATE TO build DO (/*"*/ DELETE FROM prev_succ_build; INSERT INTO prev_succ_build (build, prev_build) SELECT prev_succ_build_view.build, prev_succ_build_view.prev_build FROM prev_succ_build_view; DELETE FROM build_fixed_by; INSERT INTO build_fixed_by (build, fix_build) SELECT build_fixed_by_build_view.build, build_fixed_by_build_view.fix_build FROM build_fixed_by_build_view; /*"*/);


--
-- Name: build_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY build
    ADD CONSTRAINT build_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: build_environment_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY build
    ADD CONSTRAINT build_environment_id_fkey FOREIGN KEY (environment_id) REFERENCES environment(id);


--
-- Name: build_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY build
    ADD CONSTRAINT build_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: change_id_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY sandbox_change
    ADD CONSTRAINT change_id_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: change_module_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY change_module
    ADD CONSTRAINT change_module_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: change_module_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY change_module
    ADD CONSTRAINT change_module_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: change_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY change
    ADD CONSTRAINT change_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: data_data_class_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_data_class_id_fkey FOREIGN KEY (data_class_id) REFERENCES data_class(id);


--
-- Name: emma_build_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma
    ADD CONSTRAINT emma_build_id_fkey FOREIGN KEY (build_id) REFERENCES build(id);


--
-- Name: emma_class_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_class
    ADD CONSTRAINT emma_class_fk1 FOREIGN KEY (emma_srcfile_id) REFERENCES emma_srcfile(id);


--
-- Name: emma_class_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_class
    ADD CONSTRAINT emma_class_fk2 FOREIGN KEY (emma_package_id) REFERENCES emma_package(id);


--
-- Name: emma_class_report_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_class_report
    ADD CONSTRAINT emma_class_report_fk1 FOREIGN KEY (emma_class_id) REFERENCES emma_class(id);


--
-- Name: emma_class_report_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_class_report
    ADD CONSTRAINT emma_class_report_fk2 FOREIGN KEY (emma_srcfile_report_id) REFERENCES emma_srcfile_report(id);


--
-- Name: emma_class_report_fk3; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_class_report
    ADD CONSTRAINT emma_class_report_fk3 FOREIGN KEY (emma_package_report_id) REFERENCES emma_package_report(id);


--
-- Name: emma_method_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_method
    ADD CONSTRAINT emma_method_fk1 FOREIGN KEY (emma_class_id) REFERENCES emma_class(id);


--
-- Name: emma_method_report_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_method_report
    ADD CONSTRAINT emma_method_report_fk1 FOREIGN KEY (emma_method_id) REFERENCES emma_method(id);


--
-- Name: emma_method_report_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_method_report
    ADD CONSTRAINT emma_method_report_fk2 FOREIGN KEY (emma_class_report_id) REFERENCES emma_class_report(id);


--
-- Name: emma_pkg_fkey1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_package
    ADD CONSTRAINT emma_pkg_fkey1 FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: emma_pkgrpt_fkey1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_package_report
    ADD CONSTRAINT emma_pkgrpt_fkey1 FOREIGN KEY (emma_package_id) REFERENCES emma_package(id);


--
-- Name: emma_pkgrpt_fkey2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_package_report
    ADD CONSTRAINT emma_pkgrpt_fkey2 FOREIGN KEY (emma_id) REFERENCES emma(id);


--
-- Name: emma_srcfile_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_srcfile
    ADD CONSTRAINT emma_srcfile_fk1 FOREIGN KEY (emma_package_id) REFERENCES emma_package(id);


--
-- Name: emma_srcfile_report_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_srcfile_report
    ADD CONSTRAINT emma_srcfile_report_fk1 FOREIGN KEY (emma_srcfile_id) REFERENCES emma_srcfile(id);


--
-- Name: emma_srcfile_report_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY emma_srcfile_report
    ADD CONSTRAINT emma_srcfile_report_fk2 FOREIGN KEY (emma_package_report_id) REFERENCES emma_package_report(id);


--
-- Name: lock_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY path_lock
    ADD CONSTRAINT lock_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: lock_sandbox_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY path_lock
    ADD CONSTRAINT lock_sandbox_id_fkey FOREIGN KEY (sandbox_id) REFERENCES sandbox(id);


--
-- Name: module_build_trunk_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_build_trunk_id_fkey FOREIGN KEY (build_trunk_id) REFERENCES trunk(id);


--
-- Name: module_project_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: module_trunk_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY module_trunk
    ADD CONSTRAINT module_trunk_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: module_trunk_trunk_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY module_trunk
    ADD CONSTRAINT module_trunk_trunk_id_fkey FOREIGN KEY (trunk_id) REFERENCES trunk(id);


--
-- Name: project_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: property_environment_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_environment_id_fkey FOREIGN KEY (environment_id) REFERENCES environment(id);


--
-- Name: property_gauntlet_user_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_gauntlet_user_id_fkey FOREIGN KEY (gauntlet_user_id) REFERENCES gauntlet_user(id);


--
-- Name: property_meta_property_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_meta_property_id_fkey FOREIGN KEY (meta_property_id) REFERENCES meta_property(id);


--
-- Name: property_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: property_project_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: property_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: property_role_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: property_sandbox_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_sandbox_id_fkey FOREIGN KEY (sandbox_id) REFERENCES sandbox(id);


--
-- Name: sandbox_change_sandbox_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY sandbox_change
    ADD CONSTRAINT sandbox_change_sandbox_id_fkey FOREIGN KEY (sandbox_id) REFERENCES sandbox(id);


--
-- Name: sandbox_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY sandbox
    ADD CONSTRAINT sandbox_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: suite_result_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY suite_result
    ADD CONSTRAINT suite_result_fk1 FOREIGN KEY (suite_id) REFERENCES test_suite(id);


--
-- Name: suite_result_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY suite_result
    ADD CONSTRAINT suite_result_fk2 FOREIGN KEY (build_id) REFERENCES build(id);


--
-- Name: svnlog_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY svnlog
    ADD CONSTRAINT svnlog_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: svnlog_path_svnlog_id; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY svnlog_path
    ADD CONSTRAINT svnlog_path_svnlog_id FOREIGN KEY (svnlog_id) REFERENCES svnlog(id);


--
-- Name: test_case_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY test_case
    ADD CONSTRAINT test_case_fk1 FOREIGN KEY (suite_id) REFERENCES test_suite(id);


--
-- Name: test_result_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY test_result
    ADD CONSTRAINT test_result_fk1 FOREIGN KEY (test_id) REFERENCES test_case(id);


--
-- Name: test_result_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY test_result
    ADD CONSTRAINT test_result_fk2 FOREIGN KEY (suite_result_id) REFERENCES suite_result(id);


--
-- Name: test_suite_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY test_suite
    ADD CONSTRAINT test_suite_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: trunk_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY trunk
    ADD CONSTRAINT trunk_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: user_role_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_fk1 FOREIGN KEY (user_id) REFERENCES gauntlet_user(id);


--
-- Name: user_role_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_fk2 FOREIGN KEY (role_id) REFERENCES role(id);


--
-- PostgreSQL database dump complete
--


-- Copyright (c) 2005, Gauntlet Systems Corporation. All Rights Reserved.
--
-- Name: build; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE build (
    id integer NOT NULL,
    change_id integer NOT NULL,
    duration integer,
    success boolean,
    errmsg varchar(256),
    reportdir varchar(1024),
    artifactdir varchar(1024),
    module_id integer NOT NULL,
    started timestamp NOT NULL,
    log varchar(256),
    stack_trace varchar(256),
    environment_id integer
);


--
-- Name: change; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE change (
    id integer NOT NULL,
    revision integer NOT NULL,
    state integer NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: sandbox; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE sandbox (
    id integer NOT NULL,
    path varchar(1024) NOT NULL,
    state integer,
    repository_id integer
);


--
-- Name: sandbox_change; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE sandbox_change (
    id integer NOT NULL,
    change_id integer NOT NULL,
    sandbox_id integer NOT NULL,
    trunk_revision integer
);


--
-- Name: build_fixed_by; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE build_fixed_by (
    build integer,
    fix_build integer
);


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
    id integer NOT NULL,
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
    string_field1 varchar(256),
    string_field2 varchar(256),
    string_field3 varchar(256),
    string_field4 varchar(256),
    string_field5 varchar(256),
    string_field6 varchar(256),
    string_field7 varchar(256),
    string_field8 varchar(256),
    string_field9 varchar(256),
    string_field10 varchar(256),
    date_field1 timestamp ,
    date_field3 timestamp ,
    date_field2 timestamp ,
    boolean_field1 boolean,
    boolean_field2 boolean
    );


--
-- Name: data_class; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE data_class (
    id integer NOT NULL,
    name varchar(256) NOT NULL,
    parent_entity varchar(256) NOT NULL,
    int_field1_name varchar(256),
    int_field2_name varchar(256),
    int_field3_name varchar(256),
    int_field4_name varchar(256),
    int_field5_name varchar(256),
    int_field6_name varchar(256),
    int_field7_name varchar(256),
    int_field8_name varchar(256),
    int_field9_name varchar(256),
    int_field10_name varchar(256)
);


--
-- Name: data_class_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('data_class', 'id'), 1, false);


--
-- Name: data_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('data', 'id'), 1, false);


--
-- Name: emma; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma (
    id integer NOT NULL,
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
    report_path varchar(256)
);


--
-- Name: emma_class; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_class (
    id integer NOT NULL,
    emma_package_id integer NOT NULL,
    emma_srcfile_id integer,
    name varchar(1024) NOT NULL
);


--
-- Name: emma_class_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('emma_class', 'id'), 2, true);


--
-- Name: emma_class_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_class_report (
    id integer NOT NULL,
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

-- .setval(pg_catalog.pg_get_integer_sequence('emma_class_report', 'id'), 5, true);


--
-- Name: emma_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('emma', 'id'), 3, true);


--
-- Name: emma_method; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_method (
    id integer NOT NULL,
    emma_class_id integer NOT NULL,
    name varchar(1024) NOT NULL
);


--
-- Name: emma_method_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('emma_method', 'id'), 7, true);


--
-- Name: emma_method_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_method_report (
    id integer NOT NULL,
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

-- .setval(pg_catalog.pg_get_integer_sequence('emma_method_report', 'id'), 18, true);


--
-- Name: emma_package; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_package (
    id integer NOT NULL,
    module_id integer NOT NULL,
    name varchar(1024) NOT NULL
);


--
-- Name: emma_package_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('emma_package', 'id'), 1, true);


--
-- Name: emma_package_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_package_report (
    id integer NOT NULL,
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

-- .setval(pg_catalog.pg_get_integer_sequence('emma_package_report', 'id'), 3, true);


--
-- Name: emma_srcfile; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_srcfile (
    id integer NOT NULL,
    emma_package_id integer NOT NULL,
    name varchar(1024) NOT NULL
);


--
-- Name: emma_srcfile_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('emma_srcfile', 'id'), 2, true);


--
-- Name: emma_srcfile_report; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE emma_srcfile_report (
    id integer NOT NULL,
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

-- .setval(pg_catalog.pg_get_integer_sequence('emma_srcfile_report', 'id'), 5, true);


--
-- Name: environment; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE environment (
    id integer NOT NULL,
    name varchar(128) NOT NULL,
    description varchar(256)
);


--
-- Name: environment_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('environment', 'id'), 1, false);


--
-- Name: gauntlet_user; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE gauntlet_user (
    id integer NOT NULL,
    login_name varchar(99) NOT NULL,
    password_value varchar(32) NOT NULL,
    password_hex varchar(32) NOT NULL,
    first_name varchar(99),
    last_name varchar(99),
    email varchar(99),
    confirm_value varchar(99),
    modified timestamp,
    created timestamp,
    last_login timestamp,
    objectdata varchar(4000)
);


--
-- Name: gauntlet_user_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('gauntlet_user', 'id'), 5, true);


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
    id integer NOT NULL,
    name varchar(128) NOT NULL,
    "type" varchar(128) NOT NULL,
    scope varchar(32) NOT NULL,
    data_type integer NOT NULL,
    multi_value boolean,
    default_value varchar(256),
    default_int integer,
    min_value integer,
    max_value integer,
    description varchar(256)
);


--
-- Name: meta_property_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('meta_property', 'id'), 14, true);


--
-- Name: module; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE module (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name varchar(100) NOT NULL,
    build_trunk_id integer
);


--
-- Name: module_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('module', 'id'), 3, true);


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



--
-- Name: path_lock; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE path_lock (
    id integer NOT NULL,
    sandbox_id integer,
    path varchar(1024) NOT NULL,
    created timestamp NOT NULL,
    txn varchar(16) NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: path_lock_id_seq; Type: SEQUENCE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: path_lock_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval('path_lock_id_seq', 38, true);


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



--
-- Name: prev_succ_build_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: project; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE project (
    id integer NOT NULL,
    name varchar(1024) NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('project', 'id'), 1, true);


--
-- Name: property; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE property (
    id integer NOT NULL,
    gauntlet_user_id integer,
    role_id integer,
    repository_id integer,
    project_id integer,
    module_id integer,
    sandbox_id integer,
    environment_id integer,
    ordinal integer,
    text_value varchar(256),
    int_value integer,
    meta_property_id integer NOT NULL
);


--
-- Name: property_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('property', 'id'), 4, true);


--
-- Name: repository; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE repository (
    id integer NOT NULL,
    name varchar(1024) NOT NULL,
    url varchar(1024) NOT NULL,
    path varchar(1024),
    dir varchar(1024)
);


--
-- Name: repository_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('repository', 'id'), 1, true);


--
-- Name: role; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    name varchar(32) NOT NULL,
    description varchar(256)
);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('role', 'id'), 2, true);


--
-- Name: sandbox_change_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('sandbox_change', 'id'), 20, true);


--
-- Name: sandbox_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('sandbox', 'id'), 4, true);


--
-- Name: suite_result; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE suite_result (
    id integer NOT NULL,
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

-- .setval(pg_catalog.pg_get_integer_sequence('suite_result', 'id'), 6, true);


--
-- Name: svnlog; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE svnlog (
    id integer NOT NULL,
    change_id integer NOT NULL,
    author varchar(256),
    msg varchar(256),
    commit_date timestamp NOT NULL,
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

-- .setval(pg_catalog.pg_get_integer_sequence('svnlog', 'id'), 20, true);


--
-- Name: svnlog_path; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE svnlog_path (
    id integer NOT NULL,
    svnlog_id integer NOT NULL,
    commit_action varchar(4) NOT NULL,
    path varchar(256) NOT NULL
);


--
-- Name: svnlog_path_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('svnlog_path', 'id'), 37, true);


--
-- Name: table_updates; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: test_case; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE test_case (
    id integer NOT NULL,
    suite_id integer NOT NULL,
    classname varchar(300),
    method varchar(200)
);


--
-- Name: test_case_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('test_case', 'id'), 25, true);


--
-- Name: test_result; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE test_result (
    id integer NOT NULL,
    test_id integer NOT NULL,
    suite_result_id integer NOT NULL,
    duration double precision NOT NULL,
    fail_type varchar(200),
    body varchar(256),
    msg varchar(256),
    result integer NOT NULL
);


--
-- Name: testresult_by_build_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Name: test_fix_revision_view; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: test_result_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('test_result', 'id'), 31, true);


--
-- Name: test_suite; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE test_suite (
    id integer NOT NULL,
    pkg varchar(256) NOT NULL,
    name varchar(256) NOT NULL,
    module_id integer NOT NULL
);


--
-- Name: test_suite_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('test_suite', 'id'), 4, true);


--
-- Name: test_summary; Type: VIEW; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Name: trunk; Type: TABLE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE trunk (
    id integer NOT NULL,
    path varchar(1024) NOT NULL,
    repository_id integer NOT NULL
);


--
-- Name: trunk_id_seq; Type: SEQUENCE SET; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('trunk', 'id'), 4, true);


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
    id integer NOT NULL,
    description varchar(256)
);




--
-- Name: build_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE build
    ADD CONSTRAINT build_pkey PRIMARY KEY (id);


--
-- Name: change_id_unique; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE svnlog
    ADD CONSTRAINT change_id_unique UNIQUE (change_id);


--
-- Name: change_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE change
    ADD CONSTRAINT change_pkey PRIMARY KEY (id);


--
-- Name: data_class_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE data_class
    ADD CONSTRAINT data_class_pkey PRIMARY KEY (id);


--
-- Name: data_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE data
    ADD CONSTRAINT data_pkey PRIMARY KEY (id);


--
-- Name: emma_build_unique; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma
    ADD CONSTRAINT emma_build_unique UNIQUE (build_id);


--
-- Name: emma_class_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_class
    ADD CONSTRAINT emma_class_pkey PRIMARY KEY (id);


--
-- Name: emma_class_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_class_report
    ADD CONSTRAINT emma_class_report_pkey PRIMARY KEY (id);


--
-- Name: emma_method_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_method
    ADD CONSTRAINT emma_method_pkey PRIMARY KEY (id);


--
-- Name: emma_method_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_method_report
    ADD CONSTRAINT emma_method_report_pkey PRIMARY KEY (id);


--
-- Name: emma_package_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_package
    ADD CONSTRAINT emma_package_pkey PRIMARY KEY (id);


--
-- Name: emma_package_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_package_report
    ADD CONSTRAINT emma_package_report_pkey PRIMARY KEY (id);


--
-- Name: emma_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma
    ADD CONSTRAINT emma_pkey PRIMARY KEY (id);


--
-- Name: emma_srcfile_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_srcfile
    ADD CONSTRAINT emma_srcfile_pkey PRIMARY KEY (id);


--
-- Name: emma_srcfile_report_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE emma_srcfile_report
    ADD CONSTRAINT emma_srcfile_report_pkey PRIMARY KEY (id);


--
-- Name: environment_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE environment
    ADD CONSTRAINT environment_pkey PRIMARY KEY (id);


--
-- Name: gauntlet_user_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE gauntlet_user
    ADD CONSTRAINT gauntlet_user_pkey PRIMARY KEY (id);


--
-- Name: lock_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE path_lock
    ADD CONSTRAINT lock_pkey PRIMARY KEY (id);


--
-- Name: meta_property_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE meta_property
    ADD CONSTRAINT meta_property_pkey PRIMARY KEY (id);


--
-- Name: module_build_trunk_id_key; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE module
    ADD CONSTRAINT module_build_trunk_id_key UNIQUE (build_trunk_id);


--
-- Name: module_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE module
    ADD CONSTRAINT module_pkey PRIMARY KEY (id);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: property_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE property
    ADD CONSTRAINT property_pkey PRIMARY KEY (id);


--
-- Name: repository_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: sandbox_change_id_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE sandbox_change
    ADD CONSTRAINT sandbox_change_id_pkey PRIMARY KEY (id);


--
-- Name: sandbox_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE sandbox
    ADD CONSTRAINT sandbox_pkey PRIMARY KEY (id);


--
-- Name: set; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE sandbox_change
    ADD CONSTRAINT "set" UNIQUE (change_id);


--
-- Name: suite_result_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE suite_result
    ADD CONSTRAINT suite_result_pkey PRIMARY KEY (id);


--
-- Name: svnlog_path_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE svnlog_path
    ADD CONSTRAINT svnlog_path_pkey PRIMARY KEY (id);


--
-- Name: svnlog_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE svnlog
    ADD CONSTRAINT svnlog_pkey PRIMARY KEY (id);


--
-- Name: test_case_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE test_case
    ADD CONSTRAINT test_case_pkey PRIMARY KEY (id);


--
-- Name: test_result_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE test_result
    ADD CONSTRAINT test_result_pkey PRIMARY KEY (id);


--
-- Name: test_suite_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE test_suite
    ADD CONSTRAINT test_suite_pkey PRIMARY KEY (id);


--
-- Name: trunk_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE trunk
    ADD CONSTRAINT trunk_pkey PRIMARY KEY (id);


--
-- Name: user_u_1; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE gauntlet_user
    ADD CONSTRAINT user_u_1 UNIQUE (login_name);


--
-- Name: work_pkey; Type: CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE work_list
    ADD CONSTRAINT work_pkey PRIMARY KEY (id);


--
-- Name: build_change_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_change_id_index ON build (change_id);


--
-- Name: build_fixed_by_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_fixed_by_build_index ON build_fixed_by (build);


--
-- Name: build_fixed_by_fix_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_fixed_by_fix_build_index ON build_fixed_by (fix_build);


--
-- Name: build_module_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX build_module_id_index ON build (module_id);


--
-- Name: change_module_change_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_module_change_id_index ON change_module (change_id);


--
-- Name: change_module_module_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_module_module_id_index ON change_module (module_id);


--
-- Name: change_repository_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_repository_id_index ON change (repository_id);


--
-- Name: change_revision_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_revision_index ON change (revision);


--
-- Name: change_state_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX change_state_id_index ON change (state);


--
-- Name: data_class_name_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_class_name_index ON data_class (name);


--
-- Name: data_class_parent_entity_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_class_parent_entity_index ON data_class (parent_entity);


--
-- Name: data_data_class_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_data_class_id_index ON data (data_class_id);


--
-- Name: data_parent_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX data_parent_id_index ON data (parent_id);


--
-- Name: emma_class_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx1 ON emma_class (emma_srcfile_id);


--
-- Name: emma_class_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx2 ON emma_class_report (emma_class_id);


--
-- Name: emma_class_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx3 ON emma_class_report (emma_srcfile_report_id);


--
-- Name: emma_class_idx4; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx4 ON emma_class (emma_package_id);


--
-- Name: emma_class_idx5; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_class_idx5 ON emma_class_report (emma_package_report_id);


--
-- Name: emma_method_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_method_idx1 ON emma_method (emma_class_id);


--
-- Name: emma_method_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_method_idx2 ON emma_method_report (emma_method_id);


--
-- Name: emma_method_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_method_idx3 ON emma_method_report (emma_class_report_id);


--
-- Name: emma_pkg_module_idx; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_pkg_module_idx ON emma_package (module_id);


--
-- Name: emma_pkgrpt_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_pkgrpt_idx1 ON emma_package_report (emma_package_id);


--
-- Name: emma_pkgrpt_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_pkgrpt_idx2 ON emma_package_report (emma_id);


--
-- Name: emma_srcfile_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_srcfile_idx1 ON emma_srcfile (emma_package_id);


--
-- Name: emma_srcfile_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_srcfile_idx2 ON emma_srcfile_report (emma_srcfile_id);


--
-- Name: emma_srcfile_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX emma_srcfile_idx3 ON emma_srcfile_report (emma_package_report_id);


--
-- Name: environment_name_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX environment_name_index ON environment (name);


--
-- Name: meta_prop_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx1 ON meta_property (name);


--
-- Name: meta_prop_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx2 ON meta_property ("type");


--
-- Name: meta_prop_idx3; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx3 ON meta_property (scope);


--
-- Name: prev_succ_build_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prev_succ_build_build_index ON prev_succ_build (build);


--
-- Name: prev_succ_build_prev_build_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prev_succ_build_prev_build_index ON prev_succ_build (prev_build);


--
-- Name: property_environment_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_environment_id_index ON property (environment_id);


--
-- Name: property_gauntlet_user_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_gauntlet_user_id_index ON property (gauntlet_user_id);


--
-- Name: property_int_value_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_int_value_index ON property (int_value);


--
-- Name: property_meta_property_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_meta_property_id_index ON property (meta_property_id);


--
-- Name: property_module_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_module_id_index ON property (module_id);


--
-- Name: property_ordinal_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_ordinal_index ON property (ordinal);


--
-- Name: property_project_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_project_id_index ON property (project_id);


--
-- Name: property_repository_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_repository_id_index ON property (repository_id);


--
-- Name: property_role_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_role_id_index ON property (role_id);


--
-- Name: property_sandbox_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX property_sandbox_id_index ON property (sandbox_id);


--
-- Name: sandbox_path_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX sandbox_path_index ON sandbox (path);


--
-- Name: suite_result_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX suite_result_idx1 ON suite_result (suite_id);


--
-- Name: suite_result_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX suite_result_idx2 ON suite_result (build_id);


--
-- Name: svnlog_author_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX svnlog_author_index ON svnlog (author);


--
-- Name: svnlog_path_path_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX svnlog_path_path_index ON svnlog_path (path);


--
-- Name: svnlog_path_svnlog_id_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX svnlog_path_svnlog_id_index ON svnlog_path (svnlog_id);


--
-- Name: test_case_classname_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_case_classname_index ON test_case (classname);


--
-- Name: test_case_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_case_idx1 ON test_case (suite_id);


--
-- Name: test_case_method_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_case_method_index ON test_case (method);


--
-- Name: test_result_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_result_idx1 ON test_result (test_id);


--
-- Name: test_result_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_result_idx2 ON test_result (suite_result_id);


--
-- Name: test_result_result_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_result_result_index ON test_result (result);


--
-- Name: test_suite_name_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_suite_name_index ON test_suite (name);


--
-- Name: test_suite_pkg_index; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX test_suite_pkg_index ON test_suite (pkg);


--
-- Name: user_role_join_idx1; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX user_role_join_idx1 ON user_role (user_id);


--
-- Name: user_role_join_idx2; Type: INDEX; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX user_role_join_idx2 ON user_role (role_id);


--
-- Name: materialize_prev_views_on_delete; Type: RULE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- CREATE RULE materialize_prev_views_on_delete AS ON DELETE TO build DO (/*"*/ DELETE FROM prev_succ_build; INSERT INTO prev_succ_build (build, prev_build) SELECT prev_succ_build_view.build, prev_succ_build_view.prev_build FROM prev_succ_build_view; DELETE FROM build_fixed_by; INSERT INTO build_fixed_by (build, fix_build) SELECT build_fixed_by_build_view.build, build_fixed_by_build_view.fix_build FROM build_fixed_by_build_view; /*"*/);


--
-- Name: materialize_prev_views_on_insert; Type: RULE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- CREATE RULE materialize_prev_views_on_insert AS ON INSERT TO build DO (/*"*/ DELETE FROM prev_succ_build; INSERT INTO prev_succ_build (build, prev_build) SELECT prev_succ_build_view.build, prev_succ_build_view.prev_build FROM prev_succ_build_view; DELETE FROM build_fixed_by; INSERT INTO build_fixed_by (build, fix_build) SELECT build_fixed_by_build_view.build, build_fixed_by_build_view.fix_build FROM build_fixed_by_build_view; /*"*/);


--
-- Name: materialize_prev_views_on_update; Type: RULE; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- CREATE RULE materialize_prev_views_on_update AS ON UPDATE TO build DO (/*"*/ DELETE FROM prev_succ_build; INSERT INTO prev_succ_build (build, prev_build) SELECT prev_succ_build_view.build, prev_succ_build_view.prev_build FROM prev_succ_build_view; DELETE FROM build_fixed_by; INSERT INTO build_fixed_by (build, fix_build) SELECT build_fixed_by_build_view.build, build_fixed_by_build_view.fix_build FROM build_fixed_by_build_view; /*"*/);


--
-- Name: build_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE build
    ADD CONSTRAINT build_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: build_environment_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE build
    ADD CONSTRAINT build_environment_id_fkey FOREIGN KEY (environment_id) REFERENCES environment(id);


--
-- Name: build_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE build
    ADD CONSTRAINT build_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: change_id_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE sandbox_change
    ADD CONSTRAINT change_id_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: change_module_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE change_module
    ADD CONSTRAINT change_module_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: change_module_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE change_module
    ADD CONSTRAINT change_module_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: change_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE change
    ADD CONSTRAINT change_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: data_data_class_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE data
    ADD CONSTRAINT data_data_class_id_fkey FOREIGN KEY (data_class_id) REFERENCES data_class(id);


--
-- Name: emma_build_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma
    ADD CONSTRAINT emma_build_id_fkey FOREIGN KEY (build_id) REFERENCES build(id);


--
-- Name: emma_class_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_class
    ADD CONSTRAINT emma_class_fk1 FOREIGN KEY (emma_srcfile_id) REFERENCES emma_srcfile(id);


--
-- Name: emma_class_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_class
    ADD CONSTRAINT emma_class_fk2 FOREIGN KEY (emma_package_id) REFERENCES emma_package(id);


--
-- Name: emma_class_report_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_class_report
    ADD CONSTRAINT emma_class_report_fk1 FOREIGN KEY (emma_class_id) REFERENCES emma_class(id);


--
-- Name: emma_class_report_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_class_report
    ADD CONSTRAINT emma_class_report_fk2 FOREIGN KEY (emma_srcfile_report_id) REFERENCES emma_srcfile_report(id);


--
-- Name: emma_class_report_fk3; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_class_report
    ADD CONSTRAINT emma_class_report_fk3 FOREIGN KEY (emma_package_report_id) REFERENCES emma_package_report(id);


--
-- Name: emma_method_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_method
    ADD CONSTRAINT emma_method_fk1 FOREIGN KEY (emma_class_id) REFERENCES emma_class(id);


--
-- Name: emma_method_report_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_method_report
    ADD CONSTRAINT emma_method_report_fk1 FOREIGN KEY (emma_method_id) REFERENCES emma_method(id);


--
-- Name: emma_method_report_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_method_report
    ADD CONSTRAINT emma_method_report_fk2 FOREIGN KEY (emma_class_report_id) REFERENCES emma_class_report(id);


--
-- Name: emma_pkg_fkey1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_package
    ADD CONSTRAINT emma_pkg_fkey1 FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: emma_pkgrpt_fkey1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_package_report
    ADD CONSTRAINT emma_pkgrpt_fkey1 FOREIGN KEY (emma_package_id) REFERENCES emma_package(id);


--
-- Name: emma_pkgrpt_fkey2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_package_report
    ADD CONSTRAINT emma_pkgrpt_fkey2 FOREIGN KEY (emma_id) REFERENCES emma(id);


--
-- Name: emma_srcfile_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_srcfile
    ADD CONSTRAINT emma_srcfile_fk1 FOREIGN KEY (emma_package_id) REFERENCES emma_package(id);


--
-- Name: emma_srcfile_report_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_srcfile_report
    ADD CONSTRAINT emma_srcfile_report_fk1 FOREIGN KEY (emma_srcfile_id) REFERENCES emma_srcfile(id);


--
-- Name: emma_srcfile_report_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE emma_srcfile_report
    ADD CONSTRAINT emma_srcfile_report_fk2 FOREIGN KEY (emma_package_report_id) REFERENCES emma_package_report(id);


--
-- Name: lock_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE path_lock
    ADD CONSTRAINT lock_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: lock_sandbox_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE path_lock
    ADD CONSTRAINT lock_sandbox_id_fkey FOREIGN KEY (sandbox_id) REFERENCES sandbox(id);


--
-- Name: module_build_trunk_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE module
    ADD CONSTRAINT module_build_trunk_id_fkey FOREIGN KEY (build_trunk_id) REFERENCES trunk(id);


--
-- Name: module_project_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE module
    ADD CONSTRAINT module_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: module_trunk_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE module_trunk
    ADD CONSTRAINT module_trunk_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: module_trunk_trunk_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE module_trunk
    ADD CONSTRAINT module_trunk_trunk_id_fkey FOREIGN KEY (trunk_id) REFERENCES trunk(id);


--
-- Name: project_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE project
    ADD CONSTRAINT project_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: property_environment_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_environment_id_fkey FOREIGN KEY (environment_id) REFERENCES environment(id);


--
-- Name: property_gauntlet_user_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_gauntlet_user_id_fkey FOREIGN KEY (gauntlet_user_id) REFERENCES gauntlet_user(id);


--
-- Name: property_meta_property_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_meta_property_id_fkey FOREIGN KEY (meta_property_id) REFERENCES meta_property(id);


--
-- Name: property_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: property_project_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: property_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: property_role_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: property_sandbox_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE property
    ADD CONSTRAINT property_sandbox_id_fkey FOREIGN KEY (sandbox_id) REFERENCES sandbox(id);


--
-- Name: sandbox_change_sandbox_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE sandbox_change
    ADD CONSTRAINT sandbox_change_sandbox_id_fkey FOREIGN KEY (sandbox_id) REFERENCES sandbox(id);


--
-- Name: sandbox_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE sandbox
    ADD CONSTRAINT sandbox_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: suite_result_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE suite_result
    ADD CONSTRAINT suite_result_fk1 FOREIGN KEY (suite_id) REFERENCES test_suite(id);


--
-- Name: suite_result_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE suite_result
    ADD CONSTRAINT suite_result_fk2 FOREIGN KEY (build_id) REFERENCES build(id);


--
-- Name: svnlog_change_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE svnlog
    ADD CONSTRAINT svnlog_change_id_fkey FOREIGN KEY (change_id) REFERENCES change(id);


--
-- Name: svnlog_path_svnlog_id; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE svnlog_path
    ADD CONSTRAINT svnlog_path_svnlog_id FOREIGN KEY (svnlog_id) REFERENCES svnlog(id);


--
-- Name: test_case_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE test_case
    ADD CONSTRAINT test_case_fk1 FOREIGN KEY (suite_id) REFERENCES test_suite(id);


--
-- Name: test_result_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE test_result
    ADD CONSTRAINT test_result_fk1 FOREIGN KEY (test_id) REFERENCES test_case(id);


--
-- Name: test_result_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE test_result
    ADD CONSTRAINT test_result_fk2 FOREIGN KEY (suite_result_id) REFERENCES suite_result(id);


--
-- Name: test_suite_module_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE test_suite
    ADD CONSTRAINT test_suite_module_id_fkey FOREIGN KEY (module_id) REFERENCES module(id);


--
-- Name: trunk_repository_id_fkey; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE trunk
    ADD CONSTRAINT trunk_repository_id_fkey FOREIGN KEY (repository_id) REFERENCES repository(id);


--
-- Name: user_role_fk1; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE user_role
    ADD CONSTRAINT user_role_fk1 FOREIGN KEY (user_id) REFERENCES gauntlet_user(id);


--
-- Name: user_role_fk2; Type: FK CONSTRAINT; Schema: gauntletrun_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE user_role
    ADD CONSTRAINT user_role_fk2 FOREIGN KEY (role_id) REFERENCES role(id);


--
-- PostgreSQL database dump complete
--


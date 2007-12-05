CREATE TABLE table1 (
    id integer NOT NULL,
    table2_id integer NOT NULL,
    duration integer,
    success boolean,
    errmsg varchar(256),
    doc1dir varchar(1024),
    artifactdir varchar(1024),
    tree3_id integer NOT NULL,
    started timestamp NOT NULL,
    log varchar(256),
    stack_trace varchar(256),
    environment_id integer
);


--
-- Name: table2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table2 (
    id integer NOT NULL,
    revision integer NOT NULL,
    state integer NOT NULL,
    tree1_id integer NOT NULL
);


--
-- Name: table3; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table3 (
    id integer NOT NULL,
    doc3 varchar(1024) NOT NULL,
    state integer,
    tree1_id integer
);


--
-- Name: table3_table2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table3_table2 (
    id integer NOT NULL,
    table2_id integer NOT NULL,
    table3_id integer NOT NULL,
    tree5_revision integer
);


--
-- Name: table1_fixed_by; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table1_fixed_by (
    table1 integer,
    fix_table1 integer
);


--
-- Name: table2_tree3; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table2_tree3 (
    table2_id integer NOT NULL,
    tree3_id integer NOT NULL
);


--
-- Name: table4; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table4 (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    table4_sub2_id integer NOT NULL,
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
-- Name: table4_sub2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table4_sub2 (
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
-- Name: table4_sub2_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table4_sub2', 'id'), 1, false);


--
-- Name: table4_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table4', 'id'), 1, false);


--
-- Name: table5; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5 (
    id integer NOT NULL,
    table1_id integer NOT NULL,
    total_sub3s integer,
    total_sub2es integer,
    covered_sub2es integer,
    total_sub1s integer,
    covered_sub1s integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    sub2_coverage double precision,
    sub1_coverage double precision,
    block_coverage double precision,
    line_coverage double precision,
    doc1_doc3 varchar(256)
);


--
-- Name: table5_sub2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_sub2 (
    id integer NOT NULL,
    table5_sub3_id integer NOT NULL,
    table5_doc2_id integer,
    name varchar(1024) NOT NULL
);


--
-- Name: table5_sub2_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_sub2', 'id'), 2, true);


--
-- Name: table5_sub2_doc1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_sub2_doc1 (
    id integer NOT NULL,
    table5_sub2_id integer NOT NULL,
    table5_doc2_doc1_id integer,
    table5_sub3_doc1_id integer NOT NULL,
    total_sub2es integer,
    covered_sub2es integer,
    total_sub1s integer,
    covered_sub1s integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    sub2_coverage double precision,
    sub1_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: table5_sub2_doc1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_sub2_doc1', 'id'), 5, true);


--
-- Name: table5_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5', 'id'), 3, true);


--
-- Name: table5_sub1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_sub1 (
    id integer NOT NULL,
    table5_sub2_id integer NOT NULL,
    name varchar(1024) NOT NULL
);


--
-- Name: table5_sub1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_sub1', 'id'), 7, true);


--
-- Name: table5_sub1_doc1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_sub1_doc1 (
    id integer NOT NULL,
    table5_sub1_id integer NOT NULL,
    table5_sub2_doc1_id integer NOT NULL,
    total_sub1s integer,
    covered_sub1s integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    sub1_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: table5_sub1_doc1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_sub1_doc1', 'id'), 18, true);


--
-- Name: table5_sub3; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_sub3 (
    id integer NOT NULL,
    tree3_id integer NOT NULL,
    name varchar(1024) NOT NULL
);


--
-- Name: table5_sub3_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_sub3', 'id'), 1, true);


--
-- Name: table5_sub3_doc1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_sub3_doc1 (
    id integer NOT NULL,
    table5_id integer NOT NULL,
    table5_sub3_id integer NOT NULL,
    total_sub2es integer,
    covered_sub2es integer,
    total_sub1s integer,
    covered_sub1s integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    sub2_coverage double precision,
    sub1_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: table5_sub3_doc1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_sub3_doc1', 'id'), 3, true);


--
-- Name: table5_doc2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_doc2 (
    id integer NOT NULL,
    table5_sub3_id integer NOT NULL,
    name varchar(1024) NOT NULL
);


--
-- Name: table5_doc2_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_doc2', 'id'), 2, true);


--
-- Name: table5_doc2_doc1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE table5_doc2_doc1 (
    id integer NOT NULL,
    table5_doc2_id integer NOT NULL,
    table5_sub3_doc1_id integer NOT NULL,
    total_sub2es integer,
    covered_sub2es integer,
    total_sub1s integer,
    covered_sub1s integer,
    total_blocks integer,
    covered_blocks integer,
    total_lines integer,
    covered_lines integer,
    total_files integer,
    sub2_coverage double precision,
    sub1_coverage double precision,
    block_coverage double precision,
    line_coverage double precision
);


--
-- Name: table5_doc2_doc1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table5_doc2_doc1', 'id'), 5, true);


--
-- Name: environment; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE environment (
    id integer NOT NULL,
    name varchar(128) NOT NULL,
    description varchar(256)
);


--
-- Name: environment_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('environment', 'id'), 1, false);


--
-- Name: g123_prop1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE g123_prop1 (
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
    objecttable4 varchar(4000)
);


--
-- Name: g123_prop1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('g123_prop1', 'id'), 5, true);


--
-- Name: g123_version; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE g123_version (
    version integer NOT NULL
);


--
-- Name: meta_thing1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE meta_thing1 (
    id integer NOT NULL,
    name varchar(128) NOT NULL,
    "type" varchar(128) NOT NULL,
    scope varchar(32) NOT NULL,
    table4_type integer NOT NULL,
    multi_value boolean,
    default_value varchar(256),
    default_int integer,
    min_value integer,
    max_value integer,
    description varchar(256)
);


--
-- Name: meta_thing1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('meta_thing1', 'id'), 14, true);


--
-- Name: tree3; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE tree3 (
    id integer NOT NULL,
    tree2_id integer NOT NULL,
    name varchar(100) NOT NULL,
    table1_tree5_id integer
);


--
-- Name: tree3_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('tree3', 'id'), 3, true);


--
-- Name: tree3_tree5; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE tree3_tree5 (
    tree3_id integer NOT NULL,
    tree5_id integer NOT NULL
);


--
-- Name: next_visible_rev_by_table1_view; Type: VIEW; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Name: doc3_lock; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE doc3_lock (
    id integer NOT NULL,
    table3_id integer,
    doc3 varchar(1024) NOT NULL,
    created timestamp NOT NULL,
    txn varchar(16) NOT NULL,
    tree1_id integer NOT NULL
);


--
-- Name: doc3_lock_id_seq; Type: SEQUENCE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: doc3_lock_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval('doc3_lock_id_seq', 38, true);


--
-- Name: prev_succ_table1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE prev_succ_table1 (
    table1 integer,
    prev_table1 integer
);


--
-- Name: prev_succ_revision_by_table1_view; Type: VIEW; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Name: prev_succ_table1_view; Type: VIEW; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: tree2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE tree2 (
    id integer NOT NULL,
    name varchar(1024) NOT NULL,
    tree1_id integer NOT NULL
);


--
-- Name: tree2_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('tree2', 'id'), 1, true);


--
-- Name: thing1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE thing1 (
    id integer NOT NULL,
    g123_prop1_id integer,
    prop2_id integer,
    tree1_id integer,
    tree2_id integer,
    tree3_id integer,
    table3_id integer,
    environment_id integer,
    ordinal integer,
    text_value varchar(256),
    int_value integer,
    meta_thing1_id integer NOT NULL
);


--
-- Name: thing1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('thing1', 'id'), 4, true);


--
-- Name: tree1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE tree1 (
    id integer NOT NULL,
    name varchar(1024) NOT NULL,
    url varchar(1024) NOT NULL,
    doc3 varchar(1024),
    dir varchar(1024)
);


--
-- Name: tree1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('tree1', 'id'), 1, true);


--
-- Name: prop2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE prop2 (
    id integer NOT NULL,
    name varchar(32) NOT NULL,
    description varchar(256)
);


--
-- Name: prop2_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('prop2', 'id'), 2, true);


--
-- Name: table3_table2_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table3_table2', 'id'), 20, true);


--
-- Name: table3_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('table3', 'id'), 4, true);


--
-- Name: box1_doc5; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE box1_doc5 (
    id integer NOT NULL,
    box1_id integer NOT NULL,
    table1_id integer NOT NULL,
    num_thing2s integer NOT NULL,
    num_errors integer NOT NULL,
    num_failures integer NOT NULL,
    duration double precision
);


--
-- Name: box1_doc5_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('box1_doc5', 'id'), 6, true);


--
-- Name: service1log; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE service1log (
    id integer NOT NULL,
    table2_id integer NOT NULL,
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
-- Name: service1log_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('service1log', 'id'), 20, true);


--
-- Name: service1log_doc3; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE service1log_doc3 (
    id integer NOT NULL,
    service1log_id integer NOT NULL,
    commit_action varchar(4) NOT NULL,
    doc3 varchar(256) NOT NULL
);


--
-- Name: service1log_doc3_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('service1log_doc3', 'id'), 37, true);


--
-- Name: table_updates; Type: VIEW; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: thing2_case; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE thing2_case (
    id integer NOT NULL,
    box1_id integer NOT NULL,
    sub2name varchar(300),
    sub1 varchar(200)
);


--
-- Name: thing2_case_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('thing2_case', 'id'), 25, true);


--
-- Name: thing2_doc5; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE thing2_doc5 (
    id integer NOT NULL,
    thing2_id integer NOT NULL,
    box1_doc5_id integer NOT NULL,
    duration double precision NOT NULL,
    fail_type varchar(200),
    body varchar(256),
    msg varchar(256),
    doc5 integer NOT NULL
);


--
-- Name: thing2doc5_by_table1_view; Type: VIEW; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Name: thing2_fix_revision_view; Type: VIEW; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--


--
-- Name: thing2_doc5_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('thing2_doc5', 'id'), 31, true);


--
-- Name: thing2_box1; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE thing2_box1 (
    id integer NOT NULL,
    pkg varchar(256) NOT NULL,
    name varchar(256) NOT NULL,
    tree3_id integer NOT NULL
);


--
-- Name: thing2_box1_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('thing2_box1', 'id'), 4, true);


--
-- Name: thing2_summary; Type: VIEW; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--



--
-- Name: tree5; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE tree5 (
    id integer NOT NULL,
    doc3 varchar(1024) NOT NULL,
    tree1_id integer NOT NULL
);


--
-- Name: tree5_id_seq; Type: SEQUENCE SET; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- .setval(pg_catalog.pg_get_integer_sequence('tree5', 'id'), 4, true);


--
-- Name: prop1_prop2; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE prop1_prop2 (
    prop1_id integer NOT NULL,
    prop2_id integer NOT NULL
);


--
-- Name: work_list; Type: TABLE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE TABLE work_list (
    id integer NOT NULL,
    description varchar(256)
);




--
-- Name: table1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table1
    ADD CONSTRAINT table1_pkey PRIMARY KEY (id);


--
-- Name: table2_id_unique; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE service1log
    ADD CONSTRAINT table2_id_unique UNIQUE (table2_id);


--
-- Name: table2_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table2
    ADD CONSTRAINT table2_pkey PRIMARY KEY (id);


--
-- Name: table4_sub2_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table4_sub2
    ADD CONSTRAINT table4_sub2_pkey PRIMARY KEY (id);


--
-- Name: table4_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table4
    ADD CONSTRAINT table4_pkey PRIMARY KEY (id);


--
-- Name: table5_table1_unique; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5
    ADD CONSTRAINT table5_table1_unique UNIQUE (table1_id);


--
-- Name: table5_sub2_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_sub2
    ADD CONSTRAINT table5_sub2_pkey PRIMARY KEY (id);


--
-- Name: table5_sub2_doc1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_sub2_doc1
    ADD CONSTRAINT table5_sub2_doc1_pkey PRIMARY KEY (id);


--
-- Name: table5_sub1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_sub1
    ADD CONSTRAINT table5_sub1_pkey PRIMARY KEY (id);


--
-- Name: table5_sub1_doc1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_sub1_doc1
    ADD CONSTRAINT table5_sub1_doc1_pkey PRIMARY KEY (id);


--
-- Name: table5_sub3_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_sub3
    ADD CONSTRAINT table5_sub3_pkey PRIMARY KEY (id);


--
-- Name: table5_sub3_doc1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_sub3_doc1
    ADD CONSTRAINT table5_sub3_doc1_pkey PRIMARY KEY (id);


--
-- Name: table5_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5
    ADD CONSTRAINT table5_pkey PRIMARY KEY (id);


--
-- Name: table5_doc2_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_doc2
    ADD CONSTRAINT table5_doc2_pkey PRIMARY KEY (id);


--
-- Name: table5_doc2_doc1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table5_doc2_doc1
    ADD CONSTRAINT table5_doc2_doc1_pkey PRIMARY KEY (id);


--
-- Name: environment_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE environment
    ADD CONSTRAINT environment_pkey PRIMARY KEY (id);


--
-- Name: g123_prop1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE g123_prop1
    ADD CONSTRAINT g123_prop1_pkey PRIMARY KEY (id);


--
-- Name: lock_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE doc3_lock
    ADD CONSTRAINT lock_pkey PRIMARY KEY (id);


--
-- Name: meta_thing1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE meta_thing1
    ADD CONSTRAINT meta_thing1_pkey PRIMARY KEY (id);


--
-- Name: tree3_table1_tree5_id_key; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE tree3
    ADD CONSTRAINT tree3_table1_tree5_id_key UNIQUE (table1_tree5_id);


--
-- Name: tree3_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE tree3
    ADD CONSTRAINT tree3_pkey PRIMARY KEY (id);


--
-- Name: tree2_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE tree2
    ADD CONSTRAINT tree2_pkey PRIMARY KEY (id);


--
-- Name: thing1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_pkey PRIMARY KEY (id);


--
-- Name: tree1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE tree1
    ADD CONSTRAINT tree1_pkey PRIMARY KEY (id);


--
-- Name: prop2_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE prop2
    ADD CONSTRAINT prop2_pkey PRIMARY KEY (id);


--
-- Name: table3_table2_id_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table3_table2
    ADD CONSTRAINT table3_table2_id_pkey PRIMARY KEY (id);


--
-- Name: table3_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table3
    ADD CONSTRAINT table3_pkey PRIMARY KEY (id);


--
-- Name: set; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE table3_table2
    ADD CONSTRAINT "set" UNIQUE (table2_id);


--
-- Name: box1_doc5_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE box1_doc5
    ADD CONSTRAINT box1_doc5_pkey PRIMARY KEY (id);


--
-- Name: service1log_doc3_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE service1log_doc3
    ADD CONSTRAINT service1log_doc3_pkey PRIMARY KEY (id);


--
-- Name: service1log_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE service1log
    ADD CONSTRAINT service1log_pkey PRIMARY KEY (id);


--
-- Name: thing2_case_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE thing2_case
    ADD CONSTRAINT thing2_case_pkey PRIMARY KEY (id);


--
-- Name: thing2_doc5_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE thing2_doc5
    ADD CONSTRAINT thing2_doc5_pkey PRIMARY KEY (id);


--
-- Name: thing2_box1_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE thing2_box1
    ADD CONSTRAINT thing2_box1_pkey PRIMARY KEY (id);


--
-- Name: tree5_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE tree5
    ADD CONSTRAINT tree5_pkey PRIMARY KEY (id);


--
-- Name: prop1_u_1; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE g123_prop1
    ADD CONSTRAINT prop1_u_1 UNIQUE (login_name);


--
-- Name: work_pkey; Type: CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

ALTER TABLE work_list
    ADD CONSTRAINT work_pkey PRIMARY KEY (id);


--
-- Name: table1_table2_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table1_table2_id_index ON table1 (table2_id);


--
-- Name: table1_fixed_by_table1_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table1_fixed_by_table1_index ON table1_fixed_by (table1);


--
-- Name: table1_fixed_by_fix_table1_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table1_fixed_by_fix_table1_index ON table1_fixed_by (fix_table1);


--
-- Name: table1_tree3_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table1_tree3_id_index ON table1 (tree3_id);


--
-- Name: table2_tree3_table2_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table2_tree3_table2_id_index ON table2_tree3 (table2_id);


--
-- Name: table2_tree3_tree3_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table2_tree3_tree3_id_index ON table2_tree3 (tree3_id);


--
-- Name: table2_tree1_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table2_tree1_id_index ON table2 (tree1_id);


--
-- Name: table2_revision_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table2_revision_index ON table2 (revision);


--
-- Name: table2_state_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table2_state_id_index ON table2 (state);


--
-- Name: table4_sub2_name_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table4_sub2_name_index ON table4_sub2 (name);


--
-- Name: table4_sub2_parent_entity_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table4_sub2_parent_entity_index ON table4_sub2 (parent_entity);


--
-- Name: table4_table4_sub2_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table4_table4_sub2_id_index ON table4 (table4_sub2_id);


--
-- Name: table4_parent_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table4_parent_id_index ON table4 (parent_id);


--
-- Name: table5_sub2_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub2_idx1 ON table5_sub2 (table5_doc2_id);


--
-- Name: table5_sub2_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub2_idx2 ON table5_sub2_doc1 (table5_sub2_id);


--
-- Name: table5_sub2_idx3; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub2_idx3 ON table5_sub2_doc1 (table5_doc2_doc1_id);


--
-- Name: table5_sub2_idx4; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub2_idx4 ON table5_sub2 (table5_sub3_id);


--
-- Name: table5_sub2_idx5; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub2_idx5 ON table5_sub2_doc1 (table5_sub3_doc1_id);


--
-- Name: table5_sub1_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub1_idx1 ON table5_sub1 (table5_sub2_id);


--
-- Name: table5_sub1_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub1_idx2 ON table5_sub1_doc1 (table5_sub1_id);


--
-- Name: table5_sub1_idx3; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_sub1_idx3 ON table5_sub1_doc1 (table5_sub2_doc1_id);


--
-- Name: table5_pkg_tree3_idx; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_pkg_tree3_idx ON table5_sub3 (tree3_id);


--
-- Name: table5_pkgrpt_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_pkgrpt_idx1 ON table5_sub3_doc1 (table5_sub3_id);


--
-- Name: table5_pkgrpt_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_pkgrpt_idx2 ON table5_sub3_doc1 (table5_id);


--
-- Name: table5_doc2_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_doc2_idx1 ON table5_doc2 (table5_sub3_id);


--
-- Name: table5_doc2_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_doc2_idx2 ON table5_doc2_doc1 (table5_doc2_id);


--
-- Name: table5_doc2_idx3; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table5_doc2_idx3 ON table5_doc2_doc1 (table5_sub3_doc1_id);


--
-- Name: environment_name_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX environment_name_index ON environment (name);


--
-- Name: meta_prop_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx1 ON meta_thing1 (name);


--
-- Name: meta_prop_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx2 ON meta_thing1 ("type");


--
-- Name: meta_prop_idx3; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX meta_prop_idx3 ON meta_thing1 (scope);


--
-- Name: prev_succ_table1_table1_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prev_succ_table1_table1_index ON prev_succ_table1 (table1);


--
-- Name: prev_succ_table1_prev_table1_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prev_succ_table1_prev_table1_index ON prev_succ_table1 (prev_table1);


--
-- Name: thing1_environment_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_environment_id_index ON thing1 (environment_id);


--
-- Name: thing1_g123_prop1_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_g123_prop1_id_index ON thing1 (g123_prop1_id);


--
-- Name: thing1_int_value_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_int_value_index ON thing1 (int_value);


--
-- Name: thing1_meta_thing1_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_meta_thing1_id_index ON thing1 (meta_thing1_id);


--
-- Name: thing1_tree3_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_tree3_id_index ON thing1 (tree3_id);


--
-- Name: thing1_ordinal_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_ordinal_index ON thing1 (ordinal);


--
-- Name: thing1_tree2_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_tree2_id_index ON thing1 (tree2_id);


--
-- Name: thing1_tree1_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_tree1_id_index ON thing1 (tree1_id);


--
-- Name: thing1_prop2_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_prop2_id_index ON thing1 (prop2_id);


--
-- Name: thing1_table3_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing1_table3_id_index ON thing1 (table3_id);


--
-- Name: table3_doc3_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX table3_doc3_index ON table3 (doc3);


--
-- Name: box1_doc5_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX box1_doc5_idx1 ON box1_doc5 (box1_id);


--
-- Name: box1_doc5_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX box1_doc5_idx2 ON box1_doc5 (table1_id);


--
-- Name: service1log_author_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX service1log_author_index ON service1log (author);


--
-- Name: service1log_doc3_doc3_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX service1log_doc3_doc3_index ON service1log_doc3 (doc3);


--
-- Name: service1log_doc3_service1log_id_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX service1log_doc3_service1log_id_index ON service1log_doc3 (service1log_id);


--
-- Name: thing2_case_sub2name_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_case_sub2name_index ON thing2_case (sub2name);


--
-- Name: thing2_case_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_case_idx1 ON thing2_case (box1_id);


--
-- Name: thing2_case_sub1_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_case_sub1_index ON thing2_case (sub1);


--
-- Name: thing2_doc5_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_doc5_idx1 ON thing2_doc5 (thing2_id);


--
-- Name: thing2_doc5_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_doc5_idx2 ON thing2_doc5 (box1_doc5_id);


--
-- Name: thing2_doc5_doc5_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_doc5_doc5_index ON thing2_doc5 (doc5);


--
-- Name: thing2_box1_name_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_box1_name_index ON thing2_box1 (name);


--
-- Name: thing2_box1_pkg_index; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX thing2_box1_pkg_index ON thing2_box1 (pkg);


--
-- Name: prop1_prop2_join_idx1; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prop1_prop2_join_idx1 ON prop1_prop2 (prop1_id);


--
-- Name: prop1_prop2_join_idx2; Type: INDEX; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt; Tablespace: 
--

CREATE INDEX prop1_prop2_join_idx2 ON prop1_prop2 (prop2_id);


--
-- Name: materialize_prev_views_on_delete; Type: RULE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- CREATE RULE materialize_prev_views_on_delete AS ON DELETE TO table1 DO (/*"*/ DELETE FROM prev_succ_table1; INSERT INTO prev_succ_table1 (table1, prev_table1) SELECT prev_succ_table1_view.table1, prev_succ_table1_view.prev_table1 FROM prev_succ_table1_view; DELETE FROM table1_fixed_by; INSERT INTO table1_fixed_by (table1, fix_table1) SELECT table1_fixed_by_table1_view.table1, table1_fixed_by_table1_view.fix_table1 FROM table1_fixed_by_table1_view; /*"*/);


--
-- Name: materialize_prev_views_on_insert; Type: RULE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- CREATE RULE materialize_prev_views_on_insert AS ON INSERT TO table1 DO (/*"*/ DELETE FROM prev_succ_table1; INSERT INTO prev_succ_table1 (table1, prev_table1) SELECT prev_succ_table1_view.table1, prev_succ_table1_view.prev_table1 FROM prev_succ_table1_view; DELETE FROM table1_fixed_by; INSERT INTO table1_fixed_by (table1, fix_table1) SELECT table1_fixed_by_table1_view.table1, table1_fixed_by_table1_view.fix_table1 FROM table1_fixed_by_table1_view; /*"*/);


--
-- Name: materialize_prev_views_on_update; Type: RULE; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

-- CREATE RULE materialize_prev_views_on_update AS ON UPDATE TO table1 DO (/*"*/ DELETE FROM prev_succ_table1; INSERT INTO prev_succ_table1 (table1, prev_table1) SELECT prev_succ_table1_view.table1, prev_succ_table1_view.prev_table1 FROM prev_succ_table1_view; DELETE FROM table1_fixed_by; INSERT INTO table1_fixed_by (table1, fix_table1) SELECT table1_fixed_by_table1_view.table1, table1_fixed_by_table1_view.fix_table1 FROM table1_fixed_by_table1_view; /*"*/);


--
-- Name: table1_table2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table1
    ADD CONSTRAINT table1_table2_id_fkey FOREIGN KEY (table2_id) REFERENCES table2(id);


--
-- Name: table1_environment_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table1
    ADD CONSTRAINT table1_environment_id_fkey FOREIGN KEY (environment_id) REFERENCES environment(id);


--
-- Name: table1_tree3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table1
    ADD CONSTRAINT table1_tree3_id_fkey FOREIGN KEY (tree3_id) REFERENCES tree3(id);


--
-- Name: table2_id_table2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table3_table2
    ADD CONSTRAINT table2_id_table2_id_fkey FOREIGN KEY (table2_id) REFERENCES table2(id);


--
-- Name: table2_tree3_table2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table2_tree3
    ADD CONSTRAINT table2_tree3_table2_id_fkey FOREIGN KEY (table2_id) REFERENCES table2(id);


--
-- Name: table2_tree3_tree3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table2_tree3
    ADD CONSTRAINT table2_tree3_tree3_id_fkey FOREIGN KEY (tree3_id) REFERENCES tree3(id);


--
-- Name: table2_tree1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table2
    ADD CONSTRAINT table2_tree1_id_fkey FOREIGN KEY (tree1_id) REFERENCES tree1(id);


--
-- Name: table4_table4_sub2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table4
    ADD CONSTRAINT table4_table4_sub2_id_fkey FOREIGN KEY (table4_sub2_id) REFERENCES table4_sub2(id);


--
-- Name: table5_table1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5
    ADD CONSTRAINT table5_table1_id_fkey FOREIGN KEY (table1_id) REFERENCES table1(id);


--
-- Name: table5_sub2_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub2
    ADD CONSTRAINT table5_sub2_fk1 FOREIGN KEY (table5_doc2_id) REFERENCES table5_doc2(id);


--
-- Name: table5_sub2_fk2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub2
    ADD CONSTRAINT table5_sub2_fk2 FOREIGN KEY (table5_sub3_id) REFERENCES table5_sub3(id);


--
-- Name: table5_sub2_doc1_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub2_doc1
    ADD CONSTRAINT table5_sub2_doc1_fk1 FOREIGN KEY (table5_sub2_id) REFERENCES table5_sub2(id);


--
-- Name: table5_sub2_doc1_fk2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub2_doc1
    ADD CONSTRAINT table5_sub2_doc1_fk2 FOREIGN KEY (table5_doc2_doc1_id) REFERENCES table5_doc2_doc1(id);


--
-- Name: table5_sub2_doc1_fk3; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub2_doc1
    ADD CONSTRAINT table5_sub2_doc1_fk3 FOREIGN KEY (table5_sub3_doc1_id) REFERENCES table5_sub3_doc1(id);


--
-- Name: table5_sub1_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub1
    ADD CONSTRAINT table5_sub1_fk1 FOREIGN KEY (table5_sub2_id) REFERENCES table5_sub2(id);


--
-- Name: table5_sub1_doc1_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub1_doc1
    ADD CONSTRAINT table5_sub1_doc1_fk1 FOREIGN KEY (table5_sub1_id) REFERENCES table5_sub1(id);


--
-- Name: table5_sub1_doc1_fk2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub1_doc1
    ADD CONSTRAINT table5_sub1_doc1_fk2 FOREIGN KEY (table5_sub2_doc1_id) REFERENCES table5_sub2_doc1(id);


--
-- Name: table5_pkg_fkey1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub3
    ADD CONSTRAINT table5_pkg_fkey1 FOREIGN KEY (tree3_id) REFERENCES tree3(id);


--
-- Name: table5_pkgrpt_fkey1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub3_doc1
    ADD CONSTRAINT table5_pkgrpt_fkey1 FOREIGN KEY (table5_sub3_id) REFERENCES table5_sub3(id);


--
-- Name: table5_pkgrpt_fkey2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_sub3_doc1
    ADD CONSTRAINT table5_pkgrpt_fkey2 FOREIGN KEY (table5_id) REFERENCES table5(id);


--
-- Name: table5_doc2_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_doc2
    ADD CONSTRAINT table5_doc2_fk1 FOREIGN KEY (table5_sub3_id) REFERENCES table5_sub3(id);


--
-- Name: table5_doc2_doc1_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_doc2_doc1
    ADD CONSTRAINT table5_doc2_doc1_fk1 FOREIGN KEY (table5_doc2_id) REFERENCES table5_doc2(id);


--
-- Name: table5_doc2_doc1_fk2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table5_doc2_doc1
    ADD CONSTRAINT table5_doc2_doc1_fk2 FOREIGN KEY (table5_sub3_doc1_id) REFERENCES table5_sub3_doc1(id);


--
-- Name: lock_tree1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE doc3_lock
    ADD CONSTRAINT lock_tree1_id_fkey FOREIGN KEY (tree1_id) REFERENCES tree1(id);


--
-- Name: lock_table3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE doc3_lock
    ADD CONSTRAINT lock_table3_id_fkey FOREIGN KEY (table3_id) REFERENCES table3(id);


--
-- Name: tree3_table1_tree5_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE tree3
    ADD CONSTRAINT tree3_table1_tree5_id_fkey FOREIGN KEY (table1_tree5_id) REFERENCES tree5(id);


--
-- Name: tree3_tree2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE tree3
    ADD CONSTRAINT tree3_tree2_id_fkey FOREIGN KEY (tree2_id) REFERENCES tree2(id);


--
-- Name: tree3_tree5_tree3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE tree3_tree5
    ADD CONSTRAINT tree3_tree5_tree3_id_fkey FOREIGN KEY (tree3_id) REFERENCES tree3(id);


--
-- Name: tree3_tree5_tree5_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE tree3_tree5
    ADD CONSTRAINT tree3_tree5_tree5_id_fkey FOREIGN KEY (tree5_id) REFERENCES tree5(id);


--
-- Name: tree2_tree1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE tree2
    ADD CONSTRAINT tree2_tree1_id_fkey FOREIGN KEY (tree1_id) REFERENCES tree1(id);


--
-- Name: thing1_environment_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_environment_id_fkey FOREIGN KEY (environment_id) REFERENCES environment(id);


--
-- Name: thing1_g123_prop1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_g123_prop1_id_fkey FOREIGN KEY (g123_prop1_id) REFERENCES g123_prop1(id);


--
-- Name: thing1_meta_thing1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_meta_thing1_id_fkey FOREIGN KEY (meta_thing1_id) REFERENCES meta_thing1(id);


--
-- Name: thing1_tree3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_tree3_id_fkey FOREIGN KEY (tree3_id) REFERENCES tree3(id);


--
-- Name: thing1_tree2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_tree2_id_fkey FOREIGN KEY (tree2_id) REFERENCES tree2(id);


--
-- Name: thing1_tree1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_tree1_id_fkey FOREIGN KEY (tree1_id) REFERENCES tree1(id);


--
-- Name: thing1_prop2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_prop2_id_fkey FOREIGN KEY (prop2_id) REFERENCES prop2(id);


--
-- Name: thing1_table3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing1
    ADD CONSTRAINT thing1_table3_id_fkey FOREIGN KEY (table3_id) REFERENCES table3(id);


--
-- Name: table3_table2_table3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table3_table2
    ADD CONSTRAINT table3_table2_table3_id_fkey FOREIGN KEY (table3_id) REFERENCES table3(id);


--
-- Name: table3_tree1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE table3
    ADD CONSTRAINT table3_tree1_id_fkey FOREIGN KEY (tree1_id) REFERENCES tree1(id);


--
-- Name: box1_doc5_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE box1_doc5
    ADD CONSTRAINT box1_doc5_fk1 FOREIGN KEY (box1_id) REFERENCES thing2_box1(id);


--
-- Name: box1_doc5_fk2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE box1_doc5
    ADD CONSTRAINT box1_doc5_fk2 FOREIGN KEY (table1_id) REFERENCES table1(id);


--
-- Name: service1log_table2_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE service1log
    ADD CONSTRAINT service1log_table2_id_fkey FOREIGN KEY (table2_id) REFERENCES table2(id);


--
-- Name: service1log_doc3_service1log_id; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE service1log_doc3
    ADD CONSTRAINT service1log_doc3_service1log_id FOREIGN KEY (service1log_id) REFERENCES service1log(id);


--
-- Name: thing2_case_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing2_case
    ADD CONSTRAINT thing2_case_fk1 FOREIGN KEY (box1_id) REFERENCES thing2_box1(id);


--
-- Name: thing2_doc5_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing2_doc5
    ADD CONSTRAINT thing2_doc5_fk1 FOREIGN KEY (thing2_id) REFERENCES thing2_case(id);


--
-- Name: thing2_doc5_fk2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing2_doc5
    ADD CONSTRAINT thing2_doc5_fk2 FOREIGN KEY (box1_doc5_id) REFERENCES box1_doc5(id);


--
-- Name: thing2_box1_tree3_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE thing2_box1
    ADD CONSTRAINT thing2_box1_tree3_id_fkey FOREIGN KEY (tree3_id) REFERENCES tree3(id);


--
-- Name: tree5_tree1_id_fkey; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE tree5
    ADD CONSTRAINT tree5_tree1_id_fkey FOREIGN KEY (tree1_id) REFERENCES tree1(id);


--
-- Name: prop1_prop2_fk1; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE prop1_prop2
    ADD CONSTRAINT prop1_prop2_fk1 FOREIGN KEY (prop1_id) REFERENCES g123_prop1(id);


--
-- Name: prop1_prop2_fk2; Type: FK CONSTRAINT; Schema: g123run_tstamp_2005_12_12_13_27_57_356; Owner: bt
--

ALTER TABLE prop1_prop2
    ADD CONSTRAINT prop1_prop2_fk2 FOREIGN KEY (prop2_id) REFERENCES prop2(id);


--
-- PostgreSQL table4base dump complete
--


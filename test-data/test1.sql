CREATE TABLE foo (
   id integer NOT NULL,
   f1 integer,
   f2 varchar(256)
);

ALTER TABLE foo ADD CONSTRAINT foo_pkey PRIMARY KEY(id);

CREATE TABLE bar (
  id integer NOT NULL,
  foo integer NOT NULL
);

ALTER TABLE bar
  ADD CONSTRAINT bar_foo_id_fky FOREIGN KEY (foo) REFERENCES foo(id);
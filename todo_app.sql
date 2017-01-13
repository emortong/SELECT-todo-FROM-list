\c estefaniamorton;

DROP USER IF EXISTS micheal;

CREATE USER micheal
WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id serial,
  title character varying (255),
  description text,
  created_at timestamp,
  updated_at timestamp,
  completed boolean
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp NULL DEFAULT NULL;

-- ALTER TABLE tasks ALTER COLUMN updated_at NOT NULL SET DEFAULT now();

INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this excercise', now(), now(), NULL);

INSERT INTO tasks VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', now(), now(), NULL);

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at ASC;

INSERT INTO tasks VALUES (DEFAULT, 'mistake 1', 'a test entry', now(), now(), NULL);

INSERT INTO tasks VALUES (DEFAULT, 'mistake 2', 'another test entry', now(), now(), NULL);

INSERT INTO tasks VALUES (DEFAULT, 'third mistake', 'another test entry', now(), now(), NULL);

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks where title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks where title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;
\dt;
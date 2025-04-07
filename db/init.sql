CREATE DATABASE sharedappdb;
\c sharedappdb;

CREATE TABLE IF NOT EXISTS devs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO devs (name) 
SELECT unnest(ARRAY['Flask Developer', 'Node Developer', 'Shared DB User'])
WHERE NOT EXISTS (SELECT 1 FROM devs);

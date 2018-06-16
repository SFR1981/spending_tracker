DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;



CREATE TABLE merchants (
  id serial4 primary key,
  name varchar(255),
  logo varchar(255),
  active boolean
);

CREATE TABLE tags (
  id serial4 primary key,
  name varchar(255),
  icon varchar(255)
);

CREATE TABLE transactions (
  id serial4 primary key,
  merchant_id int4 REFERENCES merchants(id) ON DELETE CASCADE ,
  tag_id int4 REFERENCES tags(id) ON DELETE CASCADE,
  value int2,
  reference varchar(255)
);

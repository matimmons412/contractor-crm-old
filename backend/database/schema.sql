BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS project_subcontractor;
DROP TABLE IF EXISTS customer_project;
DROP TABLE IF EXISTS subcontractor_trade;
DROP TABLE IF EXISTS subcontractor;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS trade;
DROP TABLE IF EXISTS address;

DROP SEQUENCE IF EXISTS seq_customer_id;
DROP SEQUENCE IF EXISTS seq_subcontractor_id;
DROP SEQUENCE IF EXISTS seq_trade_id;
DROP SEQUENCE IF EXISTS seq_project_id;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_address_id;

CREATE SEQUENCE seq_customer_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_project_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_subcontractor_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_trade_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_address_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE TABLE address (
  address_id int DEFAULT nextval('seq_address_id'::regclass) NOT NULL,
  street varchar(100),
  city varchar(100),
  zip varchar(5),
  PRIMARY KEY (address_id)
);

CREATE TABLE customer (
  customer_id int DEFAULT nextval('seq_customer_id'::regclass) NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  address_id int,
  email varchar(100) NOT NULL,
  phone_number varchar(10) NOT NULL,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE subcontractor (
  subcontractor_id int DEFAULT nextval('seq_subcontractor_id'::regclass) NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  address_id int DEFAULT NULL,
  phone_number varchar(10) NOT NULL,
  email varchar(100),
  company_name varchar(200),
  PRIMARY KEY (subcontractor_id),
  FOREIGN KEY (address_id) REFERENCES address(address_id)
);

INSERT INTO subcontractor (subcontractor_id, first_name, last_name, address_id, phone_number, email, company_name) VALUES (DEFAULT, 'Jamin', 'Irizarry', DEFAULT, '4125555555', 'fake@gmail.com', 'Laurel Craftsmen Co.');

CREATE TABLE trade (
  trade_id int DEFAULT nextval('seq_trade_id'::regclass) NOT NULL,
  trade varchar(100) NOT NULL,
  PRIMARY KEY (trade_id)
);

INSERT INTO trade (trade_id, trade) VALUES (DEFAULT, 'Tile');
INSERT INTO trade (trade_id, trade) VALUES (DEFAULT, 'Paint');
INSERT INTO trade (trade_id, trade) VALUES (DEFAULT, 'Drywall/Mud');
INSERT INTO trade (trade_id, trade) VALUES (DEFAULT, 'Roofing');
INSERT INTO trade (trade_id, trade) VALUES (DEFAULT, 'Plumbing');
INSERT INTO trade (trade_id, trade) VALUES (DEFAULT, 'Electrician');

CREATE TABLE subcontractor_trade (
  subcontractor_id int NOT NULL,
  trade_id int NOT NULL,
  PRIMARY KEY (subcontractor_id, trade_id),
  FOREIGN KEY (subcontractor_id) REFERENCES subcontractor(subcontractor_id),
  FOREIGN KEY (trade_id) REFERENCES trade(trade_id)
);

INSERT INTO subcontractor_trade (subcontractor_id, trade_id) VALUES (
(SELECT subcontractor_id FROM subcontractor WHERE first_name ILIKE 'Jamin'),
(SELECT trade_id FROM trade WHERE trade ILIKE 'Tile'));

CREATE TABLE project (
  project_id int DEFAULT nextval('seq_project_id'::regclass) NOT NULL,
  start_date DATE NOT NULL,
  estimated_end_date DATE,
  job_complete boolean NOT NULL, 
  end_date DATE,
  address_id int NOT NULL,
  PRIMARY KEY (project_id),
  FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE customer_project (
  customer_id int NOT NULL,
  project_id int NOT NULL,
  PRIMARY KEY (customer_id, project_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE project_subcontractor (
  subcontractor_id int NOT NULL,
  project_id int NOT NULL,
  PRIMARY KEY (subcontractor_id, project_id),
  FOREIGN KEY (subcontractor_id) REFERENCES subcontractor(subcontractor_id),
  FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

COMMIT TRANSACTION;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS project_subcontractor;
DROP TABLE IF EXISTS customer_project;
DROP TABLE IF EXISTS subcontractor_trade;
DROP TABLE IF EXISTS subcontractor;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS trade;

DROP SEQUENCE IF EXISTS seq_customer_id;
DROP SEQUENCE IF EXISTS seq_subcontractor_id;
DROP SEQUENCE IF EXISTS seq_trade_id;
DROP SEQUENCE IF EXISTS seq_project_id;
DROP SEQUENCE IF EXISTS seq_user_id;

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
  
CREATE TABLE customer (
  customer_id int DEFAULT nextval('seq_customer_id'::regclass) NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  street varchar(100),
  city varchar(100),
  zip varchar(5),
  email varchar(100) NOT NULL,
  phone_number varchar(10) NOT NULL,
  gender varchar(1),
  PRIMARY KEY (customer_id)
);

CREATE TABLE subcontractor (
  subcontractor_id int DEFAULT nextval('seq_subcontractor_id'::regclass) NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  phone_number varchar(10) NOT NULL,
  email varchar(100),
  company_name varchar(200),
  PRIMARY KEY (subcontractor_id)
);

CREATE TABLE trade (
  trade_id int DEFAULT nextval('seq_trade_id'::regclass) NOT NULL,
  trade varchar(100) NOT NULL,
  PRIMARY KEY (trade_id)
);

CREATE TABLE subcontractor_trade (
  subcontractor_id int NOT NULL,
  trade_id int NOT NULL,
  PRIMARY KEY (subcontractor_id, trade_id),
  FOREIGN KEY (subcontractor_id) REFERENCES subcontractor(subcontractor_id),
  FOREIGN KEY (trade_id) REFERENCES trade(trade_id)
);

CREATE TABLE project (
  project_id int DEFAULT nextval('seq_project_id'::regclass) NOT NULL,
  start_date date NOT NULL,
  estimated_end_date date,
  job_complete boolean NOT NULL, 
  end_date date,
  street varchar(100) NOT NULL,
  city varchar(100) NOT NULL,
  zip varchar(5) NOT NULL,
  PRIMARY KEY (project_id)
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


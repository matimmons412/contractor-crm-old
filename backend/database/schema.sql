BEGIN TRANSACTION;

DROP TABLE IF EXISTS trade;
DROP TABLE IF EXISTS subcontractor;
DROP TABLE IF EXISTS subcontractor_trade;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS info;

DROP SEQUENCE IF EXISTS seq_customer_id;
DROP SEQUENCE IF EXISTS seq_project_id;
DROP SEQUENCE IF EXISTS seq_subcontractor_id;

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

CREATE TABLE customer (
  customer_id serial NOT NULL,
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

CREATE TABLE subcontractor_trade (
  subcontractor_id int NOT NULL,
  trade_id int NOT NULL
);

CREATE TABLE info (
  info_id serial NOT NULL,
  street varchar(100),
  city varchar(100),
  zip varchar(5),
  email_address varchar(100),
  phone_number varchar(10)
);

CREATE TABLE trade (
  trade_id serial NOT NULL,
  trade varchar(100) NOT NULL,
  PRIMARY KEY (trade_id)
);

CREATE TABLE project (
  project_id serial NOT NULL,
  customer_id int  NOT NULL,
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
  project_id int NOT NULL
);

CREATE TABLE project_subcontractor (
  subcontractor_id int NOT NULL,
  project_id int NOT NULL
);

CREATE TABLE subcontractor (
  subcontractor_id serial NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  phone_number varchar(10) NOT NULL,
  email varchar(100),
  company_name varchar(200),
  PRIMARY KEY (subcontractor_id)
);


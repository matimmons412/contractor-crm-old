BEGIN TRANSACTION;

DROP TABLE IF EXISTS Trade;
DROP TABLE IF EXISTS Subcontractor;
DROP TABLE IF EXISTS Subcontractor_Trade;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Project;

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
/*
CREATE TABLE customer (
        
        customer_id int DEFAULT nextval('seq_customer_id'::regclass) NOT NULL,
        first_name varchar(200) NOT NULL,
        last_name varchar(200) NOT NULL,
        street varchar(200) NOT NULL,
        city varchar(200) NOT NULL,
        state_ varchar(200) NOT NULL,
        zip_code int NOT NULL,
        phone_number int NOT NULL,
        email varchar(200) NOT NULL,
        dob DATE,
        gender char(1) NOT NULL,
        active BOOLEAN DEFAULT FALSE,
        CONSTRAINT PK_customer PRIMARY KEY (customer_id),
        CONSTRAINT gender CHECK (gender in ('M', 'F'))
);

CREATE TABLE project (
        project_id int DEFAULT nextval('seq_project_id'::regclass) NOT NULL,
        customer_id int DEFAULT NULL, 
        project_name varchar(200) NOT NULL,
        start_date DATE NOT NULL,
        end_date DATE NULL,
        CONSTRAINT PK_project PRIMARY KEY (project_id),
        CONSTRAINT FK_project FOREIGN KEY (customer_id)
);

CREATE TABLE subcontractor (
        subcontractor_id int DEFAULT nextval('seq_subcontractor_id'::regclass) NOT NULL,
        trade varchar(200) NOT NULL,
        first_name varchar(200) NOT NULL,
        last_name varchar(200) NOT NULL
);    
*/


CREATE TABLE Customer (
  Customer_ID int DEFAULT nextval('seq_customer_id'::regclass) NOT NULL,
  First_Name varchar(100),
  Last_Name varchar(100),
  Street varchar(100),
  City varchar(100),
  Zip int,
  Email varchar(100),
  Phone int,
  Gender varchar(1),
  PRIMARY KEY (Customer_ID)
);

CREATE TABLE Subcontractor (
  Subcontractor_ID int DEFAULT nextval('seq_subcontractor_id'::regclass) NOT NULL,
  First_Name varchar(100),
  Last_Name varchar(100),
  Phone_Number int,
  Email varchar(100),
  Project_ID int,
  Trade_ID int,
  CONSTRAINT Subcontractor PRIMARY KEY (Subcontractor_ID)
);

CREATE TABLE Subcontractor_Trade (
  Subcontractor_ID int,
  Trade_ID int
);

/*
CREATE INDEX PK, FK1 ON  Subcontractor_Trade (Subcontractor_ID);

CREATE INDEX PK, FK2 ON  Subcontractor_Trade (Trade_ID);
*/

CREATE TABLE Trade (
  Trade_ID int,
  Trade varchar(100),
  PRIMARY KEY (Trade_ID)
);

CREATE TABLE Project (
  Project_ID int DEFAULT nextval('seq_project_id'::regclass) NOT NULL,
  Customer_ID int,
  Start_Date date,
  End_Date date,
  Street varchar(100),
  City varchar(100),
  Zip int,
  PRIMARY KEY (Project_ID)
);
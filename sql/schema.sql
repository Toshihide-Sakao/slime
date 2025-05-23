-- DROP SCHEMA IF EXISTS slime_db CASCADE;
CREATE SCHEMA slime_db;

CREATE TABLE slime_db.users (
	id  BIGSERIAL PRIMARY KEY,
	email       VARCHAR(200) NOT NULL,
	first_name  VARCHAR(200) NOT NULL,
	last_name   VARCHAR(200) NOT NULL,
	username    VARCHAR(50) UNIQUE NOT NULL,
	password    VARCHAR(200) NOT NULL,
	UNIQUE (username)
);

CREATE TABLE slime_db.companies (
	id  		BIGSERIAL PRIMARY KEY,
	org_id	  	BIGINT NOT NULL,
	name        VARCHAR(200) NOT NULL,
	website     VARCHAR(200) NOT NULL,
	phone       VARCHAR(50) NOT NULL,
	email       VARCHAR(200) NOT NULL,
	address     VARCHAR(200) NOT NULL,
	city        VARCHAR(200) NOT NULL,
	state       VARCHAR(50) NOT NULL,
	zip         VARCHAR(20) NOT NULL,
	country     VARCHAR(50) NOT NULL
)

CREATE TABLE slime_db.opportunities (
	id  		BIGSERIAL PRIMARY KEY,
	name        VARCHAR(200) NOT NULL,
	commitee_id   BIGINT NOT NULL,
	company_id  BIGINT NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE slime_db.commitee (
	id  		BIGSERIAL PRIMARY KEY,
	name        VARCHAR(200) NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE slime_db.people (
	id  		BIGSERIAL PRIMARY KEY,
	org_id	  	BIGINT NOT NULL,
	first_name  VARCHAR(200) NOT NULL,
	last_name   VARCHAR(200) NOT NULL,
	email       VARCHAR(200) NOT NULL,
	phone       VARCHAR(50) NOT NULL,
	address     VARCHAR(200) NOT NULL,
	city        VARCHAR(200) NOT NULL,
	state       VARCHAR(50) NOT NULL,
	zip         VARCHAR(20) NOT NULL,
	country     VARCHAR(50) NOT NULL
)

CREATE TABLE slime_db.invoices (
	id  		BIGSERIAL PRIMARY KEY,
	company_id  BIGINT NOT NULL,
	amount      DECIMAL(10, 2) NOT NULL,
	due_date    DATE NOT NULL,
	paid        BOOLEAN DEFAULT FALSE,
	attachment  VARCHAR(200) NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE slime_db.products (
	id  		BIGSERIAL PRIMARY KEY,
	name        VARCHAR(200) NOT NULL,
	description VARCHAR(200) NOT NULL,
	price       DECIMAL(10, 2) NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE slime_db.notes (
	id  		BIGSERIAL PRIMARY KEY,
	opportunity_id BIGINT NOT
)


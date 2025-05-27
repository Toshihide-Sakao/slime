-- DROP SCHEMA IF EXISTS slime_db CASCADE;

CREATE TABLE users (
	id  		BIGSERIAL PRIMARY KEY,
	kth_id      VARCHAR(50) UNIQUE NOT NULL,
	email       VARCHAR(200) NOT NULL,
	first_name  VARCHAR(200) NOT NULL,
	last_name   VARCHAR(200) NOT NULL,
	psw    		VARCHAR(200) NOT NULL,
	-- UNIQUE (kth_id)
);

CREATE TABLE companies (
	org_id	  	BIGINT PRIMARY KEY,
	name        VARCHAR(200) NOT NULL,
	address     VARCHAR(200),
	invoice_adress VARCHAR(200)
);

CREATE TABLE people (
	id  		BIGSERIAL PRIMARY KEY,
	org_id	  	BIGINT NOT NULL,
	first_name  VARCHAR(200) NOT NULL,
	last_name   VARCHAR(200) NOT NULL,
	email       VARCHAR(200),
	phone       VARCHAR(50),
	linkedin    VARCHAR(200),
	notes	    TEXT,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE company_people (
	org_id  	BIGINT NOT NULL REFERENCES companies(org_id) ON DELETE CASCADE,
	person_id   BIGINT NOT NULL REFERENCES people(id) ON DELETE CASCADE,
	
	PRIMARY KEY (org_id, person_id)
);

CREATE TABLE opportunities (
	id  		BIGSERIAL PRIMARY KEY,
	name        VARCHAR(200) NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE opportunity_people (
	opportunity_id BIGINT NOT NULL REFERENCES opportunities(id) ON DELETE CASCADE,
	person_id      BIGINT NOT NULL REFERENCES people(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, person_id)
);

CREATE TABLE opportunity_products (
	opportunity_id BIGINT NOT NULL REFERENCES opportunities(id) ON DELETE CASCADE,
	product_id     BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, product_id)
);

CREATE TABLE opportunity_invoices (
	opportunity_id BIGINT NOT NULL REFERENCES opportunities(id) ON DELETE CASCADE,
	invoice_id     BIGINT NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, invoice_id)
);

CREATE TABLE opportunity_committees (
	opportunity_id BIGINT NOT NULL REFERENCES opportunities(id) ON DELETE CASCADE,
	committee_id   BIGINT NOT NULL REFERENCES commitee(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, committee_id)
);

CREATE TABLE opportunity_user (
	opportunity_id 	BIGINT NOT NULL REFERENCES opportunities(id) ON DELETE CASCADE,
	u_id		    BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, u_id)
);

CREATE TABLE commitee (
	id  		BIGSERIAL PRIMARY KEY,
	name        VARCHAR(200) NOT NULL,
);

CREATE TABLE invoices (
	id  		BIGSERIAL PRIMARY KEY,
	org_id		BIGINT NOT NULL REFERENCES companies(org_id) ON DELETE CASCADE,
	amount      DECIMAL(10, 2) NOT NULL,
	due_date    DATE NOT NULL,
	paid        BOOLEAN DEFAULT FALSE,
	attachment  VARCHAR(200) NOT NULL,
	notes       TEXT,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
	id  		BIGSERIAL PRIMARY KEY,
	commitee_id   BIGINT NOT NULL REFERENCES commitee(id) ON DELETE CASCADE,
	name        VARCHAR(200) NOT NULL,
	description VARCHAR(200) NOT NULL,
	price       DECIMAL(10, 2) NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notes (
	id  			BIGSERIAL PRIMARY KEY,
	opportunity_id  BIGINT NOT NULL REFERENCES opportunities(id) ON DELETE CASCADE,
	content         TEXT NOT NULL,
	created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


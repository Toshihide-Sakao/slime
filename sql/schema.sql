DROP SCHEMA IF EXISTS slime CASCADE;
CREATE SCHEMA IF NOT EXISTS slime;

CREATE TABLE slime.users (
	id  		BIGSERIAL PRIMARY KEY,
	kth_id      VARCHAR(50) UNIQUE NOT NULL,
	email       VARCHAR(200) NOT NULL,
	first_name  VARCHAR(200) NOT NULL,
	last_name   VARCHAR(200) NOT NULL,
	psw    		VARCHAR(200) NOT NULL
	-- UNIQUE (kth_id)
);

CREATE TABLE slime.companies (
	org_id	  		BIGINT PRIMARY KEY,
	name        	VARCHAR(200) NOT NULL,
	country	 		VARCHAR(200) NOT NULL
);

CREATE TABLE slime.people (
	id  		BIGSERIAL PRIMARY KEY,
	org_id	  	BIGINT NOT NULL REFERENCES slime.companies(org_id) ON DELETE CASCADE,
	first_name  VARCHAR(200) NOT NULL,
	last_name   VARCHAR(200) NOT NULL,
	email       VARCHAR(200),
	phone       VARCHAR(50),
	linkedin    VARCHAR(200),
	notes		TEXT,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE slime.company_people (
	org_id  	BIGINT NOT NULL REFERENCES slime.companies(org_id) ON DELETE CASCADE,
	person_id   BIGINT NOT NULL REFERENCES slime.people(id) ON DELETE CASCADE,
	
	PRIMARY KEY (org_id, person_id)
);

CREATE TABLE slime.commitee (
	id  		BIGSERIAL PRIMARY KEY,
	name        VARCHAR(200) NOT NULL
);

CREATE TABLE slime.opportunities (
	id  		BIGSERIAL PRIMARY KEY,
	name        VARCHAR(200) NOT NULL,
	status	  	VARCHAR(50) NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE slime.invoices (
	id  		BIGSERIAL PRIMARY KEY,
	org_id		BIGINT NOT NULL REFERENCES slime.companies(org_id) ON DELETE CASCADE,
	amount      DECIMAL(10, 2) NOT NULL,
	due_date    DATE NOT NULL,
	paid        BOOLEAN DEFAULT FALSE,
	attachment  VARCHAR(200) NOT NULL,
	notes       TEXT,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE slime.products (
	id  		BIGSERIAL PRIMARY KEY,
	commitee_id BIGINT NOT NULL REFERENCES slime.commitee(id) ON DELETE CASCADE,
	name        VARCHAR(200) NOT NULL,
	description VARCHAR(200) NOT NULL,
	price       DECIMAL(10, 2) NOT NULL,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE slime.notes (
	id  			BIGSERIAL PRIMARY KEY,
	opportunity_id  BIGINT NOT NULL REFERENCES slime.opportunities(id) ON DELETE CASCADE,
	content         TEXT NOT NULL,
	created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE slime.opportunities_people (
	opportunity_id BIGINT NOT NULL REFERENCES slime.opportunities(id) ON DELETE CASCADE,
	person_id      BIGINT NOT NULL REFERENCES slime.people(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, person_id)
);

CREATE TABLE slime.opportunities_products (
	opportunity_id BIGINT NOT NULL REFERENCES slime.opportunities(id) ON DELETE CASCADE,
	product_id     BIGINT NOT NULL REFERENCES slime.products(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, product_id)
);

CREATE TABLE slime.opportunities_invoices (
	opportunity_id BIGINT NOT NULL REFERENCES slime.opportunities(id) ON DELETE CASCADE,
	invoice_id     BIGINT NOT NULL REFERENCES slime.invoices(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, invoice_id)
);

CREATE TABLE slime.opportunities_committees (
	opportunity_id BIGINT NOT NULL REFERENCES slime.opportunities(id) ON DELETE CASCADE,
	committee_id   BIGINT NOT NULL REFERENCES slime.commitee(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, committee_id)
);

CREATE TABLE slime.opportunities_user (
	opportunity_id 	BIGINT NOT NULL REFERENCES slime.opportunities(id) ON DELETE CASCADE,
	u_id		    BIGINT NOT NULL REFERENCES slime.users(id) ON DELETE CASCADE,

	PRIMARY KEY (opportunity_id, u_id)
);



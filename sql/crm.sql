CREATE TABLE IF NOT EXISTS "client" (
    "client_id" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "fulldate" date   NOT NULL,
    "day" smallint   NOT NULL,
    "month" smallint   NOT NULL,
    "year" smallint   NOT NULL,
    "age" smallint   NOT NULL,
    "social" varchar   NOT NULL,
    "first" varchar   NOT NULL,
    "middle" varchar   NOT NULL,
    "last" varchar   NOT NULL,
    "phone" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    "address_1" varchar   NOT NULL,
    "address_2" varchar   NULL,
    "city" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "zipcode" varchar   NOT NULL,
    "district_id" integer   NOT NULL,
    CONSTRAINT "pk_client" PRIMARY KEY (
        "client_id"
     )
);

\COPY client(client_id, sex, fulldate, day, month, year, age, social, first, middle, last, phone, email, address_1, address_2, city, state, zipcode, district_id) FROM '/var/lib/postgresql/csvs/completedclient.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE IF NOT EXISTS "disposition" (
    "disp_id" varchar   NOT NULL,
    "client_id" varchar   NOT NULL,
    "account_id" varchar   NOT NULL,
    "type" varchar   NOT NULL,
    CONSTRAINT "pk_disposition" PRIMARY KEY (
        "disp_id"
     )
);

\COPY disposition(disp_id, client_id, account_id, type) FROM '/var/lib/postgresql/csvs/completeddisposition.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "order" (
    "order_id" varchar   NOT NULL,
    "account_id" varchar   NOT NULL,
    "bank_to" varchar   NOT NULL,
    "account_to" varchar   NOT NULL,
    "amount" numeric   NOT NULL,
    "k_symbol" varchar   NOT NULL,
    CONSTRAINT "pk_order" PRIMARY KEY (
        "order_id"
     )
);

\COPY public.order(order_id, account_id, bank_to, account_to, amount, k_symbol) FROM '/var/lib/postgresql/csvs/completedorder.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "account" (
    "account_id" varchar   NOT NULL,
    "district_id" integer   NOT NULL,
    "frequency" varchar   NOT NULL,
    "parseddate" date   NOT NULL,
    "year" smallint   NOT NULL,
    "month" smallint   NOT NULL,
    "day" smallint   NOT NULL,
    CONSTRAINT "pk_account" PRIMARY KEY (
        "account_id"
     )
);

\COPY public.account(account_id, district_id, frequency, parseddate, year, month, day) FROM '/var/lib/postgresql/csvs/completedacct.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "card" (
    "card_id" varchar   NOT NULL,
    "disp_id" varchar   NOT NULL,
    "type" varchar   NOT NULL,
    "year" smallint   NOT NULL,
    "month" smallint   NOT NULL,
    "day" smallint   NOT NULL,
    "fulldate" date   NOT NULL,
    CONSTRAINT "pk_card" PRIMARY KEY (
        "card_id"
     )
);

\COPY public.card(card_id, disp_id, type, year, month, day, fulldate) FROM '/var/lib/postgresql/csvs/completedcard.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE IF NOT EXISTS "district" (
    "district_id" integer   NOT NULL,
    "city" varchar   NOT NULL,
    "state_name" varchar   NOT NULL,
    "state_abbrev" varchar   NOT NULL,
    "region" varchar   NOT NULL,
    "division" varchar   NOT NULL,
    CONSTRAINT "pk_district" PRIMARY KEY (
        "district_id"
     )
);

\COPY public.district(district_id, city, state_name, state_abbrev, region, division) FROM '/var/lib/postgresql/csvs/completeddistrict.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "loan" (
    "loan_id" varchar   NOT NULL,
    "account_id" varchar   NOT NULL,
    "amount" numeric   NOT NULL,
    "duration" smallint   NOT NULL,
    "payments" numeric   NOT NULL,
    "status" varchar   NOT NULL,
    "year" smallint   NOT NULL,
    "month" smallint   NOT NULL,
    "day" smallint   NOT NULL,
    "fulldate" date   NOT NULL,
    "location" integer   NOT NULL,
    "purpose" varchar   NOT NULL,
    CONSTRAINT "pk_loan" PRIMARY KEY (
        "loan_id"
     )
);

\COPY public.loan(loan_id, account_id, amount, duration, payments, status, year, month, day, fulldate, location, purpose) FROM '/var/lib/postgresql/csvs/completedloan.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "transaction" (
    "trans_id" varchar   NOT NULL,
    "account_id" varchar   NOT NULL,
    "type" varchar NULL,
    "operation" varchar NULL,
    "amount" numeric NULL,
    "balance" numeric NULL,
    "k_symbol" varchar NULL,
    "bank" varchar NULL,
    "account" varchar NULL,
    "year" smallint NULL,
    "month" smallint NULL,
    "day" smallint NULL,
    "fulldate" date NULL,
    "fulltime" varchar NULL,
    "fulldatewithtime" varchar NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "trans_id"
     )
);

-- \COPY public.transaction(trans_id, account_id, type, operation, amount, balance, k_symbol, bank, account, year, month, day, fulldate, fulltime, fulldatewithtime) FROM 'csvs/completedtrans.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "crm_call_center_logs" (
    "call_id" varchar NULL,
    "complaint_id" varchar   NULL,
    "client_id" varchar   NULL,
    "phonefinal" varchar   NULL,
    "vruline" varchar   NULL,
    "priority" smallint   NULL,
    "type" varchar   NULL,
    "outcome" varchar   NULL,
    "server" varchar   NULL,
    "date_received" date   NULL,
    "ser_start" time   NULL,
    "ser_exit" time   NULL,
    CONSTRAINT "pk_crm_call_center_logs" PRIMARY KEY (
        "phonefinal","ser_start"
     )
);

\COPY public.crm_call_center_logs(call_id, complaint_id, client_id, phonefinal, vruline, priority, type, outcome, server, date_received, ser_start, ser_exit) FROM '/var/lib/postgresql/csvs/crm_call_center_logs.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "crm_events" (
    "complaint_id" varchar   NOT NULL,
    "date_received" date   NULL,
    "product" varchar   NULL,
    "sub_product" varchar   NULL,
    "issue" varchar   NULL,
    "sub_issue" varchar   NULL,
    "consumer_complaint_narrative" varchar   NULL,
    "tags" varchar   NULL,
    "consumer_consent_provided" varchar   NULL,
    "submitted_via" varchar   NULL,
    "date_sent_to_company" date   NULL,
    "company_response_to_consumer" varchar   NULL,
    "timely_response" varchar   NULL,
    "consumer_disputed" varchar   NULL,
    "client_id" varchar   NULL,
    CONSTRAINT "pk_crm_events" PRIMARY KEY (
        "complaint_id"
     )
);

\COPY public.crm_events(complaint_id, date_received, product, sub_product, issue, sub_issue, consumer_complaint_narrative, tags, consumer_consent_provided, submitted_via, date_sent_to_company, company_response_to_consumer, timely_response, consumer_disputed, client_id) FROM '/var/lib/postgresql/csvs/crm_events.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE IF NOT EXISTS "crm_reviews" (
    "date" date   NOT NULL,
    "stars" smallint   NULL,
    "reviews" varchar   NULL,
    "product" varchar   NULL,
    "district_id" integer   NOT NULL
);

\COPY public.crm_reviews(date, stars, reviews, product, district_id) FROM '/var/lib/postgresql/csvs/crm_reviews.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE IF NOT EXISTS "luxury_loan_portfolio" (
    "loan_id" varchar   NOT NULL,
    "funded_amount" numeric   NULL,
    "funded_date" date   NULL,
    "duration_years" smallint   NULL,
    "duration_months" smallint   NULL,
    "ten_yr_treasury_index_date_funded" numeric   NULL,
    "interest_rate_percent" numeric   NULL,
    "interest_rate" numeric   NULL,
    "payments" numeric   NULL,
    "total_past_payments" smallint   NULL,
    "loan_balance" numeric   NULL,
    "property_value" numeric   NULL,
    "purpose" varchar   NULL,
    "firstname" varchar   NULL,
    "middlename" varchar   NULL,
    "lastname" varchar   NULL,
    "social" varchar   NULL,
    "phone" varchar   NULL,
    "title" varchar   NULL,
    "employment_length" smallint   NULL,
    "building_class_category" varchar   NULL,
    "tax_class_at_present" varchar   NULL,
    "building_class_at_present" varchar   NULL,
    "address_1" varchar   NULL,
    "address_2" varchar   NULL,
    "zip_code" varchar   NULL,
    "city" varchar   NULL,
    "state" varchar   NULL,
    "total_units" integer   NULL,
    "land_square_feet" varchar   NULL,
    "gross_square_feet" varchar   NULL,
    "tax_class_at_time_of_sale" smallint   NULL,
    CONSTRAINT "pk_luxury_loan_portfolio" PRIMARY KEY (
        "loan_id"
     )
);

\COPY public.luxury_loan_portfolio(loan_id, funded_amount, funded_date, duration_years, duration_months, ten_yr_treasury_index_date_funded, interest_rate_percent, interest_rate, payments, total_past_payments, loan_balance, property_value, purpose, firstname, middlename, lastname, social, phone, title, employment_length, building_class_category, tax_class_at_present,building_class_at_present, address_1, address_2, zip_code, city, state, total_units, land_square_feet, gross_square_feet, tax_class_at_time_of_sale) FROM '/var/lib/postgresql/csvs/LuxuryLoanPortfolio.csv' DELIMITER ',' CSV HEADER;


ALTER TABLE "client" ADD CONSTRAINT "fk_client_district_id" FOREIGN KEY("district_id")
REFERENCES "district" ("district_id");

ALTER TABLE "disposition" ADD CONSTRAINT "fk_disposition_client_id" FOREIGN KEY("client_id")
REFERENCES "client" ("client_id");

ALTER TABLE "disposition" ADD CONSTRAINT "fk_disposition_account_id" FOREIGN KEY("account_id")
REFERENCES "account" ("account_id");

ALTER TABLE "order" ADD CONSTRAINT "fk_order_account_id" FOREIGN KEY("account_id")
REFERENCES "account" ("account_id");

ALTER TABLE "account" ADD CONSTRAINT "fk_account_district_id" FOREIGN KEY("district_id")
REFERENCES "district" ("district_id");

ALTER TABLE "card" ADD CONSTRAINT "fk_card_disp_id" FOREIGN KEY("disp_id")
REFERENCES "disposition" ("disp_id");

ALTER TABLE "loan" ADD CONSTRAINT "fk_loan_account_id" FOREIGN KEY("account_id")
REFERENCES "account" ("account_id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_account_id" FOREIGN KEY("account_id")
REFERENCES "account" ("account_id");

ALTER TABLE "crm_call_center_logs" ADD CONSTRAINT "fk_crm_call_center_logs_complaint_id" FOREIGN KEY("complaint_id")
REFERENCES "crm_events" ("complaint_id");

ALTER TABLE "crm_call_center_logs" ADD CONSTRAINT "fk_crm_call_center_logs_client_id" FOREIGN KEY("client_id")
REFERENCES "client" ("client_id");

ALTER TABLE "crm_events" ADD CONSTRAINT "fk_crm_events_client_id" FOREIGN KEY("client_id")
REFERENCES "client" ("client_id");

ALTER TABLE "crm_reviews" ADD CONSTRAINT "fk_crm_reviews_district_id" FOREIGN KEY("district_id")
REFERENCES "district" ("district_id");



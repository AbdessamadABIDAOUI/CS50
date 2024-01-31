Drop Table IF EXISTS "users";
DROP TABLE IF EXISTS "schools_universities";
DROP TABLE IF EXISTS "companies";
Drop TABLE IF EXISTS "user_connections";
Drop TABLE IF EXISTS "school_connections";
Drop TABLE IF EXISTS "companies_connections";

CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT UNIQUE NOT NULL,
    "password" VARCHAR(16) NOT NULL CHECK (length("password")>8),
    PRIMARY KEY("id")
);

CREATE TABLE "schools_universities"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" YEAR NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "user_connections"(
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY("user1_id","user2_id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id")
);

CREATE TABLE "school_connections"(
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "degree" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools_universities"("id")
);

CREATE TABLE "companies_connections"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);


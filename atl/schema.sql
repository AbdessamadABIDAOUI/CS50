DROP TABLE IF EXISTS "passengers";
DROP TABLE IF EXISTS "airlines";
DROP TABLE IF EXISTS "operates";
DROP TABLE IF EXISTS "flights";
DROP TABLE IF EXISTS "check_in";

CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK ("age" > 0),
    PRIMARY KEY("id")
);
CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "airport_depart" TEXT NOT NULL,
    "airport_destination" TEXT NOT NULL,
    "expected_departure" DATETIME NOT NULL,
    "expected_arrival" DATETIME NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
CREATE TABLE "check_in" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "operates" (
    "airline_id" INTEGER,
    "concourse" TEXT NOT NULL CHECK("councourse" IN ('A','B','C','D','E','F','T')),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
    PRIMARY KEY ("airline_id","concourse")
);

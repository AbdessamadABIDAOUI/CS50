DROP TABLE IF EXISTS "meteorites";
DROP TABLE IF EXISTS "temp";


CREATE TABLE "meteorites"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL CHECK("discovery" IN ('Fell', 'Found')),
    "year" YEAR,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

.import --csv meteorites.csv "temp"
DELETE FROM "temp" WHERE "nametype" = 'Relict';
UPDATE "temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "temp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "temp" SET "long" = NULL WHERE "long" = '';
UPDATE "temp" SET "year" = NULL WHERE "year" = '';


INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
SELECT "name","class",ROUND("mass",2),"discovery","year",ROUND("lat",2),ROUND("long",2)
FROM "temp" ORDER BY "YEAR", "name";

DROP TABLE "temp";


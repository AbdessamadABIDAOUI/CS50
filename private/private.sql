DROP TABLE IF EXISTS "temp";
DROP VIEW IF EXISTS "pre_final_step";
DROP VIEW IF EXISTS "message";

CREATE TABLE "temp"(
    "sentence_id" INTEGER,
    "character_number" INTEGER,
    "length" INTEGER
);

INSERT INTO "temp"("sentence_id","character_number","length")
VALUES
(14,	98,	4),
(114,	3,	5),
(618,	72,	9),
(630,	7,	3),
(932,	12,	5),
(2230,	50,	7),
(2346,	44,	10),
(3041,	14,	5);

CREATE VIEW "pre_final_step" AS
SELECT "sentence", "character_number", "length" FROM "temp" JOIN "sentences" ON "sentences"."id" = "temp"."sentence_id";

CREATE VIEW "message" AS
SELECT substr("sentence", "character_number", "length") AS "phrase" FROM "pre_final_step";

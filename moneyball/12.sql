/*SELECT "first_name","last_name" FROM "players" WHERE "id" IN(
        (SELECT "players"."id"
        FROM ("players" JOIN "salaries" ON "players"."id" ="salaries"."player_id") JOIN "performances"
        ON ("players"."id" ="performances"."player_id") AND ("salaries"."year" = "performances"."year")
        WHERE "salaries"."year" = 2001 AND "H" > 0
        ORDER BY "salaries"."salary"/"performances"."H","first_name","last_name"
        LIMIT 10)
    INTERSECT
        (SELECT "players"."id"
        FROM ("players" JOIN "salaries" ON "players"."id" ="salaries"."player_id") JOIN "performances"
        ON ("players"."id" ="performances"."player_id") AND ("salaries"."year" = "performances"."year")
        WHERE "salaries"."year" = 2001 AND "RBI" > 0
        ORDER BY "salaries"."salary"/"performances"."RBI","first_name","last_name"
        LIMIT 10)
    )
    ORDER BY "id";*/
WITH hits_ranking AS (
    SELECT "players"."id"
    FROM ("players" JOIN "salaries" ON "players"."id" = "salaries"."player_id") JOIN "performances"
    ON ("players"."id" = "performances"."player_id") AND ("salaries"."year" = "performances"."year")
    WHERE "salaries"."year" = 2001 AND "H" > 0
    ORDER BY "salaries"."salary" / "performances"."H", "first_name", "last_name"
    LIMIT 10
),
rbi_ranking AS (
    SELECT "players"."id"
    FROM ("players" JOIN "salaries" ON "players"."id" = "salaries"."player_id") JOIN "performances"
    ON ("players"."id" = "performances"."player_id") AND ("salaries"."year" = "performances"."year")
    WHERE "salaries"."year" = 2001 AND "RBI" > 0
    ORDER BY "salaries"."salary" / "performances"."RBI", "first_name", "last_name"
    LIMIT 10
)
SELECT "first_name", "last_name"
FROM "players"
WHERE "id" IN (
    SELECT "id" FROM hits_ranking
    INTERSECT
    SELECT "id" FROM rbi_ranking
)
ORDER BY "id";


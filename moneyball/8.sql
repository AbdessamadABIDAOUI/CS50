SELECT "salary" FROM "salaries" JOIN "performances" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
WHERE "performances"."year" = 2001 AND "HR" = (
    SELECT MAX("HR") FROM "performances" WHERE "performances"."year" = 2001
);

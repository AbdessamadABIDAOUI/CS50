SELECT "first_name","last_name","salary","HR","performances"."year"
FROM ("salaries" JOIN "players" ON "players"."id" ="salaries"."player_id") JOIN "performances" ON ("players"."id" ="performances"."player_id")
AND ("salaries"."year" = "performances"."year")
ORDER BY "players"."id","performances"."year" DESC, "salary" DESC,"HR" DESC;

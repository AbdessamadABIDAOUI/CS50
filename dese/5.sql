SELECT "city","number_of_schools" FROM (SELECT "city",Count("id") AS 'number_of_schools' FROM "schools" WHERE "type" = 'Public School' GROUP BY "city")
WHERE "number_of_schools" < 4 ORDER BY "number_of_schools" DESC, "city";

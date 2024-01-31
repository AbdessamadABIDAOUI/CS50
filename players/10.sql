SELECT "first_name" AS "10 First Canadian players", "birth_country" AS "country" FROM players
WHERE "birth_country"  = 'CAN'
ORDER BY "debut" LIMIT 10;

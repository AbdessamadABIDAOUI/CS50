CREATE VIEW "june_vacancies" AS
WITH "temp" AS (
    SELECT "listing_id" AS "id", "property_type", "host_name", "date" FROM "listings" JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
    WHERE "availabilities"."available" = "TRUE" AND ("date" >= "2023-06-01" AND "date" <="2023-06-31")
)
SELECT "id", "property_type", "host_name", COUNT('date') AS "days_vacant" FROM "temp"
GROUP BY("id");

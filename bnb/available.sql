CREATE VIEW "available" AS
SELECT "listing_id" AS "id", "property_type", "host_name", "date" FROM "listings" JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "availabilities"."available" = "TRUE";

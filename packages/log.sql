
-- *** The Lost Letter ***
SELECT * FROM "scans" JOIN "addresses" ON "scans"."address_id" = "addresses"."id"
WHERE package_id = (
    SELECT id FROM "packages"
    WHERE "id" IN (
        SELECT "package_id" FROM "scans" WHERE "address_id"=(
            SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
        )
    )
AND "contents" LIKE 'congratula%'
);


-- *** The Devious Delivery ***

SELECT "contents","TYPE" FROM ("scans" JOIN "addresses" ON "scans"."address_id"="addresses"."id") JOIN "packages" ON "scans"."package_id" = "packages"."id"
WHERE package_id = (
    SELECT "packages"."id" FROM "packages" JOIN "addresses" ON "packages"."to_address_id" = "addresses"."id" WHERE "contents" LIKE '%duck%' AND "from_address_id" IS NULL
)
AND "action" = 'Drop';


-- *** The Forgotten Gift ***
SELECT "drivers"."name","packages"."contents","action","timestamp" FROM ("scans" JOIN "drivers" ON "scans"."driver_id"="drivers"."id") JOIN "packages" ON "scans"."package_id" = "packages"."id"
WHERE "package_id" =(SELECT "id" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
));

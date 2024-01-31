DROP TABLE IF EXISTS "ingredients";
DROP TABLE IF EXISTS "donuts";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "customers";
DROP TABLE IF EXISTS "donuts_ingredients";
DROP TABLE IF EXISTS "donuts_per_order";


CREATE TABLE "ingredients"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price_per_unit" NUMERIC NOT NULL,
    "unit" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL CHECK("gluten_free" IN ('yes','no')),
    PRIMARY KEY("id")
);

CREATE TABLE "customers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "orders"(
    "order_number" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("order_number"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "donuts_ingredients"(
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    "quantity_per_ingredient" INTEGER NOT NULL,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    PRIMARY KEY("donut_id","ingredient_id")
);

CREATE TABLE "donuts_per_order"(
    "order_number" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER NOT NULL,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("order_number") REFERENCES "orders"("order_number"),
    PRIMARY KEY("order_number","donut_id")
);

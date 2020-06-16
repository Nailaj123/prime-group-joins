--1. Get all customers and their addresses.
SELECT * FROM "customers" 
JOIN "addresses" 
ON "customers"."id" = "addresses"."customer_id";

--2. Get all orders and their line items (orders, quantity and product).
SELECT "quantity", "description", "order_date" FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "products"."id" = "line_items"."order_id";

--3. Which warehouses have cheetos?
SELECT "warehouse", "description" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "description" = 'cheetos';

--4. Which warehouses have diet pepsi?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."id"=6;

--5.  Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", "last_name", count("order_date") as "Orders Placed"  FROM "orders"
JOIN "addresses" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "first_name", "last_name";

--6. How many customers do we have?
SELECT count(*) AS "Customer Count" FROM "customers";

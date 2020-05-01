-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

    SELECT p.ProductName, c.CategoryName
    FROM Product AS p
    JOIN Category AS c ON p.CategoryId = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

    SELECT o."Id", s."CompanyName"
    FROM "Order" AS o
    JOIN Shipper AS s ON s."id" = o."ShipVia"
    WHERE o."OrderDate" < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

    SELECT o."Quantity", p."ProductName"
    FROM "OrderDetail" AS o
    JOIN "Product" AS p
    ON p."id" = o."ProductId"
    WHERE o."OrderId" = "10251";

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    
    SELECT o."id", o."CustomerId", c."CompanyName", e."LastName"
    FROM "Order" as o
    JOIN "Customer" as c ON c."id" = o."CustomerId"
    JOIN "Employee" as e ON e."id" = o."EmployeeId";

-- Display Scheme Name & Instructions 

    SELECT s."scheme_name", st."instructions"
    FROM "schemes" AS s
    JOIN steps AS st ON s."id" = st."scheme_id"
    WHERE s."id" = 3;
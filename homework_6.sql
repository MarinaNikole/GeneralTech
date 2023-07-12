 --1. Вывести ко-во поставщиков не из UK и не из China
SELECT 
COUNT(*)
FROM Suppliers
WHERE NOT Country IN ("China", "UK")


--2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
ROUND(AVG (Price), 2)  AS Average_price,
MAX(Price) AS Maximum_price,
MIN(Price) AS Minimum_price,
COUNT(*) AS Goods_quantity_from_3_and_5_category
FROM Products
WHERE CategoryID IN (3, 5)


--3. Вывести общую сумму проданных товаров
SELECT 
SUM(Products.Price * OrderDetails.Quantity) AS Total_amount_of_goods_sold
FROM Products
JOIN OrderDetails USING (ProductID)


--4. Вывести ко-во стран, которые поставляют напитки
SELECT 
COUNT(distict Suppliers.Country) AS amount_of_countries_that_deliver_beverages 
FROM Suppliers
JOIN Products ON Suppliers.SupplierID=Products.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE Categories.CategoryName="Beverages"


--5. Вывести сумму, на которую было отправлено товаров клиентам в USA
SELECT 
SUM(Products.Price) 
FROM Customers
JOIN Orders ON Customers.CustomerID=Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID=OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductId=Products.ProductID
WHERE Customers.Country="USA"
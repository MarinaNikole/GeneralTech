1. -- Вывести информацию о трех самых дорогих товарах не из China (проекция: названиетовара, ценатоваравusd, названиепоставщика, странапоставщика)
SELECT Products.ProductName, ROUND(Price * 1.06, 2) AS Price_usd, Suppliers.SupplierName, Suppliers.Country
FROM Products
LEFT JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Suppliers.Country!="China"
ORDER BY Products.Price DESC
LIMIT 3



2. --Вывести страны клиентов и поставщиков (за исключением USA)
SELECT Country FROM Customers
WHERE Country!="USA"
UNION 
SELECT Country FROM Suppliers
WHERE Country!="USA"



3. --Вывести названия проданных товаров
SELECT DISTINCT ProductName 
FROM OrderDetails
JOIN Products USING(ProductID)



4. --С помощью DDL создайте таблицу "комментарии юзеров к видео"
CREATE TABLE comments (
	comment_id int,
    created_at timestamp,
    stream_id int,
    user_id int,
    content varchar(256)
);

-- добавляю содержание для таблицы
INSERT INTO comments (comment_id, created_at, stream_id, user_id, content)
VALUES
	 (1, CURRENT_TIMESTAMP, 1, 1, "good"),
	 (2, CURRENT_TIMESTAMP, 2, 2, "interesting"),
	 (3, CURRENT_TIMESTAMP, 3, 3, "funny"),
     (4, CURRENT_TIMESTAMP, 4, 4, "boring"),
     (5, CURRENT_TIMESTAMP, 5, 5, "cool");



5. --Вывести три последних комментария, включая имена авторов и названия видео
SELECT comments.content, users.username, streams.title as stream_title
FROM comments 
JOIN users USING (user_id)
join streams USING (stream_id)
ORDER BY comments.created_at DESC
LIMIT 3




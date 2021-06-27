1. WITH shop_item AS(
                       SELECT Номермагазина AS Номер, Кодтовара AS Код, Товарноенаправление FROM      Магазины
                       CROSS JOIN Товары)
                       SELECT Номер AS Магазин,  Городмагазина AS Город, Код, Товарноенаправление
                       FROM shop_item
                       LEFT JOIN Магазины
                       ON Номер = Номермагазина
					   
2. 	WITH items AS(
                       SELECT  Продажи.Проданошт * Цена AS  Суммаруб, Проданошт, Продажи.Магазин, Дата
                       FROM  Продажи
                       LEFT JOIN Товары
                       ON Товар = Кодтовара
                       WHERE Дата = '02.01.2016')
                       SELECT items.Магазин, Городмагазина AS Город,  Адрес, items.Суммаруб, items.Проданошт
                       FROM items
                       LEFT JOIN Магазины
                       ON Магазин = Номермагазина
					   
3.WITH a AS(
                       SELECT SUM (Проданошт * Цена) AS total, Дата, Городмагазина FROM Продажи, Магазины 
                       LEFT JOIN Товары 
                       ON Кодтовара = Товар
                       WHERE Товарноенаправление = 'Чистота'
                       GROUP BY Дата, Городмагазина, Магазин)
                       
                       SELECT Дата, Городмагазина, CAST(total as REAL)/SUM(total)  AS Доля
                       FROM a
                       GROUP BY Дата, Городмагазина

4.	SELECT Дата, Магазин, Товар FROM Продажи 
                       
                       GROUP BY Магазин, Дата
                       
                       ORDER BY Проданошт DESC
                       LIMIT 3

5.	SELECT DATE(Дата, '+1 day') AS Дата, Магазин, Товарноенаправление, Проданошт * Цена  AS Сумма_пред 
                       FROM  Товары
                       CROSS JOIN Продажи

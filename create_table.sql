-- Создание таблицы "sales" с полями "category", "order_date" и "revenue"
CREATE TABLE IF NOT EXISTS sales
(
    category String,
    order_date Date,
    revenue Float32
) ENGINE = MergeTree()
ORDER BY (order_date, category);

-- Вставка данных в таблицу
INSERT INTO sales (category, order_date, revenue)
VALUES
    ('Category1', '2023-10-01', 100.5),
    ('Category2', '2023-10-01', 125.3),
    ('Category1', '2023-10-02', 150.2),
    ('Category2', '2023-10-02', 210.3),
    ('Category1', '2023-10-03', 60.2),
    ('Category2', '2023-10-03', 200.3),
    ('Category3', '2023-10-02', 180.2),
    ('Category2', '2023-10-04', 220.7),
    ('Category3', '2023-10-03', 75.9);

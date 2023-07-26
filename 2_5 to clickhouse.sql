-- Создаем таблицы в базе данных
CREATE TABLE products (
  product_id Int32,
  product_name String,
  price Decimal(10, 2)
) ENGINE = MergeTree()
ORDER BY product_id;

CREATE TABLE shops (
  shop_id Int32,
  shop_name String
) ENGINE = MergeTree()
ORDER BY shop_id;

CREATE TABLE plan (
  product_id Int32,
  shop_id Int32,
  plan_cnt Int32,
  plan_date Date
) ENGINE = MergeTree()
ORDER BY (product_id, shop_id);

CREATE TABLE shop_dns (
  shop_id Int32,
  date Date,
  product_id Int32,
  sales_cnt Decimal(10, 2)
) ENGINE = MergeTree()
ORDER BY (shop_id, date, product_id);

CREATE TABLE shop_mvideo (
  shop_id Int32,
  date Date,
  product_id Int32,
  sales_cnt Decimal(10, 2)
) ENGINE = MergeTree()
ORDER BY (shop_id, date, product_id);

CREATE TABLE shop_sitilink (
  shop_id Int32,
  date Date,
  product_id Int32,
  sales_cnt Decimal(10, 2)
) ENGINE = MergeTree()
ORDER BY (shop_id, date, product_id);

-- Добавление записей в таблицу shops
INSERT INTO shops (shop_id, shop_name) VALUES (1, 'shop_dns');
INSERT INTO shops (shop_id, shop_name) VALUES (2, 'shop_mvideo');
INSERT INTO shops (shop_id, shop_name) VALUES (3, 'shop_sitilink');

-- Добавление записей в таблицу products
INSERT INTO products (product_id, product_name, price)
VALUES 
  (1, 'Испорченный телефон', 100.00),
  (2, 'Сарафанное радио', 500.00),
  (3, 'Патефон', 1000.00);

-- Добавление записей в таблицу plan
INSERT INTO plan (product_id, shop_id, plan_cnt, plan_date)
VALUES
  (1, 1, 10, '2023-06-30'),
  (2, 1, 20, '2023-06-30'),
  (3, 1, 30, '2023-06-30'),
  (1, 2, 15, '2023-06-30'),
  (2, 2, 25, '2023-06-30'),
  (3, 2, 35, '2023-06-30'),
  (1, 3, 5, '2023-06-30'),
  (2, 3, 10, '2023-06-30'),
  (3, 3, 15, '2023-06-30');

-- Добавление записей в таблицу shop_sitilink
INSERT INTO shop_sitilink (shop_id, date, product_id, sales_cnt)
VALUES
  (3, '2023-01-10', 1, 8),
  (3, '2023-02-20', 2, 12),
  (3, '2023-03-25', 3, 18),
  (3, '2023-04-14', 1, 8),
  (3, '2023-05-12', 2, 12),
  (3, '2023-06-17', 3, 18),
  (3, '2023-01-26', 1, 8),
  (3, '2023-02-21', 2, 12),
  (3, '2023-03-28', 3, 18),
  (3, '2023-04-11', 1, 8),
  (3, '2023-05-04', 2, 12),
  (3, '2023-06-02', 3, 18),
  (3, '2023-04-08', 1, 8),
  (3, '2023-05-09', 2, 12),
  (3, '2023-06-30', 3, 18),
  (3, '2023-01-01', 1, 8),
  (3, '2023-02-11', 2, 12),
  (3, '2023-03-22', 3, 18);

-- Добавление записей в таблицу shop_mvideo
INSERT INTO shop_mvideo (shop_id, date, product_id, sales_cnt)
VALUES
  (2, '2023-01-01', 1, 8),
  (2, '2023-02-12', 2, 12),
  (2, '2023-03-17', 3, 18),
  (2, '2023-04-23', 1, 8),
  (2, '2023-05-20', 2, 12),
  (2, '2023-06-12', 3, 18),
  (2, '2023-05-05', 2, 12),
  (2, '2023-06-13', 3, 18),
  (2, '2023-01-17', 1, 8),
  (2, '2023-02-02', 2, 12),
  (2, '2023-03-03', 3, 18);

-- Добавление записей в таблицу shop_dns
INSERT INTO shop_dns (shop_id, date, product_id, sales_cnt)
VALUES
  (1, '2023-01-24', 1, 8),
  (1, '2023-02-18', 2, 12),
  (1, '2023-03-16', 3, 18),
  (1, '2023-04-03', 1, 8),
  (1, '2023-05-08', 2, 12),
  (1, '2023-06-15', 3, 18),
  (1, '2023-04-10', 1, 8);

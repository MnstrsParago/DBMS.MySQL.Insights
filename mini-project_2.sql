# BASE

CREATE DATABASE users_adverts;
USE users_adverts;
CREATE TABLE users (
    date DATE,
    user_id CHAR(50),
    view_adverts INT
);


# Задание №1
# 1.1
SELECT COUNT(DISTINCT user_id) FROM users
WHERE date BETWEEN '2023-11-07' AND '2023-11-15';

# 1.2
SELECT user_id, MAX(view_adverts) AS mx FROM users
GROUP BY user_id
ORDER BY mx DESC
LIMIT 1;

# 1.3
SELECT date, SUM(view_adverts) / COUNT(DISTINCT user_id) as vaui FROM users
GROUP BY date
HAVING COUNT(DISTINCT user_id) >= 500
ORDER BY vaui DESC;

# 1.4
SELECT user_id, COUNT( DISTINCT date) as lt FROM users
GROUP BY user_id
ORDER BY lt DESC;

# 1.5
SELECT user_id, SUM(view_adverts) / COUNT(distinct date) as rslt FROM users
GROUP BY user_id
HAVING COUNT(distinct date) >= 5
ORDER BY rslt DESC;


# Задание №2
# BASE
CREATE DATABASE mini_project;
USE mini_project;

CREATE TABLE T_TAB1 (
  ID          INT        NOT NULL,
  GOODS_TYPE  VARCHAR(50),
  QUANTITY    INT,
  AMOUNT      INT,
  SELLER_NAME VARCHAR(50),
  CONSTRAINT uq_t_tab1_id UNIQUE (ID)
);

CREATE TABLE T_TAB2 (
  ID     INT         NOT NULL,
  NAME   VARCHAR(50),
  SALARY INT,
  AGE    INT,
  CONSTRAINT uq_t_tab2_id UNIQUE (ID)
);

INSERT INTO T_TAB1 (ID, GOODS_TYPE, QUANTITY, AMOUNT, SELLER_NAME) VALUES
(1, 'MOBILE PHONE', 2, 400000, 'MIKE'),
(2, 'KEYBOARD', 1, 10000, 'MIKE'),
(3, 'MOBILE PHONE', 1, 50000, 'JANE'),
(4, 'MONITOR', 1, 110000, 'JOE'),
(5, 'MONITOR', 2, 80000, 'JANE'),
(6, 'MOBILE PHONE', 1, 130000, 'JOE'),
(7, 'MOBILE PHONE', 1, 60000, 'ANNA'),
(8, 'PRINTER', 1, 90000, 'ANNA'),
(9, 'KEYBOARD', 2, 10000, 'ANNA'),
(10, 'PRINTER', 1, 80000, 'MIKE');

INSERT INTO T_TAB2 (ID, NAME, SALARY, AGE) VALUES
(1, 'ANNA', 110000, 27),
(2, 'JANE', 80000, 25),
(3, 'MIKE', 120000, 25),
(4, 'JOE', 70000, 24),
(5, 'RITA', 120000, 29);

# 2.1
SELECT DISTINCT GOODS_TYPE FROM t_tab1;
-- Ответ: 4

# 2.2
SELECT SUM(QUANTITY), SUM(AMOUNT) FROM t_tab1 WHERE GOODS_TYPE = 'MOBILE PHONE';
-- Ответ: 5, 640000

# 2.3
SELECT NAME FROM t_tab2 WHERE SALARY > 100000;
-- Ответ: 3

# 2.4
SELECT MIN(AGE), MAX(AGE), MIN(SALARY), MAX(SALARY) FROM t_tab2;

# 2.5
SELECT GOODS_TYPE, AVG(QUANTITY) FROM t_tab1 WHERE GOODS_TYPE IN ('PRINTER', 'KEYBOARD') GROUP BY GOODS_TYPE;

# 2.6
SELECT T2.NAME, SUM(T1.AMOUNT) FROM t_tab1 AS T1
LEFT JOIN t_tab2 as T2 ON T2.NAME = T1.SELLER_NAME GROUP BY SELLER_NAME;

# 2.7
SELECT T1.SELLER_NAME, T1.GOODS_TYPE, T1.QUANTITY, T1.AMOUNT, T2.SALARY, T2.AGE FROM t_tab1 T1
JOIN t_tab2 T2 ON T1.SELLER_NAME = T2.NAME WHERE T1.SELLER_NAME ='MIKE';

# 2.8
SELECT T2.NAME, T2.AGE FROM t_tab2 T2
LEFT JOIN t_tab1 T1 ON T1.SELLER_NAME = T2.NAME WHERE T1.ID IS NULL;
-- Ответ: 1

# 2.9
SELECT T2.NAME, T2.SALARY FROM t_tab2 T2 WHERE T2.AGE < 26;
-- Ответ: 3

# 2.10
-- Ответ: 0, так как отсутствуют продавцы с именем 'RITA' в таблице T_TAB1

-- Я мог бы посчитать с помощью COUNT, но в заданиях дали только вопросы, а не просили написать запросы.

# Здаание №3
# 3.1
SELECT COUNT(*) FROM 
(SELECT l.user_id FROM listenings L 
JOIN audiobooks ab ON ab.uuid = l.audiobook_uuid 
WHERE ab.title = 'Coraline' and coalesce(l.is_test, 0) = 0 
GROUP BY l.user_id, l.audiobook_uuid, ab.duration 
HAVING sum(greatest(l.position_to - l.position_from, 0)) >= ab.duration * 0.1);
-- Answer: 54

# 3.2
SELECT l.os_name, ab.title, COUNT(DISTINCT l.user_id) AS user_count, SUM(l.position_to - l.position_from) / 3600 AS time_sum FROM listenings l
JOIN audiobooks ab ON ab.uuid = l.audiobook_uuid
WHERE COALESCE(l.is_test, 0) = 0
GROUP BY l.os_name, ab.title
ORDER BY l.os_name, ab.title;
-- Answer: 14
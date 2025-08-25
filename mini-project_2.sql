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

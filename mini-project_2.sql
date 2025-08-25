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


# 2.1

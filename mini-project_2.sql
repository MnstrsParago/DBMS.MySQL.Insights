# BASE

CREATE DATABASE users_adverts;
USE users_adverts;
CREATE TABLE users (
    date DATE,
    user_id CHAR(50),
    view_adverts INT
);


# Задание №1
SELECT COUNT(DISTINCT user_id) FROM users
WHERE date BETWEEN '2023-11-07' AND '2023-11-15';


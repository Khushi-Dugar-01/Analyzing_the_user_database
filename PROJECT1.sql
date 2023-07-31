CREATE DATABASE ecommerce;
USE ecommerce;
DESC users_data;
SELECT * FROM users_data LIMIT 100;
SELECT COUNT(DISTINCT country) country, COUNT(DISTINCT language) language FROM users_data;
SELECT gender,socialNbFollowers FROM users_data GROUP BY gender;
SELECT COUNT(hasProfilePicture) no_ProfilePicture FROM users_data WHERE hasProfilePicture = 'TRUE';
SELECT COUNT(hasAnyApp) no_AnyApp FROM users_data WHERE hasAnyApp = 'TRUE';
SELECT COUNT(hasAndroidApp) no_AndroidApp FROM users_data WHERE hasAndroidApp = 'TRUE';
SELECT COUNT(hasIosApp) no_IosApp FROM users_data WHERE hasIosApp = 'TRUE';
SELECT country, COUNT(productsBought) Buyers FROM users_data GROUP BY country ORDER BY Buyers DESC;
SELECT country, COUNT(productsSold) Sellers FROM users_data GROUP BY country ORDER BY Sellers ASC;
SELECT country FROM users_data GROUP BY country HAVING MAX(productsPassRate) LIMIT 10;
SELECT language, COUNT(language) FROM users_data GROUP BY language;
SELECT 'Description', 'No. of units' UNION SELECT 'Products Social Liked', SUM(socialProductsLiked) FROM users_data WHERE gender = 'F' 
UNION SELECT 'Products wishlisted', SUM(productsWished) wishlisted FROM users_data WHERE gender = 'F';
SELECT 'Description', 'No. of people' UNION SELECT 'Sellers(Male)', COUNT(productsListed) FROM users_data WHERE gender = 'M' 
AND productsListed > 0  UNION SELECT 'Buyers(Male)', COUNT(productsBought) FROM users_data WHERE gender = 'M' AND productsBought > 0;
SELECT country, MAX(productsBought) Max_buyers FROM users_data GROUP BY country ORDER BY MAX(productsBought) DESC LIMIT 1;
SELECT country , productsSold FROM users_data WHERE productsSold = 0 LIMIT 10;
SELECT * FROM users_data GROUP BY daysSinceLastLogin HAVING MIN(daysSinceLastLogin) ORDER BY daysSinceLastLogin ASC LIMIT 110;
SELECT COUNT(type) FROM users_data WHERE gender = 'F' AND daysSinceLastLogin >= 100;
SELECT country, COUNT(gender) female_users FROM users_data WHERE gender = 'F' GROUP BY country;
SELECT country, COUNT(gender) male_users FROM users_data WHERE gender = 'M' GROUP BY country;
SELECT country, AVG(productsSold) products_sold, AVG(productsBought) products_bought FROM users_data WHERE gender='M' GROUP BY country;
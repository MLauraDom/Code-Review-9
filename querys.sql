/* 1 - Who payd with a specific payment type? */

 SELECT FName, LName
 FROM users
 JOIN payment ON payment.fk_UserID = users.UserID
 JOIN paytype ON payment.fk_PayTypeID = paytype.PayTypeID
 WHERE TName = "VISA"; 

/* 2 - Who received their Products with a specific Shipping Company? */

 SELECT FName, LName
 FROM users
 JOIN shipping ON shipping.fk_UserID = users.UserID
 JOIN shipcompany ON shipping.fk_ShipCompanyID = shipcompany.ShipCompanyID
 WHERE SName = "TAXI"; 

/*	3 - How many products were bought from a specific company? */

SELECT COUNT(*)
FROM `shoppingcart`
WHERE `fk_User_ProductID`IN (
    SELECT `User_ProductID`
    FROM `user_product`
    WHERE `fk_ProductID` IN (
        SELECT `ProductID`
        FROM `products`
        WHERE `fk_CompanyID` = 1
    ));

SELECT COUNT(*)
FROM user_product
JOIN products on user_product.fk_ProductID = products.ProductID 
WHERE fk_CompanyID = 1;


/* 4 - Who purchased products on this date */

 SELECT FName, LName
 FROM users
 JOIN payment ON payment.fk_UserID = users.UserID
 WHERE DATE(PDate) = "2021-02-26";

/* 5 - What  products were sent between this and that date? */

 SELECT PName, Price
 FROM products
 JOIN user_product ON user_product.fk_ProductID = products.ProductID
 JOIN shoppingcart ON shoppingcart.fk_User_ProductID = user_product.User_ProductID
 JOIN orders ON orders.fk_ShoppingCartID = shoppingcart.ShoppingCartID
 JOIN payment ON payment.fk_OrderID = orders.OrdersID
 JOIN shipping ON shipping.fk_paymentID = payment.PaymentID
 WHERE DATE(SDate) > "2021-02-26" AND DATE(SDate) < "2021-10-01" ;


/* 6 - How many products were sent to a specific city? */

SELECT COUNT(*)
FROM products
JOIN user_product ON user_product.fk_ProductID = products.ProductID
JOIN users ON user_product.fk_UserID = users.UserID
JOIN adress ON users.fk_AdressID = adress.AdressID
WHERE City = "Paris";


/* Create at least 2 extra JOINS in your SQL queries that connect more than 3 tables*/


 /* 1 - How many Orders were sent to Romania */

 SELECT COUNT(*)
 FROM orders
 JOIN payment ON payment.fk_OrderID = orders.OrdersID
 JOIN shipping ON shipping.fk_paymentID = payment.PaymentID
 JOIN users ON shipping.fk_UserID = users.UserID
 JOIN adress ON users.fk_AdressID = adress.AdressID
 WHERE Country = "Romania";


/* 2 - Witch Products was sent to Beyonce */

 SELECT PName, Price
 FROM products
 JOIN user_product ON user_product.fk_ProductID = products.ProductID
 JOIN shoppingcart ON shoppingcart.fk_User_ProductID = user_product.User_ProductID
 JOIN orders ON orders.fk_ShoppingCartID = shoppingcart.ShoppingCartID
 JOIN payment ON payment.fk_OrderID = orders.OrdersID
 JOIN shipping ON shipping.fk_paymentID = payment.PaymentID
 JOIN users ON shipping.fk_UserID = users.UserID
 WHERE FName = "Beyonce" ;

 /* 3 - How many Products from a specific company were sent with Veloce */
 SELECT COUNT(*)
 FROM shipping
 LEFT JOIN shipcompany on shipping.fk_ShipCompanyID = shipcompany.ShipCompanyID
 RIGHT JOIN payment on shipping.fk_PaymentID = payment.PaymentID
 RIGHT JOIN orders on payment.fk_OrderID = orders.OrdersID
 RIGHT JOIN shoppingcart on orders.fk_ShoppingCartID = shoppingcart.ShoppingCartID
 RIGHT JOIN user_product on shoppingcart.fk_User_ProductID = user_product.User_ProductID
 RIGHT JOIN products on user_product.fk_ProductID = products.ProductID
 RIGHT JOIN company on products.fk_CompanyID = company.CompanyID
 WHERE SName = "Atlassib" AND company.Name = "Loreal";
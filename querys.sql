/*	how many products were bought from a specific company*/

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



/* who purchased products on this date*/

/* what  products were sent between this and that date */

/*how many products were sent to a specific city etc.*/
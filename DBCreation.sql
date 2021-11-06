/*Database*/
CREATE DATABASE cr9_famazon_lauramoldovan DEFAULT CHARACTER SET utf8;

/*Table Adress*/
CREATE TABLE Adress(
AdressID INT NOT NULL AUTO_INCREMENT,
Country VARCHAR (30) NOT NULL,
City VARCHAR (30) NOT NULL,
ZIP INT,
PRIMARY KEY (AdressID)
);

/*Table Users*/
CREATE TABLE Users(
UserID INT NOT NULL AUTO_INCREMENT,
FName VARCHAR (30) NOT NULL,
LName VARCHAR (30) NOT NULL,
UserName VARCHAR (35),
Email VARCHAR (30),
HouseStreet VARCHAR(50),
fk_AdressID INT NOT NULL,
PRIMARY KEY (UserID),
FOREIGN KEY (fk_AdressID) REFERENCES Adress(AdressID) ON DELETE CASCADE
);

/*Table Company*/
CREATE TABLE Company(
CompanyID INT NOT NULL AUTO_INCREMENT,
Name VARCHAR (50) NOT NULL,
Webseite VARCHAR (50) NOT NULL,
Telefon VARCHAR(20),
PRIMARY KEY (CompanyID)
);

/*Table Products*/
CREATE TABLE Products(
ProductID INT NOT NULL AUTO_INCREMENT,
PName VARCHAR (30) NOT NULL,
PDescription VARCHAR (500) NOT NULL,
Price DECIMAL(8,2),
fk_CompanyID INT NOT NULL,
PRIMARY KEY (ProductID),
FOREIGN KEY (fk_CompanyID) REFERENCES Company(CompanyID) ON DELETE CASCADE
);


/*Table PayType*/
CREATE TABLE PayType(
PayTypeID INT NOT NULL AUTO_INCREMENT,
TName VARCHAR(50),
PRIMARY KEY (PayTypeID)
);

/*Table ShipCompany*/
CREATE TABLE ShipCompany(
ShipCompanyID INT NOT NULL AUTO_INCREMENT,
SName VARCHAR(50),
Website VARCHAR(50),
Telefon VARCHAR(20),
PRIMARY KEY (ShipCompanyID)
);


/*Table User_Product*/
CREATE TABLE User_Product(
User_ProductID INT NOT NULL AUTO_INCREMENT,
fk_UserID INT NOT NULL,
fk_ProductID INT NOT NULL,
PRIMARY KEY (User_ProductID),
FOREIGN KEY (fk_UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
FOREIGN KEY (fk_ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);


/*Table ShoppingCart*/
CREATE TABLE ShoppingCart( 
    ShoppingCartID INT NOT NULL AUTO_INCREMENT, 
    fk_User_ProductID INT, 
    PRIMARY KEY (ShoppingCartID), 
    FOREIGN KEY (fk_User_ProductID) REFERENCES User_Product(User_ProductID) ON DELETE CASCADE 
    );



/*Table Orders*/
CREATE TABLE Orders(
OrdersID INT NOT NULL AUTO_INCREMENT,
fk_ShoppingCartID INT NOT NULL,
Summe DECIMAL(10,2),
PRIMARY KEY (OrdersID),
FOREIGN KEY (fk_ShoppingCartID) REFERENCES ShoppingCart(ShoppingCartID) ON DELETE CASCADE
);


/*Table Payment*/
CREATE TABLE Payment(
PaymentID INT NOT NULL AUTO_INCREMENT,
PDate TIMESTAMP,
fk_PayTypeID INT NOT NULL,
fk_OrderID INT NOT NULL,
fk_UserID INT NOT NULL,
PRIMARY KEY (PaymentID),
FOREIGN KEY (fk_PayTypeID) REFERENCES paytype(PayTypeID) ON DELETE CASCADE,
FOREIGN KEY (fk_OrderID) REFERENCES orders(OrdersID) ON DELETE CASCADE,
FOREIGN KEY (fk_UserID) REFERENCES users(UserID) ON DELETE CASCADE
);

/*Table Shipping*/
CREATE TABLE Shipping(
ShippingID INT NOT NULL AUTO_INCREMENT,
SDate TIMESTAMP,
fk_PaymentID INT NOT NULL,
fk_ShipCompanyID INT NOT NULL,
fk_UserID INT NOT NULL,
PRIMARY KEY (ShippingID),
FOREIGN KEY (fk_PaymentID) REFERENCES Payment(PaymentID) ON DELETE CASCADE,
FOREIGN KEY (fk_ShipCompanyID) REFERENCES ShipCompany(ShipCompanyID) ON DELETE CASCADE,
FOREIGN KEY (fk_UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);







/* Introducing Values */

/* Adress*/
INSERT INTO Adress
VALUES 
(1, "Romania", "Timisoara", 23980),
(2, "Austria", "Vienna", 1100),
(3, "Austria", "Vienna", 1150),
(4, "France", "Paris", 5577),
(5, "U.S.A.", "Los Angeles", 4327),
(6, "Romania", "Oravita", 6790),
(7, "Germany", "Berlin", 8990),
(8, "U.S.A.", "Beverly Hills", 90210),
(9, "Japan", "Tokyo", 5465),
(10, "Rusia", "Moscow", 9099);

/* Users*/
INSERT INTO Users
VALUES 
(1, "Laura", "Moldovan", "LauraM", "laura.duduma@gmail.com", "Andrei Saguna, 32", 6),
(2, "Britney", "Spears", "Brit.S", "britney@gmail.com", "Heaven Street, 77/7", 5),
(3, "Beyonce", "Knowless", "QueenB", "beyonce@gmail.com", "Champ d'Elisee, 3/2/7", 4),
(4, "Sebastian", "Kurz", "BastiK", "seby.kurz@gmail.com", "Neubaugürtel, 19/14", 3),
(5, "Channing", "Tatum", "MagicMike", "channing@gmail.com", "Brenda & Brandon, 12/4", 8),
(6, "Vladimir", "Putin", "VladP", "vladimir@gmail.com", "Kokoshnik, 33/3", 10),
(7, "Jackye", "Chan", "KungFu", "karate@gmail.com", "Driffting Street, 8/2", 9),
(8, "Jay", "Z", "Jay-Z", "jay_z@gmail.com",  "Champ d'Elisee, 3/2/1", 4),
(9, "Dominic", "Moldovan", "DomM", "domm@gmail.com", "Andrei Saguna, 38", 6),
(10, "Stana", "Izbasa", "SteauaR", "s.izbasa@gmail.com","Brancoveanu, 42/5/7", 1),
(11, "Dragana", "Mirkovic", "DragaM", "dm@gmail.com", "Brunnweg, 4/10/8", 2),
(12, "William", "Shakespeare", "WillyBoy", "shakespeare@gmail.com", "Burggasse, 22/3", 7);

/* Company*/
INSERT INTO Company
VALUES 
(1, "NOKIA", "www.nokia.com", "+43 676 00 00 999"),
(2, "APPLE", "www.apple.com", "+43 676 22 22 222"),
(3, "Gucci", "www.gucci.com", "+43 660 88 99 898"),
(4, "Channel", "www.chanel.com", "+43 660 66 77 888"),
(5, "Loreal", "www.loreal.com", "+43 676 11 22 333"),
(6, "RedBull", "www.redbull.com", "+43 676 44 55 666");


/* Product*/
INSERT INTO Products
VALUES 
(1, "NOKIA 3310", "The most longevive Telephone", 49.99, 1),
(2, "NOKIA 7200", "It's good to have it", 79.99, 1),
(3, "RedBull 0,25 Dose", "RedBull gives you Wings", 1.49, 6),
(4, "Parfum Channel Madmoiselle", "The Immortal Essence", 139.99, 4),
(5, "Parfum Channel Coco", "Sweet & Strong", 139.99, 4),
(6, "Lipstick", "Red", 5.49, 5),
(7, "Lipstick", "Pink", 5.49, 5),
(8, "Iphone 13", "The newest", 1299.99, 2),
(9, "Gown", "Made from lace", 7300, 3);

/* User_Product*/
INSERT INTO User_Product
VALUES 
(1, 1, 9),
(2, 2, 5),
(3, 3, 6),
(4, 4, 3),
(5, 5, 2),
(6, 6, 1),
(7, 7, 4),
(8, 8, 8),
(9, 9, 7),
(10, 10, 1);

/* ShoppingCart*/
INSERT INTO ShoppingCart
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


/* Orders*/
INSERT INTO Orders
VALUES 
(1, 1, 7300),
(2, 2, 139.99),
(3, 3, 5.49),
(4, 4, 1.49),
(5, 5, 79.99),
(6, 6, 49.99),
(7, 7, 5.49),
(8, 8, 1299.99),
(9, 9, 5.49),
(10, 10, 49.99);

/* PayType*/
INSERT INTO PayType
VALUES 
(1, "PayPal"),
(2, "Debit Card"),
(3, "VISA"),
(4, "Cash");

/* ShipCompany*/
INSERT INTO ShipCompany
VALUES 
(1, "PRIME", "www.prime.com", "+43 660 55 22 333"),
(2, "TAXI", "www.taxi.com", "+43 660 55 22 000"),
(3, "Veloce", "www.veloce.com", "+43 660 55 22 111"),
(4, "Atlassib", "www.atlassib.com", "+43 660 55 22 222");

/* Payment*/
INSERT INTO Payment
VALUES 
(1, "1987-10-01 06:22", 1, 1, 1),
(2, "2021-04-01 01:23", 4, 2, 2),
(3, "2021-07-20 12:52", 2, 3, 3),
(4, "2021-09-30 15:45", 4, 4, 4),
(5, "2021-10-04 11:23", 3, 5, 5),
(6, "2021-07-02 17:50", 1, 6, 6),
(7, "2021-05-02 17:50", 2, 7, 7),
(8, "2021-02-26 16:34", 3, 8, 8),
(9, "2021-03-02 17:50", 4, 9, 9),
(10, "2021-03-06 19:50", 1, 10, 10);

/* Shipping*/
INSERT INTO Shipping
VALUES 
(1, "1987-10-02 06:22", 1, 1, 1),
(2, "2021-04-02 01:23", 2, 4, 2),
(3, "2021-07-21 12:52", 3, 2, 3),
(4, "2021-10-01 15:45", 4, 4, 4),
(5, "2021-10-05 11:23", 5, 3, 5),
(6, "2021-07-06 17:50", 6, 1, 6),
(7, "2021-05-03 17:50", 7, 2, 7),
(8, "2021-02-27 16:34", 8, 3, 8),
(9, "2021-03-03 17:50", 9, 4, 9),
(10, "2021-03-07 19:50", 10, 1, 10);
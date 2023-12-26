-- Warehouse table
CREATE TABLE Warehouse (
    ID_warehouse INT PRIMARY KEY,
    City VARCHAR(255),
    Street VARCHAR(255),
    House VARCHAR(255),
    Quantity_of_goods INT,
    ID_product INT
);

-- Remains_Product table
CREATE TABLE Remains_Product (
    ID_remains INT PRIMARY KEY,
    ID_warehouse INT,
    ID_product INT,
    FOREIGN KEY (ID_warehouse) REFERENCES Warehouse(ID_warehouse),
    FOREIGN KEY (ID_product) REFERENCES Product(ID_product)
);

-- Product table
CREATE TABLE Product (
    ID_product INT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    Cost DECIMAL(10, 2),
    ID_product_parent INT,
    FOREIGN KEY (ID_product_parent) REFERENCES Product(ID_product)
);

-- Order_Details table
CREATE TABLE Order_Details (
    ID_order_details INT PRIMARY KEY,
    ID_order INT,
    ID_product INT,
    Quantity INT,
    Interim_result DECIMAL(10, 2),
    FOREIGN KEY (ID_order) REFERENCES Orders(ID_order),
    FOREIGN KEY (ID_product) REFERENCES Product(ID_product)
);

-- Manager table
CREATE TABLE Manager (
    ID_manager INT PRIMARY KEY,
    FIO VARCHAR(255),
    Telephone VARCHAR(20),
    Email VARCHAR(255)
);
-- Orders table
CREATE TABLE Orders (
    ID_order INT PRIMARY KEY,
    order_date DATE,
    ID_client INT,
    ID_manager INT,
    ID_administrator INT,
    FOREIGN KEY (ID_client) REFERENCES Client(ID_client),
    FOREIGN KEY (ID_manager) REFERENCES Manager(ID_manager),
    FOREIGN KEY (ID_administrator) REFERENCES Administrator(ID_administrator)
);

-- Administrator table
CREATE TABLE Administrator (
    ID_administrator INT PRIMARY KEY,
    FIO VARCHAR(255),
    Email VARCHAR(255)
);

-- Order_History table
CREATE TABLE Order_History (
    ID_history INT PRIMARY KEY,
    ID_order INT,
    ID_client INT,
    FOREIGN KEY (ID_order) REFERENCES Orders(ID_order),
    FOREIGN KEY (ID_client) REFERENCES Client(ID_client)
);

-- Client table
CREATE TABLE Client (
    ID_client INT PRIMARY KEY,
    FIO VARCHAR(255),
    City VARCHAR(255),
    Street VARCHAR(255),
    House VARCHAR(255),
    Telephone VARCHAR(20),
    Email VARCHAR(255)
);
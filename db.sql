-- Таблица для киосков
CREATE TABLE Kiosks (
    KioskID int PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
	saler_name VARCHAR(100),
    Location VARCHAR(255) NOT NULL
)

-- Таблица для товаров
CREATE TABLE Products (
    ProductID int PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

-- Таблица для поставщиков
CREATE TABLE Suppliers (
    SupplierID int PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(20)
);

-- Таблица для клиентов
CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Таблица для заказов
CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    KioskID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (KioskID) REFERENCES Kiosks(KioskID)
);

-- Таблица с детальным описанием заказов
CREATE TABLE OrderDetails (
    OrderDetailID int PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    SupplierID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);



-- Таблица узлов для киосков
CREATE TABLE HubKiosk (
    KioskID BIGINT PRIMARY KEY,
    KioskBusinessKey VARCHAR(100) NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Таблица узлов для товаров
CREATE TABLE HubProduct (
    ProductID BIGINT PRIMARY KEY,
    ProductBusinessKey VARCHAR(100) NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Таблица узлов для поставщиков
CREATE TABLE HubSupplier (
    SupplierID BIGINT PRIMARY KEY,
    SupplierBusinessKey VARCHAR(100) NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Таблица узлов для клиентов
CREATE TABLE HubCustomer (
    CustomerID BIGINT PRIMARY KEY,
    CustomerBusinessKey VARCHAR(100) NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Таблица узлов для заказов
CREATE TABLE HubOrder (
    OrderID BIGINT PRIMARY KEY,
    OrderBusinessKey VARCHAR(100) NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Таблица связей между заказами и клиентами
CREATE TABLE LinkOrderCustomer (
    LinkOrderCustomerID BIGINT PRIMARY KEY,
    OrderID BIGINT NOT NULL,
    CustomerID BIGINT NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES HubOrder(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES HubCustomer(CustomerID)
);

-- Таблица связей между заказами и киосками
CREATE TABLE LinkOrderKiosk (
    LinkOrderKioskID BIGINT PRIMARY KEY,
    OrderID BIGINT NOT NULL,
    KioskID BIGINT NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES HubOrder(OrderID),
    FOREIGN KEY (KioskID) REFERENCES HubKiosk(KioskID)
);

-- Таблица связей между заказами и товарами
CREATE TABLE LinkOrderProduct (
    LinkOrderProductID BIGINT PRIMARY KEY,
    OrderID BIGINT NOT NULL,
    ProductID BIGINT NOT NULL,
    SupplierID BIGINT NOT NULL,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES HubOrder(OrderID),
    FOREIGN KEY (ProductID) REFERENCES HubProduct(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES HubSupplier(SupplierID)
);

-- Спутник для атрибутов киосков
CREATE TABLE SatKiosk (
    KioskID BIGINT NOT NULL,
    Name VARCHAR(100),
    Location VARCHAR(255),
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    EffectiveFrom TIMESTAMP NOT NULL,
    EffectiveTo TIMESTAMP,
    PRIMARY KEY (KioskID, LoadDate),
    FOREIGN KEY (KioskID) REFERENCES HubKiosk(KioskID)
);

-- Спутник для атрибутов товаров
CREATE TABLE SatProduct (
    ProductID BIGINT NOT NULL,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    EffectiveFrom TIMESTAMP NOT NULL,
    EffectiveTo TIMESTAMP,
    PRIMARY KEY (ProductID, LoadDate),
    FOREIGN KEY (ProductID) REFERENCES HubProduct(ProductID)
);

-- Спутник для атрибутов поставщиков
CREATE TABLE SatSupplier (
    SupplierID BIGINT NOT NULL,
    Name VARCHAR(100),
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(20),
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    EffectiveFrom TIMESTAMP NOT NULL,
    EffectiveTo TIMESTAMP,
    PRIMARY KEY (SupplierID, LoadDate),
    FOREIGN KEY (SupplierID) REFERENCES HubSupplier(SupplierID)
);

-- Спутник для атрибутов клиентов
CREATE TABLE SatCustomer (
    CustomerID BIGINT NOT NULL,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    EffectiveFrom TIMESTAMP NOT NULL,
    EffectiveTo TIMESTAMP,
    PRIMARY KEY (CustomerID, LoadDate),
    FOREIGN KEY (CustomerID) REFERENCES HubCustomer(CustomerID)
);

-- Спутник для атрибутов заказов
CREATE TABLE SatOrder (
    OrderID BIGINT NOT NULL,
    OrderDate DATE,
    LoadDate TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    EffectiveFrom TIMESTAMP NOT NULL,
    EffectiveTo TIMESTAMP,
    PRIMARY KEY (OrderID, LoadDate),
    FOREIGN KEY (OrderID) REFERENCES HubOrder(OrderID)
);

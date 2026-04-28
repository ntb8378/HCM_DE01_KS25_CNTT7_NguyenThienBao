create database SalesManagement;
use SalesManagement;

create table Product(
	ProductID char(50) primary key,
    ProductName char(100),
    Hangsanxuat char(50),
    price decimal(10,2),
    stock int
);

create table Customer(
	CustomerID char(50) primary key,
    CustomerName char(100),
    Email char(100),
    phonenumber char(20),
	address char(100)
);

create table `Order`(
	OrderID char(50) primary key,
    dateOder date,
    sumprice decimal(10,2),
    CustomerID char(50),
    foreign key (CustomerID)
    references Customer(CustomerID)
);

create table Order_Detail(
	OrderID char(50),
    ProductID char(50),
    quantity char(50),
    timePrice decimal(10,2),
    
    primary key (ProductID,OrderID),
    foreign key(OrderID)
    references `Order`(OrderID),
    
    foreign key (ProductID)
    references Product(ProductID)
    
);

alter table `Order`
add column note text; 

alter table Product
rename column Hangsanxuat to Nhasanxuat;

drop table  Order_Detail;
drop table  `Order`;

INSERT INTO Product VALUES
('P001','MacBook Air M2','Apple',18000000,10),
('P002','MacBook Pro M3','Apple',35000000,5),
('P003','Dell XPS 13','Dell',25000000,7),
('P004','HP Pavilion','HP',15000000,8),
('P005','Asus Vivobook','Asus',12000000,12);

INSERT INTO Customer VALUES
('C001','Nguyen Van A','a@gmail.com','0901111111','HCM'),
('C002','Tran Thi B','b@gmail.com','0902222222','Ha Noi'),
('C003','Le Van C','c@gmail.com',NULL,'Da Nang'),
('C004','Pham Thi D','d@gmail.com','0904444444','HCM'),
('C005','Hoang Van E','e@gmail.com',NULL,'Can Tho');

INSERT INTO `Order` VALUES
('DH001','2025-03-01',18000000,'C001',NULL),
('DH002','2025-03-02',35000000,'C002',NULL),
('DH003','2025-03-03',25000000,'C001',NULL),
('DH004','2025-03-04',15000000,'C004',NULL),
('DH005','2025-03-05',12000000,'C002',NULL);

INSERT INTO Order_Detail VALUES
('DH001','P001',1,18000000),
('DH002','P002',1,35000000),
('DH003','P003',1,25000000),
('DH004','P004',1,15000000),
('DH005','P005',1,12000000);

update product
set price = price * 1.1
where Nhasanxuat= 'Apple';

delete from customer
where phonenumber is null;

select * from product 
where price >= 10000000 and price <= 20000000 ;

-- em không biết làm 2 cái select cuối
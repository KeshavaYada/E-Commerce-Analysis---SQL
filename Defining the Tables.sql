-- Amazon advanced SQL project
-- Defining the All tables 

create table category 
             ( Category_Id INT primary key,
			 Category_Name varchar(25)
			 );
create table Customers
             ( Customer_ID INT PRIMARY key,
			    f_Name Varchar(25),
				L_Name Varchar(25),
				State Varchar(15));
ALTER TABLE Customers
ADD COLUMN address VARCHAR(5) DEFAULT 'XXXX';
create table Sellers
             ( Sellar_Id int primary key,
			Sellar_Name varchar(25)
			 );			
Alter table Sellers
Add column origin varchar(10);
create table Products
(Product_Id int Primary key,
Product_Name Varchar(25),
Price float,
cog float,
Category_Id int ,--fk
Constraint products_fk_cateogory foreign key(Category_Id) References category(Category_Id)
);
create table orders
(
order_Id int primary key,
order_date DATE,
Customer_Id int, --fk
seller_Id INT,--fk
order_status varchar(15),
Constraint orders_fk_customer foreign key(Customer_Id) References Customers(Customer_ID),
Constraint orders_fk_sellers foreign key(seller_Id) References Sellers(Sellar_Id)
);			 
create table order_Items
(
order_item_id INT PRIMARY KEY,
order_Id INT,--fk
Product_Id INT,--fk
Quantity INT,
Price_per_unit FLOAT,
Total_Price FLOAT,
CONSTRAINT Orderitems_fk_orders FOREIGN key(order_Id) references orders(order_Id),
CONSTRAINT Orderitems_fk_Products FOREIGN key(Product_Id) references Products(Product_Id));
Create table Inventory(
Inventory_Id INT Primary Key,
Product_Id INT,--fk
Stock_Remaining Float,
Ware_House_Id INT,
Restock_date DATE,
CONSTRAINT Inventory_fk_Products FOREIGN key(Product_Id) references Products(Product_Id)
);
Create table Shipping(
Shipping_Id INT PRIMARY KEY,
order_Id INT,--fk,
Delivery_Status Varchar(25),
Shipping_Date DATE,
Return_date DATE,
CONSTRAINT Shipping_fk_orders FOREIGN key(order_Id) references orders(order_Id)
);
Alter table Shipping
add column shipping_providers Varchar(25);
Alter table Shipping
Drop column Return_date;
Alter table Shipping
add column Return_date DATE;

Create table Payments(
Payment_Id INT PRIMARY KEY,
Order_Id Int,--fk
Payemnt_date DATE,
Payment_status VARCHAR(20),
CONSTRAINT Payments_fk_orders FOREIGN key(order_Id) references orders(order_Id)
)



Alter table Shipping
Drop column delivery_status;
Alter table Shipping
Drop column shipping_providers
;
;
Alter table Shipping
Add column shipping_providers VARCHAR(25);
Alter table Shipping
Add column delivery_status VARCHAR(25);



-- End of SCHEMAS




				
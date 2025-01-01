USE mydataset 
-- replace as own dataset
	
DROP TABLE IF EXISTS orderdetails;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
-- need to drop the foreign key tables first 

CREATE TABLE IF NOT EXISTS customers(
	`customer_number` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `customer_last_name` VARCHAR(50) NOT NULL,
    `customer_first_name` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `address_line_1` VARCHAR(50) NOT NULL,
    `address_line_2` VARCHAR(50) NULL,
    `city` VARCHAR(50) NOT NULL,
    `state` VARCHAR(50)NULL,
    `zip` VARCHAR(15)NULL
  )ENGINE=InnoDB;
  
  
CREATE TABLE IF NOT EXISTS  employees(
	`employee_number` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `last_name` VARCHAR(50) NOT NULL,
    `first_name` VARCHAR(50) NOT NULL,
    `extension` VARCHAR(10) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `job_title` VARCHAR(50) NOT NULL
     )ENGINE=InnoDB;
       

CREATE TABLE IF NOT EXISTS  products(
	`product_code` VARCHAR(15) PRIMARY KEY NOT NULL,
    `product_name` VARCHAR(70) NOT NULL,
    `product_vendor` VARCHAR(150) NOT NULL,
    `product_description`TEXT NOT NULL,
    `quantity_in_stock` SMALLINT(6) NOT NULL,
    `buy_price` DOUBLE NOT NULL,
    `msrp` DOUBLE NOT NULL
     )ENGINE=InnoDB;
            

CREATE TABLE IF NOT EXISTS  orders(
	`order_number` INT PRIMARY KEY NOT NULL,
    `order_date` DATE NOT NULL,
    `required_date`DATE NOT NULL,
    `shipped_date` DATE NULL,
    `order_status` VARCHAR(15) NOT NULL,
    `fk_customer_number` INT NOT NULL,
    `fk_employee_number` INT NOT NULL,
    FOREIGN KEY(fk_customer_number) REFERENCES customers(customer_number),
    FOREIGN KEY(fk_employee_number) REFERENCES employees(employee_number)
     )ENGINE=InnoDB;
     

CREATE TABLE IF NOT EXISTS  orderdetails(
	`fk_order_number` INT NOT NULL,
    `fk_product_code` VARCHAR(15) NOT NULL,
    `quantity_ordered` INT NOT NULL,
    `price_each` DOUBLE NOT NULL,
	PRIMARY KEY(fk_order_number, fk_product_code),
    FOREIGN KEY(fk_order_number) REFERENCES orders(order_number),
    FOREIGN KEY(fk_product_code) REFERENCES products(product_code)
     )ENGINE=InnoDB;
     
INSERT INTO customers(customer_last_name,customer_first_name,phone,address_line_1,city,zip)
VALUES
('Wheeler','Mike',123456789,'123address','Pittsburgh','15213');

INSERT INTO customers(customer_last_name,customer_first_name,phone,address_line_1,city,zip)
VALUES
('Byers','Will',12345678,'1243address','Pittsburgh','15215');

INSERT INTO customers(customer_last_name,customer_first_name,phone,address_line_1,city,zip)
VALUES
('Sinclair','Lucas',1234567,'1423address','Pittsburgh','15218');

INSERT INTO employees(last_name, first_name,extension,email,job_title)
VALUES
('Maryfield','Max','a','Max@gmail.com','sales_manager');

INSERT INTO employees(last_name, first_name,extension,email,job_title)
VALUES
('Henderson','Dustin','b','Dustin@gmail.com','sale_fruit');

INSERT INTO employees(last_name, first_name,extension,email,job_title)
VALUES
('Harrington','Steve','c','Steve@gmail.com','sales_meat');

INSERT INTO products(product_code, product_name,product_vendor,product_description,quantity_in_stock,buy_price,msrp)
VALUES
('101','apple','Giant Eagle','sweet','10','1.49','2');

INSERT INTO products(product_code, product_name,product_vendor,product_description,quantity_in_stock,buy_price,msrp)
VALUES
('102','milk','Seul Market','HDA inclued','10','2.5','3.5');

INSERT INTO products(product_code, product_name,product_vendor,product_description,quantity_in_stock,buy_price,msrp)
VALUES
('103','egg','Lotus','organic','100','5','8');

INSERT INTO orders(order_number,order_date,required_date,shipped_date,order_status,fk_customer_number,fk_employee_number)
VALUES
('20230101','2023-1-1','2023-1-10','2023-1-3','shipped','1','2');

INSERT INTO orders(order_number,order_date,required_date,shipped_date,order_status,fk_customer_number,fk_employee_number)
VALUES
('20230102','2023-1-2','2023-1-11',NULL,'processing','2','2');

INSERT INTO orders(order_number,order_date,required_date,shipped_date,order_status,fk_customer_number,fk_employee_number)
VALUES
('20230103','2023-1-7','2023-2-1',NULL,'received','3','1');

SELECT * FROM products;
-- before insert, you should check what inside 

INSERT INTO orderdetails(fk_order_number,fk_product_code,quantity_ordered,price_each)
VALUES
('20230102','102','2','4');

INSERT INTO orderdetails(fk_order_number,fk_product_code, quantity_ordered,price_each)
VALUES
('20230103','101','3','6');







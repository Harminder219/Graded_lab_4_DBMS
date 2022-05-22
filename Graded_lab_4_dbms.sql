create database My_Shop;
use  My_Shop;

create table supplier(SUPP_ID int auto_increment primary key,SUPP_NAME varchar(50) NOT NULL,SUPP_CITY varchar(50) NOT NULL,SUPP_PHONE varchar(50) NOT NULL);


insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values("Rajesh Retails","Delhi","1234567890");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE)  values("Appario Ltd.","Mumbai","2589631470");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE)  values("Knome products","Banglore","9785462315");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE)  values("Bansal Retails","Kochi","8975463285");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE)  values("Mittal Ltd.","Lucknow","7898456532");


create table customer(CUS_ID int auto_increment primary key,CUS_NAME VARCHAR(20) NOT NULL,CUS_PHONE VARCHAR(10) NOT NULL,CUS_CITY VARCHAR(30) NOT NULL,CUS_GENDER char);

insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("AAKASH","9999999999","DELHI",'M');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("AMAN","9785463215","NOIDA",'M');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("NEHA","9999999999","MUMBAI",'F');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("MEGHA","9994562399","KOLKATA",'F');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("PULKIT","7895999999","LUCKNOW",'M');

create table category(CAT_ID int auto_increment primary key,CAT_NAME VARCHAR(20) NOT NULL);

insert into category(CAT_NAME) values("BOOKS");
insert into category(CAT_NAME) values("GAMES");
insert into category(CAT_NAME) values("GROCERIES");
insert into category(CAT_NAME) values("ELECTRONICS");
insert into category(CAT_NAME) values("CLOTHES");


create table product(PRO_ID int auto_increment primary key, PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy", PRO_DESC VARCHAR(60),CAT_ID int,foreign key(CAT_ID) references category(CAT_ID));

insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("TSHIRT","SIZE-L with Black, Blue and White variations",5);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("OATS","Highly Nutritious from Nestle",3);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("MILK","1L Toned MIlk ",3);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("Boat Earphones","1.5Meter long Dolby Atmos",4);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("Jeans","Stretchable Denim Jeans with various sizes and color",5);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("Project IGI","compatible with windows 7 and above",2);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("Hoodie","Black GUCCI for 13 yrs and above",5);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into product(PRO_NAME,PRO_DESC,CAT_ID) values("Train Your Brain","By Shireen Stephen",1);

create table supplier_pricing(PRICING_ID int auto_increment primary key, PRO_ID int, SUPP_ID int,foreign key(PRO_ID) references product(PRO_ID),foreign key(SUPP_ID) references supplier(SUPP_ID),SUPP_PRICE int default 0 );

insert into supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(1,2,1500);
insert into supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(3,5,30000);
insert into supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(5,1,3000);
insert into supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(2,3,2500);
insert into supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(4,1,1000);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(12,2,780);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(12,4,789);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(3,1,31000);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(1,5,1450);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(4,2,999);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(7,3,549);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(7,4,529);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(6,2,105);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(6,1,99);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(2,5,2999);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) VALUES(5,2,2999);

create table `order` (ORD_ID int primary key auto_increment,ORD_AMOUNT INT NOT NULL, ORD_DATE DATE NOT NULL,CUS_ID int,PRICING_ID int,foreign key(CUS_ID) references customer(CUS_ID),foreign key(PRICING_ID) references supplier_pricing(PRICING_ID));
alter table `order` auto_increment=101;

insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(1500,"2021-10-06",2,1);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(1000,"2021-10-12",3,5);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(30000,"2021-09-16",5,2);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(1500,"2021-10-05",1,1);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(3000,"2021-08-16",4,3);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(1450,"2021-08-18",1,9);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(789,"2021-09-01",3,7);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(780,"2021-09-07",5,6);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(3000,"2021-00-10",5,3);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(2500,"2021-09-10",2,4);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(1000,"2021-09-15",4,5);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(789,"2021-09-16",4,7);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(31000,"2021-09-16",1,8);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(1000,"2021-09-16",3,5);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(3000,"2021-09-16",5,3);
insert into `order`(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values(99,"2021-09-1+",2,14);

create table rating(RAT_ID int auto_increment primary key,ORD_ID int,RAT_RATSTARS INT NOT NULL,foreign key(ORD_ID) references `order`(ORD_ID));

insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(101,4);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(102,3);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(103,1);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(104,2);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(105,4);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(106,3);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(107,4);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(108,4);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(109,3);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(110,5);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(111,3);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(112,4);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(113,2);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(114,1);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(115,1);
insert INTO rating(ORD_ID,RAT_RATSTARS) VALUES(116,0);


select  CUS_GENDER as Gender, count(CUS_GENDER) as count_customers from customer inner join (select  distinct(CUS_ID) from `order` where ORD_AMOUNT >= 3000) as T1 on customer.CUS_ID=T1.CUS_ID group by customer.CUS_GENDER;	

select T2.ORD_ID,PRO_NAME,T2.ORD_DATE,T2.ORD_AMOUNT,T2.CUS_ID,T2.PRICING_ID from product inner join (select T1.ORD_ID, PRO_ID,T1.PRICING_ID,T1.CUS_ID,T1.ORD_DATE,T1.ORD_AMOUNT from supplier_pricing  inner join (select ORD_ID,PRICING_ID,ORD_AMOUNT,CUS_ID,ORD_DATE from `order` where `order`.CUS_ID=2)as T1 on supplier_pricing.PRICING_ID=T1.PRICING_ID) as T2 on product.PRO_ID=T2.PRO_ID;

select * from  supplier where supplier.SUPP_ID in (select SUPP_ID from supplier_pricing group by SUPP_ID having count(SUPP_ID) > 1 );

select category.CAT_ID,CAT_NAME,T2.PRO_NAME,T2.min_price from category inner join (select product.PRO_ID,PRO_NAME,CAT_ID,min(T1.SUPP_PRICE) as min_price from product inner join (select  PRO_ID,SUPP_PRICE from  supplier_pricing) as T1 on product.PRO_ID=T1.PRO_ID group by product.CAT_ID) as T2 on category.CAT_ID=T2.CAT_ID order by category.CAT_ID asc;

select  product.PRO_ID,product.PRO_NAME from  product where product.PRO_ID in (select PRO_ID from supplier_pricing where supplier_pricing.PRICING_ID in (select PRICING_ID from `order` where ORD_DATE > "2021-10-05"));

select CUS_NAME,CUS_GENDER from customer where CUS_NAME like "A%" or CUS_NAME like "%A";

DELIMITER //
CREATE PROCEDURE proc1()
BEGIN

select T4.SUPP_ID,SUPP_NAME,T4.rating,T4.type_of_service from supplier inner join
(select T3.SUPP_ID,T3.rating as rating,
case 
WHEN rating=5 THEN 'Excellent Service'
WHEN rating >4 THEN 'Good Service'
WHEN rating >2 THEN 'Average Service'
ELSE 'Poor Service'
END as type_of_service
from
 (select SUPP_ID, T2.ORD_ID,T2.PRICING_ID,avg(T2.rating) as rating from supplier_pricing  inner join (select T1.ORD_ID,`order`.PRICING_ID,T1.RAT_RATSTARS as rating from  `order` inner join (select ORD_ID,RAT_RATSTARS from rating) as T1 on `order`.ORD_ID=T1.ORD_ID) as T2 on T2.PRICING_ID=supplier_pricing.PRICING_ID group by SUPP_ID order by  SUPP_ID asc) as T3)as T4 on T4.SUPP_ID=supplier.SUPP_ID;

END 
//
DELIMITER ;

call proc1();








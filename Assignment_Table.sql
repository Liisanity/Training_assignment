--ADMIN TABLE
create table admin (admin_id varchar2(20) primary key,
email varchar (30) unique,
password varchar2 (30));

SELECT * FROM admin;
    
insert into admin values('A1','liimlgr@gmail.com','25212');

--USER TABLE
create table user1 (user_id varchar2(20) primary key,
user_name varchar2(20),
email varchar (30) unique,
password varchar2 (30),
date_of_reg date,
address varchar2 (50),
contact_no number (20));

SELECT * FROM user1;

insert into user1 values('U1','username1','user1@gmail.com','99221','04-FEB-2012','San Pedro Laguna','09652778212');
insert into user1 values('U2','username2','user2@gmail.com','92411','02-JAN-2011','Sta.Rosa Laguna','09652778213');
insert into user1 values('U3','username3','user3@gmail.com','42114','11-SEP-2013','Paete Laguna','09652778214');
insert into user1 values('U4','username4','user4@gmail.com','43131','22-DEC-2010','Manila','09652778215');
insert into user1 values('U5','username5','user5@gmail.com','64233','13-AUG-2016','Imus Cavite','09652778216');

--PRODUCT TABLE
create table product (product_id varchar2(20) primary key,
product_name varchar2(20),
category_id varchar2 (20),
product_price number(30) not null,
product_image varchar2(20),
foreign key (category_id) references category1(category_id));

SELECT * FROM product;

insert into product values('P1','Pilsen','CAT1','100','image1.jpg');
insert into product values('P2','Dictionary','CAT3','300','image2.jpg');
insert into product values('P3','Screw Driver','CAT4','400','image3.jpg');
insert into product values('P4','Hotog','CAT2','160','image4.jpg');
insert into product values('P5','Tocino','CAT2','200','image5.jpg');

--CATEGORY TABLE
create table category1 (category_id varchar2 (10) primary key ,
category_name varchar2 (20));

SELECT * FROM category1;

insert into category1 values('CAT1','Alcohol Drinks');
insert into category1 values('CAT2','Foods');
insert into category1 values('CAT3','Books');
insert into category1 values('CAT4','Tools');



--Cart TABLE
create table cart (cart_id varchar2 (10) primary key,
user_id varchar2 (20));

SELECT * FROM cart;

insert into cart values('CART1','U1');
insert into cart values('CART2','U2');
insert into cart values('CART3','U3');
insert into cart values('CART4','U4');
insert into cart values('CART5','U5');


--Cart_items TABLE
create table cart_items (cart_items_id varchar2 (10) primary key,
cart_id varchar2(20),
user_id varchar2(20),
product_id varchar2(20),
product_qty varchar2 (20),
foreign key (cart_id) references cart(cart_id),
foreign key (user_id) references user1(user_id),
foreign key (product_id) references product(product_id));

SELECT * FROM cart_items;

insert into cart_items values('CI1','CART1','U2','P1','5');
insert into cart_items values('CI2','CART2','U2','P2','10');
insert into cart_items values('CI3','CART3','U2','P3','20');
insert into cart_items values('CI4','CART4','U1','P4','10');
insert into cart_items values('CI5','CART5','U1','P2','4');

--coupon table--
create table coupon(coupon_id varchar2(10) primary key check(coupon_id like 'CO%'),
coupon_name varchar2(20) not null,
discount_val number (10,2),
expiry_date date);

select *from coupon

insert into coupon values('CO1','Happ T Sale','0.5','22-OCT-2022');
insert into coupon values('CO2','TGIF Sale','0.4','22-OCT-2022');
insert into coupon values('CO3','BLACK MARKET','0.7','22-OCT-2022');

--orders table--    
create table orders(order_id varchar2(10) primary key check(order_id like 'O%'),
cart_id varchar2(10),
user_id varchar2(10),
order_date date default sysdate,
delivery_date date default sysdate+7,
coupon_id varchar2(10),
product_id varchar2(10),
bill_amount number(10,2),
payment_method varchar2(10),
foreign key (cart_id) references cart(cart_id),
foreign key(user_id) references user1(user_id),
foreign key (product_id) references product(product_id),
foreign key (coupon_id) references coupon(coupon_id),
constraint ck_payment_method check(payment_method in( 'COD', 'CREDIT', 'DEBIT', 'E-WALLET')));

select*from orders

insert into orders values('O1','CART1','U1','22-OCT-2022','30-OCT-2022','CO1','P1','400','COD');
insert into orders values('O2','CART2','U2','22-OCT-2022','30-OCT-2022','CO2','P2','500','COD');
insert into orders values('O3','CART3','U3','22-OCT-2022','30-OCT-2022','CO3','P4','1000','DEBIT');
insert into orders values('O4','CART4','U4','22-OCT-2022','30-OCT-2022','CO1','P5','1000','CREDIT');
insert into orders values('O5','CART5','U5','22-OCT-2022','30-OCT-2022','CO2','P3','2000','COD');











-- create table order_details(order_id serial primary key,
-- customer_id int references customer_information(customer_id) ,
-- order_date date,
-- shipping_date date,
-- status varchar,
-- total_amount real,
-- payment_method varchar,
-- billing_address text,
-- shipping_address text,
-- shipper_id int
-- )


-- create table customer_information(customer_id serial primary key,
-- first_name varchar,
-- last_name varchar,
-- email text,
-- phone text,
-- address text,
-- city varchar,
-- state varchar,
-- country text,
-- account_creation_date date
-- )

-- create table Product_Detail(product_id serial primary key,
-- product_name varchar,
-- category varchar,
-- price real,
-- stock_quantity int,
-- supplier_id int,
-- reorder_level int,
-- discontinued varchar,
-- created_at date,
-- updated_at date

-- )

-- create table sales_product(
-- sale_id  serial primary key,
-- product_id int references product_detail(product_id),
-- customer_id int references customer_information(customer_id),
-- sale_date date,
-- quantity int,
-- unit_price real,
-- discount real,
-- total_sale real,
-- salesperson_id int,
-- region varchar
-- )

-- create table employee_information(employee_id serial primary key,
-- first_name  varchar,
-- last_name varchar,
-- salary int,
-- hire_date date,
-- manager_id int,
-- city varchar,
-- state varchar,
-- country varchar
-- )


-- 1

-- select * from employee_information

-- 2

-- select * from customer_information where state='Nevada'

-- 3

-- select count(total_sale) from sales_product

-- 4

-- select * from product_detail where price > 100

-- 5

-- select first_name ||' '|| last_name as fullname ,salary from employee_information

-- 6

-- insert into product_detail values (201,'drive','food',75,23,44,23,'Yes','2025-03-03','2025-03-03')

-- 7

-- update order_details set status = 'Completed'

-- 8

-- delete from customer_information where customer_id=2

-- Intermediate Level

-- 9

-- select salesperson_id,sum(total_sale) from sales_product group by salesperson_id

-- 10

-- select product_name,quantity from product_detail p
-- join sales_product s on p.product_id=s.product_id

-- 11

-- select p.product_id,total_sale from product_detail p
-- join sales_product s on p.product_id=s.product_id
-- limit 5

-- 12

-- select * from order_details where order_date > '2023-01-01'

-- 13

-- select employee_id,first_name||' '||last_name fullname,manager_id from employee_information where employee_id in (select manager_id from employee_information)

-- 14

-- select *,max(order_date) from customer_information c
-- join order_details o on c.customer_id=o.customer_id
-- group by c.customer_id,o.order_id 

-- 15

-- select 

-- 16

-- select * from product_detail where discontinued='Yes' and stock_quantity>0

-- Advanced Level

-- 17

-- select first_name ||' '||last_name fullname,sum(total_amount) from customer_information c
-- join order_details o on c.customer_id=o.customer_id group by c.customer_id

-- 18

-- select o.*,salesperson_id from order_details o
-- join sales_product s on o.customer_id=s.customer_id

-- 19

-- select * from sales_product where discount>0.15 order by total_sale desc

-- 20

-- select avg(salary) from employee_information group by department

-- 21

-- select region,total_sale from sales_product order by total_sale desc limit 1

-- 22

-- select *from customer_information c
-- join order_details o on c.customer_id=o.customer_id
-- left join sales_product s on o.customer_id=s.customer_id
-- where  salesperson_id is null

-- 23

-- select product_id,product_name from product_detail
-- where product_id not in (select product_id from sales_product s
-- join order_details o on s.customer_id=o.customer_id)

-- 24

-- create index idx_sales_customer_id ON sale_product(customer_id);
-- create index idx_customers_customer_id ON customer_information(customer_id);

-- 25
-- select salesperson_id,sum(total_sale),rank() over (order by sum(total_sale) desc)  sales_rank
-- from sales_product
-- group by salesperson_id
-- order by sales_rank;
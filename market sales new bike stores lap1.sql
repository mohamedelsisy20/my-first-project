select * from production.brands
select * from production.categories
select * from production.products
select * from production.stocks
select * from sales.customers
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores

1- -----Find total Revenue for the Whole Organization in each Month and sorting it descending 
order

select sum (list_price) "revenu"  from sales.orders as o
inner join sales.order_items as o2 on o.order_id=o2.order_id
group by month(order_date) 
order by sum(list_price) desc

2. ---Total Number Of Orders in each Month

select count (order_id) as "numper of orders", month(order_date) as "month" from sales.orders
group by month (order_date) 


3.----- Total Number of stores, Brand, Category

select count (distinct brand_id) "total brand" ,count (distinct category_id) "total category" ,count (distinct store_id) "total stores" from production.products as p
inner join sales.order_items as o on p.product_id=o.product_id
inner join sales.orders o2 on o.order_id=o2.order_id


4---------- Monthly Sales Growth Percentage

select format(cast(sum (list_price) as float )/ count(o.order_id),'p' ) as "month groth" , month(order_date) "monthdate" from sales.orders as o
inner join sales.order_items as o2 on o.order_id=o2.order_id
group by month(order_date)

5---------Best sales Products

select top 7 count (distinct order_id) "numper of ordes",product_name from production.products as p
inner join sales.order_items as o on p.product_id=o.product_id
group by product_name
order by count (distinct order_id) desc

6------The Most Popular Brand

select count (distinct order_id) "number of orders", b2.brand_name from sales.order_items as o
 inner join production.products as p on o.product_id=p.product_id
 inner join production.brands as b2 on p.brand_id=b2.brand_id
 group by b2.brand_name 
 order by count (distinct order_id) desc

 7 ---------Top 10 Rep Persons by number of orders


 select top 10 count (order_id) "numper of orders" , concat (c.first_name,c.last_name) fullname from sales.orders as s
 inner join sales.customers as c on s.customer_id=c.customer_id
 group by concat (c.first_name,c.last_name)
 order by count (order_id) desc



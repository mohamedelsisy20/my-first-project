select * from Employee
select * from Departments
select * from Dependent
select *from Project
select * from Works_for


---------lab2------------------
select fname ,lname ,sex from Employee where Salary>1800

select dno, sum( salary) totalsalary from Employee group by dno

select dno,  min(salary) minsalary from Employee group by dno


select dno, count(ssn) numberoffemales from Employee where sex = 'f'
 group by Dno

 select dno, count(ssn) numberofemployee from Employee group by dno
 order by  count(ssn) desc


 select * from Employee where month(bdate) = 6

 select * from Employee  where Address like '%cairo%'

 select count (ssn) as countssn , dno from Employee 
group by dno
having count(ssn)>2

select Fname,Lname ,Address,ssn from Employee where dno is null

------------------------------------------------------*-----------------------------------------
------------lab3-----------
select * from Employee
select * from Departments
select * from Dependent
select *from Project
select * from Works_for

select d.Dname,d.Dname,concat( e.Fname,e.Lname) fullname from Employee as e
inner join Departments as d on e.Dno = d.Dnum
where e.SSN=d.MGRSSN


select d.Dname,p.Pname from Departments as d
inner join Project as p on d.Dnum=p.Dnum

select d.* ,concat( e.Fname,e.Lname) fullname from Dependent as d
left join Employee as e on d.ESSN =e.SSN

select Pnumber,Pname,Plocation from Project where city like '%cairo%' or city like '%alex%'

select * from Project where Pname like 'a%'

select * from Employee where Dno=30 and Salary between 1000 and 2000

select concat( e.Fname,e.Lname) fullname from Employee as e
inner join Works_for as w on w.ESSn=e.SSN
inner join Project as p on p.Pnumber=w.Pno
where w.Hours>=10 and dno= 10 and p.Pname = 'AL Rabwah'

select e.Fname ,e.Lname from Employee as e 
inner join Employee as e2 on e2.SSN =e.Superssn
where e2.Fname+' '+ e2.Lname = 'kamel mohamed'

select concat(e.fname,e.Lname)as fullname,p.Pname from Employee as e 
inner join Works_for as w on e.SSN=w.ESSn
inner join Project as p on w.Pno=p.Pnumber

order by p.Pname desc

select p.Pnumber,d.Dname,e.Lname,e.Bdate,e.Address from Employee as e 
inner join Departments as d on e.SSN=d.MGRSSN
inner join Project as p on d.Dnum=p.Dnum
where city = 'cairo' 

select * from Employee as e 
--inner join Departments as d on e.SSN=d.MGRSSN


select e.*,d.* from Employee as e
left join Dependent as d on e.SSN=d.ESSN

--------------------lab5------------------

select e.Fname ,d.Dependent_name from Employee as e
inner join Dependent as d on e.SSN=d.ESSN
where e.Sex = 'f' and d.Sex = 'f'
union all
select e.Fname ,d.Dependent_name from Employee as e 
inner join Dependent as d on e.SSN=d.ESSN
where e.Sex ='m' and d.sex = 'm'

select p.Pname , sum (w.Hours) total from Employee as e 
inner join Works_for as w on e.SSN=w.ESSn
inner join Project as p on w.Pno = p.Pnumber

group by p.Pname

select d.* from Employee as e 
inner join Departments as d on e.Dno=d.Dnum
where e.ssn in (select min(ssn) from Employee)

select d.Dname, min(e.salary) minsalary , max(e.salary) maxsalary , AVG(e.salary) avgsalary from Employee as e 
inner join Departments as d on e.Dno =d.Dnum
group by d.Dname

select e.Fname  from Departments as d
inner join Employee as e on d.MGRSSN = e.SSN
right join Dependent as d1 on e.SSN = d1.ESSN

select  count(e.ssn)as countemp,d.Dname from Employee as e
inner join Departments as d on e.Dno=d.Dnum
group by d.Dname 
having AVG (e.Salary)>(select avg(salary) from employee)

select concat(e.fname,e.Lname) fullname ,p.Pname,d.Dname from Project as p 
inner join Departments as d on p.Dnum = d.Dnum
inner join Employee as e on e.Dno = d.Dnum
order by dno asc


select max (salary) maxsalary from Employee 
 where Salary not in (select max(salary) from Employee) 

  select fname from Employee
 intersect
 select Dependent_name  from Dependent


  update   
 e
 set e.salary = e.salary + e.salary*0.3
 from Employee as e
 left join  Works_for  as d on e.SSN=d.ESSN 
 left join Project as p on d.pno=p.Pnumber
 where p.pname='AL Rabwah'
 -----------------------------------------------------------------------------------------

 --------------------lab7--------------------------
 select dno, count(ssn) as countemp from employee group by dno

select distinct fname from employee

select isnull(fname,'noname')as fname from Employee

select coalesce(fname,lname,'noname') as [name] from Employee

select concat(e.fname,e.Lname) as fullname, d.Dname from Employee as e 
left join Departments as d on e.Dno=d.Dnum 

select concat(e.fname,e.Lname)as fullname,p.Pname from Employee as e 
inner join Works_for as w on e.SSN=w.ESSn
inner join Project as p on w.Pno=p.Pnumber

select dnum, count(pnumber) as countpno from Project group by Dnum

select max(salary) as maxsal,min(salary) as minsal from Employee

select concat(e.fname,e.Lname)as fullname,d.Dname  from Employee as e 
inner join Departments as d on e.Dno=d.Dnum
where Salary > (select AVG(salary) from Employee)

select min(e.salary) as minsal,d.Dname,e.Fname from Employee as e 
inner join Departments as d on e.Dno= d.Dnum
group by d.Dname,e.Fname

select fname,dno ,min (salary)as salary from Employee 
group by Fname,dno

select d.Dname,e.fname,e.Salary from Employee as e
inner join Departments as d on e.Dno=d.Dnum
where e.salary  in (select Min(salary) from Employee)



----------------------------rank , iff,case when ----------------------------------------------------

select * ,row_number() over (order by salary desc )as rn from Employee 

select *,DENSE_RANK () over (order by salary desc) as rn from Employee

select *, rank () over (order by salary desc ) as rn from Employee 

with cte as (
 select * ,row_number() over (order by salary desc )as rn from Employee 
)

select * from cte where rn = 2


with cte as (
select * ,ROW_NUMBER () over (order by salary asc )as rn  from Employee 
)
select * from cte where rn =2


with cte as (
select*, ROW_NUMBER () over (partition by dno order by salary desc) rn from Employee
)
select * from cte where rn =2




select *, ntile (4) over (partition by dno order by salary desc) rn from Employee

select * ,
                case when salary >= 3000 then 'high'
				     when salary >=1500 then  'medim'
					 when  salary < 1500 then 'low'
					 else  null
					 end
					 from Employee
					 
					 
				
select * ,iif(salary>2500,'high','low') as category from Employee
----------------------------view--------------------------------------------------------

create view v_clerkk as 
select p.Pname,concat( e.Fname,e.Lname) fullname ,d.[MGRStart Date] from Employee as e 
inner join Departments as d on e.SSN=d.MGRSSN
inner join Project as p on d.Dnum =p.Dnum

select * from v_clerkk

create view v_without_budgett as 
select * from Project 

select * from v_without_budgett

create view v_project_Gizaa as 

select * from v_without_budgett where City = 'giza'


select * from v_project_Gizaa

alter view v_without_budgett as 

select * from Project where Pname like 'al%'

select * from v_without_budgett



select dno, max(salary) maxsalary  from Employee group by dno 

order by max(salary) desc


with cte as (

select * , ROW_NUMBER() over (partition by dno order by salary desc) as rn  from Employee 
)

select fname from cte where rn = 1



with cte as (
select *, dense_rank () over ( partition by dno order by salary desc ) as rn from Employee
)
select fname from cte where rn = 2



select * ,

            case when salary > 6000 then 'high'
			     when salary >= 6000 then 'medim'
				 when salary <=3000 then 'low'
				 else null
				 end 
				 as catgeory  from Employee 



select * from Project

update Project set City = 'cairo' where City = 'giza'


--------------------------------stored procedure----------------------------
select * from production.brands
select * from production.categories
select * from production.products
select * from production.stocks
select * from sales.customers
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores
 

 -----Show all product_id, brand_id, product_name, category_id from production.products in descending order listprice

 create procedure product1 
 as 
 begin
 select product_id , brand_id,product_name,category_id , list_price from production.products
 order by list_price desc
 end

 exec product1

 ------top 7 count(c.customer_id) "numper of customer" ,b.brand_name  order by count(c.customer_id) desc


 create procedure brand1
 as 
 begin 
 select top 7 count(c.customer_id) "numper of customer" ,b.brand_name from sales.customers as c 
 inner join sales.orders as o on c.customer_id=o.customer_id
 inner join sales.order_items as it on o.order_id=it.order_id
 inner join production.products as p on p.product_id= it.product_id
 inner join production.brands as b on p.brand_id =b.brand_id
 group by b.brand_name 
 order by count(c.customer_id) desc
 end 

 exec brand1


 --------
 create procedure product1 (@min_listprice  int )
as 
begin 
select list_price ,product_name ,category_id from production.products
where list_price>=@min_listprice
order by list_price desc

end 

exec product1 3000


------------
alter procedure product (@min_listprice as int, @max_listprice as int )
as 
begin 
select list_price ,product_name ,category_id from production.products
where list_price between @min_listprice and @max_listprice
order by list_price desc

end 

exec product 5000 ,11000



----------------
alter procedure product (@min_listprice  int, @max_listprice  int
,@name as varchar(50))
as 
begin 
select list_price ,product_name ,category_id from production.products
where list_price between @min_listprice and @max_listprice and product_name like '%trek%'
order by list_price desc

end 

exec product 0 ,11000 ,'trek'

-----------------
alter procedure product (@model_years int
, @count_porduct  int output)
as 
begin
select list_price ,product_name from production.products
where model_year =@model_years

select @count_porduct = @@ROWCOUNT
end 


declare @count as int
exec product  
@model_years = 2018, 
@count_porduct = @count output
select  @count AS "NUMER OF ROW"


------insert into

create procedure updatesales_stores (@id int,@name varchar (20),@salary int ,@dno int , @address varchar (30))
as 

begin
insert into employee (id,name,salary,dno,address) values (@id,@name,@salary,@dno,@address)
end

exec updatesales_stores  @id=6 ,@name = ahmed ,@salary =2000,@dno=10, @address = shipin 
--------------------------------
create procedure updat1esales_stores (@id int,@name varchar (20),@salary int  , @address varchar (30))
as 
begin
update employee
set 
name =@name,
salary =@salary,
address =@address

where id=@id 
end

exec updat1esales_stores
 @name = abrahim,
@salary = 2500,
@address =elkafr,
@id=1


create procedure DailyTransaction @from date, @to date 
as
select count(f.OrderNumber) as #OFOrders ,s.StoreName ,R.RepName  from FactSales as f 
left join DimStore as s on f.StoreId=s.StoreID
left join DimRep as R on f.RepId=R.RepID
where convert(date,TransactionDateTime) between @from and @to
group by s.StoreName,R.RepName

exec DailyTransaction '2023-02-02','2023-02-03'



-------------------functions-----------------------------------------

alter function np1no2 (@np1 int ,@np2 int)
returns int
as 
begin 

return @np1*@np2

end

select dbo.np1no2  (9,5) multblynp1np2


alter function nameemp (@id int)
returns varchar (30)
as 
begin
                     declare @name varchar (30)
					 select @name = Fname from Employee where ssn =@id
					 return @name
end


select dbo.nameemp (102672) name


select* from Employee

alter function name1 (@id int)
 returns varchar(30) 
 as
 begin 
        declare @name varchar(20)
        select @name= product_name  from production.products where product_id=@id 
		return @name
		end


		select dbo.name1 (1) as name

alter function emp33 (@id int)
returns table 
as
return 
select * from Employee where ssn = @id



select * from dbo.emp33 (102660)


-------------------
select * from production.products
select * from sales.customers
declare @count int 
 select @count =5 

  select @count as number

  declare @modelyear int
  select  @modelyear =2018
  select  @modelyear 

  -----------bulit in function -----

  ----1-agregate function 

  count , max , min , avg ,

 ----- string function

 lower , upper , len , SUBSTRING
 select * from sales.customers

 select lower(first_name),lower(last_name) from sales.customers

select upper(first_name),upper(last_name) from sales.customers

select len(first_name),len(last_name) from sales.customers
 
 select street, substring (street, 0 ,5) from sales.customers

 ------date function -------


getdate , datediff ,dateadd , month,year ,day

select getdate()

declare @firstdate date = '1996/7/1'
declare @secounddate date = '1996/7/10'

--select datediff(day, @firstdate,@secounddate )

select dateadd (year,5,@firstdate)

select * from sales.orders

select*, dateadd(day,5,order_date) as shipdate from sales.orders
-----------------------------------------
select * from production.products
select * from sales.customers

------------ user definet function---(sclare)

alter function nm1nm2 (@nm1 decimal ,@nm2 decimal) 
returns int
as
begin

 return @nm1 +@nm2

 end
  
  select dbo.nm1nm2 (6.5,20)

  alter function vat (@n1 float, @n2 float )
  returns int 
  as 
  begin
 return @n1 * @n2

 end

 select dbo.vat (500,0.15) as vat 

 select product_id, brand_id, dbo.vat(list_price,0.15) vat, dbo.vat(list_price,0.15)+(list_price) totallist
 from production.products

 -------------------------------------------


 select * from production.products
 
alter function name1 (@id int)
 returns varchar(30) 
 as
 begin 
        declare @name varchar(30)
        select @name= product_name  from production.products where product_id=@id 
		return @name
		end


		select dbo.name1 (1) as name

		select brand_id ,category_id ,dbo.name1(2) from production.products


------------ function table		--------------------------------------------------------------


create function table_product (@id int) 
returns table
as 
return
select * from production.products where product_id=@id

 
select * from dbo.table_product (1)
--------------------------------
create function sms(@id int)
returns varchar(max)
begin 
declare @sms  varchar(max)
declare @firstname varchar(max)
declare @lastname varchar(max)

select @firstname=Fname   From hR.Employee where SSN=@id
select @lastname=Lname From HR.Employee where SSN=@id

if @firstname is null and @lastname is null 
select @sms='FirstName and last name are null'
if @firstname is null
select @sms='First name is null'
if @lastname is null 
select @sms='Lastname is null'
else 
select @sms='First name and last name are not null'
return @sms 
end
-------------------------------------trigger
create trigger t5
on employee instead of update 
as 
select 'you cant update now'


update employee set salary =2000 where dno=10

disable trigger t5 on employee
enable trigger t5 on  employee
drop trigger t5  



SELECT 
    ssn, 
    Salary, 
    Salary - LAG(Salary) OVER (ORDER BY ssn) AS SalaryDifference
FROM Employee;

select * from Employee

SELECT 
    dno, 
    ssn, 
    Salary,
    LAG(Salary) OVER (PARTITION BY dno ORDER BY ssn) AS FirstSalaryInDepartment,
    LEAD(Salary) OVER (PARTITION BY dno ORDER BY ssn ) AS LastSalaryInDepartment
FROM Employee;

select * from production.brands
select * from production.categories
select * from production.products
select * from production.stocks
select * from sales.customers
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores

with cte as (
select datediff (day ,order_date,shipped_date) as date1 from sales.orders
)
select avg(date1) avg from cte

select*, dateadd(day,5,order_date) as shipdate from sales.orders

--------------------------------------------------------------------------------------
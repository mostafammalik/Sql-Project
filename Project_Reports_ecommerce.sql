CREATE OR ALTER PROCEDURE InsertProduct  ----- INSERT PRODUCT
      @id int ,@name varchar(250) ,@qnt int ,@x_dt date ,@p_dt date ,@c_id int ,@price int 
	  as
BEGIN
    INSERT INTO product(id, name, quantity ,dt_exp ,prod_date ,id_catagry ,price)
	VALUES             (@id ,@name ,@qnt ,@x_dt ,@p_dt ,@c_id ,@price);
END; 

go
select * from product 
go
create OR ALTER procedure insertCategory  @cat_name nvarchar(250) ---- INSERT CATEGORY
as
begin  
insert into categry values(@cat_name)
end 
go
create or alter proc insertAdmin
@name varchar(50) ,@email varchar(50) ,@rule varchar(20)
as  
 
insert into admin values(@name,@email,@rule) ; 

--exec insertAdmin 'gehad' ,'gehad123@gmail.com' ,'full admin' 
go
create or alter proc insertCustomer
@ssn int ,@fname varchar(50) ,@lname varchar(50) ,@gen char(10) 
as
insert into customer values(@ssn ,@fname ,@lname ,@gen) ; 
go
create or alter proc insertstuff 
@name varchar(20) ,@supplierid int ,@role varchar(20) 
as 
insert into stuff values(@name ,@supplierid ,@role) -- id use identity incremental
go 

create or alter proc insertSupplier 
@name varchar(50) ,@url varchar(50) 
as 
insert into supplier values(@name ,@url)
go 
create or alter proc insertvehcle 
@name varchar(50) ,@url varchar(50) 
as 
insert into supplier values(@name ,@url)
go 


------------------------------------END OF INSERTION PROCEDURES--------------------------------------


create OR ALTER procedure update_product ---- update price of product
@newprice int ,@id int 
as
begin  
update product set price =@newprice where product.id =@id
end 
GO
create or alter view Count_number_of_products_for_each_category ---- count products for each category 
 AS  
select C.name , count(*)   as  number_of_products from product p  join categry C on p.id_catagry =C.id 
group by p.id_catagry , C.name
select * from Count_number_of_products_for_each_category 


 create or alter proc test 
 as 
 select * from Count_number_of_products as number_products



 -------------------------------------------------- sum total prices over the system -------------- 
 declare SumTotalPrice Cursor 
 for 
 select price  from product
 declare @total int =0 , @bigtotal int =0; 
 open SumTotalPrice 
 fetch SumTotalPrice into @total 
 while @@FETCH_STATUS =0 
 begin  
	set @bigtotal=@total +@bigtotal 
	fetch SumTotalPrice into @total 
 end  
 select  @bigtotal
 close SumTotalPrice 
  deallocate SumTotalPrice  
   declare SumCapital Cursor 
 for 
 select price  ,quantity from product go
 declare @price int =0 ,@qnty int  ,  @bigtotal int=0; 
 open SumCapital 
 fetch SumCapital into @price ,@qnty 
 while @@FETCH_STATUS =0 
 begin  
	set @bigtotal=@price*@qnty +@bigtotal  
	 
	fetch SumCapital into @price ,@qnty
 end      
 select 'the capital = '+ CONVERT( varchar(20),@bigtotal )
 close SumCapital 
 deallocate SumCapital  
 go 

  create or alter PROC cal_the_Capital_for_each_suplier  ---capital =راس المال----------------------------------
  as
 select sr.name , sum(p.price*p.quantity) as capital
 from product p join supply sp on sp.id_prod=p.id 
 join supplier sr on sr.id =sp.id_supplier
 group by sr.name     
  go
 declare Update_price_by_10percentage Cursor  --------------------------------------------------------------------
 for 
 select price  from product
 declare @price int =0 ; 
 open Update_price_by_10percentage 
 fetch Update_price_by_10percentage into @price 
 while @@FETCH_STATUS =0 
 begin  
	update product set price +=@price*0.1 where current of Update_price_by_10percentage
   fetch Update_price_by_10percentage into @price 
	 
 end   
 select 'after update by 10 %'
 select  * from product
 close Update_price_by_10percentage 
 deallocate Update_price_by_10percentage  
 ----------------------------- count number of expired product using cursor ---------------- 
 
 create or alter proc Expire_products 
 as 
 select count(*) as number_expire from product where GETDATE()>product.dt_exp 
 select *from product where GETDATE()>product.dt_exp 


 ---------------------------- total salary for each prudct ---------------------------- 

 select *from product 
 select *from contain 

 -------------------------------------calc total salary for each order---------------------
 create table Order_price (orderid int ,total int)   
 delete from Order_price
 go

 declare  total_sal_c cursor
 for
  select  id_product , id_order , [number_of_unites] from contain c    
  declare @pid int ,@oid int ,@unites int  ,@pr int
   
  open total_sal_c 
 fetch next from total_sal_c into @pid ,@oid,@unites  
 while @@FETCH_STATUS =0 
 begin  
-- select @unites*(select price from product where product.id =@pid) 
  --SET @pr = (SELECT price FROM product WHERE id = @pid)
	if ((select count(*) from Order_price where orderid =  @oid)=0 ) 
	begin  
			
			select @pr = price from product  where id = @pid
			insert into Order_price(orderid,total) values (@oid ,@unites*@pr) 
	end
	else  
	begin
		update Order_price set total =total +@pr where orderid =@oid
	end
   fetch total_sal_c into @pid ,@oid,@unites 
 end
 select * from Order_price  
 select *from contain
 select id ,price from product --314.6
 close total_sal_c 
 deallocate total_sal_c
 ----------------------------- view calculates total salary for each order- --------------------
create or alter view Calctotalsalfororder 
as
 SELECT c.id_order, SUM(p.price * c.number_of_unites) AS total_order
FROM product p
JOIN contain c ON p.id = c.id_product
GROUP BY c.id_order; 
select * from  Calctotalsalfororder
----------------------------------------end of view---------------------------------------------






go

------------------------------------ view show each supplier and his products---------------------
create or alter view count_number_of_products_for_each_supplier 
as
select sp.name  ,sum( (s.id_prod)) as number_of_products from supply s join supplier sp 
on s.id_supplier =sp.id

group by sp.name 

select* from count_number_of_products_for_each_supplier
---------------------------------------------------end view----------------------------------------
go

----------------------------best seller product in orders------------------------------------- 
create or alter view Best_seller_Product
as
SELECT TOP 1 WITH TIES c.id_product ,p.name , SUM([number_of_unites]) AS total_units_sold
FROM contain c join product p 
on c.id_product =p.id
GROUP BY c.id_product ,p.name 
ORDER BY total_units_sold DESC; 
select * from Best_seller_Product
----------------------------------------end of view ----------------------------------------------- 


------------------------- 
create or alter proc get_best_seller_products 
as
select *from(
select p.name,Dense_Rank()  over(order by num ber_of_unites desc)as RN
from contain c join product p on c.id_product =p.id  )as newtable where RN <=3



use [e-commerce]
select tomer.fname ,  p.id ,p.name ,w.name ,sp.name ,v.ssn as number_of_car , v.color  
 
from website w join supplier sp 
on w.url =sp.url_web 
join supply s on s.id_supplier =sp.id
join product p on p.id =s.id_prod 
join vehichle v on v.Suplier_id =sp.id  
join contain c on c.id_product =p.id 
join customer tomer on tomer.ssn =c.customer_id

 


-------------------------------count number of vechels for each suplier------------------------------ 

create or alter proc Number_of_Vehclies 
as 
select  sp.name , count(*) as number_of_cars from vehichle v join supplier sp 
on v.Suplier_id =sp.id 
group by  sp.name


-------------------------------------------------------------triggers ----------------------------------------- 


create trigger preventDeleteAdmin  
on admin
instead of delete 
as
select 'You Cannot delete admin? are you stupid'


create or alter trigger updateProductPrice 
on product 
after update 
as
if UPDATE(price) 
begin  
	declare @price int ,@newprice int 
	 select @newprice =ins.price   from inserted  ins  
	 select @price =ins.price   from deleted  ins  
 
	 if(@newprice-@price  > (@price/2)) 
	 begin 
		select 'you cannot to increase price over 50% ' 
		rollback
	 end
	 else
	 begin 
		select 'old price = ' + convert(varchar ,@price)+'\n'+'new price = '+convert(varchar,@newprice)
	 end
end 
update product set price =300 where id =1
select * from product




































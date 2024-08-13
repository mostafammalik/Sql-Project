-----------------------------------1st-----------------------------------------------------
insert into  [dbo].[order]
(date,totalprice ,[id_tracking] ,[payment_method]) 
values(CONVERT(Date, GETDATE()) ,0,1,'Cash')
select* from product 
select * from contain
select * from Orders
insert into contain values(1,1)
insert into contain values(2,1)
insert into contain values(3,1)
insert into contain values(7,3)
insert into contain values(5,3)
insert into contain values(8,3)
insert into contain values(1,2)
insert into contain values(2,2)
insert into contain values(3,1)
insert into contain values(5,2)
insert into contain values(7,3)
insert into contain values(8,2) 

----------------------------- get total price of the order-------------------------------------
select  c.id_order as 'order Id ',sum(p.price)  
from product P join contain C 
on p.id =C.id_product group by c.id_order 
------------------------end-----------------------------------------------------  



------------------------------- select the content of any order--------------------------------
select p.name ,p.price , c.id_product
from product p    join contain c
on p.id =c.id_product where c.id_order = 2
-------------------------------------------------------------------------------------------- 


-----------------------------show every product and all of its supplier----------------
insert into supply values(1,1)
insert into supply values(3,1)
insert into supply values(2,1)
insert into supply values(8,9)
insert into supply values(8,11)
insert into supply values(8,10)

insert into supply values(7,8)
insert into supply values(7,7)
insert into supply values(3,10)
insert into supply values(1,9)
insert into supply values(1,11)
insert into supply values(1,10)


select * from admin 
SELECT *FROM supplier
select *from product 

select p.name as Product_Name ,SS.name as supplier_name
from supply s  right join product p  
on s.id_prod =p.id right join supplier SS 
on SS.id = s.id_supplier
----------------------------------end--------------------------------------- 
select * from stuff  
alter table stuff add  role nvarchar(200)  
update stuff set role  ='Accountant' where id %2 =1
---------------------------show stuff and there suppliers------------------
select * from supplier 
select st.name , sp.name from stuff st join supplier sp 
on st.supplier_id =sp.id 
------------------------------------end------------------------------------ 
-------------------show all vehiche and its driver and supplier to which belong--------
select  V.ssn ,V.color , st.name as stuff_name , sp.name as supplier_name
from vehichle V join stuff st on V.id_staff =st.id 
join supplier sp on sp.id = V.Suplier_id
-------------------------------end----------------------------------------------------









  
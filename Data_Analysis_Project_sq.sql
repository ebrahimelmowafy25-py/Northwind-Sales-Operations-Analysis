create database Northwind


select * from orders
select count (orderID)
from orders
select customerId, count (customerID) as numberoforders
from orders
group by customerid 
order by count (customerid) desc

select * from order_details
select * from products
select productName, sum (quantity) As total_quantity from order_details
join products on order_details.productID = products.productID
group by  productName
order by sum (quantity) desc
select * from order_details
select * from products
select * from categories

select categoryName , sum (order_details.unitprice*quantity*(1-discount)) As total_sales from order_details
join products on order_details.productID = products.productID join categories on products.categoryID = categories.categoryID
group by categoryName
order by sum (order_details.unitprice*quantity*(1-discount)) desc

select * from orders
select count (employeeID) as number_of_orders  , employeeID from orders
group by employeeID
order by count (employeeID) desc
select count (*) As cancelled_orders
from orders 
where shippedDate Is null

select count (*)
from orders
where shippedDate > requiredDate
 
select count (shipping_status) As number_of_orders , shipping_status
from (
 select 
 Case
    when shippedDate is Null then 'unshipped'
    when shippeddate > requireddate then 'late'
    Else 'ontime'

 End as shipping_status
 From orders)
As x
Group by shipping_status


select (employeeId) , count (employeeID) as number_of_orders 
from orders 
group by (employeeId)
having count (employeeId) > 100










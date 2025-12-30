--  CASE STUDY ON SMARTPHONES DATASET
-- Create Database 
Create Database mydb;
USE mydb;

-- Import data
-- Show Data  
select * from smartphones;

-- QUESTIONS 

-- Q.1  Find top 5 samsung phones with biggest screen size?
select model,screen_size from smartphones
where brand_name = 'samsung'
order by screen_size desc
limit 5;

-- Q.2  Sort all the phone with in descending order of number of total cameras?
select model, num_rear_cameras+num_front_cameras as 'Total_Cameras'  from smartphones
order by Total_Cameras desc;

-- Q.3  Sort data on the basis of ppi in des order ? 
select model, (sqrt(resolution_width*resolution_width+resolution_height*resolution_height)/screen_size) as 'ppi' from smartphones
order by ppi desc;

-- Q-4 Find the phone with 2nd largest battery?
select model, battery_capacity from  smartphones
order by battery_capacity
limit 1,1;

-- Q.5 Find the name and rating of the worst rated apple phone?
select model ,rating from smartphones
where brand_name = 'apple'
order by rating asc
limit 1;

-- Q.6 Sort phones alphabetically and then on the basis of rating in desc order ?
select brand_name,rating from smartphones
order by brand_name asc,rating desc;

-- Q.7 Sort phone alphabetically and then on the basis of price in asc order?
select * from smartphones
order by brand_name asc, price desc;

--  GROUP BY 
-- Q.1 Group smartphones by brand and get the count, average price, max rating , avg screen_size , and avg battery capacity ?
select brand_name , count(*) , avg(price) , max(rating) , avg(screen_size) , avg(battery_capacity) 
from smartphones
group by brand_name ; 

-- Q.2 Group smartphones by whether they have a NFC and get the average price and rating?
select has_nfc,avg(price) as 'Price',avg(rating) as 'rating' from smartphones
group by has_nfc;


-- Q.3 Group smartphones by the extended memory available and get the avg price?
select extended_memory_available ,avg(price) 
from smartphones
group by extended_memory_available ;

-- Q.4 Group smartphones by the brand and processor brand and get the count of models and the avg primary camera resolution (rear)?
select brand_name,processor_brand , avg(primary_camera_rear) as 'avg_cameras'
from smartphones
group by brand_name,processor_brand ;

-- Q.5 Find top 5 most costly phone brand?
select brand_name , avg(price) as 'price'
from smartphones
group by brand_name
order by price desc
limit 5;

--  Q.6 Which brand makes the smallest screen size smartphone ?
select brand_name , avg(screen_size) as 'screen_size'
from smartphones
group by brand_name
order by screen_size asc
limit 1;

-- Q.7 Avg price or 5g phone vs avg price of non 5g phones?
select has_5g , avg(price) as 'price'
from smartphones
group by has_5g;

-- Q.8 Group smartphones by the brand and find the brand with the highest number of model that have both nfc and ir blaster       
select brand_name,count(*) as'count'
from smartphones
where has_nfc = 'True' and has_ir_blaster = 'True'
group by brand_name;


-- Q.9 Find all samsung 5g enabled smartphones and find out the avg price for nfc and non-nfc phones?
select has_nfc ,avg(price) 
from smartphones
where brand_name = 'samsung' 
group by has_nfc;

-- Q.10 Find the avg rating name, price of the costliest phone?
select brand_name , rating ,price
from smartphones price
order by price
limit 5;



-- HAVING CLAUSE 
-- Q.1 Find the avg rating of smartphones brand which have more than 20 phones?
select brand_name , count(*) as 'count' , avg(price) as 'price'
from smartphones
group by brand_name
having count > 20 
order by price;


-- Q.2 Find the top 3 brand with the highest avg ram that have a refresh rate of at least 90hz and fast charging available and dont cosider brands 
-- which have less than 10 phones
select brand_name , count(*) as 'count' ,avg(ram_capacity)
from smartphones
where fast_charging <= 90
group by brand_name
having count <10;
-- select * from smartphones;  

-- Q.3 Find the avg price of all the phone brand with avg rTING > 70 AND num_phones more than 10 among all 5g enabled phones?
select brand_name , count(*) as 'count' , avg(price)
from smartphones
where has_5g = 'True'
group by brand_name 
having avg(rating) >70 and count>10;





     
 



   

 

 
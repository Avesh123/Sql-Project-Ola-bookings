Create database Ola
use Ola

--- 1. Retrieve all successful bookings:

select * from bookings where booking_status = 'Success'

--- 2. Find the average ride distance for each vehicle type:

select vehicle_type,avg(ride_distance) as [Average Ride Distance] from bookings
group by vehicle_type



--- 3. Get the total number of cancelled rides by customers:


select booking_status,count(*) as [Total Counts] from bookings 
where booking_status = 'canceled by customer'
group by booking_status

--- 4. List the top 5 customers who booked the highest number of rides:


select Top 5 customer_id,count(*) as [Total Bookings] from bookings
group by customer_id
order by [Total Bookings] desc


--- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

select canceled_Rides_by_Driver,count(*) as [Total cancelled Rides] from bookings
where canceled_Rides_by_Driver = 'Personal & car related issue'
group by canceled_Rides_by_Driver


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

select Vehicle_Type,max(driver_ratings) as [Max Rating], min(driver_ratings) as [Min Rating] from bookings
where Vehicle_Type = 'prime sedan'
group by Vehicle_Type

-- 7. Retrieve all rides where payment was made using UPI:

select * from bookings
where payment_method = 'UPI'

-- 8. Find the average customer rating per vehicle type:

select vehicle_type,avg(customer_rating) as [Rating] from bookings
group by vehicle_type

-- 9. Calculate the total booking value of rides completed successfully:

select sum(booking_value) as [Total Booking value] from bookings
where booking_status = 'Success'

-- 10. List all incomplete rides along with the reason:

select booking_id,incomplete_rides_reason from bookings 
where incomplete_rides = 'Yes'

-- 11. What is the average VTAT for each vehicle type


select vehicle_type,avg(v_tat) as [Average of V_TaT] from bookings
group by vehicle_type

-- 12. Which pickup location has the highest number of bookings

select Top 1 pickup_location,count(*) as [Total Booking] from bookings
group by pickup_location
order by [Total Booking] desc


---- 13. What is the average CTAT for each vehicle type
select vehicle_type,avg(c_tat) as [Average of C_TaT] from bookings
group by vehicle_type


------ 14. Total Revenue for vehicle Type 
 
select Vehicle_Type,sum(booking_value) as [Total Amount]
from Bookings
group by Vehicle_Type
order by [Total Amount] desc

------ 15. Total Revenue for Payment method

select Payment_Method,sum(booking_value) as [Total Amount]
from Bookings
group by Payment_Method
order by [Total Amount] desc

--- 16. Which payment method is most popular among customers with rides marked as incomplete

select Payment_Method,
count(Booking_ID) as Total_count
from Bookings
where incomplete_rides = 'Yes'
group by Payment_Method
order by Total_count desc

----17. List customers who rated drivers 3 exactly 2 times
with low_rating as
(
	select 
	customer_id,
	count(Customer_ID) as low_rating_count
	from Bookings
	where Driver_Ratings <= 3
	group by Customer_ID
)
select * from low_rating
where low_rating_count = 2

-----18.  Which pickup locations have the highest number of cancelled rides by customers? 

select * from bookings

select Top 1 pickup_location,
count(booking_id) as Total_Count
from bookings
where Canceled_Rides_by_Customer is not null 
and Canceled_Rides_by_Customer <> ''
group by Pickup_Location
order by Total_Count desc

----19.  Which days of the week have the highest number of incomplete rides and what are the common reasons?

select 
Datename(weekday,Date) as Booking_day,
count(booking_id) as Incomplete_Ride_count,
incomplete_rides_reason
from Bookings
WHERE incomplete_rides = 'Yes'
group by Datename(weekday,Date),incomplete_rides_reason
order by Incomplete_Ride_count desc






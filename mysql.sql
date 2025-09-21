SELECT * FROM indrive2;
use cab;

# 1. List all completed rides.
SELECT *
FROM indrive2
WHERE Booking_Status = 'Completed';


#2. Show all rides booked with **UPI payment**
SELECT *
FROM indrive2
WHERE Payment_Method = 'UPI';

#3. Find all rides where the **vehicle type** was 'Auto'.
SELECT *
FROM indrive2
WHERE Vehicle_Type = 'Auto';

#4. Find the total number of rides booked by each 'Vehicle Type'.
SELECT 'Vehicle_Type',
COUNT(*) AS total_rides
FROM indrive2
GROUP BY 'Vehicle Type';

#5. Calculate the **average booking value** for completed rides
SELECT AVG(Booking_Value) AS avg
FROM indrive2
WHERE Booking_Status = 'Completed';

#6. Find the **maximum ride distance** travelled.
SELECT max(Ride_Distance) AS longest_ride
FROM indrive2;

#7. Get the top 5 customers who spent the most on bookings.

SELECT Customer_ID,sum(Booking_Value) AS total_spent
FROM indrive2
WHERE Booking_Status = 'Completed'
GROUP BY Customer_ID
ORDER BY total_spent desc
LIMIT 5;

# 8. Show the **most common reason** for customer cancellations

SELECT Reason_for_cancelling_by_Customer, COUNT(*) AS frequency
FROM indrive2
WHERE Cancelled_Rides_by_Customer > 0
GROUP BY Reason_for_cancelling_by_Customer
ORDER BY frequency DESC
LIMIT 1;


#9. Find the driver rating vs customer rating difference for each ride..
SELECT Booking_ID, Driver_Ratings, Customer_Rating, ('Customer_Rating''Driver_Ratings') AS rating
FROM indrive2
WHERE Driver_Ratings IS NOT NULL AND Customer_Rating IS NOT NULL;

# 10. Find the **busiest pickup location** (most rides started from there)

SELECT Pickup_Location ,COUNT(*) AS total_rides
FROM indrive2
GROUP BY Pickup_Location
ORDER BY total_rides DESC
LIMIT 5;


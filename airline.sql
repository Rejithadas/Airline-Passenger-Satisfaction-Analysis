
SELECT * FROM airline;

--Total Passengers of Maven AirlinesSELECT COUNT(ID) AS Total_PassengersFROM airline;

--Total_Passengers by gender
SELECT Gender,COUNT(ID) AS Total_Passengers 
FROM airline 
GROUP BY Gender;

--Total_Passengers by Customer type 
SELECT Customer_Type,COUNT(ID) AS Total_Passengers 
FROM airline 
GROUP BY Customer_Type;

--Total_Passengers by Type of Travel
SELECT Type_of_Travel,COUNT(ID) AS Total_Passengers 
FROM airline 
GROUP BY Type_of_Travel;

--Total Passengers categorised based on airline class
SELECT Class,COUNT(ID) AS Total_Passengers 
FROM airline 
GROUP BY Class;

--Total_Passengers by Satisfaction 
SELECT Satisfaction,COUNT(ID) AS Total_Passengers 
FROM airline 
GROUP BY Satisfaction;

--Analysis of passenger satisfaction by type of travel
SELECT Satisfaction,Type_of_Travel,COUNT(ID) AS Total_Passengers 
FROM airline 
GROUP BY Satisfaction,Type_of_Travel;

-- Total Passengers travelling for Business purpose
SELECT COUNT(ID) AS Total_Passengers 
FROM airline 
WHERE Type_of_Travel='Business';

--Analysis of Passengers' Satisfaction When Traveling for Business purpose
SELECT Satisfaction,COUNT(ID) AS Total_Passengers 
FROM airline
WHERE Type_of_Travel='Business'
GROUP BY Satisfaction;

-- Total Passengers travelling for Personal purpose
SELECT COUNT(ID) AS Total_Passengers 
FROM airline 
WHERE Type_of_Travel='Personal';

--Analysis of Passengers' Satisfaction When Traveling for Personal purpose
SELECT Satisfaction,COUNT(ID) AS Total_Passengers 
FROM airline 
WHERE Type_of_Travel='Personal'
GROUP BY Satisfaction;

--The satisfaction patterns for personal-purpose passengers based on customer type.
SELECT Customer_Type,Satisfaction,COUNT(ID) AS Total_Passengers 
FROM airline 
WHERE Type_of_Travel='Personal'
GROUP BY Satisfaction,Customer_Type;

--The satisfaction patterns for business-related passengers based on customer type
SELECT Customer_Type,Satisfaction,COUNT(ID) AS Total_Passengers 
FROM airline 
WHERE Type_of_Travel='Business'
GROUP BY Satisfaction,Customer_Type;

--Maximun age of airline passenger
SELECT MAX(Age) FROM airline;

--Minimum age of airline passenger
SELECT MIN(Age) FROM airline;

--Total passengers by age group
SELECT COUNT(ID) AS Total_Passengers,
(CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior' 
END) AS Age_Group
FROM airline 
GROUP BY 
(CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior'  
END)
ORDER BY Total_Passengers DESC;

--Satisfied passengers by age group and class
SELECT COUNT(ID) AS Total_Passengers,Class,
(CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior' 
END) AS Age_Group
FROM airline 
WHERE  Satisfaction='Satisfied'
GROUP BY 
(CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior'  
END),Class
ORDER BY Class,Total_Passengers DESC;


--Disatisfied passengers by age group and class
SELECT COUNT(ID) AS Total_Passengers,Class,
(CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior' 
END) AS Age_Group
FROM airline 
WHERE  Satisfaction='Neutral or Dissatisfied'
GROUP BY 
( CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior'  
END),Class
ORDER BY Class,Total_Passengers DESC;

--Average ratings given by passengers for various Maven Airline services
--Departure_and_Arrival_Time_Convenience
SELECT ROUND(AVG(Departure_and_Arrival_Time_Convenience),2) AS Avg_Departure_and_Arrival_Time_Convenience 
FROM airline;

--Ease_of_Online_Booking
SELECT ROUND(AVG(Ease_of_Online_Booking),2)AS Avg_Ease_of_Online_Booking 
FROM airline;

--Check_in_Service
SELECT ROUND(AVG(Check_in_Service),2) Avg_Check_in_Service 
FROM airline;

--Online_Boarding
SELECT ROUND(AVG(Online_Boarding),2) Avg_Online_Boarding 
FROM airline;

--Gate_Location
SELECT ROUND(AVG(Gate_Location),2) Avg_Gate_Location 
FROM airline;

--On_board_Service
SELECT ROUND(AVG(On_board_Service),2) Avg_On_board_Service 
FROM airline;

--Seat_Comfort
SELECT ROUND(AVG(Seat_Comfort),2) Avg_Seat_Comfort 
FROM airline;

--Leg_Room_Service
SELECT ROUND(AVG(Leg_Room_Service),2) Avg_Leg_Room_Service 
FROM airline;

--Cleanliness
SELECT ROUND(AVG(Cleanliness),2) Avg_Cleanliness 
FROM airline;

--Food_and_Drink
SELECT ROUND(AVG(Food_and_Drink),2) Avg_Food_and_Drink 
FROM airline;

--In_flight_Service
SELECT ROUND(AVG(In_flight_Service),2) Avg_In_flight_Service 
FROM airline;

--In_flight_Wifi_Service
SELECT ROUND(AVG(In_flight_Wifi_Service),2) Avg_In_flight_Wifi_Service 
FROM airline;

--In_flight_Entertainment
SELECT ROUND(AVG(In_flight_Entertainment),2) Avg_In_flight_Entertainment 
FROM airline;

--Baggage_Handling
SELECT ROUND(AVG(Baggage_Handling),2) Avg_Baggage_Handling 
FROM airline;

--Average Flight Distance of Maven airlines
SELECT AVG(Flight_Distance)
FROM airline;

--Average Flight departure delay
SELECT AVG(Departure_Delay) AS Avg_Departure_Delay
FROM airline;

--Average Flight arrival delay
SELECT AVG(Arrival_Delay) AS Avg_Arrival_Delay
FROM airline;

--Age-based ratings provided by dissatisfied airline passengers for various services
SELECT 
(CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior'  
END) AS Age_Group,
ROUND(AVG(Departure_and_Arrival_Time_Convenience),2) Departure_and_Arrival_Time_Convenience,
ROUND(AVG(Ease_of_Online_Booking),2) Avg_Ease_of_Online_Booking ,
ROUND(AVG(Check_in_Service),2) Avg_Check_in_Service ,
ROUND(AVG(Online_Boarding),2) Avg_Online_Boarding ,
ROUND(AVG(Gate_Location),2) Avg_Gate_Location ,
ROUND(AVG(On_board_Service),2) Avg_On_board_Service ,
ROUND(AVG(Seat_Comfort),2) Avg_Seat_Comfort ,
ROUND(AVG(Leg_Room_Service),2) Avg_Leg_Room_Service ,
ROUND(AVG(Cleanliness),2) Avg_Cleanliness ,
ROUND(AVG(Food_and_Drink),2) Avg_Food_and_Drink ,
ROUND(AVG(In_flight_Service),2) Avg_In_flight_Service ,
ROUND(AVG(In_flight_Wifi_Service),2) Avg_In_flight_Wifi_Service ,
ROUND(AVG(In_flight_Entertainment),2) Avg_In_flight_Entertainment ,
ROUND(AVG(Baggage_Handling),2) Avg_Baggage_Handling 
FROM airline 
WHERE Satisfaction='Neutral or Dissatisfied'
GROUP BY 
( CASE 
    WHEN Age<16 THEN 'Child'
    WHEN Age>=16 AND Age<30 THEN 'Young Adult'
    WHEN Age>=30 AND Age<45 THEN 'Early Middle Age'
    WHEN Age>=45 AND Age<60 THEN 'Late Middle Age'
    ELSE 'Senior'  
END);



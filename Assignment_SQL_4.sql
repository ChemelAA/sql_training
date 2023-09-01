/*
(1) Query all columns for all American cities in the CITY 
table with populations larger than 100000. The CountryCode 
for America is USA.
*/

SELECT *
FROM city
WHERE countrycode = 'USA' AND population > 100000;


/*
(2) Query all columns (attributes) for every row in the CITY table.
*/

SELECT *
FROM city;


/*
(3) Query all columns for a city in CITY with the ID 1661.
*/

select *
from city
where id = 1661;


/*
(4) Query all attributes of every Japanese city in the CITY 
table. The COUNTRYCODE for Japan is JPN.
*/

select *
from city
where countrycode = "JPN";


/*
(5) Query the names of all the Japanese cities in the CITY 
table. The COUNTRYCODE for Japan is JPN.
*/

select name
from city
where countrycode = "JPN";


/*
(6) Query a list of CITY and STATE from the STATION table.
*/

select city, state
from station;


/*
(7) Query a list of CITY names from STATION for cities that 
have an even ID number. Print the results in any order, but 
exclude duplicates from the answer.
*/

select distinct city
from station
where id % 2 = 0;


/*
(8) Find the difference between the total number of CITY 
entries in the table and the number of distinct CITY 
entries in the table.
*/

select count(city) - count(distinct city)
from station;


/*
(9) Query the two cities in STATION with the shortest and 
longest CITY names, as well as their respective lengths 
(i.e.: number of characters in the name). If there is more 
than one smallest or largest city, choose the one that comes 
first when ordered alphabetically.
*/

select city, length(city)
from station
order by length(city), city
limit 1;
select city, length(city)
from station
order by length(city) desc, city
limit 1;


/*
(10) Query the list of CITY names starting with 
vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates.
*/

select distinct city
from station
where left(city, 1) in ("A", "E", "I", "O", "U")


/*
(11) Query the list of CITY names ending with 
vowels (a, e, i, o, u) from STATION. Your result 
cannot contain duplicates.
*/

select distinct city
from station
where right(city, 1) in ("A", "E", "I", "O", "U")


/*
(12) Query the list of CITY names from STATION which have 
vowels (i.e., a, e, i, o, and u) as both their first and 
last characters. Your result cannot contain duplicates.
*/

select distinct city
from station
where right(city, 1) in ("A", "E", "I", "O", "U")
and left(city, 1) in ("A", "E", "I", "O", "U")


/*
(13) Query the list of CITY names from STATION that do 
not start with vowels. Your result cannot contain duplicates.
*/

select distinct city
from station
where not left(city, 1) in ("A", "E", "I", "O", "U")


/*
(14) Query the list of CITY names from STATION that do 
not end with vowels. Your result cannot contain duplicates.
*/

select distinct city
from station
where not right(city, 1) in ("a", "e", "i", "o", "u")


/*
(15) Query the list of CITY names from STATION that either 
do not start with vowels or do not end with vowels. Your 
result cannot contain duplicates.
*/

SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ("A", "E", "I", "O", "U")
OR RIGHT(city, 1) NOT IN ("a", "e", "i", "o", "u");


/*
(16) Query the list of CITY names from STATION that 
do not start with vowels and do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ("A", "E", "I", "O", "U")
AND RIGHT(city, 1) NOT IN ("a", "e", "i", "o", "u");


/*
(17) Query the Name of any student in STUDENTS who scored 
higher than  Marks. Order your output by the last three 
characters of each name. If two or more students both have 
names ending in the same last three characters (i.e.: 
Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

select name
from students
where marks > 75
order by right(name, 3), id;


/*
(18) Write a query that prints a list of employee names 
(i.e.: the name attribute) from the Employee table in 
alphabetical order.
*/

select name
from employee
order by name;


/*
(19) Write a query that prints a list of employee names 
(i.e.: the name attribute) for employees in Employee 
having a salary greater than $2000 per month who have been 
employees for less than 10 months. Sort your result by 
ascending employee_id.
*/

select name
from employee
where salary > 2000 and months < 10
order by employee_id;


/*
(20) Write a query identifying the type of each record in the 
TRIANGLES table using its three side lengths. Output one of 
the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

select if(a + b <= c or a + c <= b or b + c <= a, "Not A Triangle",
          if(a = b and b = c, "Equilateral",
          if (a = b or b = c or a = c, "Isosceles", "Scalene")))
from triangles;


/*
(21) Query a count of the number of cities in CITY having a 
Population larger than 100000.
*/

select count(*)
from city
where population > 100000;


/*
(22) Query the total population of all cities in CITY 
where District is California.
*/

select sum(population)
from city
where district = "California";


/*
(23) Query the average population of all cities in CITY 
where District is California.
*/

select avg(population)
from city
where district = "California";


/*
(24) Query the average population for all cities in CITY, 
rounded down to the nearest integer.
*/

select floor(avg(population))
from city;


/*
(25) Query the sum of the populations for all Japanese 
cities in CITY. The COUNTRYCODE for Japan is JPN.
*/

select sum(population)
from city
where countrycode = "JPN";


/*
(26) Query the difference between the maximum and minimum 
populations in CITY.
*/

select max(population) - min(population)
from city;


/*
(27) Samantha was tasked with calculating the average monthly 
salaries for all employees in the EMPLOYEES table, but did 
not realize her keyboard's 0 key was broken until after 
completing the calculation. She wants your help finding 
the difference between her miscalculation (using salaries 
with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: 
'actual - miscalculated' average monthly salaries), and 
round it up to the next integer.
*/

select ceiling(avg(salary) - avg(convert(replace(convert(salary, CHAR), "0", ""), SIGNED)))
from employees


/*
(28) We define an employee's total earnings to be their monthly 
salary*months worked, and the maximum total earnings to be the 
maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all 
employees as well as the total number of employees who have 
maximum total earnings. Then print these values as 2 space-separated 
integers.
*/

select max(salary * months), count(*)
from employee
where salary * months = (select max(salary * months)
						 from employee);
                         
                         
/*
(29) Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.
*/

select round(sum(lat_n), 2), round(sum(long_w), 2)
from station;


/*
(30) Query the sum of Northern Latitudes (LAT_N) from STATION having 
values greater than 38.7880 and less than 137.2345. Truncate your 
answer to 4 decimal places.
*/

select round(sum(lat_n), 4)
from station
where lat_n > 38.7880 and lat_n < 137.2345;


/*
(31) Query the greatest value of the Northern Latitudes 
(LAT_N) from STATION that is less than 137.2345. Truncate 
your answer to 4 decimal places.
*/

select round(max(lat_n), 4)
from station
where lat_n < 137.2345;


/*
(32) Query the Western Longitude (LONG_W) for the largest 
Northern Latitude (LAT_N) in STATION that is less than 
137.2345. Round your answer to 4 decimal places.
*/

select round(long_w, 4)
from station
where lat_n = (select max(lat_n) 
               from station 
               where lat_n < 137.2345);
               
               
/*
(33) Query the smallest Northern Latitude (LAT_N) 
from STATION that is greater than 38.7780. Round 
your answer to 4 decimal places.
*/

select round(min(lat_n), 4)
from station
where lat_n > 38.7780;


/*
(34) Query the Western Longitude (LONG_W)where the 
smallest Northern Latitude (LAT_N) in STATION is 
greater than 38.7780. Round your answer to 4 decimal places.
*/

select round(long_w, 4)
from station
where lat_n = (select min(lat_n) 
               from station 
               where lat_n > 38.7780);
               
               
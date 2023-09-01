/*
(1) Given the CITY and COUNTRY tables, query the sum of the 
populations of all cities where the CONTINENT is 'Asia'.
*/

SELECT sum(ci.population)
FROM CITY AS ci
JOIN COUNTRY AS co
ON ci.countrycode = co.code
WHERE co.continent = "Asia";


/*
(2) Given the CITY and COUNTRY tables, query the names 
of all cities where the CONTINENT is 'Africa'.
*/

SELECT ci.name
FROM CITY AS ci
JOIN COUNTRY AS co
ON ci.countrycode = co.code
WHERE co.continent = "Africa";


/*
(3) Given the CITY and COUNTRY tables, query the names of 
all the continents (COUNTRY.Continent) and their respective 
average city populations (CITY.Population) rounded down to 
the nearest integer.
*/

SELECT co.continent AS continent, FLOOR(avg(ci.population)) as avg_population
FROM CITY AS ci
JOIN COUNTRY AS co
ON ci.countrycode = co.code
GROUP BY co.continent;
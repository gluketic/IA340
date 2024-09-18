4.1 
delete from public.name
where fips = 'VA'

It does not work

4.2 
The code "insert into income(fips,income,year) values('80',6000,2025)" did not work because it says that fips = "80" is not present in the table name

4.3
The code Chat GPT gave me and the code we used in labs 2 and 3 appear to be close in code, but they are a little different. 
This is the code Chat GPT gave me:
Table for state's population:
  CREATE TABLE state_population (
    population_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary Key
    state_id INT,                                  -- Foreign Key to 'states' table
    year INT NOT NULL,                             -- Year of population data
    population BIGINT NOT NULL,                    -- Population value
    FOREIGN KEY (state_id) REFERENCES states(state_id)
);\

Inserting data into States:  
INSERT INTO states (state_name, fips_code) 
VALUES ('Alabama', '01'), ('Alaska', '02'), ('Arizona', '04');

Inserting data into state_population:
INSERT INTO state_population (state_id, year, population) 
VALUES (1, 2020, 4903185), (2, 2020, 731545), (3, 2020, 7278717);
  
4.5
Chat GPT does recognize the chart

4.6


Answer:
SELECT state_name, MAX(income) AS highest_income
FROM states
JOIN state_income ON states.state_id = state_income.state_id
GROUP BY state_name
ORDER BY highest_income DESC
LIMIT 1;


The code does not run. It appears that chat gpt is making up its own names for the variables, thus making it so the code cannot run.
  
4.7 

Prompt: How can I calculate the VA population growth rate in the past five
years in SQL?

Answer:
WITH PopulationData AS (
    SELECT sp.state_id, sp.year, sp.population
    FROM state_population sp
    JOIN states s ON sp.state_id = s.state_id
    WHERE s.state_name = 'Virginia'
      AND sp.year IN (YEAR(CURDATE()), YEAR(CURDATE()) - 5)
)
SELECT
    p1.population AS population_current,
    p2.population AS population_5_years_ago,
    ((p1.population - p2.population) / p2.population) * 100 AS growth_rate_percentage
FROM 
    (SELECT population FROM PopulationData WHERE year = YEAR(CURDATE())) p1,
    (SELECT population FROM PopulationData WHERE year = YEAR(CURDATE()) - 5) p2;

I tried modifying, but it appears that ChatGPT is generally unreliable when giving code. The issue is it cannot read the ERD properly and start making up its own variables.

4.8 
Chatgpt does not produce accurate results. I have two possible explanations for this. The first is that it just can't really read the ERD efficiently enough. The second is that is doesn't understand what variables it is talking about






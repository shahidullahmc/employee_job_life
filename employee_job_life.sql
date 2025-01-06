# Write a query to find the average salary of the five least-earning employees.
# You need to order the data in ascending salary order and limit it to the top five entries, treating this as a derived table.
# Take the average of these entries.

SELECT * 
FROM EMPLOYEES 
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE))) > 
    (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE)))) 
    FROM EMPLOYEES);
    
# Write a query to find the records of employees older than the average age of all employees.
# Age in years can be calculated as the year component in the difference between DOB and current date.
# You need to compare the age in years with average age in years.
# The average age in years will be evaluated as a sub-query.

SELECT * 
FROM EMPLOYEES 
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE))) > 
    (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE)))) 
    FROM EMPLOYEES);

# From the Job_History table, display the list of Employee IDs, years of service, and average years of service for all entries.
# For this, you need to calculate the years of service as a difference between the date of joining and the current date.
# Average years of service need to be queried separately to be displayed.

SELECT EMPL_ID, YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))), 
    (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE)))) 
    FROM JOB_HISTORY)
FROM JOB_HISTORY;
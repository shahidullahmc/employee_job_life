# Write SQL queries that access more than one table
# Compose queries that access multiple tables using a nested statement in the WHERE clause
# Build queries with multiple tables in the FROM clause
# Write Implicit Join queries with join criteria specified in the WHERE clause
# Specify aliases for table names and qualify column names with table aliases

# Accessing Multiple Tables with Sub-Queries
# Accessing Multiple Tables with Implicit Join

# Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.
# Implement the sub-query in the WHERE clause, such that the overlapping column of JOD ID can identify the required
# entries.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);

# Retrieve JOB information for employees earning over $70,000.
# #Retrieve the details from the JOBS table, which has common IDs with those available in the EMPLOYEES table,
# provided the salary in the EMPLOYEES table is greater than $70,000.
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (select JOB_ID from EMPLOYEES where SALARY > 70000 );


# Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.
# Implicit Join to retrieve the required information. Combine the tables based on job IDs.
SELECT *
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

# Using shorter aliases for table names. Helpful in cases where specific columns are to be accessed from different tables.
SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

# Retrieve only the Employee ID, Name, and Job Title.
# Job Title is a column of the JOBS table, and other details are coming from the EMPLOYEES table.
# The two tables will be joined on Job ID.
SELECT EMP_ID,F_NAME,L_NAME, JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;


# Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
# The column names can also be prefixed with table aliases to keep track of where each column is coming from.
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;


# Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
# a. Using sub-queries
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT
                 FROM JOBS
                 WHERE JOB_TITLE= 'Jr. Designer');
                 
# b. Using Implicit Joins
SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT AND J.JOB_TITLE= 'Jr. Designer';


# Retrieve JOB information and a list of employees whose birth year is after 1976.
# a. Using sub-queries
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
                    FROM EMPLOYEES
                    WHERE YEAR(B_DATE)>1976 );
                    
# b. Using implicit join
SELECT J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY, J.JOB_IDENT
FROM JOBS J, EMPLOYEES E
WHERE E.JOB_ID = J.JOB_IDENT AND YEAR(E.B_DATE)>1976;


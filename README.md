# Pewlett-Hackard-Analysis

## Overview

The purpose of this repository is twofold. Purpose one is to hold the schema and raw data for an employee database for Pewlett Hackard. The second is to hold SQL queries for re-running and output data from these queries in csv formats. The a copy of the database may be created running the queries in the [schema](/schema.sql) and importing the data from [departments](/Data/departments.csv), [employees](/Data/employees.csv), [department-employees](/Data/dapt_emp.csv) (into dept_emp), [department-managers](/Data/dept_manager.csv), [salaries](/Data/salaries.csv), and [titles](/Data/titles.csv) into their respective tables. 

A duplicated database's structure will look something like below. 
![EmployeeDB.png](/EmployeeDB.png)

[Queries](/Queries/queries.sql) may then be run to output filtered data from the above database and saved into csv files found in the data folder. Of particular interest is retirement information whose queries may be found [here](/Queries/Employee_database_challenge.sql) to prepare for the "silver tsunami"

## Results

Running the first three of the [queries relevant](/Queries/Employee_database_challenge.sql), we create output tables that are then saved in csv format (titled [retirement_titles.csv](/Data/retirement_titles.csv), [unique_titles](/Data/unique_titles.csv), [retiring_titles](/Data/retiring_titles.csv) respectively. Snippets of each table are labelled and shown below.

Retirement titles: the purpose of this query is to retrieve the employees born between 1952 and 1955 (ordered by employee number) 
![retirement_titles](/retirement_titles.png)

Unique titles: the purpose of this query is to narrow down the above data to only display one employee number where duplicates were caused by department switches or promotions.
![unique_titles](/unique_titles.png)

Retiring titles: the purpose of this query is to provide a count of how many titles being held by employees are set to retire.
![retiring_titles](/retiring_titles.png)

Finally, using the last query in the sql, we are extracting from the raw data a mentorship eligibility, specifically with conditions of "being a current employee" and "born between January 1, 1965 and December 31, 1965". This is saved in the [mentorship_eligibilty.csv](/Data/mentorship_eligibilty.csv)

## Summary
The written analysis has the following structure, organization, and formatting:

There is a title, and there are multiple sections. (2 pt)
Each section has a heading and subheading. (2 pt)
Links to images are working and displayed correctly. (2 pt)
Analysis (14 points)
The written analysis has the following:

Overview of the analysis:

The purpose of the new analysis is well defined. (3 pt)
Results:

There is a bulleted list with four major points from the two analysis deliverables. (6 pt)
Summary:

The summary addresses the two questions and contains two additional queries or tables that may provide more insight. (5 pt)

# Pewlett_Hackard_Analysis

## Goal 

The purpose for this analysis is to assist Pewlett_Hackard to 
    1. determine the total number of employees per title who will be retiring,
    2. identify employees who are eligible to participate in a mentorship program, and
    3. Write a technical report that details the analysis and findings.

To be more specific, the task will be conducting in the following steps: 
    1. Technical Analysis Deliverable 1: Number of Retiring Employees by Title. To create three tables, one showing number of titles retiring, one      showing, one showing number of employees with each title, and one showing a list of current employees born between Jan. 1, 1952 and Dec. 31, 1955. New tables are exported as CSVs;
    2. Technical Analysis Deliverable 2: Mentorship Eligibility. A table containing employees who are eligible for the mentorship program;
    3. Write a technical report with detailed problems, process, findings and future suggestions etc. 

## Procedure 

In order to make the process more organized and efficient, the project first started by creating an ERD in QUICKDBD as a database reference. Creating schemas for the six original datasets allows us to create tables in pgadmin and importing csvs to each table stores the original dataset for future use. 

By using inner join function and partition the data to show only most recent title per employee, it is allow us to create the new table the new table "number_of_retiring_title" that contains counts of employees who is about to retire by titles. 

Also by using inner join function, the "mentorship" table is created with emp_no, first_name, last_name, birth_date, from_date, to_date and title to indicates all employees who is eligible for the mentorship program. However, in this step, we detected duplicates after the join since some employees were recorded with different value titles due to reasons such as promotion etc. In this case we used partition function to delete the duplicated value and generated a new table named "mentorship_unique". 

## Summary of Findings 

    1. In the "number_of_retiring_titles" sheet, there are 33,118 employees who are about to retire. 
    
    2. Among all of the 33,118 employees, we realized that the major employees who are about to retire is from the Senior Engineer group with a total number of 13651. The second largest group is Senior Staff with a total amount of 12872. 
    
    3. In addition, there are 2,711 Engineers, 2,022 Staffs, 1,609 Technique Leader, 251 Assistant Engineer are about to retire. 

    4. In Manager level, there are only two managers will be retiring. 

    5. According to the "mentorship_unique" table, there is a total of 1549 employees who qualify for the mentorship program. 

## Recommendation for Future Analysis 

    1. For furture analysis, it would be practical to check how many employees work as a cross function staff. In other words, how many employees works for more than two departments. This would be helpful for the company to optimize its staffing strategy. 

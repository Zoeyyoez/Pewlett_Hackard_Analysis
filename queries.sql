-- Challenge 7

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Technical Analysis Deliverable 1: Number of Retiring Employees by Title

-- Number of [titles] retiring
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retiring_titles
FROM current_emp AS ce
	INNER JOIN titles AS ti
		ON (ce.emp_no = ti.emp_no)
ORDER BY ce.emp_no;

-- Partition the data to show only most recent title per employee
SELECT emp_no,
	first_name,
	last_name,
	to_date,
	title
INTO unique_titles
FROM
	(SELECT emp_no,
	first_name,
	last_name,
	to_date,
	title, ROW_NUMBER() OVER
	(PARTITION BY (emp_no)
	ORDER BY to_date DESC) rn
	FROM retiring_titles
	) tmp WHERE rn = 1
ORDER BY emp_no;

-- Counting the number of each employee per title
SELECT COUNT(title), title
INTO number_of_retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Technical Analysis Deliverable 2: Mentorship Eligibility 
-- Creating a list of employees eligible for potential mentorship program. The employee include has be to born in 1965
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT emp_no,
	first_name,
	last_name,
	to_date,
	title
INTO memtorship_unique
FROM
	(SELECT emp_no,
	first_name,
	last_name,
	to_date,
	title, ROW_NUMBER() OVER
	(PARTITION BY (emp_no)
	ORDER BY to_date DESC) rn
	FROM mentorship
	) tmp WHERE rn = 1
ORDER BY emp_no;
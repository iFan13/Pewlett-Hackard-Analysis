--DELIVERABLE 1-Query 1:  titles of those whose birth_date is within 1952 to 1955
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

--DELIVERABLE 1-Query 2: Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, from_date DESC;

--DELIVERABLE 1-Query 3: Count number of for each title retiring
SELECT COUNT(title) as "count",
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--DELIVERABLE 1- All queries 1 & 2 all-in-one query
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.from_date DESC;

--DELIVERABLE 2-
SELECT DISTINCT ON(e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no
-- Count number of retirees per department
SELECT COUNT(d.dept_name) as "number of retirees",
	d.dept_name
FROM
	(
	SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		de.dept_no
	FROM employees as e
		JOIN titles as t
			ON e.emp_no = t.emp_no
		INNER JOIN dept_emp as de
				ON e.emp_no = de.emp_no
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		AND (de.to_date = '9999-01-01')
	ORDER BY e.emp_no, t.from_date DESC
	) as rt
	INNER JOIN departments as d
			ON (rt.dept_no = d.dept_no)
GROUP BY d.dept_no
ORDER BY d.dept_no ASC;
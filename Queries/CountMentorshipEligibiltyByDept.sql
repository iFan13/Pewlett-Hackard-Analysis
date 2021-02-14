-- Find count of mentorable employees per department
SELECT COUNT(d.dept_name) as "number of mentorable employees",
	d.dept_name
FROM (
	SELECT DISTINCT ON(e.emp_no)
		e.emp_no
		,e.first_name
		,e.last_name
		,e.birth_date
		,de.from_date
		,de.to_date
		,de.dept_no
		,t.title
	FROM employees as e
		INNER JOIN dept_emp as de
			ON (e.emp_no = de.emp_no)
		INNER JOIN titles as t
			ON (e.emp_no = t.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
		AND (t.to_date = '9999-01-01')
		AND (de.to_date = '9999-01-01')
	ORDER BY e.emp_no
	) AS me
		LEFT JOIN departments as d
			ON (me.dept_no = d.dept_no)
GROUP BY d.dept_no
ORDER BY d.dept_no

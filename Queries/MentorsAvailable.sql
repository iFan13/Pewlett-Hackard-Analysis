SELECT 
	new_gen.dept_name,
	new_gen."number of mentorable employees" as mentorable_employees,
	retire_gen."number of retirees" as retiring_employees,
	(retire_gen."number of retirees"-new_gen."number of mentorable employees") as surplus_mentors,
	CASE
		WHEN (retire_gen."number of retirees"-new_gen."number of mentorable employees")>0 THEN 'Yes'
		ELSE 'No'
		END AS sufficient_mentors
FROM
	(
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
		WHERE (e.birth_date BETWEEN '1965-01-01' AND '9999-01-01')
			AND (t.to_date = '9999-01-01')
			AND (de.to_date = '9999-01-01')
		ORDER BY e.emp_no
		) AS me
			LEFT JOIN departments as d
				ON (me.dept_no = d.dept_no)
	GROUP BY d.dept_no
	ORDER BY d.dept_no
	) AS new_gen

JOIN

	(
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
	ORDER BY d.dept_no ASC
	) as retire_gen
	ON (new_gen.dept_name = retire_gen.dept_name)
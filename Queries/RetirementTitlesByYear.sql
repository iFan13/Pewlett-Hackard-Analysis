-- -- all years -- --
SELECT
	EXTRACT(YEAR from birth_date) AS "retiree year",
	COUNT(title) AS "count of titles retiring", 
	title
FROM
	(
	SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		e.birth_date
	FROM employees as e
	JOIN titles as t
	ON e.emp_no = t.emp_no
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY e.emp_no, t.from_date DESC
	) AS "retireeroles"
GROUP BY title, "retiree year"
ORDER BY "retiree year" ASC, "count of titles retiring" DESC;

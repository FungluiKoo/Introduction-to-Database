-- 1. Two queries that each use at least one INNER JOIN.

SELECT c.course_title, t.teacher_name
FROM courses c INNER JOIN teachers t ON c.course_teacher = t.teacher_id
ORDER BY c.course_title;

SELECT c.course_title, e.eval_value
FROM courses c INNER JOIN evaluations e ON c.course_id = e.eval_course
ORDER BY c.course_title;

-- 2. Two queries that each use a LEFT JOIN

SELECT st.student_name, sc.score_value
FROM students st LEFT JOIN scores sc ON st.student_id = sc.score_student
ORDER BY st.student_name;

SELECT t.teacher_name, c.course_title
FROM teachers t LEFT JOIN courses c ON c.course_teacher = t.teacher_id
ORDER BY t.teacher_name;

-- 3. Three queries that each contain a nested query (or sub-query) of any kind.

SELECT student_name AS "Students with A+ Records"
FROM students
WHERE student_id IN (
    SELECT score_student
    FROM scores
    WHERE score_value >= 95
)
ORDER BY student_name;

SELECT course_title AS "Courses without Bad Feedback"
FROM courses
WHERE course_id IN (
    SELECT eval_course
    FROM evaluations
    GROUP BY eval_course
    HAVING MIN(eval_value) > 6 
)
ORDER BY course_title;

SELECT DISTINCT t.teacher_name AS "Teachers with Good Evaluation Result"
FROM teachers t, courses c
WHERE t.teacher_id = c.course_teacher
  AND c.course_id IN (
    SELECT eval_course
    FROM evaluations
    GROUP BY eval_course
    HAVING AVG(eval_value) > 8.5
)
ORDER BY t.teacher_name;

-- 4. One query with more than one INNER JOIN

SELECT st.student_name, c.course_title, sc.score_value
FROM (scores sc INNER JOIN students st ON st.student_id = sc.score_student)
    INNER JOIN courses c ON c.course_id = sc.score_course
ORDER BY st.student_name;

-- 5. Two queries of your choice with any JOIN

SELECT t.teacher_name, c.course_title
FROM teachers t CROSS JOIN courses c
ORDER BY t.teacher_name, c.course_title;

SELECT e.eval_course,s.student_name, e.eval_value
FROM evaluations e RIGHT JOIN students s ON e.eval_student = s.student_id
ORDER BY e.eval_course, s.student_name;

-- 6. Extra Credit
-- 6-1. Names of students with at least one subject that has score higher than a score that is owned by Reagan
SELECT student_name
FROM students
WHERE student_id IN (
    SELECT DISTINCT score_student
    FROM scores
    WHERE score_value > ANY (
        SELECT sc.score_value
        FROM scores sc INNER JOIN students st ON sc.score_student = st.student_id
        WHERE st.student_name = "Reagan"
    )
)
  AND student_name != "Reagan" 
ORDER BY student_name;

-- 6-2. Names of students with at least one subject that has score higher than Clinton's highest score
SELECT student_name
FROM students
WHERE student_id IN (
    SELECT DISTINCT score_student
    FROM scores
    WHERE score_value > ALL (
        SELECT sc.score_value
        FROM scores sc INNER JOIN students st ON sc.score_student = st.student_id
        WHERE st.student_name = "Clinton"
    )
)
  AND student_name != "Clinton" 
ORDER BY student_name;

-- 6-3. Names of students who has score in any of Bob's course
SELECT student_name
FROM students
WHERE student_id IN (
    SELECT score_student
    FROM scores
    WHERE score_course IN(
        SELECT course_id
        FROM courses
        WHERE course_teacher IN(
            SELECT teacher_id
            FROM teachers
            WHERE teacher_name = "Bob"
        )
    )
);

-- 6-4. Teachers that have no course in record
SELECT *
FROM teachers
WHERE teacher_id NOT IN(
    SELECT course_teacher
    FROM courses
);
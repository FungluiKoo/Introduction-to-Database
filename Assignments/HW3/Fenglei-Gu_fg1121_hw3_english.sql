.mode csv
.header OFF
DROP TABLE IF EXISTS gaokao_english;
CREATE TABLE gaokao_english(
    CollegeCode text NOT NULL,
    CollegeName text NOT NULL,
    MajorCode text NOT NULL,
    MajorName text NOT NULL,
    EnrollNum int NOT NULL,
    LeastScore int NOT NULL, /* if the major's least score is lower than student's Gaokao score, then s/he can be admitted*/
    LowestRanking int /*the lowest ranking among all enrolled students */
);

.import gaokao_english.csv gaokao_english

-- 1.	Write a query to count how many records there are in your table.
SELECT 'Q1';
SELECT COUNT(*)
FROM gaokao_english;

-- 2.	Write a query to list the first 10 records in your table based on a sort in a reverse order.
SELECT 'Q2';
SELECT CollegeName, MajorName, LeastScore, LowestRanking
FROM gaokao_english
ORDER BY LeastScore ASC
LIMIT 10 OFFSET 1000;

-- 3.	Display three important fields; at least one should be in alphabetical order; show only the first 10 records of an appropriate selection using WHERE.
SELECT 'Q3';
SELECT CollegeName, MajorName, LeastScore
FROM gaokao_english
WHERE LeastScore BETWEEN 660 AND 680
ORDER BY MajorName ASC
LIMIT 5;

-- 4.	Use GROUP BY to find averages on a numerical field in a reasonable breakdown. Note: If you only have textual data columns, use the COUNT function instead of averages.
SELECT 'Q4';
SELECT CollegeName, AVG(EnrollNum) AS av
FROM gaokao_english
GROUP BY CollegeName
ORDER BY av DESC
LIMIT 5;

-- 5.	Write a query that includes a HAVING clause.
SELECT 'Q5';
SELECT CollegeName, AVG(EnrollNum) AS av
FROM gaokao_english
GROUP BY CollegeName
HAVING av >= 100
ORDER BY av DESC
LIMIT 5;

-- 6.	Create a user-friendly listing of the first 15 records in alphabetical order by creating a text field using concatenation, e.g.:
--                         Tom Sawyer (Twain, Mark; written in 1862)  
SELECT 'Q6';
SELECT CollegeName || ' does not enroll students with Gaokao score less than ' || LeastScore || ' for ' || MajorName || ' Major.' AS txt
FROM gaokao_english
ORDER BY txt ASC
LIMIT 15;

-- 7.	and 8. Write two queries using at least two different SQLite functions listed here: https://www.sqlite.org/lang_corefunc.html that we have not used in class.
-- 7. Get the unicode of first character of the name of colleges that has the honor suffix 'first-class'.
SELECT 'Q7';
SELECT DISTINCT UNICODE(CollegeName) AS u
FROM gaokao_english
WHERE CollegeName GLOB '*(First-Class*)*' /*Offered by Minitry of Education of China, there are totally two types of first-class honor suffix: '一流大学建设高校' or in English First-Class University, and '一流学科建设高校' or in English First-Class College*/
ORDER BY u ASC
LIMIT 5;
-- 8. Get the college list, with its sufixxed honor trimed, whose least admission score is x, where x is a random integer bewtween 600 and 649
SELECT 'Q8';
SELECT CollegeName, MIN(LeastScore) AS m
FROM gaokao_english
GROUP BY CollegeName
HAVING m==600+(RANDOM()%50)
ORDER BY CollegeName ASC
LIMIT 5;

-- 9 – 12. Write four more queries that are relevant to your data and and yield results that you find interesting. For each of these queries, write the question that you are posing in English as a comment and then write and execute the query in SQL. 
-- 9. List bottom 5 universities have their least admission score greater than 640.
SELECT 'Q9';
SELECT CollegeName, MIN(LeastScore) AS m 
FROM gaokao_english
GROUP BY CollegeName 
HAVING m > 640
ORDER BY m ASC
LIMIT 5;
-- 10. How many majors have their least admission score higher than 640?
SELECT 'Q10';
SELECT COUNT(*)
FROM gaokao_english
WHERE LeastScore > 640;
-- 11. List least admission scores for economy majors at all universities
SELECT 'Q11';
SELECT CollegeName,MajorName,LeastScore
FROM gaokao_english
WHERE MajorName LIKE '%econ%'
ORDER BY LeastScore DESC
LIMIT 5;
-- 12. List average least admission scores among majors at universities.
SELECT 'Q12';
SELECT CollegeName, AVG(LeastScore) AS l
FROM gaokao_english 
GROUP BY CollegeName
ORDER BY l DESC
LIMIT 5;
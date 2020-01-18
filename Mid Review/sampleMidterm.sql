.separator ,

DROP TABLE IF EXISTS artist;
CREATE TABLE 'artist' (
    'ConstituentID' TEXT NOT NULL,    
    'DisplayName' TEXT,  
    'Nationality' TEXT,  
    'Gender'  TEXT,  
    'BeginDate'  INTEGER,  
    'EndDate'  INTEGER,  
    PRIMARY KEY('ConstituentID') 
);
.import artists.csv artist

/*
DROP TABLE IF EXISTS artwork;
CREATE TABLE 'artwork'(

);
.import artworks.csv artwork
*/

SELECT 'a';
SELECT COUNT(*) FROM artist;

SELECT 'b';
SELECT COUNT(*) FROM artists
WHERE Gender=='Female' AND Nationality=='Polish';

SELECT 'c';
SELECT Nationality,COUNT(DISTINCT ConstituentID) AS cnt
FROM artist
GROUP BY Nationality
ORDER BY cnt DESC
LIMIT 5;

SELECT 'C-2';
SELECT Nationality
FROM artist
GROUP BY Nationality
ORDER BY COUNT(DISTINCT ConstituentID) DESC
LIMIT 5;

SELECT 'd';
SELECT Gender,COUNT(*) FROM artist
WHERE Nationality=='American'
GROUP BY Gender;

SELECT 'e';
SELECT 2019-AVG(BeginDate)
FROM artist
WHERE Nationality=='Mexican' AND EndDate==0 AND BeginDate>0;

SELECT AVG(2019-BeginDate)
FROM artist
WHERE Nationality=='Mexican' AND EndDate==0 AND BeginDate>0;

SELECT 'f';
SELECT DisplayName, BeginDate, EndDate FROM artist
WHERE (Nationality IN ('American','Canadian'))
  AND (BeginDate BETWEEN 1800 AND 1899)
ORDER BY BeginDate ASC, DisplayName ASC
LIMIT 10;

SELECT 'g';
SELECT DisplayName FROM artist
WHERE ((2019-BeginDate)<=40)
  AND EndDate==0
  AND Nationality=='Iranian'
ORDER BY ConstituentID ASC
LIMIT 10;

SELECT 'h';
SELECT DisplayName || ' - (' || Nationality || ')'
FROM artist
WHERE DisplayName LIKE '%pen Name%'
  AND Nationality IN ('Korean','Japanese')
ORDER BY DisplayName,Nationality ASC
LIMIT 10;

SELECT 'i';
SELECT DisplayName,Gender
FROM artist
WHERE BeginDate==0
ORDER BY ConstituentID ASC
LIMIT 10;


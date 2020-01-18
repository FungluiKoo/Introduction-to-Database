DROP TABLE IF EXISTS books2;

CREATE TABLE books2 (
  ID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(32) NOT NULL,
  author VARCHAR(40) NOT NULL,
  year_written INT(4) default 0,
  edition VARCHAR(20) NOT NULL,
  price DECIMAL(7,3),
  purchaseDate DATE,
  PRIMARY KEY(ID)
  );

INSERT INTO books2 VALUES (NULL,"Northanger Abbey", "Austen, Jane", 1814,"Penguin",18.2,"2014-12-01");
INSERT INTO books2 VALUES (NULL,"War and Peace", "Tolstoy, Leo", 1865, "Penguin",12.7,"2013-03-31");
INSERT INTO books2 VALUES (NULL,"Anna Karenina", "Tolstoy, Leo", 1875, "Penguin",13.5,"2014-02-25");
INSERT INTO books2 VALUES (NULL,"Mrs. Dalloway", "Woolf, Virginia", 1925, "Harcourt Brace",25,"2015-01-10");
INSERT INTO books2 VALUES (NULL,"The Hours", "Cunnningham, Michael", 1999, "Harcourt Brace",12.34,"2012-11-08");
INSERT INTO books2 VALUES (NULL,"Huckleberry Finn", "Twain, Mark", 1865, "Penguin",5.76,"2012-02-29");
INSERT INTO books2 VALUES (NULL,"Bleak House", "Dickens, Charles", 1870, "Random House",5.75,"2014-10-31");
INSERT INTO books2 VALUES (NULL,"Tom Sawyer", "Twain, Mark", 1862, "Random House",7.75,"2013-09-20");
INSERT INTO books2 VALUES (NULL,"Da Vinci Code", "Brown, Dan", 2004, "Random House",15.50,"2014-11-15");
INSERT INTO books2 VALUES (NULL,"A Room of One's Own", "Woolf, Virginia", 1922,"Penguin",29,"2014-12-30");
INSERT INTO books2 VALUES (NULL,"Harry Potter","Rowling, J.K.",2000,"Harcourt Brace",19.95,"2015-01-01");
INSERT INTO books2 VALUES (NULL,"One Hundred Years of Solitude","Marquez",1967,"Harper Perennial",14.00,"2013-03-01");
INSERT INTO books2 VALUES (NULL,"Hamlet, Prince of Denmark","Shakespeare",1603,"Signet Classics",7.95,"2014-09-02");
INSERT INTO books2 VALUES (NULL,"Lord of the Rings","Tolkien, J.R.",1937,"Penguin",27.45,"2013-09-25");

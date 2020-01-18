DROP TABLE IF EXISTS books;

CREATE TABLE books (
  title text NOT NULL,
  author text,
  year_written integer,
  edition text,
  price real,
  purchaseDate text,
  PRIMARY KEY(title)
  );

INSERT INTO books VALUES ("Sense and Sensibility", "Austen, Jane", 1814,"Penguin",18.2,"2011-12-01");
INSERT INTO books VALUES ("War and Peace", "Tolstoy, Leo", 1865, "Penguin",12.7,"2009-03-31");
INSERT INTO books VALUES ("Anna Karenina", "Tolstoy, Leo", 1875, "Penguin",13.5,"2010-02-25");
INSERT INTO books VALUES ("Mrs. Dalloway", "Woolf, Virginia", 1925, "Harcourt Brace",25,"2014-01-10");
INSERT INTO books VALUES ("The Hours", "Cunnningham, Michael", 1999, "Harcourt Brace",12.34,"2012-11-08");
INSERT INTO books VALUES ("Huckleberry Finn", "Twain, Mark", 1865, "Penguin",5.76,"2012-02-29");
INSERT INTO books VALUES ("Bleak House", "Dickens, Charles", 1870, "Random House",5.75,"2009-10-31");
INSERT INTO books VALUES ("Tom Sawyer", "Twain, Mark", 1862, "Random House",25.0,"2009-09-20");
INSERT INTO books VALUES ("A Room of One's Own", "Woolf, Virginia", 1922,"Penguin",29,"2013-11-30");
INSERT INTO books VALUES ("Harry Potter","Rowling, J.K.",2000,"Harcourt Brace",19.95,"2014-01-01");
INSERT INTO books VALUES ("One Hundred Years of Solitude","Marquez",1967,"Harper Perennial",14.00,"2013-03-01");
INSERT INTO books VALUES ("Hamlet, Prince of Denmark","Shakespeare",1603,"Signet Classics",7.95,"2013-09-24");
INSERT INTO books VALUES ("Lord of the Rings","Tolkien, J.R.",1937,"Penguin",27.45,"2013-09-25");
INSERT INTO books VALUES ("Der Steppenwolf","Hesse, Herman",1928,"Fischer Verlag", 95,"2015-02-03");
INSERT INTO books VALUES ("The Great Gatsby","Fitzgerald, F. Scott",1925,"Penguin",12.00,"2015-02-11");
INSERT INTO books VALUES ("Don Quixote","Cervantes",1605,"Penguin",25.00,"2015-07-21");

.quit
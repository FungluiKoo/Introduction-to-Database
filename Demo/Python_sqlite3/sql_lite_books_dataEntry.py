# sql_lite and our "books" table!
# creating and populating the table
import sqlite3
def sqlite_dataEntry():
    
    conn = sqlite3.connect('booksTable.db')
    c = conn.cursor()

    # delete the table if necessary
    c.execute('''DROP TABLE IF EXISTS books''')

    # note the use of triple-quoted strings for use with very long strings
    # Create table
    c.execute('''CREATE TABLE books (
      title varchar(32) NOT NULL,
      author varchar(40) NOT NULL,
      year_written int(4) default 0,
      edition varchar(20) NOT NULL,
      price decimal(7,2),
      purchaseDate date NOT NULL,
      PRIMARY KEY(title)
      )''')

    # Insert a row of data
    c.execute("""INSERT INTO books VALUES
        ('Pride and Prejudice', 'Austen, Jane', 1814,'Penguin',
        18.2,'2008-12-01')""")

    # Save (commit) the changes
    conn.commit()

    # Here we have a list that contains tuples. Tuples contain values that are separated by commas.
    # In this case, we are using the same concept as the PHP "bind" programming technique
    # in order to assign values from each tuple into the appropriate field in the table.
    # The SQL command uses INSERT INTO 
    
    for b in [   ('War and Peace', 'Tolstoy, Leo', 1865, 'Penguin',12.7,'2009-03-31'),
                 ('Anna Karenin', 'Tolstoy, Leo', 1875, 'Penguin',13.5,'2010-02-25'),
                 ('Mrs. Dalloway', 'Woolf, Virginia', 1925, 'Harcourt Brace',25,'2008-01-10'),
                 ('The Hours', 'Cunnningham, Michael', 1999, 'Harcourt Brace',12.34,'2008-11-08'),
                 ('Huck Finn', 'Twain, Mark', 1865, 'Penguin',5.76,'2010-02-29'),
                 ('A Tale of Two Cities', 'Dickens, Charles', 1870, 'Random House',5.75,'2009-10-31'),
                 ('Tom Sawyer', 'Twain, Mark', 1862, 'Random House',7.75,'2009-09-20'),
                 ('Da Vinci Code', 'Brown, Dan', 2004, 'Random House',15.50,'2007-11-15'),
                 ('A Room of One\'s Own', 'Woolf, Virginia', 1922,'Penguin',25,'2006-11-30'),
                 ('Harry Potter','Rowling, J.K.',2000,'Harcourt Brace',19.95,'2010-04-10'),
                 ('One Hundred Years of Solitude','Marquez',1967,'Harper Perennial',14.00,'2010-03-22'),
                 ('Hop on Pop','Seuss, Dr.',1975,'Random House',8.99,'2014-04-10'),
            ]:
        c.execute('INSERT INTO books VALUES (?,?,?,?,?,?)', b)

    # Save (commit) the changes
    conn.commit()

    print("\n ... For testing purposes only ... print out the contents of the table ... \n")
    c.execute('SELECT * FROM books ORDER BY author,title')
    for row in c:
        print(row)

    # We should close the cursor now that we are done with it
    c.close()

sqlite_dataEntry()


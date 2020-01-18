# sql_lite_books_v1.py

import sqlite3
def sqlite_report1():

    print("\nReport on books \n")
    conn = sqlite3.connect('booksTable.db')
    c = conn.cursor()
    
    try:
        c.execute('SELECT title,author,edition,year_written FROM books ORDER BY author,title')
    except:
        print("Table(s) not found or could not be opened.")
    else:
        print('{:35} {:40} {:20} ({:4})'.format('Title','Author','Edition','Year'))
        for title,author,edition,year_written in c:
            print('{:35} {:40} {:20} ({:4})'.format(title,author,year_written,edition))
    
        # close the cursor 
    c.close()

sqlite_report1()


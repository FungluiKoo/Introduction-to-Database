# books - report using python and sqlite ... without user selection:
# 

import sqlite3
def sqlite_report2():

    print("\nReport on books \n")

    # establish connection to the database to use
    conn = sqlite3.connect('booksTable.db')
    # establish a cursor
    c = conn.cursor()

    # build the query and store it into a string ...
    # Notice that concatenation in sqlite uses the || symbol
    # and also that python uses the \ symbol to continue
    # to the next line of code.
    query1 = "SELECT author,(title|| ' (' || edition || ', ' || year_written ||')') " + \
    "AS book FROM books ORDER BY title,author "

    # execute the query
    try:
        c.execute(query1)
    except:
        print("Table(s) not found or could not be opened.")
    else:
        # print out the results
        print('{:30} {:50}'.format('Author','Book'))
        for author, book in c:
            print('{:30} {:50}'.format(author,book))
    
    # close the cursor 
    c.close()

sqlite_report2()


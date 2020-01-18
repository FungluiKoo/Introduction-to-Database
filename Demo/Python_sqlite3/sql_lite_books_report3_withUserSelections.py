# more work with the books table ... allowing user input into the selection and sort keys

import sqlite3
def sqlite_report3():

    selection = input("What is the author's name?  ")
    sort1 = input("Do you want to sort by (T)itle or (Y)ear?  (T/Y)  ")

    if (sort1 == "Y" or sort1 == 'y'):
        sortkey = "year_written"
    else:
        sortkey = "title"
    print("\nReport on books by "+selection+" sorted by "+sortkey+"\n")
    
    conn = sqlite3.connect('booksTable.db')
    c = conn.cursor()

    query1 = "SELECT title,author,edition,year_written FROM books "+ \
             "WHERE author = '"+selection + "' " + \
             "ORDER BY "+sortkey    

    print("\nFor testing purposes, display the query:")
    print(query1+"\n")

    try:
        c.execute(query1)
    except:
        print("Error: The table was not found or could not be opened.")
    else:
        print('{:35} {:40} {:20} ({:4})'.format('Title','Author','Edition','Year'))
        
        rows = c.fetchall() # Store the results as a list and then check to be sure there are results.
        if len(rows) == 0:
            print("There are no books on file for that author.")
        else:
            for title,author,edition,year_written in rows:
                print('{:35} {:40} {:20} ({:4})'.format(title,author,edition,year_written))

    # close the cursor 
    c.close()

sqlite_report3()


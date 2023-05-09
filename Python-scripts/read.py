import psycopg2

"""read operation """
try:
    connection = psycopg2.connect(host = "localhost",database="vehicleshowroom",user = "postgres",password = "asdf")
    cursor = connection.cursor()
    print("connection succesfully established")

    
    #one table at a time
    print("ADMINISTRATION TABLE")
    print("")
    cursor.execute("SELECT * from administration")
    record = cursor.fetchall()
    for row in record:
        print(row)
    print("")
    print("")
    print("DEALER TABLE")
    print("")
    cursor.execute("SELECT * from dealer")
    record = cursor.fetchall()
    for row in record:
        print(row)
    print("")
    print("")
    print("VEHICLE TABLE")
    print("")
    cursor.execute("SELECT * from vehicle")
    record = cursor.fetchall()
    for row in record:
        print(row)
    print("")
    print("")
    print("IMG TABLE")
    print("")
    cursor.execute("SELECT * from img")
    record = cursor.fetchall()
    for row in record:
        print(row)
    print("")
    print("")
    print("SHOWROOM TABLE")
    cursor.execute("SELECT * from showroom")
    record = cursor.fetchall()
    for row in record:
        print(row)
    print("")
    print("")
    print("CUSTOMER TABLE")
    cursor.execute("SELECT * from customer")
    record = cursor.fetchall()
    for row in record:
        print(row)
    print("")
    print("")
    print("SALES TABLE")
    cursor.execute("SELECT * from sales")
    record = cursor.fetchall()
    for row in record:
        print(row)
    
except (Exception, psycopg2.Error) as error:
        print("Failed to insert record into mobile table", error)
    
finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
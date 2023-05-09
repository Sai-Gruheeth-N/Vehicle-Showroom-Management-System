import psycopg2

'''update operation'''
def updateTable(vehicleID, vehcost):
    try:
        connection = psycopg2.connect(host = "localhost",database="vehicleshowroom",user = "postgres",password = "asdf")
        cursor = connection.cursor()
        print("Table Before updating record ")
        sql_select_query = """select * from vehicle where vehicleID = %s"""
        cursor.execute(sql_select_query, (vehicleID,))
        record = cursor.fetchone()
        print(record)

        # Update single record now
        sql_update_query = """Update vehicle set vehiclecost = %s where vehicleID = %s"""
        cursor.execute(sql_update_query, (vehcost, vehicleID))
        connection.commit()
        count = cursor.rowcount
        print(count, "Record Updated successfully ")

        print("Table After updating record")
        sql_select_query = """select * from vehicle where vehicleID = %s"""
        cursor.execute(sql_select_query, (vehicleID,))
        record = cursor.fetchone()
        print(record)

    except (Exception, psycopg2.Error) as error:
        print("Error in update operation", error)

    finally:
        # closing database connection.
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

id = 'v101'
price = 3084843
updateTable(id, price)
import psycopg2


def deleteData(vehicleID):
    try:
        connection = psycopg2.connect(host = "localhost",database="vehicleshowroom",user = "postgres",password = "asdf")
        cursor = connection.cursor()
        # Update single record now
        print("Table Before updating record ")
        sql_select_query = """select * from vehicle where vehicleID = %s"""
        cursor.execute(sql_select_query, (vehicleID,))
        record = cursor.fetchone()
        print(record)
        sql_delete_query = """Delete from vehicle where vehicleID = %s"""
        cursor.execute(sql_delete_query, (vehicleID,))
        connection.commit()
        print("Table After updating record")
        sql_select_query = """select * from vehicle where vehicleID = %s"""
        cursor.execute(sql_select_query, (vehicleID,))
        record = cursor.fetchone()
        print(record)
        count = cursor.rowcount
        print(count, "Record deleted successfully ")

    except (Exception, psycopg2.Error) as error:
        print("Error in Delete operation", error)

    finally:
        # closing database connection.
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

id4 = 'v102'
id5 = 'v102'
deleteData(id4)
deleteData(id5)
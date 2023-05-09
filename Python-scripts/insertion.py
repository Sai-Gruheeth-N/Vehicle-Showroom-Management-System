import psycopg2

"""insertion operation """
try:
    connection = psycopg2.connect(host = "localhost",database="vehicleshowroom",user = "postgres",password = "asdf")
    cursor = connection.cursor()
    postgres_insert_query = """ insert into vehicle values('car', 'v106', 'EcoBoost', 'In Stock', 'ta_501', 2084843, 'Mustang', 'Premuim Fastback');"""
    cursor.execute(postgres_insert_query)
    connection.commit()
    print("1 Record inserted successfully")
    cursor.execute("SELECT * from vehicle")
    record = cursor.fetchall()
    print("Result ", record)
    count = cursor.rowcount
    print(count, "Record inserted successfully into vehicle table")
    
except (Exception, psycopg2.Error) as error:
        print("Failed to insert record into vehicle table", error)
    
finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
"""---------------------------------------------------------------------------------------------------"""

#!/usr/bin/env python
# coding: utf-8

# Connecting to Little Lemon with Python/MYSQL Database Client

# In[ ]:


get_ipython().system('pip install mysql-connector-python')
import mysql.connector as connector


# Task 1: Connect to Database

# In[ ]:


connection = connector.connect(user = "root", password = "coconut7", db="littlelemon")
cursor = connection.cursor()


# Task 2: Query for Table Names

# In[ ]:


show_tables_query = "SHOW tables" 
cursor.execute(show_tables_query)
results = cursor.fetchall()

for row in results:
    print(row)


# Task 3: Table Join

# In[ ]:


query_stmt = """
SELECT customers.FullName, customers.ContactNumber, orders.TotalCost AS `BillAmount`
FROM customers
JOIN orders
ON customers.CustomerID = orders.CustomerID
WHERE orders.TotalCost > 60;
"""
cursor.execute(query_stmt)
results = cursor.fetchall()

print(cursor.column_names)
for row in results:
    print(row)


# Closing Connection

# In[ ]:


cursor.close()
connection.close()


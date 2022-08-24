#!/usr/bin/python3

import os
import json
import sqlparse

import pandas as pd
import numpy as np

import connection
import conn_warehouse

if __name__ == '__main__':
    print(f"[INFO] Service ETL is Starting .....")
    conn_dwh, engine_dwh  = conn_warehouse.conn()
    cursor_dwh = conn_dwh.cursor()

    conf = connection.config('postgresql')
    conn, engine = connection.psql_conn(conf)
    cursor = conn.cursor()

    path_query = os.getcwd()+'/query/'
    query = sqlparse.format(
        open(
            path_query+'query_fact_orders.sql','r'
            ).read(), strip_comments=True).strip()

    query_dwh = sqlparse.format(
        open(
            path_query+'dwh_fact_orders.sql','r'
            ).read(), strip_comments=True).strip()
    try:
        print(f"[INFO] Service ETL is Running .....")
        df = pd.read_sql(query, engine)
        
        cursor_dwh.execute(query_dwh)
        conn_dwh.commit()

        df.to_sql('fact_orders', engine_dwh, if_exists='append', index=False)
        print(f"[INFO] Service ETL is Success .....")
    except:
        print(f"[INFO] Service ETL is Failed .....")

    

    
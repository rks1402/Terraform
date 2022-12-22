import base64
import json
import logging
import os
from typing import Dict
import time

from google.cloud import storage
from google.cloud.storage import Blob
from io import BytesIO

import pandas as pd
import openpyxl

from google.cloud import datastore


datastore_client = datastore.Client()
kind = "EmpDetails"
project_id = "bucket-demo-007"

def hello_gcs(event, context):

  file = event
  file_name = file['name']
  storage_client = storage.Client()
  bucket = storage_client.get_bucket('excel-file-001')
  blob = bucket.blob(file_name)

  binary_stream = blob.download_as_string()
  my_data=pd.read_excel(BytesIO(binary_stream))

  print(my_data)
  print(type(my_data))

  for i in range(len(my_data)):
    emp_id=str(my_data.loc[i,"Employee_ID"])
    emp_key = datastore_client.key(kind, emp_id)
    #print(emp_key)
    employee = datastore.Entity(key=emp_key)
    employee['Employee_ID'] = int(my_data.loc[i,"Employee_ID"])
    employee['Employee_Name'] = str(my_data.loc[i,"Employee_Name"])
    employee['Score'] = float(my_data.loc[i,"Score"])
    datastore_client.put(employee)
    print(emp_id)

  print("Records saved successfully")
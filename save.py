import serial
import csv
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
import time


cred = credentials.Certificate('')  # Replace with your own service account key path
firebase_admin.initialize_app(cred, {
    'databaseURL': ''  # Replace with your Firebase Realtime Database URL
})


ser = serial.Serial('COM5', 9600)  

ref = db.reference('/')

filename = 'sensor_data.csv'
fieldnames = ["Temperature", "TDS Value", "Flow Value", "Flow Value 01", "Flow Value 02"]
file = open(filename, 'w', newline='')
csv_writer = csv.DictWriter(file, fieldnames=fieldnames)
csv_writer.writeheader()


while True:
    if ser.in_waiting > 0:
        data = ser.readline().decode().strip().split(',')

        if len(data) >= 5:
          
            ref.update({
                'Temperature': data[0],
                'TDS_Value': data[1],
                'Flow_Value': data[2],
                'Flow_Value_01': data[3],
                'Flow_Value_02': data[4]
            })

          
            print("Temperature:", data[0])
            print("TDS Value:", data[1])
            print("Flow Value:", data[2])
            print("Flow Value 01:", data[3])
            print("Flow Value 02:", data[4])
            print()
        else:
            print("Invalid data format:", data)

    time.sleep(2)
file.close()
ser.close()

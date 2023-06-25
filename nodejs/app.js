const express = require('express');
const admin = require('firebase-admin');
const path = require('path');
const serviceAccount = path.resolve('');//Replace with your own service account key path
let al,al1,temperature,tds,flow0,flow1,flow2,Tur,Ph; 
const fs = require('fs');
const ejs = require('ejs');


admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: '' //Replace with your Firebase Realtime Database URL
});


const app = express();


app.get('/sensor-data', async (req, res) => {
  try {
    const snapshot = await admin.database().ref().once('value');
    const data = snapshot.val();
    if (data) {    
       temperature = data.Temperature;
       tds = data.TDS_Value;
       flow0 = data.Flow_Value
       flow1 = data.Flow_Value_01;
       flow2 = data.Flow_Value_02;
       Tur  = data.Turbidity;
       Ph  = data.PH;
    
        if(tds>= 20){
            al = "Alert the TDS value is "+ tds;
          
        }
        if(Tur>100){
          al1= Tur;
        }
        
      const sensorData={
        temperature,tds,flow0,flow1,flow2,Tur,Ph,al,al1,
      };
      res.json(sensorData);
    } else {
      res.send('No data available');
    }
  } catch (error) {
    console.error('Error retrieving data:', error);
    res.status(500).send('An error occurred');
  }
},
);


const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

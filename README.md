# IoT:Sensor Data Monitoring

Welcome to the **IoT Project: Sensor Data Monitoring** repository! This project aims to collect and monitor sensor data using an Arduino Uno, TDS sensor, water temperature sensor, and three water flow sensors. The gathered data is then displayed in real-time on a Flutter application. The repository contains all the necessary code and resources for this project.

## Repository Contents

The repository is organized into the following sections:

### Arduino

The Arduino directory contains the code necessary for reading sensor data from the Arduino Uno and printing the values in the serial monitor. The following libraries are used:

- `DallasTemperature.h`
- `OneWire.h`

### Python

The Python directory contains the code responsible for uploading the sensor data to the Firebase Realtime Database. It utilizes the following libraries:

- `serial`
- `csv`
- `firebase_admin`
- `time`

### Node.js

The Node.js directory contains the code for a Node.js and Express application that displays the sensor data as JSON on the localhost. The application uses the following libraries:

- `ejs` (v3.1.9)
- `express` (v4.18.2)
- `firebase-admin` (v11.8.0)
- `pug` (v3.0.2)

### Flutter

The Flutter directory contains the code for a Flutter application that displays the real-time sensor data. The application relies on the following dependencies:

- `cupertino_icons` (v1.0.2)
- `web_socket_channel` (v2.4.0)
- `http` (v0.13.6)
- `image_card` (v0.0.4)

## Project Workflow

1. The Arduino Uno reads sensor data and prints the values in the serial monitor.
2. The Python program reads the sensor values from the serial port and uploads them to the Firebase Realtime Database.
3. The Node.js and Express application fetches the sensor data from the database and displays it as JSON on the localhost at port 3000.
4. The Flutter application connects to the Node.js server using web sockets and displays the real-time sensor data.

## Getting Started

To set up and run the project locally, follow these steps:

1. Clone this repository to your local machine.
2. Connect the Arduino Uno to your computer and upload the Arduino code located in the `Arduino` directory.
3. Install the necessary Python dependencies by running `pip install -r requirements.txt` in the `Python` directory.
4. Set up a Firebase project and obtain the necessary credentials. Update the Python code with your Firebase credentials.
5. Start the Node.js and Express application by navigating to the `Node.js` directory and running `npm install` followed by `npm start`.
6. Launch the Flutter application by going to the `Flutter` directory and running `flutter run`.

Please ensure that you have the required software and libraries installed for Arduino, Python, Node.js, and Flutter to successfully run the project.

## Contributing

Contributions to this project are highly appreciated! If you encounter any issues or have suggestions for improvement, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use the code provided in this repository as a reference or modify it to suit your needs.

## Acknowledgments

Special thanks to the developers of the libraries and frameworks used in this project for their valuable contributions.

**Note:** Remember to provide proper attribution and documentation for any external resources or code you use in your project.



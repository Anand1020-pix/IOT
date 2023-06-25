import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> sensorData = {};

  Future<void> fetchSensorData() async {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:3000/sensor-data'));
      if (response.statusCode == 200) {
        setState(() {
          sensorData = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to fetch sensor data');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSensorData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sensor Data App",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 120,
                      height: 100,
                      child: ListTile(
                        title: Text(
                          ' ${sensorData['tds'] ?? '-'}',
                          style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 116, 167, 255)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: const Text(
                          "TDS Value",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 120,
                      height: 100,
                      child: ListTile(
                        title: Text(
                          ' ${sensorData['temperature'] ?? '-'}',
                          style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 116, 167, 255)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: const Text(
                          "Temperature (°C)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 120,
                      height: 100,
                      child: ListTile(
                        title: Text(
                          ' ${sensorData['flow'] ?? '-'}',
                          style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 116, 167, 255)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: const Text(
                          "Flow Rate (Ml/s)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 120,
                      height: 100,
                      child: ListTile(
                        title: Text(
                          ' ${sensorData['Ph'] ?? '-'}',
                          style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 116, 167, 255)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: const Text(
                          "PH",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 120,
                      height: 100,
                      child: ListTile(
                        title: Text(
                          ' ${sensorData['Tur'] ?? '-'}',
                          style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 116, 167, 255)),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: const Text(
                          "Turbidity",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 400,
                      height: 190,
                      child: ListView(
                        children: const <Widget>[
                          Center(
                            child: Text(
                              "😇",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Center(
                            child: Text(
                              "The Water that your are getting,is pristine and very healthy to consume. Help Our Planet by reducing you consumption too.",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Card(
                    elevation: 10,
                    child: SizedBox(
                      width: 400,
                      height: 100,
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          Container(
                            height: 30,
                            color: Colors.blue,
                            child: const Center(
                                child: Text(
                              'Alerts',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

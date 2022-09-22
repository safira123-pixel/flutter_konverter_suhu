import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double fahrenheit = 0;
  double reamur = 0;

  konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);
      kelvin = inputUser + 237;
      fahrenheit = 9 / 5 * inputUser + 32;
      reamur = 4 / 5 * inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Converter"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Masukkan Nilai Suhu"),
                //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: etInput,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Kelvin",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$kelvin',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Farenheit",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$fahrenheit',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Reamur",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$reamur',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Raised Button"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                  ),
                  onPressed: konversi,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
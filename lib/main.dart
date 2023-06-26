// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({Key? key}) : super(key: key);

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  int numberOfSeconds = 10;
  Timer? repeatedFunction;

  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        if (numberOfSeconds > 0) {
          numberOfSeconds--;
        } else {
          Timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 12,
        backgroundColor: Color.fromARGB(255, 63, 132, 126),
        title: Text(
          "simple_project",
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 54, 74, 83),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (numberOfSeconds > 0)
                ? numberOfSeconds.toString().padLeft(
                      2,
                      "0",
                    )
                : "✔",
            style: (numberOfSeconds > 0)
                ? TextStyle(
                    fontSize: 80, color: Color.fromARGB(255, 33, 167, 188))
                : TextStyle(
                    fontSize: 55, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "seconds",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTimer();
                  if (numberOfSeconds == 0) {
                    setState(() {
                      numberOfSeconds = 4;
                    });
                  }
                },
                child: Text(
                  "Start Timer",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 25, 120, 197)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
              ),
              SizedBox(
                width: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  repeatedFunction!.cancel();
                },
                child: Text(
                  "STOP TIMER",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 197, 25, 97)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

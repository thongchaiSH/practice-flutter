import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int card = 3;

  void randomCard() {
    setState(() => card = Random().nextInt(51) + 1);
    print("assets/card/$card.png");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //banner
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Random Card"),
            centerTitle: true,
            elevation: 5.0,
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(75),
                  child: Image.asset("assets/card/$card.png"),
                ),
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  padding: EdgeInsets.all(30),
                  color: Colors.lightBlue,
                  child: Text(
                    "PRESS TO RANDOM",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: randomCard,
                ),
              )
            ],
          )),
    );
  }
}

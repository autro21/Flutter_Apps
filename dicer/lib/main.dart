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
  int leftDice = 1, rightDice = 1;
  void getNumber(){
    setState(() {

      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Dice"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                  child: FlatButton(
                    onPressed: (){
                      getNumber();
                    },
                    child: Image.asset("images/dice$leftDice.png"),
                  )),
              Expanded(
                  child: FlatButton(
                    onPressed: (){
                      getNumber();
                    },
                    child: Image.asset("images/dice$rightDice.png")
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

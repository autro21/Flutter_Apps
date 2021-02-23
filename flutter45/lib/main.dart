import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter45/BMIBrain.dart';
import 'package:flutter45/BottomButton.dart';
import 'package:flutter45/ResultPage.dart';
import 'package:flutter45/RoundIconButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Constants.dart';
import 'Cubic.dart';
import 'IconContent.dart';

void main() {
  runApp(MyApp());
}

enum Gender { MALE, FEMALE }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0E21),
        accentColor: Colors.purple,
        primaryColor: Color(0xff0A0E21),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  int height = 120;
  int weight = 40;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI calculator")),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CubicSam(
                  color: selectedGender == Gender.MALE ? active : inActive,
                  son: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                  work: () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CubicSam(
                  color: selectedGender == Gender.FEMALE ? active : inActive,
                  son: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                  work: () {
                    setState(() {
                      selectedGender = Gender.FEMALE;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: CubicSam(
              color: inActive,
              son: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Text(
                    "HEIGHT",
                    style: labelStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: valueStyle,
                      ),
                      Text(
                        'CM',
                        style: labelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.pinkAccent,
                      overlayColor: Color(0x29eb1555),
                      activeTrackColor: Colors.pink,
                      inactiveTrackColor: Colors.grey[500],
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 45.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220,
                      onChanged: (double val) {
                        setState(() {
                          height = val.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: CubicSam(
                  color: inActive,
                  son: Column(
                    children: [
                      Text('WEIGHT', style: labelStyle),
                      Text(weight.toString(), style: valueStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  --weight;
                                });
                              }),
                          SizedBox(
                            width: 4.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  ++weight;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CubicSam(
                  color: inActive,
                  son: Column(
                    children: [
                      Text('AGE', style: labelStyle),
                      Text(age.toString(), style: valueStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  --age;
                                });
                              }),
                          SizedBox(
                            width: 4.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  ++age;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          BottomButton(
              title: 'Calculate your BMI',
              onTap: () {
                BMIBrain brain = BMIBrain(height, weight);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultPage(bmiResult: brain.calculateBMI(), resultText: brain.getResult(), interpretation: brain.getInterpretation());
                }));
              })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Cubic.dart';
import 'BottomButton.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: valueStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: CubicSam(
              color: active,
              son: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(color: Color(0xFF24D876), fontSize: 22.0),
                  ),
                  Text(
                    bmiResult,
                    style: valueStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Re-calculate',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

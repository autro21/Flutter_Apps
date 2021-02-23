import 'package:flutter/material.dart';
import 'package:gp_flutter/constants.dart';
import 'package:math_expressions/math_expressions.dart';

import 'CustomizedButton.dart';
import 'ParserOfExpression.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: Center(child: Text("Sam Calculator")),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        toQString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        ans,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: GridView.builder(
                      itemCount: calcItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int position) {
                        if (position == 0) {
                          return CustomizedButton(
                            onTap: () {
                              setState(() {
                                query.clear();
                                queryText = '';

                                ans = '0';
                              });
                            },
                            text: calcItems[position],
                            color: getBGColor(position),
                            textColor: getTextColor(position),
                          );
                        }
                        if (position == 1) {
                          return CustomizedButton(
                            onTap: () {},
                            text: calcItems[position],
                            color: getBGColor(position),
                            textColor: getTextColor(position),

                          );
                        }
                        if (position == 3) {
                          return CustomizedButton(
                            onTap: () {
                              setState(() {
                                deleteHelper();
                                if(query.isNotEmpty)
                                  getExpressionResult();
                                else
                                  ans = '';
                              });
                            },
                            text: calcItems[position],
                            color: getBGColor(position),
                            textColor: getTextColor(position),
                          );
                        }
                        if (position == 18) {
                          return CustomizedButton(
                            onTap: () {
                              setState(() {
                                getExpressionResult();
                                query.clear();
                                query.add(ans);
                              });
                            },
                            text: calcItems[position],
                            color: getBGColor(position),
                            textColor: getTextColor(position),
                          );
                        } else {
                          return CustomizedButton(
                            onTap: () {
                              setState(() {
                                insertInto(calcItems[position]);
                                if(!isOperator(calcItems[position]))getExpressionResult();
                              });
                            },
                            text: calcItems[position],
                            color: getBGColor(position),
                            textColor: getTextColor(position),
                          );
                        }
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void getExpressionResult(){
    String ret = toQString();


    Parser p = Parser();
    Expression exp = p.parse(ret);
    ans = (exp.evaluate(
        EvaluationType.REAL, ContextModel()))
        .toString();
  }
}

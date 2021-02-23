import 'package:flutter/material.dart';
import 'package:flutter45/Constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onTap;

  BottomButton({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: bottomColor,
        margin: EdgeInsets.only(top: 10.0),
        height: 80.0,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: bottomStyle,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

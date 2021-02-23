import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final color;
  final textColor;
  final String text;
  final onTap;

  CustomizedButton({this.color, this.textColor, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(0.2),
            child: ClipOval(

              child: Container(
                color: color,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

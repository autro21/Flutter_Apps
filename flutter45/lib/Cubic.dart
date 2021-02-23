import 'package:flutter/material.dart';

class CubicSam extends StatelessWidget {
  final Widget son;
  final Color color;
  final Function work;


  CubicSam({this.son, this.color, this.work});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: work,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: son,
      ),
    );
  }
}

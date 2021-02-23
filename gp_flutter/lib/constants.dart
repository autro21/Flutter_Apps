import 'dart:collection';

import 'package:flutter/material.dart';
String queryText = '';

String ans = '';
List<String> query = [];

final calcItems = [
  'C', '+/-', '%', 'DEL',
  '7', '8', '9', '/',
  '4', '5', '6', '*',
  '1', '2', '3', '-',
  '0', '.', '=', '+',
];
Color getBGColor(int i) {
  if(i == 18)
    return Colors.green[500];
  else{
    return Colors.white10;
  }
}
Color getTextColor(int i) {
  if(i == 18)
    return Colors.white;
  else if(i == 0)
    return Colors.red;
  else if(i >= 1 && i <= 3)
    {
      return Colors.green[500];
    }
  else{
    return isOperator(calcItems[i]) ? Colors.green[500]: Colors.white;
  }
}

bool isOperator(String x) {
  if (x == '/' || x == '*' || x == '-' || x == '+' || x == '=' || x == '%') {
    return true;
  }
  return false;
}

class Stack<T>{
final _stack = Queue<T>();

int get length => _stack.length;

bool get empty => _stack.isEmpty;

void clear() => empty ? _stack : _stack.clear();

void push(T value) => _stack.addLast(value);

T pop() => _stack.removeLast();

T top() => _stack.last;

operator [](List<dynamic> list) {
  for(var val in list)
    _stack.add(val);
}
}
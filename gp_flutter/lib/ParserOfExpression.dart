import 'constants.dart';
import 'dart:collection';

/*
 I will complete the implementation later;

*/
String insertInto(String val){
  if(query.isEmpty)
  {
    if(isOperator(val))
      {
        return toQString();
      }
    query.add(val);
    return val;
  }
  if(isOperator(query.last))
  {
    if(isOperator(val))
    {
      query.removeLast();
    }
    query.add(val);
  }
  else{
    if(isOperator(val))
    {
      query.add(val);
    }
    else{
      String tmp = query.last;
      if(val == '.'){
        for(int i = 0; i < tmp.length; ++i)
          {
            if(tmp[i] == val)
              {
                return toQString();
              }
          }
      }
      query.removeLast();
      tmp = tmp + val;
      int iZero = 0;
      while(iZero < tmp.length && tmp[iZero] == '0')
        ++iZero;
      print(iZero);
      tmp = tmp.substring(iZero);
      query.add(tmp);
    }
  }
  return toQString();
}
String deleteHelper(){
  if(query.isNotEmpty)
    {
      String tmp = query.removeLast();

      tmp = tmp.substring(0, tmp.length - 1);
      if(tmp.isNotEmpty)
        query.add(tmp);
    }
  return toQString();
}

String toQString(){
  String ret = "";
  for(var i in query)
  {
    ret += i;
  }
  return ret;
}
String calculateResult(){
  var tmpRes = 0;
  Stack<Node> stack;

  for(int i = 1; i <  query.length - 1; ++i)
    {
      var x = query[i];
      Node curr = Node(val: query[i], left: null, right: null);
      if(isOperator(x))
        {
          curr.left = stack.pop();

          curr.right = Node(val: query[i + 1], left: null, right: null);
          ++i;
        }
        stack.push(curr);
    }
  return tmpRes.toStringAsFixed(5);
}

dynamic convertString(String value)
{
  int x = int.tryParse(value);
  double y = double.tryParse(value);
  if(x == y)
    return x;
  else
    return y;
}

class Node{
  String val;
  Node left, right;

  Node({this.val, this.left, this.right});

}
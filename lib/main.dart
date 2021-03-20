import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

import './widgets/Buttons.dart';
import './widgets/Zero.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String history = '';
  String expression = '';

  void numClick(String text) {
    setState(() => expression += text);
  }

  void PlusAndMinus(String text) {
    setState(() {
      expression = '-';
    });
  }

  void clear(String text) {
    setState(() {
      expression = '';

    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();

    setState(() {
      history = expression;
      expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF303030),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style:(
                      TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      )
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    expression,
                    style:(
                       TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      )
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(

                children: <Widget>[
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF424242,
                    textSize: 35,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '+-',
                    fillColor: 0xFF424242,
                    callback: PlusAndMinus,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFF424242,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFFFF8F00,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: 0xFFFF8F00,
                    textSize: 24,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFF8F00,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFFFF8F00,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Zero(
                    text: '0',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '.',
                    fillColor: 0xFF616161,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFFFF8F00,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
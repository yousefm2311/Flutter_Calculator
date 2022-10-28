// ignore_for_file: avoid_unnecessary_containers

import 'package:calculator_app/layout/component/bottom.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestions = '';
  var userAnswer = '';
  final List<String> bottons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: [
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child:
                      Text(userQuestions, style: const TextStyle(fontSize: 22)),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(userAnswer, style: const TextStyle(fontSize: 22)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: GridView.builder(
              itemCount: bottons.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return MyBottom(
                    textBottom: bottons[index],
                    textColor: Colors.white,
                    color: Colors.green,
                    bottonTap: () {
                      setState(() {
                        userQuestions = '';
                      });
                    },
                  );
                } else if (index == bottons.length - 2) {
                  return MyBottom(
                    textBottom: bottons[index],
                    textColor: Colors.deepPurple,
                    color: Colors.deepPurple[50],
                    bottonTap: () {
                      setState(() {
                        userQuestions =
                            'Sorry, it is not developed Please try again';
                      });
                    },
                  );
                } else if (index == 1) {
                  return MyBottom(
                    textBottom: bottons[index],
                    textColor: Colors.white,
                    color: Colors.red,
                    bottonTap: () {
                      setState(() {
                        userQuestions = userQuestions.substring(
                            0, userQuestions.length - 1);
                      });
                    },
                  );
                } else if (index == bottons.length - 1) {
                  return MyBottom(
                    textBottom: bottons[index],
                    textColor: Colors.white,
                    color: Colors.deepPurple,
                    bottonTap: () {
                      setState(() {
                        equalPressed();
                      });
                    },
                  );
                } else {
                  return MyBottom(
                    bottonTap: () {
                      setState(() {
                        userQuestions += bottons[index];
                      });
                    },
                    textBottom: bottons[index],
                    textColor: isOperation(bottons[index])
                        ? Colors.white
                        : Colors.deepPurple,
                    color: isOperation(bottons[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50],
                  );
                }
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
            ),
          ),
        ),
      ]),
    );
  }

  bool isOperation(String x) {
    if (x == 'x' || x == '-' || x == '+' || x == '/' || x == '%') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestions;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}

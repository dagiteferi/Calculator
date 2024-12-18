import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  String _result = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'CLEAR') {
        _input = '';
        _result = '';
      } else if (buttonText == '=') {
        _evaluateExpression();
      } else {
        _input += buttonText;
      }
    });
  }

  void _evaluateExpression() {
    try {
      Expression expression = Expression.parse(_input.replaceAll('X', '*'));
      final evaluator = const ExpressionEvaluator();
      var context = <String, dynamic>{};
      num result = evaluator.eval(expression, context);
      setState(() {
        _result = result.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: <Color>[
                  Color(0xffDA4453),
                  Color(0xff89216B),
                ],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            shadows: const <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Display for the result
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Colors.pink, width: 3.0), // Adjusted border color
                  right: BorderSide(
                      color: Colors.pink, width: 1.0), // Adjusted border color
                  bottom: BorderSide(
                      color: Colors.black, width: 1.0), // Adjusted border color
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.pink, width: 1.0), // Thinner bottom line
                  ),
                ),
                child: Text(
                  _result.isEmpty ? _input : _result,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          // Button grid with light blue background color
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.lightBlue[100], // Set background color
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: GridView.count(
                      crossAxisCount: 4,
                      padding: const EdgeInsets.all(6.0),
                      mainAxisSpacing: 2.0, // Adjusted spacing
                      crossAxisSpacing: 2.0, // Adjusted spacing
                      children: [
                        '1',
                        '2',
                        '3',
                        '/',
                        '4',
                        '5',
                        '6',
                        'X',
                        '7',
                        '8',
                        '9',
                        '-',
                        '.',
                        '0',
                        '00',
                        '+'
                      ].map((text) {
                        return ElevatedButton(
                          onPressed: () => _onButtonPressed(text),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16.0), // Adjusted padding
                            backgroundColor:
                                Colors.lightBlue[100], // Light blue background
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(35), // Adjusted radius
                              side: BorderSide(
                                  color: const Color.fromARGB(255, 95, 125,
                                      150), // Adjusted border color
                                  width: 0.1), // Thinner border color
                            ),
                          ),
                          child: Text(
                            text,
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold), // Bold text
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Bottom row with CLEAR and = buttons
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () => _onButtonPressed('CLEAR'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16.0), // Adjusted padding
                              backgroundColor: Colors
                                  .lightBlue[100], // Light blue background
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    40), // Adjusted radius
                                side: BorderSide(
                                    color: const Color.fromARGB(255, 95, 125,
                                        150), // Adjusted border color
                                    width: 0.1), // Thinner border color
                              ),
                            ),
                            child: const Text(
                              'CLEAR',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold), // Bold text
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () => _onButtonPressed('='),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16.0), // Adjusted padding
                              backgroundColor: Colors
                                  .lightBlue[100], // Light blue background
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    40), // Adjusted radius
                                side: BorderSide(
                                    color: const Color.fromARGB(255, 95, 125,
                                        150), // Adjusted border color
                                    width: 0.1), // Thinner border color
                              ),
                            ),
                            child: const Text(
                              '=',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold), // Bold text
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

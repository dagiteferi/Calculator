import "package:flutter/material.dart";

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  String _result = '0';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'CLEAR') {
        _input = '';
        _result = '0';
      } else if (buttonText == '=') {
        String evaluatedResult = _evaluateExpression(_input);
        _result = evaluatedResult;
        _input = '';
      } else {
        _input += buttonText;
        _result = _input;
      }
    });
  }

  String _evaluateExpression(String expression) {
    expression = expression.replaceAll('X', '*');
    if (RegExp(r'[\+\-\*\/]$').hasMatch(expression)) {
      return 'Error';
    }

    List<String> tokens = expression
        .split(RegExp(r'([\+\-\*\/])'))
        .where((s) => s.isNotEmpty)
        .toList();
    if (tokens.length < 3 && tokens.length != 1) {
      return 'Error';
    }

    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double nextOperand = double.parse(tokens[i + 1]);

      switch (operator) {
        case '+':
          result += nextOperand;
          break;
        case '-':
          result -= nextOperand;
          break;
        case '*':
          result *= nextOperand;
          break;
        case '/':
          if (nextOperand == 0) {
            return 'Error';
          }
          result /= nextOperand;
          break;
        default:
          return 'Error';
      }
    }

    return result.toString();
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
                  top: BorderSide(color: Colors.red, width: 3.0),
                  right: BorderSide(color: Colors.red, width: 3.0),
                  bottom: BorderSide(color: Colors.black, width: 3.0),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.red, width: 4.0),
                  ),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Button grid
          Expanded(
            flex: 5,
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
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
                '+',
                'CLEAR',
                '='
              ].map((text) {
                Color? buttonColor = Colors.lightBlue[50];
                if (['+', '-', 'X', '/', '=', 'CLEAR'].contains(text)) {
                  buttonColor = Colors.orange;
                }
                return ElevatedButton(
                  onPressed: () => _onButtonPressed(text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

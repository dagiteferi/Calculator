import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '0'; // Define the input variable
  String _result = '';
  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'CLEAR') {
        _input = '0';
      } else if (buttonText == '=') {
        try {
          // Evaluate the expression (using a simple approach)
          _result = _evaluateExpression(_input);
        } catch (e) {
          _result = 'Error';
        }
        _input = _result;
      } else {
        if (_input == '0') {
          _input = buttonText;
        } else {
          _input += buttonText;
        }
      }
    });
  }

  String _evaluateExpression(String expression) {
    // This is a placeholder for evaluating the expression. // You might want to use a proper expression parser for complex calculations. // For simplicity, we're just returning the expression here.
    return expression;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
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
                  _input,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: <Widget>[
                _buildButton('1', Colors.grey, () => _onButtonPressed('1')),
                _buildButton('2', Colors.grey, () => _onButtonPressed('2')),
                _buildButton('3', Colors.grey, () => _onButtonPressed('3')),
                _buildButton('/', Colors.orange, () => _onButtonPressed('/')),
                _buildButton('4', Colors.grey, () => _onButtonPressed('4')),
                _buildButton('5', Colors.grey, () => _onButtonPressed('5')),
                _buildButton('6', Colors.grey, () => _onButtonPressed('6')),
                _buildButton('X', Colors.orange, () => _onButtonPressed('X')),
                _buildButton('7', Colors.grey, () => _onButtonPressed('7')),
                _buildButton('8', Colors.grey, () => _onButtonPressed('8')),
                _buildButton('9', Colors.grey, () => _onButtonPressed('9')),
                _buildButton('-', Colors.orange, () => _onButtonPressed('-')),
                _buildButton('.', Colors.grey, () => _onButtonPressed('.')),
                _buildButton('0', Colors.grey, () => _onButtonPressed('0')),
                _buildButton('00', Colors.orange, () => _onButtonPressed('00')),
                _buildButton('+', Colors.orange, () => _onButtonPressed('+')),
                GridTile(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildButton('CLEAR', Colors.grey,
                            () => _onButtonPressed('CLEAR')),
                      ),
                      Expanded(
                          child: _buildButton(
                              '=', Colors.orange, () => _onButtonPressed('='))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(20.0),
        textStyle: const TextStyle(fontSize: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () => _onButtonPressed(text),
      child: Text(text, style: const TextStyle(color: Colors.blue)),
    );
  }
}

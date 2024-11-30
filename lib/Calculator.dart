import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.red, width: 3.0),
                //left: BorderSide(color: Colors.black, width: 3.0),
                right: BorderSide(color: Colors.red, width: 3.0),
                bottom: BorderSide(color: Colors.black, width: 3.0),
                //bottom: BorderSide(color: Colors.red, width: 3.0),
              ),

              // child: Text( _input,
              //  style: TextStyle(
              //   fontSize: 48.0,
              //   fontWeight: FontWeight.bold,
              //   ),
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 3.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Calculator.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}




//         Create a StatefulWidget for the calculator.

// Design the Display Screen using a Text widget inside a Container.

// Create Buttons using ElevatedButton widgets.

// Arrange Buttons in a GridView.

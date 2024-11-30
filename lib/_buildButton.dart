import 'package:flutter/material.dart';

Widget _buildButton(String text, Color color, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(20.0),
      textStyle: const TextStyle(fontSize: 24),
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}

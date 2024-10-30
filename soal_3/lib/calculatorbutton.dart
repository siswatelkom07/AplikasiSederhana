import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) callback;

  const CalculatorButton({Key? key, required this.text, required this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        )
      ),
      onPressed: () => callback(text),
      child: Text(text, style: const TextStyle(fontSize: 24)),
    );
  }
}

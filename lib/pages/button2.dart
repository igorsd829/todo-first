import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton2({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      minWidth: 80,
      height: 50,
      color: Colors.black54,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

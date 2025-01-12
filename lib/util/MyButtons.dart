import 'package:flutter/material.dart';

class MyBtns extends StatelessWidget {
  final String btnName;
  VoidCallback onPressed;

  MyBtns({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        btnName,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.deepPurple,
    );
  }
}

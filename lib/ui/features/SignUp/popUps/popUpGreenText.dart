import 'package:flutter/material.dart';

class PopUpGreenText extends StatelessWidget {
  final String text;
  const PopUpGreenText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
        fontSize: 16,
        color: Colors.green[700],
        fontWeight: FontWeight.bold
    ),
    );
  }
}
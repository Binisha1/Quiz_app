

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onAnswer});
  final String answer;
  final void Function(String answer) onAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          onAnswer(answer);
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)))),
        child: Text(
          answer,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

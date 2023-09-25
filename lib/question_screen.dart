
import 'package:flutter/material.dart';
import 'package:pquiz/answer_button.dart';
import 'package:pquiz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAns});
  final void Function(String answer) onSelectAns;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var _currentIndex = 0;
  void onAnswer(answer) {
    setState(() {
      widget.onSelectAns(answer);
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[_currentIndex];
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
      
        children: [
          Text(
            currentQuestion.question,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...currentQuestion.shuffleAns.map((answer) {
            return AnswerButton(answer: answer, onAnswer: onAnswer);
          })
        ],
      ),
    );
  }
}

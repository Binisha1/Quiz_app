import 'package:flutter/material.dart';
import 'package:pquiz/question_screen.dart';
import 'package:pquiz/result_screen.dart';
import 'package:pquiz/start_screen.dart';
import 'package:pquiz/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  var selectedAnswer = [];

  void onStart() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onSelectAns(String answer) {
    setState(() {
      selectedAnswer.add(answer);
      if (selectedAnswer.length == questions.length) {
        activeScreen = 'result-screen';
      }
    });
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(onStart: onStart);
    if (activeScreen == 'start-screen') {
      screen = StartScreen(onStart: onStart);
    }
    if (activeScreen == 'question-screen') {
      screen = QuestionScreen(onSelectAns: onSelectAns);
    }
    if (activeScreen == 'result-screen') {
      screen = ResultScreen(
        restart: restart,
        selectedAnswer: selectedAnswer,
      );
    }
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 39, 118, 147),
              Color.fromARGB(255, 114, 58, 129)
            ],
          ),
        ),
        child: screen);
  }
}

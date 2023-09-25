import 'package:flutter/material.dart';
import 'package:pquiz/data/questions.dart';
import 'package:pquiz/result_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.restart, required this.selectedAnswer});
  final void Function() restart;
  final List selectedAnswer;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': questions[i].question,
          'user-answer': selectedAnswer[i],
          'correct-answer': questions[i].answer[0],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestion = questions.length;
    var correctAnswer = summaryData
        .where(
          (data) => data['user-answer'] == data['correct-answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResultSummary(summaryData: summaryData),
          const SizedBox(height: 50),
          Text(
            'Total Questions : $totalQuestion',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'Correct answers: $correctAnswer',
            style: const TextStyle(
                color: Color.fromARGB(255, 52, 239, 10), fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.restart_alt_sharp),
            onPressed: restart,
            label: const Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

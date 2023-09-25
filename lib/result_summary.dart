import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 174, 174, 61),
                      ),
                      child: Text(
                          ((data['question-index'] as int) + 1).toString()),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 252, 227, 227),
                                  fontSize: 18),
                            ),
                            Text(
                              'Your ans    :   ${data['user-answer'] as String}',
                              style: TextStyle(
                                  color: data['user-answer'] ==
                                          data['correct-answer']
                                      ? const Color.fromARGB(255, 3, 244, 11)
                                      : const Color.fromARGB(255, 250, 29, 29),
                                  fontSize: 16),
                            ),
                            Text(
                              'correct ans:  ${data['correct-answer'] as String}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 166, 239, 19)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

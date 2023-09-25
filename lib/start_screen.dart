import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStart});

  final void Function() onStart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/quizq.png',
            width: 350,
          ),
          const SizedBox(height: 20),
          const Text(
            'Test Your knowledge',
            style: TextStyle(
              color: Color.fromARGB(255, 232, 146, 17),
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton(
              onPressed: onStart,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              ),
              child: const Text(
                'Start Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ))
        ],
      ),
    );
  }
}

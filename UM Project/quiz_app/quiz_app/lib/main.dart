import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey.shade700,
          backgroundColor: Colors.white,
        ),
      ),
      home: const Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int groupValue = 2;
  int currentQuestion = 0;
  int score = 0;
  String result = "";

  var questions = [
    'The sky is blue.',
    'Cats can fly.',
    'Flutter is a UI toolkit.',
  ];

  var answers = [1, 0, 1];

  void checkAnswer(int answer) {
    setState(() {
      groupValue = answer;
      if (answers[currentQuestion] == answer) {
        score++;
        result = "Correct!";
      } else {
        result = "Incorrect.";
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
        groupValue = 2;
        result = "";
      } else {
        result = "Quiz Completed! Final Score: $score";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentQuestion < questions.length)
              Text(
                questions[currentQuestion],
                style: const TextStyle(fontSize: 22),
              ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio(
                  activeColor: Colors.orange,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) => checkAnswer(e!),
                ),
                const Text("True"),
                const SizedBox(width: 20),
                Radio(
                  activeColor: Colors.orange,
                  value: 0,
                  groupValue: groupValue,
                  onChanged: (e) => checkAnswer(e!),
                ),
                const Text("False"),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: nextQuestion,
              child: const Text("Next"),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: result == "Correct!"
                  ? Colors.green
                  : result == "Incorrect."
                      ? Colors.red
                      : Colors.transparent,
              child: Text(
                result,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Score: $score",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

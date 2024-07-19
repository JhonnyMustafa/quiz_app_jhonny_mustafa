import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
  });

  // void backHome() {
  //   widget.onSelectedAnswer(selectedAnswer);
  //   // selalu di gunakan, jika untk mengubah state
  //   setState(() {
  //     //currentQuestionIndex = currentQuestionIndex + 1;
  //     currentQuestionIndex++;
  //   });
  // }

  final List<String> choosenAnswers;
  // void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    //looping
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numberOfCorrectAnswer out of $numberOfTotalQuestions questions"),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: getSummaryData()),
            // const Text('List of answers & questions...'),
            const SizedBox(height: 30),
            // TextButton(
            //   onPressed: () {},
            //   child: const Text('Restart quiz'),
            // ),

            OutlinedButton.icon(
                onPressed: () {
                  //const StartScreen(restartQuiz);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Quiz()));
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart quiz"))
          ],
        ),
      ),
    );
  }
}

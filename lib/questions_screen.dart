import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  //const QuestionsScreen({Key? key}) : super(key: key);
  const QuestionsScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // ini harus berubah, jika button di klik.
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    // selalu di gunakan, jika untk mengubah state
    setState(() {
      //currentQuestionIndex = currentQuestionIndex + 1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    //return const Text("Questions screen");
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //cross nya itu row.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                // gunakan anonimus function.
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),

            // ...currentQuestion.answers.map((answer) {
            //   return AnswerButton(
            //     text: answer,
            //     onTap: () {},
            //   );
            // }),

            // AnswerButton(text: currentQuestion.answers[0], onTap: () {}),
            // AnswerButton(text: currentQuestion.answers[1], onTap: () {}),
            // AnswerButton(text: currentQuestion.answers[2], onTap: () {}),
            // AnswerButton(text: currentQuestion.answers[3], onTap: () {}),

            // ElevatedButton(onPressed: () {}, child: const Text("Answer 1")),
            // ElevatedButton(onPressed: () {}, child: const Text("Answer 2")),
            // ElevatedButton(onPressed: () {}, child: const Text("Answer 3")),
            // ElevatedButton(onPressed: () {}, child: const Text("Answer 4")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text("Start Screen"),

          //opcaity sendiri tidak di sarankan karena performance issue.

          Image.asset(
            'assets/images/flutter-quiz-logo.png',
            color: const Color.fromARGB(102, 233, 156, 156),
            width: 300,
          ),

          //utk membuat spasi secara invisible
          const SizedBox(
            height: 80,
          ),
          Text(
            "Learn Flutter the FUN way",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),

          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start Quiz"))

          // OutlinedButton(
          //   onPressed: () {},
          //   style: OutlinedButton.styleFrom(
          //     backgroundColor: Colors.white,
          //   ),
          //   child: const Text("Start Quiz"),
          // )
        ],
      ),
    );
  }
}

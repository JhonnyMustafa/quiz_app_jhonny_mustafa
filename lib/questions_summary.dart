import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: summaryData.map((data) {
            return Row(
              children: [
                //const SizedBox(height: 65),
                data['user_answer'] == data['correct_answer']
                    ? Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          backgroundColor: Colors.greenAccent,
                        ),
                      )
                    : Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          backgroundColor: Colors.redAccent,
                        ),
                      ),
                Expanded(
                  child: Column(
                    children: [
                      //Text(data['question'] as String),
                      Text(
                        data['question'] as String,
                        //textAlign: TextAlign.right,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),
                      data['user_answer'] == data['correct_answer']
                          ? Text(
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 28,
                              ),
                              data['user_answer'] as String)
                          : Text(
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 28,
                              ),
                              data['user_answer'] as String),

                      Text(
                        style: const TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 28,
                        ),
                        data['correct_answer'] as String,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

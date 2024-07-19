import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //variabel yg bertanggung jawab utk menentukan screen pd layar device
  //jika menggunakan var, maka bisa kurang jelas tipe data apa yg masuk ke sini.
  //maka perlu mengganti dari var ke widget.

  // tanda ? digunakan agar hidup tanpa di assign dl.
  //Widget? activeScreen;

  var activeScreen = 'start-screen';

  List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   super.initState();
  //   //activeScreen = StartScreen(switchScreen);
  // }

  //perlu ada nya fungsi manual sendiri utk mengganti2 state
  // nanti bisa di parsing, parsing function as a value.
  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      // selectedAnswers = [];
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //turnary
    // var screenWidget = activeScreen == 'start-screen'
    //           ? StartScreen(switchScreen)
    //           : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      //print ('testing');
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.greenAccent,
                Colors.deepOrange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: const StartScreen(),

          //child: activeScreen,
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),

          child: screenWidget,
        ),
      ),
    );
  }
}

// Widget getMeSomething() {
//   var activeScreen = 'start-screen';

//   // if (activeScreen == 'start-screen') {
//   //   return StartScreen(() {});
//   // } else {
//   //   return const QuestionsScreen();
//   // }
//   return activeScreen == 'start-screen'
// }

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/starting_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

const gradientColor1 = Color.fromARGB(255, 63, 4, 182);
const gradientColor2 = Color.fromARGB(255, 110, 55, 147);

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  // @override //Ovo sam radio prvo/ Gde koristim initState. Da ne bih koristio to, moze sa ternary operatorom, kao dole ispod.
  // void initState() {
  //   activeScreen = StartingScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void startAgain() {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Ovde ispod sam samo napravio promenljivu kako bih ternary operator koji je bio gde je sada promenljiva zamenio sa njom.
    Widget screenWidget = StartingScreen(switchScreen);
    if (activeScreen == "start-screen") {
      screenWidget = StartingScreen(switchScreen);
    } else if (activeScreen == "question-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        startAgain,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          gradientColor1,
          gradientColor2,
          screenWidget,
        ),
      ),
    );
  }
}

// class Quiz extends StatelessWidget {
//   const Quiz({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: GradientContainer(
//             gradientColor1, gradientColor2, QuestionsScreen()),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/custom_elevated_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 45),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                answerClicked: () {
                  answerQuestion(answer);
                },
              );
            }),
            // AnswerButton(answerText: currentQuestion.answers[0], answer: () {}),
            // const SizedBox(height: 15),
            // AnswerButton(answerText: currentQuestion.answers[1], answer: () {}),
            // const SizedBox(height: 15),
            // AnswerButton(answerText: currentQuestion.answers[2], answer: () {}),
            // const SizedBox(height: 15),
            // AnswerButton(answerText: currentQuestion.answers[3], answer: () {}),
          ],
        ),
      ),
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     body: Container(
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: [
    //             Color.fromARGB(255, 63, 4, 182),
    //             Color.fromARGB(255, 110, 55, 147)
    //           ],
    //           begin: Alignment.topLeft,
    //           end: Alignment.bottomRight,
    //         ),
    //       ),
    //       child: const Center(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             QuestionButton("1"),
    //             SizedBox(height: 40),
    //             QuestionButton("2"),
    //             SizedBox(height: 40),
    //             QuestionButton("3"),
    //             SizedBox(height: 40),
    //             QuestionButton("4"),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

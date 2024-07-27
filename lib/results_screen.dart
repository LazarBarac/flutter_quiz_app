import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen(
    this.startAgain, {
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question index": i,
          "question": questions[i].text,
          "correct answer": questions[i].answers[0],
          "user answer": chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  final void Function() startAgain;

  @override
  State<ResultsScreen> createState() {
    return _ResultsScreenState();
  }
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(context) {
    final sumarryData = widget.getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = sumarryData.where((data) {
      return data["user answer"] == data["correct answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            QuestionsSummary(sumarryData),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              onPressed: widget.startAgain,
              icon: const Icon(
                Icons.refresh,
                size: 22,
                color: Colors.white,
              ),
              label: Text(
                "Start Again",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

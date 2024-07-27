import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  State<StartingScreen> createState() {
    return _StartingScreenState();
  }
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(50, 255, 255, 255),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 30, right: 30),
                shape: const ContinuousRectangleBorder()),
            onPressed: widget.startQuiz,
            icon: const Icon(
              Icons.arrow_right_alt,
              size: 35,
              color: Colors.white,
            ),
            label: Text(
              "Start Quiz",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

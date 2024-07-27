import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.answerClicked,
  });

  final String answerText;
  final void Function() answerClicked;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 54, 2, 86),
          foregroundColor: const Color.fromARGB(172, 255, 255, 255),
          padding:
              const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
        ),
        onPressed: answerClicked,
        child: Text(
          answerText,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

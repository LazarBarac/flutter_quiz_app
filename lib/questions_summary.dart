import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: (data["user answer"] == data["correct answer"])
                          ? Colors.green
                          : const Color.fromARGB(255, 224, 56, 226),
                      borderRadius: const BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Text(
                      ((data["question index"] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 54, 1, 57),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 35),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["question"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 233, 190, 216),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data["correct answer"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 228, 16, 239),
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        data["user answer"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 113, 161, 233),
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 35),
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

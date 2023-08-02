import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ResultScreenMsg.dart';
import 'package:quiz_app/data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.allAns,this.onToHomePage, {super.key});

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> questionAns = [];
    for(var i = 0; i < allAns.length; i++) {
      questionAns.add({
        "question_index": i,
        "question":  questions[i].question,
        "user_answer": allAns[i],
        "correct_answer": questions[i].answers[0]
      });
    }
    return questionAns;
  }


  final List<String> allAns;
  final void Function() onToHomePage;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "All answers you make",
              style: GoogleFonts.lato(fontSize: 27, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            ResultScreenMsg(getSummary()),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: onToHomePage,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.lightBlue),
              child: Text(
                "Return to main Screen",
                style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      )
    );
  }
}

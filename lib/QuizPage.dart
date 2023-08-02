import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/AnswerButton.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(this.onAns,{super.key});

  final void Function(String ans) onAns;

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  int idx = 0;

  void nextQuest(String ans) {
    setState(() {
      ++idx;
    });
    widget.onAns(ans);
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[idx];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: GoogleFonts.lato(
                fontSize: 28,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...question.shuffleAnswers().map((e) {
              return AnswerButton(answer: e, invocation: () {
                nextQuest(e);
              });
            })
          ],
        ),
      )
    );
  }
}

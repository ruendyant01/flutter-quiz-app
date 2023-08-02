import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final Function() invocation;

  const AnswerButton({super.key, required this.answer, required this.invocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton(
        onPressed: invocation,
        style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromARGB(30, 170, 170, 170),
            padding: const EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))
        ),
        child: Text(
          answer,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

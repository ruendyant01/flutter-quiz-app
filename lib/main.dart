import 'package:flutter/material.dart';
import 'package:quiz_app/MainPage.dart';
import 'package:quiz_app/QuizPage.dart';
import 'package:quiz_app/ResultScreen.dart';
import 'package:quiz_app/data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }

}

class _MyApp extends State<MyApp> {
  Widget? activeScreen;
  List<String> userAns = [];

  void goToHomePage() {
    setState(() {
      activeScreen = HomePage(nextPage);
    });
  }

  void addAnswer(String ans) {
    userAns.add(ans);

    if(userAns.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(userAns, goToHomePage);
        userAns = [];
      });
    }
  }

  void nextPage() {
    setState(() {
      activeScreen = QuizPage(addAnswer);
    });
  }


  @override
  void initState() {
    super.initState();
    activeScreen = HomePage(nextPage);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.indigoAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Center(
                child: activeScreen
            )),
      ),
    );
  }

}
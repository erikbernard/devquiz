// import 'package:DevQuiz/home/home_page.dart';
// import 'package:DevQuiz/splash/splash_page.dart';
import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:devquiz/main.dart';
import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: ChallengePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_add/datas/question.dart';
import 'package:quiz_add/home_screen.dart';
import 'package:quiz_add/profile.dart';
import 'package:quiz_add/question_screen.dart';
import 'package:quiz_add/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if ( selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  void profileScreen () {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'profile-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(
      startQuiz: switchScreen,
      profile : profileScreen,
    );
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer : chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen'){
      screenWidget = ResultScreen(
        choosenAnswers : selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    if (activeScreen == 'profile-screen'){
      screenWidget = const Profile();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
                  child: screenWidget,
        ),
      ),
    );
  }
}

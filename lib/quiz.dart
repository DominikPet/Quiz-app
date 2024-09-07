import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
  List<String> selectedAnswers = [];
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      switchScreen();
    }
  }

  @override
  void initState() {
    activeScreen = InitialQuizScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      if(activeScreen.runtimeType ==  QuestionsScreen)
      {
        activeScreen = ResultsScreen(selectedAnswers, switchScreen);
        return;
      }
      else if(activeScreen.runtimeType ==  ResultsScreen)
      {
        activeScreen = InitialQuizScreen(switchScreen);
        return;
      }
      selectedAnswers = [];
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

class MainClass extends StatelessWidget {
  const MainClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Quiz());
  }
}

class InitialQuizScreen extends StatelessWidget {
  const InitialQuizScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 200,
          color: const Color.fromARGB(134, 255, 255, 255),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          'Learn Flutter the fun way!',
          style: GoogleFonts.spaceGrotesk(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
          onPressed: switchScreen,
          label: const Text(
            "Start Quiz",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

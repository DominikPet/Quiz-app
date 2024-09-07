import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget{
  ResultsScreen(this.selectedAnswers, this.switchScreen, {super.key});

  List<String> selectedAnswers;
  void Function() switchScreen;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];


    for(int i = 0; i < selectedAnswers.length; i++){
      summary.add({
        "question_index" : i,
        "question" : questions[i].questionText,
        "correct_answer" : questions[i].answers[0],
        "user_answer" : selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!", style: GoogleFonts.spaceGrotesk(color: const Color.fromARGB(185, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 20,), textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            ElevatedButton.icon(onPressed: switchScreen, label: const Text("Restart quiz"), icon: const Icon(Icons.refresh),)
          ],
        ),
      ),
    );
  }
  
}
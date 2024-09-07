import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen(this.chooseAnswer, {super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
      return __QuestionsScreenState();
  }
}

class __QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    widget.chooseAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
  final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.questionText, style: GoogleFonts.spaceGrotesk(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          const SizedBox(height: 50,),
          ...currentQuestion.getShuffledAnswers().map((e)  {
              return AnswerButton(e.toString(), () {answerQuestion(e.toString(),);});
          })
        ],
      ),
    );
  }
  
}
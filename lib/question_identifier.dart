import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  final bool isCorrectAnswer;
  
  final int questionIndex;

  const QuestionIdentifier(this.isCorrectAnswer, this.questionIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? const Color.fromARGB(195, 29, 250, 213) : const Color.fromARGB(141, 245, 37, 22),
      borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      );
  }
}
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerText, this.pressedFunction, {super.key});

  String answerText;
  void Function() pressedFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20,),
        ElevatedButton(
        onPressed: pressedFunction,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(166, 82, 2, 148),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100)),
        child: Text(answerText, textAlign: TextAlign.center,),
      ),],
    );
  }
}

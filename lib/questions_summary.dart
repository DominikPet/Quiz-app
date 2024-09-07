import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifier.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(children: 
          summaryData.map((data) {
            final isCorrectAnswer = data["user_answer"] == data["correct_answer"];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              QuestionIdentifier(isCorrectAnswer, data["question_index"] as int),
              const SizedBox(height: 20,),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                      Text(data["question"] as String, style: GoogleFonts.spaceGrotesk(color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 15,), textAlign: TextAlign.left,),
                      const SizedBox(height: 5,),
                      Text(data["user_answer"] as String, style:  GoogleFonts.spaceGrotesk(color: const Color.fromARGB(122, 255, 255, 255), fontSize: 13,), textAlign: TextAlign.left),
                      const SizedBox(height: 5,),
                      Text(data["correct_answer"] as String, style:  GoogleFonts.spaceGrotesk(color: const Color.fromARGB(255, 0, 200, 207), fontSize: 13,), textAlign: TextAlign.left,),
                    ]),
                  ),
                ),
              ),
            ],
            );
          }
          ).toList(),
        ),
      ),
    );
  }
  
}

class NumberCLipper extends CustomClipper<Rect>{
  @override
  getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
  
}
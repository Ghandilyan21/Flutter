import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/pages/start_page.dart';
import 'package:simple_quiz_app/reusable/my_gradient.dart';
import 'package:simple_quiz_app/reusable/result_answers.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key, required this.selectedAnswers});
  List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; ++i) {
      summary.add({
        'question-index': i,
        'question': questions[i].question,
        'correct-answer': questions[i].answers[0],
        'user-answer': selectedAnswers[i],
      });
    }
    return summary;
  }
  void _restartQuiz(BuildContext context) {
    selectedAnswers = [];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const StartPage();
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final totalQuestionNum = questions.length;
    final totalCorrectQuestionNum = getSummaryData().where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;
    return Scaffold(
      body: MyGradient(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You anserd $totalCorrectQuestionNum questions of $totalQuestionNum',
                style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.bold,),
              ),
              SizedBox(
                height: 50,
              ),
              ResultAnswers(
                summary: getSummaryData(),
                onRestart: _restartQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

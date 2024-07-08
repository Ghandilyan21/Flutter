import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/pages/result_page.dart';
import 'package:simple_quiz_app/reusable/answer_button.dart';
import 'package:simple_quiz_app/reusable/my_gradient.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> selectedAnswers = [];
  var currentIndex = 0;
  void answerQuestion() {
    setState(() {
      ++currentIndex;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      currentIndex = 0;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ResultPage(selectedAnswers: selectedAnswers);
          },
        ),
      );
    }
    answerQuestion();
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentIndex];
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: MyGradient(
            child: Container(
              margin: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentQuestion.question,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ...currentQuestion.getShuffledAnswers().map(
                    (answer) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: AnswerButton(
                          answer: answer,
                          onTap: () {
                            chooseAnswer(answer);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

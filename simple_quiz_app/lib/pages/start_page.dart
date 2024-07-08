import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz_app/pages/quiz_page.dart';
import 'package:simple_quiz_app/reusable/my_gradient.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyGradient(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: 0.7,
                child: Image.asset(
                  'assets/images/Flutter-Icon.png',
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Text(
                "Learn Flutter Fun Way",
                style: GoogleFonts.rubik(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.arrow_right_alt_rounded),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(),
                    ),
                  );
                },
                label: Text(
                  "Start Quiz,",
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

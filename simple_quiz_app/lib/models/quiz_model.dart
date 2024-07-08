class QuizModel {
  final String question;
  final List<String> answers;
  const QuizModel({
    required this.question,
    required this.answers,
  });

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}

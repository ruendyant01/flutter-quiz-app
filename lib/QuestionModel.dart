class QuestionModel {
  const QuestionModel(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> shuffleAnswers() {
    List<String> rest = List.from(answers);
    rest.shuffle();
    return rest;
  }
}
import 'package:flutter/material.dart';
import '../model/question.dart';
import '../data/dummy_data.dart';

class QuizProvider extends ChangeNotifier {
  String userName = '';
  int currentIndex = 0;
  final Map<int, String> selectedAnswers = {}; // questionId -> 'a'..'d'

  List<Question> get questions => dummyQuestions;
  int get total => questions.length;

  void setName(String name) {
    userName = name;
    notifyListeners();
  }

  void selectAnswer(int questionId, String optionLetter) {
    selectedAnswers[questionId] = optionLetter;
    notifyListeners();
  }

  void nextQuestion() {
    if (currentIndex < total - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  void prevQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      notifyListeners();
    }
  }

  int calculateScore() {
    int score = 0;
    for (final q in questions) {
      final selected = selectedAnswers[q.id];
      if (selected != null && selected == q.correctAnswer) score++;
    }
    return score;
  }

  void resetQuiz() {
    userName = '';
    currentIndex = 0;
    selectedAnswers.clear();
    notifyListeners();
  }

  void goToQuestionIndex(int i) {
    if (i >= 0 && i < total) {
      currentIndex = i;
      notifyListeners();
    }
  }
}

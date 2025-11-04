import '../model/question.dart';

final List<Question> dummyQuestions = [
  Question(
    id: 1,
    question: 'Hewan apakah ini?',
    options: ['Badak', 'Harimau', 'Ayam', 'Jerapah'],
    correctAnswer: 'a',
    imageAsset: 'assets/images/foto-badak.png',
  ),
  Question(
    id: 2,
    question: 'Hewan apakah ini?',
    options: ['Gajah', 'Harimau', 'Badak', 'Ayam'],
    correctAnswer: 'b',
    imageAsset: 'assets/images/foto-harimau.png',
  ),
  Question(
    id: 3,
    question: 'Hewan apakah ini?',
    options: ['Jerapah', 'Ayam', 'Badak', 'Gajah'],
    correctAnswer: 'b',
    imageAsset: 'assets/images/foto-ayam.png',
  ),
  Question(
    id: 4,
    question: 'Hewan apakah ini?',
    options: ['Gajah', 'Badak', 'Jerapah', 'Harimau'],
    correctAnswer: 'c',
    imageAsset: 'assets/images/foto-jerapah.png',
  ),
  Question(
    id: 5,
    question: 'Hewan apakah ini?',
    options: ['Gajah', 'Ayam', 'Harimau', 'Jerapah'],
    correctAnswer: 'a',
    imageAsset: 'assets/images/foto-gajah.png',
  ),
];

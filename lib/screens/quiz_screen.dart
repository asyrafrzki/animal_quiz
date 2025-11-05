import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/quiz_provider.dart';
import '../widgets/question_card.dart';
import '../widgets/option_tile.dart';
import '../widgets/custom_button.dart';
import 'result_screen.dart';

const Color primaryColor = Color(0xFF00C897);
const Color selectedOptionTextColor = Colors.white;

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<QuizProvider>(context);
    final questions = prov.questions;
    final q = questions[prov.currentIndex];
    final selectedAnswerLetter = prov.selectedAnswers[q.id];
    final w = MediaQuery.of(context).size.width;
    final bool isFirstQuestion = prov.currentIndex == 0;
    final bool isLastQuestion = prov.currentIndex == prov.total - 1;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 12),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Soal ${prov.currentIndex + 1} of ${prov.total}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontFamily: 'PoppinsCustom',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      QuestionCard(question: q, imageHeight: MediaQuery.of(context).size.height * 0.32),
                      const SizedBox(height: 20),
                      for (int i = 0; i < q.options.length; i++)
                        OptionTile(
                          letter: String.fromCharCode(97 + i),
                          text: q.options[i],
                          selected: selectedAnswerLetter == String.fromCharCode(97 + i),
                          onTap: () {
                            prov.selectAnswer(q.id, String.fromCharCode(97 + i));
                          },
                        ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'Sebelumnya',
                              onPressed: isFirstQuestion ? null : prov.prevQuestion,
                              expanded: true,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomButton(
                              text: isLastQuestion ? 'Selesai' : 'Berikutnya',
                              onPressed: () {
                                if (isLastQuestion) {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ResultScreen()));
                                } else {
                                  prov.nextQuestion();
                                }
                              },
                              expanded: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(prov.total, (i) {
                          final isAnswered = prov.selectedAnswers[prov.questions[i].id] != null;
                          return ElevatedButton(
                            onPressed: () => prov.goToQuestionIndex(i),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(12),
                              backgroundColor: prov.currentIndex == i
                                  ? primaryColor
                                  : (isAnswered ? Colors.green.shade400 : Colors.grey.shade400),
                              elevation: 2,
                            ),
                            child: Text(
                              '${i + 1}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'PoppinsCustom'),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
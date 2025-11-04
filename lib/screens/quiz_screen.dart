import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/quiz_provider.dart';
import '../widgets/question_card.dart';
import '../widgets/option_tile.dart';
import '../widgets/custom_button.dart';
import 'result_screen.dart';

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
    final selected = prov.selectedAnswers[q.id];
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Soal ${prov.currentIndex + 1} / ${prov.total}', style: const TextStyle(fontFamily: 'PoppinsCustom')),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 12),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      QuestionCard(question: q, imageHeight: MediaQuery.of(context).size.height * 0.32),
                      const SizedBox(height: 12),
                      // options
                      for (int i = 0; i < q.options.length; i++)
                        OptionTile(
                          letter: String.fromCharCode(97 + i), // a, b, c, d
                          text: q.options[i],
                          selected: selected == String.fromCharCode(97 + i),
                          onTap: () {
                            prov.selectAnswer(q.id, String.fromCharCode(97 + i));
                          },
                        ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: prov.currentIndex == 0 ? 'Kosong' : 'Sebelumnya',
                              onPressed: prov.currentIndex == 0 ? () {} : prov.prevQuestion,
                              expanded: true,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomButton(
                              text: prov.currentIndex == prov.total - 1 ? 'Selesai' : 'Berikutnya',
                              onPressed: () {
                                if (prov.currentIndex == prov.total - 1) {
                                  // go to result
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ResultScreen()));
                                } else {
                                  prov.nextQuestion();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // quick jump
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(prov.total, (i) {
                          final isAnswered = prov.selectedAnswers[prov.questions[i].id] != null;
                          return ElevatedButton(
                            onPressed: () => prov.goToQuestionIndex(i),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(12),
                              backgroundColor: prov.currentIndex == i ? Theme.of(context).colorScheme.primary : (isAnswered ? Colors.green : Colors.grey),
                            ),
                            child: Text('${i + 1}', style: const TextStyle(color: Colors.white, fontFamily: 'PoppinsCustom')),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/quiz_provider.dart';
import '../widgets/app_logo_header.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<QuizProvider>(context);
    final score = prov.calculateScore();
    final total = prov.total;
    final w = MediaQuery.of(context).size.width;
    final primaryColor = const Color(0xFF00C897);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Kuis',
          style: TextStyle(
            fontFamily: 'PoppinsCustom',
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06, vertical: 10),
              child: Column(
                children: [
                  AppLogoHeader(height: 100),
                  const SizedBox(height: 18),
                  Text(
                    'Halo, ${prov.userName}',
                    style: const TextStyle(
                      fontFamily: 'PoppinsCustom',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 30),
                          const SizedBox(width: 10),
                          Text(
                            'Skor Anda: $score / $total',
                            style: TextStyle(
                              fontFamily: 'PoppinsCustom',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                itemCount: prov.questions.length,
                itemBuilder: (context, idx) {
                  final q = prov.questions[idx];
                  final selected = prov.selectedAnswers[q.id];
                  final correct = q.correctAnswer;
                  final isCorrect = selected != null && selected == correct;

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isCorrect
                            ? Colors.green.shade400
                            : Colors.red.shade400,
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(q.imageAsset,
                                width: 64, height: 64, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  q.question,
                                  style: const TextStyle(
                                    fontFamily: 'PoppinsCustom',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                      fontFamily: 'PoppinsCustom',
                                      fontSize: 13,
                                    ),
                                    children: [
                                      const TextSpan(text: 'Jawaban Anda: '),
                                      TextSpan(
                                        text: '${selected ?? '-'}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isCorrect
                                              ? Colors.green.shade700
                                              : Colors.red.shade700,
                                        ),
                                      ),
                                      const TextSpan(text: ' • '),
                                      const TextSpan(text: 'Jawaban Benar: '),
                                      TextSpan(
                                        text: '$correct',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            isCorrect
                                ? Icons.check_circle_rounded
                                : Icons.cancel_rounded,
                            color: isCorrect
                                ? Colors.green.shade600
                                : Colors.red.shade600,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: w * 0.06, vertical: 15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    prov.resetQuiz();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Ulangi Kuis',
                      style: TextStyle(
                        fontFamily: 'PoppinsCustom',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

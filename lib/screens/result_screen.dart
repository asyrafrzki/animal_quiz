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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis', style: TextStyle(fontFamily: 'PoppinsCustom')),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.06, vertical: 20),
          child: Column(
            children: [
              AppLogoHeader(height: 120),
              const SizedBox(height: 18),
              Text(
                'Halo, ${prov.userName}',
                style: const TextStyle(fontFamily: 'PoppinsCustom', fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Text(
                'Skor Anda: $score / $total',
                style: TextStyle(fontFamily: 'PoppinsCustom', fontSize: 18),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.builder(
                  itemCount: prov.questions.length,
                  itemBuilder: (context, idx) {
                    final q = prov.questions[idx];
                    final selected = prov.selectedAnswers[q.id];
                    final correct = q.correctAnswer;
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Image.asset(q.imageAsset, width: 56, height: 56, fit: BoxFit.cover),
                        title: Text(q.question, style: const TextStyle(fontFamily: 'PoppinsCustom')),
                        subtitle: Text(
                          'Jawaban Anda: ${selected ?? '-'}  •  Jawaban Benar: $correct',
                          style: TextStyle(fontFamily: 'PoppinsCustom'),
                        ),
                        trailing: Icon(
                          selected != null && selected == correct ? Icons.check_circle : Icons.cancel,
                          color: selected != null && selected == correct ? Colors.green : Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        prov.resetQuiz();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('Ulangi', style: TextStyle(fontFamily: 'PoppinsCustom')),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

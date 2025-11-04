import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/quiz_provider.dart';
import 'quiz_screen.dart';
import '../widgets/app_logo_header.dart';
import '../widgets/custom_button.dart';

class NameInputScreen extends StatefulWidget {
  const NameInputScreen({super.key});

  @override
  State<NameInputScreen> createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final prov = Provider.of<QuizProvider>(context, listen: false);
    _controller.text = prov.userName;
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<QuizProvider>(context);
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.06, vertical: 20),
          child: Column(
            children: [
              AppLogoHeader(height: 140),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Masukkan nama Anda',
                  labelStyle: const TextStyle(fontFamily: 'PoppinsCustom'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: 'Mulai Kuis',
                onPressed: () {
                  final name = _controller.text.trim();
                  if (name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tolong masukkan nama')));
                    return;
                  }
                  prov.setName(name);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

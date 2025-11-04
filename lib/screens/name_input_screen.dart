import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/quiz_provider.dart';
import 'quiz_screen.dart';
import '../widgets/app_logo_header.dart';

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const Color _primaryColor = Color(0xFF00C897);
  static const Color _textColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<QuizProvider>(context);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.08, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogoHeader(height: h * 0.25, margin: EdgeInsets.zero),
              const SizedBox(height: 0),
              Text(
                'Masukkan nama Anda untuk memulai kuis!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PoppinsCustom',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: _textColor.withOpacity(0.85),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Nama Anda',
                  labelStyle: const TextStyle(fontFamily: 'PoppinsCustom'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: _primaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: _primaryColor, width: 2.5),
                  ),
                  floatingLabelStyle: const TextStyle(color: _primaryColor),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                ),
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontFamily: 'PoppinsCustom',
                  fontSize: 16,
                  color: _textColor,
                ),
                cursorColor: _primaryColor,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 8,
                  shadowColor: _primaryColor.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 48,
                  ),
                  minimumSize: const Size(200, 52),
                ),
                onPressed: () {
                  final name = _controller.text.trim();
                  if (name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tolong masukkan nama')),
                    );
                    return;
                  }
                  prov.setName(name);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizScreen()),
                  );
                },
                child: const Text(
                  'Mulai Kuis',
                  style: TextStyle(
                    fontFamily: 'PoppinsCustom',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
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

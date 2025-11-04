import 'package:flutter/material.dart';
import 'name_input_screen.dart';
import '../widgets/app_logo_header.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogoHeader(height: h * 0.22),
              const SizedBox(height: 24),
              const Text(
                'Siap Tebak Hewan?',
                style: TextStyle(fontFamily: 'PoppinsCustom', fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NameInputScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: Text('Mulai'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

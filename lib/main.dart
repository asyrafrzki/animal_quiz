import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/quiz_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/name_input_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tebak Hewan',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'PoppinsCustom',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/name': (context) => const NameInputScreen(),
          '/quiz': (context) => const QuizScreen(),
          '/result': (context) => const ResultScreen(),
        },
      ),
    );
  }
}

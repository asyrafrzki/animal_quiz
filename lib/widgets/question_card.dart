import 'package:flutter/material.dart';
import '../model/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final double imageHeight;

  const QuestionCard({super.key, required this.question, this.imageHeight = 180});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: imageHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              question.imageAsset,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          question.question,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'PoppinsCustom', fontSize: w * 0.045, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
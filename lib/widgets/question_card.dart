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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // image
        SizedBox(
          height: imageHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              question.imageAsset,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          question.question,
          style: TextStyle(fontFamily: 'PoppinsCustom', fontSize: w * 0.045, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

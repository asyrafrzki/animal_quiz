import 'package:flutter/material.dart';

class AppLogoHeader extends StatelessWidget {
  final double height;

  const AppLogoHeader({super.key, this.height = 120});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final logoSize = height;
    return Column(
      children: [
        SizedBox(
          height: logoSize,
          child: Image.asset(
            'assets/images/app-logo.png',
            fit: BoxFit.contain,
            width: logoSize,
            height: logoSize,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Tebak Hewan',
          style: TextStyle(
            fontFamily: 'PoppinsCustom',
            fontSize: w * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

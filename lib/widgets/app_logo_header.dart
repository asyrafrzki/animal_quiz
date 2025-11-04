import 'package:flutter/material.dart';

class AppLogoHeader extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? margin;

  const AppLogoHeader({
    super.key,
    this.height = 180,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: Image.asset(
        'assets/images/app-logo.png',
        fit: BoxFit.contain,
        height: height,
      ),
    );
  }
}

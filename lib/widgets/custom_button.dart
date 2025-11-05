import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF00C897);
const Color buttonDisabledColor = Colors.grey;
const Color selectedOptionTextColor = Colors.white;

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool expanded;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: onPressed != null ? primaryColor : buttonDisabledColor,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        textStyle: const TextStyle(fontFamily: 'PoppinsCustom', fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: selectedOptionTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return expanded ? Expanded(child: btn) : btn;
  }
}
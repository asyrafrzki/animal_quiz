import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF00C897);
const Color selectedOptionTextColor = Colors.white;

class OptionTile extends StatelessWidget {
  final String letter;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.letter,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
        color: selected ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: selected ? 4 : 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: w * 0.04),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? primaryColor : Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: selected ? selectedOptionTextColor : primaryColor.withOpacity(0.1),
                  child: Text(
                    letter.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'PoppinsCustom',
                      color: selected ? primaryColor : primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'PoppinsCustom',
                      fontSize: 16,
                      color: selected ? selectedOptionTextColor : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
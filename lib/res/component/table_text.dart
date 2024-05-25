import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTableCell extends StatelessWidget {
  final String? text;
  final Color textColor;
  final FontWeight? fontWeight;

  const CustomTableCell({
    super.key,
    this.text,
    required this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text.toString(),
          style: GoogleFonts.lora(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

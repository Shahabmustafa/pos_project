import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  AppTextField({required this.title,required this.hintText,this.controller,super.key});
  String title;
  TextEditingController? controller;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lora(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 40,
          child: TextFormField(
            controller: controller,
            style: GoogleFonts.lora(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            cursorHeight: 12,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

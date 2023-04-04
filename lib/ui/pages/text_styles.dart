import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obsecureText;

  const TextFormWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText ?? false,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade300,
        hintText: hintText,
        hintStyle: GoogleFonts.quicksand(),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

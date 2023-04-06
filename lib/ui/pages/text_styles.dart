import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obsecureText;
  final int? maxlines;

  const TextFormWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obsecureText,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines ?? 1,
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

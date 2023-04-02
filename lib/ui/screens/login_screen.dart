import 'package:flutter/material.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
          widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Get Started With",
            style:
                GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          TextFormField()
        ],
      )),
    );
  }
}

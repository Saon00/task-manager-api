import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';

import '../pages/enter_button.dart';
import '../pages/scrn_bg.dart';
import '../pages/text_styles.dart';

class PINVerificationScreen extends StatefulWidget {
  const PINVerificationScreen({super.key});

  @override
  State<PINVerificationScreen> createState() => _PINVerificationScreenState();
}

class _PINVerificationScreenState extends State<PINVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
          widget: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text field
              Text(
                "Your Email Address",
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "A 6 digit verification PIN will send to \nyour Email Address",
                style: GoogleFonts.ubuntu(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              TextFormWidget(
                controller: TextEditingController(),
                hintText: 'enter email address',
              ),
              const SizedBox(height: 15),
              EnterButton(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Send Pin"),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_circle_right_outlined)
                    ],
                  ),
                  onTap: () {}),
              const SizedBox(height: 40),
              // don't have any account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?", style: GoogleFonts.quicksand()),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.green,
                          padding: EdgeInsets.zero,
                          textStyle: GoogleFonts.quicksand()),
                      child: const Text("Sign Up")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/ui/auth_screens/login_screen.dart';
import 'package:taskmanager/ui/auth_screens/signup_screen.dart';

import '../pages/enter_button.dart';
import '../pages/scrn_bg.dart';
import '../pages/text_styles.dart';

class ConfirmPasswordScreeen extends StatefulWidget {
  const ConfirmPasswordScreeen({super.key});

  @override
  State<ConfirmPasswordScreeen> createState() => _ConfirmPasswordScreeenState();
}

class _ConfirmPasswordScreeenState extends State<ConfirmPasswordScreeen> {
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
                "Set Password",
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Minimum length password 8 character with\nLetter & Number combination",
                style: GoogleFonts.ubuntu(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              TextFormWidget(
                controller: TextEditingController(),
                hintText: 'password',
              ),
              const SizedBox(height: 15),
              TextFormWidget(
                controller: TextEditingController(),
                hintText: 'confirm password',
              ),
              const SizedBox(height: 15),
              EnterButton(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Confirm"),
                      SizedBox(width: 20),
                      // Icon(Icons.confirmation_num_outlined)
                    ],
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  }),
              const SizedBox(height: 40),

              // have any account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?", style: GoogleFonts.quicksand()),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.green,
                          padding: EdgeInsets.zero,
                          textStyle: GoogleFonts.quicksand()),
                      child: const Text("Sign up")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

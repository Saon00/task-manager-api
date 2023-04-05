import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/ui/pages/enter_button.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/pages/text_styles.dart';
import 'package:taskmanager/ui/auth_screens/otp_screen.dart';
import 'package:taskmanager/ui/auth_screens/signup_screen.dart';

class EmailSettingScreen extends StatefulWidget {
  const EmailSettingScreen({super.key});

  @override
  State<EmailSettingScreen> createState() => _EmailSettingScreenState();
}

class _EmailSettingScreenState extends State<EmailSettingScreen> {
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OTPScreen()));
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

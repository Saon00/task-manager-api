import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';

import '../pages/enter_button.dart';
import '../pages/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        widget: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text field
                  Text(
                    "Join with us",
                    style: GoogleFonts.ubuntu(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  //email name
                  TextFormWidget(
                    controller: TextEditingController(),
                    hintText: 'email',
                  ),
                  const SizedBox(height: 15),
                  //first name
                  TextFormWidget(
                    controller: TextEditingController(),
                    hintText: 'first name',
                  ),
                  const SizedBox(height: 15),
                  //last name
                  TextFormWidget(
                    controller: TextEditingController(),
                    hintText: 'last name',
                  ),
                  const SizedBox(height: 15),
                  //mobile
                  TextFormWidget(
                    controller: TextEditingController(),
                    hintText: 'mobile',
                  ),
                  const SizedBox(height: 15),
                  //password
                  TextFormWidget(
                    controller: TextEditingController(),
                    hintText: 'password',
                  ),
                  const SizedBox(height: 15),

                  // sign up button
                  EnterButton(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Sign Up"),
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
                          child: const Text("Log In")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

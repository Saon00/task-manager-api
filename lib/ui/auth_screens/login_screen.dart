import 'package:flutter/material.dart';
import 'package:taskmanager/data/netwok_utils.dart';
import 'package:taskmanager/data/urls.dart';
import 'package:taskmanager/ui/display_screens/main_bottom_navbar.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/ui/auth_screens/email_set_screen.dart';
import 'package:taskmanager/ui/auth_screens/signup_screen.dart';

import '../pages/enter_button.dart';
import '../pages/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
          widget: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text field
              Text(
                "Welcome Back!!",
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // email field
              TextFormWidget(
                controller: _emailController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "enter valid Email";
                  }
                  return null;
                },
                hintText: 'email',
                obsecureText: false,
              ),
              const SizedBox(height: 15),

              // password field
              TextFormWidget(
                controller: _passwordController,
                validator: (value) {
                  if ((value?.isEmpty ?? true) && ((value?.length ?? 0) < 6)) {
                    return "enter your Password more than 6 digits";
                  }
                  return null;
                },
                hintText: 'password',
                obsecureText: true,
              ),
              const SizedBox(height: 15),

              // login button
              EnterButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    final result =
                        await NetWorkUtils.postMethod(Urls.loginUrl, body: {
                      'email': _emailController.text.trim(),
                      'password': _passwordController.text,
                    });
                    if (result != null && result['status'] == 'success') {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainBottomNavBar()),
                          (route) => false);
                    }
                  }
                },
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Login"),
                    SizedBox(width: 20),
                    Icon(Icons.arrow_circle_right_outlined)
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // forgot button
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmailSettingScreen()));
                  },
                  style: TextButton.styleFrom(
                      // padding: EdgeInsets.zero,
                      foregroundColor: Colors.grey,
                      textStyle: GoogleFonts.quicksand()),
                  child: const Text("Forgot password?")),

              // don't have any account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have any account?",
                      style: GoogleFonts.quicksand()),
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

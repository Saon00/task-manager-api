import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/data/netwok_utils.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/auth_screens/login_screen.dart';

import '../../data/urls.dart';
import '../pages/enter_button.dart';
import '../pages/snackBar_msg.dart';
import '../pages/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        widget: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
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
                      controller: emailController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "enter your Email";
                        }
                        return null;
                      },
                      hintText: 'email',
                    ),
                    const SizedBox(height: 15),
                    //first name
                    TextFormWidget(
                      controller: firstNameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "enter your First Name";
                        }
                        return null;
                      },
                      hintText: 'first name',
                    ),
                    const SizedBox(height: 15),
                    //last name
                    TextFormWidget(
                      controller: lastNameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "enter your Last Name";
                        }
                        return null;
                      },
                      hintText: 'last name',
                    ),
                    const SizedBox(height: 15),
                    //mobile
                    TextFormWidget(
                      controller: mobileController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "enter your Mobile Number";
                        }
                        return null;
                      },
                      hintText: 'mobile',
                    ),
                    const SizedBox(height: 15),
                    //password
                    TextFormWidget(
                      obsecureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if ((value?.isEmpty ?? true) &&
                            ((value?.length ?? 0) < 6)) {
                          return "enter your Password more than 6 digits";
                        }
                        return null;
                      },
                      hintText: 'password',
                    ),
                    const SizedBox(height: 15),

                    // circular progress bar
                    if (_inProgress)
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    else
                      // sign up button
                      EnterButton(
                          widget: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text("Sign Up"),
                              SizedBox(width: 20),
                              Icon(Icons.arrow_circle_right_outlined)
                            ],
                          ),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _inProgress = true;
                              setState(() {
                                
                              });
                              final result = await NetWorkUtils.postMethod(
                                  // 'https://task.teamrabbil.com/api/v1/registration',
                                  Urls.registrationUrl,
                                  body: {
                                    'email': emailController.text.trim(),
                                    'firstName':
                                        firstNameController.text.trim(),
                                    'lastName': lastNameController.text.trim(),
                                    'mobile': mobileController.text.trim(),
                                    'password': passwordController.text,
                                  });
                                  _inProgress = false;
                              setState(() {});
                              // print(result);
                              if (result != null &&
                                  result['status'] == 'success') {
                                emailController.clear();
                                firstNameController.clear();
                                lastNameController.clear();
                                mobileController.clear();
                                passwordController.clear();
                                showSnackBarMessage(
                                    context, "Registration Successful..");
                              } else {
                                showSnackBarMessage(
                                    context, "Registration FAILED!!", true);
                              }
                            }
                          }),

                    const SizedBox(height: 40),

                    // don't have any account?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account?",
                            style: GoogleFonts.quicksand()),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
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
      ),
    );
  }
}

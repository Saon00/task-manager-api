import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/auth_screens/login_screen.dart';

import '../pages/enter_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
                  "PIN Verification",
                  style: GoogleFonts.ubuntu(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "A 6 digit PIN will send to your Email Address",
                  style: GoogleFonts.ubuntu(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                //pin field
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.greenAccent,
                    disabledColor: Colors.white,
                    inactiveColor: Colors.black,
                    selectedColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      // currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),

                const SizedBox(height: 40),

                EnterButton(
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Verify Pin"),
                        SizedBox(width: 20),
                        // Icon(Icons.arrow_circle_right_outlined)
                      ],
                    ),
                    onTap: () {}),

                const SizedBox(height: 40),
                // have any account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?", style: GoogleFonts.quicksand()),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (route) => false);
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                            padding: EdgeInsets.zero,
                            textStyle: GoogleFonts.quicksand()),
                        child: const Text("Sign up")),
                  ],
                )
              ],
            )),
      )),
    );
  }
}

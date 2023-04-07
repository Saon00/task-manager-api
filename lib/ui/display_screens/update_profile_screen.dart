import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/ui/pages/enter_button.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/pages/text_styles.dart';
import 'package:taskmanager/ui/pages/user_profile_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const UserProfileBar(),
        Expanded(
            child: ScreenBG(
          widget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SizedBox(height: 30),
                  Text("Update Profile",
                      style: GoogleFonts.ubuntu(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )),
                          child: const Text("Photo"),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: const Text(""),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormWidget(
                      hintText: 'Email', controller: TextEditingController()),
                  const SizedBox(height: 15),
                  TextFormWidget(
                    hintText: 'First Name',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 15),
                  TextFormWidget(
                    hintText: 'Last Name',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 15),
                  TextFormWidget(
                    hintText: 'Mobile Number',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 15),
                  TextFormWidget(
                    hintText: 'Password',
                    controller: TextEditingController(),
                    obsecureText: true,
                  ),
                  const SizedBox(height: 30),
                  EnterButton(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Update Profile"),
                        ],
                      ),
                      onTap: () {})
                ],
              ),
            ),
          ),
        ))
      ],
    )));
  }
}

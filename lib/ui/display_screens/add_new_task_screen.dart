import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/ui/pages/enter_button.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/pages/text_styles.dart';
import 'package:taskmanager/ui/pages/user_profile_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text("Add New Task",
                    style: GoogleFonts.ubuntu(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                TextFormWidget(
                    hintText: 'Subject', controller: TextEditingController()),
                const SizedBox(height: 15),
                TextFormWidget(
                    hintText: 'Description',
                    controller: TextEditingController(),
                    maxlines: 5),
                const SizedBox(height: 30),
                EnterButton(
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Add task"),
                        SizedBox(width: 20),
                        Icon(Icons.add_box_outlined)
                      ],
                    ),
                    onTap: () {})
              ],
            ),
          ),
        ))
      ],
    )));
  }
}

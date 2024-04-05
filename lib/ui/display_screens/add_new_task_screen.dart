import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/data/auth_utils.dart';
import 'package:taskmanager/data/netwok_utils.dart';
import 'package:taskmanager/data/urls.dart';
import 'package:taskmanager/ui/pages/enter_button.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/pages/snackBar_msg.dart';
import 'package:taskmanager/ui/pages/text_styles.dart';
import 'package:taskmanager/ui/pages/user_profile_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool _inprogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _key,
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
                    hintText: 'Subject',
                    controller: _subjectController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Subject field can't be null";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormWidget(
                      hintText: 'Description',
                      controller: _descriptionController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Description field can't be null";
                        }
                        return null;
                      },
                      maxlines: 5),
                  const SizedBox(height: 30),
                  if (_inprogress)
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    )
                  else
                    EnterButton(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Add task"),
                            SizedBox(width: 20),
                            Icon(Icons.add_box_outlined)
                          ],
                        ),
                        onTap: () async {
                          if (_key.currentState!.validate()) {
                            _inprogress = true;
                            setState(() {});
                            final result = await NetWorkUtils.postMethod(
                                Urls.createTaskUrl,
                                token: AuthUtils.token,
                                body: {
                                  "title": _subjectController.text.trim(),
                                  "description": _descriptionController.text.trim(),
                                  "status": "New",
                                });
                            _inprogress = false;
                            setState(() {});
                            print(result);
                            if (result != null &&
                                result['status'] == 'success') {
                              _subjectController.clear();
                              _descriptionController.clear();
                              showSnackBarMessage(
                                  context, "New Task add SUCCESSFUL");
                            } else {
                              showSnackBarMessage(context,
                                  "New Task add failed! Try Again", true);
                            }
                          }
                        })
                ],
              ),
            ),
          ))
        ],
      ),
    )));
  }
}

import 'package:flutter/material.dart';
import 'package:taskmanager/ui/display_screens/main_bottom_navbar.dart';

void main() => runApp(const TaskManagerApp());

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainBottomNavBar(),
    );
  }
}

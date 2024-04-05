import 'package:flutter/material.dart';
import 'package:taskmanager/ui/auth_screens/splash_screen.dart';

void main() => runApp(  TaskManagerApp());

class TaskManagerApp extends StatefulWidget {
  TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.globalKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

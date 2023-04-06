import 'package:flutter/material.dart';
import 'package:taskmanager/ui/display_screens/cancelled_task_screen.dart';
import 'package:taskmanager/ui/display_screens/completed_task_screen.dart';
import 'package:taskmanager/ui/display_screens/new_task_screen.dart';
import 'package:taskmanager/ui/display_screens/progress_task_screen.dart';

import '../pages/user_profile_bar.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedScreen = 0;

  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black38,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          onTap: (index) {
            _selectedScreen = index;
            setState(() {
              //  _selectedScreen = index;
            });
          },
          elevation: 3,
          currentIndex: _selectedScreen,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task_outlined), label: "New"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done_outline_outlined), label: "Completed"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cancel_outlined), label: "Cancelled"),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Progress"),
          ]),

      // body page
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBar(),
            Expanded(child: _screens[_selectedScreen]),
          ],
        ),
      ),
    );
  }
}

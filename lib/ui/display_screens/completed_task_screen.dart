import 'package:flutter/material.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';

import '../pages/task_card_items.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBG(
      widget: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return // task items
                TaskCardItems(
              subject: '01',
              description: 'lkdja aldj alw dija dlajd lawjd ialj dilajdiwj',
              taskType: 'completed',
              date: '12-04-2023',
              onEditPress: () {},
              onDeletePress: () {}, color: Colors.green,
            );
          }),
    );
  }
}

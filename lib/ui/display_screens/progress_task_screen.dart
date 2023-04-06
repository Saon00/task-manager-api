import 'package:flutter/material.dart';

import '../pages/scrn_bg.dart';
import '../pages/task_card_items.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
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
              taskType: 'in progress',
              date: '12-04-2023',
              onEditPress: () {},
              onDeletePress: () {}, color: Colors.purple,
            );
          }),
    );
  }
}

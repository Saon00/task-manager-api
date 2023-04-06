import 'package:flutter/material.dart';

import '../pages/scrn_bg.dart';
import '../pages/task_card_items.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
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
              taskType: 'cancelled',
              date: '12-04-2023',
              onEditPress: () {},
              onDeletePress: () {}, color: Colors.red,
            );
          }),
    );
  }
}

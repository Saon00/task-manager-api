import 'package:flutter/material.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';

import '../pages/dashboard_item.dart';
import '../pages/task_card_items.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBG(
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(children: const [
            Expanded(child: DashboardItem(numberOfTask: 11, taskType: 'New')),
            Expanded(
                child: DashboardItem(numberOfTask: 11, taskType: 'Completed')),
            Expanded(
                child: DashboardItem(numberOfTask: 11, taskType: 'Cancelled')),
            Expanded(
                child:
                    DashboardItem(numberOfTask: 11, taskType: 'In Progress')),
          ]),

          // task body
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return // task items
                      TaskCardItems(
                    subject: '01',
                    description:
                        'lkdja aldj alw dija dlajd lawjd ialj dilajdiwj',
                    taskType: 'new',
                    date: '12-04-2023',
                    onEditPress: () {},
                    onDeletePress: () {},
                  );
                }),
          )
        ]),
      ),
    );
  }
}

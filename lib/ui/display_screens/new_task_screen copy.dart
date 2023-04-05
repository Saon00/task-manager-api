import 'package:flutter/material.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';

import '../pages/dashboard_item.dart';

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
        ]),
      ),
    );
  }
}

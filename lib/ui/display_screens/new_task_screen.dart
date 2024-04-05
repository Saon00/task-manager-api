import 'package:flutter/material.dart';
import 'package:taskmanager/data/models/task_model.dart';
import 'package:taskmanager/data/netwok_utils.dart';
import 'package:taskmanager/data/urls.dart';
import 'package:taskmanager/ui/pages/scrn_bg.dart';
import 'package:taskmanager/ui/pages/snackBar_msg.dart';

import '../pages/dashboard_item.dart';
import '../pages/task_card_items.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskModel taskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNewTasks();
  }

  Future<void> getAllNewTasks() async {
    inProgress = true;
    setState(() {});

    final response = await NetWorkUtils.getMethod(Urls.newTaskUrl);
    if (response != null) {
      taskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(context, 'Unable to fetch data', true);
    }
    inProgress = false;
    setState(() {});
  }

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
            child: inProgress
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      getAllNewTasks();
                    },
                    child: ListView.builder(
                        itemCount: taskModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return // task items
                              TaskCardItems(
                            subject: taskModel.data?[index].title ?? "Unknown",
                            description:
                                taskModel.data?[index].description ?? "Unknown",
                            taskType: 'new',
                            date:
                                taskModel.data?[index].createdDate ?? "Unknown",
                            onEditPress: () {},
                            onDeletePress: () {},
                            color: Colors.blue,
                          );
                        }),
                  ),
          )
        ]),
      ),
    );
  }
}

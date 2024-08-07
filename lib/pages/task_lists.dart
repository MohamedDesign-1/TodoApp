import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/pages/task_list_item.dart';
import '../providers/firbase_provider.dart';
class TaskLists extends StatefulWidget{
  static const String routeName = 'TaskListPage';

  @override
  State<TaskLists> createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {
  @override
  Widget build(BuildContext context) {
    var firbaseProvider = Provider.of<FireBaseProvider>(context);
    if (firbaseProvider.tasksList.isEmpty) {
    firbaseProvider.getAllTasksFromFireStore();
    }
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => TaskListItem (task: firbaseProvider.tasksList[index], ),
        itemCount: firbaseProvider.tasksList.length,
      ),
    );
  }
}
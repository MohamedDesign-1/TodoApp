import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/pages/edit_task.dart';
import 'package:todoapp/style/app_colors.dart';
import 'package:todoapp/style/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskLists extends StatefulWidget {
  static const String routeName = 'TaskListPage';

  @override
  State<TaskLists> createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(16),
          child: Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (context){},
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: AppLocalizations.of(context)!.delete,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
                ),
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context){
                    Navigator.of(context).pushNamed(EditTask.routeName);
                  },
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: AppLocalizations.of(context)!.edit ,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                ),
              ],
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 5,
                    margin: EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: AppColors.primeryColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Task',
                      style: ThemeApp.lightTheme.textTheme.titleMedium,
                      ),
                      Text(DateFormat.yMMMd().format(DateTime.now()) ,
                        style: ThemeApp.lightTheme.textTheme.titleMedium?.copyWith(
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.primeryColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(Icons.check , color: AppColors.whiteColor,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}

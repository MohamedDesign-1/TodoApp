import 'package:flutter/material.dart';
import 'package:todoapp/style/app_colors.dart';

class TaskLists extends StatelessWidget {
  static const String routeName = 'TaskListPage';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:  EdgeInsets.all(16),
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4)
        ),
        child: const Row(
          children: [

          ],
        ),
    );
  }
}
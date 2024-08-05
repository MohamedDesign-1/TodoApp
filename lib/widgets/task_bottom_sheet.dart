import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_model.dart';
import '../providers/select_theme.dart';
import '../style/app_colors.dart';
import '../style/theme_app.dart';
import 'custom_btn.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var selectDate = DateTime.now();
  var formkey = GlobalKey<FormState>();
  CollectionReference TasksList = FirebaseFirestore.instance.collection('Tasks List');
  final TextEditingController taskNameController = TextEditingController();
  TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<SelectTheme>(context);
    return themeProvider.isDarkMode() ?
    Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.cardDarkColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.add_new_task,
              style: ThemeApp.darkTheme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 3,
              color: AppColors.whiteColor,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context)!.task_name,
              style: ThemeApp.darkTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Form(
              key: formkey,
              child: TextFormField(
                controller: taskNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.error_massage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: AppColors.primeryColor),
                  ),
                  hintText: AppLocalizations.of(context)!.hint_enter_your_task,
                  hintStyle: ThemeApp.darkTheme.textTheme.titleMedium,
                  enabled: true,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: AppColors.redColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context)!.select_date,
              style: ThemeApp.darkTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                showCalendar();
              },
              child: Text(
                '${selectDate.day}/${selectDate.month}/${selectDate.year}',
                style: ThemeApp.darkTheme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            CustomBtn(
              titleBtn: AppLocalizations.of(context)!.add_task,
              onTap: () {
                addTask();
              },
            ),
          ],
        ),
      ),
    )
        :
    Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.add_new_task,
              style: ThemeApp.lightTheme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 3,
              color: AppColors.blackColor,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context)!.task_name,
              style: ThemeApp.lightTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Form(
              key: formkey,
              child: TextFormField(
                controller: taskNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.error_massage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: AppColors.primeryColor),
                  ),
                  hintText: AppLocalizations.of(context)!.hint_enter_your_task,
                  enabled: true,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: AppColors.redColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context)!.select_date,
              style: ThemeApp.lightTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                showCalendar();
              },
              child: Text(
                '${selectDate.day}/${selectDate.month}/${selectDate.year}',
                style: ThemeApp.lightTheme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            CustomBtn(
              titleBtn: AppLocalizations.of(context)!.add_task,
              onTap: () {
                addTask();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    setState(() {
      if (chosenDate != null) {
        selectDate = chosenDate;
      }
    });
  }

  addTask() {
    if (formkey.currentState!.validate()) {
      var taskName = taskNameController.text;
      return TasksList.add({
        'Task Name' : taskName,
        'Date': selectDate,
        'id' : FirebaseAuth.instance.currentUser!.uid
      })
          .then((value) => print("Task Added"))
          .catchError((error) => print("Failed to add Task: $error"));
    }
      Navigator.pop(context);
    }
  }


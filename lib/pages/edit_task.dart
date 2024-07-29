import 'package:flutter/material.dart';
import 'package:todoapp/style/app_colors.dart';
import 'package:todoapp/widgets/custom_btn.dart';

import '../style/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTask extends StatefulWidget {
  static const String routeName = 'EditTaskPage';

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final formkey = GlobalKey<FormState>();
  var selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.lightTheme.scaffoldBackgroundColor ,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back , color: AppColors.whiteColor,),
        ),
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: ThemeApp.lightTheme.textTheme.titleLarge,
        ),
        backgroundColor: ThemeApp.lightTheme.appBarTheme.backgroundColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              AppLocalizations.of(context)!.edit_task,
              style: ThemeApp.lightTheme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 2,
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
              height: 16,
            ),
            Form(
            key: formkey,
            child: Column (
              children: [
                TextFormField(
                  validator: (value){
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
                  )
                ],
              )
            ),
            const SizedBox(
              height: 16,
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
              child : Text('${selectDate.day}/${selectDate.month}/${selectDate.year}',
                style: ThemeApp.lightTheme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomBtn(
            titleBtn: AppLocalizations.of(context)!.save_changes_btn,
            onTap: (){
            saveChanges();
            }
            )
          ]
        )
      )
    );

  }
  void showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    setState(
          () {
        selectDate = chosenDate!;
      },
    );
  }

  void saveChanges() {
    if (formkey.currentState!.validate()) {
      /// Save Changes
      Navigator.of(context).pop();
    }
    return;
  }

}


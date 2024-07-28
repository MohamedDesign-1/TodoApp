import 'package:flutter/material.dart';

import '../style/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTask extends StatelessWidget {
  static const String routeName = 'EditTaskPage';
  const EditTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.lightTheme.scaffoldBackgroundColor ,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: ThemeApp.lightTheme.textTheme.titleLarge,
        ),
        backgroundColor: ThemeApp.lightTheme.appBarTheme.backgroundColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
      ),
    );
  }
}

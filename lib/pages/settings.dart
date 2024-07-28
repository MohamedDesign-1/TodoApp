import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/style/app_colors.dart';
import 'package:todoapp/style/theme_app.dart';
import 'package:todoapp/widgets/drop_items_language.dart';
import '../providers/select_theme.dart';


class Settings extends StatelessWidget {
  static const String routeName = 'settings';
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language , style: ThemeApp.lightTheme.textTheme.bodyLarge,),
          const SizedBox(height: 8,),
          const DropItemsMenuLanguage(),
          const SizedBox(height: 8,),
          Text(AppLocalizations.of(context)!.mode , style: ThemeApp.lightTheme.textTheme.bodyLarge,),
          const SizedBox(height: 8,),
          DropdownButtonFormField(
            value: Provider.of<SelectTheme>(context).isDarkMode() ? 'dark' : 'light',
            onChanged: (value) {
              Provider.of<SelectTheme>(context, listen: false).appTheme = value == 'dark' ? ThemeMode.dark : ThemeMode.light;
            },
            items: [
              DropdownMenuItem(
                value: 'light',
                child: Text(AppLocalizations.of(context)!.light , style: ThemeApp.lightTheme.textTheme.titleMedium,),
              ),
              DropdownMenuItem(
                value: 'dark',
                child: Text(AppLocalizations.of(context)!.dark , style: ThemeApp.lightTheme.textTheme.titleMedium,),
              ),
            ],
            hint: Text('Select Theme', style: ThemeApp.lightTheme.textTheme.titleMedium,),
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              fillColor: AppColors.whiteColor,
              filled: true,
              enabled: false,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/select_language.dart';
import '../style/app_colors.dart';
import '../style/theme_app.dart';

class DropItemsMenuLanguage extends StatelessWidget {
  const DropItemsMenuLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: (value) {
        Provider.of<SelectLanguage>(context, listen: false).changeLanguage(value!);
      },
      items: [
        DropdownMenuItem(
          value: 'en',
          child: Text(AppLocalizations.of(context)!.english , style: ThemeApp.lightTheme.textTheme.titleMedium,),
        ),
        DropdownMenuItem(
          value: 'ar',
          child: Text(AppLocalizations.of(context)!.arabic , style: ThemeApp.lightTheme.textTheme.titleMedium,),
        ),
      ],
      hint: Text('Select Language', style: ThemeApp.lightTheme.textTheme.titleMedium,),
      isExpanded: true,
      value: Provider.of<SelectLanguage>(context).appLanguage,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        fillColor: AppColors.whiteColor,
        filled: true,
        enabled: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/pages/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoapp/pages/settings.dart';
import 'package:todoapp/pages/task_lists.dart';
import 'package:todoapp/providers/bottom_nav_select.dart';
import 'package:todoapp/providers/select_language.dart';
import 'package:todoapp/providers/select_theme.dart';

void main() {
  runApp (MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectLanguage()),
        ChangeNotifierProvider(create: (context) => BottomNavSelect()),
        ChangeNotifierProvider(create: (context) => SelectTheme()),
      ],
      child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SelectLanguage>(context);
    var providerTheme = Provider.of<SelectTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      themeMode: providerTheme.appTheme == 'dark' ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

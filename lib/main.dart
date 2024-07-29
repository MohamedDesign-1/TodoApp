import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/pages/edit_task.dart';
import 'package:todoapp/pages/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoapp/providers/bottom_nav_select.dart';
import 'package:todoapp/providers/select_language.dart';
import 'package:todoapp/providers/select_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        EditTask.routeName: (context) => EditTask(),
      },
      themeMode: providerTheme.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

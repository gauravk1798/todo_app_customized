import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/home/splash_page.dart';

import 'i10n/localization_intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo App",
      home: getHomePage(true),
    );
  }

  Widget getHomePage(bool enableSplashAnimation) {
    if (enableSplashAnimation) return new SplashPage();
    return Container();
  }
}
